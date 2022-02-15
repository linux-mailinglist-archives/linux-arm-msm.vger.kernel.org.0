Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 570FC4B72E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Feb 2022 17:42:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240921AbiBOPmw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 10:42:52 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240541AbiBOPmm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 10:42:42 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CA81D2279
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:37:41 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id x6-20020a4a4106000000b003193022319cso1082938ooa.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 07:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/RGLD8nwzu2VhuFoIMV+jbsfE56tgO0QtQZcVsmbSeg=;
        b=l6fAXQm8Wcu/W89W5Bq27vFP7GjHxqydLmmOHkiwoIcJ5mOuVMXHyvROhRRg5u5a0c
         7BjNXoiLUfV1nrjmUKiPnbXoWXbOpl1wODxwPb7Y4zWa86tC3ZvMeakI+b+Zaim6YptS
         CMl6kvWf8GkgRqem5iMddRtOT4fuuRF9rNCnkkga9+nMemDSXeVOZQi5ThxDyehk+l13
         DXWiGZ1apMEofA/mqweXCHhuYRcjpMEn1yuQ/dZzPPhODZSoj5ucfAxb+y/M+s0xD6a9
         qIwrgQbPg6F0SBP2goXQuxJZ9NMMlnKDEjDOgoQTGypS6w8LVst+mE4/tthr00fdXrOq
         P5gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/RGLD8nwzu2VhuFoIMV+jbsfE56tgO0QtQZcVsmbSeg=;
        b=wsFiDljWPyr7YfPt+x6DbVS/LQhohtgfPFj+ahHrxiunakOCQwRf37DZwU0OyOF/kG
         GEmLZJmdejqYCST3DEyFvptX0JrIowqiL5imerwxgKXUm1217Nk4awloH0j7b5YTW9o8
         leMaZDVLZ1xVy3ZelKtQkiBHLeF3ZN1sMqTAAh+NkTuPSQ8bon6A6PfUdYPT0952ZnSm
         R2pV/DGDQufUEgFuBe3fway4rwkd09hup8f3HjgaiEVUuasdzE5A9/rxK/gmqvw3zxS/
         yF4M2FMerLkXpne8xCDFU8VzLP87VfdptWnmVTUlMFHohPOT/kdnhZjUs/EgVI8U1TfP
         9ueQ==
X-Gm-Message-State: AOAM532xWD0f936GxHYpFY6wjnZQNrt4DMgJoIiq874vqRcl7bykUJpy
        MOdNyCFMmP6m61gIU9hfPPT9IKS+KJ5J4Q==
X-Google-Smtp-Source: ABdhPJyweGcF6YG2GJE+SrOC7EUNHhPllRZZN6Fn7aiHfQp4+viH4TuuPxXPv6Gg6s2fCnuNRok5QQ==
X-Received: by 2002:a05:6870:5ba5:b0:d1:9c2d:975f with SMTP id em37-20020a0568705ba500b000d19c2d975fmr1613502oab.325.1644939459658;
        Tue, 15 Feb 2022 07:37:39 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
        by smtp.gmail.com with ESMTPSA id t22sm14343175oiw.2.2022.02.15.07.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 07:37:39 -0800 (PST)
Date:   Tue, 15 Feb 2022 09:37:36 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/8] drm/msm/dpu: fix dp audio condition
Message-ID: <YgvIwLa8dGx/JqIR@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 15 Feb 08:16 CST 2022, Dmitry Baryshkov wrote:

> DP audio enablement code which is comparing intf_type,
> DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
> Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.
> 
> Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 132844801e92..c59976deb1cb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
>  	}
>  
>  
> -	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
> +	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
>  		dpu_enc->cur_master->hw_mdptop &&
>  		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
>  		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
> -- 
> 2.34.1
> 
