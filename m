Return-Path: <linux-arm-msm+bounces-66654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995FB119AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 10:17:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24C767B2AFA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 08:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2022D2BE7DF;
	Fri, 25 Jul 2025 08:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFgQGoXV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD42186E2E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753431438; cv=none; b=GJfW7pekXgjWyiM31xPn0SGgrKrQYAvrZ6dC9bX4+yDvs/RF3M14X1KzqOJsygqntF0w3fMyWx/nQbkYa50YPUKPPr1YPCdMQTdoZyBb5gqBVuXZcSyP1nZik152q4KQgEIrjkCYQ4X8fb6VnayiQ5z/3h4YOuXuh/yl+KcvuOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753431438; c=relaxed/simple;
	bh=GUt9tz6QhKbEM20TY59EPhfaQ3CjaqtAklTBxesc4Fc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hla9edMoYOB4n9dTFERVyELaNt5i8BRjb1Zbm2mBx4e6GYWkY/KzSk3OFjUGd5a7KOGPIK62fMXQrnx00BLZ/HeDkF268/hkGsssKC09Dl9WvSwFMWeJq28NtG6/E97JJnRNR6mIG1JMT57EoT7HuyBgZO01obG3WRiw3+BIc+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFgQGoXV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56OLmg8w018832
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G2gAp22n0LVqwKU2EKsAkb8mxd9ndCHkEqEltv8yGrA=; b=iFgQGoXV0uN7DDu9
	rZKGekjHt51J194Femx/2/Jkn1FbiI+PSbTQvn3lEaSVWtCGH/mlJ2snM333lZcq
	MvGQwRZvnn5BL/F857Qf0ygn1fUSjlZNID6yf72vlTa4Qx//SQj0RQYsir63f04/
	4E0NA2o+nSpEc0xCXdQ1DCLFuYzxsbO0dtfnt9j4wtpk/G/jr+lKQ/kbRlsSyLl0
	9DZWfe8HtUNIhAFXskmMxfZlk7aWyFFNyJp4AjvoQQuOpsUYbMj4eI5MnVTZJSyV
	7o7tfSvJiCKeIy12KDWu4SF2QNPZreaEfaxSIulfzrwMMrgo344sXvrQJr/03fXX
	29WkAg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2s1bgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 08:17:15 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-756a4884dfcso1968574b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jul 2025 01:17:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753431434; x=1754036234;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G2gAp22n0LVqwKU2EKsAkb8mxd9ndCHkEqEltv8yGrA=;
        b=PQU7WbFkpXRm8JPCtuZkgMEwI4x9gQjtvijt+9eVRZa2ZNwT0oCXNCj+iGB4rUJ+jS
         gIj/H4DLlUMgx99Yn8fImGzgmh1YX0TzeZoACeb7cPvTbYXwrzmLsGVOSc+Gf0dceNOC
         bOv9rKrcYmXGV4Y1IyOb/MYkALXamFrjLebRXNJPzqtNQjafr8FKotd7ePh12CwtkpUT
         ou0pR5JzxhFmXIBjhjmsNyYxbv748BXhwF2LVkEq2APVDbKNa9DiKSL7KX3VaosaHH2o
         PAzZwWCTQnmCji+X+1aRI7ClyqPXpBpWdT8GioTmbeTB8zQWs3hW5/7aXuGyBjq8gBT5
         4sjw==
X-Forwarded-Encrypted: i=1; AJvYcCWYYl8D3UQu6AaVfk8HrxeSt9K0Vdy8rTIPZGk6Nvqva2XzgYUJcnG6o5bvxmUBzJ++gMKqJt6lT/EIsroV@vger.kernel.org
X-Gm-Message-State: AOJu0YxX32p+MXObbwW+/RiFfWB047G89KhjnyhLAm7pUci7LcrLXmw6
	ElexFyH8C0ZyYSOtD04u3g0Q+CukJSadHNteBbyvQ3Ee6pfdNMZELDU8BVNDjttookwcEmdd9EG
	wD0PruGb43y70F3ZfA1UfOUMzE+K4FmZ1q5S06UvQriGzU/xIQO1cJn20/HdmhODFVtWC
X-Gm-Gg: ASbGncuQqLhqSMATNWBjHjCCk/v5SJD8gGDKYc4Hh0nakq+kRi5gONMZHTB1pkliODR
	DTeoQnncRupf7P6x4YhKSJskm1jm9nbj2Q0eCXtmG2gAyQRDRZJ1jiG/ZgeDf5hrjjxDRHeUw2g
	wFhzJSIcevRYGXa0aNNKFPTb3zEEZL3V2p9JAPhw0Coebz6y9DDlcGrTsVRGuoN6Xv8CeJ0j44q
	/IjUyZFytqVvgHLpkRD/6gzlLLp7SH+W4o8Lkr0WVQlBqBJPYwu6QB2R8VWYi1DGuigDtrwdObO
	ogDkiiQkO91+RbzpOrbtgIb+y1hcDcohfaEbrR+vyUIcTZUSXf0SXl0h+ZnOk3iMqD5F6okwUCH
	FPIqJ/0Nld07Q4i3xl9XB/35HH5Y=
X-Received: by 2002:a05:6a21:9989:b0:22c:a165:3664 with SMTP id adf61e73a8af0-23d701db921mr1436099637.26.1753431433650;
        Fri, 25 Jul 2025 01:17:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd2mTB0BmD98J6BIrb5zukkTqEkg9rlDr+yDIHUMb/P94c38M867StKboWi+F5J7N2YvdZ8w==
X-Received: by 2002:a05:6a21:9989:b0:22c:a165:3664 with SMTP id adf61e73a8af0-23d701db921mr1436058637.26.1753431433198;
        Fri, 25 Jul 2025 01:17:13 -0700 (PDT)
Received: from [10.133.33.78] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761ae1584bfsm3128624b3a.38.2025.07.25.01.17.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jul 2025 01:17:12 -0700 (PDT)
Message-ID: <d34ff09d-5a55-4c7a-9eb6-fc0a0f4adcfb@oss.qualcomm.com>
Date: Fri, 25 Jul 2025 16:17:08 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
        Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
 <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
 <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
 <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>
 <3ldf7w5cpv4wt63kvewl2a32abx4uohvir7zgefpqly5rytkcn@p5fslnvpnjn3>
 <4pxg7acm4nuwo7bhiwrtpxdey7v2hanw2tw6vbgp6i6md4q2zx@pxjuymr6ykwr>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <4pxg7acm4nuwo7bhiwrtpxdey7v2hanw2tw6vbgp6i6md4q2zx@pxjuymr6ykwr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jf1TOwkqsQX1kj38l_a5JOS3Fcmk0e-2
X-Authority-Analysis: v=2.4 cv=IZyHWXqa c=1 sm=1 tr=0 ts=68833d8b cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=Oh2cFVv5AAAA:8 a=VwQbUJbxAAAA:8
 a=7KI_h5JtWn8X269DZ4AA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=7KeoIwV6GZqOttXkcoxL:22
X-Proofpoint-GUID: Jf1TOwkqsQX1kj38l_a5JOS3Fcmk0e-2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA2OSBTYWx0ZWRfX4YlOQAmV5vAU
 Ox/b4Q4N/URuh3Xu2H+p35aLTHbCHfYbmCP2h2u8E7J7cQZFAcbNmhdq3vXxci0ROlv2KXxOaTS
 a8vH8F+jVAvWKEWHPGqLAvnszcMP8dokxAAbX5ztV9oBzgcjE9CPRzFzF4EEL8xcx10+l/yF1jZ
 Hrctx+eglRWuYIqu0EiE0L5iQbiH6ZBK1amOz0AuQyhPFuWaNRbhgrxXCt4RXwsdg08VN/7vwLf
 FBuo1iNVjL/uTK0/CNKMHioTLK2FG6wvND1Xw58iz8ffC00fECUI48iSBzYgqozJCRF78XcvBtS
 i5cjUayp2itA8ieoWTojcVGwARLalzv9Akt9dFEYelH894NrzCHhh54bT3kc8kJ/uqjgdO5WFZC
 of0fP4qgNPpOEnd99rwyoxgR3GW83ZnHcnlvx422uLGvMJo4GVYkR0dPgEhGfJNAf+B/hXso
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507250069


On 6/22/2025 9:17 AM, Sebastian Reichel wrote:
> Hi,
>
> On Thu, Jun 05, 2025 at 09:34:14AM +0300, Dmitry Baryshkov wrote:
>> On Thu, Jun 05, 2025 at 02:08:30PM +0800, Fenglin Wu wrote:
>>> On 6/3/2025 6:35 PM, Dmitry Baryshkov wrote:
>>>>>>> +What:		/sys/class/power_supply/<supply_name>/state_of_health
>>>>>>> +Date:		May 2025
>>>>>>> +Contact:	linux-arm-msm@vger.kernel.org
>>>>>>> +Description:
>>>>>>> +		Reports battery power supply state of health in percentage.
>>>>>>> +
>>>>>>> +		Access: Read
>>>>>>> +
>>>>>>> +		Valid values: 0 - 100 (percent)
>>>>>> What does it mean that battery has 77% of health?
>>>>> I will update this to explain it better:
>>>>>
>>>>> Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.
>>>> Which basically means that we don't need it in the first place, as we
>>>> can read capacity_full and capacity_full_design (or energy_full /
>>>> energy_full_design) and divide one onto another.
>>> Hmm, it is true in general to quantify how the battery performance has
>>> degraded over time. However, estimating and calculating for battery state of
>>> health is much more complicated I think. I am not an expert, but as far as I
>>> know, different battery management systems might have different algorithms
>>> to calculate the battery health and report it in as percentage. For example,
>>> in Qcom battery management firmware, a "soh" parameter is provided as the
>>> battery health percentage based on the real-time calculations from learning
>>> capacity, resistance estimation, etc.
>> Ack, this is more than just full / full_design. Please consider
>> expanding ABI description (though in the vendor-neutral way).
> No, Dmitry was right. It is exactly the same.
>
> Estimating the battery state of health information is indeed tricky
> and complicated. The reason for that is that estimating and
> calculating POWER_SUPPLY_PROP_CHARGE_FULL/POWER_SUPPLY_PROP_ENERGY_FULL
> (i.e. not the *_FULL_DESIGN) is complicated :)
>
> Greetings,
>
> -- Sebastian
Hi Sebastian,

Thanks for the comment.

In the qcom_battmgr driver, both POWER_SUPPLY_PROP_CHARGE_FULL and 
POWER_SUPPLY_PROP_CHARGE_FULL_DESIGN properties are already supported, 
and CHARGE_FULL is used to represent the learned battery capacity 
calculated in Qcom BMS. Additionally, the Qcom BMS calculates a 
comprehensive battery SOH parameter by considering multiple factors, 
such as changes in battery impedance, learned capacity over time, and 
charging/discharging cycles. Such as, for the battery impedance change, 
it is specially important for calculating SOH in scenarios with high 
load or low temperatures, as only part of the CHARGE_FULL capacity may 
be usable due to significant voltage drops, especially in aged batteries.

Hence, we proposed adding "state_of_health" support in power supply ABI 
to expose this parameter provided in Qcom BMS which is different from 
the calculation of charge_full / charge_full_design.

Also, Android battery management code [1] is expecting "state_of_health" 
power supply property and it can use it if it's available.

[1] 
https://android.googlesource.com/platform/system/core/+/refs/heads/main/healthd/BatteryMonitor.cpp#927

Thanks

Fenglin


