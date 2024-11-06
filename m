Return-Path: <linux-arm-msm+bounces-37129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BE59BE425
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 11:21:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8DCACB20C3D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204A91DDC0F;
	Wed,  6 Nov 2024 10:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MsqeP7+h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4371DBB19;
	Wed,  6 Nov 2024 10:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730888484; cv=none; b=FOYGUvgv+tptRe1CTlDSQ566b3JlnE16xBOYO+ut/4uJcel8K8Bkm9WSJArCZF/HTjaJ82hEBhcIgc3SgSwIUWK5TUqzIkXCia7GSF28Gm+Q6N3B+dvDYez26HKCoI6Q+etr3KoyIk0LRYOKv7q+ADP1b/qj9ImEf9I9dY7dxY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730888484; c=relaxed/simple;
	bh=PQ2o5PxJV//B/SDV+R6qsRTowPv4eb3FpLR+95aS7w4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=eAHroGBrF4EMF1wZUCUgO86pYxcH17H3ZrDrhFi7UWe4qruorIAX6FxHohP7kHQV11gkT2l7hnS5mvX3osv8EAiURZ/13xlELGpW9kqS3fF/+73DRDfMK/wr5WPlvLz9MoV1UZRzZLNHf6yqA7hN4/aq465wL1eZd9isgKKdlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MsqeP7+h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A69WbvC028952;
	Wed, 6 Nov 2024 10:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjpz5PvCxLqQic9Vv2wXPzL/5dQBB7Fhvy+j5Ys7CQk=; b=MsqeP7+huWjZZbGM
	G+4Xsl2HsRlsthnf25NvZctAmB3CpoVn0QNaUhvjInq7gdcigJVkloaREr+4rodB
	jYF0H0diBeOI3zqPq49FdXzSLj4NkZr/8vVnpLIVCzoN86MrdPqrEcS//SJCnULK
	ApuSYyNifM6W2u0B1j2rfmcbURCHCYW7GLFkCptYBjbwcX6CtRkA0WQe78cPZSl1
	4z2tA1UhNLH1KoEgC/Fk7lQDF5xDpgxy2Lx1Y4tY2B9nBJVa4zndYXHOra1sOhkK
	pd3Rizc1127vv1fHAB8JsKqhkB9xr8CpJGxRzR5i5uNRyFiE8S3lI3FoqCQGHf3z
	3pxiww==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd28aua6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 10:21:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A6ALE1B018773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 10:21:14 GMT
Received: from [10.216.39.182] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 6 Nov 2024
 02:21:10 -0800
Message-ID: <556248aa-8d0e-4dbd-b32d-40017a59b972@quicinc.com>
Date: Wed, 6 Nov 2024 15:51:05 +0530
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
 <f8697f7f-f6ac-4b6d-954b-a0777770dc8e@quicinc.com>
 <e13488a3-5f45-44b2-950d-5a29307d4ec4@oldschoolsolutions.biz>
Content-Language: en-US
From: Krishna Kurapati <quic_kriskura@quicinc.com>
In-Reply-To: <e13488a3-5f45-44b2-950d-5a29307d4ec4@oldschoolsolutions.biz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hOvJtcsmXAbsHXAqwxFHYYzs3CkuZFwK
X-Proofpoint-GUID: hOvJtcsmXAbsHXAqwxFHYYzs3CkuZFwK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060084



On 11/6/2024 2:23 PM, Jens Glathe wrote:
> 
> On 06.11.24 05:46, Krishna Kurapati wrote:
>>
>>
>> On 11/6/2024 12:57 AM, Jens Glathe wrote:
>>> On 04.11.24 05:31, Krishna Kurapati wrote:
>>>>
>>>>
>>>> On 11/1/2024 11:56 PM, Jens Glathe via B4 Relay wrote:
>>>>> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>>>>
>>>>> Device tree for the Microsoft Windows Dev Kit 2023. This work
>>>>> is based on the initial work of Merck Hung <merckhung@gmail.com>.
>>>>>
>>>>> Original work:
>>>>> https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
>>>>>
>>>>>
>>>>> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
>>>>> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
>>>>>
>>>>> Supported features:
>>>>> - USB type-c and type-a ports
>>>>> - minidp connector
>>>>> - built-in r8152 Ethernet adapter
>>>>> - PCIe devices
>>>>> - nvme
>>>>> - ath11k WiFi (WCN6855)
>>>>> - WCN6855 Bluetooth
>>>>> - A690 GPU
>>>>> - ADSP and CDSP
>>>>> - GPIO keys
>>>>> - Audio definition (works via USB)
>>>>>
>>>>> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +&usb_2 {
>>>>> +    pinctrl-0 = <&usb2_en_state>;
>>>>> +    pinctrl-names = "default";
>>>>> +
>>>>
>>>> On the blackrock platform, for this controller, are there all 4 ports
>>>> given out for use or only one ?
>>>>
>>>> Because if all 4 are there, you might need to give all 4 pinctrls (one
>>>> for each TS3USB221A mux select) here for usb_2 node. If only one port
>>>> is given out for use on the platform, then only one phy (of the 4
>>>> activated below) needs to be marked as active.
>>>>
>>>> In my case, in [1] on the ADP platform, I marked them as always on for
>>>> all gpios on multiport controller since driver had no support added
>>>> yet.
>>>>
>>>> [1]:
>>>> https://lore.kernel.org/all/20240707085624.3411961-1-quic_kriskura@quicinc.com/
>>>>
>>>>
>>> Hi Krishna,
>>>
>>> thank you for the hints. Unfortunately, I don't have any schematics for
>>> the box. But I tested out activation combinations for all the
>>
>> My point is little different.
>> Third controller supports upto 4 physical ports. How many of them have
>> been exposed on this WDK2023 ? Depending on that, the phys have to be
>> enabled in DT.
>>
> Okay I took the jump and reduced usb_2_dwc3 to only one qmpphy and one
> hsphy. It works, the USB nodes look the same and work. What an odd
> design, though, but why not.
> 
> &usb_2_dwc3 {
>      phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>;
>      phy-names = "usb2-0", "usb3-0";
> };
> 
> I will do an amended V8 of the patch. Thank you for the hint again.
> 

Also, if there is only one port, then don't enable the other PHYs.

Regards,
Krishna,

