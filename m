Return-Path: <linux-arm-msm+bounces-28246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD2F94D0C2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 15:02:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 350C81C20EB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 13:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE2A19307A;
	Fri,  9 Aug 2024 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BMXdtn49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD52E1917F7;
	Fri,  9 Aug 2024 13:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723208530; cv=none; b=pacYoHcGotdcDO3Ne/TXPoX7ysXtWTNmaqeRF3B1WXkXEcoUHr6YxMUVid9VCY+akAwM8aOG/HFdBQcYEzD0YXfBom+4qtNjFmOjOLGtyydH9mS4Aw+mwl2E3EUIA7OGt1wcN2Z/eH9mKvC5/jNIJ2MS5Etntfm8WqKzanyRcHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723208530; c=relaxed/simple;
	bh=0JIgO0RDJpCIh6eOO85xcuuqnaghxCx0BS/wi4vV7UQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=n39pE3eu2YR4CxoioOXCTrnq1NY2RqbIODGTQUbsPHEuKfPIQNynnzdlcPG1KVnrvC1OsRiw2BksTOmuceK0QK6BHaTU683reKd1i9MZyu0iP9PSv1D4ulNUERsEMzGsbob6e/IcYNGSNbMKwvFiL+w8j47/S8bq86FFRQ17g4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BMXdtn49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 479AkrdB000990;
	Fri, 9 Aug 2024 13:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V709B2quZWGXt+emlcthA4aQUlL8/vH27lYx4Vkru8k=; b=BMXdtn49PRpSBq3x
	hef4KLV1ZqJfctxb48amz8AtEmrweU8ZLy5qD91Y2URT5FWLXJrjVtF+i1jV4lRT
	28uN1G/VXpYGuPpLVvmRDpWOFakpPxxAkl+mTa3L4ac3p6bIQFhTDD0YJfllw+dP
	XcA/EpH7h4lSkVDHnPCp8+8kKSjs5vwH96nHI78wVYrKXaf1PVpVQROx1NoxzAh9
	dBXTy5HGHY8OkWaCpO3jKO6Y3h1xqb37rlF/Gl1AhLAqOct8elA+r0pB1o8ZjUCR
	TFt9rThjZrPFlMprcI4Xc184LYWoUF9HeuOroG5OnR8TPrc7y05cWre2/cLrsg68
	2z9uDg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vfav5c54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 13:01:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 479D1r9V007903
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 13:01:53 GMT
Received: from [10.253.72.235] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 9 Aug 2024
 06:01:49 -0700
Message-ID: <a0fe7735-76fd-4a53-9446-5371e341ba17@quicinc.com>
Date: Fri, 9 Aug 2024 21:01:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: qcom: Add common PLL clock
 controller for IPQ SoC
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Stephen
 Boyd" <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
 <20240808-qcom_ipq_cmnpll-v1-1-b0631dcbf785@quicinc.com>
 <81524fee-c32c-405b-b63b-d048dde6ae33@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <81524fee-c32c-405b-b63b-d048dde6ae33@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pNmHF6kDYnutGDt0tXCqo5BBii1zfhDE
X-Proofpoint-GUID: pNmHF6kDYnutGDt0tXCqo5BBii1zfhDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-09_10,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090095



On 8/8/2024 10:38 PM, Krzysztof Kozlowski wrote:
> On 08/08/2024 16:03, Luo Jie wrote:
>> The common PLL controller provides clocks to networking hardware
>> blocks on Qualcomm IPQ SoC. It receives input clock from the on-chip
>> Wi-Fi, and produces output clocks at fixed rates. These output rates
>> are predetermined, and are unrelated to the input clock rate. The
>> output clocks are supplied to the Ethernet hardware such as PPE
>> (packet process engine) and the externally connected switch or PHY
>> device.
>>
>> The common PLL driver is initially being supported for IPQ9574 SoC.
> 
> Drop references to driver and explain the hardware.
> 
> Above with the usage of "common" looks like this is all for some common
> driver, not for particular hardware.

Understand, will remove this driver reference.

> 
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,ipq-cmn-pll.yaml           | 87 ++++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml
>> new file mode 100644
>> index 000000000000..c45b3a201751
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml
> 
> Use compatible as filename.

OK.

> 
>> @@ -0,0 +1,87 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq-cmn-pll.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Common PLL Clock Controller on IPQ SoC
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Luo Jie <quic_luoj@quicinc.com>
>> +
>> +description:
>> +  The common PLL clock controller expects a reference input clock.
>> +  This reference clock is from the on-board Wi-Fi. The CMN PLL
>> +  supplies a number of fixed rate output clocks to the Ethernet
>> +  devices including PPE (packet process engine) and the connected
>> +  switch or PHY device.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq9574-cmn-pll
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: The reference clock, the supported clock rates include
>> +          25000000, 31250000, 40000000, 48000000, 50000000 and 96000000 HZ.
>> +      - description: The AHB clock
>> +      - description: The SYS clock
>> +    description:
>> +      The reference clock is the source clock of CMN PLL, which is from the
>> +      Wi-Fi. The AHB and SYS clocks must be enabled to access common PLL
>> +      clock registers.
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ref
>> +      - const: ahb
>> +      - const: sys
>> +
>> +  clock-output-names:
>> +    items:
>> +      - const: ppe-353mhz
>> +      - const: eth0-50mhz
>> +      - const: eth1-50mhz
>> +      - const: eth2-50mhz
>> +      - const: eth-25mhz
> 
> Drop entire property. If the names are fixed, what's the point of having
> it in DTS? There is no.

We had added the output names here for the reasons below. Can you please
let us know your suggestion whether keeping these here is fine?

1.) These output clocks are used as input reference clocks to other
consumer blocks. For example, an on-board Ethernet PHY device may be
wired to receive a specific clock from the above output clocks as
reference clock input, and hence the PHY's DTS node would need to
reference a particular index in this output clock array.

Without these output clocks being made available in this DTS, the PHY
driver in above case would not know the clock specifier to access the
handle for the desired input clock.

2.) One of the suggestions from the internal code review with Linaro was
to name the output clocks specifically based on rate and destination
(Ex: 'ppe-353mhz' for fixed rate 353 MHZ output clock connected to
Packet Process Engine block), so that the dt-bindings describe the
input/output clocks clearly.

> 
> Best regards,
> Krzysztof
> 


