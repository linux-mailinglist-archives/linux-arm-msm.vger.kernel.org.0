Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A587035BB68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Apr 2021 09:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237177AbhDLHxO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Apr 2021 03:53:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237064AbhDLHxO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Apr 2021 03:53:14 -0400
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com [IPv6:2607:f8b0:4864:20::a2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF61C06138D
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 00:52:56 -0700 (PDT)
Received: by mail-vk1-xa2e.google.com with SMTP id x4so2669331vkx.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Apr 2021 00:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=haLPUNjjiZEhpuang/uo2eD4NXoYXG1RAvFa9+uUreg=;
        b=Yd+oMly4aZU0RKWqWmoDzMZGGbTSIOObxH9Df5edGOBcyn+TT+oy82vFoB3KCA5FUF
         gbz9MS+wKRCC9yZQ3GC8K+28fC+azQtKI6ANxEBI0Nkroqrh5Zogj2JUPHNiYHlRJBOm
         32/+VHO5ypCk/O3HxSuV8tZEWftN+x8p06rgoHQDB97ymCZQAu/lUD7P+uH4WevWVb58
         taeeww3l4g/8IlDR3eyuLYhbOrgbltz/hKSaeVJahzHiLVv4Rw1p1ZUA+XYBNFPyqVT2
         nt2QTnp8RbI06/B4fkqdzi4jIjjS+4SM+fPOetmwniryNY1l01CZK8g7J0Z/rAzTH7pr
         qGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=haLPUNjjiZEhpuang/uo2eD4NXoYXG1RAvFa9+uUreg=;
        b=PE7HhLXVMxmudvvKQ5OjyHdAnCwRASFAd89wnpwKFFoumiZ0fBZEMS5lgl2Pxdczor
         sruOBdhsQvnCYfsjOAJyysi4a8AozhtGwt0wzn84wESZ2xMCBpup/38UNh7UvvC3hsPJ
         OBcc00beaMst8jJeZDUY+42ril8AvUrC5uK+oDe50kY/BwnMpQydRSGdHQ2yZdh2PTgF
         MRj2X1VJ3JpKEyuyUWNYCNJWQVGofwptTnHtTOLPcxulr0Eg46m3FpAEDvc72JhcjqRh
         y0Ufi8Su8NJBTKChWSFp6V963gakb4oKjA5KIalJg85yrFkM6njcCvHKAaU5JXYkC+vE
         1ujA==
X-Gm-Message-State: AOAM530Bp7I/UiSRwZ0zqMAGfItMioXpxJ5a+TViHU1vYjk5BZzFl766
        dmVD7IYr2m/MLPPwIVI/m/wYNhluI/fOX2LYPTikcg==
X-Google-Smtp-Source: ABdhPJwL5SnNlCfx9LXYsQGHy81G3AdoBCw3wKeAJ1c1igCwssy6W17LfihBqiSQUVRPDX7Y/lfn57u07HzAWF4nx18=
X-Received: by 2002:a1f:2a95:: with SMTP id q143mr18761115vkq.8.1618213975747;
 Mon, 12 Apr 2021 00:52:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210409015424.3277212-1-jiayang5@huawei.com>
In-Reply-To: <20210409015424.3277212-1-jiayang5@huawei.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 12 Apr 2021 09:52:19 +0200
Message-ID: <CAPDyKFrnaTuBPtGfeaDBxjdk5pgfnBUKz2Emg8MHLYsudit5cw@mail.gmail.com>
Subject: Re: [PATCH -next] mmc: sdhci-msm: Remove unnecessary error log
To:     Jia Yang <jiayang5@huawei.com>
Cc:     Adrian Hunter <adrian.hunter@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 9 Apr 2021 at 03:44, Jia Yang <jiayang5@huawei.com> wrote:
>
> devm_ioremap_resource() has recorded error log, so it's
> unnecessary to record log again.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jia Yang <jiayang5@huawei.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-msm.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index d170c919e6e4..e44b7a66b73c 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -1863,7 +1863,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>         struct mmc_host *mmc = msm_host->mmc;
>         struct device *dev = mmc_dev(mmc);
>         struct resource *res;
> -       int err;
>
>         if (!(cqhci_readl(cq_host, CQHCI_CAP) & CQHCI_CAP_CS))
>                 return 0;
> @@ -1881,11 +1880,8 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
>         }
>
>         msm_host->ice_mem = devm_ioremap_resource(dev, res);
> -       if (IS_ERR(msm_host->ice_mem)) {
> -               err = PTR_ERR(msm_host->ice_mem);
> -               dev_err(dev, "Failed to map ICE registers; err=%d\n", err);
> -               return err;
> -       }
> +       if (IS_ERR(msm_host->ice_mem))
> +               return PTR_ERR(msm_host->ice_mem);
>
>         if (!sdhci_msm_ice_supported(msm_host))
>                 goto disable;
> --
> 2.25.1
>
