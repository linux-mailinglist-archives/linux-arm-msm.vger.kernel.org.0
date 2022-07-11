Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 362A557054F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jul 2022 16:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbiGKOTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jul 2022 10:19:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiGKOTv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jul 2022 10:19:51 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFE6C31DE9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:19:50 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id o7so8929224lfq.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Jul 2022 07:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EbTGKdHG+1YrudsLr33VcIPNPd0JWleJZSy38WYsqHA=;
        b=GCJd/iOWc1D1t4INDMA/nNooKIuFLbEp/2dZ+mbivmOWS3NGfry0pyVGLIO/gE6/mg
         ZCoIYHnxY0on102bwNhY876TLdnpm9jXO/donroJ51Mp2Q/SVgHPgBa/C3ZMG+XBVv+U
         ncIQ4yP0ooa8DpKGpKsmWBVU7/QIpalYAdMAWVCVxaF7dZ9B3iIltaL8qw8+azxg28o3
         /bXrRNap6aoHuRgGW98sxezqS6bSt17J8VwU3w4oV6Vl9+p+a38iZ1teQlrvv9fna5pr
         gVP3nqytTYtVVPqXzLFXj3DDRnx2sD8MTNDTJruabECz9nuyfaQ+pbGHFR5rHlLn2Mgh
         jwhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EbTGKdHG+1YrudsLr33VcIPNPd0JWleJZSy38WYsqHA=;
        b=BovdPp+FF5DP5aUe6ft3/ThiwCLkoF3He8U2JiiFB6Pp1HRSc85It4OSrbmgyAECtG
         gLapjERjAZZNsHz5oAlPUilpNgEla0A/uh55q8VcIykkA8Vlp+EuBfh8sVMOV30Fy3La
         M7dF5kXEBR/3yC1S10AQDZjg78nQgyzPwJsMCBsRjWsY+UjtYx5lCSBCl4phmO9iu2xh
         nMPky/IZlCxENSUYhnWMhXevwNGo1jecmMR/WqFqcbJSYxW2P6+sxxMxC2VEHoc0OAjt
         fqZuMOBpaQQQ2L1qaF0V0ivz/D8y+6GN0YT8yC0CevLIYl4y0LCLtMQZHjofHcSj1DTI
         SG8g==
X-Gm-Message-State: AJIora+uGLpfoE4kvsAgvem6VC5Z/eb+5V8O4XF9AUWWcGbqHAdspv+3
        UsdJLnOGHcqzQrksUs8s9o64rA==
X-Google-Smtp-Source: AGRyM1vtxA3URIMoW5Kpq+Ah7ii7RSPYMDjIX30bY30Yj6lyVAWnXi7dhZAKcPwMDRtRtEY2LLkaxQ==
X-Received: by 2002:a05:6512:3b90:b0:47f:79df:62d3 with SMTP id g16-20020a0565123b9000b0047f79df62d3mr11952730lfv.486.1657549189273;
        Mon, 11 Jul 2022 07:19:49 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 9-20020ac25f09000000b0047f6a1237e5sm1562594lfq.291.2022.07.11.07.19.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Jul 2022 07:19:48 -0700 (PDT)
Message-ID: <2ba431fb-ec22-81da-29fb-1d7ecd1a8722@linaro.org>
Date:   Mon, 11 Jul 2022 17:19:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 10/10] drm/msm/disp/dpu: check for crtc enable rather
 than crtc active to release shared resources
Content-Language: en-GB
To:     Vinod Polimera <quic_vpolimer@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, robdclark@gmail.com,
        dianders@chromium.org, swboyd@chromium.org,
        quic_kalyant@quicinc.com, quic_khsieh@quicinc.com,
        quic_vproddut@quicinc.com, bjorn.andersson@linaro.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com,
        quic_sbillaka@quicinc.com
References: <1657544224-10680-1-git-send-email-quic_vpolimer@quicinc.com>
 <1657544224-10680-11-git-send-email-quic_vpolimer@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657544224-10680-11-git-send-email-quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/07/2022 15:57, Vinod Polimera wrote:
> According to KMS documentation, The driver must not release any shared
> resources if active is set to false but enable still true.
> 
> Fixes: ccc862b957c6 ("drm/msm/dpu: Fix reservation failures in modeset")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 5dfb56a..02a71d1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -592,7 +592,7 @@ static int dpu_encoder_virt_atomic_check(
>   		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>   			dpu_rm_release(global_state, drm_enc);
>   
> -			if (!crtc_state->active_changed || crtc_state->active)
> +			if (!crtc_state->active_changed || crtc_state->enable)
>   				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
>   						drm_enc, crtc_state, topology);
>   		}


-- 
With best wishes
Dmitry
