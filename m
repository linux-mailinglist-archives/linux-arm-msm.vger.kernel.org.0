Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F56B3D6A6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 01:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbhGZXOA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Jul 2021 19:14:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233580AbhGZXN7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Jul 2021 19:13:59 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16023C061757
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:54:26 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id t14so13099130oiw.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Jul 2021 16:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=/VLYF7ULvK8ZBgtGaBzY2DEw131HN7Z0pCBHVUvwO54=;
        b=hxr7765n6XazZWlQrt1w5TK6xrOZnmJ0Egyb88XGLVXTWx7fLXIPJFISvBfpxLF/Rm
         xnFRkf4oY5oEMEAaOXSUwOucRnQQ/PcaM5rWWyXmoo60bUMF3vBQ5KPWF/wETQ4jt24+
         CktUVvmDz3kzCaFCDYjeWSqxbuBZmPkr2EoF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=/VLYF7ULvK8ZBgtGaBzY2DEw131HN7Z0pCBHVUvwO54=;
        b=gR36tGai7km+bMqSaZLPD6NsySg95GgtmQbYiih2CHKXYmRaDOADR2w2iGaX82wyD6
         BJUokNsuZOBzJVzvz6nCy2/fge1J5dLGaLAETElOsm2Uq7jv5I/0LTHKhm1K/Jtld3Th
         y8IQ9Le+wmM4fQRavSNGHtMrRw+DDV6YKQ/os85Kw/4mH4rYpIirsx5Ek4zfoGNZY2Kf
         1U7wBSUWqzEb/n3/cQZ1pF17vs7ZvU80PWaR8m6+zKN9J7Vugn7RCDvvMrdCFU1UZGsQ
         7qYjB/AJ+rS+rQ/jO5kCqBPOPQVTWbGQur5lQEK1GxOMA376gLOGs5sfR5EUmUkltc4H
         drgw==
X-Gm-Message-State: AOAM532peHPf4FfDvUa9iCoKSZj/iFH19ZIabX7gE4M8UMyegvDVGXVa
        vLVah3+xbtFoeslaUdEWrpMVKocgUqc1rSZWkkw4FA==
X-Google-Smtp-Source: ABdhPJzd/1nyMLgswv7B9b/xTSfgYdGHuVA0ExUmZ4ifjYmYX/hivyNvHxCzZQ7qLJmY/6pV3kbD/8Sp1ceKx2RVsA0=
X-Received: by 2002:a05:6808:114a:: with SMTP id u10mr13166680oiu.19.1627343665469;
 Mon, 26 Jul 2021 16:54:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 26 Jul 2021 19:54:25 -0400
MIME-Version: 1.0
In-Reply-To: <20210725042436.3967173-7-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org> <20210725042436.3967173-7-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 26 Jul 2021 19:54:25 -0400
Message-ID: <CAE-0n52iQ5XOu=X3sVOyvYddoYRY7bHPc-5GiOwTcnOwLL2_gQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dp: Add sc8180x DP controllers
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-24 21:24:36)
> The sc8180x has 2 DP and 1 eDP controllers, add support for these to the
> DP driver.
>
> Link: https://lore.kernel.org/linux-arm-msm/20210511042043.592802-5-bjorn.andersson@linaro.org/
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 92b7646a1bb7..c26805cfcdd1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -129,8 +129,20 @@ static const struct msm_dp_config sc7180_dp_cfg = {
>         .num_dp = 1,
>  };
>
> +static const struct msm_dp_config sc8180x_dp_cfg = {
> +       .io_start = { 0xae90000, 0xae98000, 0 },
> +       .num_dp = 3,
> +};
> +
> +static const struct msm_dp_config sc8180x_edp_cfg = {
> +       .io_start = { 0, 0, 0xae9a000 },
> +       .num_dp = 3,
> +};

Can the two structs not be combined into one struct and set as .data for
either compatible?

> +
>  static const struct of_device_id dp_dt_match[] = {
>         { .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
> +       { .compatible = "qcom,sc8180x-dp", .data = &sc8180x_dp_cfg },
> +       { .compatible = "qcom,sc8180x-edp", .data = &sc8180x_edp_cfg },
>         {}
