Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCFD3BF95C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 13:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhGHLz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 07:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbhGHLz7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 07:55:59 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99C1C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 04:53:17 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id y42so14677335lfa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 04:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=wwIauJqG7Gi/hYTEAYFKY+sGSvM6txVRYsX5pyUg7p0=;
        b=vzyUGNkXJyqp3cmFX/UEoS55BSzhhySMqae6wQADR19j3ldyo1+Hodr0Vcec3z/5xf
         qfbNt4J8+QEouPpqaEaYNcLM0rA87XnbyZ/WqGU1PfgRfG8jOjSH/aB2XqZEvL+3axiP
         q8YaQKerSvIuQVTYtnQPL0c27j8z0qQkjeYLDzQIMkCVkvvDFrrGrfEq+UMilFb6FTg0
         tdL6U5kxseeyyJSOXkf2zD3YPXh+EnQFA4nti63kSfyptKn8ir9nmjf0WcSGPS68wDQ6
         dh/AlKVZJlv+IWdOeDZnVOIEUUwTXn7BAs1Rn0g09/4HRXLBPGee9df81TWs1arepZh7
         ta+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wwIauJqG7Gi/hYTEAYFKY+sGSvM6txVRYsX5pyUg7p0=;
        b=b8f13IBtd3lbISsekOjM6onAebeNx0Ua3PC3BfH5anjpM9+i272EkslUihFFyqsOF0
         YXDxx+OPePmyu/SLIwxtwlPsrZqSL4R0x4kmZZv3ohyv5G0AZ+3ttNfI9bIj0sX2ffag
         UL0N/2IgOgtvo99KN2s/lJ3GkmzZIRvjsjAGzzZdZ0KjM2tMWFKs7RGlhFa8FLY3HTmL
         9dXHu3fu2Z9qXc3S6hiJV2Tmjl8fbzrZ/BwCRbCu/C0M64G2nAIWAxUN8lN7CuqkMVb8
         GbtxuGrLrYgcswmuIp3nUzEzJBqYxLlNDdQUTTa4iyEbi4JTFb/QTpKx3MDKrZ9jQXsh
         SH5Q==
X-Gm-Message-State: AOAM5323tKZq2EYeBoZa9xeiOlzCehGtxlE18Y7R35DfPfKCmZWL5+8h
        1puk8Gk8TlISTvKIkcwXPbWpzA==
X-Google-Smtp-Source: ABdhPJwi6G52+QBplPSlAE010D60rWMKeJMxYbrPXzlFrjZlA/ij//cKAm8k5rwoCAyrTlb65wribw==
X-Received: by 2002:a19:858b:: with SMTP id h133mr4514517lfd.656.1625745195941;
        Thu, 08 Jul 2021 04:53:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u16sm220527ljj.113.2021.07.08.04.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 04:53:15 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/mdp5: fix 64-bit division in bandwidth
 calculation
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20210622080348.1679589-1-dmitry.baryshkov@linaro.org>
Message-ID: <d41cf4c6-0368-75ad-3dcf-561e283a22ec@linaro.org>
Date:   Thu, 8 Jul 2021 14:53:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622080348.1679589-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/06/2021 11:03, Dmitry Baryshkov wrote:
> Fix undefined symbols errors arising from 64-bit division on 32-bit
> arm targets. Add 64-bit version of mult_frac and use it for calculating
> bandwidth.
> 
> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undefined!
> 
> Fixes: 7e0230fd096c ("drm/msm/mdp5: provide dynamic bandwidth management")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We are reworking now bandwidth management for mdp5, so both the original 
patch and the fix can be ignored for now.

> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  2 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   |  5 ++++-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c |  2 +-
>   include/linux/math.h                       | 13 +++++++++++++
>   4 files changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> index a9332078aa13..52724d0a6fea 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c
> @@ -755,7 +755,7 @@ static int mdp5_crtc_atomic_check(struct drm_crtc *crtc,
>   	hw_cfg = mdp5_cfg_get_hw_config(mdp5_kms->cfg);
>   
>   	if (hw_cfg->perf.ab_inefficiency)
> -		crtc_bw = mult_frac(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
> +		crtc_bw = mult_frac_ull(crtc_bw, hw_cfg->perf.ab_inefficiency, 100);
>   	mdp5_cstate->new_crtc_bw = crtc_bw;
>   
>   	/*
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 3e1b28d3e41b..85b7093a1218 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -301,6 +301,7 @@ static const struct mdp_kms_funcs kms_funcs = {
>   void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
>   {
>   	int i;
> +	u64 bw;
>   	u32 full_bw = 0;
>   	struct drm_crtc *tmp_crtc;
>   
> @@ -311,7 +312,9 @@ void mdp5_kms_set_bandwidth(struct mdp5_kms *mdp5_kms)
>   		if (!tmp_crtc->enabled)
>   			continue;
>   
> -		full_bw += Bps_to_icc(to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw / mdp5_kms->num_paths);
> +		bw = to_mdp5_crtc_state(tmp_crtc->state)->new_crtc_bw;
> +		do_div(bw, mdp5_kms->num_paths * 1000); /* Bps_to_icc */
> +		full_bw += bw;
>   	}
>   
>   	DBG("SET BW to %d\n", full_bw);
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> index 85275665558b..2ede34177a90 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
> @@ -191,7 +191,7 @@ static void mdp5_plane_calc_bw(struct drm_plane_state *state, struct drm_crtc_st
>   		prefill_div = vbp + vpw + vfp;
>   #endif
>   
> -	pstate->plane_bw = max(plane_bw, mult_frac(plane_bw, hw_latency_lines, prefill_div));
> +	pstate->plane_bw = max(plane_bw, mult_frac_ull(plane_bw, hw_latency_lines, prefill_div));
>   }
>   
>   static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
> diff --git a/include/linux/math.h b/include/linux/math.h
> index 53674a327e39..1327385905df 100644
> --- a/include/linux/math.h
> +++ b/include/linux/math.h
> @@ -118,6 +118,19 @@
>   }							\
>   )
>   
> +#define mult_frac_ull(x, numer, denom)(			\
> +{							\
> +	typeof(x) quot = (x);				\
> +	typeof(x) rem;					\
> +	do_div(quot, (denom));				\
> +	rem = (x) - quot * (denom);			\
> +	rem = (rem * (numer));				\
> +	do_div(rem, (denom));				\
> +	(quot * (numer)) + rem;				\
> +}							\
> +)
> +
> +
>   #define sector_div(a, b) do_div(a, b)
>   
>   /**
> 


-- 
With best wishes
Dmitry
