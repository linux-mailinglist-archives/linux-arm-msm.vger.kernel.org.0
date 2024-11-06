Return-Path: <linux-arm-msm+bounces-37099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8CE9BDE10
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 05:46:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6E0121C22C6F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 04:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 513B518FC9F;
	Wed,  6 Nov 2024 04:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="duPuEpOY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8642E13541B;
	Wed,  6 Nov 2024 04:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730868412; cv=none; b=bcnb2LDYCifYywsLJABd8sIr0ilgXy5IOa+wfBl0r6frVLNzolbG65+ypzWFEQlEsUYo0Tw6zF+yvkCvDrPrd1Cy2LQoOvWUaSd0yW+Z0TnD8RGfMmGcqW4K3B9sG8JCTCMHBmHy2DSOARoNMHmbB/fO3RgmEvzIQT5+shLH4uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730868412; c=relaxed/simple;
	bh=ClrK/IHwCExCxbijAAdGJnaDpWHbinT5bAVkRKyX6rA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=DQioQeclI1yMMuS76VEoxMSPTOM9wZUcaJUikxAU88SQGyrP5JgRBgzHos4jbvTsLnL+BnfzfNr8zkTk/0VAmYFxSy7Sj9jD7OFA1y8VT2O/rCe0avfWlbxaeAaFDC6q5Ud31H+yMlJJwHNbGYPIHDrYxppSmuG8BhgkIBEvEXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=duPuEpOY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5Jq8Oq015613;
	Wed, 6 Nov 2024 04:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5QdeTYD4pNvhDGcfJ/gRkXGjGR6HGKdRgv7UciU+g8k=; b=duPuEpOYrtzjot1g
	R/hCvJ2qzI6+fZ2y+Y1mGIXEMoAzth6gcGzlgBHkAKcIj3BOujNmWJfEmCi8JdaN
	ySesNZKWeolj/PF6GkjHbATiZTAe5ecfkKTekz6TfT7SiTavI0blH5nbiD74zC94
	hfhXGeze/q6rqwnhHl3AoKgFY424gEqvel38h1w3FumMwl0QRsVLjwEuaS8uyNZZ
	vDtVANTR8xV0J33lOgdg7oGZeOwBwJ/rwRAOtXMYobVelakAeK9d+vuKTFyvBzF3
	zXx1FT5gm1Xqc/OcNFa+qllGZL59ncOdVS3jND1v+1gJvOkrGHT/bsE5YbfKF4is
	Y6bptA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42q5n8mdj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 04:46:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A64khmp001208
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 04:46:43 GMT
Received: from [10.216.39.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 5 Nov 2024
 20:46:39 -0800
Message-ID: <f8697f7f-f6ac-4b6d-954b-a0777770dc8e@quicinc.com>
Date: Wed, 6 Nov 2024 10:16:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for WDK2023
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Merck Hung <merckhung@gmail.com>,
        Kalle Valo
	<kvalo@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, <xlazom00@gmail.com>
References: <20241101-jg-blackrock-for-upstream-v7-0-8295e9f545d9@oldschoolsolutions.biz>
 <20241101-jg-blackrock-for-upstream-v7-3-8295e9f545d9@oldschoolsolutions.biz>
 <945f3eae-0a68-4738-af07-74e228039508@quicinc.com>
 <dd5bad7b-d062-4028-b78a-3888dec4f934@oldschoolsolutions.biz>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <dd5bad7b-d062-4028-b78a-3888dec4f934@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OfyvmQc4XR8rzaxVHqiyNI8FJ281dVVy
X-Proofpoint-ORIG-GUID: OfyvmQc4XR8rzaxVHqiyNI8FJ281dVVy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060036



On 11/6/2024 12:57 AM, Jens Glathe wrote:
> On 04.11.24 05:31, Krishna Kurapati wrote:
>>
>>
>> On 11/1/2024 11:56 PM, Jens Glathe via B4 Relay wrote:
>>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>>
>>> Device tree for the Microsoft Windows Dev Kit 2023. This work
>>> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>>>
>>> Original work:
>>> https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
>>>
>>> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
>>> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
>>>
>>> Supported features:
>>> - USB type-c and type-a ports
>>> - minidp connector
>>> - built-in r8152 Ethernet adapter
>>> - PCIe devices
>>> - nvme
>>> - ath11k WiFi (WCN6855)
>>> - WCN6855 Bluetooth
>>> - A690 GPU
>>> - ADSP and CDSP
>>> - GPIO keys
>>> - Audio definition (works via USB)
>>>
>>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>> ---
>>
>> [...]
>>
>>> +&usb_2 {
>>> +    pinctrl-0 = <&usb2_en_state>;
>>> +    pinctrl-names = "default";
>>> +
>>
>> On the blackrock platform, for this controller, are there all 4 ports
>> given out for use or only one ?
>>
>> Because if all 4 are there, you might need to give all 4 pinctrls (one
>> for each TS3USB221A mux select) here for usb_2 node. If only one port
>> is given out for use on the platform, then only one phy (of the 4
>> activated below) needs to be marked as active.
>>
>> In my case, in [1] on the ADP platform, I marked them as always on for
>> all gpios on multiport controller since driver had no support added yet.
>>
>> [1]:
>> https://lore.kernel.org/all/20240707085624.3411961-1-quic_kriskura@quicinc.com/
>>
> Hi Krishna,
> 
> thank you for the hints. Unfortunately, I don't have any schematics for
> the box. But I tested out activation combinations for all the

My point is little different.
Third controller supports upto 4 physical ports. How many of them have 
been exposed on this WDK2023 ? Depending on that, the phys have to be 
enabled in DT.

> usb_2_hsphy and usb_2_qmpphy listed. All of these are also listed in the
> usb_2 node in sc8280xp.dtsi. And they all need to be activated to get
> the whole usb_2 node up. Leaving out one lets the whole node vanish.
> Maybe it is possible to define fewer phys in the usb_2_dwc3 node, I
> don't know. The definition as it is now appears to be a safe bet.
> What I noticed in the tests was that the pinctrl usb2_en_state had no
> effect here. Although, it apparently was required when it was introduced
> [1] by Merck Hung and xlazom00@gmail.com. Therefore I am hesitant to
> remove it. Also, there may be a hint that it is the enable pin of a hub:
>  > $lsusb -tv
> [...]
> /:  Bus 005.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/4p, 480M
>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>      |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
>          ID 045e:0c5f Microsoft Corp.
> /:  Bus 006.Port 001: Dev 001, Class=root_hub, Driver=xhci-hcd/2p, 10000M
>      ID 1d6b:0003 Linux Foundation 3.0 root hub
>      |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 10000M
>          ID 045e:0c60 Microsoft Corp.
>          |__ Port 001: Dev 003, If 0, Class=Vendor Specific Class,
> Driver=r8152, 5000M
>              ID 045e:0c5e Microsoft Corp.
> 
> For the IDs 045e:0c5e..045e:c60 there isnot much info, only that its
> usually a 10/100/1000 r8152 ethernet adapter, and a USB3.2 /USB2.1 4
> port hub. How this is wired, though, no idea. In the face of this I
> would suggest to keep the definition as it is now.
> 

Regards,
Krishna,

