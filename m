Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8693A50BC0C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Apr 2022 17:47:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1449530AbiDVPuX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Apr 2022 11:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234254AbiDVPuW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Apr 2022 11:50:22 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C785DA06
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 08:47:28 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2f16645872fso89662047b3.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Apr 2022 08:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ukTM52ERK2PAH2x9W0trRBxUxYmVFkTS8BhnUeQKe+Y=;
        b=DsZ522CU4y+1NYWFKCKhotBkXppypbRBNkP1GKg8JybU7i/wjy1+8Rdd5zp8dPx3y7
         mDESPEHuJvz9bo0luNm+iExatZnaOjJW/I+UuDUHiWnHTG0O8tPf1ya9A5DXw/7jJI9b
         2Jnt8OXgA9jjqN34PcwbtZCbLvngZ+tbiUOgreIdhPanaIse+8m8Jp3zXm50tNqyWy7Y
         wCp/zcfBpBM4iVEOfZDTV2kTv2hhMSgMFMkVjrXSXTnnjaBMXhlKGaeE1D4OKaE2+ETH
         3kcGzprmxo0XDyZLES7uqpAX4g1BLu+ERpDP50w9vQ0LqH9Z7Lhb51DayDpnYl/7/II4
         6wBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ukTM52ERK2PAH2x9W0trRBxUxYmVFkTS8BhnUeQKe+Y=;
        b=Z0r3aPWOhGN3sLnRs1do7kXFGC3cZBc66NFT4LXXLNSYZIzPdX22Wo7uhGw/MqPUFe
         5mVVIUA6gpuB19aF2D2SFFnj1K82ipcrULEqf8EsaC9NEnS0a4Yb9h8Th3YOqyHjE17/
         NNPsZXi4D0b5MUlRusiwvPVRIN3PH9Zfz5NiehLzuF+ERMNGczsDfEtjuInY2fmUS3KN
         Cc5wvhoG1MobPjtaKZmSm2Sjr7XmSyT95IHaYIgLfuytpQKlfXj0Zo1SIWYP5iJfwrvR
         3leD0/8mZ2Wj1LAnHNktJpZjUHUK88Xsgs/777w7/WgqQntl2rBvr0vJD103KH+W7mxI
         tTDQ==
X-Gm-Message-State: AOAM5316WY26R/iYYgxIKy4oWzdF8frDkGhbuz2U4GDAieAorhAaAbpt
        sOj6NQ01Y/r+TGU4W7uG31DHLJhDRQE30Qe/9JsISQ==
X-Google-Smtp-Source: ABdhPJxCgG9GjIP7oVFKGcnuyzU2sX36ebgw64u4B2HkK1gTlI+6j+IbRHE/2n3VJxjy099NvUbVqO0gEjw0S+0aC6o=
X-Received: by 2002:a81:4c11:0:b0:2d1:1925:cd70 with SMTP id
 z17-20020a814c11000000b002d11925cd70mr5290906ywa.101.1650642447704; Fri, 22
 Apr 2022 08:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220422114841.1854138-1-dmitry.baryshkov@linaro.org>
 <20220422114841.1854138-4-dmitry.baryshkov@linaro.org> <fe9c5691-caa1-79b4-666b-daac8913b546@linaro.org>
In-Reply-To: <fe9c5691-caa1-79b4-666b-daac8913b546@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 22 Apr 2022 18:47:16 +0300
Message-ID: <CAA8EJpr=XE-8fo+99+KjTEffS1jmBibQnbN1T4ZcgkhWCDucpg@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: pci/qcom-pcie: specify reg-names explicitly
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 22 Apr 2022 at 15:55, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/04/2022 13:48, Dmitry Baryshkov wrote:
> > Instead of specifying the enum of possible reg-names, specify them
> > explicitly. This allows us to specify which chipsets need the "atu"
> > regions, which do not. Also it clearly describes which platforms
> > enumerate PCIe cores using the dbi region and which use parf region for
> > that.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/pci/qcom,pcie.yaml    | 96 ++++++++++++++++---
> >  1 file changed, 81 insertions(+), 15 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > index 7210057d1511..e78e63ea4b25 100644
> > --- a/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/qcom,pcie.yaml
> > @@ -35,21 +35,6 @@ properties:
> >            - qcom,pcie-ipq6018
> >        - const: snps,dw-pcie
> >
> > -  reg:
> > -    minItems: 4
> > -    maxItems: 5
>
> This should stay.
>
> > -
> > -  reg-names:
> > -    minItems: 4
> > -    maxItems: 5
> > -    items:
> > -      enum:
> > -        - parf # Qualcomm specific registers
> > -        - dbi # DesignWare PCIe registers
> > -        - elbi # External local bus interface registers
> > -        - config # PCIe configuration space
> > -        - atu # ATU address space (optional)
>
> Move one of your lists for specific compatibles here and name last
> element optional (minItems: 4).
>
> You will need to fix the order of regs in DTS to match the one defined here.

I see your idea. I wanted to be explicit, which platforms need atu and
which do not. You'd prefer not to.
Let's probably drop this for now. The bindings proposed in patch 1
work for now. I will work on updating reg-names later.

>
> > -
> >    interrupts:
> >      maxItems: 1
> >
> > @@ -108,6 +93,87 @@ required:
> >
> >  allOf:
> >    - $ref: /schemas/pci/pci-bus.yaml#
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,pcie-apq8064
> > +              - qcom,pcie-ipq4019
> > +              - qcom,pcie-ipq8064
> > +              - qcom,pcie-ipq8064v2
> > +              - qcom,pcie-ipq8074
> > +              - qcom,pcie-qcs404
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 4
> > +          maxItems: 4
>
> Only maxItems: 4
>
> > +        reg-names:
> > +          items:
> > +            - const: dbi # DesignWare PCIe registers
> > +            - const: elbi # External local bus interface registers
> > +            - const: parf # Qualcomm specific registers
> > +            - const: config # PCIe configuration space
>
> No need for this, instead only maxItems:4
>
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - qcom,pcie-ipq6018
> > +    then:
> > +      properties:
> > +        reg:
> > +          minItems: 5
> > +          maxItems: 5
>
> Only minItems:5 should be needed.
>
> > +        reg-names:
> > +          items:
> > +            - const: dbi # DesignWare PCIe registers
> > +            - const: elbi # External local bus interface registers
> > +            - const: atu # ATU address space (optional)
> > +            - const: parf # Qualcomm specific registers
> > +            - const: config # PCIe configuration space
>
> This can be removed.
>
> All other cases should be merged with the ones here.
>
> Best regards,
> Krzysztof



-- 
With best wishes
Dmitry
