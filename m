Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CAF71AACB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 18:05:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1415131AbgDOQBX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 12:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1415130AbgDOQBR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 12:01:17 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AB1C061A0C;
        Wed, 15 Apr 2020 09:01:16 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id r26so191026wmh.0;
        Wed, 15 Apr 2020 09:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=zQEYCWsK2VTVhTYcIOH6YHb5daB8HSEQISlOJ5S/ctM=;
        b=hh+ZM3VfQ/V83XzD//GKCPRGEdlxc5BXb/YYgewaAUGBo+/t38V8qZbVfjJkKR0uNP
         Z36V/wdCdUozeucUKKPQ4ajpkXwd9b39/h2FkM47FhNTu9A1SByQCDEVMtmrVrGUaqt/
         Mp8xrXCgqOfdRFZ4+M5Q82lcyynzolMqfDJ1FoC9/DiDJCGzZncayMykj1+LH1xLucZu
         mRqPxn7EohqFPxtLEHLbeijK+7boHuIgbH3laQX5nsrM4CMtpcQzO0Zu5nOMPg0rJhxu
         PssFdBgGpHV6wffIe8goL/8QwilACF0z8TnC/rDth/KOXQDoZSi7AU450C/Qy4C0GH3L
         Kjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=zQEYCWsK2VTVhTYcIOH6YHb5daB8HSEQISlOJ5S/ctM=;
        b=U+HRowcrTVo72BKEg6dV40cdC5kdFfbKYQrvsPyMx9n45+8e96fhLSXHjS3ClV0V6A
         WH7PyQkbEMeag1F5qSUhJLGZOdkGLsnR9n8ZUW09CbniNdlm+yrrB9Mt8BzFmFXlcBJ7
         k3BPWRRNiZBeNe3si/C7Mg6XCHmOCPbRrp09q2EiNut57Ks8z1TXS4bSnpWwTnnh8cwI
         ZhtVzs0a0l6tBgAS3vpEL/A20jYnOiJqCVR7IsVM5XZ2Qk6NwRAd5shWCi/xN0UsmNMh
         MG+6wTkgbqf7Y2029J1qoBPaHQ97/OlCpVz2WilzkRR9JRPif05psPCbeBg50VESwy0Y
         /r0g==
X-Gm-Message-State: AGi0PuZFnFsFYGQuX2RDbnDUIH9d30eXjas9mTapwDg4bB2Cq/rvVSzZ
        KIDdKrW4vX+ADoHB4IyAOaM=
X-Google-Smtp-Source: APiQypKM6YMefRd6/LPjmQwg9BlaBWlr+762eFtEBIDXPoEVX6g3PQYHa4o9YcPz8OC1jtbOk1NIcQ==
X-Received: by 2002:a1c:4b0a:: with SMTP id y10mr5749163wma.24.1586966473620;
        Wed, 15 Apr 2020 09:01:13 -0700 (PDT)
Received: from AnsuelXPS (host93-255-dynamic.47-79-r.retail.telecomitalia.it. [79.47.255.93])
        by smtp.gmail.com with ESMTPSA id v10sm11768209wrq.45.2020.04.15.09.01.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 09:01:12 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Kishon Vijay Abraham I'" <kishon@ti.com>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        "'linux-arm-msm'" <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20200403002608.946-1-ansuelsmth@gmail.com> <20200403002608.946-2-ansuelsmth@gmail.com> <20200414173838.GA29176@bogus> <00bb01d61321$05bf9b20$113ed160$@gmail.com> <CAL_JsqLyEy_++q5+JsUmg=gpgh=xkSP7XiQrDvje7tiUHzB8KQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLyEy_++q5+JsUmg=gpgh=xkSP7XiQrDvje7tiUHzB8KQ@mail.gmail.com>
Subject: R: [PATCH 2/2] devicetree: bindings: phy: Document dwc3 qcom phy
Date:   Wed, 15 Apr 2020 18:01:10 +0200
Message-ID: <00e301d6133f$15efc1f0$41cf45d0$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQHTPQd2IBqR3z6CHNBmVjX+r+AcmAGqTdeSAYw2ek8CRq9kSAFT2oxuqEl6H+A=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Wed, Apr 15, 2020 at 7:26 AM <ansuelsmth@gmail.com> wrote:
> >
> > > On Fri, Apr 03, 2020 at 02:26:05AM +0200, Ansuel Smith wrote:
> > > > Document dwc3 qcom phy hs and ss phy bindings needed to =
correctly
> > > > inizialize and use usb on ipq806x SoC
> > > >
> > > > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > > > ---
> > > >  .../bindings/phy/qcom,dwc3-hs-usb-phy.yaml    | 65
> > > +++++++++++++++++++
> > > >  .../bindings/phy/qcom,dwc3-ss-usb-phy.yaml    | 65
> > > +++++++++++++++++++
> > > >  2 files changed, 130 insertions(+)
> > > >  create mode 100644
> > > Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
> > > >  create mode 100644
> > > Documentation/devicetree/bindings/phy/qcom,dwc3-ss-usb-phy.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-
> usb-
> > > phy.yaml b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-
> usb-
> > > phy.yaml
> > > > new file mode 100644
> > > > index 000000000000..0bb59e3c2ab8
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-
> > > phy.yaml
> > > > @@ -0,0 +1,65 @@
> > > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/phy/qcom,dwc3-hs-usb-
> phy.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Qualcomm DWC3 HS PHY CONTROLLER
> > > > +
> > > > +maintainers:
> > > > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > > > +
> > > > +description:
> > > > +  DWC3 PHY nodes are defined to describe on-chip Synopsis =
Physical
> > > layer
> > > > +  controllers. Each DWC3 PHY controller should have its own =
node.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: qcom,dwc3-hs-usb-phy
> > > > +
> > > > +  "#phy-cells":
> > > > +    const: 0
> > > > +
> > > > +  regmap:
> > > > +    maxItems: 1
> > > > +    description: phandle to usb3 dts definition
> > > > +
> > > > +  clocks:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > > +
> > > > +  clock-names:
> > > > +    minItems: 1
> > > > +    maxItems: 2
> > > > +    description: |
> > > > +      - "ref" Is required
> > > > +      - "xo"       Optional external reference clock
> > > > +    items:
> > > > +      - const: ref
> > > > +      - const: xo
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - "#phy-cells"
> > > > +  - regmap
> > > > +  - clocks
> > > > +  - clock-names
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
> > > > +
> > > > +    hs_phy_0: hs_phy_0 {
> > > > +      compatible =3D "qcom,dwc3-hs-usb-phy";
> > > > +      regmap =3D <&usb3_0>;
> > >
> > > If the registers for the phy are part of 'qcom,dwc3' then make =
this node
> > > a child of it.
> > >
> >
> > Making this node a child of qcom,dwc3 cause malfunction of the =
driver.
>=20
> Fix the driver then.
>=20
> Rob

Sorry if i bother you but I checked every other usb driver that also =
needs
phy node. I use regmap phandle here just for the fact that it's the
same reg of dwc3. Others use directly the same reg and are outside their
dwc3 usb node. I think I will follow this path and respin this.
I really hope you are good with this.


