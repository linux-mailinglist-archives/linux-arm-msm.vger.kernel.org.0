Return-Path: <linux-arm-msm+bounces-60561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC684AD18BC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 08:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9952A16964E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 06:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC405280038;
	Mon,  9 Jun 2025 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Svf2AohE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BE02571C9;
	Mon,  9 Jun 2025 06:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749452091; cv=none; b=IVkCzmUYW2I7vg+nxgCfR3CRkU+gFsqN4FYXqEaByRjXpY0Q5D9ezCyEGpYDbXrJyujTHCaADRIAxARpOFOSS4GZ0G+GWtoHFfVTLim17TRts08KJZcaOAXuycreNFqiCJgHyHvIlUTlsOuibwxT7KI3K5Ik3t/xQNavDhZ/kUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749452091; c=relaxed/simple;
	bh=Cojg2dVDnqNr9CCklLCLNK1Qh8o4I3bWRCdX/RP+HVk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oFCWiRxzPlg84f4BThXs64LyRo6FK9lViEX/PVJQRMkTuTdeynctiIApjbAYZhGdTyLHKdXBEExZ4CgU9IZXJfj90c9u2sglrcM62zvXw++M/udbDuA9Ljk1jiw25FUPaS12oAPOOZYzWFnWTmTCbat04AeiG5SbT7csGnQR4/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Svf2AohE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 558MiJtn012900;
	Mon, 9 Jun 2025 06:54:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vEGNZ/5kUzBKvjZOAMTeXKujI1gUanQOm2fMPSMWPWY=; b=Svf2AohEB9EfTN01
	kjkj2JNT44fm+pnAH9ymphjQmqW+TVl/KVZi0O/N8AFffMQjdEajpibU1hc/GpE0
	B8jl6/g8fWgJUSKJYJGoVe1hZRyCy2mBh51v7dfsnX+gu0NxCD+d5p82AY7EVWPH
	NElumsw43qEm7yPqJyItnSqqliuud/v4BOXKnMlWO8J4pPcWdaGHjmPCfe9dV4EE
	fWi3o2hvsdmmQznFVeLtwcCjiy0t/uy4yfcCXMa6vN9sfDV9pN5xtm8DZwVOsxAs
	nHG6O6K4vrDO1skCzeRQZ0EUYg8TfBYbfUuxM610v7wHIbckDWJsDLMjItktz+T0
	NVlHXg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ce9n7a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 06:54:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5596saTs003345
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 06:54:36 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 8 Jun 2025
 23:54:32 -0700
Message-ID: <8a25a320-6700-4fd0-aa08-38fe1e8c4623@quicinc.com>
Date: Mon, 9 Jun 2025 14:54:30 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/2] dt-bindings: arm: Add device Trace Network On Chip
 definition
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
References: <20250606-trace-noc-v8-0-833f94712c57@quicinc.com>
 <20250606-trace-noc-v8-1-833f94712c57@quicinc.com>
 <11ea6009-72d2-4306-a068-a828d4af429d@arm.com>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <11ea6009-72d2-4306-a068-a828d4af429d@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eeuU-mup0ycxy3L90y4Ta8SmAlLinmWu
X-Authority-Analysis: v=2.4 cv=drjbC0g4 c=1 sm=1 tr=0 ts=6846852d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=x9t6tEnLmRZl-dXiHhQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eeuU-mup0ycxy3L90y4Ta8SmAlLinmWu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA1MiBTYWx0ZWRfX1GhIvPT7uXIq
 K3amFUW68uOF7V8XTtlpN24kO6/3pp25cu+O5a07FTAmf20CepMtNFBPaYa+Ym7JaSCHYTBpvhZ
 LIi3OD5xdmNEolltpWvOd9RUvtnhAa2tOtywrO4zFRDbwpTzQuEIOFyNnmY/j6hJRqL0gLsfAo/
 qlcyCSfQOL6NUEalut5FA8voRQ/c4TurfIub8nVj9Hffj2oQvkZXmhpXUdv99D7raWmC8+zWfOz
 XhirkEEfhs8KrWupDcdNRCW/yn4mApFAk1EbEj2V1O+9lT3gp7WYCJB/X5LIxHPRMtbA7hvW7z3
 KdSEyjWqyKFueubJiKlVgcSY5ba5ueuQeLYFGfhe4VJmnGmMXoXa+gAFpywhNipSUMLo2MikGht
 cxjAjf/iX3+irzyqa7b2tKkyCTQJ5rjm2JVBG1hfvYi+50TZwJq5j42QFSzEjpYSZ0OQTMw1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506090052



On 6/6/2025 5:32 PM, Suzuki K Poulose wrote:
> On 06/06/2025 10:18, Yuanfang Zhang wrote:
>> Add a new coresight-tnoc.yaml file to describe the bindings required to
>> define Trace Network On Chip (TNOC) in device trees. TNOC is an
>> integration hierarchy which is a hardware component that integrates the
>> functionalities of TPDA and funnels. It collects trace form subsystems
>> and transfers to coresight sink.
>>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>   .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 +++++++++++++++++++++
>>   1 file changed, 111 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d07c6f2d7b949f69f9d8dd8de8664382eb39fac1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> @@ -0,0 +1,111 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Trace Network On Chip - TNOC
>> +
>> +maintainers:
>> +  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> +
>> +description: >
>> +  The Trace Network On Chip (TNOC) is an integration hierarchy hardware
>> +  component that integrates the functionalities of TPDA and funnels.
>> +
>> +  It sits in the different subsystem of SOC and aggregates the trace and
>> +  transports it to Aggregation TNOC or to coresight trace sink eventually.
>> +  TNOC embeds bridges for all the interfaces APB, ATB, TPDA and NTS (Narrow
>> +  Time Stamp).
>> +
>> +  TNOC can take inputs from different trace sources i.e. ATB, TPDM.
> 
> This looks like the generic description of TNOC. But please could you
> also mention this binding is only for Aggregator TNOC ? Or make the
> binding as such explicit ?
> 
> - qcom,coresight-aggregator-tnoc
> 
> Suzuki
> 
sure, will update in next patch.
> 
>> +
>> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - qcom,coresight-tnoc
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^tn(@[0-9a-f]+)$"
>> +
>> +  compatible:
>> +    items:
>> +      - const: qcom,coresight-tnoc
>> +      - const: arm,primecell
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb_pclk
>> +
>> +  clocks:
>> +    items:
>> +      - description: APB register access clock
>> +
>> +  in-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    patternProperties:
>> +      '^port(@[0-9a-f]{1,2})?$':
>> +        description: Input connections from CoreSight Trace Bus
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +  out-ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +    additionalProperties: false
>> +
>> +    properties:
>> +      port:
>> +        description:
>> +          Output connection to CoreSight Trace Bus
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - in-ports
>> +  - out-ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tn@109ab000  {
>> +      compatible = "qcom,coresight-tnoc", "arm,primecell";
>> +      reg = <0x109ab000 0x4200>;
>> +
>> +      clocks = <&aoss_qmp>;
>> +      clock-names = "apb_pclk";
>> +
>> +      in-ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@0 {
>> +          reg = <0>;
>> +
>> +          tn_ag_in_tpdm_gcc: endpoint {
>> +            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
>> +          };
>> +        };
>> +      };
>> +
>> +      out-ports {
>> +        port {
>> +          tn_ag_out_funnel_in1: endpoint {
>> +            remote-endpoint = <&funnel_in1_in_tn_ag>;
>> +          };
>> +        };
>> +      };
>> +    };
>> +...
>>
> 


