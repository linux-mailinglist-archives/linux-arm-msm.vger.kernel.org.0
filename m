Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79755F236D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Oct 2022 15:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbiJBNrE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Oct 2022 09:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiJBNrD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Oct 2022 09:47:03 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894202C640
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Oct 2022 06:47:02 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-358bf076f1fso15828837b3.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Oct 2022 06:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=vMq1GLlUF20kEgsMYV1tAQ/MEwS5+GaRhNeS6W1gqtc=;
        b=rZifux+aDRURitEFx6UMA91HolG3SuermFTvd7daQQNqUrjIAf1dViD5uaag7cWkxJ
         quvYpkg4F0LbmosvwUnNHRhExTnfJiIXWBRYUmS4HHILRhRK28fKNrjVYRjgQ3Vs9/Dw
         J8JttMr6vJYw0RA+kOvvuY5F6Vm9FuwyvY9oYcDTxH9mfQEuzSjH42boCldN5sRT8Kke
         ccDmbxQP7P2N6B8wzkltaAGJAuV8Ej2kkCnCrPy5etmGimu8uyrj/ch5u+yNjCvyY9uc
         InS28fgCQBhEm1vbVphaaJE7jjqxvJ/MbIGyu+C8mBroUcRU7mJtlQeU+u/bjyvWmrX8
         dcmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=vMq1GLlUF20kEgsMYV1tAQ/MEwS5+GaRhNeS6W1gqtc=;
        b=5JIZC3PLHZ+XcHuWxayFyQ2zMcgKSEs8dSDX96a0u0YGcRnuAhFQDJwuMjxuGpkESB
         gVSPEkWHfg4NctNhzMyYNe/vIFDOW+kgj9RZGGCCC3mt6IU+zW0csKOuPUCQ/Q6EanjQ
         vcUomgwiKALR6Zcj1k//9KJ6mtnlB3m8OgM8Axc7VyAOU0cToBzoK998DRl20kL9prZx
         YNj0YvVVXW/I02WUHdrXa2LKN1o6+hYe3q7cztfHVbh2q1KxzOyTArw69Yu551NXl+Uk
         TEAc0g+th67mRunkC8+ORv9StcSKIWeN1Qeysb5Hng8v/Y6xROQJN2UM7LAo5RjAsOco
         Z/YQ==
X-Gm-Message-State: ACrzQf01/pPf2roI08jMMbPmSKW3Z5ZUBNd7CNRhmagkzZPytoq1L/pr
        SN/NbOMn5XgIQyTTycBUXKZMLDfyfQzIhS7FtRKYHA==
X-Google-Smtp-Source: AMsMyM6Tn85hamj4pv2OxnewpHPKst2tlq8hdSk1TlSr4/p9L3z1a+N9qpuVZodypx+3uCeYyumwBTWgNMEHzCmxnB4=
X-Received: by 2002:a0d:d68a:0:b0:350:a7f0:7b69 with SMTP id
 y132-20020a0dd68a000000b00350a7f07b69mr16544941ywd.132.1664718420530; Sun, 02
 Oct 2022 06:47:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220930212052.894834-1-dmitry.baryshkov@linaro.org> <d1a26c97-75db-5d09-4c4f-77ed4fed1683@linaro.org>
In-Reply-To: <d1a26c97-75db-5d09-4c4f-77ed4fed1683@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 2 Oct 2022 16:46:49 +0300
Message-ID: <CAA8EJpoUtfWFR315jiC8PzPQydM9kT3kQYeqyOav-P9=qZKO2w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: YAML-ify SSBI bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
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

On Sat, 1 Oct 2022 at 12:43, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 30/09/2022 23:20, Dmitry Baryshkov wrote:
> > Convert arm/msm/ssbi.txt yo YAML, moving it to the directory with SoC
> > bindings (soc/qcom/).
>
> I think this should go to "bus" instead. Actually we could put there as
> well GSBI and few others...

ack

>
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../devicetree/bindings/arm/msm/ssbi.txt      | 18 ------
> >  .../bindings/soc/qcom/qcom,ssbi.yaml          | 63 +++++++++++++++++++
> >  2 files changed, 63 insertions(+), 18 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/arm/msm/ssbi.txt
> >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/arm/msm/ssbi.txt b/Documentation/devicetree/bindings/arm/msm/ssbi.txt
> > deleted file mode 100644
> > index 54fd5ced3401..000000000000
> > --- a/Documentation/devicetree/bindings/arm/msm/ssbi.txt
> > +++ /dev/null
> > @@ -1,18 +0,0 @@
> > -* Qualcomm SSBI
> > -
> > -Some Qualcomm MSM devices contain a point-to-point serial bus used to
> > -communicate with a limited range of devices (mostly power management
> > -chips).
> > -
> > -These require the following properties:
> > -
> > -- compatible: "qcom,ssbi"
> > -
> > -- qcom,controller-type
> > -  indicates the SSBI bus variant the controller should use to talk
> > -  with the slave device.  This should be one of "ssbi", "ssbi2", or
> > -  "pmic-arbiter".  The type chosen is determined by the attached
> > -  slave.
> > -
> > -The slave device should be the single child node of the ssbi device
> > -with a compatible field.
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml
> > new file mode 100644
> > index 000000000000..6154f7222899
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ssbi.yaml
> > @@ -0,0 +1,63 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: "http://devicetree.org/schemas/soc/qcom/qcom,ssbi.yaml#"
> > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>
> Drop quotes from both above.

ack

>
> > +
> > +title: Qualcomm Single-wire Serial Bus Interface (SSBI)
> > +
> > +description:
> > +  Some Qualcomm MSM devices contain a point-to-point serial bus used to
> > +  communicate with a limited range of devices (mostly power management
> > +  chips).
> > +
> > +maintainers:
> > +  - Andy Gross <agross@kernel.org>
> > +  - Bjorn Andersson <andersson@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,ssbi
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  qcom,controller-type:
> > +    description:
> > +      Indicates the SSBI bus variant the controller should use to talk
> > +      with the slave device. The type chosen is determined by the attached
> > +      slave.
> > +    enum:
> > +      - ssbi
> > +      - ssbi2
> > +      - pmic-arbiter
> > +
> > +  pmic:
> > +    type: object
>
> This is quite unspecific... Can we make it a ref to some PMICs schemas?

Yes, I thought about listing all compats, but probably a $ref:
../mfd/qcom-pm8xxx.yaml# makes more sense.

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - qcom,controller-type
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    ssbi@c00000 {
> > +        compatible = "qcom,ssbi";
> > +        reg = <0x00c00000 0x1000>;
> > +        qcom,controller-type = "pmic-arbiter";
> > +
> > +        pmic {
> > +            compatible = "qcom,pm8821";
> > +            interrupt-parent = <&msmgpio>;
> > +            interrupts = <76 IRQ_TYPE_LEVEL_LOW>;
> > +            #interrupt-cells = <2>;
> > +            interrupt-controller;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +        };
> > +    };
> > +...
>
> Best regards,
> Krzysztof
>


-- 
With best wishes
Dmitry
