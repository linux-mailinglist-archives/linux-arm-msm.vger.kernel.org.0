Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7C394B9BFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 10:27:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238656AbiBQJ1c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Feb 2022 04:27:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238647AbiBQJ1b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Feb 2022 04:27:31 -0500
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32BB91A0C0A;
        Thu, 17 Feb 2022 01:27:16 -0800 (PST)
Received: from SoMainline.org (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 8E4B13F758;
        Thu, 17 Feb 2022 10:27:09 +0100 (CET)
Date:   Thu, 17 Feb 2022 10:27:07 +0100
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [REPOST PATCH v4 13/13] drm/msm/dsi: Add support for DSC
 configuration
Message-ID: <20220217092707.2bfzga74xyicl4kb@SoMainline.org>
References: <20220210103423.271016-1-vkoul@kernel.org>
 <20220210103423.271016-14-vkoul@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210103423.271016-14-vkoul@kernel.org>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Vinod,

On 2022-02-10 16:04:23, Vinod Koul wrote:
> When DSC is enabled, we need to configure DSI registers accordingly and
> configure the respective stream compression registers.
> 
> Add support to calculate the register setting based on DSC params and
> timing information and configure these registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

I supplied a rather extensive - yet merely scratching the surface -
review of this patch in:

    https://lore.kernel.org/linux-arm-msm/20211211000315.pavmcc7cc73ilb6l@SoMainline.org/

It seems none of those points have been addressed, bar creating a mesa
MR to update dsi.xml with a subpar description of the registers (offsets
only).

For every point that is intentionally ignored, please at least supply a
justification of why you think this is the right thing to do.

Thanks,
- Marijn

> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 +++
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 109 ++++++++++++++++++++++++++++-
>  2 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 49b551ad1bff..c1c85df58c4b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -706,4 +706,14 @@ static inline uint32_t DSI_VERSION_MAJOR(uint32_t val)
>  #define REG_DSI_CPHY_MODE_CTRL					0x000002d4
>  
>  
> +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL			0x0000029c
> +
> +#define REG_DSI_VIDEO_COMPRESSION_MODE_CTRL2			0x000002a0
> +
> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL			0x000002a4
> +
> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2			0x000002a8
> +
> +#define REG_DSI_COMMAND_COMPRESSION_MODE_CTRL3			0x000002ac
> +
>  #endif /* DSI_XML */
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 438c80750682..3d8d5a1daaa3 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -908,6 +908,20 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>  		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
>  }
>  
> +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
> +				  int pic_width, int pic_height)
> +{
> +	if (!dsc || !pic_width || !pic_height) {
> +		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", pic_width, pic_height);
> +		return -EINVAL;
> +	}
> +
> +	dsc->drm->pic_width = pic_width;
> +	dsc->drm->pic_height = pic_height;
> +
> +	return 0;
> +}
> +
>  static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  {
>  	struct drm_display_mode *mode = msm_host->mode;
> @@ -940,7 +954,68 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  		hdisplay /= 2;
>  	}
>  
> +	if (msm_host->dsc) {
> +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> +
> +		/* update dsc params with timing params */
> +		dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
> +		DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width, dsc->drm->pic_height);
> +
> +		/* we do the calculations for dsc parameters here so that
> +		 * panel can use these parameters
> +		 */
> +		dsi_populate_dsc_params(dsc);
> +
> +		/* Divide the display by 3 but keep back/font porch and
> +		 * pulse width same
> +		 */
> +		h_total -= hdisplay;
> +		hdisplay /= 3;
> +		h_total += hdisplay;
> +		ha_end = ha_start + hdisplay;
> +	}
> +
>  	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> +		if (msm_host->dsc) {
> +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> +			u32 reg, intf_width, slice_per_intf;
> +			u32 total_bytes_per_intf;
> +
> +			/* first calculate dsc parameters and then program
> +			 * compress mode registers
> +			 */
> +			intf_width = hdisplay;
> +			slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
> +
> +			dsc->drm->slice_count = 1;
> +			dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * 8, 8);
> +			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
> +
> +			dsc->eol_byte_num = total_bytes_per_intf % 3;
> +			dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> +			dsc->bytes_per_pkt = dsc->bytes_in_slice * dsc->drm->slice_count;
> +			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
> +
> +			reg = dsc->bytes_per_pkt << 16;
> +			reg |= (0x0b << 8);    /* dtype of compressed image */
> +
> +			/* pkt_per_line:
> +			 * 0 == 1 pkt
> +			 * 1 == 2 pkt
> +			 * 2 == 4 pkt
> +			 * 3 pkt is not supported
> +			 * above translates to ffs() - 1
> +			 */
> +			reg |= (ffs(dsc->pkt_per_line) - 1) << 6;
> +
> +			dsc->eol_byte_num = total_bytes_per_intf % 3;
> +			reg |= dsc->eol_byte_num << 4;
> +			reg |= 1;
> +
> +			dsi_write(msm_host,
> +				  REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
> +		}
> +
>  		dsi_write(msm_host, REG_DSI_ACTIVE_H,
>  			DSI_ACTIVE_H_START(ha_start) |
>  			DSI_ACTIVE_H_END(ha_end));
> @@ -959,8 +1034,40 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>  			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>  	} else {		/* command mode */
> +		if (msm_host->dsc) {
> +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> +			u32 reg, reg_ctrl, reg_ctrl2;
> +			u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
> +
> +			reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> +			reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
> +
> +			slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
> +			bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
> +						      dsc->drm->bits_per_pixel, 8);
> +			dsc->drm->slice_chunk_size = bytes_in_slice;
> +			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
> +			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
> +
> +			reg = 0x39 << 8;
> +			reg |= ffs(dsc->pkt_per_line) << 6;
> +
> +			dsc->eol_byte_num = total_bytes_per_intf % 3;
> +			reg |= dsc->eol_byte_num << 4;
> +			reg |= 1;
> +
> +			reg_ctrl |= reg;
> +			reg_ctrl2 |= bytes_in_slice;
> +
> +			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);
> +			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
> +		}
> +
>  		/* image data and 1 byte write_memory_start cmd */
> -		wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
> +		if (!msm_host->dsc)
> +			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
> +		else
> +			wc = mode->hdisplay / 2 + 1;
>  
>  		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>  			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> -- 
> 2.31.1
> 
