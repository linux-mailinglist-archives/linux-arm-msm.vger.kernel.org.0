Return-Path: <linux-arm-msm+bounces-4399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB1480EB3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 13:05:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 165301F21DA6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 12:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1EED5DF3F;
	Tue, 12 Dec 2023 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IDF5p6ZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF6749F;
	Tue, 12 Dec 2023 04:05:04 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BCBagqS002203;
	Tue, 12 Dec 2023 12:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=RI094VLF8Fa6BPNhKOYXmUsNOQvyIpj/1tTjLTIQObw=; b=ID
	F5p6ZWq5BUWIeVOuS80Q/CVTIcz24B4txIZJ848IwuzBKhpRkCuk1/OEJRkZz6SK
	KkjK5U9/kirBxQLngrJPFyeii00dTRoAppu/ijw3BFWzBKc2k+2cxHAG23I7W/ny
	4C+9Y6BZd+ri8eKchVWOAK5DZs4x9YDmYs3Z08fOmmzitP7GVVx85NsKL1kB661/
	BMH6KniLhbPvS+fiBTGOKwmfHojVOvy+O9TRX0RL6Hsox8WHjKvv0ZJ358p9ELUP
	SqQvP3BMxR+O8yDx1RIu4/Sydh1+v6FyTs9PEQTeVqYy/eJt5Lajk3BEf+8hR3yG
	jllv7+2PfAay6MCCOrlA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uxpsu81pn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 12:04:49 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BCC4nDn000821
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Dec 2023 12:04:49 GMT
Received: from [10.216.62.2] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 12 Dec
 2023 04:04:36 -0800
Message-ID: <94e4e23c-232d-4b7e-84f3-939d32eed944@quicinc.com>
Date: Tue, 12 Dec 2023 17:34:31 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v5 1/3] dt-bindings: net: qcom,ethqos: add
 binding doc for safety IRQ for sa8775p
Content-Language: en-US
To: Andrew Halaney <ahalaney@redhat.com>
CC: Vinod Koul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jose Abreu
	<joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>, Rob Herring <robh@kernel.org>,
        <kernel@quicinc.com>
References: <20231211080153.3005122-1-quic_jsuraj@quicinc.com>
 <20231211080153.3005122-2-quic_jsuraj@quicinc.com>
 <2ihncgvnfxgzj5kfm3eedvj3jvru7fokpno5pdzgtnuuy2mpqf@sfuzuugeuxzh>
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
In-Reply-To: <2ihncgvnfxgzj5kfm3eedvj3jvru7fokpno5pdzgtnuuy2mpqf@sfuzuugeuxzh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -UNKWI9FkuYR77fSFCrge7y4B6HaSc8n
X-Proofpoint-ORIG-GUID: -UNKWI9FkuYR77fSFCrge7y4B6HaSc8n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312120096

sure @andrew

Thanks
Suraj

On 12/11/2023 7:22 PM, Andrew Halaney wrote:
> On Mon, Dec 11, 2023 at 01:31:51PM +0530, Suraj Jaiswal wrote:
>> Add binding doc for safety IRQ. The safety IRQ will be
>> triggered for ECC(error correction code), DPP(data path
>> parity), FSM(finite state machine) error.
>>
>> Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
> 
> Rob gave you his Reviewed-by over here on the last revision:
> 
>     https://lore.kernel.org/netdev/170206782161.2661547.16311911491075108498.robh@kernel.org/
> 
> in the future if someone gives you a tag you should add it to the patch
> for the next revision you send out (assuming you have to send out
> another version, otherwise the maintainers will collect the tags when
> they merge that version of the series). If the patches change a lot then
> it makes sense to remove the tag since it wasn't what they reviewed, but
> in this case you've only expanded a comment in the commit message so it is
> appropriate to be present.
> 
>> ---
>>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml | 9 ++++++---
>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml  | 6 ++++--
>>  2 files changed, 10 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> index 7bdb412a0185..93d21389e518 100644
>> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
>> @@ -37,12 +37,14 @@ properties:
>>      items:
>>        - description: Combined signal for various interrupt events
>>        - description: The interrupt that occurs when Rx exits the LPI state
>> +      - description: The interrupt that occurs when HW safety error triggered
>>  
>>    interrupt-names:
>>      minItems: 1
>>      items:
>>        - const: macirq
>> -      - const: eth_lpi
>> +      - enum: [eth_lpi, safety]
>> +      - const: safety
>>  
>>    clocks:
>>      maxItems: 4
>> @@ -89,8 +91,9 @@ examples:
>>                 <&gcc GCC_ETH_PTP_CLK>,
>>                 <&gcc GCC_ETH_RGMII_CLK>;
>>        interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
>> -                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
>> -      interrupt-names = "macirq", "eth_lpi";
>> +                   <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
>> +                   <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
>> +      interrupt-names = "macirq", "eth_lpi", "safety";
>>  
>>        rx-fifo-depth = <4096>;
>>        tx-fifo-depth = <4096>;
>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> index 5c2769dc689a..3b46d69ea97d 100644
>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>> @@ -107,13 +107,15 @@ properties:
>>        - description: Combined signal for various interrupt events
>>        - description: The interrupt to manage the remote wake-up packet detection
>>        - description: The interrupt that occurs when Rx exits the LPI state
>> +      - description: The interrupt that occurs when HW safety error triggered
>>  
>>    interrupt-names:
>>      minItems: 1
>>      items:
>>        - const: macirq
>> -      - enum: [eth_wake_irq, eth_lpi]
>> -      - const: eth_lpi
>> +      - enum: [eth_wake_irq, eth_lpi, safety]
>> +      - enum: [eth_wake_irq, eth_lpi, safety]
>> +      - enum: [eth_wake_irq, eth_lpi, safety]
>>  
>>    clocks:
>>      minItems: 1
>> -- 
>> 2.25.1
>>
> 

