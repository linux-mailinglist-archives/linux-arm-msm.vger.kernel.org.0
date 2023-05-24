Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36C2270FE3F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 May 2023 21:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjEXTJw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 May 2023 15:09:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjEXTJv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 May 2023 15:09:51 -0400
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D667D12F
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 May 2023 12:09:48 -0700 (PDT)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 9346C205F7;
        Wed, 24 May 2023 21:09:46 +0200 (CEST)
Date:   Wed, 24 May 2023 21:09:45 +0200
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v14 0/9] Introduce MSM-specific DSC helpers
Message-ID: <63522ihioqgl5eepftyrtxjw4gnq7vr2w6leqzuhpiimgeosw3@2q4hajy2fgau>
References: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230329-rfc-msm-dsc-helper-v14-0-bafc7be95691@quicinc.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2023-05-24 10:45:13, Jessica Zhang wrote:
> There are some overlap in calculations for MSM-specific DSC variables
> between DP and DSI. In addition, the calculations for initial_scale_value
> and det_thresh_flatness that are defined within the DSC 1.2 specifications,
> but aren't yet included in drm_dsc_helper.c.
> 
> This series moves these calculations to a shared msm_dsc_helper.c file and
> defines drm_dsc_helper methods for initial_scale_value and
> det_thresh_flatness.
> 
> Note: For now, the MSM specific helper methods are only called for the DSI
> path, but will called for DP once DSC 1.2 support for DP has been added.
> 
> Depends on: "drm/i915: move DSC RC tables to drm_dsc_helper.c" [1]
> 
> [1] https://patchwork.freedesktop.org/series/114472/
> 
> ---
> Changes in v14:
> - Added kernel docs and made DRM DSC helper functions (Jani)

They were already helper functions: I think you meant to write that you
have moved from from inlined header functions to exported symbols in the
.c file?

- Marijn

> - Link to v13: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v13-0-d7581e7becec@quicinc.com
> 
> Changes in v13:
> - Reworded comment doc for msm_dsc_get_slices_per_intf()
> - Changed intf_width to u32
> - msm_dsc_calculate_slices_per_intf -> msm_dsc_get_slices_per_intf
> - Link to v12: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v12-0-9cdb7401f614@quicinc.com
> 
> Changes in v12:
> - Reworded summary comment for msm_dsc_helper.h
> - msm_dsc_get_slices_per_intf -> msm_dsc_calculate_slices_per_intf
> - Corrected total_bytes_per_intf math in dsc_update_dsc_timing
> - Rebased on top of latest version of "drm/i915: move DSC RC tables to drm_dsc_helper.c"
> - Link to v11: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v11-0-30270e1eeac3@quicinc.com
> 
> Changes in v11:
> - Fixed mismatched return types
> - Moved MSM DSC helpers summary comment to under copyright
> - Moved msm_dsc_get_bpp_int() to drm_dsc_helper.h
> - Reworded MSM DSC helper comment docs for clarity
> - Added const keyword where applicable
> - Renamed msm_dsc_get_slice_per_intf to msm_dsc_get_slices_per_intf
> - Removed msm_dsc_get_slice_per_intf()
> - Reworded commit message for "drm/msm/dsi: update hdisplay calculation
>   for dsi_timing_setup"
> - Link to v10: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v10-0-4cb21168c227@quicinc.com
> 
> Changes in v10:
> - Removed msm_dsc_get_bytes_per_slice helper
> - Inlined msm_dsc_get_bytes_per_intf
> - Refactored drm_dsc_set_initial_scale_value() to be a pure function
> - Renamed DRM DSC initial_scale and flatness_det_thresh helpers
> - Removed msm_dsc_helpers.o from Makefile
> - Link to v9: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v9-0-87daeaec2c0a@quicinc.com
> 
> Changes in v9:
> - Fixed incorrect math for msm_dsc_get_bytes_per_line()
> - Link to v8: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v8-0-2c9b2bb1209c@quicinc.com
> 
> Changes in v8:
> - *_bytes_per_soft_slice --> *_bytes_per_slice
> - Fixed comment doc formatting for MSM DSC helpers
> - Use slice_chunk_size in msm_dsc_get_bytes_per_line calculation
> - Reworded "drm/msm/dpu: Use DRM DSC helper for det_thresh_flatness"
>   commit title for clarity
> - Picked up "Reviewed-by" tags
> - Added duplicate Signed-off-by tag to "drm/display/dsc: Add flatness
>   and initial scale value calculations" to reflect patch history
> - Link to v7: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v7-0-df48a2c54421@quicinc.com
> 
> Changes in v7:
> - Renamed msm_dsc_get_pclk_per_intf to msm_dsc_get_bytes_per_line
> - Removed duplicate msm_dsc_get_dce_bytes_per_line
> - Reworded commit message for "drm/msm/dpu: Use DRM DSC helper for
>   det_thresh_flatness"
> - Dropped slice_per_pkt change (it will be included in the later
>   "Add DSC v1.2 Support for DSI" series)
> - Picked up "drm/display/dsc: Add flatness and initial scale value
>   calculations" and "drm/display/dsc: add helper to set semi-const
>   parameters", which were dropped from "drm/i915: move DSC RC tables to
>   drm_dsc_helper.c" series
> - Picked up "Reviewed-by" tags
> - Removed changelog in individual patches
> - Link to v6: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v6-0-cb7f59f0f7fb@quicinc.com
> 
> Changes in v6:
> - Documented return values for MSM DSC helpers
> - Fixed dependency issue in msm_dsc_helper.c
> - Link to v5: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v5-0-0108401d7886@quicinc.com
> 
> Changes in v5:
> - Added extra line at end of msm_dsc_helper.h
> - Simplified msm_dsc_get_bytes_per_soft_slice() math
> - Simplified and inlined msm_dsc_get_pclk_per_intf() math
> - "Fix calculations pkt_per_line" --> "... Fix calculation for pkt_per_line"
> - Split dsc->slice_width check into a separate patch
> - Picked up Dmitry's msm/dsi patch ("drm/msm/dsi: use new helpers for
>   DSC setup")
> - Removed unused headers in MSM DSC helper files
> - Picked up Reviewed-by tags
> - Link to v4: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v4-0-1b79c78b30d7@quicinc.com
> 
> Changes in v4:
> - Changed msm_dsc_get_uncompressed_pclk_per_intf to msm_dsc_get_pclk_per_intf
> - Moved pclk_per_intf calculation for dsi_timing_setup to `if
>   (msm_host->dsc)` block
> - Link to v3: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v3-0-6bec0d277a83@quicinc.com
> 
> Changes in v3:
> - Dropped src_bpp parameter from all methods -- src_bpp can be
>   calculated as dsc->bits_per_component * 3- Cleaned up unused parameters
> - Dropped intf_width parameter from get_bytes_per_soft_slice()
> - Moved dsc->bits_per_component to numerator calculation in
>   get_bytes_per_soft_slice()
> - Made get_bytes_per_soft_slice() a public method (this will be called
>   later to help calculate DP pclk params)- Added comment documentation to
>   MSM DSC helpers
> - Renamed msm_dsc_get_uncompressed_pclk_per_line to
>   *_get_uncompressed_pclk_per_intf()
> - Removed dsc->slice_width check from msm_dsc_get_uncompressed_pclk_per_intf()
> - Added documentation in comments
> - Moved extra_eol_bytes math out of msm_dsc_get_eol_byte_num()
> - Renamed msm_dsc_get_eol_byte_num to *_get_bytes_per_intf.
> - Reworded slice_last_group_size calculation to `(dsc->slice_width + 2) % 3`
> - Used MSM DSC helper to calculate total_bytes_per_intf
> - Initialized hdisplay as uncompressed pclk per line at the beginning of
>   dsi_timing_setup as to not break dual DSI calculations
> - Added slice_width check to dsi_timing_setup
> - Dropped 78c8b81d57d8 ("drm/display/dsc: Add flatness and initial scale
>   value calculations") patch as it was absorbed in Dmitry's DSC series [1]
> - Split dsi_timing_setup() hdisplay calculation to a separate patch
> - Link to v2: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v2-0-3c13ced536b2@quicinc.com
> 
> Changes in v2:
> - Changed det_thresh_flatness to flatness_det_thresh
> - Set initial_scale_value directly in helper
> - Moved msm_dsc_helper files to msm/ directory
> - Dropped get_comp_ratio() helper
> - Used drm_int2fixp() to convert to integers to fp
> - Fixed type mismatch issues in MSM DSC helpers
> - Changed DSC_BPP macro to drm_dsc_get_bpp_int() helper method
> - Style changes to improve readability
> - Dropped last division step of msm_dsc_get_pclk_per_line() and changed
>   method name accordingly
> - Dropped unused bpp variable in msm_dsc_get_dce_bytes_per_line()
> - Changed msm_dsc_get_slice_per_intf() to a static inline method
> - Split eol_byte_num and pkt_per_line calculation into a separate patch
> - Moved pclk_per_line calculation into `if (dsc)` block in
>   dsi_timing_setup()
> - *_calculate_initial_scale_value --> *_set_initial_scale_value
> - Picked up Fixes tags for patches 3/5 and 4/5
> - Picked up Reviewed-by for patch 4/5
> - Link to v1: https://lore.kernel.org/r/20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com
> 
> ---
> Dmitry Baryshkov (2):
>       drm/display/dsc: add helper to set semi-const parameters
>       drm/msm/dsi: use DRM DSC helpers for DSC setup
> 
> Jessica Zhang (7):
>       drm/display/dsc: Add flatness and initial scale value calculations
>       drm/display/dsc: Add drm_dsc_get_bpp_int helper
>       drm/msm: Add MSM-specific DSC helper methods
>       drm/msm/dpu: Use fixed DRM DSC helper for det_thresh_flatness
>       drm/msm/dpu: Fix slice_last_group_size calculation
>       drm/msm/dsi: Use MSM and DRM DSC helper methods
>       drm/msm/dsi: update hdisplay calculation for dsi_timing_setup
> 
>  drivers/gpu/drm/display/drm_dsc_helper.c   | 59 ++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c |  9 ++--
>  drivers/gpu/drm/msm/dsi/dsi_host.c         | 68 ++++++------------------------
>  drivers/gpu/drm/msm/msm_dsc_helper.h       | 38 +++++++++++++++++
>  include/drm/display/drm_dsc_helper.h       |  4 ++
>  5 files changed, 119 insertions(+), 59 deletions(-)
> ---
> base-commit: c0c7f04818136b3204589da42b4532b5aa3d4971
> change-id: 20230329-rfc-msm-dsc-helper-981a95edfbd0
> 
> Best regards,
> -- 
> Jessica Zhang <quic_jesszhan@quicinc.com>
> 
