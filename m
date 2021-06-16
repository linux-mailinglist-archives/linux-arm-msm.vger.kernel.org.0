Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CAD3A923C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 08:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231446AbhFPG2t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 02:28:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231420AbhFPG2q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 02:28:46 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5481EC061767
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 23:26:34 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id t40so1388624oiw.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 23:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9zUgDhkJImxfUh9Hmx75RiDhjdI3YARcNQ9gBrGyxCw=;
        b=XIokmDd7gMh7WJsguRzQznvarxUBTpKC/M0FORL22R5Qkpc7zDDpeDFQZB1QEymigy
         K6jYHoCO7hXbkG+6SY/Je4CYKQgEuLR1Ih3UDnjiHtivGyT+I/dbp2iILm9vWKhpH8ZH
         SZvJvU8Qcb/cbAeoks7gJ2aKGN/iKTkI4p93yurQBQnKm9qXJWVVAGGqyfeYD1dWj+uZ
         ZxlxFm5qsr5r28cNUPdnVR5InzIv3p9uQbJF7r3BkdVXm2LCP+qsfbfoyx80D06q5+I1
         C156+VdIDmctM27juRqX+DijmwtW1TQVItomtVxpjvMfobG/OEWdYneW5K2OpAE/hgVn
         He1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9zUgDhkJImxfUh9Hmx75RiDhjdI3YARcNQ9gBrGyxCw=;
        b=UzggB2JcGCEvli2bdRuMvsswtI2GkI4tpfaCm3uscsQMQy+l8H1mxVAuBTKn1MG6nT
         tDPyXLDFmI+AtuBzR4GMTHHo/RPybBgVJE4CcptjPo3JdQDsn92YqLZGiGnU4qrwhHat
         jDa/EhcOfbqhZuGPcXQEVoEu9DNtfZJqZprS6R0Wnnuj91Pzs/FGLb9T1LVwu0Efd5u8
         Zi78n1h5++1sS4xq/WQGc3HxNtxZChGVGclZNgn7PLh4N/8ZLU9lPmooQMW/M0SMO3vq
         80cCS3zDDkJBldBqZDM5QmyRa3xHjAdX7JON6x3dfVSm+3ZubBb9AHEf9Coj+6noX2kr
         ++SQ==
X-Gm-Message-State: AOAM5332tjZIRiNZhvwYHk8JF6o93GwZcbxy4HLWlw9dDBeXj+jX0nmE
        aVBQI6uOs/QwL2BNN99G7VDAywaHMehjAm0bOf3Opw==
X-Google-Smtp-Source: ABdhPJxMsqZuCXp/LxfKwhV20rJVZBMQCnCg7j7tmAYQRSo241pj8V+0ieCfOfm6j4VGarto5/XKjCkdGRtP4NgaN9Y=
X-Received: by 2002:aca:fc91:: with SMTP id a139mr5788266oii.12.1623824793682;
 Tue, 15 Jun 2021 23:26:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210615074543.26700-1-bhupesh.sharma@linaro.org>
 <20210615074543.26700-3-bhupesh.sharma@linaro.org> <YMkU/on5e92vgIll@yoga>
In-Reply-To: <YMkU/on5e92vgIll@yoga>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Wed, 16 Jun 2021 11:56:22 +0530
Message-ID: <CAH=2Ntx=j3w-yjRm12pqwYGrkfJ5h1cXeY-RNwzEs9tkT25b0Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 compatible for SA8155p-adp
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, bhupesh.linux@gmail.com,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 16 Jun 2021 at 02:30, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Tue 15 Jun 02:45 CDT 2021, Bhupesh Sharma wrote:
>
> > Add pmic-gpio compatible string for pmm8155au pmic
> > found on the SA8155p-adp board.
> >
> > ---

<..snip..>

> >  Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > index f6a9760558a6..80b8a66e29d8 100644
> > --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
> > @@ -27,6 +27,7 @@ PMIC's from Qualcomm.
> >                   "qcom,pm660l-gpio"
> >                   "qcom,pm8150-gpio"
> >                   "qcom,pm8150b-gpio"
> > +                 "qcom,pmm8155au-gpio"
>
> Please keep these sorted alphabetically.

Ok, I will fix this in v3.

Thanks,
Bhupesh
