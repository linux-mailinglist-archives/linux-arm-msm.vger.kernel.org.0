Return-Path: <linux-arm-msm+bounces-63500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1551AF6EE6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 11:37:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E6A9188491B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jul 2025 09:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E73D2D77E3;
	Thu,  3 Jul 2025 09:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="d/2U4O7M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3048323BCF1;
	Thu,  3 Jul 2025 09:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751535420; cv=none; b=hXilwU4yzWVQhc6GXho8yX10zOQr5jvV8++ibLwZ8G4ZJJH+BTLgkRGxvIXEJZlrPY21lJhVVzrQf++/OKvQqZZYPu6/tFLQ2rArJafthc924NMGLhK1Z5hwrnjFh6OiLvSp7UVfQBtLsl4iEJudPieUeHAPujpnWUTjKwgJv4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751535420; c=relaxed/simple;
	bh=hQIHEuqeokZqHMrXMdMOy10SxuZNFEjF/nKwhEfgynE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bC7MbdOlnEalcNOCfWDw6/fB3CsD1Xh2UWRCRTLHdkNeYoSYpQgNiocaREnZtrmCjDqQNCh/pWQzz0QelhSyTHg2xWdyrVpiVJiHW92Sex8azemjhUXu5yVeMI8xnX5bfPT33D1eXt/B+FZXcFfgolIhi8bhRNZIjnZ8y38YDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=d/2U4O7M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56314BTM025364;
	Thu, 3 Jul 2025 09:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Bx/D3f8npc4SVgVlVyBMLFb5KwIBdvI3Ykpbm7JiFg=; b=d/2U4O7MmgI2E25/
	XyI77OUZU2WdhYAdQLuIqyTA8j5kPLGbz2tR3FyoZ8U8U3/gKrvFnUpc70DqkRTH
	oN9OnZC/U+1paA5j1skHfguT/BaU8DxeLfvYZpL6bp44uGsR/H1uLKXV5cjjhx81
	REC+oV2WZHHUiXkQQZ4CnxRcGpfasz3TRQ9cLAaRE6kGXwGx3LInOIW063RX/p79
	nfOXRP7H1tlR6moY9id3ZdCPlpLjNOdRSUy26J1wSbvjYfWKhZke2ySSvdndSaZw
	Q6SlML1wqvwgzB8CsxSt0E9aVfbDjHW3qlri4rN1ZfcFI7gv5WclW/kZGrVKxqGp
	FEdgwg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kd64vyyx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 09:36:44 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5639agrH028261
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 09:36:42 GMT
Received: from [10.253.36.62] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Thu, 3 Jul
 2025 02:36:36 -0700
Message-ID: <e6185a22-8e32-417e-a2d5-a7526ff91bc6@quicinc.com>
Date: Thu, 3 Jul 2025 17:36:33 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
 <20250626-qcom_ipq_ppe-v5-1-95bdc6b8f6ff@quicinc.com>
 <20250701-mottled-clever-walrus-f7dcd3@krzk-bin>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250701-mottled-clever-walrus-f7dcd3@krzk-bin>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Z+PsHGRA c=1 sm=1 tr=0 ts=68664f2c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10
 a=z97pFrWBJukyg1BkY94A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDA3OCBTYWx0ZWRfX8UQw/MA7PL37
 gbOYW7JuoqHEOBxy8x0mHsSZtGIBk+voLShXu6J6WGNO0FUX2h9TGs1AKWl57erHEaMLe9ZQgnm
 R+Zd5ReqTfa6Hl6nKR2Dznc3opNkUYn2E5sRhX0L/cLkYLkK7Fj6G5Y4OFkr6upvQPuAe3VBou/
 9ftvi33yD6AdQRatBDEh5aW5hyNehqkiiIeF8lKXb7cSrfgaaeiawTEO2DEFIXPskXGuwqGcYvy
 U7oX2JNuWV3TA5NdIodajiLNh9vZ5SfjMWdpE2krEze95WPeV2GB+YRPfKuklCwuBqSkbKu3sQ1
 whyAG3m09I9ItYVMPkrLTO8nYv2+NIKMlzLfrfaATDT0GilE+ynfoL06eQlrRyCnzB24D3M55dL
 7g6e9AOQZh45iS777CVKEQYOdI8RjNcLGe9VX+KQ4nUAkdQA1j/KfVc4SaDUDGMJSqbCywla
X-Proofpoint-GUID: Ipww-gDeKaUXzGkcJvTRDz5XUSrPL6D8
X-Proofpoint-ORIG-GUID: Ipww-gDeKaUXzGkcJvTRDz5XUSrPL6D8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 mlxlogscore=999
 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030078



On 7/1/2025 3:11 PM, Krzysztof Kozlowski wrote:
> On Thu, Jun 26, 2025 at 10:31:00PM +0800, Luo Jie wrote:
>> +      resets:
>> +        maxItems: 1
>> +        description: EDMA reset from NSS clock controller
>> +
>> +      interrupts:
>> +        minItems: 65
>> +        maxItems: 65
>> +
>> +      interrupt-names:
>> +        minItems: 65
>> +        maxItems: 65
>> +        description:
>> +          Interrupts "txcmpl_[0-31]" are the Ethernet DMA TX completion ring interrupts.
>> +          Interrupts "rxfill_[0-7]" are the Ethernet DMA RX fill ring interrupts.
>> +          Interrupts "rxdesc_[0-23]" are the Ethernet DMA RX Descriptor ring interrupts.
>> +          Interrupt "misc" is the Ethernet DMA miscellaneous error interrupt.
>> +
>> +    required:
>> +      - clocks
>> +      - clock-names
>> +      - resets
>> +      - interrupts
>> +      - interrupt-names
>> +
>> +patternProperties:
>> +  "^(ethernet-)?port@[0-9a-f]+$":
> 
> Only one port? What are you switching here?

Sorry that this was missed in the update. We wanted to
add the ethernet-port' property to ensure we document
the per-port clocks/resets for completeness, but missed
adding the 'ethernet-ports' property. I will add the
'ethernet-ports' node in the updated version of the patch
to accurately reflect the schema and hardware hierarchy.

There are six physical ports in the PPE that can be part of
the switch function.

> 
> Anyway, ^ethernet-port..... is preferred over port.

OK, I will update to use '^ethernet-port' instead.

> 
> But other problem is that it does not match referenced schema at all and
> nothing in commit msg explains why this appered. 1.5 years of
> development of this and some significant, unexpected and not correct
> changes.
> 

I understand your concern. This change was described briefly in the V5
cover letter, but I will improve this description in cover letter and
update the commit message as well, to explicitly document this change.
The motivation for adding the ethernet-port node in bindings was to
document the required per-port clocks and resets as well, as these
are essential for enabling Ethernet functionality on this hardware.

Could you please review the following proposed changes and let me know
if this approach is acceptable?

patternProperties:
   "^(ethernet-)?ports$":
     additionalProperties: true
     patternProperties:
       "^ethernet-port@[1-6]+$":
         type: object
         unevaluatedProperties: false
         $ref: ethernet-controller.yaml#
		
         properties:
           reg:
             minimum: 1
             maximum: 6
             description: PPE Ethernet port ID
			
           clocks:
             items:
               - description: Port MAC clock from NSS clock controller
               - description: Port RX clock from NSS clock controller
               - description: Port TX clock from NSS clock controller
			
           clock-names:
             items:
               - const: mac
               - const: rx
               - const: tx
			
           resets:
             items:
               - description: Port MAC reset from NSS clock controller
               - description: Port RX reset from NSS clock controller
               - description: Port TX reset from NSS clock controller
			
           reset-names:
             items:
               - const: mac
               - const: rx
               - const: tx
			
         required:
           - reg
           - clocks
           - clock-names
           - resets
           - reset-names
		
...

allOf:
   - $ref: ethernet-switch.yaml
...

>> +    unevaluatedProperties: false
>> +    $ref: ethernet-switch-port.yaml#
>> +
>> +    properties:
>> +      clocks:
>> +        items:
>> +          - description: Port MAC clock from NSS clock controller
>> +          - description: Port RX clock from NSS clock controller
>> +          - description: Port TX clock from NSS clock controller
>> +
>> +      clock-names:
>> +        items:
>> +          - const: mac
>> +          - const: rx
>> +          - const: tx
>> +
>> +      resets:
>> +        items:
>> +          - description: Port MAC reset from NSS clock controller
>> +          - description: Port RX reset from NSS clock controller
>> +          - description: Port TX reset from NSS clock controller
>> +
>> +      reset-names:
>> +        items:
>> +          - const: mac
>> +          - const: rx
>> +          - const: tx
>> +
>> +    required:
>> +      - reg
>> +      - clocks
>> +      - clock-names
>> +      - resets
>> +      - reset-names
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - interconnects
>> +  - interconnect-names
>> +  - ethernet-dma
>> +
>> +allOf:
>> +  - $ref: ethernet-switch.yaml
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
>> +    #include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
>> +    #include <dt-bindings/interconnect/qcom,ipq9574.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
>> +
>> +    ethernet-switch@3a000000 {
>> +        compatible = "qcom,ipq9574-ppe";
>> +        reg = <0x3a000000 0xbef800>;
>> +        clocks = <&nsscc NSS_CC_PPE_SWITCH_CLK>,
>> +                 <&nsscc NSS_CC_PPE_SWITCH_CFG_CLK>,
>> +                 <&nsscc NSS_CC_PPE_SWITCH_IPE_CLK>,
>> +                 <&nsscc NSS_CC_PPE_SWITCH_BTQ_CLK>;
>> +        clock-names = "ppe",
>> +                      "apb",
>> +                      "ipe",
>> +                      "btq";
>> +        resets = <&nsscc PPE_FULL_RESET>;
>> +        interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>;
>> +        interconnects = <&nsscc MASTER_NSSNOC_PPE &nsscc SLAVE_NSSNOC_PPE>,
>> +                        <&nsscc MASTER_NSSNOC_PPE_CFG &nsscc SLAVE_NSSNOC_PPE_CFG>,
>> +                        <&gcc MASTER_NSSNOC_QOSGEN_REF &gcc SLAVE_NSSNOC_QOSGEN_REF>,
>> +                        <&gcc MASTER_NSSNOC_TIMEOUT_REF &gcc SLAVE_NSSNOC_TIMEOUT_REF>,
>> +                        <&gcc MASTER_MEM_NOC_NSSNOC &gcc SLAVE_MEM_NOC_NSSNOC>,
>> +                        <&gcc MASTER_NSSNOC_MEMNOC &gcc SLAVE_NSSNOC_MEMNOC>,
>> +                        <&gcc MASTER_NSSNOC_MEM_NOC_1 &gcc SLAVE_NSSNOC_MEM_NOC_1>;
>> +        interconnect-names = "ppe",
>> +                             "ppe_cfg",
>> +                             "qos_gen",
>> +                             "timeout_ref",
>> +                             "nssnoc_memnoc",
>> +                             "memnoc_nssnoc",
>> +                             "memnoc_nssnoc_1";
>> +
>> +        ethernet-dma {
>> +            clocks = <&nsscc NSS_CC_PPE_EDMA_CLK>,
>> +                     <&nsscc NSS_CC_PPE_EDMA_CFG_CLK>;
>> +            clock-names = "sys",
>> +                          "apb";
>> +            resets = <&nsscc EDMA_HW_RESET>;
>> +            interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
>> +                         <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
>> +            interrupt-names = "txcmpl_0",
>> +                              "txcmpl_1",
>> +                              "txcmpl_2",
>> +                              "txcmpl_3",
>> +                              "txcmpl_4",
>> +                              "txcmpl_5",
>> +                              "txcmpl_6",
>> +                              "txcmpl_7",
>> +                              "txcmpl_8",
>> +                              "txcmpl_9",
>> +                              "txcmpl_10",
>> +                              "txcmpl_11",
>> +                              "txcmpl_12",
>> +                              "txcmpl_13",
>> +                              "txcmpl_14",
>> +                              "txcmpl_15",
>> +                              "txcmpl_16",
>> +                              "txcmpl_17",
>> +                              "txcmpl_18",
>> +                              "txcmpl_19",
>> +                              "txcmpl_20",
>> +                              "txcmpl_21",
>> +                              "txcmpl_22",
>> +                              "txcmpl_23",
>> +                              "txcmpl_24",
>> +                              "txcmpl_25",
>> +                              "txcmpl_26",
>> +                              "txcmpl_27",
>> +                              "txcmpl_28",
>> +                              "txcmpl_29",
>> +                              "txcmpl_30",
>> +                              "txcmpl_31",
>> +                              "rxfill_0",
>> +                              "rxfill_1",
>> +                              "rxfill_2",
>> +                              "rxfill_3",
>> +                              "rxfill_4",
>> +                              "rxfill_5",
>> +                              "rxfill_6",
>> +                              "rxfill_7",
>> +                              "rxdesc_0",
>> +                              "rxdesc_1",
>> +                              "rxdesc_2",
>> +                              "rxdesc_3",
>> +                              "rxdesc_4",
>> +                              "rxdesc_5",
>> +                              "rxdesc_6",
>> +                              "rxdesc_7",
>> +                              "rxdesc_8",
>> +                              "rxdesc_9",
>> +                              "rxdesc_10",
>> +                              "rxdesc_11",
>> +                              "rxdesc_12",
>> +                              "rxdesc_13",
>> +                              "rxdesc_14",
>> +                              "rxdesc_15",
>> +                              "rxdesc_16",
>> +                              "rxdesc_17",
>> +                              "rxdesc_18",
>> +                              "rxdesc_19",
>> +                              "rxdesc_20",
>> +                              "rxdesc_21",
>> +                              "rxdesc_22",
>> +                              "rxdesc_23",
>> +                              "misc";
>> +        };
>> +
>> +        ethernet-ports {
> 
> Look at your binding, not what it said...

I will fix this to add the ethernet-ports node in the next version.

> 
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@1 {
> 
> Best regards,
> Krzysztof
> 
> 


