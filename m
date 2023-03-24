Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CAB6C8206
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Mar 2023 17:00:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232032AbjCXQA0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Mar 2023 12:00:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbjCXQAZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Mar 2023 12:00:25 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 800FB21A0C
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 09:00:24 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id p15so2722908ybl.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Mar 2023 09:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679673623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dksB5iUeGdRvRQe9WabXTIoiziL1Tg7lbGcFiUozL5I=;
        b=huop7HKeUTs3oNm4X0dfZWPkxEHd4eJSM7/8AC63zKy1bhtOPpkACHUgplxCr5og6y
         7n8O59piNxsAXGmaYOCSFrc1iUlq59lyB+TYuD1irJs1a2dJymlJ+dWHvAtKks3Wy8rZ
         weDFNYJfiDOuqkTOG+FQ2Ek+UXUoMeN8S+kWzRWsNCQ2Mu0BnWEP77XxF8nQPBJUUyhy
         JZT3oRqB1Uc+l2f/tsTkM3x5Zbes3NPzIUnW8ZCaJuJyo10XBlfSLYpm8jMXhWKMABKD
         sj201UpqF9QsEv6F2+G8qFHpwF8sVDihFncbKo7nPat7oJTOIm6zkP/Uf2v2Iu9mb3Ln
         yOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679673623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dksB5iUeGdRvRQe9WabXTIoiziL1Tg7lbGcFiUozL5I=;
        b=1Aadgb0ejfAD2rh+KiLuvyKWq5+S3O4wQdTdqpEaTHolZwVGyDWo4au+g5V1mAZkFv
         P96vo/73G/7MXN4a8rCiMmwFL9brINbCJK7Q0qox9F6/Igre29tvI/t+buunlV2Rf6et
         RCx5+UzeENGZ5fKT4CRU3iekf6EGrKf65kHT0aAS/JE3s8RozPo7QZ0ywnDszOuHdWrr
         HzxGgucvRa/l/0QTvt/4me9Srh+kUJXTulIXTkHBEZ0vUkaqo3rFxNh2WhtJpN6Xytrq
         I+0WJGh7UeaQVnckSJqVAdtSLdwRRlMwjKFJVGk3hHwbtgW59SfRAdTIEtueZL8mkFiH
         SsGQ==
X-Gm-Message-State: AAQBX9dioHUr6ww/yZBWHlGxpN+wW+auCCojo52EJXFeKn1ycNOaHdhD
        fFSJb9n6HC86SLd1+PaVrT2q94EOCmgK+s00uiA4slj8Ek/51a7r
X-Google-Smtp-Source: AKy350ZoxswfuZe1V0eDrNYugY+teAimH2xnIykHhpuOjIfpxFVli6q2uii5Xx2zsLdj7tAw829/nisfatey66SbkeY=
X-Received: by 2002:a25:db91:0:b0:b75:8ac3:d5d9 with SMTP id
 g139-20020a25db91000000b00b758ac3d5d9mr1586805ybf.3.1679673623712; Fri, 24
 Mar 2023 09:00:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230324095502.3289094-1-arnd@kernel.org>
In-Reply-To: <20230324095502.3289094-1-arnd@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 24 Mar 2023 16:59:48 +0100
Message-ID: <CAPDyKFok_k=M8-g4kgm+5CT7vzrqfbZYfLWCD1oU3W6r-2fsog@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: add CONFIG_PM dependency
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 24 Mar 2023 at 10:55, Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> Selecting CONFIG_PM_GENERIC_DOMAINS causes a build failure when CONFIG_PM
> is not enabled:
>
> WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS
>   Depends on [n]: PM [=3Dn]
>   Selected by [m]:
>   - DRM_MSM [=3Dm] && HAS_IOMEM [=3Dy] && DRM [=3Dm] && (ARCH_QCOM [=3Dy]=
 || SOC_IMX5 || COMPILE_TEST [=3Dy]) && COMMON_CLK [=3Dy] && IOMMU_SUPPORT =
[=3Dy] && (QCOM_OCMEM [=3Dy] || QCOM_OCMEM [=3Dy]=3Dn) && (QCOM_LLCC [=3Dn]=
 || QCOM_LLCC [=3Dn]=3Dn) && (QCOM_COMMAND_DB [=3Dy] || QCOM_COMMAND_DB [=
=3Dy]=3Dn) && DEVFREQ_GOV_SIMPLE_ONDEMAND [=3Dy]
>
> drivers/base/power/domain.c:654:13: error: use of undeclared identifier '=
pm_wq'
>         queue_work(pm_wq, &genpd->power_off_work);
>                    ^
> drivers/base/power/domain.c:853:26: error: no member named 'ignore_childr=
en' in 'struct dev_pm_info'
>                 if (!dev || dev->power.ignore_children)
>                             ~~~~~~~~~~ ^
>
> Fixes: c11fa1204fe9 ("drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc =
collapse")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/gpu/drm/msm/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 1c417ba53b5b..85f5ab1d552c 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -9,6 +9,7 @@ config DRM_MSM
>         depends on QCOM_OCMEM || QCOM_OCMEM=3Dn
>         depends on QCOM_LLCC || QCOM_LLCC=3Dn
>         depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=3Dn
> +       depends on PM
>         select IOMMU_IO_PGTABLE
>         select QCOM_MDT_LOADER if ARCH_QCOM
>         select REGULATOR
> --
> 2.39.2
>
