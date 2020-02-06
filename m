Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59BB4154E90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Feb 2020 23:06:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727450AbgBFWGm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Feb 2020 17:06:42 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37081 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgBFWGm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Feb 2020 17:06:42 -0500
Received: by mail-pg1-f194.google.com with SMTP id z12so28064pgl.4;
        Thu, 06 Feb 2020 14:06:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l+xsy+e2MiIYtNBrIyrqdyfGDG8iY0hLdKQLctRhiwQ=;
        b=iuzMUBjJ99Yco7KgcNzAC0Jeor9ar8XBhCeiRZtt7R+L3fgz52R6wwoL6GBPJBaQLg
         LjmFC0yZycVKZvq9oQbMmgHdc6qoQtrXD1Vio4F0HAQ/+qaak/Icysaw+QPrLQs8hVsR
         r5Kd+UbfDXLhrfwZ6sOshNGdOagfWSwmJgnYuX0IipDum7vc2d1rxqyxIHJlHB6G9oO1
         RTHekq30Hv45DWNvbNKMbS5DH0+/B8CDY1ZSSnKjX8+hyf/mF9hSJ9TWpK3OA8LkwSiW
         XfqAb/2E1MGZPIalnJ6cOl7+3dz/PZTAJfuiRqXcP/ru1yXlzmb/AJ8Hph7ZYOhHfuL9
         faCQ==
X-Gm-Message-State: APjAAAVxwMB1Ng63Q6AzqxXqp6rJaXfP0qk87aB44c3wkedHXqffyO4n
        h7FgsZMeo+ViXrNObSm2RQ==
X-Google-Smtp-Source: APXvYqzC7Okgc6IGJX3X/XtZ5GX7hI/RTTnn/MrDM5Og+S7UdZVwwp9ofbMYGxoOuB+pn3OQB0yacg==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr6041556pfn.89.1581026801476;
        Thu, 06 Feb 2020 14:06:41 -0800 (PST)
Received: from rob-hp-laptop (63-158-47-182.dia.static.qwest.net. [63.158.47.182])
        by smtp.gmail.com with ESMTPSA id i64sm373190pgc.51.2020.02.06.14.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2020 14:06:40 -0800 (PST)
Received: (nullmailer pid 2119 invoked by uid 1000);
        Thu, 06 Feb 2020 22:06:38 -0000
Date:   Thu, 6 Feb 2020 15:06:38 -0700
From:   Rob Herring <robh@kernel.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rnayak@codeaurora.org
Subject: Re: [PATCH V3 1/2] mfd: qcom-spmi-pmic: Convert bindings to .yaml
 format
Message-ID: <20200206220638.GA28227@bogus>
References: <1580997328-16365-1-git-send-email-kgunda@codeaurora.org>
 <5e3c63d0.1c69fb81.c2bba.0957@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e3c63d0.1c69fb81.c2bba.0957@mx.google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 06, 2020 at 11:06:55AM -0800, Stephen Boyd wrote:
> Quoting Kiran Gunda (2020-02-06 05:55:26)
> > Convert the bindings from .txt to .yaml format.
> > 
> > Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
> > ---
> 
> Did something change? Is there a cover letter?
> 
> > diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > new file mode 100644
> > index 0000000..affc169
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> > @@ -0,0 +1,115 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/bindings/mfd/qcom,spmi-pmic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm SPMI PMICs multi-function device bindings
> > +
> > +maintainers:
> > +  - Lee Jones <lee.jones@linaro.org>
> > +  - Stephen Boyd <sboyd@codeaurora.org>
> 
> Please change this to sboyd@kernel.org

Should be the h/w owner, not applier of changes.

> 
> > +
> > +description: |
> > +  The Qualcomm SPMI series presently includes PM8941, PM8841 and PMA8084
> > +  PMICs.  These PMICs use a QPNP scheme through SPMI interface.
> 
> This first sentence will need continual updating. Please drop it.
> 
> > +  QPNP is effectively a partitioning scheme for dividing the SPMI extended
> > +  register space up into logical pieces, and set of fixed register
> > +  locations/definitions within these regions, with some of these regions
> > +  specifically used for interrupt handling.
> > +
> > +  The QPNP PMICs are used with the Qualcomm Snapdragon series SoCs, and are
> > +  interfaced to the chip via the SPMI (System Power Management Interface) bus.
> > +  Support for multiple independent functions are implemented by splitting the
> > +  16-bit SPMI slave address space into 256 smaller fixed-size regions, 256 bytes
> > +  each. A function can consume one or more of these fixed-size register regions.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,pm8941
> > +      - qcom,pm8841
> > +      - qcom,pma8084
> > +      - qcom,pm8019
> > +      - qcom,pm8226
> > +      - qcom,pm8110
> > +      - qcom,pma8084
> > +      - qcom,pmi8962
> > +      - qcom,pmd9635
> > +      - qcom,pm8994
> > +      - qcom,pmi8994
> > +      - qcom,pm8916
> > +      - qcom,pm8004
> > +      - qcom,pm8909
> > +      - qcom,pm8950
> > +      - qcom,pmi8950
> > +      - qcom,pm8998
> > +      - qcom,pmi8998
> > +      - qcom,pm8005
> > +      - qcom,spmi-pmic
> 
> I think we want qcom,spmi-pmic to be there always. To do that we need it
> to look like:
> 
>   compatible:
>     items:
>       enum:
>         - qcom,pm8941
>         ...
>       enum:
>         - qcom,spmi-pmic

Yes, but missing '-' before the enum's.

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      Specifies the SPMI USID slave address for this device.
> > +      For more information see Documentation/devicetree/bindings/spmi/spmi.txt
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-f]+$":

You are going to need to define the specific child nodes with the 
schemas for them, but a SPMI bus schema may be useful.

> > +    type: object
> > +    description:
> > +      Each child node of SPMI slave id represents a function of the PMIC. In the
> > +      example below the rtc device node represents a peripheral of pm8941
> > +      SID = 0. The regulator device node represents a peripheral of pm8941 SID = 1.
> > +
> > +    properties:
> > +      compatible:
> > +        description:
> > +          Compatible of the PMIC device.
> > +
> > +      interrupts:
> > +        maxItems: 2
> > +        description:
> > +          Interrupts are specified as a 4-tuple. For more information
> > +          see Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
> 
> Just make this bindings/spmi/qcom,spmi-pmic-arb.txt so that  we don't
> have to worry about it. Why is max items 2? Isn't it 4? Is this property
> supposed to be specified at all?
> 
> > +
> > +      interrupt-names:
> > +        description:
> > +          Corresponding interrupt name to the interrupts property
> 
> Does this need to be specified either?
> 
> > +
> > +    required:
> > +      - compatible
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    spmi {
> > +        compatible = "qcom,spmi-pmic-arb";
> > +        #address-cells = <2>;
> > +        #size-cells = <0>;
> > +
> > +       pm8941@0 {
> 
> pmic@0
> 
> > +         compatible = "qcom,pm8941";
> > +         reg = <0x0 0x0>;
> 
> Why not include the header file to get the SPMI_USID macro?
> 
> > +
> > +         rtc {
> > +           compatible = "qcom,rtc";
> > +           interrupts = <0x0 0x61 0x1 0x1>;
> > +           interrupt-names = "alarm";
> > +         };
> > +       };
> > +
> > +       pm8941@1 {
> 
> pmic@1
> 
> > +         compatible = "qcom,pm8941";
> > +         reg = <0x1 0x0>;
> > +
> > +         regulator {
> > +           compatible = "qcom,regulator";
> > +           regulator-name = "8941_boost";
> > +         };
> > +       };
> > +    };
> > +...
> > -- 
> > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> >  a Linux Foundation Collaborative Project
