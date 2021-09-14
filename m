Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5BF440A27A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 03:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbhINB35 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 21:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229825AbhINB35 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 21:29:57 -0400
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B0E7C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:28:41 -0700 (PDT)
Received: by mail-ot1-x329.google.com with SMTP id k12-20020a056830150c00b0051abe7f680bso16058621otp.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 18:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=1iyEkjOspz1YHSZHaH57x8hyXl0nLGx/16zCo4qzljY=;
        b=Tul4Quso1sZ207HiO8jFYq9hTqO+BCojLOgrdEXHGGbHVUFXmyNkDGbglwl0FW93zC
         L+RZ9IiQ8+3BBHc5yuu047ayDXEw05KS4A6NjUoLO2QQAie6moBVa+dr7LR667B4iDzJ
         pjh80uBN8NZKxP/g2j9hoq7Yki43v2L2hdnYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=1iyEkjOspz1YHSZHaH57x8hyXl0nLGx/16zCo4qzljY=;
        b=a1U+AmmS2eFnV8C1hVSYs+w8uELQIvV2RboxHAHiMLWdQxFodzDyQzbXJrcFub5cIu
         jRolrC+ZcRbktSVBijWei4XSM/DioHuwYczQDSEBKnoH7oFpbTBwdWsIwMwfwSQUTuaI
         JXPIPR/JkMrL8x/7aWBc/44QAD8BwMoqqnSEryip21odblYMFAkPT0AEdBEDY02w8JYu
         EEu0n6MTPNcW/QWBkVGHG02iNxYkDur7+r8MLADoxFlChEMz7aziiiPUm0A0uEG8UMlG
         QOW91K6qi9Xc7TNE4MSpgorKHvc+Essy5QdkMOBnJ8uKSMVGrO42DGSqxkyRJz05tKCc
         palA==
X-Gm-Message-State: AOAM5338EMDQO3iPDqeljMlkuF2AC6AJ889OvVlQQ7mmH/WvaNUHblkp
        yWd00+KNlkMxV6rkXWnK/U/YVoYAJcetwMGFj6h7bw==
X-Google-Smtp-Source: ABdhPJxiz7kY7hb1EpH/a+L2f+xpsb4urURtmhr4zIGOU4NpfdsFNt7CDlKp7ojpYl5biW2svbBuKdfBR4HRic5UJvg=
X-Received: by 2002:a05:6830:719:: with SMTP id y25mr12267405ots.77.1631582920355;
 Mon, 13 Sep 2021 18:28:40 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 13 Sep 2021 18:28:39 -0700
MIME-Version: 1.0
In-Reply-To: <20210913175747.47456-14-sean@poorly.run>
References: <20210913175747.47456-1-sean@poorly.run> <20210913175747.47456-14-sean@poorly.run>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date:   Mon, 13 Sep 2021 18:28:39 -0700
Message-ID: <CAE-0n50DybNUXSQOaPQ56-Ge56tmG8JDkPuzWnQf-S5Y++AnVA@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm: Add hdcp register ranges to sc7180 device tree
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Sean Paul (2021-09-13 10:57:44)
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch adds the register ranges required for HDCP to the sc7180
> device tree. These registers will be used to inject HDCP key as well as
> toggle HDCP on and off.

It doesn't look to do any of that?

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_parser.c | 30 +++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_parser.h |  4 ++++
>  2 files changed, 31 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 0519dd3ac3c3..4bbe2485ce3c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -20,11 +20,19 @@ static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
>  };
>
>  static int msm_dss_ioremap(struct platform_device *pdev,
> -                               struct dss_io_data *io_data)
> +                               struct dss_io_data *io_data, const char *name,
> +                               int fallback_idx)
>  {
>         struct resource *res = NULL;
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       res = platform_get_resource_byname(pdev, IORESOURCE_MEM, name);
> +
> +       /* Support dts which do not have named resources */

Please no. Just use index and know that 0 is the dp hardware, 1 is the
hdcp key and 2 is the tz interaction zone. There is some backwards
compat logic to maintain for when it was split out but I hope we can
drop that soon. Alternatively we could make a new compatible and then
not care about future conflicts.

> +       if (!res) {
> +               if (fallback_idx >= 0)
> +                       res = platform_get_resource(pdev, IORESOURCE_MEM,
> +                                                   fallback_idx);
> +       }
>         if (!res) {
>                 DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
>                         __builtin_return_address(0), __func__);
> @@ -55,6 +63,8 @@ static void dp_parser_unmap_io_resources(struct dp_parser *parser)
>  {
>         struct dp_io *io = &parser->io;
>
> +       msm_dss_iounmap(&io->hdcp_tz);
> +       msm_dss_iounmap(&io->hdcp_key);
>         msm_dss_iounmap(&io->dp_controller);
>  }
>
> @@ -64,12 +74,26 @@ static int dp_parser_ctrl_res(struct dp_parser *parser)
>         struct platform_device *pdev = parser->pdev;
>         struct dp_io *io = &parser->io;
>
> -       rc = msm_dss_ioremap(pdev, &io->dp_controller);
> +       rc = msm_dss_ioremap(pdev, &io->dp_controller, "dp_controller", 0);
>         if (rc) {
>                 DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
>                 goto err;
>         }
>
> +       rc = msm_dss_ioremap(pdev, &io->hdcp_key, "hdcp_key", -1);
> +       if (rc) {
> +               DRM_INFO("unable to remap dp hdcp resources, rc=%d\n", rc);
> +               io->hdcp_key.base = NULL;
> +               io->hdcp_key.len = 0;
> +       }
> +
> +       rc = msm_dss_ioremap(pdev, &io->hdcp_tz, "hdcp_tz", -1);
> +       if (rc) {
> +               DRM_INFO("unable to remap dp hdcp resources, rc=%d\n", rc);

These shouldn't be info messages. Also, the ioremap wrapper already
prints the message that it failed so these are redundant.

> +               io->hdcp_tz.base = NULL;
> +               io->hdcp_tz.len = 0;
> +       }
> +
>         io->phy = devm_phy_get(&pdev->dev, "dp");
>         if (IS_ERR(io->phy)) {
>                 rc = PTR_ERR(io->phy);
