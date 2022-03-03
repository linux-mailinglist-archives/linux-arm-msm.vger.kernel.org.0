Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E764CC740
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 21:47:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231463AbiCCUr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 15:47:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231362AbiCCUr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 15:47:58 -0500
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com [IPv6:2607:f8b0:4864:20::c35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C050DD451
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 12:47:12 -0800 (PST)
Received: by mail-oo1-xc35.google.com with SMTP id x6-20020a4a4106000000b003193022319cso7166638ooa.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 12:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=+Puf4aNWGnBjbMoB3Susur6crhlYcLtx4j9Ip8HC7kA=;
        b=k6W8e10+Uf4sakf0fAoRyizRgUlCGT2fKfRGf7YwCJrtx8hpizrlDmaFiq8woyaLIu
         W+2+qR2dv4+7DFP95rd8s2jg2ZvOv5SouJRZ7Afuui/tPsw9eOVrD0vpNwJnfae5s/1O
         p4+Jh9D3nwk0keSiFtAGFSLDSlgSabeDgSqRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=+Puf4aNWGnBjbMoB3Susur6crhlYcLtx4j9Ip8HC7kA=;
        b=1ETHv5mOja2XiW8LP8YP8aTXHfKJKEJHgrgPRrUl660d2Bb2p8o2tdaSR+pgFLaFXQ
         vK3uZjuV6t9XYSEksGU3+ehcsj/MKhXEWccfzs/IMWx2QF0ySNWMBiA+JlnmeWlV9SN+
         fANGlXq1ynlly3FBH4MzklC6jq9h+kw6F+PJM3A0fa0RiWSl8wc/2GnXUnFNAvVa8mqz
         dwNsmbLe9bAL9OHDcmMKPcQ5bhFSkomBEnYBNFN0aBE731TNDhIYE1djUwPuQte2W1Pk
         Jq10VXiWxnIWxRnzJqESNNYKhV6TmFNdo7EqYbV/8iYqVbtTLkxh8tV9yhHqQDS8IJmL
         xYsA==
X-Gm-Message-State: AOAM530zZdKQpAAUE7Dm59ulHzPo3OKUfNmzMrbOo1bqELZll+AaXscn
        qXRpdT54d8ufGxxXep9t4RGlr3CETtZQmK0OSzGhBA==
X-Google-Smtp-Source: ABdhPJzs1MvRVnkrIzc9Yf/1HC1AcAjxcK4UHZbLjJ8EUNjw5BY9npnsX81bicw0V269DxxbFy1/oRBcFej16mWlsGQ=
X-Received: by 2002:a4a:a9cf:0:b0:2e9:5c75:e242 with SMTP id
 h15-20020a4aa9cf000000b002e95c75e242mr19586044oon.25.1646340431451; Thu, 03
 Mar 2022 12:47:11 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 12:47:10 -0800
MIME-Version: 1.0
In-Reply-To: <20220303194758.710358-4-robdclark@gmail.com>
References: <20220303194758.710358-1-robdclark@gmail.com> <20220303194758.710358-4-robdclark@gmail.com>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 3 Mar 2022 12:47:10 -0800
Message-ID: <CAE-0n532ZX=qXTBKSFyRYAmkqFN7oqKyPvJHBuVMmr2eHY+O4A@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/msm: Add SYSPROF param
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Emma Anholt <emma@anholt.net>,
        Yangtao Li <tiny.windzz@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Rob Clark (2022-03-03 11:46:47)
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index fde9a29f884e..0ba1dbd4e50f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -330,6 +337,24 @@ struct msm_file_private {
>         struct kref ref;
>         int seqno;
>
> +       /**
> +        * sysprof:
> +        *
> +        * The value of MSM_PARAM_SYSPROF set by userspace.  This is
> +        * intended to be used by system profiling tools like Mesa's
> +        * pps-producer (perfetto), and restricted to CAP_SYS_ADMIN.
> +        *
> +        * Setting a value of 1 will preserve performance counters across
> +        * context switches.  Setting a value of 2 will in addition
> +        * suppress suspend.  (Performance counters loose  state across

s/loose  /lose/

> +        * power collapse, which is undesirable for profiling in some
> +        * cases.)
> +        *
> +        * The value automatically reverts to zero when the drm device
> +        * file is closed.
> +        */
> +       int sysprof;
> +
>         /**
>          * elapsed:
>          *
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 7cb158bcbcf6..4179db54ac93 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -7,6 +7,40 @@
>
>  #include "msm_gpu.h"
>
> +int msm_file_private_set_sysprof(struct msm_file_private *ctx,
> +                                struct msm_gpu *gpu, int sysprof)
> +{
> +       /* unwind old value first: */
> +       switch (ctx->sysprof) {
> +       case 2:
> +               pm_runtime_put_autosuspend(&gpu->pdev->dev);
> +               fallthrough;
> +       case 1:
> +               refcount_dec(&gpu->sysprof_active);
> +               fallthrough;
> +       case 0:
> +               break;
> +       }
> +
> +       /* then apply new value: */

It would be safer to swap this. Otherwise a set when the values are at
"1" would drop to "zero" here and potentially trigger some glitch,
whereas incrementing one more time and then dropping the previous state
would avoid that short blip.

> +       switch (sysprof) {
> +       default:
> +               return -EINVAL;

This will become more complicated though.

> +       case 2:
> +               pm_runtime_get_sync(&gpu->pdev->dev);
> +               fallthrough;
> +       case 1:
> +               refcount_inc(&gpu->sysprof_active);
> +               fallthrough;
> +       case 0:
> +               break;
> +       }
> +
> +       ctx->sysprof = sysprof;
> +
> +       return 0;
> +}
