Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03CC55135DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 15:58:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347843AbiD1OBO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 10:01:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347803AbiD1OBN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 10:01:13 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9E04927D
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 06:57:58 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id w17so9145583ybh.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 06:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SJe698o7gODypcByE9ePK4Qg/fkXO+ivrxsbVZOmzBk=;
        b=l3T7RAFxRSJb91MSwmwRPLIDwF2OB9ZTbNvraDs5XaX48qnT/Vg8YNvqtUZapMMqEv
         fkGuXMKvdwHsY1FwwyVljJXMzLddZ5tKF1ZOGa/aL26FroKeAoh3S3NREbMoBO4h5urB
         lqODuWslM1VP0aQGs1sVTjSJN7NCeSIIXvRdyOqj70BQmAMJ9SMQlf87HpJun0JnpoGS
         klt8gZcWFgRmwlomB2PM5Fq3dQWoQPPfOW1+342iXLplc4FM4y3jHk7Ot4m8GwUUE0By
         7teSJn+4e7CVgHVdD96K5TYWmdTUDsSo6ivSZrDyfeDfVMKpehfy0NLKWr+X7Vz5Y1cs
         fZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SJe698o7gODypcByE9ePK4Qg/fkXO+ivrxsbVZOmzBk=;
        b=VFmAQpRReaxuYnvVKQzE7Ni/jg0zTcCLA6sS89sSLhbroRuCBr///MjT31FZF6cM8S
         5oNvuj8ltKGEZRbu0P/7zpbZ/Fn4mgI+Jg8xU8pn2NP8KNOpnVnAhFMRaKU9vMG8qXOa
         l0rJewIOC/5bxn2vjesCKzjA7FBC2RtGOMb/LJZgUnrqgU/MNW08ld7cONB1HWqHV/AZ
         jI18/ZPQK45EYf416SXdQdCTKWXbOp6Tzqpk6jyHAPgd267ZA1pXlr92QKmUMH1FY7Ec
         KFqisYeEJ7xVURDetg4aTk/zv/YJNyV/lSVkTZ9koQfNzOhypI84wbw4yf/feT2IOz7R
         0QuA==
X-Gm-Message-State: AOAM530g4zMbDYlPRCPjey+ITTarBwB4UVrdA6vFWncwt01eU/7hwxiE
        94VIejbfV0RVcYUO70fIiuf/8oSNEGV8ICg1h4dDQQ==
X-Google-Smtp-Source: ABdhPJxJv2eAuVeslxQvXEke86d8yqVpJ0kQCDz2x0CAaD1m/uZ7s7QueGTZh4z4ks1FIzEM//CGr6W7g+m/tJ4oMME=
X-Received: by 2002:a25:dccf:0:b0:648:a757:ad34 with SMTP id
 y198-20020a25dccf000000b00648a757ad34mr12926060ybe.66.1651154277289; Thu, 28
 Apr 2022 06:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220428115934.3414641-1-dmitry.baryshkov@linaro.org>
 <20220428115934.3414641-7-dmitry.baryshkov@linaro.org> <6bd8eb4e-81eb-7e87-155b-f48b487e16ae@linaro.org>
In-Reply-To: <6bd8eb4e-81eb-7e87-155b-f48b487e16ae@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Thu, 28 Apr 2022 16:57:45 +0300
Message-ID: <CAA8EJpq38EudVcb7quuk1u85Cw+hJADxagkV7rN7fP9A-fz-Wg@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] dt-bindings: pci/qcom,pcie: support additional MSI interrupts
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, 28 Apr 2022 at 15:08, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/04/2022 13:59, Dmitry Baryshkov wrote:
> > On Qualcomm platforms each group of 32 MSI vectors is routed to the
> > separate GIC interrupt. Document mapping of additional interrupts.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/pci/qcom,pcie.yaml    | 51 ++++++++++++++++++-
> >  1 file changed, 50 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > index 0b69b12b849e..a8f99bca389e 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > @@ -43,11 +43,20 @@ properties:
> >      maxItems: 5
> >
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 8
> >
> >    interrupt-names:
> > +    minItems: 1
> >      items:
> >        - const: msi
> > +      - const: msi2
> > +      - const: msi3
> > +      - const: msi4
> > +      - const: msi5
> > +      - const: msi6
> > +      - const: msi7
> > +      - const: msi8
> >
> >    # Common definitions for clocks, clock-names and reset.
> >    # Platform constraints are described later.
> > @@ -623,6 +632,46 @@ allOf:
> >          - resets
> >          - reset-names
> >
> > +    # On newer chipsets support either 1 or 8 msi interrupts
> > +    # On older chipsets it's always 1 msi interrupt
> > +  - if:
> > +      properties:
> > +        compatibles:
> > +          contains:
> > +            enum:
> > +              - qcom,pcie-msm8996
> > +              - qcom,pcie-sc7280
> > +              - qcom,pcie-sc8180x
> > +              - qcom,pcie-sdm845
> > +              - qcom,pcie-sm8150
> > +              - qcom,pcie-sm8250
> > +              - qcom,pcie-sm8450-pcie0
> > +              - qcom,pcie-sm8450-pcie1
> > +    then:
> > +      oneOf:
> > +        - properties:
> > +            interrupts:
> > +              minItems: 1
>
> minItems should not be needed here and in places below, because it is
> equal to maxItems.

Maybe it's a misunderstanding from my side. In the top level we have
the min = 1, max = 8.
How does that interfere with these entries? In other words, if we e.g.
omit minItems here, which setting would preveal: implicit minItems = 8
(from maxItems = 8) or minItems = 1 in the top level?

> > +              maxItems: 1
> > +            interrupt-names:
> > +              minItems: 1
> > +              maxItems: 1
> > +        - properties:
> > +            interrupts:
> > +              minItems: 8
> > +              maxItems: 8
> > +            interrupt-names:
> > +              minItems: 8
> > +              maxItems: 8
> > +    else:
> > +      properties:
> > +        interrupts:
> > +          minItems: 1
> > +          maxItems: 1
> > +        interrupt-names:
> > +          minItems: 1
> > +          maxItems: 1
> > +
> >  unevaluatedProperties: false
> >
> >  examples:
>
>
> Best regards,
> Krzysztof



-- 
With best wishes
Dmitry
