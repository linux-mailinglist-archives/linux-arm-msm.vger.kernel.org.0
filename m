Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39445438947
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Oct 2021 15:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231597AbhJXNzt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Oct 2021 09:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231293AbhJXNzr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Oct 2021 09:55:47 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 105EEC061348
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 06:53:27 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id g125so11840374oif.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 06:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cSsCh3PPVoUec6DmE2VMaXlfCFFc0zjGafS8ErHKy+Y=;
        b=p1fSY9YqUh39fi590Ec1L8+OuyheR1Myhgq2knUpbe7qZs7CVAhRnOWYEuhK5Zl9/W
         fRNZnv23OZFn6RM8KpjzgcHzS0Oqq7X3NUwzicnch1cMJgGDMwrjYPbchIYMfO6KFyhX
         u5ArevZEf8Sq0lObqK23AVtLaRaj5ZOE5YprsXkj1lqK6FW4pWvK8TVKMb1JWjoK/UPf
         FV3FpO1JJJQJNSn5OHvU2K3qdH5CTYlti1bdbnk4lg+2J4TN59d0aTNo3r5MJq5BbZua
         wpT/GLjgIklzM3BNi8H/gDr/aqmsRnIOr5i6ZgNnPiW9wSQhFaCn3XAWJgr7m7BpCLmy
         vRGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cSsCh3PPVoUec6DmE2VMaXlfCFFc0zjGafS8ErHKy+Y=;
        b=E5OAthyDh8Fjxd29dtCMiCRTWHCJ5M/MS62e7d8ugaT3Zjxu8GmQYMyvo0S99t7bxD
         FubWzHLwV+eWYhRdbLmV6Hrkzn7MNGlMSQmRwjd5tiQ7M29V3SzzCXFnE+cEZ5ln6a07
         bC8YIBsntzFsKo02a1EGQEMYnrRU/lr+DEeCbm9S1CfJzjq0wrkkLUYZnRyJsgVPefAD
         qpqFXG4uCvmnjEW7q9hzIOeMMY+uULKE0XhUk/FzsflXUtlo1iVxcXLNVnsfVezapP2V
         UFDC/bmNweadNoAwQi3MhK7udLiGMzFRbSjqP1e0mgAmnIKTiovMNYISzR1N7OTRA2FX
         SbmQ==
X-Gm-Message-State: AOAM531wxjzoTirkql+WLSXk2lpe/g5dJtygJmyB3mMu0kHpi1kqDydA
        8ZKknI/oCGpboicFoIem5KaK6SQ9m1InuXssTRBmxw==
X-Google-Smtp-Source: ABdhPJwWAbdzoAazT4EBKjMPv76sSyoRTTBaAbb91c/3MKPpygY4jhPGJ6MysYYb1vcNmRVhu2Fj6Vag1pAFheLugBw=
X-Received: by 2002:a05:6808:181c:: with SMTP id bh28mr18806334oib.12.1635083605824;
 Sun, 24 Oct 2021 06:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-15-bhupesh.sharma@linaro.org> <8f7eee67-7394-4938-7ace-f1dee397db2b@linaro.org>
In-Reply-To: <8f7eee67-7394-4938-7ace-f1dee397db2b@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sun, 24 Oct 2021 19:23:14 +0530
Message-ID: <CAH=2Ntztqd3XwiLp5yhVPyr3ouEnnsmUNP2EwpYhSCDjyv-N3Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/20] crypto: qce: core: Add support to initialize
 interconnect path
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

On Thu, 14 Oct 2021 at 00:49, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Bhupesh,
>
> On 10/13/21 1:55 PM, Bhupesh Sharma wrote:
> > From: Thara Gopinath <thara.gopinath@linaro.org>
> >
> > Crypto engine on certain Snapdragon processors like sm8150, sm8250, sm8350
> > etc. requires interconnect path between the engine and memory to be
> > explicitly enabled and bandwidth set prior to any operations. Add support
> > in the qce core to enable the interconnect path appropriately.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > [Make header file inclusion alphabetical]
> > Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> > ---
> >   drivers/crypto/qce/core.c | 35 ++++++++++++++++++++++++++++-------
> >   drivers/crypto/qce/core.h |  1 +
> >   2 files changed, 29 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > index d3780be44a76..033c7278aa5d 100644
> > --- a/drivers/crypto/qce/core.c
> > +++ b/drivers/crypto/qce/core.c
> > @@ -5,6 +5,7 @@
> >
> >   #include <linux/clk.h>
> >   #include <linux/dma-mapping.h>
> > +#include <linux/interconnect.h>
> >   #include <linux/interrupt.h>
> >   #include <linux/module.h>
> >   #include <linux/mod_devicetable.h>
> > @@ -22,6 +23,8 @@
> >   #define QCE_MAJOR_VERSION5  0x05
> >   #define QCE_QUEUE_LENGTH    1
> >
> > +#define QCE_DEFAULT_MEM_BANDWIDTH    393600
> > +
> >   static const struct qce_algo_ops *qce_ops[] = {
> >   #ifdef CONFIG_CRYPTO_DEV_QCE_SKCIPHER
> >       &skcipher_ops,
> > @@ -206,21 +209,35 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >       if (ret < 0)
> >               return ret;
> >
> > +     qce->mem_path = of_icc_get(qce->dev, "memory");
>
> Please consider to use devm_of_icc_get() here also.

Thanks, I will fix this in the v5.

Regards,
Bhupesh

> > +     if (IS_ERR(qce->mem_path))
> > +             return PTR_ERR(qce->mem_path);
> > +
> >       qce->core = devm_clk_get(qce->dev, "core");
> > -     if (IS_ERR(qce->core))
> > -             return PTR_ERR(qce->core);
> > +     if (IS_ERR(qce->core)) {
> > +             ret = PTR_ERR(qce->core);
> > +             goto err_mem_path_put;
> > +     }
> >
> >       qce->iface = devm_clk_get(qce->dev, "iface");
> > -     if (IS_ERR(qce->iface))
> > -             return PTR_ERR(qce->iface);
> > +     if (IS_ERR(qce->iface)) {
> > +             ret = PTR_ERR(qce->iface);
> > +             goto err_mem_path_put;
> > +     }
> >
> >       qce->bus = devm_clk_get(qce->dev, "bus");
> > -     if (IS_ERR(qce->bus))
> > -             return PTR_ERR(qce->bus);
> > +     if (IS_ERR(qce->bus)) {
> > +             ret = PTR_ERR(qce->bus);
> > +             goto err_mem_path_put;
> > +     }
> > +
> > +     ret = icc_set_bw(qce->mem_path, QCE_DEFAULT_MEM_BANDWIDTH, QCE_DEFAULT_MEM_BANDWIDTH);
> > +     if (ret)
> > +             goto err_mem_path_put;
> >
> >       ret = clk_prepare_enable(qce->core);
> >       if (ret)
> > -             return ret;
> > +             goto err_mem_path_disable;
> >
> >       ret = clk_prepare_enable(qce->iface);
> >       if (ret)
> > @@ -260,6 +277,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >       clk_disable_unprepare(qce->iface);
> >   err_clks_core:
> >       clk_disable_unprepare(qce->core);
> > +err_mem_path_disable:
> > +     icc_set_bw(qce->mem_path, 0, 0);
> > +err_mem_path_put:
> > +     icc_put(qce->mem_path);
> >       return ret;
> >   }
> >
> > diff --git a/drivers/crypto/qce/core.h b/drivers/crypto/qce/core.h
> > index 085774cdf641..228fcd69ec51 100644
> > --- a/drivers/crypto/qce/core.h
> > +++ b/drivers/crypto/qce/core.h
> > @@ -35,6 +35,7 @@ struct qce_device {
> >       void __iomem *base;
> >       struct device *dev;
> >       struct clk *core, *iface, *bus;
> > +     struct icc_path *mem_path;
> >       struct qce_dma_data dma;
> >       int burst_size;
> >       unsigned int pipe_pair_id;
> >
>
> --
> Best wishes,
> Vladimir
