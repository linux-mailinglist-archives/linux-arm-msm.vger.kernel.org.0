Return-Path: <linux-arm-msm+bounces-68574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F16AB215FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 21:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 404651A23641
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 19:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5772D9ECC;
	Mon, 11 Aug 2025 19:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="H1soPVDT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB262D979D;
	Mon, 11 Aug 2025 19:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754942131; cv=none; b=F0rrl5S/9J1BcEtNDo5DvtgLaKwPzv9QpYa7lIBxsarG6LXmWEL6TObZBL62xjMy1D1bt5rp2/n/6k/rgDSZMKroyEc2N3SU/40yq5Tdp/5gTnNXhufU88S1V+z5QOPpZPgrCtcqZLyKPPt0QqJ8xK57eBlrcyAa9WJMA5u6QBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754942131; c=relaxed/simple;
	bh=TPwzfAc9ZFSu8fkTOyKHxECFiETj6VfInU0GO0FKfRw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=P6ugs7wnC0cL4Sk78Y3kj4QdBc5ZpTAu30MjZ4i/PLEm6v3fMJvfLS48mmyhE2diYzpJ8qB7J4Al3/EIvJe8eILmiMOCoFHT9hgiqink6ccpwxeprepzTJT7COOS/u+094InWbOyqBdNXoSxygq+Egw1eD9uW/rglVaxvh+6k9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=H1soPVDT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BGK2Rp005401;
	Mon, 11 Aug 2025 19:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfHUeSvunMVZXW/0xTJlqcO2cDUnQhLeJQeZc2lgGmw=; b=H1soPVDTG5ZfLDqw
	4LDHTwnbU8IijG1w1qgMeIij9ZsFxOPXlkr13E0UF/uGw//5r0CZrIA4DwMv1xqV
	1ii9cTnzWwj++y/k3t+YEMeNx/89sbSrxY7HHc37DExobadRvRrNAyawyebE0Dyl
	tR6FW4JGXwsiAcl8HTZ7bqm4MCx698PKouSdAz1t2n5Vc+gT+4FeVbHvOwJYU7+x
	yz8mAQOSWFEwS7MLy/dY1ayxLlmmhXxwFVTHqbS638YCR7xBeviWegEf5JVdce0y
	CZBrFSfY9AatFO/R8OYWRH8R08W30fmDb9dWLI1N5whs/j9H9bn5LqAzJJUbrn44
	pWdEMw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx3vsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 19:55:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57BJtD4p018880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Aug 2025 19:55:13 GMT
Received: from [10.216.45.49] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 11 Aug
 2025 12:55:06 -0700
Message-ID: <89ab7e51-f82e-465a-aa22-1ccb8e7a0f6d@quicinc.com>
Date: Tue, 12 Aug 2025 01:25:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Nitin Rawat <quic_nitirawa@quicinc.com>
Subject: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for UFS
 PHY and PLL supplies
To: Manivannan Sadhasivam <mani@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, <vkoul@kernel.org>,
        <kishon@kernel.org>, <conor+dt@kernel.org>, <bvanassche@acm.org>,
        <andersson@kernel.org>, <neil.armstrong@linaro.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <konradybcio@kernel.org>,
        <krzk+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-3-quic_nitirawa@quicinc.com>
 <20250808-calm-boa-of-swiftness-a4a7ce@kuoka>
 <9af71063-0629-4ccc-bc76-3fb588677bf4@oss.qualcomm.com>
 <292907f3-25d6-40d9-be6e-b6b83e646d73@kernel.org>
 <5e32be05-0dbd-4d6f-879d-8ce97fb430ba@quicinc.com>
 <rh3qxu2rijpjswfash3rpmmh6sw47l3b6j5p5upti6zffknasz@cywwm3fypghd>
Content-Language: en-US
In-Reply-To: <rh3qxu2rijpjswfash3rpmmh6sw47l3b6j5p5upti6zffknasz@cywwm3fypghd>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX29LYPgOK69j7
 WPYRn8TWyz/QBNXJPO8t6uM/RXeRr22MqKeb019j7nXaACfNfubC3dg0wWwrim54I2XyHO5ExnH
 U+cr7ZdJf0byL13IJHBZ6gB/Vy56gcgk5+QKDpHQO3lxMbGqd9ynp0iHDDN7WDUtAew9F0Hr2E/
 APVvkJJpdTqK1GwORtZOP7XJR5GkLqUmi26ph2eT8mKzG4B29+85YDaMqMdbNkZ0WlOThPBA1Tq
 mkNgAZyovZ4Z5TbkAul21FxjMpbygzIj9F3DC8qP0HeoMXtlTiMiZnJ6Kced/boF9IFeWH8E+cl
 xNB/n17Qtiu0IVfG4gMM6ZbD4Nxw6douJ6tB5rR/AsJkc2q9e/fnfLuV12mSMYSFB5jQk4VBcVe
 3Z/fEKb+
X-Proofpoint-GUID: rKsQekp9N15GyyvY17td_m8XJLtGO9gB
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689a4aa5 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10
 a=ulfgkXGRXDS8zX5WHX8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: rKsQekp9N15GyyvY17td_m8XJLtGO9gB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057



On 8/9/2025 4:37 PM, Manivannan Sadhasivam wrote:
> On Fri, Aug 08, 2025 at 08:49:45PM GMT, Nitin Rawat wrote:
>>
>>
>> On 8/8/2025 3:09 PM, Krzysztof Kozlowski wrote:
>>> On 08/08/2025 10:58, Konrad Dybcio wrote:
>>>> On 8/8/25 9:29 AM, Krzysztof Kozlowski wrote:
>>>>> On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
>>>>>> Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
>>>>>> the UFS PHY node in the device tree.
>>>>>>
>>>>>> These properties define the maximum current (in microamps) expected
>>>>>> from the PHY and PLL regulators. This allows the PHY driver to
>>>>>> configure regulator load accurately and ensure proper regulator
>>>>>> mode based on load requirements.
>>>>>
>>>>> That's not the property of phy, but regulator.
>>>>>
>>>>> Also reasoning is here incomplete - you just post downstream code. :/
>>>>
>>>> The reason for this change is good, but perhaps not explained clearly
>>>>
>>>> All of these values refer to the maximum current draw that needs to be
>>>> allocated on a shared voltage supply for this peripheral (because the
>>>
>>>
>>> It sounds very different than how much it can be drawn. How much can be
>>> drawn is the property of the regulator. The regulator knows how much
>>> current it can support.
>>
>> Consumers are aware of their dynamic load requirements, which can vary at
>> runtime—this awareness is not reciprocal. The power grid is designed based
>> on the collective load requirements of all clients sharing the same power
>> rail.
>>
>> Since regulators can operate in multiple modes for power optimization, each
>> consumer is expected to vote for its runtime power needs. These votes help
>> the regulator framework maintain the regulator in the appropriate mode,
>> ensuring stable and efficient operation across all clients.
>>
>>
>> Stability issues can arise if each consumer does not vote for its own load
>> requirement.
>> For example, consider a scenario where a single regulator is shared by two
>> consumers.
>>
>> If the first client requests low-power mode by voting for zero or a minimal
>> load to regulator framework during its driver's LPM sequence, and the second
>> client (e.g., UFS PHY) has not voted for its own load requirement through
>> the regulator framework, the regulator may transition to low-power mode.
>> This can lead to issues for the second client, which expects a higher power
>> state to operate correctly.
>>
> 
> I think we all agree on consumers setting the load for shared regulators, but
> the naming and description of the DT property is what causing confusion here.
> There is no way the consumers can set the *max* current draw for a shared
> regulator. They can only request load as per their requirement. But the max
> current draw is a regulator constraint.

To avoid confusion with regulator-level constraints, I'm open to 
renaming the property vdda-phy-max-microamp to something more 
descriptive, such as vdda-phy-client-peak-load-microamp or 
vdda-phy-peak-load-microamp. Along with updating the description, this 
would better reflect the property's actual intent: to specify the 
maximum current a client may draw during peak operation, rather than 
implying it defines the regulator’s maximum capability.


Having said that, I had a follow-up discussion with the PHY designer to 
confirm whether this value could vary at the board level. Based on their 
response, it's a fixed value for the SoC and does not change across 
different boards(atleast for now). Therefore, I can remove from device 
tree and replaced with hardcoded, per-compatible data in the driver.

> 
>>
>>>
>>>
>>>> supply's capabilities change depending on the maximum potential load
>>>> at any given time, which the regulator driver must be aware of)
>>>>
>>>> This is a property of a regulator *consumer*, i.e. if we had a chain
>>>> of LEDs hanging off of this supply, we'd need to specify NUM_LEDS *
>>>> MAX_CURR under the "led chain" device, to make sure that if the
>>>> aggregated current requirements go over a certain threshold (which is
>>>> unknown to Linux and hidden in RPMh fw), the regulator can be
>>>> reconfigured to allow for a higher current draw (likely at some
>>>> downgrade to efficiency)
>>>
>>>
>>> The problem is that rationale is downstream. Instead I want to see some
>>> reason: e.g. datasheets, spec, type of UFS device (that was the argument
>>> in the driver patch discussion).
>>
>>
>> The PHY load requirements for consumers such as UFS, USB, PCIe are defined
>> by Qualcomm’s PHY IP and are well-documented in Qualcomm’s datasheets and
>> power grid documentation. These values can depending on the process or
>> technology node, board design, and even the chip foundry used.
>>
>> As a result, the load values can differ across SoCs or may be even
>> board(unlikely though) due to variations in any of these parameters.
>>
> 
> Okay. This goes into the commit message and possibly some part of it to property
> description also.




> 
> - Mani
> 


