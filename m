Return-Path: <linux-arm-msm+bounces-63140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7116AEEF87
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 09:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FD9B3A9CCE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 07:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA73125C804;
	Tue,  1 Jul 2025 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SwCH+AA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DEA01E1DF2;
	Tue,  1 Jul 2025 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751353909; cv=none; b=u9Ff64akl79SLs2+IH75RNBruxeMGDMFTUS4O/VQ4L4Qb+iH9NZ2Nwn2AdsjmK2rDrbual8292pxPHkGYmaE7H8RG2xuP46l4393tdV/x9Ib67gWBpk+n9K8cZLzSdfsFMMfpU4VzYakSVX+j7ozSM8m9VoXkc58oExDE0aJfyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751353909; c=relaxed/simple;
	bh=D5KZQfmlFp+zcIH+996tl0vUf6ORHXerO74OqdBTtwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fh++IhmwG/aSBlexBFovpZDOpr4JB6z2gK6eeyP8ie/fsPX6+K/gIajsl9PK6vdp5cgDQziJ/cz/MMmRSI4I4C0msP1IGuPZtvgcrGsFliMJJZzi5z08c15fYb7H1MEVOfCbQkIlriOv193mtbdmWXvnuUYDVlqbxL9FYflDtrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SwCH+AA7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7350C4CEEB;
	Tue,  1 Jul 2025 07:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751353909;
	bh=D5KZQfmlFp+zcIH+996tl0vUf6ORHXerO74OqdBTtwE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SwCH+AA7/l5FEOGuLxWyofigen/e6Er6gsk6ktjmq+xU1gtu3uXSfsdumFyn8+ZBy
	 6z5aEs+mRsFbnxFEy/9wXuGoMOvsPTIlm61yhTmEINi1zV+tscGF5B5OCDd8+nVpje
	 JHIjutnGFn8w44qA68bsaMSybKdjsfbSxr3pu+k0EB1cQiXTXEOfPPMis4MYVPV178
	 UX6kOjUJOtx3c3pCLGFGV/jZXCZ5OtLczmaijxElWpwT5F9Bn0UIDWKZ0YwusM+Kwk
	 Bcq8cRveXW1O7nNVI3ANf2Q/yv+w5ZtetonuSKgQgAkRicgFL2Q7Ny2/E8q7t1HMge
	 42Yht9MFIbNjw==
Date: Tue, 1 Jul 2025 09:11:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lei Wei <quic_leiwei@quicinc.com>, Suruchi Agarwal <quic_suruchia@quicinc.com>, 
	Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
Subject: Re: [PATCH net-next v5 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Message-ID: <20250701-mottled-clever-walrus-f7dcd3@krzk-bin>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-1-95bdc6b8f6ff@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250626-qcom_ipq_ppe-v5-1-95bdc6b8f6ff@quicinc.com>

On Thu, Jun 26, 2025 at 10:31:00PM +0800, Luo Jie wrote:
> +      resets:
> +        maxItems: 1
> +        description: EDMA reset from NSS clock controller
> +
> +      interrupts:
> +        minItems: 65
> +        maxItems: 65
> +
> +      interrupt-names:
> +        minItems: 65
> +        maxItems: 65
> +        description:
> +          Interrupts "txcmpl_[0-31]" are the Ethernet DMA TX completion ring interrupts.
> +          Interrupts "rxfill_[0-7]" are the Ethernet DMA RX fill ring interrupts.
> +          Interrupts "rxdesc_[0-23]" are the Ethernet DMA RX Descriptor ring interrupts.
> +          Interrupt "misc" is the Ethernet DMA miscellaneous error interrupt.
> +
> +    required:
> +      - clocks
> +      - clock-names
> +      - resets
> +      - interrupts
> +      - interrupt-names
> +
> +patternProperties:
> +  "^(ethernet-)?port@[0-9a-f]+$":

Only one port? What are you switching here?

Anyway, ^ethernet-port..... is preferred over port.

But other problem is that it does not match referenced schema at all and
nothing in commit msg explains why this appered. 1.5 years of
development of this and some significant, unexpected and not correct
changes.

> +    unevaluatedProperties: false
> +    $ref: ethernet-switch-port.yaml#
> +
> +    properties:
> +      clocks:
> +        items:
> +          - description: Port MAC clock from NSS clock controller
> +          - description: Port RX clock from NSS clock controller
> +          - description: Port TX clock from NSS clock controller
> +
> +      clock-names:
> +        items:
> +          - const: mac
> +          - const: rx
> +          - const: tx
> +
> +      resets:
> +        items:
> +          - description: Port MAC reset from NSS clock controller
> +          - description: Port RX reset from NSS clock controller
> +          - description: Port TX reset from NSS clock controller
> +
> +      reset-names:
> +        items:
> +          - const: mac
> +          - const: rx
> +          - const: tx
> +
> +    required:
> +      - reg
> +      - clocks
> +      - clock-names
> +      - resets
> +      - reset-names
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - interconnects
> +  - interconnect-names
> +  - ethernet-dma
> +
> +allOf:
> +  - $ref: ethernet-switch.yaml
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> +    #include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
> +    #include <dt-bindings/interconnect/qcom,ipq9574.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
> +
> +    ethernet-switch@3a000000 {
> +        compatible = "qcom,ipq9574-ppe";
> +        reg = <0x3a000000 0xbef800>;
> +        clocks = <&nsscc NSS_CC_PPE_SWITCH_CLK>,
> +                 <&nsscc NSS_CC_PPE_SWITCH_CFG_CLK>,
> +                 <&nsscc NSS_CC_PPE_SWITCH_IPE_CLK>,
> +                 <&nsscc NSS_CC_PPE_SWITCH_BTQ_CLK>;
> +        clock-names = "ppe",
> +                      "apb",
> +                      "ipe",
> +                      "btq";
> +        resets = <&nsscc PPE_FULL_RESET>;
> +        interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>;
> +        interconnects = <&nsscc MASTER_NSSNOC_PPE &nsscc SLAVE_NSSNOC_PPE>,
> +                        <&nsscc MASTER_NSSNOC_PPE_CFG &nsscc SLAVE_NSSNOC_PPE_CFG>,
> +                        <&gcc MASTER_NSSNOC_QOSGEN_REF &gcc SLAVE_NSSNOC_QOSGEN_REF>,
> +                        <&gcc MASTER_NSSNOC_TIMEOUT_REF &gcc SLAVE_NSSNOC_TIMEOUT_REF>,
> +                        <&gcc MASTER_MEM_NOC_NSSNOC &gcc SLAVE_MEM_NOC_NSSNOC>,
> +                        <&gcc MASTER_NSSNOC_MEMNOC &gcc SLAVE_NSSNOC_MEMNOC>,
> +                        <&gcc MASTER_NSSNOC_MEM_NOC_1 &gcc SLAVE_NSSNOC_MEM_NOC_1>;
> +        interconnect-names = "ppe",
> +                             "ppe_cfg",
> +                             "qos_gen",
> +                             "timeout_ref",
> +                             "nssnoc_memnoc",
> +                             "memnoc_nssnoc",
> +                             "memnoc_nssnoc_1";
> +
> +        ethernet-dma {
> +            clocks = <&nsscc NSS_CC_PPE_EDMA_CLK>,
> +                     <&nsscc NSS_CC_PPE_EDMA_CFG_CLK>;
> +            clock-names = "sys",
> +                          "apb";
> +            resets = <&nsscc EDMA_HW_RESET>;
> +            interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupt-names = "txcmpl_0",
> +                              "txcmpl_1",
> +                              "txcmpl_2",
> +                              "txcmpl_3",
> +                              "txcmpl_4",
> +                              "txcmpl_5",
> +                              "txcmpl_6",
> +                              "txcmpl_7",
> +                              "txcmpl_8",
> +                              "txcmpl_9",
> +                              "txcmpl_10",
> +                              "txcmpl_11",
> +                              "txcmpl_12",
> +                              "txcmpl_13",
> +                              "txcmpl_14",
> +                              "txcmpl_15",
> +                              "txcmpl_16",
> +                              "txcmpl_17",
> +                              "txcmpl_18",
> +                              "txcmpl_19",
> +                              "txcmpl_20",
> +                              "txcmpl_21",
> +                              "txcmpl_22",
> +                              "txcmpl_23",
> +                              "txcmpl_24",
> +                              "txcmpl_25",
> +                              "txcmpl_26",
> +                              "txcmpl_27",
> +                              "txcmpl_28",
> +                              "txcmpl_29",
> +                              "txcmpl_30",
> +                              "txcmpl_31",
> +                              "rxfill_0",
> +                              "rxfill_1",
> +                              "rxfill_2",
> +                              "rxfill_3",
> +                              "rxfill_4",
> +                              "rxfill_5",
> +                              "rxfill_6",
> +                              "rxfill_7",
> +                              "rxdesc_0",
> +                              "rxdesc_1",
> +                              "rxdesc_2",
> +                              "rxdesc_3",
> +                              "rxdesc_4",
> +                              "rxdesc_5",
> +                              "rxdesc_6",
> +                              "rxdesc_7",
> +                              "rxdesc_8",
> +                              "rxdesc_9",
> +                              "rxdesc_10",
> +                              "rxdesc_11",
> +                              "rxdesc_12",
> +                              "rxdesc_13",
> +                              "rxdesc_14",
> +                              "rxdesc_15",
> +                              "rxdesc_16",
> +                              "rxdesc_17",
> +                              "rxdesc_18",
> +                              "rxdesc_19",
> +                              "rxdesc_20",
> +                              "rxdesc_21",
> +                              "rxdesc_22",
> +                              "rxdesc_23",
> +                              "misc";
> +        };
> +
> +        ethernet-ports {

Look at your binding, not what it said...

> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@1 {

Best regards,
Krzysztof


