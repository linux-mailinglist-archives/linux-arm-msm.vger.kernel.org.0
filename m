Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2C0243896D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Oct 2021 16:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231658AbhJXOIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Oct 2021 10:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231256AbhJXOIO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Oct 2021 10:08:14 -0400
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com [IPv6:2607:f8b0:4864:20::c30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DE61C061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 07:05:54 -0700 (PDT)
Received: by mail-oo1-xc30.google.com with SMTP id a17-20020a4a6851000000b002b59bfbf669so2738218oof.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 07:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GMCyWWZB+F6GjYcUII59d8HlYaXQfCLuj1yTlXM312U=;
        b=kFBYELY/mhygmo1FpH4bAgNd2Q6RwTquDOsCb9ND4E4OvmssrMcVvBfP23gFF/h06U
         fzVbSHvSGFVUSD7OkSxz/syXxX2EQ+MEMC3rJNJDuNCsvTDuqEUvyhYZRxWe6oOWcMtH
         0OtuD5nAcNWgfXnCCGqNPiduNNnvfoP9w9ITGY6MnGA/Clm0M4z7CE49ws549p6o25yP
         N4SGugTF4fgQRR5VgyXJbkhkPp1mQgl8fmH/8qkz5zBoEKQomIZ6FVP1/cmsPeaAnXAA
         ofE1FpsOWZQuqUjHsa/Vvj+BqtsRNFrBCkFUyzyefm1OUS+41i+qU9gh/kOzU9ZQsc0A
         8BKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GMCyWWZB+F6GjYcUII59d8HlYaXQfCLuj1yTlXM312U=;
        b=dI3BrUxngGGQJE9Orqq+l0MW/Yun7WD8LSKyXFpBXVu5Uxi+X0IAnM3dRTDcEYrce+
         kc5vRa0b57AckrSRQeET3YXxCgKqSetsPXopxf/+OF/tAsVnPiS4g5xWxBRofqWunsId
         DlW7Ul8NhvbVYwKSu+zweF9c2qrFu1dBZBDoJgddGpIl03cFjTf4EL7ZTE2x01JDC8PU
         UkmLEwHaXh1+kcRFbgtHUwht1uM6XSd06/QRwzqj+/oauODYCgz2rq28qVaZnHKQOPDp
         AzgrKkeYvG31ensNrTDxQOGa1zTSJXdKHqf81nxPK+yyImRkH27jIvEEjmw3/iLk6jK2
         E9Jw==
X-Gm-Message-State: AOAM533v4Lje74BaFugeDj+xnz70CiTGylpZyR2Zm8LLu6kytjV4oxAm
        sf4/LmR/faPgAXAWOopfUzLJSS2H8CGa4EUX0bPXCg==
X-Google-Smtp-Source: ABdhPJwA0k9+Vjln5UZOi+lx52eVASOA+ikS1nXATX5P8/EmF5Cc4XvKAECGJMBbP074rle3crDf6UchM5BnaWwKpoI=
X-Received: by 2002:a4a:ea96:: with SMTP id r22mr8261639ooh.13.1635084353330;
 Sun, 24 Oct 2021 07:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211013105541.68045-1-bhupesh.sharma@linaro.org>
 <20211013105541.68045-19-bhupesh.sharma@linaro.org> <c6df4da4-3d50-5592-1036-b9a8cebb79d9@linaro.org>
In-Reply-To: <c6df4da4-3d50-5592-1036-b9a8cebb79d9@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sun, 24 Oct 2021 19:35:42 +0530
Message-ID: <CAH=2Ntx9KROVNEAR8uuMNqSiMEGf5M==aju=8PmQnKhUy1ccvQ@mail.gmail.com>
Subject: Re: [PATCH v4 18/20] crypto: qce: Defer probing if BAM dma channel is
 not yet initialized
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Thara,

On Wed, 20 Oct 2021 at 19:40, Thara Gopinath <thara.gopinath@linaro.org> wrote:
>
> On 10/13/21 6:55 AM, Bhupesh Sharma wrote:
> > Since the Qualcomm qce crypto driver needs the BAM dma driver to be
> > setup first (to allow crypto operations), it makes sense to defer
> > the qce crypto driver probing in case the BAM dma driver is not yet
> > probed.
> >
> > Move the code leg requesting dma channels earlier in the
> > probe() flow. This fixes the qce probe failure issues when both qce
> > and BMA dma are compiled as static part of the kernel.
>
> Hi Bhupesh,
>
> I am quite curious to know the nature of probe failure you are seeing
> with the current sequence.  I am not against changing the sequence but
> for me when a driver is enabled, it is clocks first, interconnect next
> and then dma. Also I have tested the current sequence on sm8150 with
> both the modules built in as static and I have not seen the failure.

Sure. The problem I faced was the following. Let's consider the
scenario where while the qce crypto driver and the interconnect are
compiled as static parts of the kernel, the bam DMA driver is compiled
as a module, then the -EPROBE_DEFER return leg from the qce crypto
driver is very late in the probe() flow, as we first turn on the
clocks and then the interconnect.

Now the suggested linux deferred probe implementation is to return as
early from the caling driver in case the called driver (subdev) is not
yet ready. SInce the qce crypto driver requires the bam DMA to be set
up first, it makes sense to move 'qce_dma_request' early in the boot
flow. If it's not yet probed(), it probably doesn't make sense to set
up the clks and interconnects yet in the qce driver. We can do it
later when the bam DMA is setup.

I have tested the following combinations with the change I made in
this patchset:

1. qce - static, bam - module, interconnect - module ->
qce_dma_request returned -EPROBE_DEFER
2. qce - static, bam - module, interconnect - static ->
qce_dma_request returned -EPROBE_DEFER
3. qce - static, bam - static, interconnect - module ->
qce_dma_request returned -EPROBE_DEFER
4. qce - static, bam - static, interconnect - static -> no -EPROBE_DEFER

Thanks,
Bhupesh

> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   drivers/crypto/qce/core.c | 20 ++++++++++++--------
> >   1 file changed, 12 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > index cb8c77709e1e..c6f686126fc9 100644
> > --- a/drivers/crypto/qce/core.c
> > +++ b/drivers/crypto/qce/core.c
> > @@ -209,9 +209,19 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >       if (ret < 0)
> >               return ret;
> >
> > +     /* qce driver requires BAM dma driver to be setup first.
> > +      * In case the dma channel are not set yet, this check
> > +      * helps use to return -EPROBE_DEFER earlier.
> > +      */
> > +     ret = qce_dma_request(qce->dev, &qce->dma);
> > +     if (ret)
> > +             return ret;
> > +
> >       qce->mem_path = of_icc_get(qce->dev, "memory");
> > -     if (IS_ERR(qce->mem_path))
> > +     if (IS_ERR(qce->mem_path)) {
> > +             qce_dma_release(&qce->dma);
> >               return PTR_ERR(qce->mem_path);
> > +     }
> >
> >       qce->core = devm_clk_get_optional(qce->dev, "core");
> >       if (IS_ERR(qce->core)) {
> > @@ -247,10 +257,6 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >       if (ret)
> >               goto err_clks_iface;
> >
> > -     ret = qce_dma_request(qce->dev, &qce->dma);
> > -     if (ret)
> > -             goto err_clks;
> > -
> >       ret = qce_check_version(qce);
> >       if (ret)
> >               goto err_clks;
> > @@ -265,12 +271,10 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >
> >       ret = qce_register_algs(qce);
> >       if (ret)
> > -             goto err_dma;
> > +             goto err_clks;
> >
> >       return 0;
> >
> > -err_dma:
> > -     qce_dma_release(&qce->dma);
> >   err_clks:
> >       clk_disable_unprepare(qce->bus);
> >   err_clks_iface:
> >
>
>
