Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 169E63C63BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jul 2021 21:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236411AbhGLTcK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 15:32:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:33336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235784AbhGLTcK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 15:32:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6E44861042;
        Mon, 12 Jul 2021 19:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626118161;
        bh=j1Mvi65cl2/cIwVJYp7ZDx+Gdipahh4iTI4pBBKB4uA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j5MqUeLwJw5EnEwWB9WXSch7p2OJmp/BZBRck9S50kT3NHdzBhk3Dz23SVjozwLBb
         DjqnBzSEOjJ5qK3mUXpkUHRhUWc9X0L+DyC3RDB/8zG/BUm7w+5yN0ymC5TutyADH8
         4aAnnf6G9yWoueucZB13Ll754IgHpgcLM6Act3aw296HLmPS4FsjyfnyJE2BWghbd+
         nN/r9CK7H8ovQtYbUdbBFtxxvcLClKdvrLYkyTLAbpY5B96ZuvM08Wgswj8hpo257G
         /hnPNrzXa9lzmvgW3PnjLY7FBuKKjKZIWSMVh9n0nZxo5+lw349RK5pwEeWIcd5AXP
         TQN9aUXjHlP4g==
Received: by mail-ed1-f48.google.com with SMTP id s15so29622794edt.13;
        Mon, 12 Jul 2021 12:29:21 -0700 (PDT)
X-Gm-Message-State: AOAM5305HrKd4rDlNfcJIjWgtUtJNakFoTGBpaGfTqa6C4Wcinacppoj
        27rpZGY53vPVtcBev6sMT8y9zGtlqcVuoumNbA==
X-Google-Smtp-Source: ABdhPJzgIAQeV36cxRH5njXhL2qszra4IdOEFO60zdvNQCMqb908NgXTj4OjjfYUnYSuBVnzV9zoETCiKTZ/WAEvXzs=
X-Received: by 2002:a05:6402:5193:: with SMTP id q19mr551574edd.258.1626118160045;
 Mon, 12 Jul 2021 12:29:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
 <20210625234018.1324681-3-bjorn.andersson@linaro.org> <20210701190313.GA2736150@robh.at.kernel.org>
 <YOiHBPH1+7dJN6rn@ripper>
In-Reply-To: <YOiHBPH1+7dJN6rn@ripper>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 12 Jul 2021 13:29:07 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKtn_5b7oyd-bOFv6R-5b-mpKs=jbnt87zPQqDAFLsumg@mail.gmail.com>
Message-ID: <CAL_JsqKtn_5b7oyd-bOFv6R-5b-mpKs=jbnt87zPQqDAFLsumg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: soc: qcom: aoss: Convert to YAML
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Sibi S <sibis@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jul 9, 2021 at 11:29 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Thu 01 Jul 12:03 PDT 2021, Rob Herring wrote:
>
> > On Fri, Jun 25, 2021 at 04:40:17PM -0700, Bjorn Andersson wrote:
> > > Convert to YAML in order to allow validation.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >
> > > I'm aware that this conflicts with Sibi's removal of '#power-domain-cells', but
> > > that's a trivial change regardless of which of the two patches gets in first.
> > >
> > >  .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  90 --------------
> > >  .../bindings/soc/qcom/qcom,aoss-qmp.yaml      | 115 ++++++++++++++++++
> > >  2 files changed, 115 insertions(+), 90 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> > >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> > > deleted file mode 100644
> > > index 3747032311a4..000000000000
> > > --- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
> > > +++ /dev/null
> > > @@ -1,90 +0,0 @@
> > > -Qualcomm Always-On Subsystem side channel binding
> > > -
> > > -This binding describes the hardware component responsible for side channel
> > > -requests to the always-on subsystem (AOSS), used for certain power management
> > > -requests that is not handled by the standard RPMh interface. Each client in the
> > > -SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> > > -The protocol used to communicate in the message RAM is known as Qualcomm
> > > -Messaging Protocol (QMP)
> > > -
> > > -The AOSS side channel exposes control over a set of resources, used to control
> > > -a set of debug related clocks and to affect the low power state of resources
> > > -related to the secondary subsystems. These resources are exposed as a set of
> > > -power-domains.
> > > -
> > > -- compatible:
> > > -   Usage: required
> > > -   Value type: <string>
> > > -   Definition: must be one of:
> > > -               "qcom,sc7180-aoss-qmp"
> > > -               "qcom,sc7280-aoss-qmp"
> > > -               "qcom,sc8180x-aoss-qmp"
> > > -               "qcom,sdm845-aoss-qmp"
> > > -               "qcom,sm8150-aoss-qmp"
> > > -               "qcom,sm8250-aoss-qmp"
> > > -               "qcom,sm8350-aoss-qmp"
> > > -               and:
> > > -               "qcom,aoss-qmp"
> > > -
> > > -- reg:
> > > -   Usage: required
> > > -   Value type: <prop-encoded-array>
> > > -   Definition: the base address and size of the message RAM for this
> > > -               client's communication with the AOSS
> > > -
> > > -- interrupts:
> > > -   Usage: required
> > > -   Value type: <prop-encoded-array>
> > > -   Definition: should specify the AOSS message IRQ for this client
> > > -
> > > -- mboxes:
> > > -   Usage: required
> > > -   Value type: <prop-encoded-array>
> > > -   Definition: reference to the mailbox representing the outgoing doorbell
> > > -               in APCS for this client, as described in mailbox/mailbox.txt
> > > -
> > > -- #clock-cells:
> > > -   Usage: optional
> > > -   Value type: <u32>
> > > -   Definition: must be 0
> > > -               The single clock represents the QDSS clock.
> > > -
> > > -- #power-domain-cells:
> > > -   Usage: optional
> > > -   Value type: <u32>
> > > -   Definition: must be 1
> > > -               The provided power-domains are:
> > > -               CDSP state (0), LPASS state (1), modem state (2), SLPI
> > > -               state (3), SPSS state (4) and Venus state (5).
> > > -
> > > -= SUBNODES
> > > -The AOSS side channel also provides the controls for three cooling devices,
> > > -these are expressed as subnodes of the QMP node. The name of the node is used
> > > -to identify the resource and must therefor be "cx", "mx" or "ebi".
> > > -
> > > -- #cooling-cells:
> > > -   Usage: optional
> > > -   Value type: <u32>
> > > -   Definition: must be 2
> > > -
> > > -= EXAMPLE
> > > -
> > > -The following example represents the AOSS side-channel message RAM and the
> > > -mechanism exposing the power-domains, as found in SDM845.
> > > -
> > > -  aoss_qmp: qmp@c300000 {
> > > -     compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
> > > -     reg = <0x0c300000 0x100000>;
> > > -     interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
> > > -     mboxes = <&apss_shared 0>;
> > > -
> > > -     #power-domain-cells = <1>;
> > > -
> > > -     cx_cdev: cx {
> > > -           #cooling-cells = <2>;
> > > -     };
> > > -
> > > -     mx_cdev: mx {
> > > -           #cooling-cells = <2>;
> > > -     };
> > > -  };
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> > > new file mode 100644
> > > index 000000000000..1b9de8e49356
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
> > > @@ -0,0 +1,115 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Always-On Subsystem side channel binding
> > > +
> > > +maintainers:
> > > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > > +
> > > +description:
> > > +  This binding describes the hardware component responsible for side channel
> > > +  requests to the always-on subsystem (AOSS), used for certain power management
> > > +  requests that is not handled by the standard RPMh interface. Each client in the
> > > +  SoC has it's own block of message RAM and IRQ for communication with the AOSS.
> > > +  The protocol used to communicate in the message RAM is known as Qualcomm
> > > +  Messaging Protocol (QMP)
> > > +
> > > +  The AOSS side channel exposes control over a set of resources, used to control
> > > +  a set of debug related clocks and to affect the low power state of resources
> > > +  related to the secondary subsystems. These resources are exposed as a set of
> > > +  power-domains.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - enum:
> > > +        - "qcom,sc7180-aoss-qmp"
> > > +        - "qcom,sc7280-aoss-qmp"
> > > +        - "qcom,sc8180x-aoss-qmp"
> > > +        - "qcom,sdm845-aoss-qmp"
> > > +        - "qcom,sm8150-aoss-qmp"
> > > +        - "qcom,sm8250-aoss-qmp"
> > > +        - "qcom,sm8350-aoss-qmp"
> > > +      - const: "qcom,aoss-qmp"
> >
> > Don't need quotes. With that and the indentation fixed:
> >
>
> I've installed yamllint and fixed this for v2.
>
> But can you please help me understand why the members of the enum should
> have double indentation here? Is it just that the indentation counts
> from the 'e' and not the '-'?

There's 2 established styles for this. You used one and I picked the
other. I feel that having the extra indent helps distinguish from
missing a '-' which is quite easy to do and miss when staring at the
YAML.

Rob
