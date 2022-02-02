Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B88B34A6E3A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Feb 2022 10:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240012AbiBBJ4x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Feb 2022 04:56:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbiBBJ4w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Feb 2022 04:56:52 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2235C06173B
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Feb 2022 01:56:51 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id n8so39460794lfq.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Feb 2022 01:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OlS3GncR3YUQG4+S91Ag+5gM2OFcP2B50lAv5LrKqq0=;
        b=NLFyj32FscoWvuxxdK25ZPbWsMaOqMb5ofy/7tpBxXEsULPJ9opsyTKnKANeDj+bRe
         ac6JGNCwsezoMKUdOcSlFigZyTVayDNfKRFhfI4ct8O0Z6G0WSfElhgMIvvy8t9AgQSw
         zJE8BL4WgES/muXeoLMPp7pqMtCJQp3F0UX1ni2VUXAVGAl2LLvdU5HOo7D1EwMvWIIS
         0a/R97wwgLMQ8LETMHK9DOSWW+aCccnS/0GRuuoMEq/XS0IrHUtWiZh6pPlPBslVkyKy
         AQfvP3N/NIOS0XaUy60HuO2D8bfD9lmhwOrYpfr+5TsCZqfbonFwQqaH881zyzohv9G6
         A5yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OlS3GncR3YUQG4+S91Ag+5gM2OFcP2B50lAv5LrKqq0=;
        b=JdBJnTNmEfoLIBOUBFf89X0U/eNohD6QIJ5dwE6SMHQx/EtYm4AXpxRKhw0xe6KSbY
         XG/KdQ2OeMipJVNLXgbATtBeitUtdzfT0eSw9BZPo+HdHjtQ05CY1PUJnUeanoWzw0xl
         fLckyR+W3oGwIZwjMG63085oJQX0Evyt+g2px3DQLVXw3TFjukQikMIYqJImoWnjqBrH
         61XbNveJZQMfsEkW640n9L1m8s9P3e5xDQhKXuuf2fAbrw5h5lgRj0Il6anQnO4EQDVU
         rYzNF0mTa9vp67WjPX7/PB9nfI+Rur4cNPy/dp4XjP0xfiE+Ua+oj1VBOVMgThZ3lYPc
         SMnw==
X-Gm-Message-State: AOAM530m55IrxaWcwFQLTFWAx5fQfqwEpK8JR2FG75JCG2wm9/T4wW0v
        A6nUX7Yb7e+B8G6wyqpsIXRdtw==
X-Google-Smtp-Source: ABdhPJyBBN0lSYQ87MoIzOWsN8mDGEvnJ9DmxbVjRq1LcW4cOhj0v/9rhsUO9ogdi+YZToUvQC6wZQ==
X-Received: by 2002:a05:6512:683:: with SMTP id t3mr22363002lfe.61.1643795810048;
        Wed, 02 Feb 2022 01:56:50 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k9sm2211436lfo.258.2022.02.02.01.56.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Feb 2022 01:56:49 -0800 (PST)
Message-ID: <04ac6556-310b-206b-5341-ccf846959f16@linaro.org>
Date:   Wed, 2 Feb 2022 12:56:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm/msm/dp: add wide bus support
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
        daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     quic_abhinavk@quicinc.com, aravindh@codeaurora.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1643761824-25858-1-git-send-email-quic_khsieh@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1643761824-25858-1-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/02/2022 03:30, Kuogee Hsieh wrote:
> Normally, mdp will push one pixel of data per pixel clock to
> interface to display. Wide bus feature will increase bus
> width from 32 bits to 64 bits so that it can push two
> pixel of data per pixel clock to interface to display.
> This feature is pre requirement to support 4k resolution
> since it will reduce pixel clock rate to half of original
> rate. Hence pixel clock rate used to drive 4k panel will
> not exceed limitation.

Bjorn question is still valid. Why is this required for the 4k panels? 
For which clock frequencies/chipsets?

> 
> changes in v2:
> -- remove compression related code from timing
> -- remove op_info from  struct msm_drm_private
> -- remove unnecessary wide_bus_en variables
> -- pass wide_bus_en into timing configuration by struct msm_dp
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  8 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  2 +
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 14 +++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        | 99 ++++++++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |  2 +
>   drivers/gpu/drm/msm/dp/dp_catalog.c                | 15 +++-
>   drivers/gpu/drm/msm/dp/dp_catalog.h                |  2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 13 ++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  1 +
>   drivers/gpu/drm/msm/dp/dp_display.c                | 11 +++
>   drivers/gpu/drm/msm/dp/dp_display.h                | 21 -----
>   drivers/gpu/drm/msm/dp/dp_panel.c                  |  4 +-
>   drivers/gpu/drm/msm/dp/dp_panel.h                  |  2 +-
>   drivers/gpu/drm/msm/msm_drv.h                      | 25 ++++++
>   14 files changed, 154 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 1e648db..7bbdfb9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -217,6 +217,14 @@ static u32 dither_matrix[DITHER_MATRIX_SZ] = {
>   	15, 7, 13, 5, 3, 11, 1, 9, 12, 4, 14, 6, 0, 8, 2, 10
>   };
>   
> +
> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc)
> +{
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +
> +	return dpu_enc->dp->wide_bus_en;
> +}
> +
>   static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bpc)
>   {
>   	struct dpu_hw_dither_cfg dither_cfg = { 0 };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> index e241914..0d73550 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
> @@ -168,4 +168,6 @@ int dpu_encoder_get_linecount(struct drm_encoder *drm_enc);
>    */
>   int dpu_encoder_get_vsync_count(struct drm_encoder *drm_enc);
>   
> +bool dpu_encoder_is_widebus_enabled(struct drm_encoder *drm_enc);
> +
>   #endif /* __DPU_ENCODER_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89..b72c33b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -110,6 +110,20 @@ static void drm_mode_to_intf_timing_params(
>   		timing->v_back_porch += timing->v_front_porch;
>   		timing->v_front_porch = 0;
>   	}
> +
> +	timing->wide_bus_en = dpu_encoder_is_widebus_enabled(phys_enc->parent);
> +
> +	/*
> +	 * for DP, divide the horizonal parameters by 2 when
> +	 * widebus is enabled
> +	 */
> +	if (timing->wide_bus_en) {
> +		timing->width = timing->width >> 1;
> +		timing->xres = timing->xres >> 1;
> +		timing->h_back_porch = timing->h_back_porch >> 1;
> +		timing->h_front_porch = timing->h_front_porch >> 1;
> +		timing->hsync_pulse_width = timing->hsync_pulse_width >> 1;
> +	}
>   }
>   
>   static u32 get_horizontal_total(const struct intf_timing_params *timing)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 116e2b5..35d4aaa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -33,6 +33,7 @@
>   #define INTF_TP_COLOR1                  0x05C
>   #define INTF_CONFIG2                    0x060
>   #define INTF_DISPLAY_DATA_HCTL          0x064
> +#define INTF_ACTIVE_DATA_HCTL           0x068
>   #define INTF_FRAME_LINE_COUNT_EN        0x0A8
>   #define INTF_FRAME_COUNT                0x0AC
>   #define   INTF_LINE_COUNT               0x0B0
> @@ -90,68 +91,95 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	u32 hsync_period, vsync_period;
>   	u32 display_v_start, display_v_end;
>   	u32 hsync_start_x, hsync_end_x;
> +	u32 hsync_data_start_x, hsync_data_end_x;
>   	u32 active_h_start, active_h_end;
>   	u32 active_v_start, active_v_end;
>   	u32 active_hctl, display_hctl, hsync_ctl;
>   	u32 polarity_ctl, den_polarity, hsync_polarity, vsync_polarity;
>   	u32 panel_format;
> -	u32 intf_cfg, intf_cfg2 = 0, display_data_hctl = 0;
> +	u32 intf_cfg, intf_cfg2 = 0;
> +	u32 display_data_hctl = 0, active_data_hctl = 0;
> +	u32 data_width;
> +	bool dp_intf = false;
>   
>   	/* read interface_cfg */
>   	intf_cfg = DPU_REG_READ(c, INTF_CONFIG);
> +
> +	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP)
> +		dp_intf = true;
> +
>   	hsync_period = p->hsync_pulse_width + p->h_back_porch + p->width +
>   	p->h_front_porch;
>   	vsync_period = p->vsync_pulse_width + p->v_back_porch + p->height +
>   	p->v_front_porch;
>   
>   	display_v_start = ((p->vsync_pulse_width + p->v_back_porch) *
> -	hsync_period) + p->hsync_skew;
> +			hsync_period) + p->hsync_skew;

Whitespace changes should be in a separate patch

>   	display_v_end = ((vsync_period - p->v_front_porch) * hsync_period) +
> -	p->hsync_skew - 1;
> +			p->hsync_skew - 1;
> +
> +	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>   
>   	hsync_start_x = p->h_back_porch + p->hsync_pulse_width;
>   	hsync_end_x = hsync_period - p->h_front_porch - 1;
>   
> -	if (p->width != p->xres) {
> -		active_h_start = hsync_start_x;
> -		active_h_end = active_h_start + p->xres - 1;
> -	} else {
> -		active_h_start = 0;
> -		active_h_end = 0;
> -	}
> +	/*
> +	 * DATA_HCTL_EN controls data timing which can be different from
> +	 * video timing. It is recommended to enable it for all cases, except
> +	 * if compression is enabled in 1 pixel per clock mode
> +	 */
> +	if (p->wide_bus_en)
> +		intf_cfg2 |= BIT(4);
>   
> -	if (p->height != p->yres) {
> -		active_v_start = display_v_start;
> -		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
> -	} else {
> -		active_v_start = 0;
> -		active_v_end = 0;
> -	}
> +	if (p->wide_bus_en)
> +		intf_cfg2 |= BIT(0);
>   
> -	if (active_h_end) {
> -		active_hctl = (active_h_end << 16) | active_h_start;
> -		intf_cfg |= BIT(29);	/* ACTIVE_H_ENABLE */
> -	} else {
> -		active_hctl = 0;
> -	}
> +	/*
> +	 * If widebus is disabled:
> +	 * For uncompressed stream, the data is valid for the entire active
> +	 * window period.
> +	 * For compressed stream, data is valid for a shorter time period
> +	 * inside the active window depending on the compression ratio.
> +	 *
> +	 * If widebus is enabled:
> +	 * For uncompressed stream, data is valid for only half the active
> +	 * window, since the data rate is doubled in this mode.
> +	 * p->width holds the adjusted width for DP but unadjusted width for DSI
> +	 * For compressed stream, data validity window needs to be adjusted for
> +	 * compression ratio and then further halved.
> +	 */
> +	data_width = p->width;
> +
> +	if (!dp_intf && p->wide_bus_en)
> +		data_width = p->width >> 1;
> +	else
> +		data_width = p->width;
>   
> -	if (active_v_end)
> -		intf_cfg |= BIT(30); /* ACTIVE_V_ENABLE */
> +	hsync_data_start_x = hsync_start_x;
> +	hsync_data_end_x =  hsync_start_x + data_width - 1;
>   
> -	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>   	display_hctl = (hsync_end_x << 16) | hsync_start_x;
> +	display_data_hctl = (hsync_data_end_x << 16) | hsync_data_start_x;
>   
> -	if (ctx->cap->type == INTF_EDP || ctx->cap->type == INTF_DP) {
> -		active_h_start = hsync_start_x;
> -		active_h_end = active_h_start + p->xres - 1;
> -		active_v_start = display_v_start;
> -		active_v_end = active_v_start + (p->yres * hsync_period) - 1;
> -
> +	if (dp_intf) {
> +		// DP timing adjustment
>   		display_v_start += p->hsync_pulse_width + p->h_back_porch;
> +		display_v_end   -= p->h_front_porch;
> +	}
> +
> +	active_h_start = hsync_start_x;
> +	active_h_end = active_h_start + p->xres - 1;
> +
> +	active_v_start = display_v_start;
> +	active_v_end = active_v_start + (p->yres * hsync_period) - 1;
>   
> -		active_hctl = (active_h_end << 16) | active_h_start;
> +	intf_cfg |= BIT(29);	/* ACTIVE_H_ENABLE */
> +	intf_cfg |= BIT(30);	/* ACTIVE_V_ENABLE */

This makes ACTIVE_H_ENABLE/ACTIVE_V_ENABLE to be always enabled, while 
currently they are enabled conditionally. Could you please comment on 
this? Ideally, as you seem to be changing the way we calculate timings,
I'd ask to split this part into several patches:
  - Change current approach w/o adding wide_bus_en
  - Introduce wide_bus_en on top of that.

Also, while you are reworking this piece of code, could you please add 
defines for existing and new intf_cfg/etc BIT(n) values used here?
They are specified in comments, but I think a common consensus is to use 
defines instead.

> +
> +	active_hctl = (active_h_end << 16) | active_h_start;
> +
> +	if (dp_intf)
>   		display_hctl = active_hctl;
> -	}
>   
>   	den_polarity = 0;
>   	if (ctx->cap->type == INTF_HDMI) {
> @@ -204,6 +232,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>   	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>   	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> +	DPU_REG_WRITE(c, INTF_CONFIG2, intf_cfg2);
> +	DPU_REG_WRITE(c, INTF_DISPLAY_DATA_HCTL, display_data_hctl);
> +	DPU_REG_WRITE(c, INTF_ACTIVE_DATA_HCTL, active_data_hctl);
>   }
>   
>   static void dpu_hw_intf_enable_timing_engine(
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> index 3568be8..e4a518a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> @@ -30,6 +30,8 @@ struct intf_timing_params {
>   	u32 border_clr;
>   	u32 underflow_clr;
>   	u32 hsync_skew;
> +
> +	bool wide_bus_en;
>   };
>   
>   struct intf_prog_fetch {
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 64f0b26..462596f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -739,10 +739,11 @@ u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog)
>   }
>   
>   /* panel related catalog functions */
> -int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
> +int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, bool wide_bus_en)
>   {
>   	struct dp_catalog_private *catalog = container_of(dp_catalog,
>   				struct dp_catalog_private, dp_catalog);
> +	u32 reg;
>   
>   	dp_write_link(catalog, REG_DP_TOTAL_HOR_VER,
>   				dp_catalog->total);
> @@ -751,7 +752,17 @@ int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
>   	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
>   				dp_catalog->width_blanking);
>   	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
> -	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0);
> +
> +	reg = dp_read_p0(catalog, MMSS_DP_INTF_CONFIG);
> +
> +	if (wide_bus_en)
> +		reg |= BIT(4);
> +	else
> +		reg &= ~BIT(4);

Could you please add a symbolic name for this bit?

> +
> +	DRM_DEBUG_DP("wide_bus_en=%d reg=%x\n", wide_bus_en, reg);
> +
> +	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, reg);
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 7dea101..78e22ad 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -115,7 +115,7 @@ void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
>   u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
>   
>   /* DP Panel APIs */
> -int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
> +int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog, bool wide_bus_en);
>   void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
>   void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
>   				struct drm_display_mode *drm_mode);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 245e1b9..1c4cf9d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -154,7 +154,7 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
>   	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
>   }
>   
> -static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
> +static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl, bool wide_bus_en)
>   {
>   	u32 cc, tb;
>   
> @@ -167,7 +167,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>   		ctrl->panel->dp_mode.bpp);
>   	cc = dp_link_get_colorimetry_config(ctrl->link);
>   	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
> -	dp_panel_timing_cfg(ctrl->panel);
> +	dp_panel_timing_cfg(ctrl->panel, wide_bus_en);
>   }
>   
>   /*
> @@ -1796,6 +1796,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   	int ret = 0;
>   	bool mainlink_ready = false;
>   	struct dp_ctrl_private *ctrl;
> +	u32 pixel_rate_orig;
>   
>   	if (!dp_ctrl)
>   		return -EINVAL;
> @@ -1804,6 +1805,10 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   
>   	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
>   
> +	pixel_rate_orig = ctrl->dp_ctrl.pixel_rate;
> +	if (dp_ctrl->wide_bus_en)
> +		ctrl->dp_ctrl.pixel_rate >>= 1;
> +
>   	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
>   		ctrl->link->link_params.rate,
>   		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
> @@ -1839,11 +1844,11 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl)
>   	 */
>   	reinit_completion(&ctrl->video_comp);
>   
> -	dp_ctrl_configure_source_params(ctrl);
> +	dp_ctrl_configure_source_params(ctrl, dp_ctrl->wide_bus_en);
>   
>   	dp_catalog_ctrl_config_msa(ctrl->catalog,
>   		ctrl->link->link_params.rate,
> -		ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
> +		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
>   
>   	dp_ctrl_setup_tr_unit(ctrl);
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 2433edb..4dff44d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -17,6 +17,7 @@ struct dp_ctrl {
>   	bool orientation;
>   	atomic_t aborted;
>   	u32 pixel_rate;
> +	bool wide_bus_en;
>   };
>   
>   int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl);
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1d7f82e..5a0f5a3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -843,6 +843,8 @@ static int dp_display_enable(struct dp_display_private *dp, u32 data)
>   		return 0;
>   	}
>   
> +	dp->ctrl->wide_bus_en = dp_display->wide_bus_en;
> +
>   	rc = dp_ctrl_on_stream(dp->ctrl);
>   	if (!rc)
>   		dp_display->power_on = true;
> @@ -974,6 +976,8 @@ int dp_display_get_modes(struct msm_dp *dp,
>   		dp->connector, dp_mode);
>   	if (dp_mode->drm_mode.clock)
>   		dp->max_pclk_khz = dp_mode->drm_mode.clock;
> +
> +	DRM_DEBUG_DP("id=%d wide_bus_en=%d\n", dp_display->id, dp->wide_bus_en);
>   	return ret;
>   }
>   
> @@ -1506,6 +1510,13 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   
>   	priv->bridges[priv->num_bridges++] = dp_display->bridge;
>   
> +	if (dp_display->connector_type  == DRM_MODE_CONNECTOR_DisplayPort) {
> +		dp_display->wide_bus_en = true;

This makes wide_bus always enabled. However earlier you stated that it 
is not supported for some of earlier generations.


> +		dp_display->compression_en = false;

compression_en is not defined anywhere.

> +	}

> +
> +	DRM_DEBUG_DP("id=%d wide_bus_en=%d\n", dp_priv->id, dp_display->wide_bus_en);
> +
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
> index e3adcd5..2eb11d0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.h
> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
> @@ -7,29 +7,8 @@
>   #define _DP_DISPLAY_H_
>   
>   #include "dp_panel.h"
> -#include <sound/hdmi-codec.h>
>   #include "disp/msm_disp_snapshot.h"
>   
> -struct msm_dp {
> -	struct drm_device *drm_dev;
> -	struct device *codec_dev;
> -	struct drm_bridge *bridge;
> -	struct drm_connector *connector;
> -	struct drm_encoder *encoder;
> -	struct drm_bridge *panel_bridge;
> -	bool is_connected;
> -	bool audio_enabled;
> -	bool power_on;
> -	unsigned int connector_type;
> -
> -	hdmi_codec_plugged_cb plugged_cb;
> -
> -	u32 max_pclk_khz;
> -
> -	u32 max_dp_lanes;
> -	struct dp_audio *dp_audio;
> -};
> -

NO. Let struct msm_dp be private.

>   int dp_display_set_plugged_cb(struct msm_dp *dp_display,
>   		hdmi_codec_plugged_cb fn, struct device *codec_dev);
>   int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 71db10c..71deb1e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -353,7 +353,7 @@ void dp_panel_dump_regs(struct dp_panel *dp_panel)
>   	dp_catalog_dump_regs(catalog);
>   }
>   
> -int dp_panel_timing_cfg(struct dp_panel *dp_panel)
> +int dp_panel_timing_cfg(struct dp_panel *dp_panel, bool wide_bus_en)
>   {
>   	u32 data, total_ver, total_hor;
>   	struct dp_catalog *catalog;
> @@ -404,7 +404,7 @@ int dp_panel_timing_cfg(struct dp_panel *dp_panel)
>   
>   	catalog->dp_active = data;
>   
> -	dp_catalog_panel_timing_cfg(catalog);
> +	dp_catalog_panel_timing_cfg(catalog, wide_bus_en);
>   	panel->panel_on = true;
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
> index 9023e5b..5ec341a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
> @@ -57,7 +57,7 @@ struct dp_panel {
>   
>   int dp_panel_init_panel_info(struct dp_panel *dp_panel);
>   int dp_panel_deinit(struct dp_panel *dp_panel);
> -int dp_panel_timing_cfg(struct dp_panel *dp_panel);
> +int dp_panel_timing_cfg(struct dp_panel *dp_panel, bool wide_bus_en);
>   void dp_panel_dump_regs(struct dp_panel *dp_panel);
>   int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>   		struct drm_connector *connector);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index d7574e6..84fb89e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -25,6 +25,8 @@
>   #include <linux/sizes.h>
>   #include <linux/kthread.h>
>   
> +#include <sound/hdmi-codec.h>
> +
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_plane_helper.h>
> @@ -134,6 +136,29 @@ struct msm_drm_thread {
>   	struct kthread_worker *worker;
>   };
>   
> +struct msm_dp {
> +	struct drm_device *drm_dev;
> +	struct device *codec_dev;
> +	struct drm_bridge *bridge;
> +	struct drm_connector *connector;
> +	struct drm_encoder *encoder;
> +	struct drm_bridge *panel_bridge;
> +	bool is_connected;
> +	bool audio_enabled;
> +	bool power_on;
> +	unsigned int connector_type;
> +
> +	hdmi_codec_plugged_cb plugged_cb;
> +
> +	bool wide_bus_en;
> +	bool compression_en;
> +
> +	u32 max_pclk_khz;
> +
> +	u32 max_dp_lanes;
> +	struct dp_audio *dp_audio;
> +};
> +
>   struct msm_drm_private {
>   
>   	struct drm_device *dev;


-- 
With best wishes
Dmitry
