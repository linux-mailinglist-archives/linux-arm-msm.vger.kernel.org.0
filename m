Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EE8C3D2D20
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 22:07:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhGVT00 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 15:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbhGVT0Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 15:26:25 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C4D0C061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:07:00 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id j1-20020a0568302701b02904d1f8b9db81so6408367otu.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=O8dDgSeZjlhPao9QRuOYxkfISrHgO2l6PhjYbW5g3pw=;
        b=X2bvxtNR79OkmCWe08P/hN6fnPvQe9zDyBpX7Jxdc1kokI00XqWy/PrsXfH00R/5Ao
         zIw0o3tfvhRxvR6mGy/yo6dPMohc9RnVqfU8OowzBL4AynRk9iY261MysIDm+juXfIBS
         AkPkXyg7xi6gdmy/bIpZpo5OcSzAyalfJlubI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=O8dDgSeZjlhPao9QRuOYxkfISrHgO2l6PhjYbW5g3pw=;
        b=V6QlJAfhiIPeL8PedK2k4JiSdyUm7p2UTOY6ueaJt+A3w+PV3L6PW9h0l58DH4iyJ8
         Fd3nsTjWsyim4Mrd13m3/TlnQgFf+pE/G2is/dAtVtaf2SXKH04MnfGYN0AblDPNdr/I
         DAwccGCqkSO8rhau+xNIJY4zh6RxR1BDNOZeweDhqfux6msvvvlPXDQlVeCWgSUtKS8X
         8HJF1WXN6ywTK84s9bnFKM0DshLn29kk4k2JGAHtnzSZygnq3BnRNqDl/vp7rXyPjI6V
         yjtV7CwkxYz4JSxpjH7MrzxR4/aEdDuqQvvRnF9M2UeAYH39ZMLQPIwEjMQuwnG7Gq6T
         DLQg==
X-Gm-Message-State: AOAM5303eu60CdFgMsCVu1ph2227xkn21gxp2mJai8SDxtOBbRUcA6zm
        xr4Op0bIO1IdHobdwvilVficXOesKEdR6Jt1bSsZGg==
X-Google-Smtp-Source: ABdhPJwldBK47Or1p1ivwfzx0ETv9cQ7IC2/MrivbSo7ScqHLOOcpcP56sV3AD4XttYcPbUS++a1HNWU0OWyQn9YNNI=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr978424otf.25.1626984419283;
 Thu, 22 Jul 2021 13:06:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:06:58 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-3-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org> <20210722024227.3313096-3-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 20:06:58 +0000
Message-ID: <CAE-0n53QF1vmjQDcWX8U3UFu=JtjGrK-XNk-1hcm64iRBPNYMA@mail.gmail.com>
Subject: Re: [PATCH 2/5] drm/msm/dp: Use devres for ioremap()
To:     Abhinav Kumar <abhinavk@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Clark <robdclark@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Cc:     Kuogee Hsieh <khsieh@codeaurora.org>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Bjorn Andersson (2021-07-21 19:42:24)
> The non-devres version of ioremap is used, which requires manual
> cleanup. But the code paths leading here is mixed with other devres
> users, so rely on this for ioremap as well to simplify the code.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dp/dp_parser.c | 29 ++++-------------------------
>  1 file changed, 4 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 0519dd3ac3c3..c064ced78278 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -32,7 +32,7 @@ static int msm_dss_ioremap(struct platform_device *pdev,
>         }
>
>         io_data->len = (u32)resource_size(res);
> -       io_data->base = ioremap(res->start, io_data->len);
> +       io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
>         if (!io_data->base) {
>                 DRM_ERROR("%pS->%s: ioremap failed\n",
>                         __builtin_return_address(0), __func__);

I don't think we need this print either, but that can come later in
addition to using devm_platform_get_and_ioremap_resource().
