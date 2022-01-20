Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39DB44947F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jan 2022 08:12:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238319AbiATHMT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jan 2022 02:12:19 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:40234 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358745AbiATHMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jan 2022 02:12:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 0D951CE1FF9
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 07:12:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31E90C340E0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jan 2022 07:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642662735;
        bh=ZQ3dERM8Q99Log3fz6CVXXr4Xm63Dgw9gcDL1YI7TDU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qsR0V40shSyp425G7LZqvCdk9ynuv86ZnpTnc8uAg1MVbnfWGmFwsGqfsMhoVwkRF
         DcR8k41EBNDTIv1LOOURJpZAMjaTtQpuEWylmJp+5vM7AqQhzNCe2sYgb4ny2JXZYj
         10grOAHsKfxLPHKs3w4WsA9EGdJDNwGH6BtUoa+zpNh1G1/8G7rJlvAzSIEYyAjcAe
         q58kqCliMWEzJU8bY6DwukfYGpkHc2QYFeXv1M1dqgHwX20j/FiBdkY5QUCF4eZOy9
         o2WBj4oG0V2PcMO91+WvItIbxzz3fk+jNyhD4rRxRrVD96ipgAHOwrT4KXw3CWDQRy
         4JLe+uFs+rX+g==
Received: by mail-lf1-f50.google.com with SMTP id x7so18000815lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jan 2022 23:12:15 -0800 (PST)
X-Gm-Message-State: AOAM531WYzZoIRvzF40GO05Lm1mLaP6njENDuc/H548PWiTDnWx0cKC8
        6d6zU7XwoHw+zUpgas8ujrc+rvlUKzIujjEiiwC60w==
X-Google-Smtp-Source: ABdhPJy/QKZrgmp8wzA/QBJWiikX+bf4TvKNE36E1hWXtkYLalxM0deb+fA6IGrVm16vpnsZq5A0pmVxypmhqGeWjRw=
X-Received: by 2002:a05:6512:3e1e:: with SMTP id i30mr30820974lfv.493.1642662733179;
 Wed, 19 Jan 2022 23:12:13 -0800 (PST)
MIME-Version: 1.0
References: <20220114095529.1754065-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220114095529.1754065-1-dmitry.baryshkov@linaro.org>
From:   Amit Kucheria <amitk@kernel.org>
Date:   Thu, 20 Jan 2022 12:42:02 +0530
X-Gmail-Original-Message-ID: <CAHLCerM8N4nos3bguO5q6bW_JhNtxa8TyC_E-_M9UK3b78my3A@mail.gmail.com>
Message-ID: <CAHLCerM8N4nos3bguO5q6bW_JhNtxa8TyC_E-_M9UK3b78my3A@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/tsens: register thermal zones as hwmon sensors
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jan 14, 2022 at 3:25 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Register thermal zones as hwmon sensors to let userspace read
> temperatures using standard hwmon interface.

What is the usecase for this? Simply to use existing hwmon tools to
read temperatures of the various thermal zones?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/thermal/qcom/tsens.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
> index 99a8d9f3e03c..c13093e8a642 100644
> --- a/drivers/thermal/qcom/tsens.c
> +++ b/drivers/thermal/qcom/tsens.c
> @@ -19,6 +19,7 @@
>  #include <linux/slab.h>
>  #include <linux/thermal.h>
>  #include "tsens.h"
> +#include "../thermal_hwmon.h"
>
>  /**
>   * struct tsens_irq_data - IRQ status and temperature violations
> @@ -1060,6 +1061,10 @@ static int tsens_register(struct tsens_priv *priv)
>                 priv->sensor[i].tzd = tzd;
>                 if (priv->ops->enable)
>                         priv->ops->enable(priv, i);
> +
> +               if (devm_thermal_add_hwmon_sysfs(tzd))
> +                       dev_warn(priv->dev,
> +                                "Failed to add hwmon sysfs attributes\n");
>         }
>
>         /* VER_0 require to set MIN and MAX THRESH
> --
> 2.34.1
>
