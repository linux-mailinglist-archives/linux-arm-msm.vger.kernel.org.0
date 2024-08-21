Return-Path: <linux-arm-msm+bounces-29217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3595A274
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 18:09:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B8E61F2147F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Aug 2024 16:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC11A14D449;
	Wed, 21 Aug 2024 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="T8DWJv+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D161A13AA2F;
	Wed, 21 Aug 2024 16:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724256547; cv=none; b=QvZ+c7ovHkKyfUnjrIr1Rny7goQHp0LtSA4VZFUnYrtHn2C5NEcgvwhoBsCshqAlg+7tJOZUzLYU3hAmCW5PgeM6s1+xceGhA+1V/K33nD6HTpTvMXoQ83G8zNUia13BLWLTDsE1WBZstTN7eH9ABY0OSEVlF9DFGEQNKh9CJXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724256547; c=relaxed/simple;
	bh=DoNWiefNwlabTvrMKvLcoTr9m81BJcqm9zmd/I1QTjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=RExOeUT9pwfB+jBMNy0DuwlodS9rH9fqdnHIbabelFEFO3ro56PRcTIgpFOOUuWSC0LBhdATrybNKm+kvYX+hBnSTyG9VJGb+TqSgGXO3DQvWNnfR3x9RTR3WEMhHRyB1QnhHXAVyec9dDvnd8/Q9hMmhX/BAowg7kqCiOuFdCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=T8DWJv+e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LEQuNU018964;
	Wed, 21 Aug 2024 16:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	070i+fXfB+k/jMoONG0/PCDJnuCkejFp1EIr7Bg8A78=; b=T8DWJv+e5NlgPupx
	FhbrcB1sElckLLHYD6WO8F+CikbfYAmMVTyrH1tCVeoR9Sc2v0z9SlL6gPLy7ENX
	IrCB9QSue9SMA9zKE+nW0RNM2u/m7VQzoqRKXg6D3nsASpUWSdDZWcvYr2x3x+ta
	el6hh+4mnB+wM6K/0RxrNGBHz+VYXg0LYyem4Y6xG6sIWEhtMEpTWLNlVLVbztdm
	jA5B5JdgeGvrA1vIvjFAunj5ZXuhggv4+p5QQYOA4cT2o9y8NAU4tVwKznOoxnev
	4s5g6SRd5WDGCvSWOJAuMrPFx6cvFDE9P1mu9kvV6T2N1iZWfFeaTFZhdgFQkHGE
	fulsRQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415bkw9udf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 16:08:54 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47LG8rCx006912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Aug 2024 16:08:53 GMT
Received: from [10.253.73.208] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 Aug
 2024 09:08:48 -0700
Message-ID: <51198961-2e09-4d0e-8bf3-907c81597724@quicinc.com>
Date: Thu, 22 Aug 2024 00:08:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>
References: <20240820-qcom_ipq_cmnpll-v2-0-b000dd335280@quicinc.com>
 <20240820-qcom_ipq_cmnpll-v2-1-b000dd335280@quicinc.com>
 <krbpzjccn6xvnpfsa7eeeowmtjuuw4yp72qqqbeq2icxrqvdo4@x6pawrcctyd3>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <krbpzjccn6xvnpfsa7eeeowmtjuuw4yp72qqqbeq2icxrqvdo4@x6pawrcctyd3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2iMXRdIuxfm8eaKS-xL521JlwKOQsPqB
X-Proofpoint-GUID: 2iMXRdIuxfm8eaKS-xL521JlwKOQsPqB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_11,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408210118



On 8/21/2024 4:33 PM, Krzysztof Kozlowski wrote:
> On Tue, Aug 20, 2024 at 10:02:42PM +0800, Luo Jie wrote:
>> The CMN PLL controller provides clocks to networking hardware blocks
>> on Qualcomm IPQ9574 SoC. It receives input clock from the on-chip Wi-Fi,
>> and produces output clocks at fixed rates. These output rates are
>> predetermined, and are unrelated to the input clock rate. The output
>> clocks are supplied to the Ethernet hardware such as PPE (packet
>> process engine) and the externally connected switch or PHY device.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 70 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 15 +++++
>>   2 files changed, 85 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> new file mode 100644
>> index 000000000000..7ad04b58a698
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>> @@ -0,0 +1,70 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm CMN PLL Clock Controller on IPQ SoC
>> +
>> +maintainers:
>> +  - Bjorn Andersson <andersson@kernel.org>
>> +  - Luo Jie <quic_luoj@quicinc.com>
>> +
>> +description:
>> +  The CMN PLL clock controller expects a reference input clock.
> 
> You did not explain what is CMN. Is this some sort of acronym?

CMN is short form for 'common'. Since it is referred to as 'CMN'
PLL in the hardware programming guides, we wanted the driver name
to include it as well. The description can be updated as below to
clarify the name and purpose of this hardware block. Hope this is
fine.

"The CMN PLL clock controller expects a reference input clock
from the on-board Wi-Fi, and supplies a number of fixed rate
output clocks to the Ethernet devices including PPE (packet
process engine) and the connected switch or PHY device. The
CMN (or 'common') PLL's only function is to enable clocks to
Ethernet hardware used with the IPQ SoC and does not include
any other function."

> 
> Best regards,
> Krzysztof
> 
> 


