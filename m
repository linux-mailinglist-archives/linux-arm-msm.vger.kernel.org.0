Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40B9A438B2B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Oct 2021 20:00:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231654AbhJXSCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Oct 2021 14:02:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231290AbhJXSCJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Oct 2021 14:02:09 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3444FC061745
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 10:59:48 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id bk18so12415467oib.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Oct 2021 10:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BfU5q/0MkozQjzfxR6fQ4i7r2iqV9JZtLKp+vQfhRpU=;
        b=pdYCn35jLstYtIncYgyEJh8mDax2MR4xaFC6pD6fwx1gH+hsNgg5lgS3W+Vr3WgsuX
         TpymYrvpFIg4hKFY08fkxXkP6Or/UK0jSmWYPhEVAaQmfbNq2muoyOF7Kos9er8FNYJb
         UAidjHEc3ImWIz/D2KyeOOCxTzAbJVJKT4oPHp00xlKnx8eH9BSgD5DrnLnLiQ5SOwUa
         p2fgwzwDkpGCwKASvOX4+YChtoDwu+fvof++7Vo+Huugu67jNH/aud7x4pFGKxL3KkZl
         ulwGRu/l5hUOEB4m7fKoJdI3jQdMlJPFYsFDwRS4N/JdZO0/iXfHJE78xBSjib//15ju
         e0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BfU5q/0MkozQjzfxR6fQ4i7r2iqV9JZtLKp+vQfhRpU=;
        b=i379av1gjASxhp//r6Y8LhS35ItyK6s2KqHNvvZVrEgVJ1CHgbVPxwGtsS6hnie8Nh
         SKscvDUHHNoOWcABjbTP4YyXYuA65M0qW4IwnYHiOeFuiY9yfhX7vhgB2uXjruMozHaY
         QX72twMqDuKDYi36T4ECpt7Diesa0wGHvBuNiX4GJOADx1b92pDxrdI2Axwoc3EJqBD7
         2o5XGRnoxWy0QlVgo3uosaFc7YwcRnq2VSBJmabThVWAXehrCo+lBFKGyfkOswtRmLP2
         p5QRU3Hvf/yEJTpvbXV5jCdSdphHFdEi19cE1xjgPDxP2yP4dVs0Q37XfT6obvqCfo0X
         fg2w==
X-Gm-Message-State: AOAM532n+kO7492enF3o1/BFqq/QxWXC14wabr6EQ6A5dWwXBCRDcIF0
        GetxdDg2ZYevpKOKMihhre4M4g/LZczI0R1WxaTWhQF/MHQDiA==
X-Google-Smtp-Source: ABdhPJwrXc5XiQNk9mpeiT9wp9gl8G131w1XhrRufMF0fBvxI0VI61qn0pT1Tj8boCstPSgIVF1w1F5swuRlqjbRdKI=
X-Received: by 2002:a05:6808:181c:: with SMTP id bh28mr19520914oib.12.1635098387495;
 Sun, 24 Oct 2021 10:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211013165823.88123-1-bhupesh.sharma@linaro.org>
 <20211013165823.88123-2-bhupesh.sharma@linaro.org> <YXWVYZlCpkSRb7xv@builder.lan>
In-Reply-To: <YXWVYZlCpkSRb7xv@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Sun, 24 Oct 2021 23:29:36 +0530
Message-ID: <CAH=2NtyHpZa0KV5TRDuvciC+uV6mdO03RmEJSKMXES4HZOg-HA@mail.gmail.com>
Subject: Re: [PATCH 1/2] crypto: qce: Add 'sm8150-qce' compatible string check
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
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

Hi Bjorn,

On Sun, 24 Oct 2021 at 22:48, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Wed 13 Oct 11:58 CDT 2021, Bhupesh Sharma wrote:
>
> > Add 'sm8150-qce' compatible string check in qce crypto
> > driver as we add support for sm8150 crypto device in the
> > device-tree in the subsequent patch.
> >
> > Cc: Thara Gopinath <thara.gopinath@linaro.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  drivers/crypto/qce/core.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > index 4c55eceb4e7f..ecbe9f7c6c0a 100644
> > --- a/drivers/crypto/qce/core.c
> > +++ b/drivers/crypto/qce/core.c
> > @@ -306,6 +306,7 @@ static int qce_crypto_remove(struct platform_device *pdev)
> >  static const struct of_device_id qce_crypto_of_match[] = {
> >       { .compatible = "qcom,ipq6018-qce", },
> >       { .compatible = "qcom,sdm845-qce", },
> > +     { .compatible = "qcom,sm8150-qce", },
> >       { .compatible = "qcom,sm8250-qce", },
>
> When I look at linux-next I see qce_crypto_of_match defined as:
>
> static const struct of_device_id qce_crypto_of_match[] = {
>         { .compatible = "qcom,crypto-v5.1", },
>         { .compatible = "qcom,crypto-v5.4", },
>         {}
> };
>
> Can you please help me understand what I'm doing wrong?

Oh, you have missed [PATCH 15/20] from the sm8250 qce crypto addition
series (see [1])

This series is dependent on the sm8250 qce enablement series, as I
noted in the cover letter (see [2]).

However, Thara and Vladimir pointed out backward compatibility issues
with PATCH 15/20 of the first series. So I will send a v5 to fix the
same along with other issues pointed in the v4.

Sorry for any confusion caused.

[1]. https://lore.kernel.org/linux-arm-msm/20211013105541.68045-1-bhupesh.sharma@linaro.org/T/#m566546d32d8da7ee94822dfba625e98fd3496d17
[2]. https://www.spinics.net/lists/linux-arm-msm/msg96053.html

Regards,
Bhupesh
