Return-Path: <linux-arm-msm+bounces-19466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 375168BF5EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 08:12:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B71521F2301A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 06:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EB517BD5;
	Wed,  8 May 2024 06:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WSQAdX9K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEFF14273;
	Wed,  8 May 2024 06:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715148744; cv=none; b=drUk8SKwYCrkA+CXMrsIpnEuuO30g8PNlkTKnwLIpvhCRsuzRtQt5pTxsOv20i8wgDxU4oza04km0mFQ8vJVtUUxZJA6datqHWpUjNocGqwvmWyR5fWULxbbBGKISW6eNU/pdMwERZh4cLYIfWRaH3ryPyHh77jo2JfwEpPQomM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715148744; c=relaxed/simple;
	bh=5aMkkZ1B2+lfOCM2OjFOWEIGfwhGrWsXoOBRRLIJwQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Qih4QtPS1WJaIGk1vVe3/eu4wxpaTHdUjBzeFQporGA15jJmJru538mLJqWpkSZ1X0JQlNg16a8pNQj7BWvRzKnmRC/k1nF0K7kh07Qx+lSdze6J37Fcd4oxyCbIJWLz4pkg6TsgaUZNX6QVP1lOlMpvzmJG2KaQB+Og9QNXjBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WSQAdX9K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4483Z68M006373;
	Wed, 8 May 2024 06:12:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=jb3/XATjXWxDN3NF6CVRPJgaS0+eF5CX+YjGKAaSIGI=; b=WS
	QAdX9K08T1DFrvyw4Ujv7Vcx2/loF7NvShax+rKBPp3PivgSZ0XEDFsNxynNXnuX
	IpzS6qOOKQLnV44vBywt0X3o2xF4tiQBE8PcOkq63lhCrkTXzYjHT48/y3iGGczL
	EKJkhoQiz9rtzZzuMLJuMQuOdFqTC4HRIcie1zFQuB/ayljbjufch/KoPJNPCPlW
	9VSX3t07KhwKCY0YnNnAqyTA+cRy1p2hKddl6gTGTiU8VDT1DcoTO71KdRIJMTI9
	1jTMWsvBafGIEAwd3IKB0Gc0Un90tX3bQkpEo32gmQuRhwbEmqWTdvxg/AbBwzjW
	KYcCsBIjWFVNhfLV/yFg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyste123w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 06:12:17 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4486CFBF026040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 06:12:15 GMT
Received: from [10.214.67.128] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 23:12:10 -0700
Message-ID: <737b595c-3433-8ad8-ca89-7af77098f589@quicinc.com>
Date: Wed, 8 May 2024 11:41:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/3] Add devicetree support of USB for QDU/QRU1000
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krishna Kurapati PSSNV
	<quic_kriskura@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>, <quic_wcheng@quicinc.com>,
        <quic_ppratap@quicinc.com>, Jack Pham
	<quic_jackp@quicinc.com>
References: <20240502090326.21489-1-quic_kbajaj@quicinc.com>
 <CAA8EJprPLqj7GQM0vmN25U2+3kDow=NH8=-VC2N-0p92Ub3iCA@mail.gmail.com>
 <5134c012-60b1-4c07-9e1f-c48c3d88d404@quicinc.com>
 <CAA8EJppK7fMmX_cePhaK4Xy-+gfZfYZSWJDbEnVvq_60B32Rig@mail.gmail.com>
Content-Language: en-US
From: Komal Bajaj <quic_kbajaj@quicinc.com>
In-Reply-To: <CAA8EJppK7fMmX_cePhaK4Xy-+gfZfYZSWJDbEnVvq_60B32Rig@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AMUnemoQiKrTYsjEuQIN5E8RHpr_w4cJ
X-Proofpoint-ORIG-GUID: AMUnemoQiKrTYsjEuQIN5E8RHpr_w4cJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_02,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0 clxscore=1015
 mlxlogscore=835 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405080043



On 5/2/2024 5:14 PM, Dmitry Baryshkov wrote:
> On Thu, 2 May 2024 at 12:48, Krishna Kurapati PSSNV
> <quic_kriskura@quicinc.com> wrote:
>>
>>
>>
>> On 5/2/2024 2:39 PM, Dmitry Baryshkov wrote:
>>> On Thu, 2 May 2024 at 12:04, Komal Bajaj <quic_kbajaj@quicinc.com> wrote:
>>>>
>>>> This series adds devicetree nodes to support interconnects and usb for qdu/qru1000.
>>>> This is based on previously sent driver series[1].
>>>>
>>>> ------
>>>> Changes in v3:
>>>> * As per comments on upstream[2], to get role-switch working on QDU/QRU1000, it was recommended to
>>>>     use the actual TI switch driver. Since driver doesn't have the functionality to provide role-switch
>>>>     based on gpio, thus reverting back USB dr_mode to peripheral and removed the remote end-point nodes
>>>>     and usb-conn-gpio based role switch functionality.
>>>
>>> This is not correct. The recommendation was to describe hardware properly.
>>> Which means adding schema description, adding  ti,your-switch
>>> compatible to the usb-conn-gpio.c driver, etc.
>>>
>>
>> Hi Dmitry,
>>
>>    Sorry for the confusion. In the comments [1],
>>
>> "So the compatible string should be "ti,hd3ss3220". Which is fine to be
>> used in the platform driver. Just describe the differences in the
>> schema."
>>
>> The compatible "ti,hd3ss3220" is already associated with a TI switch
>> driver [2]. But it works based on I2C. So we assumed you wanted us to
>> make changes to [2] by adding GPIO functionality (which usb-conn-gpio
>> exactly does), since the compatible you suggested matched with the TI
>> driver.
> 
> First of all, please don't make assumptions. It's better to ask rather
> than making assumptions which turn up to be incorrect.
> 
> Compatibles describe hardware. DT describes hardware. There are no
> drivers in question (yet).
> You have TI switch on your board, so you have to use "ti,hd3ss3220" to
> describe it.
> 
> Existing schema describes it as an I2C device. You have to extend the
> schema to allow non-i2c attachment. Describe GPIOs, make reg optional.
> Make this description purely from the datasheet and usb-c-connector
> point of view.
> 
>> If it was to add compatible in usb-conn-gpio, then we can support OTG
>> functionality with no schema changes I believe, but the compatible
>> string might need a different name to avoid clashing with the name in [2].
> 
> And this is the second, largely independent question. The
> usb-conn-gpio driver is a platform driver.The existing hd3ss3220.c
> driver is an I2C one. There is no clash between them.
> 
> Note, unlike plain gpio-b-connector, the switch supports more pins and
> actually provides USB-C information to the host even when used in the
> dumb mode. Thus it might be better to add a separate driver that
> registers typec port and reports USB-C events.

Hi Dmitry,

Regarding the comment:
"Note, unlike plain gpio-b-connector, the switch supports more pins and 
actually provides USB-C information to the host even when used in the 
dumb mode. Thus it might be better to add a separate driver that 
registers typec port and reports USB-C events."

We are also aligned with your statement of expressing the hardware 
correctly. Since this needs quite a bit of effort to write a new driver 
for TI switch or modifying existing TI driver to add GPIO support, can't 
we go ahead with peripheral support only since the driver support is 
absent currently.

We will plan to submit the patches in upcoming days for this. Since we 
usually enable USB in peripheral mode so that USB debug (adb) will work, 
I am thinking we can merge this and take up the OTG/host mode 
separately. Please let me know your feedback on this.

Thanks
Komal

> 
>>
>> [1]:
>> https://lore.kernel.org/all/CAA8EJppNZrLzT=vGS0NXnKJT_wL+bMB9jFhJ9K7b7FPgFQbcig@mail.gmail.com/
>>
>> [2]:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/usb/typec/hd3ss3220.c?h=v6.9-rc2
>>
>> Regards,
>> Krishna,
>>
>>>> * Link to v2: https://lore.kernel.org/linux-arm-msm/20240319091020.15137-1-quic_kbajaj@quicinc.com/
>>>>
>>>> Changes in v2:
>>>> * Changes qmpphy node name
>>>> * Changes dr_mode to otg and added USB-B port USB role switch
>>>> * Dropped maximum-speed property from usb dwc3 node
>>>> * Link to v1: https://lore.kernel.org/linux-arm-msm/20240311120859.18489-1-quic_kbajaj@quicinc.com/
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-msm/20240502082017.13777-1-quic_kbajaj@quicinc.com/
>>>> [2] https://lore.kernel.org/all/CAA8EJppNZrLzT=vGS0NXnKJT_wL+bMB9jFhJ9K7b7FPgFQbcig@mail.gmail.com/
>>>> ------
>>>>
>>>> Komal Bajaj (3):
>>>>     arm64: dts: qcom: qdu1000: Add USB3 and PHY support
>>>>     arm64: dts: qcom: qdu1000-idp: enable USB nodes
>>>>     arm64: dts: qcom: qru1000-idp: enable USB nodes
>>>>
>>>>    arch/arm64/boot/dts/qcom/qdu1000-idp.dts |  23 +++++
>>>>    arch/arm64/boot/dts/qcom/qdu1000.dtsi    | 120 +++++++++++++++++++++++
>>>>    arch/arm64/boot/dts/qcom/qru1000-idp.dts |  23 +++++
>>>>    3 files changed, 166 insertions(+)
>>>>
>>>> --
>>>> 2.42.0
>>>>
>>>>
>>>
>>>
> 
> 
> 

