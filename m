Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1178B1D0196
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 00:08:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731065AbgELWIj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 18:08:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728362AbgELWIi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 18:08:38 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 777EAC061A0E
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 15:08:38 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id b8so6800389pgi.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2020 15:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=iFFIXuiTeXewIPgNqaF+8qYTST/Jxb/I8bLtMUpHXN4=;
        b=ak6uwLtay91XD2CW7lZ8NLeOJQgrgv95tuUp4U4vRUENgd6/n1/WiBQU2apbSefVjm
         1jMqTBylXnNN+2fH1J0zpKT/0z3zQFFFnDA+igDw5Y/B2fFyW4bv7y4A1kmxiJWmvlHO
         rOpG9qTgr2DExSMMdWvoNRlSegcf2Munuk9xwAsRSTGhVCfjw52QOBjy4aWCWwyB7B+F
         ogXyYsVH7i4hqvsDKBQnu6n2i+5riC5jONdZZpTdQE/Sg+hr6em6joNel8nINseYvhoL
         3/KYNSHH57T66an0XySXYml8nriEYyj5n+MEASzZAp/d/IKx7kPoIBtmtYn0FtOx6sqx
         9Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=iFFIXuiTeXewIPgNqaF+8qYTST/Jxb/I8bLtMUpHXN4=;
        b=EKQQi8Xe2dQa0QDqivzMCMpVFfk0YQO1RArZLjgk45j2ckYQkbuIVnge3InWOZ8e9j
         0iaqq31yJbO7rUwNrVRC9X8vlg85zWqpe2pKV2mUpcmmlgjkoOKmV8M/xqmb4i9IA+82
         O1hazVz+mz8yysLSTpypbgK0Y7gX1QXhb9iMn6NA9u6ZPsRDIc8S4mhdOChMFTDV2bBM
         ogfPFdfCWovF45692hIhAxTuaStstJe4WrZOpAqIENCuegqUe1CYp9FK80xIULWdzX0j
         TibsiQr6gtxIPdnAm3YG22h7zmj/U8wXwMFqq+UH/0/XtwidxKWpTHwxr3JBbEyG8ONV
         vvRQ==
X-Gm-Message-State: AGi0PubAaXsAWdPWHVcPHXGDXWNlhSwjZW0YK4Wi8XtMh7aPMvbOUCV0
        g0UZc8ywYTVyinbu1gEKH7uIMQ==
X-Google-Smtp-Source: APiQypKiwsr7vUOvJvnkBAiGQVgAIz3i27sJLeKH4NIMgsZbIH0qAC8FL5MAyuE2v3EG/uLRz/2OrA==
X-Received: by 2002:aa7:8bc8:: with SMTP id s8mr24067889pfd.252.1589321317694;
        Tue, 12 May 2020 15:08:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id l1sm13517594pjr.17.2020.05.12.15.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2020 15:08:36 -0700 (PDT)
Date:   Tue, 12 May 2020 15:07:04 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     jassisinghbrar@gmail.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: mailbox: Add devicetree binding for
 Qcom IPCC
Message-ID: <20200512220704.GM2165@builder.lan>
References: <20200508182703.29021-1-manivannan.sadhasivam@linaro.org>
 <20200508182703.29021-2-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508182703.29021-2-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 May 11:27 PDT 2020, Manivannan Sadhasivam wrote:

> Add devicetree YAML binding for Qualcomm Inter-Processor Communication
> Controller (IPCC) block.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

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
