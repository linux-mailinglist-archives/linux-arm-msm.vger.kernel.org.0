Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FB802F6334
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jan 2021 15:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729094AbhANOeJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 09:34:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:50352 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727283AbhANOeI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 09:34:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2C0C82222D;
        Thu, 14 Jan 2021 14:33:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610634807;
        bh=JbRFvjrCIx1JvO7RmCHXJc77XvFimKUmn0Ns19DOk3c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=qafo7E0diS7cxP+yWZzMH3e2+BozlBkVT8DILLg5o9fRXAoJH7Q2CCafRbadK6SyP
         G9jRnmhOYGEqv5KvigahIfZ/YEI9wGv0b1ejhhORD+hNcKKrVr/oKD+W+clIDstxY4
         EHesbAdqyFUplFESM5/SMPOOwgsN2ZgXIR5y7Vrdx9VgOviO+4Fx2OqIZ3qHlu/hUC
         0e4zW7kLbFgg8+eNdlj6DDlWQOX/CT30CjnGoBdkM9oVbw2hay3ai0af0v56xVbTQS
         RdGlT/6G8EIKEVZDyOOnsw6fHwzAAJuPNemN2B3mXE7zRhYPF4wZgkn3mgo0CB1dMl
         36kbkIyP0bCwA==
Received: by mail-ej1-f47.google.com with SMTP id f4so8457936ejx.7;
        Thu, 14 Jan 2021 06:33:27 -0800 (PST)
X-Gm-Message-State: AOAM531pmdJR7kHmZULmmF1SKlbBZosJn8AtRJMCBk2+Yq50kpTAJ4xB
        qtEvZdP3ZIqnv3fP9UN/6/Lp1p5P/q9l/mCR4A==
X-Google-Smtp-Source: ABdhPJwQq1I+ypuzWW9MapLKokeKNNLIZhPNSYsRoAFS5ep4UvJHv3onc1ad6w6jFJUPYEAFlE0NxFDoSdJZYydtkJ4=
X-Received: by 2002:a17:906:4146:: with SMTP id l6mr5439570ejk.341.1610634805688;
 Thu, 14 Jan 2021 06:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20201220165845.3712599-1-dmitry.baryshkov@linaro.org>
 <20201220165845.3712599-2-dmitry.baryshkov@linaro.org> <20201231225007.GA2509172@robh.at.kernel.org>
 <CAA8EJpp7cJO9Dej3uicPA0+BccqVjs=VphDmGSj05t7SeypAfQ@mail.gmail.com>
In-Reply-To: <CAA8EJpp7cJO9Dej3uicPA0+BccqVjs=VphDmGSj05t7SeypAfQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 14 Jan 2021 08:33:08 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+1rMKgiumshe2BMSMS-hn03pjmfF3P90j=o8kNQTGCLQ@mail.gmail.com>
Message-ID: <CAL_Jsq+1rMKgiumshe2BMSMS-hn03pjmfF3P90j=o8kNQTGCLQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: qcom,qca639x: add binding for
 QCA639x defvice
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 2, 2021 at 9:41 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Hello,
>
> On Fri, 1 Jan 2021 at 01:50, Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Dec 20, 2020 at 07:58:42PM +0300, Dmitry Baryshkov wrote:
> > > Qualcomm QCA639x is a family of WiFi + Bluetooth SoCs, with BT part
> > > being controlled through the UART and WiFi being present on PCIe bus.
> > > Both blocks share common power sources. Add binding to describe power
> > > sequencing required to power up this device.
> > >
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  .../devicetree/bindings/mfd/qcom,qca639x.yaml | 84 +++++++++++++++++++
> > >  1 file changed, 84 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml b/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
> > > new file mode 100644
> > > index 000000000000..d43c75da136f
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
> > > @@ -0,0 +1,84 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: "http://devicetree.org/schemas/mfd/qcom,qca639x.yaml#"
> > > +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
> > > +
> > > +title: Qualcomm QCA639x WiFi + Bluetoot SoC bindings
> > > +
> > > +maintainers:
> > > +  - Andy Gross <agross@kernel.org>
> > > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > > +
> > > +description: |
> > > +  This binding describes thes Qualcomm QCA6390 or QCA6391 power supplies and
> > > +  enablement pins.
> >
> > Humm, this should really be for the whole device. For BT/WiFi chips
> > we've gotten away with 2 nodes for each interface. If that doesn't work
> > here, then I think this needs to be 1 node for all, not 3 as it seems
> > you are doing.
>
> 2 nodes: one for common power sequencer and one for bluetooth part.
> WiFi part doesn't need a separate node, but see below.
>
> >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,qca639x
> >
> > List each device, we don't do wildcards in compatible strings.
>
> Ack. I will change this to qca6390, as 6391 should be fully compatible
> from the power sequence point of view.
>
> >
> > > +
> > > +  '#power-domain-cells':
> > > +    const: 0
> > > +
> > > +  pinctrl-0: true
> > > +  pinctrl-1: true
> > > +
> > > +  pinctrl-names:
> > > +    items:
> > > +      - const: default
> > > +      - const: active
> > > +
> > > +  vddaon-supply:
> > > +    description:
> > > +      0.95V always-on LDO power input
> > > +
> > > +  vddpmu-supply:
> > > +    description:
> > > +      0.95V LDO power input to PMU
> > > +
> > > +  vddrfa1-supply:
> > > +    description:
> > > +      0.95V LDO power input to RFA
> > > +
> > > +  vddrfa2-supply:
> > > +    description:
> > > +      1.25V LDO power input to RFA
> > > +
> > > +  vddrfa3-supply:
> > > +    description:
> > > +      2V LDO power input to RFA
> > > +
> > > +  vddpcie1-supply:
> > > +    description:
> > > +      1.25V LDO power input to PCIe part
> > > +
> > > +  vddpcie2-supply:
> > > +    description:
> > > +      2V LDO power input to PCIe part
> >
> > Do the PCIe supplies have to be on if only the BT part is used?
>
> Good question. The documentation just tells us to power up all rails.
> There are further internal voltage regulators taking care of current
> qca639x mode
>
> >
> > Supplies are refcounted, so I'd suggest just duplicating the supplies in
> > both the BT and PCIe nodes.
>
> While for BT it would be easy, for PCIe it is not that easy. We have
> to make sure that the chip is powered up before the respective PCIe
> bus is probed (basically before the PCIe controller driver is probed).
> I ended up putting a reference to the PCIe PHY device node, making
> sure that qca6391 is powered up before the PCIe PHY driver is probed.
> PCIe device node itself has its own power-domains entry (PCIE_0_GDSC).

This is an abuse of the power-domains binding and a complete hack, so
no. The wifi part should be a child node on the PCI bus. That's the
only acceptable solution for DT.

Obviously there's a probe chicken and egg problem for Linux, but for
DT it doesn't matter. You have 2 options. You can fix PCIe to force
probe devices with a DT node (and lots of folks would appreciate it
because you aren't the only one needing it). If there's a DT node,
then you know there is a device there. This is what MDIO bus does. Or
you can keep your misc driver, but it needs to go find the PCIe child
node itself. IOW, you have to create the platform device yourself in
the initcall rather than rely on the DT code to create one.

Personally, I wouldn't accept the 2nd solution as I think it is still
a hack, but I won't object.

Rob
