Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABAE3730AEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jun 2023 00:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbjFNWpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Jun 2023 18:45:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbjFNWpJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Jun 2023 18:45:09 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443F5268B
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:45:05 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f762b3227dso225931e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jun 2023 15:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686782703; x=1689374703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pFmEys4UP/BgwQm19UOfZJrlXyJD3pmyho65CpiqnbY=;
        b=P0xkljwPwEIx9AiLfTQ52OF2brfwDB4iX2e7Jv+LzXTgBkI/ZnBRbTtlAc7Bh4YMqO
         EEXq38ZzvaHMHJqQFYknBcSu1UmHdfOedsuvIeYhAjrX2BUHKUhF4JKDySzJ2dpDa4O1
         STA9E2hLePlmYiY0a091mZSsm6CrsqbcOEAoUMjJrGOKOxZwID0WFgNlrlrZuv+7hxBp
         nSnm2wB/3L1FKvBLMexFx0C69lhhJjibpN6Ovyg7JgXz9G6RI9jBkY8tWtHIPelfdvEb
         aFmtko2M4jIJNuyG5LafYw9GiVLS0Be1FFpoHkLSH1Xi/ZnAWrbMpv21T9t3/VmELmeO
         +GZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686782703; x=1689374703;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFmEys4UP/BgwQm19UOfZJrlXyJD3pmyho65CpiqnbY=;
        b=a0MWdd9hS1qsSGn4ZtLgr8hqP4DBBSQxAnKFO48WCIdI2RiyEVohyCCWTHltozbP09
         Q+xcV6/wxgtWx13i+3Hpv0D99QK8DsCy/pUPqFyzhlsox+eioFBJZ2YxVspOyVmLf3Kw
         bNYCRoEq5iAJh78mQhuSOV5y8gZj0j/hJcdnVgmY1KBMzc0ijaZgwPudnk9+mBNB6mhb
         +grEqRXdsfDkQKccpKoHUH0SbqKdQtkNWDjETBAJkw09JAjMaNVkuRx6Va62u4H4j2Xz
         WGQlSG++I1mMlI8BzHNywHPC9apr+Suag9QjNCwLunes5xSvBkcM8tXZKalcHUskj7lM
         4r6A==
X-Gm-Message-State: AC+VfDxYtYXck6xvXyifn1R9GMIxRmBRP9gK905vrPxR/g7XPFKKfCfq
        Rhm0Pg+dGKcKrrKWYarrHlsX6w==
X-Google-Smtp-Source: ACHHUZ41d/xGmuzPjif6jwX/W74Tm1loth6hzxERHcbhrFmHVvv22kop8/IE1XX6TbWVmyC2w1FOkQ==
X-Received: by 2002:a05:6512:45a:b0:4f6:5473:7bf0 with SMTP id y26-20020a056512045a00b004f654737bf0mr1184339lfk.21.1686782703414;
        Wed, 14 Jun 2023 15:45:03 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id r23-20020ac252b7000000b004f2ce4b0f2esm2288991lfm.168.2023.06.14.15.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 15:45:02 -0700 (PDT)
Message-ID: <a1322d43-d1e6-059d-6428-f0da843a00b1@linaro.org>
Date:   Thu, 15 Jun 2023 01:45:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/msm/dsi: Enable BURST_MODE for command mode for DSI
 6G v1.3+
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
References: <20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230608-b4-add-burst-mode-v1-1-55dfbcfada55@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/06/2023 02:37, Jessica Zhang wrote:
> During a frame transfer in command mode, there could be frequent
> LP11 <-> HS transitions when multiple DCS commands are sent mid-frame or
> if the DSI controller is running on slow clock and is throttled. To
> minimize frame latency due to these transitions, it is recommended to
> send the frame in a single burst.
> 
> This feature is supported for DSI 6G 1.3 and above, thus enable burst
> mode if supported.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 744f2398a6d6..8254b06dca85 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -994,6 +994,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>   		dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_TOTAL,
>   			DSI_CMD_MDP_STREAM0_TOTAL_H_TOTAL(hdisplay) |
>   			DSI_CMD_MDP_STREAM0_TOTAL_V_TOTAL(mode->vdisplay));
> +
> +		if (msm_host->cfg_hnd->major == MSM_DSI_VER_MAJOR_6G &&
> +				msm_host->cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V1_3)
> +			dsi_write(msm_host, REG_DSI_CMD_MODE_MDP_CTRL2,
> +					DSI_CMD_MODE_MDP_CTRL2_BURST_MODE);

Please move this to dsi_ctrl_config(), the place where we set all the 
configs. Also please change this to RMW cycle.

>   	}
>   }
>   
> 
> ---
> base-commit: dd969f852ba4c66938c71889e826aa8e5300d2f2
> change-id: 20230608-b4-add-burst-mode-a5bb144069fa
> 
> Best regards,

-- 
With best wishes
Dmitry

