Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBBB61C3281
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 08:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgEDGQJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 02:16:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726445AbgEDGQJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 02:16:09 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3893EC061A0E
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2020 23:16:09 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so3335754pjh.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2020 23:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=sqTraPKDft1HRYOy2Y+7P9+dELuEVh+xFBndt/Bu4tQ=;
        b=JNZPxPd+nmY0NLYc/wIvMP9QGqRZWrcy4H8E9aA80rAUdAE7toNwRyC/BM5ZxYcnry
         TvVCSS0zqG7QprpUiS7ZkCDo+ijE8giw1qcw9rRJi7f1l68fz9pMKlC08Yo5mMGvPguJ
         sRaz7riUVcjBAg0ZEykZEWJ70Bv0lMW5ozMhf0sQYE4vmNg3I924j4xe8t8ni6Ww1wda
         alAFeZkGDQbeKXGcUAAvFXK21UZ7YoU8/E3AhYNgm62asVQRHMp0u30xU47g2KTpZrWg
         SWtOx55nO4KfCv7ooUei7xs0hzwMRTcxYrHLn+gqYUMIgfgtm379TxrGSNOq05rvB1Kc
         yhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=sqTraPKDft1HRYOy2Y+7P9+dELuEVh+xFBndt/Bu4tQ=;
        b=oNTX3DGCtEeTTh7newMwE4MkdQaemFdWcQRkRGnkLHTaY6aN9jrIYouiah9mTZqPIq
         AXRKPXtck5I2ULm1ZFNRvmMhyU2uk9tbT5M6jgN9zGM96gjOcT07Xkjyh4hxiM0G0VKf
         1XTA7ZW2i+CwLN9f6VkSngW1Wr73Gz5F84AnzQl7xeRuIK+JOZwwPl4W3vyEY2I82A/H
         RudmiUzp8dgcMD98X95sXgKFSFRWwXUl4Y7QF6r+c0uBCO3cV6iCshWnKoYlqKVDq2n8
         8yey9tFEcPH08cCK3JGjdHh8FVtHQAMvuNmGleFGopxfIWJ5XQai0rzSWou4I3wriLFR
         n7Jw==
X-Gm-Message-State: AGi0Puahnm2X1LFDnBCqwzWbNMmSEv8XLCBP1DNHCC5tYpQWiLp3rQ5l
        XwSjICLoHKq8qSjLqY5UTkNx
X-Google-Smtp-Source: APiQypKoKtYAzEDS8osmX98H1sF2gzYZ8WxWtlyFIeSjt4kqLe0YZ9smNleJS3C2gqxOBCeFODj1ZA==
X-Received: by 2002:a17:90a:fc8c:: with SMTP id ci12mr15597317pjb.104.1588572968534;
        Sun, 03 May 2020 23:16:08 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:51f:c7c4:bdcc:167e:2cd1:efea])
        by smtp.gmail.com with ESMTPSA id n69sm5800912pjc.8.2020.05.03.23.16.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 May 2020 23:16:07 -0700 (PDT)
Date:   Mon, 4 May 2020 11:46:00 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Add devicetree binding for
 Qcom IPCC
Message-ID: <20200504061600.GB3391@Mani-XPS-13-9360>
References: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
 <20200430193609.GA20625@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430193609.GA20625@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Apr 30, 2020 at 12:36:09PM -0700, Bjorn Andersson wrote:
> On Wed 29 Apr 23:30 PDT 2020, Manivannan Sadhasivam wrote:
> 
> > Add devicetree YAML binding for Qualcomm Inter-Processor Communication
> > Controller (IPCC) block.
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  .../bindings/soc/qcom/qcom,ipcc.yaml          | 85 +++++++++++++++++++
> 
> How about putting this in either interrupt-controller/ or mailbox/ instead?
> 

I thought about it but was not sure. But if we want to move it to other
relevant location I think mailbox is a better one. Because, there are other
places where subsystem drivers expose irqchip functionality. So I think a
mailbox driver exposing irqchip is a relevant one for this.

> >  include/dt-bindings/soc/qcom,ipcc.h           | 38 +++++++++
> >  2 files changed, 123 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
> >  create mode 100644 include/dt-bindings/soc/qcom,ipcc.h
> > 
> > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
> > new file mode 100644
> > index 000000000000..48b281181401
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
> > @@ -0,0 +1,85 @@
> > +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/soc/qcom/qcom,ipcc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies, Inc. Inter-Processor Communication Controller
> > +
> > +maintainers:
> > +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > +
> > +description:
> > +  The Inter-Processor Communication Controller (IPCC) is a centralized hardware
> > +  to route the interrupts across various subsystems. It involves a three-level
> 
> s/the//
> 
> > +  addressing scheme called protocol, client and signal. For example, consider an
> > +  entity on the Application Processor Subsystem (APSS) that wants to listen to
> > +  Modem's interrupts via Shared Memory Point to Point (SMP2P) interface. In such
> > +  a case, the client would be Modem (client-id is 2) and the signal would be
> > +  SMP2P (signal-id is 2). The SMP2P itself falls under the Multiprocessor (MPROC)
> > +  protocol (protocol-id is 0). Refer include/dt-bindings/soc/qcom/qcom,ipcc.h
> > +  for the list of such IDs.
> > +
> > +  One of the duties of this interrupt controller driver is to forward the
> > +  interrupts to the correct entities on the APSS. The children inheriting the
> 
> Clients using the...
> 
> > +  interrupt-controller would be mentioning the client-id and signal-id it's
> 
> s/would be mentioning/should specify/
> 
> > +  interested in.
> > +
> > +  On the other hand, sending an interrupt to a subsystem is done through the
> 
> "In the other direction," and add clarify subsystem by making it "remote
> subsystem".
> 
> > +  mailbox interface, which again requires client-id and signal-id.
> > +
> > +properties:
> > +  compatible:
> 
> It's uncertain how new vers
> 

lost?

> > +    const: "qcom,ipcc"
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 3
> > +    description:
> > +      The first cell is the client-id, the second cell is the signal-id and the
> > +      third cell is the interrupt type.
> > +
> > +  "#mbox-cells":
> > +    const: 2
> > +    description:
> > +      The first cell is the client-id, and the second cell is the signal-id.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +  - "#mbox-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +        #include <dt-bindings/soc/qcom,ipcc.h>
> > +
> > +        ipcc_mproc: qcom,ipcc@408000 {
> 
> interrupt-controller@
> 

mailbox?

Thanks,
Mani

> Regards,
> Bjorn
> 
> > +                compatible = "qcom,ipcc";
> > +                reg = <0x408000 0x1000>;
> > +                interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> > +                interrupt-controller;
> > +                #interrupt-cells = <3>;
> > +                #mbox-cells = <2>;
> > +        };
> > +
> > +        smp2p-modem {
> > +                compatible = "qcom,smp2p";
> > +                interrupts-extended = <&ipcc_mproc IPCC_CLIENT_MPSS
> > +                                IPCC_MPROC_SIGNAL_SMP2P IRQ_TYPE_EDGE_RISING>;
> > +                mboxes = <&ipcc_mproc IPCC_CLIENT_MPSS IPCC_MPROC_SIGNAL_SMP2P>;
> > +
> > +                /* Other SMP2P fields */
> > +        };
> > diff --git a/include/dt-bindings/soc/qcom,ipcc.h b/include/dt-bindings/soc/qcom,ipcc.h
> > new file mode 100644
> > index 000000000000..2926cdb4cb48
> > --- /dev/null
> > +++ b/include/dt-bindings/soc/qcom,ipcc.h
> > @@ -0,0 +1,38 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > + */
> > +
> > +#ifndef __DT_BINDINGS_QCOM_IPCC_H
> > +#define __DT_BINDINGS_QCOM_IPCC_H
> > +
> > +/* Signal IDs for MPROC protocol */
> > +#define IPCC_MPROC_SIGNAL_GLINK_QMP	0
> > +#define IPCC_MPROC_SIGNAL_SMP2P		2
> > +#define IPCC_MPROC_SIGNAL_PING		3
> > +#define IPCC_MPROC_SIGNAL_MAX		4 /* Used by driver only */
> > +
> > +#define IPCC_COMPUTE_L0_SIGNAL_MAX	32 /* Used by driver only */
> > +#define IPCC_COMPUTE_L1_SIGNAL_MAX	32 /* Used by driver only */
> > +
> > +/* Client IDs */
> > +#define IPCC_CLIENT_AOP			0
> > +#define IPCC_CLIENT_TZ			1
> > +#define IPCC_CLIENT_MPSS		2
> > +#define IPCC_CLIENT_LPASS		3
> > +#define IPCC_CLIENT_SLPI		4
> > +#define IPCC_CLIENT_SDC			5
> > +#define IPCC_CLIENT_CDSP		6
> > +#define IPCC_CLIENT_NPU			7
> > +#define IPCC_CLIENT_APSS		8
> > +#define IPCC_CLIENT_GPU			9
> > +#define IPCC_CLIENT_CVP			10
> > +#define IPCC_CLIENT_CAM			11
> > +#define IPCC_CLIENT_VPU			12
> > +#define IPCC_CLIENT_PCIE0		13
> > +#define IPCC_CLIENT_PCIE1		14
> > +#define IPCC_CLIENT_PCIE2		15
> > +#define IPCC_CLIENT_SPSS		16
> > +#define IPCC_CLIENT_MAX			17 /* Used by driver only */
> > +
> > +#endif
> > -- 
> > 2.17.1
> > 
