Return-Path: <linux-arm-msm+bounces-37310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5D9C14A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 04:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D49151F22884
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 03:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECD01A28D;
	Fri,  8 Nov 2024 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MYkJiQ3H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6AC15C0;
	Fri,  8 Nov 2024 03:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731036670; cv=none; b=Tooa+uLksS/muQCTr5Vp3V1gtt8akPNrz7zVklHiMz1Ysfbja4DHgau854F8Hd+FT/fmleMajKPA3RhHwKgFxbo2yeKqKcGuLwPqJxZ/UKcLlXJaMlzr1g9rmpbEZMsFL3kIGs79bXf9kqxk38r+KBWB/xknG0ZwdjO6im2Op4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731036670; c=relaxed/simple;
	bh=JkQh8XYwnlilA6SEE/9kW0praINZcYq+IeG3F/0i+d0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=M4DlAOqDJwAN2FoMk3mSdHvxwjSekzptUQKMoXJfQqocbCthIVeGj9gB775AdvAMD4VzKZFWyMW1OcSHMqteiD30whc4Tg8ZfBGEpQQXR5Wux9PLeUSj4aXztfZdWxUMVW75a3QdDWiKgoDMIzk2fOIx9jO9VihYQ3GRuIusDa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MYkJiQ3H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MapVN028440;
	Fri, 8 Nov 2024 03:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ORIrw/wQ3+MD9XwhIuNt1gF+0lFMQSagBq0smIgoJiA=; b=MYkJiQ3HB21kQX8k
	CFp5yLDPseUsnE7PVWC02c7z6OpGCr7pW5IqJ3gwTqXsP2JqVJ5o4REvYnlSzJsQ
	y4wgHW+GqNMYXvKrckrOfeRWQVTg1F54ZtjsXKnT3efSXKZS6TYGBNbiw+7wFoDB
	CF2BoidlhUY0CPdfL1O25J8Ikds0sDqJ+etMaNlYelpZ87S9Us+pmVroxxnK2uuD
	Tf0sQThftr5LYC0os2A6Zdfl4DTY2VPEnesNrl0aC9K0rytE9emV3IVaJaxmwjVL
	MKLmwiXiDk0HvbsiU2n4Qoscph1YEDkVmVi9Pwtx0GK/AIO1ybNrsqgi6x4tnudx
	vBwnwQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gd8hpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 03:31:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A83UxvC032243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 03:30:59 GMT
Received: from [10.216.46.51] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 7 Nov 2024
 19:30:55 -0800
Message-ID: <f26bd7ac-5a01-4c9b-b2a0-aa9e65dff6e5@quicinc.com>
Date: Fri, 8 Nov 2024 09:00:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] RFC: arm64: dts: qcom: Disable USB U1/U2 entry for QC
 targets
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <quic_ppratap@quicinc.com>, <quic_jackp@quicinc.com>
References: <20241107073650.13473-1-quic_kriskura@quicinc.com>
 <trrbjd574futtatooisumtqp4idqerb5ji2g3nvdesiedlitdd@c6u7wuqhh4r3>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <trrbjd574futtatooisumtqp4idqerb5ji2g3nvdesiedlitdd@c6u7wuqhh4r3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _4vL-IUvzjBrenR3pNazxHrQ-uzI2Ld5
X-Proofpoint-ORIG-GUID: _4vL-IUvzjBrenR3pNazxHrQ-uzI2Ld5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=415 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411080029



On 11/7/2024 4:33 PM, Dmitry Baryshkov wrote:
> On Thu, Nov 07, 2024 at 01:06:50PM +0530, Krishna Kurapati wrote:
>> Enabling U1 and U2 power-saving states can lead to stability and
>> performance issues, particularly for latency-sensitive or high-
>> throughput applications. These low-power link states are intended
>> to reduce power consumption by allowing the device to enter partial
>> low-power modes during idle periods. However, they can sometimes
>> result in unexpected behavior. Over the years, some of the issues
>> seen are as follows:
>>
>> 1. In device mode of operation, when UVC is active, enabling U1/U2
>> is sometimes causing packets drops due to delay in entry/exit of
>> intermittent low power states. These packet drops are often reflected
>> as Missed Isochronous transfers as the controller was not able to
>> send the packet in that microframe interval and hence glitches are
>> seen on the final transmitted video output.
>>
>> 2. On QCS6490-Rb3Gen2 Vision kit, ADB connection is heavily unstable
>> when U1/U2 is enabled. Often when link enters U2, there is a re-
>> enumeration seen and device is unusable for many use cases.
>>
>> 3. On QCS8300/QCS9100, it is observed that when Link enters U2, when
>> the cable is disconnected and reconnected to host PC in HS, there
>> is no link status change interrupt seen and the plug-in in HS doesn't
>> show up a bus reset and enumeration failure happens.
>>
>> 4. On older targets like SM8150/SM8250/SM8350, there have been
>> throughput issues seen during tethering use cases.
>>
>> To avoid such issues, the USB team at Qualcomm added these quirks
>> to all targets in the past 4-5 years and extensive testing was done.
>> Although these are intermittent power states, disabling them didn't
>> cause any major increase in power numbers.
>>
>> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
>> ---
>> If this is fine, the patch would be made into a series, disabling
>> U1/U2 for all mobile and QCS targets.
>>
>>   arch/arm64/boot/dts/qcom/sm8150.dtsi | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8350.dtsi | 4 ++++
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 ++
> 
> Should the same set of quirks be applied to SAR2130P too?

Yes, these two quirks have been added to and tested on SAR2130 
downstream. I see that you have added them in your upstream DTSI file 
too. Thanks for that.

Regards,
Krishna,

