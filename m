Return-Path: <linux-arm-msm+bounces-41662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E2E9EE03D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:29:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4AB6B1883F83
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 07:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0477320ADFD;
	Thu, 12 Dec 2024 07:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="J4NN+21D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1669F45027;
	Thu, 12 Dec 2024 07:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733988576; cv=none; b=ApWp8sAEkXGqp0BJz9SUN5vLSeamZR6m9DKmkxqLS01NnjOvFB2bHWj1Q4Ij97Jfo+u/ECwDJvaSMzg4bOemovLRT05nPlT0Po/syCOJfpqeEvboPUTRMyXoI+Ts59NPxe1zDkLkoZGcZz6wsOa0eOb/fGMAfxKc7bSWCLpo6IA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733988576; c=relaxed/simple;
	bh=5dLiOhUKaCVKsArGKXDPWzoqvg9T37jPkUsIDJWiRg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qD7GejuokevEGHjZT1KnjZ8tl/LwCzi5IQH3LPdDY+dbfH+gJuHYkko3QsHRWkynqEs0aaGGBvqfTQ4PRhdUQxav/c+uhGjYim9fExK2phut+1nWEzEkJ1Ebl4s84Ye5w7Bv5lCepF6Td0WFyynqNhE+RpbicoJ3K4kKqkzCRAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=J4NN+21D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC2s8jn001463;
	Thu, 12 Dec 2024 07:29:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OybyDqhRyS7zewunA4/2FtQ2IjJn/DxV8X7ZYsb+0kA=; b=J4NN+21DBOJ/yViK
	lCihi9bLjtZXqaPknnlYkZODfkKmxT5YOpkAYxcrISvpmIPTBHZRBRj3rM/8IGZN
	KQ3wlMbmecoNM0E4eGOxafUY5BsnQMb0C+LEl9JuUF3j9hpqzqt62RM+FYACp/7A
	rWT5bHdY4zXOHVlu0LoCEyfber9WEqLhqPz576QjqOg8lTUx31CamM5EIi1VDKmR
	zBoje+ubA2ckM1+0uZ0jpWP+uopRZKzMBdma/sfRi6cOxUJ5d4O1Z5JJePEiXZ7O
	fDk2xIcKMpkenTNTU2rWCiBbhcbUUdaJfSmI6KQnI9YyVmiy25qjqoF/W/+7Vqi7
	lPMKSg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes0js7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:29:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BC7TPrt001979
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 07:29:25 GMT
Received: from [10.253.8.225] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 11 Dec
 2024 23:29:19 -0800
Message-ID: <16d109d8-d1be-4ecb-ba25-8e21e9d48dad@quicinc.com>
Date: Thu, 12 Dec 2024 15:29:16 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,qmp-pcie: add optional current
 load properties
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        "Krzysztof
 Kozlowski" <krzk@kernel.org>
CC: <vkoul@kernel.org>, <kishon@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <abel.vesa@linaro.org>, <neil.armstrong@linaro.org>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <quic_qianyu@quicinc.com>
References: <20241204105249.3544114-1-quic_ziyuzhan@quicinc.com>
 <20241204105249.3544114-2-quic_ziyuzhan@quicinc.com>
 <qvjtwilukxbeaxnbyzfkdsfkktm6p4yv3sgx3rbugpb6qkcbjy@rohvixslizhh>
 <20241211062053.vxdpovlmetvyx3za@thinkpad>
 <33697bd9-02f4-4a9a-b8c0-4930d7fdaee2@kernel.org>
 <20241211082404.p7fbmhooikmipxvm@thinkpad>
 <3c7ddb08-38db-44b3-a7a7-ec7b270a408f@kernel.org>
 <20241211115034.4hrpmninbx5uryev@thinkpad>
From: Ziyue Zhang <quic_ziyuzhan@quicinc.com>
In-Reply-To: <20241211115034.4hrpmninbx5uryev@thinkpad>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: WpBSgAiqzoP_c1xrOTCrxXhE9a0ibP_a
X-Proofpoint-ORIG-GUID: WpBSgAiqzoP_c1xrOTCrxXhE9a0ibP_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120050


在 12/11/2024 7:50 PM, Manivannan Sadhasivam 写道:
> On Wed, Dec 11, 2024 at 10:52:11AM +0100, Krzysztof Kozlowski wrote:
>> On 11/12/2024 09:24, Manivannan Sadhasivam wrote:
>>> On Wed, Dec 11, 2024 at 09:09:18AM +0100, Krzysztof Kozlowski wrote:
>>>> On 11/12/2024 07:20, Manivannan Sadhasivam wrote:
>>>>> On Thu, Dec 05, 2024 at 11:23:11AM +0100, Krzysztof Kozlowski wrote:
>>>>>> On Wed, Dec 04, 2024 at 06:52:47PM +0800, Ziyue Zhang wrote:
>>>>>>> On some platforms, the power supply for PCIe PHY is not able to provide
>>>>>>> enough current when it works in LPM mode. Hence, PCIe PHY driver needs to
>>>>>>> set current load to vote the regulator to HPM mode.
>>>>>>>
>>>>>>> Document the current load as properties for each power supply PCIe PHY
>>>>>>> required, namely vdda-phy-max-microamp, vdda-pll-max-microamp and
>>>>>>> vdda-qref-max-microamp, respectively.PCIe PHY driver should parse them to
>>>>>>> set appropriate current load during PHY power on.
>>>>>>>
>>>>>>> This three properties are optional and not mandatory for those platforms
>>>>>>> that PCIe PHY can still work with power supply.
>>>>>>
>>>>>> Uh uh, so the downstream comes finally!
>>>>>>
>>>>>> No sorry guys, use existing regulator bindings for this.
>>>>>>
>>>>> Maybe they got inspired by upstream UFS bindings?
>>>>> Documentation/devicetree/bindings/ufs/ufs-common.yaml:
>>>>>
>>>>> vcc-max-microamp
>>>>> vccq-max-microamp
>>>>> vccq2-max-microamp
>>>> And it is already an ABI, so we cannot do anything about it.
>>>>
>>>>> Regulator binding only describes the min/max load for the regulators and not
>>>> No, it exactly describes min/max consumers can use. Let's quote:
>>>> "largest current consumers may set"
>>>> It is all about consumers.
>>>>
>>>>> consumers. What if the consumers need to set variable load per platform? Should
>>>> Then each platform uses regulator API or regulator bindings to set it? I
>>>> don't see the problem here.
>>>>
>>>>> they hardcode the load in driver? (even so, the load should not vary for each
>>>>> board).
>>>> The load must vary per board, because regulators vary per board. Of
>>>> course in practice most designs could be the same, but regulators and
>>>> their limits are always properties of the board, not the SoC.
>>>>
>>> How the consumer drivers are supposed to know the optimum load?
>>>
>>> I don't see how the consumer drivers can set the load without hardcoding the
>>> values. And I could see from UFS properties that each board has different
>>> values.
>>
>> Drivers do not need to know, it's not the driver's responsibility. If
> What? I think there is a misunderstanding here. The intention of these proposed
> properties is to allow the PHY driver to set the required load of the regulator
> using regulator_set_load() API. As per the API description:
>
> 'Consumer devices notify their supply regulator of the maximum power they will
> require (can be taken from device datasheet in the power consumption tables)
> when they change operational status and hence power state'.
>
> IIUC, your concern is that the devicetree shouldn't specify the load for each
> consumer but just the min/max load of the regulator. And the consumer driver
> should figure out the load and set it accordingly.
>
> Correct me if I'm wrong.
>
> In that case, I was wondering if the load set by the driver is going to vary
> between platforms (boards) or not (question to Ziyue Zhang). If it varies
> between SoC, then we can hardcode the load in driver based on compatible.

Hi Mani, Krzystof

Now we set  the current to 165mA which is the max power supply the regulator
can provide, so this is platform(boards) related. But we think PCIe PHY needs
to set the current value we need, which is soc related.

BRs
Ziyue

>> If
>> these are constraints per board, then regulator properties apply and
>> there is no difference between this "vdd-max-microamp = 10" and
>> "regulator-max-microamp".
>>
> There is a difference. Regulator properties are just threshold. So unless the
> consumer sets the load, they won't take effect. I think you got confused by the
> 'max' wording in the proposed properties?
>
>> If this varies runtime, then your property is already not suitable and
>> very limited and you should use OPP table.
>>
> The consumer driver may request different loads based on their operational
> state.
>
> - Mani
>

