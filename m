Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530C83A5E2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 10:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232604AbhFNIRR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 04:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbhFNIRN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 04:17:13 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64CEC061787
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 01:15:10 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id u11so13522597oiv.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Jun 2021 01:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4pRtgfvLbGPzrLhFG65GMYSzicptmrP7vbR+C97caBc=;
        b=VLHHZ0qLq+e7z8mXy3BFipUHYhcLBO1dtTbP+GpZ8lf5jb4Wb7dMhxrKM/y1J1+0op
         vN46g/Vzkb0i00DVJoeF8QlS5q1e53+oymDEFhYowhF6pCPTB/kOkGV2xGeB/qbzoJIh
         Xw1HJo58vzSk9A7XrMPcc08h355oz320QSQkORduz65QZgI0wvaqDaC/d6+UlqlZlIVw
         aENedEszspBTRK0cT9DKqqfnByy00IvN68Dc9c9ecQHaBN2TFnnAUtiNqFZTvgGKGFIg
         e17ely+2aYpwHizBSy5y32mtnkjOez6fyOeFkXpucVfclQ+sN61lnoyba8EHPObuSDcs
         wGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4pRtgfvLbGPzrLhFG65GMYSzicptmrP7vbR+C97caBc=;
        b=WRzvitmq/EpnEWwomracmNuDcVo8pYjo4K/KsnKUXGdWmrnEKer05y878ks6e1LzWx
         w+1VdmJI3WTFEaJvvzjb2dlV/48f0OowajDQVNoZSNhVcOEHv3RLppgKo6sZceqONF8l
         r3d9L5NSWXmSZrKztklINTk88OhuhNQVc+piU0+V/4uhcSbA7QOAUIDQcUfp8I6pWaf9
         p/vUTD0446T2WKyF1PPTj1jo2Ujz5Ny78BcMhYrGhh1SgqHv++nN35dG0n0I9ABZOZae
         Z4MCiit/LchRXl3Xt3IP/byFQEHHvqYZE+btezVevbnmtbfROeehhdq4NRM1jrE6LYY4
         tnGg==
X-Gm-Message-State: AOAM530Sg3GClmuVQZTDHLyfZXanJfOWN3wIPcvUjhYbDjdg5xnnvAhj
        Un5+U5+jPrKAKa4829rXr+3knQ+1+m8ooRCQaihRQQ==
X-Google-Smtp-Source: ABdhPJwp5tDx5MW8YWHgRbHBggboYibKfTG3AL0Ime7FWwsGYf/0YkJDNZP3s/tm9klzMC7W1IE2swCR3zMVVqiR/tg=
X-Received: by 2002:aca:4bd7:: with SMTP id y206mr9838923oia.40.1623658510036;
 Mon, 14 Jun 2021 01:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210607113840.15435-1-bhupesh.sharma@linaro.org>
 <20210607113840.15435-4-bhupesh.sharma@linaro.org> <YMLRpLoc7LiegLp/@builder.lan>
In-Reply-To: <YMLRpLoc7LiegLp/@builder.lan>
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
Date:   Mon, 14 Jun 2021 13:44:59 +0530
Message-ID: <CAH=2Ntxo3sqYuqe67fh5oqFG_sgnbc26pvvu0Dg=Nsux7tk-YA@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: arm: qcom: Add compatible for
 SA8155p-adp board
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Bjorn,

On Fri, 11 Jun 2021 at 08:29, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Mon 07 Jun 06:38 CDT 2021, Bhupesh Sharma wrote:
>
> > SA8155p-adp board is based on Qualcomm Snapdragon sm8150
> > SoC.
> >
> > Add support for the same.
>
> The SA8155p is similar to SM8150 and we can reuse most things, but I
> think we can afford to add qcom,sa8155p in the DT bindings.

Sure will do the same in v2.

> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Liam Girdwood <lgirdwood@gmail.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Vinod Koul <vkoul@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Andy Gross <agross@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> > Cc: bhupesh.linux@gmail.com
> > Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/arm/qcom.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> > index 9b27e991bddc..b5897f1f9695 100644
> > --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> > +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> > @@ -42,11 +42,13 @@ description: |
> >          sdm660
> >          sdm845
> >          sdx55
> > +        sm8150
>
> Naturally sm8150 should be part of this list, but please also add
> sa8155p as well.

Ok.

> >          sm8250
> >          sm8350
> >
> >    The 'board' element must be one of the following strings:
> >
> > +        adp
> >          cdp
> >          cp01-c1
> >          dragonboard
> > @@ -198,6 +200,12 @@ properties:
> >                - qcom,ipq6018-cp01-c1
> >            - const: qcom,ipq6018
> >
> > +      - items:
> > +          - enum:
> > +              - qcom,sa8155p-adp
> > +              - qcom,sm8150-mtp
> > +          - const: qcom,sm8150
>
> And please split this in two (one qcom,sm8150-mtp and qcom,sm8150, and
> one qcom,sa8155p-adp and qcom,sa8155p).
>
> And note that this is saying that your compatible needs to be one of the
> enum entries, followed by the const, but in your dts you only specified
> qcom,sa8155p-adp. It needs to be:
>
>         compatible = "qcom,sa8155p-adp", "qcom,sa8155p";

Sure will do the same in v2.

Regards,
Bhupesh

> > +
> >        - items:
> >            - enum:
> >                - qcom,qrb5165-rb5
> > --
> > 2.31.1
> >
