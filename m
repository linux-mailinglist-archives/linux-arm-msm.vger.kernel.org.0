Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C3D4F55F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 08:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245131AbiDFFjC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 01:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1848398AbiDFCVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 22:21:50 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF9627D559
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 16:42:38 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id q68so1070189ljb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 16:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Jvd8yLkL4H4JMSJ4KoB1/KxgXXtRYZgPmAmGLOJdDus=;
        b=PoMu5ik5/yViCVccnBhUOXg7CMfjb6jA2lxAUxUKu8U3QiFo1bAN9ndX++nD+VUOTb
         QtSseUsk1zCurh9CnfZ5ckLgHMynwYkjIv2BG1B3IEm/yGM9XhzYh/16PnP1Cg9UOzaU
         QHxIdsDrT2bZfVKudVvwiG2WpY20CKgWgM4QIkjMvnBDLTGAEmIMfFQZxC9wawfgC2jB
         Lh7xLdtWuPbjy0xJCQmp9QUOZNWvjjWKJ3gxJqj+iFqJ/JkvhW3ddUcVOIrORY077fiM
         tglCVL+oz2Mf6emzuxtNHMezz1CpJKpaySbVIMvQ9TzN5JRc7wjvzSLoMCMNDMCGvGvj
         U6/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Jvd8yLkL4H4JMSJ4KoB1/KxgXXtRYZgPmAmGLOJdDus=;
        b=oHB/bsy56/OMTGgZ6OrNYCXgTFemmpflLZIB81fYtBgDzl1LJNBFLAY7ydw+O3AkCh
         xjeDW7zbE4XSB+z9q71hbGtx8PS4wWtmYgN/xVe5u2aU0HJTQPioFmv6rlQ6u5H9SwHY
         ixTFez3Q3tgdTzj1FOe/gPfeQm/ajl/5060ZYuxd2ApTGvn/6SB2o5of1bKO1YH2hKxc
         u8cg/a6dPxKYnmPuqJ8h59qN6cQjCcqRXKhJV2BJIfdRhLpWlhkQ4PAuruV4mrLo4eTr
         JWzaoUj8YpkXeOi5SIbBerd051J6YXFCWuLGykREaSx67yytH/8EroGfXcFyPuPtXDWt
         v22A==
X-Gm-Message-State: AOAM533iXc71Hq0ekId9LZm1oqKtOUfLoIXmePaMe6B0ZPVSEf5UPyjA
        tZxbcXmq10G5FR0UauJL6i5jmw==
X-Google-Smtp-Source: ABdhPJwJurYqLtF/SAzZ6/+lSfeZmeFaSLKmwD+ujlty37GIYbc4JDTjheD3AefDplUEwXQV6ADzjg==
X-Received: by 2002:a2e:7316:0:b0:24a:f59a:3c06 with SMTP id o22-20020a2e7316000000b0024af59a3c06mr3738312ljc.294.1649202155353;
        Tue, 05 Apr 2022 16:42:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id w13-20020a2e998d000000b002496199495csm1465715lji.55.2022.04.05.16.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 16:42:34 -0700 (PDT)
Message-ID: <f5fc9704-5c22-8c95-b6d6-e2c20145672c@linaro.org>
Date:   Wed, 6 Apr 2022 02:42:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 14/14] drm/msm/dsi: Add support for DSC configuration
Content-Language: en-GB
To:     Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20220404163436.956875-1-vkoul@kernel.org>
 <20220404163436.956875-15-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220404163436.956875-15-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/04/2022 19:34, Vinod Koul wrote:
> When DSC is enabled, we need to configure DSI registers accordingly and
> configure the respective stream compression registers.
> 
> Add support to calculate the register setting based on DSC params and
> timing information and configure these registers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 98 +++++++++++++++++++++++++++++-
>   1 file changed, 97 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index eb0be34add45..f3ed6c40b9e1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -912,6 +912,65 @@ static void dsi_ctrl_config(struct msm_dsi_host *msm_host, bool enable,
>   		dsi_write(msm_host, REG_DSI_CPHY_MODE_CTRL, BIT(0));
>   }
>   
> +static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mode, u32 hdisplay)
> +{
> +	struct msm_display_dsc_config *dsc = msm_host->dsc;
> +	u32 reg, intf_width, reg_ctrl, reg_ctrl2;
> +	u32 slice_per_intf, total_bytes_per_intf;
> +	u32 pkt_per_line;
> +	u32 bytes_in_slice;
> +	u32 eol_byte_num;
> +
> +	/* first calculate dsc parameters and then program
> +	 * compress mode registers
> +	 */
> +	intf_width = hdisplay;
> +	slice_per_intf = DIV_ROUND_UP(intf_width, dsc->drm->slice_width);
> +
> +	/* If slice_per_pkt is greater than slice_per_intf
> +	 * then default to 1. This can happen during partial
> +	 * update.
> +	 */
> +	if (slice_per_intf > dsc->drm->slice_count)
> +		dsc->drm->slice_count = 1;
> +
> +	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->drm->slice_width);
> +	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width * dsc->drm->bits_per_pixel, 8);
> +
> +	dsc->drm->slice_chunk_size = bytes_in_slice;
> +
> +	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
> +
> +	eol_byte_num = total_bytes_per_intf % 3;
> +	pkt_per_line = slice_per_intf / dsc->drm->slice_count;
> +
> +	if (is_cmd_mode) /* packet data type */
> +		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> +	else
> +		reg = DSI_VIDEO_COMPRESSION_MODE_CTRL_DATATYPE(MIPI_DSI_COMPRESSED_PIXEL_STREAM);
> +
> +	/* DSI_VIDEO_COMPRESSION_MODE & DSI_COMMAND_COMPRESSION_MODE
> +	 * registers have similar offsets, so for below common code use
> +	 * DSI_VIDEO_COMPRESSION_MODE_XXXX for setting bits
> +	 */
> +	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_PKT_PER_LINE(pkt_per_line >> 1);
> +	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EOL_BYTE_NUM(eol_byte_num);
> +	reg |= DSI_VIDEO_COMPRESSION_MODE_CTRL_EN;
> +
> +	if (is_cmd_mode) {
> +		reg_ctrl = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL);
> +		reg_ctrl2 = dsi_read(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2);
> +
> +		reg_ctrl |= reg;
> +		reg_ctrl2 |= DSI_COMMAND_COMPRESSION_MODE_CTRL2_STREAM0_SLICE_WIDTH(bytes_in_slice);
> +
> +		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL, reg);

reg_ctrl, as reported by testing robot

> +		dsi_write(msm_host, REG_DSI_COMMAND_COMPRESSION_MODE_CTRL2, reg_ctrl2);
> +	} else {
> +		dsi_write(msm_host, REG_DSI_VIDEO_COMPRESSION_MODE_CTRL, reg);
> +	}
> +}
> +
>   static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   {
>   	struct drm_display_mode *mode = msm_host->mode;
> @@ -944,7 +1003,38 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		hdisplay /= 2;
>   	}
>   
> +	if (msm_host->dsc) {
> +		struct msm_display_dsc_config *dsc = msm_host->dsc;
> +
> +		/* update dsc params with timing params */
> +		if (!dsc || !mode->hdisplay || !mode->vdisplay) {
> +			pr_err("DSI: invalid input: pic_width: %d pic_height: %d\n",
> +			       mode->hdisplay, mode->vdisplay);
> +			return;
> +		}
> +
> +		dsc->drm->pic_width = mode->hdisplay;
> +		dsc->drm->pic_height = mode->vdisplay;
> +		DBG("Mode %dx%d\n", dsc->drm->pic_width, dsc->drm->pic_height);
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
> +		if (msm_host->dsc)
> +			dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
> +
>   		dsi_write(msm_host, REG_DSI_ACTIVE_H,
>   			DSI_ACTIVE_H_START(ha_start) |
>   			DSI_ACTIVE_H_END(ha_end));
> @@ -963,8 +1053,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   			DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>   			DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>   	} else {		/* command mode */
> +		if (msm_host->dsc)
> +			dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
> +
>   		/* image data and 1 byte write_memory_start cmd */
> -		wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
> +		if (!msm_host->dsc)
> +			wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
> +		else
> +			wc = mode->hdisplay / 2 + 1;
>   
>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>   			DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |


-- 
With best wishes
Dmitry
