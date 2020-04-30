Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 783001C0691
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2020 21:35:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbgD3Tfd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Apr 2020 15:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgD3Tfc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Apr 2020 15:35:32 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA811C035494
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:35:32 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 145so337585pfw.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2020 12:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lzP4zsyL3G+ZA+zKIb8zsIyDO20yNMH6PqtntomA9xg=;
        b=fCDX2FSYSHD6JwsDTIokxh79bkmofe+tsGFm74Iobii0E29IYHlVELmsNu1y3Zd9DX
         3SiyzTAcxxfmEgukA74XFh9neFt8TE9YXbrVuw0Qu4QeLM1/bHQ371Imwq4rwgDxrRoV
         MSKkO2yEiEyB9D3RaBCnLjWvj8xw6mFDgXpcbnDkMCBDrtWFun0JDa0x/PwC/YjNjIty
         tNe4gCsh9j8dFZmEu2zm1zh3E/UMsEXs8VDS6Rd+RdyWcucpsf+89ToFPjkjNYwWzbwd
         EbCyFqS0k5GccLlxf9of9GNVM3pAAf4AeKOutadC4y4zTq8aYkM/7clDPhhxgf9Pjvrv
         pZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lzP4zsyL3G+ZA+zKIb8zsIyDO20yNMH6PqtntomA9xg=;
        b=t9XKvr+WnRqh8wnRZ+D4fd4bs4Ot0tT+R4diuHZz3LkWVC1TvbgMLgVaeON1TSpe1d
         BCfYBm1aTKkQ5OJg9uwvvZRXDhcHMHSzGWqJt77OPjLQZX8TrGDBWDyOQHHHQVEm+KNv
         RgvXne0gONHhPMMrbLgAQF/SMiwjHd5wfdZ2k6pknQFzMO+SOHUXOwolSyckqM8D6iiU
         k6kv+Q1jR0lyG8MRq7MIlGGVjZJccSB6QorAqeOJCwY3ZwVxhSY+ZeY09xFGCUkpgorH
         sCXuhP2iozaMV/sQW9SIoLkQ8pBTfS0W9xqIn/anuGnzj8mQ2pQ4emUrW7nRyAioD+eq
         h47w==
X-Gm-Message-State: AGi0PubbN9hHGQBRwn5OpQdMLxcgmPAGbVvqnHH2jg1cSrvSguhlRx4F
        KfawACeDHRM0eBjYmHfx/B/KJw==
X-Google-Smtp-Source: APiQypKnzcM10vrRVAPVmDP8TVP4+76/N/zdw2lKPSevIaHjqqPQ2vVc0sUq80sl9glOTilQvDqG/w==
X-Received: by 2002:a65:6083:: with SMTP id t3mr479523pgu.398.1588275332220;
        Thu, 30 Apr 2020 12:35:32 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j23sm493396pjz.13.2020.04.30.12.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2020 12:35:31 -0700 (PDT)
Date:   Thu, 30 Apr 2020 12:36:09 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Add devicetree binding for
 Qcom IPCC
Message-ID: <20200430193609.GA20625@builder.lan>
References: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430063054.18879-1-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 29 Apr 23:30 PDT 2020, Manivannan Sadhasivam wrote:

> Add devicetree YAML binding for Qualcomm Inter-Processor Communication
> Controller (IPCC) block.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  .../bindings/soc/qcom/qcom,ipcc.yaml          | 85 +++++++++++++++++++

How about putting this in either interrupt-controller/ or mailbox/ instead?

>  include/dt-bindings/soc/qcom,ipcc.h           | 38 +++++++++
>  2 files changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
>  create mode 100644 include/dt-bindings/soc/qcom,ipcc.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
> new file mode 100644
> index 000000000000..48b281181401
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,ipcc.yaml
> @@ -0,0 +1,85 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/qcom/qcom,ipcc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Inter-Processor Communication Controller
> +
> +maintainers:
> +  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> +
> +description:
> +  The Inter-Processor Communication Controller (IPCC) is a centralized hardware
> +  to route the interrupts across various subsystems. It involves a three-level

s/the//

> +  addressing scheme called protocol, client and signal. For example, consider an
> +  entity on the Application Processor Subsystem (APSS) that wants to listen to
> +  Modem's interrupts via Shared Memory Point to Point (SMP2P) interface. In such
> +  a case, the client would be Modem (client-id is 2) and the signal would be
> +  SMP2P (signal-id is 2). The SMP2P itself falls under the Multiprocessor (MPROC)
> +  protocol (protocol-id is 0). Refer include/dt-bindings/soc/qcom/qcom,ipcc.h
> +  for the list of such IDs.
> +
> +  One of the duties of this interrupt controller driver is to forward the
> +  interrupts to the correct entities on the APSS. The children inheriting the

Clients using the...

> +  interrupt-controller would be mentioning the client-id and signal-id it's

s/would be mentioning/should specify/

> +  interested in.
> +
> +  On the other hand, sending an interrupt to a subsystem is done through the

"In the other direction," and add clarify subsystem by making it "remote
subsystem".

> +  mailbox interface, which again requires client-id and signal-id.
> +
> +properties:
> +  compatible:

It's uncertain how new vers

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
> +        #include <dt-bindings/soc/qcom,ipcc.h>
> +
> +        ipcc_mproc: qcom,ipcc@408000 {

interrupt-controller@

Regards,
Bjorn

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
> diff --git a/include/dt-bindings/soc/qcom,ipcc.h b/include/dt-bindings/soc/qcom,ipcc.h
> new file mode 100644
> index 000000000000..2926cdb4cb48
> --- /dev/null
> +++ b/include/dt-bindings/soc/qcom,ipcc.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> + */
> +
> +#ifndef __DT_BINDINGS_QCOM_IPCC_H
> +#define __DT_BINDINGS_QCOM_IPCC_H
> +
> +/* Signal IDs for MPROC protocol */
> +#define IPCC_MPROC_SIGNAL_GLINK_QMP	0
> +#define IPCC_MPROC_SIGNAL_SMP2P		2
> +#define IPCC_MPROC_SIGNAL_PING		3
> +#define IPCC_MPROC_SIGNAL_MAX		4 /* Used by driver only */
> +
> +#define IPCC_COMPUTE_L0_SIGNAL_MAX	32 /* Used by driver only */
> +#define IPCC_COMPUTE_L1_SIGNAL_MAX	32 /* Used by driver only */
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
> +#define IPCC_CLIENT_MAX			17 /* Used by driver only */
> +
> +#endif
> -- 
> 2.17.1
> 
