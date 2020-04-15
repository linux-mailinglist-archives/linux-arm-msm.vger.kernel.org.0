Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D92F41AA927
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 15:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2636306AbgDONyT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 09:54:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:41648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2636302AbgDONyS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 09:54:18 -0400
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F28F020857;
        Wed, 15 Apr 2020 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586958857;
        bh=B15MaIVrWewq/916Cap1EesX1id/d+R6e9kbZ3N8wiQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ahglTXwgdwXbfVZcOtNDx1KsOOau6yffgj9Ih4cOkgwpTOrX6P2BqHNUuEFbN3D6O
         cz/UpstDmxXC01/8iUOi130PdlpRtglOr1msICrVlCTAeRYNZF4ynxNf7Y70si0NH9
         PIba5HxCfXgGfkb3kepnhfJp+Xp2FxifyyJBkdiE=
Received: by mail-qt1-f172.google.com with SMTP id w29so12806665qtv.3;
        Wed, 15 Apr 2020 06:54:16 -0700 (PDT)
X-Gm-Message-State: AGi0Puav4lMPZxenCWTac/sq/rgfxBTtaAeIlkGVSbOGPomDzE3KB0IS
        A8AZ8C0ZBvOYPaca7AkTELtYjCxTf5Qmatgiyw==
X-Google-Smtp-Source: APiQypKI6qV3r6q6jt+02uZBi1c0wucvc4BEiZrv0E6a0Z2pq81a4adZDUqe6s+84azNEKAJXSrtxJKnuAPPyKpC9P0=
X-Received: by 2002:ac8:7cba:: with SMTP id z26mr11595071qtv.143.1586958855988;
 Wed, 15 Apr 2020 06:54:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200403002608.946-1-ansuelsmth@gmail.com> <20200403002608.946-2-ansuelsmth@gmail.com>
 <20200414173838.GA29176@bogus> <00bb01d61321$05bf9b20$113ed160$@gmail.com>
In-Reply-To: <00bb01d61321$05bf9b20$113ed160$@gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 15 Apr 2020 08:54:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLyEy_++q5+JsUmg=gpgh=xkSP7XiQrDvje7tiUHzB8KQ@mail.gmail.com>
Message-ID: <CAL_JsqLyEy_++q5+JsUmg=gpgh=xkSP7XiQrDvje7tiUHzB8KQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] devicetree: bindings: phy: Document dwc3 qcom phy
To:     Ansuel Smith <ansuelsmth@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Apr 15, 2020 at 7:26 AM <ansuelsmth@gmail.com> wrote:
>
> > On Fri, Apr 03, 2020 at 02:26:05AM +0200, Ansuel Smith wrote:
> > > Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> > > inizialize and use usb on ipq806x SoC
> > >
> > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > ---
> > >  .../bindings/phy/qcom,dwc3-hs-usb-phy.yaml    | 65
> > +++++++++++++++++++
> > >  .../bindings/phy/qcom,dwc3-ss-usb-phy.yaml    | 65
> > +++++++++++++++++++
> > >  2 files changed, 130 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
> > >  create mode 100644
> > Documentation/devicetree/bindings/phy/qcom,dwc3-ss-usb-phy.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-
> > phy.yaml b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-
> > phy.yaml
> > > new file mode 100644
> > > index 000000000000..0bb59e3c2ab8
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-
> > phy.yaml
> > > @@ -0,0 +1,65 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/qcom,dwc3-hs-usb-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm DWC3 HS PHY CONTROLLER
> > > +
> > > +maintainers:
> > > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > > +
> > > +description:
> > > +  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical
> > layer
> > > +  controllers. Each DWC3 PHY controller should have its own node.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: qcom,dwc3-hs-usb-phy
> > > +
> > > +  "#phy-cells":
> > > +    const: 0
> > > +
> > > +  regmap:
> > > +    maxItems: 1
> > > +    description: phandle to usb3 dts definition
> > > +
> > > +  clocks:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    description: |
> > > +      - "ref" Is required
> > > +      - "xo"       Optional external reference clock
> > > +    items:
> > > +      - const: ref
> > > +      - const: xo
> > > +
> > > +required:
> > > +  - compatible
> > > +  - "#phy-cells"
> > > +  - regmap
> > > +  - clocks
> > > +  - clock-names
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
> > > +
> > > +    hs_phy_0: hs_phy_0 {
> > > +      compatible = "qcom,dwc3-hs-usb-phy";
> > > +      regmap = <&usb3_0>;
> >
> > If the registers for the phy are part of 'qcom,dwc3' then make this node
> > a child of it.
> >
>
> Making this node a child of qcom,dwc3 cause malfunction of the driver.

Fix the driver then.

Rob
