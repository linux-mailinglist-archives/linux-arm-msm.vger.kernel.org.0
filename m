Return-Path: <linux-arm-msm+bounces-59201-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 838B3AC211F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 12:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97E173AC023
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 10:29:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3F6227EB6;
	Fri, 23 May 2025 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SVpGnTvc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01104227E9E;
	Fri, 23 May 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747996158; cv=none; b=X2DTI7mxzkMkFnfmiICM77Bml3RfNhuIZOnXKeEl8LYv0HFiwhYB7g8vlT55/1RZ63eTDzyb7rb69OhE11bOspcE0CiAR4NYFczWWw8ZgXsuuFpgTZZkf9zZ08IX+tH61Xn8z+1Bbix9kvmmLh3xnoltqbx1IpkDJuqy6KM5hSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747996158; c=relaxed/simple;
	bh=69dBOB9t5w6+DiXnD4zLoDAgDAyiYK0UYmfZGxLAz/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OHMfYZX/pHtyTi1QOi1yOjhZik/0MzQUnVXsJIBoJtU8e/q9OoKe/PCZha6Bp37EiuuXkr12ep4+fm54MM0UhbtG55m8bzT0F2YcLL3iveK4jOf8+HMmyfPxJoelSfil68oXrPePGxdGn07H3mkqXk5UUgGCvyiyzN7GOQw22Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SVpGnTvc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N67iam021071;
	Fri, 23 May 2025 10:28:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KDRRLq7VC2NTZWRaWPaOjv8BPHkEbqS5eOTo89pXTfQ=; b=SVpGnTvcUoNo43oV
	nbAN5tgpBbUIrdI39tY9EmRdXYxUIl58jImYrnfIixKte/dHRnNQw+KbHLhQMUmu
	f6kq3cayRFgHau5bZzhaN8B/G3+mjZKsMOnzuzaCTuVei8xf+41LW6VEikHSlErz
	WzlPWyuHpGhUOiOYzR4m/tXnIjDzVtPNltXn0gdHF1/RtNKg5QMie0PGKPWepwi0
	OyYONarTm+RGdwoa6sWl9eXJFpwq2foI54UocM7Ql3w0lfPgzgaTmclG8TVKV9cH
	diDU4SwKmc3lgmWkZv3L22BGQVK1qyiyarmll0m00o9yqxjQi7Fz9YsfSJd23kT5
	MZC9oA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfa1rb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:28:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54NASY4W011410
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 10:28:34 GMT
Received: from [10.253.12.254] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 23 May
 2025 03:28:28 -0700
Message-ID: <a182df27-5b0d-42d1-8f58-4e7a913bb12d@quicinc.com>
Date: Fri, 23 May 2025 18:28:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 01/14] dt-bindings: net: Add PPE for Qualcomm
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
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
 <20250513-qcom_ipq_ppe-v4-1-4fbe40cbbb71@quicinc.com>
 <20250519-garrulous-monumental-shrimp-94ad70@kuoka>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250519-garrulous-monumental-shrimp-94ad70@kuoka>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=68304de4 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=Prh-tzD87P_o6MH7a5AA:9 a=QEXdDO2ut3YA:10
 a=HtAgjdVYPwQA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GtcXkqmuuM1ynK2KNuUbAyDpRkW5s3MV
X-Proofpoint-GUID: GtcXkqmuuM1ynK2KNuUbAyDpRkW5s3MV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA5MyBTYWx0ZWRfX5H5lP9vRMAOB
 UDYRnaKYEXzsEh6wm4eFMj0HlpSBRTVspvJ/D1I/3cEq1JCev7eDvasAJwjAlqD20Daj7jTw80L
 W1aGpUAfvAf/m4LdRpvgYg36bVUgnvUlR6QqejYCl1urz8Gdnq196PbY5MuKwDqfaC++s8dY9og
 9/uEMRfVkDir5PLFvC2UAmfhDfB27JwSlvY4QGG37bGNGCl/n2RRwG1yBdI3FdtUaRiiAf4g+VF
 3CxCqWZWEQUck3hJoRtB8ka7UrgsiqJNDJpG2mGqKBF530U/vWjploYG1Kzhak1/UqeeQ7AUlmH
 q+O94dLUKTKu2N6YvmVA0X843uqAKLwzCO6XzUTSe+tP/Q6Fcso9+TDv7DY14D75UatWnGOQOW3
 96V8OhRMJwuwki70TMKVroY4PjcJsF4CZtu+gFUNjnalxeAq6dtgiAACH8hECAzpwQDQvPdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230093



On 5/19/2025 4:16 PM, Krzysztof Kozlowski wrote:
> On Tue, May 13, 2025 at 05:58:21PM GMT, Luo Jie wrote:
>> The PPE (packet process engine) hardware block is available in Qualcomm
>> IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
>> the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6 XGMAC), which
>> are used to connect with external PHY devices by PCS. It includes an L2
>> switch function for bridging packets among the 6 ethernet ports and the
>> CPU port. The CPU port enables packet transfer between the ethernet
>> ports and the ARM cores in the SoC, using the ethernet DMA.
>>
>> The PPE also includes packet processing offload capabilities for various
>> networking functions such as route and bridge flows, VLANs, different
>> tunnel protocols and VPN.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 406 +++++++++++++++++++++
>>   1 file changed, 406 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> new file mode 100644
>> index 000000000000..f36f4d180674
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> @@ -0,0 +1,406 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/qcom,ipq9574-ppe.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ packet process engine (PPE)
>> +
>> +maintainers:
>> +  - Luo Jie <quic_luoj@quicinc.com>
>> +  - Lei Wei <quic_leiwei@quicinc.com>
>> +  - Suruchi Agarwal <quic_suruchia@quicinc.com>
>> +  - Pavithra R <quic_pavir@quicinc.com>>
> 
> Double >>

Thanks, will fix it.

> 
>> +
>> +description:
> 
> You got here comment didn't you?
> 

Yes. We initially believed the '|' marker may not be required
since the format of hardware diagram in the description is
preserved with a specific '|' already. However we relooked
at this again, and will go ahead will add the marker based
on the below documentation reference.

https://docs.kernel.org/devicetree/bindings/writing-schema.html#example-schema

>> +  The Ethernet functionality in the PPE (Packet Process Engine) is comprised
>> +  of three components, the switch core, port wrapper and Ethernet DMA.
>> +
>> +  The Switch core in the IPQ9574 PPE has maximum of 6 front panel ports and
>> +  two FIFO interfaces. One of the two FIFO interfaces is used for Ethernet
>> +  port to host CPU communication using Ethernet DMA. The other is used
>> +  communicating to the EIP engine which is used for IPsec offload. On the
>> +  IPQ9574, the PPE includes 6 GMAC/XGMACs that can be connected with external
>> +  Ethernet PHY. Switch core also includes BM (Buffer Management), QM (Queue
>> +  Management) and SCH (Scheduler) modules for supporting the packet processing.
> 
> ...
> 
>> +  clock-names:
>> +    items:
>> +      - const: ppe
>> +      - const: apb
>> +      - const: ipe
>> +      - const: btq
>> +
>> +  resets:
>> +    maxItems: 1
>> +    description: PPE reset, which is necessary before configuring PPE hardware
>> +
>> +  interconnects:
>> +    items:
>> +      - description: Clock path leading to PPE switch core function
>> +      - description: Clock path leading to PPE register access
>> +      - description: Clock path leading to QoS generation
>> +      - description: Clock path leading to timeout reference
>> +      - description: Clock path leading to NSS NOC from memory NOC
>> +      - description: Clock path leading to memory NOC from NSS NOC
>> +      - description: Clock path leading to enhanced memory NOC from NSS NOC
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ppe
>> +      - const: ppe_cfg
>> +      - const: qos_gen
>> +      - const: timeout_ref
>> +      - const: nssnoc_memnoc
>> +      - const: memnoc_nssnoc
>> +      - const: memnoc_nssnoc_1
>> +
>> +  ethernet-dma:
> 
> I don't get why this is a separate node.
> 

We used a separate node because the EDMA (Ethernet DMA)
is a separate block within the PPE block, with specific
functions like ports-to-host-CPU packet transfer and
hardware packet steering. We felt that a separate node
would depict the hierarchy more clearly. Could you please
suggest if a single node is recommended instead?

>> +    type: object
>> +    additionalProperties: false
>> +    description:
>> +      EDMA (Ethernet DMA) is used to transmit packets between PPE and ARM
>> +      host CPU. There are 32 TX descriptor rings, 32 TX completion rings,
>> +      24 RX descriptor rings and 8 RX fill rings supported.
>> +
>> +    properties:
>> +      clocks:
>> +        items:
>> +          - description: EDMA system clock from NSS Clock Controller
>> +          - description: EDMA APB (Advanced Peripheral Bus) clock from
>> +              NSS Clock Controller
>> +
>> +      clock-names:
>> +        items:
>> +          - const: sys
>> +          - const: apb
>> +
>> +      resets:
>> +        maxItems: 1
>> +        description: EDMA reset from NSS clock controller
>> +
>> +      interrupts:
>> +        minItems: 29
>> +        maxItems: 57
> 
> Why is this flexible on the same SoC?

Thanks for pointing to this. I reviewed this again and agree
that this need not be a flexible setting. I will fix this in
the next update by setting 'minItems' and 'maxItems' here to
the count of all available EDMA interrupts.

> 
> Best regards,
> Krzysztof
> 


