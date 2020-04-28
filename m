Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EFCE1BC56F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 18:41:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728191AbgD1QlI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 12:41:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727957AbgD1QlI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 12:41:08 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1DF8C03C1AB
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 09:41:07 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id z25so33678838otq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2020 09:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ej7TTxYPOCUjZ2CQUSr20OUxUMW8qnZz71cmcRHx9Bk=;
        b=u0IbH3M8FSosaaIdXSzKS8Q7157jIXtA/va7tZv0+OV5NyxvG48nxfl09ZhiFGDLev
         nhACwWVrI+K6PQdVZIQ8xRtKyFAFrHDBp+/OEZehPaXnn0V6VZPc+eyN8ihnbYPNx352
         vV6+QMDug8mCIbbhTfQE0gOLACFscEkyp9SI8PSGhFbfaEUtUDRnlhtvrzPcbWKSutmk
         Q1qkS/Tkr4lGf5Du9Q7Is6vR97ws0NLI3sl/jqIkKfQVaGpCdfjaCI3L8LWQ217M3pkc
         KSBkvgKQxC4NL+5rJhcyae3FUCT5WE6Ft+yRf0ZZIjiOhzQVBS3EztA/1zOkFDI0DCkZ
         ZKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ej7TTxYPOCUjZ2CQUSr20OUxUMW8qnZz71cmcRHx9Bk=;
        b=gBFEOtKEcTqzU4qp4yed2/0mhRirIBFeHyN+LF8dURsm7So6qPsIQURYsI4hZln9MJ
         EBYV5wZv9/hegnhrYJ7nxOJaqnMm8bGc8NGxYtE4+s4YQq8ySkEGvgG1fFKYf173YygA
         Aj6+zHA+A1diQDphywWJr/g1EVvB1q3G1AE/o0et7fRTuaFB++NgE2QkIkm2HUajMG7n
         7GVzDDChoG1X9kr+urV+Gv3UGiUKL6jOH36VFF91b7qqhtmwELdnODSqvpTijz4cR2l1
         YZ8Z5RrWiQaabKnAjPD0ULLrYY9wvcmqTg5oVnpzp5SFFHE5px1eETGY/t77UqAGtcao
         2ywg==
X-Gm-Message-State: AGi0PuaNnHmUcKGZLhjDVduyqyTmOgs7b9LkPbFLl9vNuq1tJS96CUWC
        xMIjI3KXMA3zOnbJinJYbjsGOdwRshOSYSuSXxcmug==
X-Google-Smtp-Source: APiQypI5jgRZDess6nlH+QHGWtMVtpKyuiaNv0Q/5uAdeleBiZWLGdLeCKBv2lgWnykl6/7vKyO0iiEsfWwLlXlOqZc=
X-Received: by 2002:a9d:7304:: with SMTP id e4mr13363952otk.243.1588092067350;
 Tue, 28 Apr 2020 09:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200415150244.2737206-1-robert.marko@sartura.hr>
 <20200415150244.2737206-2-robert.marko@sartura.hr> <20200428150930.GA25643@bogus>
In-Reply-To: <20200428150930.GA25643@bogus>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Tue, 28 Apr 2020 18:40:56 +0200
Message-ID: <CA+HBbNF4S=o059AwW3UpNQ8+US1PCQ_edZM+O0m8r0ozJ5TBfw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: add Qualcomm IPQ4019 MDIO bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org, Luka Perkov <luka.perkov@sartura.hr>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Apr 28, 2020 at 5:09 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Apr 15, 2020 at 05:02:46PM +0200, Robert Marko wrote:
> > This patch adds the binding document for the IPQ40xx MDIO driver.
> >
> > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > Cc: Luka Perkov <luka.perkov@sartura.hr>
> > ---
> > Changes from v2 to v3:
> > * Remove status from example
> >
> >  .../bindings/net/qcom,ipq40xx-mdio.yaml       | 61 +++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
> > new file mode 100644
> > index 000000000000..8d4542ccd38c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
> > @@ -0,0 +1,61 @@
> > +# SPDX-License-Identifier: GPL-2.0
>
> Dual license new bindings please:
>
> (GPL-2.0-only OR BSD-2-Clause)
Ok, will change it in next revision.
>
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/qcom,ipq40xx-mdio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm IPQ40xx MDIO Controller Device Tree Bindings
> > +
> > +maintainers:
> > +  - Robert Marko <robert.marko@sartura.hr>
> > +
> > +allOf:
> > +  - $ref: "mdio.yaml#"
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,ipq40xx-mdio
>
> Don't use wildcards in compatible names. Should be SoC specific. If 'all
> the same', then use a fallback to the 1st implementation.
Ok, I will change it to qcom,ipq4019 then.
The whole IPQ40xx series uses the same controller.
>
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +examples:
> > +  - |
> > +    mdio@90000 {
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +      compatible = "qcom,ipq40xx-mdio";
> > +      reg = <0x90000 0x64>;
> > +
> > +      ethphy0: ethernet-phy@0 {
> > +        reg = <0>;
> > +      };
> > +
> > +      ethphy1: ethernet-phy@1 {
> > +        reg = <1>;
> > +      };
> > +
> > +      ethphy2: ethernet-phy@2 {
> > +        reg = <2>;
> > +      };
> > +
> > +      ethphy3: ethernet-phy@3 {
> > +        reg = <3>;
> > +      };
> > +
> > +      ethphy4: ethernet-phy@4 {
> > +        reg = <4>;
> > +      };
> > +    };
> > --
> > 2.26.0
> >
