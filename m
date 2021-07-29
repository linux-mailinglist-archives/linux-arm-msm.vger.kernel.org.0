Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E94C3DAEB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 00:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbhG2WLD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 18:11:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234158AbhG2WLC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 18:11:02 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2858FC0613C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 15:10:57 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id z2so13797024lft.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jul 2021 15:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2AC+8P/Gj44yNzGHdK2IH+CNsTTpG3h1yZ9H93ggsmA=;
        b=jY2aLXNc5CGC5wU3rPGA4BVzoK0ziPzyhDPi4NWJ6GSsjEHGgB+uNbzhg2c5k0RQER
         UyGhTIHTjB+y9dA892z2TX9gFRiW2z9D9bQUhfST0XN4o2VIKq50MgYbeo4GvBuwjdLx
         uLW0dt1scJvt9o4l9zqm1Bm5tjKwp5Du342f7GGny9Hb+lMwQlEq9lyMD9LEQECShkoK
         QYZxdfnTdmyNQ6I0aMaqaXyqjYp141pMc7juAIHiil0n37Dji7xlBEp9ubsfhiugvRyr
         Sf725vXLEjJA4HzDyxmHpcwmPhbnex5WO4w+omx+jRfJ3y/cjotjnPlCfUYBXCKJHvxe
         IMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2AC+8P/Gj44yNzGHdK2IH+CNsTTpG3h1yZ9H93ggsmA=;
        b=s5v4U0WatQQygZuISoIfmxPWuFKrnEL1GsZvEKn9b2tU4Wtvq0da7RfIxVEv3c1OuD
         1Es7scpWC26xibnrypdWhInvsm5fY4qbmUVAveyliFeRU0OVbk5okU2y9UvGq9cX0sfc
         qC+Tiu/wQoU3uRh0RVeNeig60Qpgo5p3O4c+pYUkVcPSl6w7EXfG/QBynopI+GMD74I8
         Z4cqxWZMAr4w+FGkZkV1Ah9nzb7eFvoDBVglEYQT3JFHCOwOoHfaefp59CpWOX/czRg0
         2FuOuvDWzPGjZbWVLj34ejTXO2pVZ2iZdJR+Grg+ltlYkNgXdfDIcA1LS8d76KJ+nWyP
         Ascg==
X-Gm-Message-State: AOAM530ysVCVp0pXtKkbMprAek8HGQgKk9d4+VWwhJBTYZP5gCGOKF2X
        UqsA3zZLi5Fufb0laMsAEOHjkA==
X-Google-Smtp-Source: ABdhPJwchuXnMGjhKcf682o3JdYzdxJtBhS9YQxqpRCA08LyKUo3SCjfOcM3KrDEMR6A9FTaNKXpcQ==
X-Received: by 2002:a05:6512:34d1:: with SMTP id w17mr5444027lfr.439.1627596655399;
        Thu, 29 Jul 2021 15:10:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r200sm409316lff.208.2021.07.29.15.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jul 2021 15:10:55 -0700 (PDT)
Subject: Re: [PATCH 10/11] drm/msm/dsi: Add support for DSC configuration
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-11-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <ab891024-4c07-fd52-85ca-77eff626bd9a@linaro.org>
Date:   Fri, 30 Jul 2021 01:10:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210715065203.709914-11-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/07/2021 09:52, Vinod Koul wrote:
> When DSC is enabled, we need to configure DSI registers accordingly and
> configure the respective stream compression registers.
> 
> Add support to calculate the register setting based on DSC params and
> timing information and configure these registers.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi.xml.h  |  10 ++
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 142 +++++++++++++++++++++++++++--
>   2 files changed, 142 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 50eb4d1b8fdd..b8e9e608abfc 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -2310,4 +2310,14 @@ static inline uint32_t REG_DSI_7nm_PHY_LN_TX_DCTRL(uint32_t i0) { return 0x00000
>   
>   #define REG_DSI_7nm_PHY_PLL_PERF_OPTIMIZE			0x00000260
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
>   #endif /* DSI_XML */


Could you please post the patch to mesa3d to add these registers?

> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index e1e5d91809b5..4e8ab1b1df8b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -942,6 +942,26 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>   	dsi_write(msm_host, REG_DSI_CTRL, data);
>   }
>   
> +static int dsi_dsc_update_pic_dim(struct msm_display_dsc_config *dsc,
> +				  int pic_width, int pic_height)
> +{
> +	if (!dsc || !pic_width || !pic_height) {
> +		pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n", pic_width, pic_height);
> +		return -EINVAL;
> +	}
> +
> +	if ((pic_width % dsc->drm->slice_width) || (pic_height % dsc->drm->slice_height)) {
> +		pr_err("DSI: pic_dim %dx%d has to be multiple of slice %dx%d\n",
> +		       pic_width, pic_height, dsc->drm->slice_width, dsc->drm->slice_height);
> +		return -EINVAL;
> +	}
> +
> +	dsc->drm->pic_width = pic_width;
> +	dsc->drm->pic_height = pic_height;
> +
> +	return 0;
> +}
> +
>   static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
>   {
>   	struct drm_display_mode *mode = msm_host->mode;
> @@ -956,6 +976,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
>   	u32 va_end = va_start + mode->vdisplay;
>   	u32 hdisplay = mode->hdisplay;
>   	u32 wc;
> +	u32 data;
>   
>   	DBG("");
>   
> @@ -974,7 +995,73 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
>   		hdisplay /= 2;
>   	}
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
>   	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
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
>   		dsi_write(msm_host, REG_DSI_ACTIVE_H,
>   			DSI_ACTIVE_H_START(ha_start) |
>   			DSI_ACTIVE_H_END(ha_end));
> @@ -993,19 +1080,50 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_dual_dsi)
>   			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>   			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>   	} else {		/* command mode */
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
>   		/* image data and 1 byte write_memory_start cmd */
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

Could you please separate this cleanup away.

>   	}
>   }
>   
> @@ -2074,6 +2192,7 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>   	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
>   	struct platform_device *pdev = msm_host->pdev;
> +	struct msm_drm_private *priv;
>   	int ret;
>   
>   	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> @@ -2093,6 +2212,9 @@ int msm_dsi_host_modeset_init(struct mipi_dsi_host *host,
>   	}
>   
>   	msm_host->dev = dev;
> +	priv = dev->dev_private;
> +	priv->dsc = msm_host->dsc;

I'd prefer not to push dsc config into msm_drm_private and to get it as 
necessary using msm_dsi function calls.

> +
>   	ret = cfg_hnd->ops->tx_buf_alloc(msm_host, SZ_4K);
>   	if (ret) {
>   		pr_err("%s: alloc tx gem obj failed, %d\n", __func__, ret);
> 


-- 
With best wishes
Dmitry
