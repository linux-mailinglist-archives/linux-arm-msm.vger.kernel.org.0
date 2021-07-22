Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE963D2D31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jul 2021 22:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbhGVT2r (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 15:28:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230439AbhGVT2q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 15:28:46 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 691CCC061575
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:09:21 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id e11so7894856oii.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Jul 2021 13:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=BcJKTAd+SXCAq4+hK48A80n6j+MuUYA2uIh6BPZjR1U=;
        b=XVta9Wlk5xmpjfpjS6T5NbLjP3uLbxw2D8WZfnnBKiRY+DboAIeHHwVOmWSalHNbyC
         vaoX7QNxDNK8fhyBBOCLbgeQJn3RlCAo6mhjnI7LFAITkc7tjyfbYjdbe/aGiO0EvPzZ
         0TpyT9gbFRPBz8jRAUJoZTesVCz2w5sDTfLhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=BcJKTAd+SXCAq4+hK48A80n6j+MuUYA2uIh6BPZjR1U=;
        b=a2iPZ9Ct9yQOiqot+9snBSCQbVe5sRoRhNyyMqLCNDnDngLzJaMPkUq5apDOiCh6V/
         UBJUlZQG+VoDhPj5dmBg/sBQPjYCLmPMJMMMYDPUjh4MjbDt5hxFaeVR+RnqaGioMaG7
         R1aFnHV/uSfgYrCPi4gto4ueYY7vB+zySZ74Nml2ogaJBhBGvWiDpPTb7QlbNs+S26++
         VVEjvpreu8R8ET6XL+N+/+bZLmW6Md1QSdsMmjtsmfgCYdwv9Pcv1yCpcnYJmYcg2X6f
         Pcg0Qn41mjCT/77jvJvqJXsvClSoy+bjD1pReHqy1XPaA62eAIvgCPO7y3oJqOLzyz8H
         Jjjg==
X-Gm-Message-State: AOAM533Lnnr5tQkdbhL4CcrOlU4dV7GekAtnooYfPEvNZoRA2MoIn5K+
        zCe0BatyRmQwJM8wnL6QYMoGOoALKATQ8nDnn3ohPA==
X-Google-Smtp-Source: ABdhPJyQAOc9yd5za8sXc+wp9Ht2s4bknqPuzxNR8G6jAhR6yKwtH3h66wVrY3lRyd3R7fQIVIs1wnidXeQUJ7kSPmo=
X-Received: by 2002:aca:4dc6:: with SMTP id a189mr7098582oib.166.1626984560867;
 Thu, 22 Jul 2021 13:09:20 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:09:20 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-4-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org> <20210722024227.3313096-4-bjorn.andersson@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Thu, 22 Jul 2021 20:09:20 +0000
Message-ID: <CAE-0n50_Q7AtxGpU_MrcbFRwJRXAS+SEhZid1jyouh6DceUnVw@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/dp: Refactor ioremap wrapper
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

Quoting Bjorn Andersson (2021-07-21 19:42:25)
> In order to deal with multiple memory ranges in the following commit
> change the ioremap wrapper to not poke directly into the dss_io_data
> struct.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 28 ++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_parser.h |  2 +-
>  2 files changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index c064ced78278..e68dacef547c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -19,39 +19,39 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
>         },
>  };
>
> -static int msm_dss_ioremap(struct platform_device *pdev,
> -                               struct dss_io_data *io_data)
> +static void __iomem *dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
>  {
>         struct resource *res = NULL;

Can we drop assignment to NULL too?

> +       void __iomem *base;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, idx);
>         if (!res) {
>                 DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
>                         __builtin_return_address(0), __func__);
> -               return -ENODEV;
> +               return ERR_PTR(-ENODEV);
>         }
>
> -       io_data->len = (u32)resource_size(res);
> -       io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
> -       if (!io_data->base) {
> +       base = devm_ioremap_resource(&pdev->dev, res);
> +       if (!base) {

devm_ioremap_resource() returns an ERR_PTR on failure, not NULL.

>                 DRM_ERROR("%pS->%s: ioremap failed\n",
>                         __builtin_return_address(0), __func__);
> -               return -EIO;
> +               return ERR_PTR(-EIO);
>         }
>
> -       return 0;
> +       *len = resource_size(res);
> +       return base;
>  }
>
>  static int dp_parser_ctrl_res(struct dp_parser *parser)
>  {
> -       int rc = 0;
>         struct platform_device *pdev = parser->pdev;
>         struct dp_io *io = &parser->io;
> +       struct dss_io_data *dss = &io->dp_controller;
>
> -       rc = msm_dss_ioremap(pdev, &io->dp_controller);
> -       if (rc) {
> -               DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
> -               return rc;
> +       dss->base = dp_ioremap(pdev, 0, &dss->len);
> +       if (IS_ERR(dss->base)) {
> +               DRM_ERROR("unable to remap dp io region: %pe\n", dss->base);
> +               return PTR_ERR(dss->base);
>         }
>
>         io->phy = devm_phy_get(&pdev->dev, "dp");
