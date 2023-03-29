Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C23056CF7AE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Mar 2023 01:48:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbjC2Xs6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Mar 2023 19:48:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbjC2Xs5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Mar 2023 19:48:57 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6311722
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:48:55 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id j11so22314383lfg.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Mar 2023 16:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680133734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4nT0j+zzun4HtuwuHnIU3HzE9OK3SdjOBdsKWomYhs8=;
        b=treoMPKCnP9KvD6g3WiT4R/vOlPlc9SINf22j56KAjCa4W4kt/4xpd+p8ji4YbDR7X
         qql44PqDgfsP2LXvL06L+GSf6ZXy+bYmKW2PLiqFxSxPtmKk6t+osVTQbk4sJwd/4Zxa
         yDulGSvq4FrvMal/KN4xFg8nrWV4UKfbnMoXHGz8L6WS0NEp83JuvwDDDjbJt1AtQ/Ko
         dy74JEho40A4JFx49QO2YyI3JOpZGjM6G6oibRVmmh/Q7tYH9AAqJ1a7LLuGc9Nh2Pg/
         i0DAKu0siIC6lGm/gn7GzsPdWf6cDqmMRucH4V9qPEsjAIk8u83FZ0rA54gS9/QT8HpQ
         Grew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680133734;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4nT0j+zzun4HtuwuHnIU3HzE9OK3SdjOBdsKWomYhs8=;
        b=NMe6eSx2xpJcV0G6lW2m3qnu2emUDVNviguVrtvO0LAayvTgOaTYip7Lq5wXPsLLtb
         rFEAMiFQ6kFcEm1haPaE8pUqXuFg+5RkuVBwxGojUDVol5N2So9cAAwok7hmToWGyrvW
         wP76PoIHEL0BDR7PjDRNBLS0z6K3kREfsGvha95Bk24+Pin2Cp4alUgNfV3pPgEggCIw
         JqiuRGKFRL+Ke4loq5kLZ5H+3No3gxFEG6o+u9ayC/klxd+LLVd5fYDtMWXbAVgiqaG+
         TDnihea8F16niy3o7GFuXxmpAAUt4QbjIULCtDbyiFtxNPmJnODKo1qRkYKgNpiVxB3a
         ynPA==
X-Gm-Message-State: AAQBX9e4Z03l1m56g8f21A1O0qtUBf4vUDbKVMTAWKM8O0nZnToKF7xd
        H34PnSh1pdkzYTTluJsJYXdqQA==
X-Google-Smtp-Source: AKy350ba6VQZff9h18Gq+EGyt3d2FKmAT21ZUHO8Hhxi+SOXYHjoTJL701+OV4F+lqxYsDJ7h4iHYQ==
X-Received: by 2002:ac2:41cd:0:b0:4eb:1527:e2a7 with SMTP id d13-20020ac241cd000000b004eb1527e2a7mr2339243lfi.45.1680133734016;
        Wed, 29 Mar 2023 16:48:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r2-20020a2eb602000000b0029a1ccdc560sm5684880ljn.118.2023.03.29.16.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 16:48:53 -0700 (PDT)
Message-ID: <0698ce89-d70c-c3f4-f006-18130858aacf@linaro.org>
Date:   Thu, 30 Mar 2023 02:48:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH RFC 5/5] drm/msm/dsi: Use MSM and DRM DSC helper methods
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
References: <20230329-rfc-msm-dsc-helper-v1-0-f3e479f59b6d@quicinc.com>
 <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230329-rfc-msm-dsc-helper-v1-5-f3e479f59b6d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30/03/2023 02:18, Jessica Zhang wrote:
> Use MSM and DRM DSC helper methods.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 74d38f90398a..7419fe58a941 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -31,6 +31,7 @@
>   #include "msm_kms.h"
>   #include "msm_gem.h"
>   #include "phy/dsi_phy.h"
> +#include "disp/msm_dsc_helper.h"
>   
>   #define DSI_RESET_TOGGLE_DELAY_MS 20
>   
> @@ -841,14 +842,14 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   {
>   	struct drm_dsc_config *dsc = msm_host->dsc;
>   	u32 reg, reg_ctrl, reg_ctrl2;
> -	u32 slice_per_intf, total_bytes_per_intf;
> +	u32 slice_per_intf;
>   	u32 pkt_per_line;
>   	u32 eol_byte_num;
>   
>   	/* first calculate dsc parameters and then program
>   	 * compress mode registers
>   	 */
> -	slice_per_intf = DIV_ROUND_UP(hdisplay, dsc->slice_width);
> +	slice_per_intf = msm_dsc_get_slice_per_intf(dsc, hdisplay);

This looks good

>   
>   	/*
>   	 * If slice_count is greater than slice_per_intf
> @@ -858,10 +859,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>   	if (dsc->slice_count > slice_per_intf)
>   		dsc->slice_count = 1;
>   
> -	total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> +	eol_byte_num = msm_dsc_get_eol_byte_num(msm_host->dsc, hdisplay,
> +			dsi_get_bpp(msm_host->format));
>   
> -	eol_byte_num = total_bytes_per_intf % 3;
> -	pkt_per_line = slice_per_intf / dsc->slice_count;
> +	pkt_per_line = slice_per_intf / MSM_DSC_SLICE_PER_PKT;

And for these values the result is definitely changed. Separate patch & 
description please. Just in case, "values per downstream kernel" is not 
a proper description for such changes.

>   
>   	if (is_cmd_mode) /* packet data type */
>   		reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -911,6 +912,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   
>   	DBG("");
>   
> +	if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> +		/* Default widebus_en to false for now. */
> +		hdisplay = msm_dsc_get_pclk_per_line(msm_host->dsc, mode->hdisplay,
> +				dsi_get_bpp(msm_host->format));
> +

This is definitely something new and thus should probably go into a 
separate patch and be described. Also I'm not sure how does that 
interact with the hdisplay-related calculations below, under the if(dsc) 
clause.

>   	/*
>   	 * For bonded DSI mode, the current DRM mode has
>   	 * the complete width of the panel. Since, the complete
> @@ -1759,7 +1765,7 @@ static int dsi_populate_dsc_params(struct msm_dsi_host *msm_host, struct drm_dsc
>   		return ret;
>   	}
>   
> -	dsc->initial_scale_value = 32;
> +	dsc->initial_scale_value = drm_dsc_calculate_initial_scale_value(dsc);

This is fine, we only support 8bpp where these values match.

>   	dsc->line_buf_depth = dsc->bits_per_component + 1;
>   
>   	return drm_dsc_compute_rc_parameters(dsc);
> 

-- 
With best wishes
Dmitry

