Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 271053DE3E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Aug 2021 03:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233516AbhHCBQc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Aug 2021 21:16:32 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61718 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232891AbhHCBQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Aug 2021 21:16:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627953381; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=wyovEPz1+nTi4zonS19BB0NcGRArsVJd0stsBjW4T9s=;
 b=D/bgvDnPwseTbbgT5XYk3s+/GAOtpqC2VGqlLnIEtq/v+aLzgZsjnNfbBqX3LT/1fZ4jCc6G
 UYIs+uXwxcnJZOxBsaTmR/AW0i8IJihkZG8GCbXbv3CCG7xIusDG/r7hhMnwCxvq3zn+GAM0
 AqmsanBWPtmpeSA8S3nsE1W0S5k=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 610898d596a66e66b29001ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 01:16:05
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D93B7C43460; Tue,  3 Aug 2021 01:16:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE2BFC433D3;
        Tue,  3 Aug 2021 01:16:03 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 Aug 2021 18:16:03 -0700
From:   abhinavk@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno@lists.freedesktop.org,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 10/11] drm/msm/dsi: Add support for DSC
 configuration
In-Reply-To: <20210715065203.709914-11-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-11-vkoul@kernel.org>
Message-ID: <f29a42d72e9e5cdc767f33b13492eac9@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-07-14 23:52, Vinod Koul wrote:
> When DSC is enabled, we need to configure DSI registers accordingly and
> configure the respective stream compression registers.
> 
> Add support to calculate the register setting based on DSC params and
> timing information and configure these registers.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

same comments as dmitry on this one: 
https://patchwork.freedesktop.org/patch/444082/?series=90413&rev=2
nothing more to add.

> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 ++
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 142 +++++++++++++++++++++++++++--
>  2 files changed, 142 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 50eb4d1b8fdd..b8e9e608abfc 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -2310,4 +2310,14 @@ static inline uint32_t
> REG_DSI_7nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x00000
> 
>  #define REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE			0x00000260
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
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c
> b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e1e5d91809b5..4e8ab1b1df8b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -942,6 +942,26 @@ static void dsi_ctrl_config(struct msm_dsi_host
> *msm_host, bool enable,
>  	dsi_write(msm_host, REG_DSI_CTRL, data);
>  }
> 
> +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
> +				  int pic_width, int pic_height)
> +{
> +	if (!dsc || !pic_width || !pic_height) {
> +		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n",
> pic_width, pic_height);
> +		return -EINVAL;
> +	}
> +
> +	if ((pic_width % dsc->drm->slice_width) || (pic_height %
> dsc->drm->slice_height)) {
> +		pr_err("DSI: pic_dim %dx%d has to be multiple of slice %dx%d\n",
> +		       pic_width, pic_height, dsc->drm->slice_width, 
> dsc->drm->slice_height);
> +		return -EINVAL;
> +	}
> +
> +	dsc->drm->pic_width = pic_width;
> +	dsc->drm->pic_height = pic_height;
> +
> +	return 0;
> +}
> +
>  static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool 
> is_dual_dsi)
>  {
>  	struct drm_display_mode *mode = msm_host->mode;
> @@ -956,6 +976,7 @@ static void dsi_timing_setup(struct msm_dsi_host
> *msm_host, bool is_dual_dsi)
>  	u32 va_end = va_start + mode->vdisplay;
>  	u32 hdisplay = mode->hdisplay;
>  	u32 wc;
> +	u32 data;
> 
>  	DBG("");
> 
> @@ -974,7 +995,73 @@ static void dsi_timing_setup(struct msm_dsi_host
> *msm_host, bool is_dual_dsi)
>  		hdisplay /= 2;
>  	}
> 
> +	if (msm_host->dsc) {
> +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> +
> +		/* update dsc params with timing params */
> +		dsi_dsc_update_pic_dim(dsc, mode->hdisplay, mode->vdisplay);
> +		DBG("Mode Width- %d x Height %d\n", dsc->drm->pic_width,
> dsc->drm->pic_height);
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
> +			u32 reg, intf_width, slice_per_intf, width;
> +			u32 total_bytes_per_intf;
> +
> +			/* first calculate dsc parameters and then program
> +			 * compress mode registers
> +			 */
> +			intf_width = hdisplay;
> +			slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
> +
> +			/* If slice_count > slice_per_intf, then use 1
> +			 * This can happen during partial update
> +			 */
> +				dsc->drm->slice_count = 1;
> +
> +			dsc->bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * 8, 8);
> +			total_bytes_per_intf = dsc->bytes_in_slice * slice_per_intf;
> +
> +			dsc->eol_byte_num = total_bytes_per_intf % 3;
> +			dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> +			dsc->bytes_per_pkt = dsc->bytes_in_slice * dsc->drm->slice_count;
> +			dsc->pkt_per_line = slice_per_intf / dsc->drm->slice_count;
> +
> +			width = dsc->pclk_per_line;
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
> @@ -993,19 +1080,50 @@ static void dsi_timing_setup(struct
> msm_dsi_host *msm_host, bool is_dual_dsi)
>  			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>  			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>  	} else {		/* command mode */
> +		if (msm_host->dsc) {
> +			struct msm_display_dsc_config *dsc = msm_host->dsc;
> +			u32 reg, reg_ctrl, reg_ctrl2;
> +			u32 slice_per_intf, bytes_in_slice, total_bytes_per_intf;
> +
> +			reg_ctrl = dsi_read(msm_host, 
> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> +			reg_ctrl2 = dsi_read(msm_host, 
> REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
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
> +			dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, 
> reg_ctrl2);
> +		}
> +
>  		/* image data and 1 byte write_memory_start cmd */
> -		wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
> +		if (!msm_host->dsc)
> +			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
> +		else
> +			wc = mode->hdisplay / 2 + 1;
> 
> -		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
> -			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> -			DSI_CMD_MDP_STREAM0_CTRL_VIRTUAL_CHANNEL(
> -					msm_host->channel) |
> -			DSI_CMD_MDP_STREAM0_CTRL_DATA_TYPE(
> -					MIPI_DSI_DCS_LONG_WRITE));
> +		data = DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> +		       DSI_CMD_MDP_STREAM0_CTRL_VIRTUAL_CHANNEL(msm_host->channel) |
> +			DSI_CMD_MDP_STREAM0_CTRL_DATA_TYPE(MIPI_DSI_DCS_LONG_WRITE);
> 
> -		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
> -			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
> -			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
> +		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL, data);
> +
> +		data = DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
> +			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay);
> +		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL, data);
>  	}
>  }
> 
> @@ -2074,6 +2192,7 @@ int msm_dsi_host_modeset_init(struct 
> mipi_dsi_host *host,
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>  	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>  	struct platform_device *pdev = msm_host->pdev;
> +	struct msm_drm_private *priv;
>  	int ret;
> 
>  	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> @@ -2093,6 +2212,9 @@ int msm_dsi_host_modeset_init(struct 
> mipi_dsi_host *host,
>  	}
> 
>  	msm_host->dev = dev;
> +	priv = dev->dev_private;
> +	priv->dsc = msm_host->dsc;
> +
>  	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>  	if (ret) {
>  		pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
