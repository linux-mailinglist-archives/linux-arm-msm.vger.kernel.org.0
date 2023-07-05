Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27E7748025
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jul 2023 10:53:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232211AbjGEIxU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jul 2023 04:53:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjGEIxR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jul 2023 04:53:17 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1979D
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jul 2023 01:53:16 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b6ef9ed2fdso35941021fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jul 2023 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688547194; x=1691139194;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b/t8zNVTVsg6ienlpH1xhpP3oVWDvisuW/kxWCPhPP0=;
        b=cpm9X//SVQob0n3MjLFkivgbMHtONndE1zDnTrbx0YHqGfdVRU2UrX0P99g9YorsaW
         h5nI8n1UwT1L/MOqA6TDen8C4j9jmAwoz4j16Dpp68iSpGr8JhtY4SjGso98NaA967U6
         AFDIRc1rer8zxF2pfhgo45YWfnUtQNkKgYViqmqnu+ImiecgSNVoeTUqKkOto8Zngx5U
         r5VdvruhmHifZu+XNUETLZnn5YBTkLZyItura4YlO0mxwkx58tSOehXxxqv+r7lNI/7n
         oRMnBHnOpPFFqiizWI5na/xnroCdQvCsZ743j0ZR1VmsRHQuD/GEShGeM3SktrptkesQ
         +JSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688547194; x=1691139194;
        h=content-transfer-encoding:in-reply-to:subject:organization
         :references:cc:to:content-language:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b/t8zNVTVsg6ienlpH1xhpP3oVWDvisuW/kxWCPhPP0=;
        b=I96Ml+8yyvQwlXDgyQA8NHN9dDSCbReTkj972nANKyMdkX6jqRoY8MUUxj3cgstnf5
         X3NSnjmzt1QfSLLmOcZ+sE5gwm1Ywkp+eDb8CZ2Asewk0IJ1Jg7Cez29FzPIjX4Ltk1m
         dWN53AXLPeTZP01nAyFDBkLMj2xVht0GrAaRwjK4S2PSqC7QyasE7L2bnLcLrLjLw0+h
         sF3QfbA3a5c1hn9lxoFSxO3+bdhafW1/0bsn1rG6HLQNEqKo3YUmBwMgTfoKTkN0tHBs
         gKs9Tvn7fCKUwrmuTRiBS/zOmQbZHn2AkG+dyb4optGvhfTbHQ1ovvnWyupOz9ZJYnIV
         v24A==
X-Gm-Message-State: ABy/qLZrTuYSd9+KT3ibs1VnEhNM53X+SfRPrlOyW8kRtNQ9MYP7ZOkD
        Tex7oc/xy6ytVmOnTLpZ+4lV+g==
X-Google-Smtp-Source: APBJJlHOl9QSHA5N0yXsvfULsijCC69VokhWE58vijIuLlqSVU54KuRRZmPjfvqL69mnb9h+eEINGQ==
X-Received: by 2002:a2e:8ec3:0:b0:2b6:d631:a1a0 with SMTP id e3-20020a2e8ec3000000b002b6d631a1a0mr9872081ljl.12.1688547194393;
        Wed, 05 Jul 2023 01:53:14 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:65eb:d140:2d45:ee85? ([2a01:e0a:982:cbb0:65eb:d140:2d45:ee85])
        by smtp.gmail.com with ESMTPSA id z5-20020a05600c220500b003fba6709c68sm1458806wml.47.2023.07.05.01.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 01:53:13 -0700 (PDT)
Message-ID: <92b1146c-be79-4d27-0444-cfc2125547e2@linaro.org>
Date:   Wed, 5 Jul 2023 10:53:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Content-Language: en-US
To:     Jonathan Marek <jonathan@marek.ca>, freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kalyan Thota <quic_kalyant@quicinc.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20230704160106.26055-1-jonathan@marek.ca>
Organization: Linaro Developer Services
Subject: Re: [PATCH] drm/msm/dpu: add missing flush and fetch bits for
 DMA4/DMA5 planes
In-Reply-To: <20230704160106.26055-1-jonathan@marek.ca>
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

On 04/07/2023 18:01, Jonathan Marek wrote:
> Note that with this, DMA4/DMA5 are still non-functional, but at least
> display *something* in modetest instead of nothing or underflow.
> 
> Fixes: efcd0107727c ("drm/msm/dpu: add support for SM8550")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index bbdc95ce374a..52222af5975f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -51,7 +51,7 @@
>   
>   static const u32 fetch_tbl[SSPP_MAX] = {CTL_INVALID_BIT, 16, 17, 18, 19,
>   	CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, CTL_INVALID_BIT, 0,
> -	1, 2, 3, CTL_INVALID_BIT, CTL_INVALID_BIT};
> +	1, 2, 3, 4, 5};
>   
>   static const struct dpu_ctl_cfg *_ctl_offset(enum dpu_ctl ctl,
>   		const struct dpu_mdss_cfg *m,
> @@ -206,6 +206,12 @@ static void dpu_hw_ctl_update_pending_flush_sspp(struct dpu_hw_ctl *ctx,
>   	case SSPP_DMA3:
>   		ctx->pending_flush_mask |= BIT(25);
>   		break;
> +	case SSPP_DMA4:
> +		ctx->pending_flush_mask |= BIT(13);
> +		break;
> +	case SSPP_DMA5:
> +		ctx->pending_flush_mask |= BIT(14);
> +		break;
>   	case SSPP_CURSOR0:
>   		ctx->pending_flush_mask |= BIT(22);
>   		break;

It permits displaying something, but the output is still corrupted on both DMA4 & DMA5,
tested with multiple plane sizes and formats.

modetest -P 81@93:1080x2400
and
modetest -P 87@93:1080x2400

Photo of actual display:
https://people.linaro.org/~neil.armstrong/sm8550-dma5.jpg

Works fine with DMA2 & DMA3 planes with same parameters.

Tested with https://patchwork.freedesktop.org/patch/538277/?series=118074&rev=1, and it doesn't change anything.

I think this is still accurate:
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD

Thanks,
Neil
