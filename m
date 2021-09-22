Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AEC7414100
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Sep 2021 07:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231901AbhIVFDo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Sep 2021 01:03:44 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27875 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbhIVFDn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Sep 2021 01:03:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632286934; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: Date: Subject: In-Reply-To: References: Cc:
 To: From: Sender; bh=kofefq07SMrDrIpqbf4y54OJ1V5EfeWqTQBdyaltoTw=; b=DPORAUqXNGAdpndjnsmBjRV85Vue3a6rXVw5h5Um9EhBPTzDURqUXsrJEVzVactIIiHzscXO
 jcSdSy2C78omV2MO3D72Jf1rZ56oDdeBO5Znz1ujAq4KnUs3CrZYpJ6U2OKnqv+7GziSJzl0
 3AVrpFWHN8ckQ4enr5CasGTYZ/s=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 614ab8ce65c3cc8c63c234fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Sep 2021 05:02:06
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 011A2C43460; Wed, 22 Sep 2021 05:02:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from PILLAIR1 (unknown [103.155.223.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E07BC4338F;
        Wed, 22 Sep 2021 05:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6E07BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   <pillair@codeaurora.org>
To:     "'Rob Herring'" <robh@kernel.org>,
        "'Stephen Boyd'" <swboyd@chromium.org>
Cc:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mathieu.poirier@linaro.org>, <ohad@wizery.com>,
        <p.zabel@pengutronix.de>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sibis@codeaurora.org>, <mpubbise@codeaurora.org>,
        <kuabhs@chromium.org>, "'Rakesh Pillai'" <pillair@qti.qualcomm.com>
References: <1631811353-503-1-git-send-email-pillair@codeaurora.org> <1631811353-503-2-git-send-email-pillair@codeaurora.org> <CAE-0n52t_1GGsFfDnrnwTx7j8RFdFLqZ2EGQY84D3UMbTeG69g@mail.gmail.com> <YUpqqezV3NYCihdE@robh.at.kernel.org>
In-Reply-To: <YUpqqezV3NYCihdE@robh.at.kernel.org>
Subject: RE: [PATCH v3 1/3] dt-bindings: remoteproc: qcom: adsp: Convert binding to YAML
Date:   Wed, 22 Sep 2021 10:31:55 +0530
Message-ID: <000201d7af6e$fb22bc60$f1683520$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHMNEBDEmK8+OU0e0UN4gvXCrx/ZwFrFW9GAbyvhYMDGyRt3auUXdKg
Content-Language: en-us
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, September 22, 2021 4:59 AM
> To: Stephen Boyd <swboyd@chromium.org>
> Cc: Rakesh Pillai <pillair@codeaurora.org>; agross@kernel.org;
> bjorn.andersson@linaro.org; mathieu.poirier@linaro.org; ohad@wizery.com;
> p.zabel@pengutronix.de; linux-arm-msm@vger.kernel.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> sibis@codeaurora.org; mpubbise@codeaurora.org; kuabhs@chromium.org;
> Rakesh Pillai <pillair@qti.qualcomm.com>
> Subject: Re: [PATCH v3 1/3] dt-bindings: remoteproc: qcom: adsp: Convert
> binding to YAML
> 
> On Thu, Sep 16, 2021 at 11:24:10PM -0700, Stephen Boyd wrote:
> > Quoting Rakesh Pillai (2021-09-16 09:55:51)
> > > diff --git
> > > a/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-
> v56.yaml
> > > b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-
> v56.yaml
> > > new file mode 100644
> > > index 0000000..051da43
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/remoteproc/qcom,hexagon-
> v56.
> > > +++ yaml
> > > @@ -0,0 +1,267 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +http://devicetree.org/schemas/remoteproc/qcom,hexagon-v56.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Hexagon v56 Peripheral Image Loader
> > > +
> > > +maintainers:
> > > +  - Bjorn Andersson <bjorn.andersson@linaro.org>
> > > +
> > > +description:
> > > +  This document defines the binding for a component that loads and
> > > +boots firmware
> > > +  on the Qualcomm Technology Inc. Hexagon v56 core.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - qcom,qcs404-cdsp-pil
> > > +      - qcom,sdm845-adsp-pil
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +    description:
> > > +      The base address and size of the qdsp6ss register
> > > +
> > > +  interrupts-extended:
> > > +    minItems: 5
> > > +    items:
> > > +      - description: Watchdog interrupt
> > > +      - description: Fatal interrupt
> > > +      - description: Ready interrupt
> > > +      - description: Handover interrupt
> > > +      - description: Stop acknowledge interrupt
> > > +
> > > +  interrupt-names:
> > > +    minItems: 5
> > > +    items:
> > > +      - const: wdog
> > > +      - const: fatal
> > > +      - const: ready
> > > +      - const: handover
> > > +      - const: stop-ack
> > > +
> > > +  clocks:
> > > +    minItems: 7
> > > +    maxItems: 8
> > > +    description:
> > > +      List of phandles and clock specifier pairs for the Hexagon,
> > > +      per clock-names below.
> > > +
> > > +  clock-names:
> > > +    minItems: 7
> > > +    maxItems: 8
> > > +
> > > +  power-domains:
> > > +    minItems: 1
> > > +    items:
> > > +      - description: CX power domain
> > > +
> > > +  resets:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +    description:
> > > +      reference to the list of resets for the Hexagon.
> > > +
> > > +  reset-names:
> > > +    minItems: 1
> > > +    maxItems: 2
> > > +
> > > +  memory-region:
> > > +    maxItems: 1
> > > +    description: Reference to the reserved-memory for the Hexagon
> > > + core
> > > +
> > > +  qcom,halt-regs:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description:
> > > +      Phandle reference to a syscon representing TCSR followed by the
> > > +      three offsets within syscon for q6, modem and nc halt
registers.
> > > +
> > > +  qcom,smem-states:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description: States used by the AP to signal the Hexagon core
> > > +    items:
> > > +      - description: Stop the modem
> > > +
> > > +  qcom,smem-state-names:
> > > +    $ref: /schemas/types.yaml#/definitions/string-array
> > > +    description: The names of the state bits used for SMP2P output
> > > +    items:
> > > +      - const: stop
> > > +
> > > +  glink-edge:
> > > +    type: object
> > > +    description:
> > > +      Qualcomm G-Link subnode which represents communication edge,
> channels
> > > +      and devices related to the ADSP.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - interrupts-extended
> > > +  - interrupt-names
> > > +  - clocks
> > > +  - clock-names
> > > +  - power-domains
> > > +  - qcom,halt-regs
> > > +  - memory-region
> > > +  - qcom,smem-states
> > > +  - qcom,smem-state-names
> >
> > Is there some way to make sure that 'resets' and 'reset-names' is
> > present when the compatible that defines them is used and not required
> > otherwise?
> 
> Yes, plenty of examples of that.
> 
> >
> > > +
> > > +additionalProperties: false
> > > +
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - qcom,sdm845-adsp-pil
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: XO clock
> > > +            - description: SWAY clock
> > > +            - description: LPASS AHBS AON clock
> > > +            - description: LPASS AHBM AON clock
> > > +            - description: QDSP6SS XO clock
> > > +            - description: QDSP6SS SLEEP clock
> > > +            - description: QDSP6SS CORE clock
> > > +        clock-names:
> > > +          items:
> > > +            - const: xo
> > > +            - const: sway_cbcr
> > > +            - const: lpass_ahbs_aon_cbcr
> > > +            - const: lpass_ahbm_aon_cbcr
> > > +            - const: qdsp6ss_xo
> > > +            - const: qdsp6ss_sleep
> > > +            - const: qdsp6ss_core
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - qcom,qcs404-cdsp-pil
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: XO clock
> > > +            - description: SWAY clock
> > > +            - description: TBU clock
> > > +            - description: BIMC clock
> > > +            - description: AHB AON clock
> > > +            - description: Q6SS SLAVE clock
> > > +            - description: Q6SS MASTER clock
> > > +            - description: Q6 AXIM clock
> > > +        clock-names:
> > > +          items:
> > > +            - const: xo
> > > +            - const: sway
> > > +            - const: tbu
> > > +            - const: bimc
> > > +            - const: ahb_aon
> > > +            - const: q6ss_slave
> > > +            - const: q6ss_master
> > > +            - const: q6_axim
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - qcom,sc7280-wpss-pil
> >
> > This should be documented above in the compatible list?
> >
> > > +    then:
> > > +      properties:
> > > +        clocks:
> > > +          items:
> > > +            - description: GCC WPSS AHB BDG Master clock
> > > +            - description: GCC WPSS AHB clock
> > > +            - description: GCC WPSS RSCP clock
> > > +        clock-names:
> > > +          items:
> > > +            - const: gcc_wpss_ahb_bdg_mst_clk
> > > +            - const: gcc_wpss_ahb_clk
> > > +            - const: gcc_wpss_rscp_clk
> >
> > Is the 'gcc_wpss' prefix important? It would be shorter if it wasn't
> > there.
> 
> Yes, and adding this new platform should be a separate patch.
> 
> Rob

Hi Rob,

I have posted v4 for this patch series, where the dt-bindings for wpss has
been moved to a separate file.
Can you please review v4 ?

Thanks,
Rakesh Pillai


