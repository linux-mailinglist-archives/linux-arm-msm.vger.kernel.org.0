Return-Path: <linux-arm-msm+bounces-29282-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A23B695B7BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 15:58:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 23FF91F25B5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 13:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2CA01CB31F;
	Thu, 22 Aug 2024 13:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GkyQov+W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BCF1CB336;
	Thu, 22 Aug 2024 13:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724334797; cv=none; b=PLnQ62Kz4cLXSxSDbOoD6DFL5OGm2GuohLzO/jL2y6PdGSFkxbUo24EfYsU3h6lBwkMMS5aHT4GBL5PhDxTNPX/OdHe+AseYOL1Sl2JZihvgxSySvQcaL/aOSstpryEuabHDRR+XcMlicEu1oAg5Mok82NQte6IHTBQkB2elVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724334797; c=relaxed/simple;
	bh=b+4zkE+oHIiJn3+Zf87WDYtnXdB8KgyWtfesZC6Zh7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T/yIuiUigKyeyk+4RH+dHgZH1p+iOu8gcp20AOAC7kFUlO/bQpQz+JZ5nz9PgZa9QXCW4G9//xoxYfTz1E+l0cOAbyG6G/+N/GOVLR2zZhNcd8VMWHvbcgK4gpc7Ehvv4f2hp9Ztte+ikJuz2Zq2HEQiG0AZLk8jqbD0uifa96E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GkyQov+W; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47MA6PAj006591;
	Thu, 22 Aug 2024 13:53:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MBthUzIbc6aeQsygWdUFG+pmnVUpFeCt8aopJtX3ZBk=; b=GkyQov+W0cDGgzuk
	FAjG5k7f1tll+mHu7OBNyu2oAoT7n1itdfWFKP52CNz1SUn7UQpzO04ETr/Tt3A2
	eIHydPeciTZwFqCFNH+6EX8WLZsBu6S9Y7o6udSI36EHVJs8n8YuJjRz418Pa+0B
	9wfKByrs7tFSZVE7sgHCYf3EJ0DO6OxisePULKH5RCLMw/dvCRoeWNJACrFO6g9P
	cEXrTAuxqxITgWN4Bi5BpzYZBHChTHl7I0obHLhiROiNnCtPa543Zk5URXLsGSw7
	C03Cvwd63QEk31xcAchGbZk9KtDXV0c6vl8nj7yClzeSg/Pz3Sppy2WjW7M7bLBl
	gYS/QQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 415bkwcq83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 13:53:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47MDr42V025804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 13:53:04 GMT
Received: from [10.253.73.208] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 22 Aug
 2024 06:52:52 -0700
Message-ID: <285be0e5-0060-403c-a927-d69e31b163cd@quicinc.com>
Date: Thu, 22 Aug 2024 21:52:47 +0800
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
 <51198961-2e09-4d0e-8bf3-907c81597724@quicinc.com>
 <be2eae05-6deb-49fb-94ce-cb5e3a5bd1ba@kernel.org>
Content-Language: en-US
From: Jie Luo <quic_luoj@quicinc.com>
In-Reply-To: <be2eae05-6deb-49fb-94ce-cb5e3a5bd1ba@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: eYOahMDNrDzgVcazXItIgIP6muxkEHSy
X-Proofpoint-GUID: eYOahMDNrDzgVcazXItIgIP6muxkEHSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_07,2024-08-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408220102



On 8/22/2024 2:29 PM, Krzysztof Kozlowski wrote:
> On 21/08/2024 18:08, Jie Luo wrote:
>>
>>
>> On 8/21/2024 4:33 PM, Krzysztof Kozlowski wrote:
>>> On Tue, Aug 20, 2024 at 10:02:42PM +0800, Luo Jie wrote:
>>>> The CMN PLL controller provides clocks to networking hardware blocks
>>>> on Qualcomm IPQ9574 SoC. It receives input clock from the on-chip Wi-Fi,
>>>> and produces output clocks at fixed rates. These output rates are
>>>> predetermined, and are unrelated to the input clock rate. The output
>>>> clocks are supplied to the Ethernet hardware such as PPE (packet
>>>> process engine) and the externally connected switch or PHY device.
>>>>
>>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>>> ---
>>>>    .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 70 ++++++++++++++++++++++
>>>>    include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 15 +++++
>>>>    2 files changed, 85 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>>>> new file mode 100644
>>>> index 000000000000..7ad04b58a698
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
>>>> @@ -0,0 +1,70 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Qualcomm CMN PLL Clock Controller on IPQ SoC
>>>> +
>>>> +maintainers:
>>>> +  - Bjorn Andersson <andersson@kernel.org>
>>>> +  - Luo Jie <quic_luoj@quicinc.com>
>>>> +
>>>> +description:
>>>> +  The CMN PLL clock controller expects a reference input clock.
>>>
>>> You did not explain what is CMN. Is this some sort of acronym?
>>
>> CMN is short form for 'common'. Since it is referred to as 'CMN'
>> PLL in the hardware programming guides, we wanted the driver name
>> to include it as well. The description can be updated as below to
>> clarify the name and purpose of this hardware block. Hope this is
>> fine.
>>
>> "The CMN PLL clock controller expects a reference input clock
>> from the on-board Wi-Fi, and supplies a number of fixed rate
>> output clocks to the Ethernet devices including PPE (packet
>> process engine) and the connected switch or PHY device. The
>> CMN (or 'common') PLL's only function is to enable clocks to
>> Ethernet hardware used with the IPQ SoC and does not include
>> any other function."
> 
> So the block is called "CMN" in hardware programming guide, without any
> explanation of the acronym?

Yes, I double checked again with our hardware team and the
documentation. CMN is just a short form of "common" with no additional
information in the guide.

Thanks for review.

> 
> Best regards,
> Krzysztof
> 


