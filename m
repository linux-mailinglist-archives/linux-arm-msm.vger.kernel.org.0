Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2948E44FE20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Nov 2021 06:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhKOFRw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 15 Nov 2021 00:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229666AbhKOFRt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 15 Nov 2021 00:17:49 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDC8C061767
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 21:14:53 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso25439783ots.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Nov 2021 21:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BMbEPtsbChaQ9kwcj5OuQcbYWqd3cNOAC83nr5T8yyI=;
        b=DHEFZoB9bkdBRG/oDo/N4tyJjtDpz8D14UVrZUnxt8V870CTf+qFHI/lvtvuHqRB/S
         0G0cjwSQGbh2B1qLGr73dpG/vQULcOEreyjmvDTjPnUDXuObqmEtgniwz4vo5XbksBVg
         vCCncJQQhH3fcNQbTYmJPBQxrlMraOGsSKdodP4JgpkTMJIwrubWgZrFda1g8OIzTNxm
         Hvifk8oz7cvw0SB76JMeE7rzbvOcaciTbzgb4U+5vt6012qcEIsys86HzCh47wcNbu0E
         veJdQWV5l4be7+kxFoPzZ6NolTqC7Gt177WZ62AeYA8gsmgry5iFCmjYgM5mYCp8Dk3j
         YlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BMbEPtsbChaQ9kwcj5OuQcbYWqd3cNOAC83nr5T8yyI=;
        b=sJ3hEJYdMxso5JFiqDTotugYMvbiJWpDZ/1+Nef6DwS53be6JY5nV15FwHkmrnyM8D
         cL2yrKj5/1X8Iu/b35JRL6Y1dh15sEGQOFoSOTO8EN6ZPdklb0P2Pt9Fb5UBZOWqPXk2
         oX8qzoNq+SK31/JRmCA0sSMdYguChi/CtzArkxA5NvkpT4724DAVkEv4h+yRGdG2JKha
         4PEq5uwpgTbgZp+sPILiYo5NGgKAnz1HXrJkJtQqka5PL9LTiz231Kui9E+C44mXWsjK
         /Mw19VCpQ4TLk/Ju3FMpwhy3c/1+JsA/gUSw7XWGN1+AJosiXKurjK7G+Eti03aVTxoQ
         JDvA==
X-Gm-Message-State: AOAM531C7HYmmzpjaw6iouLjd7fdm2i/IsTMooGz/efd7BhuRfBiPuMR
        Q2DHZpqs10MSiUKEJLVZqL2rCpiZy+epKiQw+ko9ig==
X-Google-Smtp-Source: ABdhPJz3TTMNAa2dJFRzkpEI9ELUZYw8ZgbwV5c101o89o5/Ov2SfAi97SBBev+zEl8y8GYrD7s2hO/0jqAVRmXvwEo=
X-Received: by 2002:a9d:63d2:: with SMTP id e18mr15449878otl.28.1636953293247;
 Sun, 14 Nov 2021 21:14:53 -0800 (PST)
MIME-Version: 1.0
References: <20211110105922.217895-1-bhupesh.sharma@linaro.org>
 <20211110105922.217895-18-bhupesh.sharma@linaro.org> <5b8d5f23-e766-5b9c-986c-ef70fae9119e@linaro.org>
In-Reply-To: <5b8d5f23-e766-5b9c-986c-ef70fae9119e@linaro.org>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 15 Nov 2021 10:44:42 +0530
Message-ID: <CAH=2NtyD4fFNn2VNw8ha=NHVTB+A8TNTKGNL8iVmwBKZUfTyVQ@mail.gmail.com>
Subject: Re: [PATCH v5 17/22] crypto: qce: Print a failure msg in case probe() fails
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        bhupesh.linux@gmail.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
        herbert@gondor.apana.org.au, davem@davemloft.net,
        stephan@gerhold.net, Bjorn Andersson <bjorn.andersson@linaro.org>,
        Thara Gopinath <thara.gopinath@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Vladimir,

On Fri, 12 Nov 2021 at 16:12, Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Bhupesh,
>
> On 11/10/21 12:59 PM, Bhupesh Sharma wrote:
> > Print a failure message (dev_err) in case the qcom qce crypto
> > driver probe() fails.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Reviewed-by: Thara Gopinath <thara.gopinath@linaro.org>
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >   drivers/crypto/qce/core.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
> > index 98784d63d78c..7c90401a2ef1 100644
> > --- a/drivers/crypto/qce/core.c
> > +++ b/drivers/crypto/qce/core.c
> > @@ -280,6 +280,7 @@ static int qce_crypto_probe(struct platform_device *pdev)
> >   err_mem_path_disable:
> >       icc_set_bw(qce->mem_path, 0, 0);
> >   err:
> > +     dev_err(dev, "%s failed : %d\n", __func__, ret);
> >       return ret;
> >   }
> >
> >
>
> in my opinion expressed earlier this change is not needed, but I'll recede,
> if somebody thinks that the change is useful in any way.

As I mentioned in the reply to the review comments to the previous
series, the need for this failure message was actually felt to address
failures seen with boot-on crypto tests via
'CRYPTO_MANAGER_EXTRA_TESTS'.

So, I would suggest keeping this patch in, unless there are some major
concerns with the change.

Regards,
Bhupesh
