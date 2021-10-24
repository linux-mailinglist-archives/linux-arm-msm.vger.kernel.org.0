Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF6D4438C7D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Oct 2021 01:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhJXXVk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Oct 2021 19:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhJXXVk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Oct 2021 19:21:40 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4457C061764
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 16:19:18 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id s9so13131140oiw.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 16:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pv3yKrebsG4+UvHFA+gEH7kLCAky4RcnNh+s60n1ECg=;
        b=DRxQ/fjnTpPb4MC72a1IZMfz9ncUBy+xnhuEsFNFoAN+EA5O9dGCsmbZunJx800wLQ
         exY3higOsh5+ledswU+RuEi/T2mYz1a0ClJLtde2XScVA3eX2rGGZ14HpYrCTsmfiNcq
         tYRvD0zPaaD2S/An+nWFbP242YCELYg/ZrXJ240iqty7h7NmI5CEaBHVED7w3x4A05NY
         ihNYA9xxhUbl2ZJfv3Knok5o5lmsI+oQ+0hM8tBSm2ae3UgM6zlg8QH4hSKrvXsaNRo3
         Yc2STjrtZTz74ptZB4aeI2Hg1l4NeUZkI2dGYTksnHAa9JkWk2qyKwZE+GC6Uei3eHui
         dXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pv3yKrebsG4+UvHFA+gEH7kLCAky4RcnNh+s60n1ECg=;
        b=d5a1aLqpLR+zGf5RHzBTKcvllQKn1l/l7j+36QqIe3KeHvmwzLI+IN/7IPhyOZ7FpZ
         l7Joas4z3rG/OPQBSnmWpaVzjsXbPiRKfsDHGYWcPnWDMBoeTRmh/HmbRAFll+4SJbUC
         XH3wsK0rOAEQGBwCgdfmPUMnK/GiBhSP8YriqD2aE11RsBMxhx/+z5enip0ReuWOHLq0
         7uJ8lWfbWFahO6KKynn1x2xWswZz7JnHM2pprHMz5fyUAaLZ0Fs3hy0Ro3xoW/1BztIU
         U8gaSbvVQZbsFCTWYhgA+UJnEJu946e9BJfFVivnHdrDGvvtGgja4NVtQVJcYPIhYIKz
         lVmQ==
X-Gm-Message-State: AOAM530xWygqsY9BpN0jnhdCmmr4tpYAXsGTx0qKA/ODOz9bUDT4oh95
        pRmqbuMAfMPZnP/izafLUNJvzQ==
X-Google-Smtp-Source: ABdhPJy3j3tGjtYGKybCdCNCsXxJC2IRee2Yfy5EcWU7XgHjAUm63VmFrLBW+5NYKewmuEZnl5tv4A==
X-Received: by 2002:a05:6808:1246:: with SMTP id o6mr9674571oiv.38.1635117557816;
        Sun, 24 Oct 2021 16:19:17 -0700 (PDT)
Received: from yoga ([2600:1700:a0:3dc8:40c7:d4ff:fe65:a72c])
        by smtp.gmail.com with ESMTPSA id a6sm2316967oid.18.2021.10.24.16.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Oct 2021 16:19:17 -0700 (PDT)
Date:   Sun, 24 Oct 2021 18:19:15 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Thara Gopinath <thara.gopinath@linaro.org>
Subject: Re: [PATCH 1/2] crypto: qce: Add 'sm8150-qce' compatible string check
Message-ID: <YXXp80d19dDhYXzA@yoga>
References: <20211013165823.88123-1-bhupesh.sharma@linaro.org>
 <20211013165823.88123-2-bhupesh.sharma@linaro.org>
 <YXWVYZlCpkSRb7xv@builder.lan>
 <CAH=2NtyHpZa0KV5TRDuvciC+uV6mdO03RmEJSKMXES4HZOg-HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH=2NtyHpZa0KV5TRDuvciC+uV6mdO03RmEJSKMXES4HZOg-HA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 24 Oct 12:59 CDT 2021, Bhupesh Sharma wrote:

> Hi Bjorn,
> 
> On Sun, 24 Oct 2021 at 22:48, Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > On Wed 13 Oct 11:58 CDT 2021, Bhupesh Sharma wrote:
> >
> > > Add 'sm8150-qce' compatible string check in qce crypto
> > > driver as we add support for sm8150 crypto device in the
> > > device-tree in the subsequent patch.
> > >
> > > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > > ---
> > >  drivers/crypto/qce/core.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > > index 4c55eceb4e7f..ecbe9f7c6c0a 100644
> > > --- a/drivers/crypto/qce/core.c
> > > +++ b/drivers/crypto/qce/core.c
> > > @@ -306,6 +306,7 @@ static int qce_crypto_remove(struct platform_device *pdev)
> > >  static const struct of_device_id qce_crypto_of_match[] = {
> > >       { .compatible = "qcom,ipq6018-qce", },
> > >       { .compatible = "qcom,sdm845-qce", },
> > > +     { .compatible = "qcom,sm8150-qce", },
> > >       { .compatible = "qcom,sm8250-qce", },
> >
> > When I look at linux-next I see qce_crypto_of_match defined as:
> >
> > static const struct of_device_id qce_crypto_of_match[] = {
> >         { .compatible = "qcom,crypto-v5.1", },
> >         { .compatible = "qcom,crypto-v5.4", },
> >         {}
> > };
> >
> > Can you please help me understand what I'm doing wrong?
> 
> Oh, you have missed [PATCH 15/20] from the sm8250 qce crypto addition
> series (see [1])
> 
> This series is dependent on the sm8250 qce enablement series, as I
> noted in the cover letter (see [2]).
> 

Ah, now I see. Thanks for the pointer!

> However, Thara and Vladimir pointed out backward compatibility issues
> with PATCH 15/20 of the first series. So I will send a v5 to fix the
> same along with other issues pointed in the v4.
> 
> Sorry for any confusion caused.
> 

No worries. Could you include these two patches in v5 of the other
series, to clarify the dependency?

Thanks,
Bjorn

> [1]. https://lore.kernel.org/linux-arm-msm/20211013105541.68045-1-bhupesh.sharma@linaro.org/T/#m566546d32d8da7ee94822dfba625e98fd3496d17
> [2]. https://www.spinics.net/lists/linux-arm-msm/msg96053.html
> 
> Regards,
> Bhupesh
