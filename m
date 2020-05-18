Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444471D8507
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 20:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731956AbgERSQN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 14:16:13 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:40973 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728495AbgERSQL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 14:16:11 -0400
Received: by mail-io1-f66.google.com with SMTP id o5so11639463iow.8;
        Mon, 18 May 2020 11:16:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=JxKTb/ih7EghROppADNjlOVB+kg2oy5PArakgj5co0c=;
        b=b4pKtkyKuylJ172oadLkhVcZXgzemMtdsJWWEfLVoVM67jdOEWMMUsqpaa9TZJSnGr
         W2x1/CvP5GjenbcGZ5DyizNDE/iaWoIeH62ZhWZNS82ibXmNPC7kcHPtvTO4SzET6naz
         TcZT4E3mzUzmvzrdWEQkNki6YicmEhyvCCQp1eB0Leh7/cLFZyfX9OGFc7DbfUecj8Xn
         A70eLDljCgSdOctTuhg19uyLfZDVsKkYA6L+xSyPUb6XuAWIjcr6aQ4yW8y/BI2183+d
         vKhb7J39keJ96Oo5Ej7FVqURAZaMwQp3i6v/QrVFA3AhplszJKVtc8mHfAitpJdOKqZV
         5i3Q==
X-Gm-Message-State: AOAM533XMKwcjxAbOGFo+fTZN90jwiZZZfQMqCqBi4JXbBbB95IBKPMU
        PZNl/TvXy6nhwyG6NsBJiA==
X-Google-Smtp-Source: ABdhPJwaG2BHJYsZV6exPs1IolUMSH1wW79sjo0+RjhAoR1r4RC0RhVxxgFAh3EpsyttWNjrpD2baw==
X-Received: by 2002:a02:7a1d:: with SMTP id a29mr16632302jac.3.1589825769856;
        Mon, 18 May 2020 11:16:09 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id g65sm4585993ila.21.2020.05.18.11.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2020 11:16:08 -0700 (PDT)
Received: (nullmailer pid 20581 invoked by uid 1000);
        Mon, 18 May 2020 18:16:07 -0000
Date:   Mon, 18 May 2020 12:16:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     jassisinghbrar@gmail.com, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: Add devicetree binding for
 Qcom IPCC
Message-ID: <20200518181607.GA15578@bogus>
References: <20200508182703.29021-1-manivannan.sadhasivam@linaro.org>
 <20200508182703.29021-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508182703.29021-2-manivannan.sadhasivam@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 08, 2020 at 11:57:01PM +0530, Manivannan Sadhasivam wrote:
> Add devicetree YAML binding for Qualcomm Inter-Processor Communication
> Controller (IPCC) block.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/mailbox/qcom-ipcc.yaml           | 77 +++++++++++++++++++
>  include/dt-bindings/mailbox/qcom-ipcc.h       | 33 ++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
>  create mode 100644 include/dt-bindings/mailbox/qcom-ipcc.h
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> new file mode 100644
> index 000000000000..62e7bc8ceb0b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/qcom-ipcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Inter-Processor Communication Controller
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description:
> +  The Inter-Processor Communication Controller (IPCC) is a centralized hardware
> +  to route interrupts across various subsystems. It involves a three-level
> +  addressing scheme called protocol, client and signal. For example, consider an
> +  entity on the Application Processor Subsystem (APSS) that wants to listen to
> +  Modem's interrupts via Shared Memory Point to Point (SMP2P) interface. In such
> +  a case, the client would be Modem (client-id is 2) and the signal would be
> +  SMP2P (signal-id is 2). The SMP2P itself falls under the Multiprocessor (MPROC)
> +  protocol (protocol-id is 0). Refer include/dt-bindings/mailbox/qcom-ipcc.h
> +  for the list of such IDs.
> +
> +properties:
> +  compatible:
> +    const: "qcom,ipcc"

Need SoC specific compatible(s).

No need for quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 3
> +    description:
> +      The first cell is the client-id, the second cell is the signal-id and the
> +      third cell is the interrupt type.
> +
> +  "#mbox-cells":
> +    const: 2
> +    description:
> +      The first cell is the client-id, and the second cell is the signal-id.
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - "#mbox-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/interrupt-controller/arm-gic.h>
> +        #include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +        mailbox: qcom,ipcc@408000 {

mailbox@408000

> +                compatible = "qcom,ipcc";
> +                reg = <0x408000 0x1000>;
> +                interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
> +                interrupt-controller;
> +                #interrupt-cells = <3>;
> +                #mbox-cells = <2>;
> +        };
> +
> +        smp2p-modem {
> +                compatible = "qcom,smp2p";
> +                interrupts-extended = <&ipcc_mproc IPCC_CLIENT_MPSS
> +                                IPCC_MPROC_SIGNAL_SMP2P IRQ_TYPE_EDGE_RISING>;
> +                mboxes = <&ipcc_mproc IPCC_CLIENT_MPSS IPCC_MPROC_SIGNAL_SMP2P>;
> +
> +                /* Other SMP2P fields */
> +        };
> diff --git a/include/dt-bindings/mailbox/qcom-ipcc.h b/include/dt-bindings/mailbox/qcom-ipcc.h
> new file mode 100644
> index 000000000000..b8c04f6df57c
> --- /dev/null
> +++ b/include/dt-bindings/mailbox/qcom-ipcc.h
> @@ -0,0 +1,33 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

Dual license please. I'm pretty sure your employer has an opinion on 
this.

> +/*
> + * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_MAILBOX_IPCC_H
> +#define __DT_BINDINGS_MAILBOX_IPCC_H
> +
> +/* Signal IDs for MPROC protocol */
> +#define IPCC_MPROC_SIGNAL_GLINK_QMP	0
> +#define IPCC_MPROC_SIGNAL_SMP2P		2
> +#define IPCC_MPROC_SIGNAL_PING		3
> +
> +/* Client IDs */
> +#define IPCC_CLIENT_AOP			0
> +#define IPCC_CLIENT_TZ			1
> +#define IPCC_CLIENT_MPSS		2
> +#define IPCC_CLIENT_LPASS		3
> +#define IPCC_CLIENT_SLPI		4
> +#define IPCC_CLIENT_SDC			5
> +#define IPCC_CLIENT_CDSP		6
> +#define IPCC_CLIENT_NPU			7
> +#define IPCC_CLIENT_APSS		8
> +#define IPCC_CLIENT_GPU			9
> +#define IPCC_CLIENT_CVP			10
> +#define IPCC_CLIENT_CAM			11
> +#define IPCC_CLIENT_VPU			12
> +#define IPCC_CLIENT_PCIE0		13
> +#define IPCC_CLIENT_PCIE1		14
> +#define IPCC_CLIENT_PCIE2		15
> +#define IPCC_CLIENT_SPSS		16
> +
> +#endif
> -- 
> 2.17.1
> 
