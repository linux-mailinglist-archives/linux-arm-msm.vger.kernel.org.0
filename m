Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CD7A4E69A9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Mar 2022 21:11:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350791AbiCXUMc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Mar 2022 16:12:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346425AbiCXUMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Mar 2022 16:12:31 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63A2AD137
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:10:56 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id q1-20020a4a7d41000000b003211b63eb7bso968508ooe.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Mar 2022 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=tYvk6mZupwR6ob13Q9q/8W1K8ygzY6C/xq72yUYMIqE=;
        b=kcOz4sNHlAPOruy7YCAfNWOY1Gd/j/5RqZFCbHSd3KEUCGEtbWxia0dq3R0vcmxkRU
         vqPA3yD3ug1UmK2QW4h/2ZY29MaIJekC67w+7BZNk7EDgZkZ0pJzb4MyR72evX3wksDl
         HA8f2MHUbOW7qeuHOtp8o++v1e95s8lLdm8sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=tYvk6mZupwR6ob13Q9q/8W1K8ygzY6C/xq72yUYMIqE=;
        b=T15fXGPbLGEGVjdP1TvjrX+vtHecu9rXUawM3D/fZmgqGfpX7nFCUm0Kji+ntzS7fF
         J7QMsU2FN30wVuWw0K6O2bzAO07nfmLmfAM6MzrZbfSX2dWeizF3MmSBurWwxjQeJerL
         YobYc74SilMXBTzzKBsIokrLxukTaivjz/IQjqiCIKGBl2ODOdzxy2zjJXOiDHtnyDrM
         2aM5OSGfyh4CuoyWSxH8TWLRaeVAT2AfzKkxKQy0V4CAoci7I2Vj2Lu9HAqJOFnYRGag
         jeunIrvI1DolG90l0IewQTSgSFFa5Cu+od5Q/O2ozJ+3fbw3vFvQqBW443FroknahccB
         c21A==
X-Gm-Message-State: AOAM533XQTUvOa/rcG33FLtUccL9UPHj3IqnQUtaKPAgAApEVF1gFx/F
        mu+QgYeyidp43P5wRyHpl7z9uNQSu76SJ6+uZaKM/Q==
X-Google-Smtp-Source: ABdhPJzVqotRv3dsKpqXe41FlcBvnEMyajt3qss8lRnEfrhr4dODFNc3DYv6JPQ1uI1GUFupgzeU+ZOO6Qs85MrhkTc=
X-Received: by 2002:a4a:650c:0:b0:324:b0a0:2d23 with SMTP id
 y12-20020a4a650c000000b00324b0a02d23mr2658457ooc.25.1648152656210; Thu, 24
 Mar 2022 13:10:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:10:55 -0500
MIME-Version: 1.0
In-Reply-To: <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org> <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Thu, 24 Mar 2022 15:10:55 -0500
Message-ID: <CAE-0n53pUrV77PiYDpaoNX-wkaiJOWzPApokrk1bQhiWbL_=VQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-03-23 03:35:46)
> Since the last commit, the max_pclk_khz became constant, it's set to
> DP_MAX_PIXEL_CLK_KHZ and never changed afterwards. Remove it completely
> and use DP_MAX_PIXEL_CLK_KHZ directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index af5f1b001192..a94c9b34f397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -88,9 +88,7 @@ static enum drm_mode_status dp_connector_mode_valid(
>
>         dp_disp = to_dp_connector(connector)->dp_display;
>
> -       if ((dp_disp->max_pclk_khz <= 0) ||
> -                       (dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
> -                       (mode->clock > dp_disp->max_pclk_khz))
> +       if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
>                 return MODE_BAD;

Can we have a followup patch to return MODE_CLOCK_HIGH?
