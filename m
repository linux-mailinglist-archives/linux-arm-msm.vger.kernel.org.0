Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 716734F5AC2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 12:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233209AbiDFKIK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Apr 2022 06:08:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236595AbiDFKGu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Apr 2022 06:06:50 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D06924371D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 18:59:44 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id k25-20020a056830151900b005b25d8588dbso822989otp.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 18:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=jv43f2rrIHjk1Fj7wJPYOjxueyGmJxQafkTafIj1hDc=;
        b=e2thw7ORFBl8BjqnMIlCXWzL8TEvHVFQvm51vKJ6HZWpwH+ikEQJ9uUr0XXWzGW/LA
         yvYoh4bLmeNTMzkPCkk//kXR/dxKm75XLsoiBJ1Al+b52tsq58jDPpGQv+E9tLhjL83i
         YLYPRMTNSc565Jq1KFxV+EQkYyiXSwK32k/7w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=jv43f2rrIHjk1Fj7wJPYOjxueyGmJxQafkTafIj1hDc=;
        b=SMUBxPXFoSnQ/RBVx3hduoyTehonFtaEui/LxT5Iemr2a4XhoaoII0JPXSnZQ6jEPR
         bMt6iCTZvl7Z0RI3XCj/iLkamoTGxbKml0gCCgqqHuasSAP5iou2M014FmdKR7BWBBOx
         S4+dVysUTESKAllnZI2jsbRgRQScGxB3L74PCdy1yl9iAI85aJZkc/f5OIfZtPqiuZnD
         RRRskDUM+iKbBWPENK7olBuHLdXaWyGLPufS9Us15VRnB4lRWACti3i3uF8+btuRQwAV
         SHgcHNKCsC7Mm9mSI+RrQpc16FaihNRyBVBmm64zxXHhN5tfv7F8Wqn7T3DYB0gbBD6V
         vwyw==
X-Gm-Message-State: AOAM532FltOTfi/EdGQkroYyN94/jEx97ecM5F81Kv5MvViR2EVLo0Nv
        5MHPOgkRu+hPgXcgWe7ydp3rPIwolReg+MAkWMBI6Q==
X-Google-Smtp-Source: ABdhPJzJE9a18gRAhOd6LPf+zCiWM3yrZAtlUUjLRrak7Q4fo7tUpBr2ScsKEhil00lOrpnbqc7pUFELqtLxYKz0Tiw=
X-Received: by 2002:a9d:b85:0:b0:5cb:3eeb:d188 with SMTP id
 5-20020a9d0b85000000b005cb3eebd188mr2258425oth.77.1649210383948; Tue, 05 Apr
 2022 18:59:43 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Apr 2022 18:59:43 -0700
MIME-Version: 1.0
In-Reply-To: <20220405234121.358948-1-dmitry.baryshkov@linaro.org>
References: <20220405234121.358948-1-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 5 Apr 2022 18:59:43 -0700
Message-ID: <CAE-0n52u=wx403GmAvccbk1JgOgK4zz+MTBS60hvJT701WdKHA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: remove unused plane_property field from msm_drm_private
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-04-05 16:41:21)
> Remove from struct msm_drm_private unused field plane_property.
>
> Fixes: 7d36db0be3b9 ("drm/msm/mdp5: switch to standard zpos property")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.h | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index ee3093890d97..3bce127953ec 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -192,9 +192,6 @@ struct msm_drm_private {
>         unsigned int num_bridges;
>         struct drm_bridge *bridges[MAX_BRIDGES];
>
> -       /* Properties */
> -       struct drm_property *plane_property[PLANE_PROP_MAX_NUM];
> -

Can we remove PLANE_PROP_MAX_NUM too?
