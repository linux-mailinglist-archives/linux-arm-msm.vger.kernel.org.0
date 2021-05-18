Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6778F387B98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 16:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238408AbhEROqe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 10:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233943AbhEROqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 10:46:25 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901F1C06138A
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 07:45:07 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id u25-20020a0568302319b02902ac3d54c25eso8867746ote.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 May 2021 07:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+I0Y4c5QVZL3j3aPLLsY6yUi9Anm8Xg8tXjxoP3kmaA=;
        b=DnF+V1u4aXfJZ0oMCAAXVp7EbHLzATcib064zpKEqM8fIX4X69sfv/dY8JiFaYBOfd
         G7pFWoX7Vl4lFtsb0NaacSygopz/JAtOiei+V//sdhqUKWCYOBBNK4B6/KtpTtQ5yYwj
         6x2OBaAgKEHrw74FV0O2KRJIQv5eCZIvHQPjm887seB6nt32HOQVcD6PMKgF+4KoDnlU
         zB8qdF+HVfIskVEK8YYHaKcKHLQYbDTYLHgOOufGWxhlw5uMz7WtdaUoIUAIaSJ1lv+5
         QQdPTZwc+mm/6260PKrS67+k3Dmr3St/Xyj+aqsBpdXcd/1vCuaQBtd00au1uUFEDdZe
         9F3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+I0Y4c5QVZL3j3aPLLsY6yUi9Anm8Xg8tXjxoP3kmaA=;
        b=I10DJ/gnUXV8qDr51yj1K896IkwpayYh2O2IVIwWYgHttxedr4Of55k7CVLhQRqb8M
         C6EnPzjpaYemirc6vBfi/nT0BUXSB6JZ0U2V8Pnsfy1Lt9LlCHCnu4Gp8aVJnWnIyWdL
         gPKy/fxeB/83pP7CJ5sJbqYcaYQJsZCgjp8N9bD/0y1tPUvlriRG1faJPsHbeni39/hY
         IkMeDg/sYm52VyNEo3ekhQWQwsv0ac78cGMbwlK1DqvaNzA71TLtaJ/3KNqnj5Ku8ZrP
         OkUKajA/Ya/KdT8sfgIDz+GZQUtbIwYvv/6L5kSW/T/kg90LOjOVlQG64C+NvjFnspyQ
         SrnA==
X-Gm-Message-State: AOAM5334hPPE5MId8E1lUNoRyWF9YoY3zEcA71CPq7pPU59qwG0GFaww
        hGy0nblDUR2PGgYn4Q2J/IKHGXfxVTt+Q63tigew7Q==
X-Google-Smtp-Source: ABdhPJwU1vhdtj7C21PJReFsn9XQdq26AflNTFKimt9sKly+sQlhEy3C2/XoK/nlnzfDDetaWEyWUhUrTn+I7Si2byU=
X-Received: by 2002:a9d:4f15:: with SMTP id d21mr4610254otl.155.1621349106931;
 Tue, 18 May 2021 07:45:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210505213731.538612-1-bhupesh.sharma@linaro.org>
 <20210505213731.538612-16-bhupesh.sharma@linaro.org> <7d8bc623-ef12-c7ae-0d12-16b0b1c48ffe@linaro.org>
In-Reply-To: <7d8bc623-ef12-c7ae-0d12-16b0b1c48ffe@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Tue, 18 May 2021 20:14:56 +0530
Message-ID: <CAH=2NtxEq4p83EvJYe4cw3krhx0g2TYGFYRSEHc+jQJmBzdsqw@mail.gmail.com>
Subject: Re: [PATCH v2 15/17] crypto: qce: Defer probing if BAM dma is not yet initialized
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

HI Thara,

On Mon, 10 May 2021 at 18:52, Thara Gopinath <thara.gopinath@linaro.org> wrote:
>
>
>
> On 5/5/21 5:37 PM, Bhupesh Sharma wrote:
> > Since the Qualcomm qce crypto driver needs the BAM dma driver to be
> > setup first (to allow crypto operations), it makes sense to defer
> > the qce crypto driver probing in case the BAM dma driver is not yet
> > probed.
> >
> > This fixes the qce probe failure issues when both qce and BMA dma
> > are compiled as static part of the kernel.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
> > Cc: David S. Miller <davem@davemloft.net>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: dmaengine@vger.kernel.org
> > Cc: linux-clk@vger.kernel.org
> > Cc: linux-crypto@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   drivers/crypto/qce/core.c  | 4 ++++
> >   drivers/dma/qcom/bam_dma.c | 7 +++++++
> >   2 files changed, 11 insertions(+)
> >
> > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > index 9a7d7ef94687..3e742e9911fa 100644
> > --- a/drivers/crypto/qce/core.c
> > +++ b/drivers/crypto/qce/core.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/types.h>
> >   #include <crypto/algapi.h>
> >   #include <crypto/internal/hash.h>
> > +#include <soc/qcom/bam_dma.h>
> >
> >   #include "core.h"
> >   #include "cipher.h"
> > @@ -201,6 +202,9 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >                       of_match_device(qce_crypto_of_match, &pdev->dev);
> >       int ret;
> >
> > +     /* qce driver requires BAM dma driver to be setup first */
> > +     if (!bam_is_probed())
> > +             return -EPROBE_DEFER;
>
> Hi Bhupesh,
>
> You don't need this here. qce_dma_request returns -EPROBE_DEFER if the
> dma controller is not probed yet.

Thanks for the review.

Yes, we can just use qce_dma_request() return value to return from the
qce probe() function early, in case the bam dma channels are not
available yet.

I have made the changes in v3 and will post it for review shortly.

Regards,
Bhupesh






> >
> >       qce = devm_kzalloc(dev, sizeof(*qce), GFP_KERNEL);
> >       if (!qce)
> > diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
> > index 2bc3b7c7ee5a..c854fcc82dbf 100644
> > --- a/drivers/dma/qcom/bam_dma.c
> > +++ b/drivers/dma/qcom/bam_dma.c
> > @@ -935,6 +935,12 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
> >       INIT_LIST_HEAD(&bchan->desc_list);
> >   }
> >
> > +bool bam_is_probed(void)
> > +{
> > +     return bam_probed;
> > +}
> > +EXPORT_SYMBOL_GPL(bam_is_probed);
> > +
> >   static const struct of_device_id bam_of_match[] = {
> >       { .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
> >       { .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
> > @@ -1084,6 +1090,7 @@ static int bam_dma_probe(struct platform_device *pdev)
> >       if (ret)
> >               goto err_unregister_dma;
> >
> > +     bam_probed = true;
> >       if (!bdev->bamclk) {
> >               pm_runtime_disable(&pdev->dev);
> >               return 0;
> >
>
