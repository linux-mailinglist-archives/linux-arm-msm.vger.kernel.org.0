Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FBE16CC101
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Mar 2023 15:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233230AbjC1NdB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Mar 2023 09:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233241AbjC1Ncz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Mar 2023 09:32:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A152ACA37
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:32:29 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id br6so15808172lfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Mar 2023 06:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680010347;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g02I1W6mgzmeB+62dRygpCTPnE6RlAEOPRopZrV7ckA=;
        b=sf1yYrLlvBSGwzL1Un+i29aDzjasFLnSZhFW526cxcgMFgnfqOTSddOEBHgTScrpIa
         J+p0RpULbpctLyQKOO2qE0K6zcnhLMZCk74vvtTei5jaksAwAP2UA1j7rObotVXIxEq5
         e7BPkSVXwNz7wgvaSR8TdOTjzJ4kId9OPXn8NL2MBqhpN1rFTL2h15NjIPxwx674jFLB
         LkX5JDGsLIbvFmMCe1lnj3DxsAy6IamOSOXD/oA2a2hUQR6DtTDLrsXdaJIV/PKZcita
         UMCe0CgszasSZlrevI10jSWaiBYGJRatIKtDUoSdVBD7nPO/1HTUKEGnlrEvbFlDBdFH
         Xb6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680010347;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g02I1W6mgzmeB+62dRygpCTPnE6RlAEOPRopZrV7ckA=;
        b=ZUVXrTfV9fwy3RVTz8WzDxXbHkg36DbVPlyh7jku9nI0MS/8NrfQS75ACbdgpsTI6c
         D7DanqnuTMhdJpPEyvZYroibvsbiVqMRGtdWsq0Gbm2seaEEDYyheYyKdQaYDxfOJJDn
         vvRFsKFt5Jy4Vbc+rC9ouGrdemvFsEffj99ue1YvcdLslsxSjxRBkp3MRiZMOsDwpAGq
         +tuivV2zdas64y2ra21adyrNYCJYgR4PVvBNFrwn82lsq9pJctQbJr7IQCq7stP8s/bS
         xzv9b4KCH35gtKy0YGFlGnVUeUwHtltl1o4gjGjXTZWNmM/skOLhyJSmOd9W233vwDZu
         0qmg==
X-Gm-Message-State: AAQBX9d5LiEW3wZsNFfoD7Vmy118r8xXbxj+fj0Rij6Joi4gNnyYHWUl
        tqJrdMUkZK5jyV2Jec5+/6UE4Q==
X-Google-Smtp-Source: AKy350YA6+0RXq22Tp/f/x252Y9jHRcmh25+pxyJTdeF2GZpGC2jRnFljCQzR5U24g0I1wztOHrRRA==
X-Received: by 2002:ac2:5dee:0:b0:4ea:f74f:c077 with SMTP id z14-20020ac25dee000000b004eaf74fc077mr4982273lfq.12.1680010347125;
        Tue, 28 Mar 2023 06:32:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v3-20020a056512048300b004cc5f44747dsm5103824lfq.220.2023.03.28.06.32.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 06:32:26 -0700 (PDT)
Message-ID: <9c498192-f82d-cea9-17cb-80cb81b67714@linaro.org>
Date:   Tue, 28 Mar 2023 16:32:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v7 31/32] drm/msm/dpu: log the multirect_index in
 _dpu_crtc_blend_setup_pipe
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230316161653.4106395-1-dmitry.baryshkov@linaro.org>
 <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230316161653.4106395-32-dmitry.baryshkov@linaro.org>
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

On 16/03/2023 18:16, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Lets print the multirect_index as well in _dpu_crtc_blend_setup_pipe()
> as it will give the complete information of the sw_pipe as well.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

For the sake of completeness:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 90b406e409d3..508e5b950e52 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -426,12 +426,13 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>   				   format->base.pixel_format,
>   				   modifier);
>   
> -	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
> +	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
>   			 crtc->base.id,
>   			 stage,
>   			 plane->base.id,
>   			 sspp_idx - SSPP_NONE,
> -			 state->fb ? state->fb->base.id : -1);
> +			 state->fb ? state->fb->base.id : -1,
> +			 pipe->multirect_index);
>   
>   	stage_cfg->stage[stage][stage_idx] = sspp_idx;
>   	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;

-- 
With best wishes
Dmitry

