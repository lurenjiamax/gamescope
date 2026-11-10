#pragma once

#include "../color_helpers.h"

#include <cstdint>

namespace gamescope
{
    // Without DRM hardware color management, direct scanout is only safe for
    // one PQ layer targeting a PQ output. In particular, a Gamma 2.2 HDR panel
    // needs the Vulkan color pipeline to map even a single PQ layer into the
    // panel's native encoding.
    constexpr bool DrmHdrOutputRequiresVulkanComposition(
        bool bOutputHDREnabled,
        bool bSupportsHardwareColorManagement,
        EOTF eOutputEncodingEOTF,
        uint32_t uLayerCount,
        bool bBaseLayerIsHDR10PQ )
    {
        if ( !bOutputHDREnabled || bSupportsHardwareColorManagement )
            return false;

        return eOutputEncodingEOTF != EOTF_PQ ||
            uLayerCount != 1 ||
            !bBaseLayerIsHDR10PQ;
    }
}
