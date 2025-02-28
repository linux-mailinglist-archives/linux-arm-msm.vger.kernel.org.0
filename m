Return-Path: <linux-arm-msm+bounces-49819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5340A49210
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 08:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 982E01892C78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 07:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FAA51CAA9E;
	Fri, 28 Feb 2025 07:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="OlqJxuxI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900351C7010;
	Fri, 28 Feb 2025 07:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727267; cv=none; b=PshYcqyTfMH1oa4j0lHJ4D3P7YH3dNkNWU8TsjHeXCjiDLvQDA53riU0ClHI/Xv4QQRVa84nZvZMsw/1VNenJygoCUT5jnw3I3Qu/dnvQXegfUyC3/W0RCdqD6BOFh+rq8XycG9o0q8iNVND2f0CTg4DmGxvsnQNyqDE7fEzDCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727267; c=relaxed/simple;
	bh=sl9r9VQ6VexKVxeS2jQ44jEFHbpnEm4bkHQf6mGicRU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=NOh0aJ8zOHF6D4FD3bB5WXGIXXx3cSkFFjNr9yZI2R0TqREc6jGsKWHLL1hi7T5njLwoIO/xqKWjeJCVkhyldTP39GBT47hRrDB2gP2zOukmWlCVr+FLOO7+60rpIdTdJDSAs6jH6K4LqrNplrlVodBAQrprgqpG0ED+s5TF2GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=OlqJxuxI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51RL6ZHk004454;
	Fri, 28 Feb 2025 07:20:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	COq625R9+If4QE8gOV9Ke/T020e16SpptKW3azs+Okw=; b=OlqJxuxIkVTSHXP+
	jDR6RKK2zNWa64q1Rb9NI+MV3zkz8qmp5b+XTSiyxxj+T5w+R7aEyxWCXbcqu4+M
	8h5KMgji8a9YNan+5FY3htFN3ZiIw4Ko9AIAZypw4rbowIQtKY6gI5uv2iHjRRyO
	uXu09u58CTUOyP0bOtrGdX94kv4gH9WT0MCjUQljp0DeDOqrSYE/vQnrXY/AMW68
	spauiuawVcNj+IkI6sbk8s9MrNAUGqvhvKkYIUQKstbOTF91OIJ3s//hd/RwGmQi
	on86M3XTsrcBks39BglaOqx43r4yGl8NL12sREl8WsTlCQMgEV7MV3Vl7pL3Ij3h
	mt+KOw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452pm7k2bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:20:39 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51S7KcRX004787
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Feb 2025 07:20:38 GMT
Received: from [10.239.133.114] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 27 Feb
 2025 23:20:29 -0800
Message-ID: <1c483978-8e9d-4ba0-8c92-6b4f8c366e2a@quicinc.com>
Date: Fri, 28 Feb 2025 15:20:27 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
To: Rob Herring <robh@kernel.org>
CC: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <kernel@quicinc.com>,
        <linux-kernel@vger.kernel.org>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@oss.qualcomm.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
 <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
 <20250221235307.GA401276-robh@kernel.org>
Content-Language: en-US
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
In-Reply-To: <20250221235307.GA401276-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g8-R13Gx_sxjZuIiU79pSGN8ljaQUnLU
X-Proofpoint-GUID: g8-R13Gx_sxjZuIiU79pSGN8ljaQUnLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_01,2025-02-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280051



On 2/22/2025 7:53 AM, Rob Herring wrote:
> On Fri, Feb 21, 2025 at 03:40:28PM +0800, Yuanfang Zhang wrote:
>> Adds new coresight-tnoc.yaml file describing the bindings required
>> to define Trace NOC in the device trees.
>>
>> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
>> ---
>>  .../bindings/arm/qcom,coresight-tnoc.yaml          | 107 +++++++++++++++++++++
>>  1 file changed, 107 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..b8c1aaf014fb483fd960ec55d1193fb3f66136d2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
>> @@ -0,0 +1,107 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Ttrace NOC(Network On Chip)
>> +
>> +maintainers:
>> +  - yuanfang Zhang <quic_yuanfang@quicinc.com>
>> +
>> +description:
>> +  The Trace NoC is an integration hierarchy which is a replacement of Dragonlink tile configuration.
>> +  It brings together debug component like TPDA, funnel and interconnect Trace Noc which collects trace
>> +  from subsystems and transfers to QDSS sink.
>> +
>> +  It sits in the different subsystem of SOC and aggregates the trace and transports it to Aggregation TNoC
>> +  or to QDSS trace sink eventually. Trace NoC embeds bridges for all the interfaces(APB, ATB, QPMDA & NTS).
>> +
>> +  Trace NoC can take inputs from different trace sources i.e. ATB, QPMDA.
> 
> Wrap lines at 80 char. And you need '>' to preserve paragraphs.
how to use '>' to preserve paragraphs? i don't find it on other yaml, could you share one example?
> 
>> +
>> +# Need a custom select here or 'arm,primecell' will match on lots of nodes
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        enum:
>> +          - qcom,coresight-tnoc
>> +  required:
>> +    - compatible
>> +
>> +properties:
>> +  $nodename:
>> +    pattern: "^tn(@[0-9a-f]+)$"
> 
> blank line
Done in V2.
> 
>> +  compatible:
>> +    items:
>> +      - const: qcom,coresight-tnoc
>> +      - const: arm,primecell
>> +
>> +  reg:
>> +    minItems: 1
>> +    maxItems: 2
> 
> Need to describe what each entry is.
Update in V2.
> 
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    items:
>> +      - const: apb_pclk
>> +
>> +  in-ports:
>> +    description: |
> 
> Don't need '|'
Done in V2.
> 
>> +      Input connections from subsystem to TNoC
>> +    $ref: /schemas/graph.yaml#/properties/ports
> 
> You have to define the 'port' nodes.
Done in V2.
> 
>> +
>> +  out-ports:
>> +    description: |
>> +      Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port:
>> +        description: |
>> +          Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.
> 
> 'connections' sounds like more than 1, but you only have 1 port. 
> 
> Wrap at 80 char.
Done in V2.
> 
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - in-ports
>> +  - out-ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    tn@109ab000  {
>> +      compatible = "qcom,coresight-tnoc", "arm,primecell";
>> +      reg = <0x0 0x109ab000  0x0 0x4200>;
>> +
>> +      clocks = <&aoss_qmp>;
>> +      clock-names = "apb_pclk";
>> +
>> +      in-ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@0 {
>> +          reg = <0>;
>> +
>> +          tn_ag_in_tpdm_gcc: endpoint {
>> +            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
>> +          };
>> +        };
>> +      };
>> +
>> +      out-ports {
>> +        port {
>> +          tn_ag_out_funnel_in1: endpoint {
>> +            remote-endpoint = <&funnel_in1_in_tn_ag>;
>> +          };
>> +        };
>> +      };
>> +    };
>> +...
>>
>> -- 
>> 2.34.1
>>


