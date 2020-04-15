Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 641121AA05D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 14:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369239AbgDOM0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 08:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S369235AbgDOM0D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 08:26:03 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8A71C061A0C;
        Wed, 15 Apr 2020 05:26:02 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id g12so10924149wmh.3;
        Wed, 15 Apr 2020 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:references:in-reply-to:subject:date:message-id
         :mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=skeYTYKzmzw0IuNoRhgN9uuu5AMw+zDWRV9qTkZ9/wo=;
        b=hDPG2ZP6hRayOhxEl9bl96wKYSY4jI3Pl4DzEBF/myeQDcEbcS9vgku/khXjehcANC
         7rTxMn9Jf8keGqwZ3Ou/eVkjpFx6lskO/XH1+ypIrr+hFPRpEQdPE5CKnnMWCmKNYmtj
         WX9g+PPxXeqn9ci5LhVNWQx8SfNXT0AV5I9eAVw/VGrbekPpaiHbHJgO+XiWsqtHVxZv
         yCGIJ/4jAId0wNWXvYVHMr44yXGQB/E7W9jzwzQGa5w4zovl7M3oSsk2L/i2sAlHLPX/
         HsSb+MdwIW6WPr6Wh4GOx2qwOkXrwBafKhOqxNNGr32WTjkakff0USOZ7nOZTqiSeGTN
         ziDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-transfer-encoding:content-language
         :thread-index;
        bh=skeYTYKzmzw0IuNoRhgN9uuu5AMw+zDWRV9qTkZ9/wo=;
        b=Kabw1x+ouHCuIw/2eAk7qsSjo4OLiSjYPMAK+n1sNdo81M4QwkYEcafPxqMN6o+oDf
         RC83FRONjeynxw5KL2lYZ/vfZVzAgErxBkWPHPE1GAuNLo7Cc1djEnmKb8LgsrMDAMxv
         zMu8KGsaOAX1/Ymr3fPYNFFvH7hzCmrdmgHSuSEt3jhzmYlfOFBjs28eJigBOVrKABt7
         F/L7LcO1vbfgyo/7gBvCkAuSQfQq13EdWBJnR5SxNmJoGIfspCxs3pn8do/gizX2NKfP
         +RVQ+mt2kSaADJsGslqF2fYPX34tY5/Zj+Dx3iB23+xbI3/0fbE6OruVpUpW2sFJFnAe
         VhSw==
X-Gm-Message-State: AGi0PubitDKhCN6gKn+mdieUsULTFPY+Zk8Fsqj0q9BQM6YyrsbY+1E7
        zttyMiiCgpBAlOCyCmwt2cc=
X-Google-Smtp-Source: APiQypJMJYcnfbVBUme6jDVi8ODCrKszURt7owpXGAMirtadx3ULLtgfHaIuqV50q7p41kabgFStgA==
X-Received: by 2002:a7b:c759:: with SMTP id w25mr5489166wmk.68.1586953561420;
        Wed, 15 Apr 2020 05:26:01 -0700 (PDT)
Received: from AnsuelXPS (host93-255-dynamic.47-79-r.retail.telecomitalia.it. [79.47.255.93])
        by smtp.gmail.com with ESMTPSA id j68sm23853010wrj.32.2020.04.15.05.25.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Apr 2020 05:26:00 -0700 (PDT)
From:   <ansuelsmth@gmail.com>
To:     "'Rob Herring'" <robh@kernel.org>
Cc:     "'Andy Gross'" <agross@kernel.org>,
        "'Bjorn Andersson'" <bjorn.andersson@linaro.org>,
        "'Kishon Vijay Abraham I'" <kishon@ti.com>,
        "'Mark Rutland'" <mark.rutland@arm.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20200403002608.946-1-ansuelsmth@gmail.com> <20200403002608.946-2-ansuelsmth@gmail.com> <20200414173838.GA29176@bogus>
In-Reply-To: <20200414173838.GA29176@bogus>
Subject: R: [PATCH 2/2] devicetree: bindings: phy: Document dwc3 qcom phy
Date:   Wed, 15 Apr 2020 14:25:58 +0200
Message-ID: <00bb01d61321$05bf9b20$113ed160$@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Content-Language: it
Thread-Index: AQHTPQd2IBqR3z6CHNBmVjX+r+AcmAGqTdeSAYw2ek+oZhM/sA==
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

> On Fri, Apr 03, 2020 at 02:26:05AM +0200, Ansuel Smith wrote:
> > Document dwc3 qcom phy hs and ss phy bindings needed to correctly
> > inizialize and use usb on ipq806x SoC
> >
> > Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/phy/qcom,dwc3-hs-usb-phy.yaml    | 65
> +++++++++++++++++++
> >  .../bindings/phy/qcom,dwc3-ss-usb-phy.yaml    | 65
> +++++++++++++++++++
> >  2 files changed, 130 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-phy.yaml
> >  create mode 100644
> Documentation/devicetree/bindings/phy/qcom,dwc3-ss-usb-phy.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-
> phy.yaml b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-
> phy.yaml
> > new file mode 100644
> > index 000000000000..0bb59e3c2ab8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/qcom,dwc3-hs-usb-
> phy.yaml
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/qcom,dwc3-hs-usb-phy.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm DWC3 HS PHY CONTROLLER
> > +
> > +maintainers:
> > +  - Ansuel Smith <ansuelsmth@gmail.com>
> > +
> > +description:
> > +  DWC3 PHY nodes are defined to describe on-chip Synopsis Physical
> layer
> > +  controllers. Each DWC3 PHY controller should have its own node.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,dwc3-hs-usb-phy
> > +
> > +  "#phy-cells":
> > +    const: 0
> > +
> > +  regmap:
> > +    maxItems: 1
> > +    description: phandle to usb3 dts definition
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +    description: |
> > +      - "ref" Is required
> > +      - "xo"	Optional external reference clock
> > +    items:
> > +      - const: ref
> > +      - const: xo
> > +
> > +required:
> > +  - compatible
> > +  - "#phy-cells"
> > +  - regmap
> > +  - clocks
> > +  - clock-names
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/qcom,gcc-ipq806x.h>
> > +
> > +    hs_phy_0: hs_phy_0 {
> > +      compatible = "qcom,dwc3-hs-usb-phy";
> > +      regmap = <&usb3_0>;
> 
> If the registers for the phy are part of 'qcom,dwc3' then make this node
> a child of it.
> 

Making this node a child of qcom,dwc3 cause malfunction of the driver.

> > +      clocks = <&gcc USB30_0_UTMI_CLK>;
> > +      clock-names = "ref";
> > +      #phy-cells = <0>;
> > +    };
> > +
> > +    usb3_0: usb3@110f8800 {
> > +      compatible = "qcom,dwc3", "syscon";
> > +      reg = <0x110f8800 0x8000>;
> > +
> > +      /* ... */
> 
> Incomplete examples should or will fail validation.
> 
> > +    };

