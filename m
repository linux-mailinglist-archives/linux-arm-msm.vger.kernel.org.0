Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EEA3438933
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Oct 2021 15:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231674AbhJXNhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Oct 2021 09:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhJXNhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Oct 2021 09:37:04 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24129C061348
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 06:34:44 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id t4so11814247oie.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 06:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZT5fAPNyma5e8WyOr3A/N0atEQZClP4tTp5HN0LYpNU=;
        b=pus/LjZ4Z8Uirsug0xo7ImF4DBZk6R688dmmvvXAqXfgj1hDPomu/UBKljPuTJAV94
         X8fiCSxBQziChqPRPDhRvOiB7o/fFUSoZxnbz927sXDnCKV0P3uITNT80A6Lf7yopguU
         g3kWkCaeGmwenOfQPS+J3W1cYuzCVFTYBbaH70cRvwrCBDuCjFsZnz9Bd5W0PPJEgNQ9
         deCidFezCiIh89PfAv0Fj/JYXqOHTyJ7oOgWOBXzCE98R3hRsdv4dWD5wxWAphgTFZfU
         aGRtp7abMFk47nKdNqsSjQ7i1TBzmc4KhIZpej8jgrs/MAwzmdz+aOw7dD+Aezlp/NvO
         FR7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZT5fAPNyma5e8WyOr3A/N0atEQZClP4tTp5HN0LYpNU=;
        b=Ipcm1SCS0BzH4ZbTPlqGyvaH9CZ7Mn1StQmGqD5LURwmLj0s+/72gdbt1l+T1S4wWY
         mvJJ0XjPUd0B1q09uKn8GCMAmpPqruizs5GefDjCPuJIVI9XukPp4AOfFWtirSK4DKmF
         xyQRYAxZPLA921LysXQnX9jy/GotD3qgSvQdrHjqWAdJEyA/d/cXYymMUndo9adBI2H8
         n7HH5wQ84HmIJzUZ6NDOEcvvQe3T3zf0gf16rwS+eEG/beUp6MpVnFp08mYEoKSFp/cR
         w9IKhhmSUi+9VlPcZ8BehVPTs0hZs5Vku9zWsfVxH7pOQoSnz2TXk+K3ZhmNvr7kBu4K
         6ABw==
X-Gm-Message-State: AOAM5312PqcuY0BQ19NBO8YLg/B+KQdwttuXMswUzErtwuMy+0lNKLLT
        jwIeC8nNrlZxrXlGNIBdh35U9E8+7tgSSrZowlvsTw==
X-Google-Smtp-Source: ABdhPJw6MtPfZNRBtb5CTwISKGRCnQMN0HVMf5dU8udAdvoGUoEQeJDigLYoasCwbfbNEh6DyJ9w8rMN2i9KfCY1QwQ=
X-Received: by 2002:a05:6808:1686:: with SMTP id bb6mr8188043oib.40.1635082483473;
 Sun, 24 Oct 2021 06:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-17-bhupesh.sharma@linaro.org> <5f69019a-86c7-fac5-2758-1be9a9092678@linaro.org>
In-Reply-To: <5f69019a-86c7-fac5-2758-1be9a9092678@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sun, 24 Oct 2021 19:04:32 +0530
Message-ID: <CAH=2NtzMvXz6FRCApdxP1FFM9=73yfm07YibWGL-m0+KSkweaQ@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] crypto: qce: core: Make clocks optional
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

On Thu, 14 Oct 2021 at 00:53, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Bhupesh,
>
> On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> > From: Thara Gopinath <thara.gopinath@linaro.org>
> >
> > On certain Snapdragon processors, the crypto engine clocks are enabled by
> > default by security firmware and the driver need not/ should not handle the
> > clocks. Make acquiring of all the clocks optional in crypto enginer driver
>
> typo, s/enginer/engine/
>
> > so that the driver intializes properly even if no clocks are specified in
>
> typo, s/intializes/initializes/

Thanks, I will fix these typos in v5.

Regards,
Bhupesh

> > the dt.
> >
> > Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> > ---
> >   drivers/crypto/qce/core.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > index 2ab0b97d718c..576c416461f9 100644
> > --- a/drivers/crypto/qce/core.c
> > +++ b/drivers/crypto/qce/core.c
> > @@ -213,19 +213,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >       if (IS_ERR(qce->mem_path))
> >               return PTR_ERR(qce->mem_path);
> >
> > -     qce->core = devm_clk_get(qce->dev, "core");
> > +     qce->core = devm_clk_get_optional(qce->dev, "core");
> >       if (IS_ERR(qce->core)) {
> >               ret = PTR_ERR(qce->core);
> >               goto err_mem_path_put;
> >       }
> >
> > -     qce->iface = devm_clk_get(qce->dev, "iface");
> > +     qce->iface = devm_clk_get_optional(qce->dev, "iface");
> >       if (IS_ERR(qce->iface)) {
> >               ret = PTR_ERR(qce->iface);
> >               goto err_mem_path_put;
> >       }
> >
> > -     qce->bus = devm_clk_get(qce->dev, "bus");
> > +     qce->bus = devm_clk_get_optional(qce->dev, "bus");
> >       if (IS_ERR(qce->bus)) {
> >               ret = PTR_ERR(qce->bus);
> >               goto err_mem_path_put;
> >
>
> --
> Best wishes,
> Vladimir
