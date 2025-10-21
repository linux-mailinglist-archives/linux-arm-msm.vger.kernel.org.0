Return-Path: <linux-arm-msm+bounces-78224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF03BF9268
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 00:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B09333565C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 22:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618F52BE620;
	Tue, 21 Oct 2025 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agC0h8gU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1CC22F177
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761087083; cv=none; b=BfVDd9mnf6wLyU1QfAa8X2JxVsWrCefVoTTgbdCgGt9wGzCZ/aXvwfgRV4LOf63D3j1JzBzwN2XewZd24mE/KhItLn8b9wBFksqpbFVPFau2AWlyz7XA7Vq8XX2OJlASMu4XLS2FZs30qeuioovDFCAEjvLGs4aAUpDqXw6eFvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761087083; c=relaxed/simple;
	bh=l4MjfzttT03UpsUTS8ZIvBiJyMgPARME2XjDV2MFnqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+b+1w7+8pOlYYvqtBArLu+UqgnK65SPKeLM+hKBPIPWO8c3NSzWPwgvrSNglECmz1shMQSLhbJO/7/0mPhdCtGNmHa5bihDck9g1m/3aT5nZZ1uONpTE9ZPz/Ma9vpepokbNHW7dHjEWUXDv/Vpnnxnt9X+uim2bVpcAPvT91Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agC0h8gU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEdtkU027407
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxTB0ZWx9XqHuZQWSP0z2+N5xPsBLTdahe72qllC8r4=; b=agC0h8gU8BGfDdDr
	izilEY5lD1/0blqhbNmvyRmG6/trshnut+7brGodMDEm7Sqs9vYX1rxJMOjVq3bu
	dkW1wdKwk77uc4JSPC9KiaF17Aw7ic+6zWyGd2ivP2D9GqZGS44owsWvfCVThoxi
	l/RTjOT8lha61avBtIyUrPp9zZ93SOurzwcgZ5+gDOIXA62b4IC7RrYcDEM8u8gw
	chd6KWCv5RxJSEDvDmAZRgl5eyXw0vG8FPJ+OVs+TEb4OIiFQa4DWPywMrHe4WUa
	Kf7ovRRQtgdZJPtwUtNco8s4QJh1lJIrWFrBHS4BAudbpWt/EMzV+8LCv/7hzjCK
	0+zrCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pjnjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 22:51:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290c07feb72so48210365ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 15:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761087079; x=1761691879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GxTB0ZWx9XqHuZQWSP0z2+N5xPsBLTdahe72qllC8r4=;
        b=iNpGhskOhGjv+sUziPqznSmslD+Uhdo7dCtSUV29vGnwLUnThPjbGvLA8uB84XcJKp
         W5PRI4vv4VAKq5Mqm0lf8NtifrMyhrEIdizkMjgPQf+GrviatzeqRN7NdA+TlFoq/47e
         JOsM0sPN0BaRtfJDR/A6rjm1THTxn7AAgM9A14VIIR8SCUUaULU7FdJCm1lpjFqsinkf
         2wXsDOF/htrP4ss6dQ9SjMBzJC3shvzpvReaily0//TILCEzXAMK2jBbmU3eJpBxGFn3
         b7bnHLNcMc4p67m4vIjE1sVcZp3ykMAtUHT1WUlPjkr7IO66xgl5HoMeJjBHYmQck5Qu
         U5uQ==
X-Gm-Message-State: AOJu0YzbzGornGrlf4GD6kPTwHYL6l/JVNuFUcbdQen2hOhv3hHY6kia
	gwOnC6AyKw2jZ5egdlQv9RLsrP5jOH9KsS507fVCTbRS91hDeYpRFUXT6P+pECzCXlDwQxFRjfG
	OmHiuDaEXOTJkU5DsIo7GPQF8Str27mo3r37EblmqsgtWkyi/tYQyqAUgqTcB2ONo+7Kd
X-Gm-Gg: ASbGncuGHvNyd9l1IBUSXr/bmlXvQlmExdbYd4wydiCJG4Nag0TS0J82KSHsrg1dPiK
	bDZ61zv4KbE3cNsQ7t7sY7LScs4Wrwzn1ihTyIbcaM6rCQaP2jq1f55w54WAwyzfv/2jDLmYCCR
	Swl06jlG23fV1tFJRsr9gVsHBAVT/8B7GY1TqiPl3F4zIU3XCTpaYClg61MIkpAUToaPUdMDlfC
	z+X4JO3WndKE2ykIpLMt8WMZviiUik7OLa6/j5/kEoI5Se43DPXP2Ee3K5XNuQQoTGre2fQX0Um
	9arSq/sLmh+uiLBxClNXo9hdbOwTFcqdynQrpX0zPNGsWLowuaEhmsb3jMhUfsyJj+DvDfgSi6+
	FxLhIO0MsIOd8sBYdkkZeLcfULyJhpjsqDr3YSIA0
X-Received: by 2002:a17:902:ccd2:b0:269:a23e:9fd7 with SMTP id d9443c01a7336-290c9cf2d7bmr247852995ad.26.1761087079434;
        Tue, 21 Oct 2025 15:51:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwfHJdMmdnmOW68E8w2u05X+y1KzPlmygeNE6i/MNdFbeUzbTxKUSCChF/G5ue64SrCYpVkw==
X-Received: by 2002:a17:902:ccd2:b0:269:a23e:9fd7 with SMTP id d9443c01a7336-290c9cf2d7bmr247852605ad.26.1761087078968;
        Tue, 21 Oct 2025 15:51:18 -0700 (PDT)
Received: from [10.73.53.19] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246fcc2b1sm119922605ad.27.2025.10.21.15.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 15:51:17 -0700 (PDT)
Message-ID: <7c78e0f3-7b8c-6d79-d8fa-7a4999201708@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 15:51:16 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 02/10] dt-bindings: phy: qcom,qmp-usb: Add Glymur USB
 UNI PHY compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, krzk+dt@kernel.org,
        conor+dt@kernel.org, konrad.dybcio@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, kishon@kernel.org, vkoul@kernel.org,
        gregkh@linuxfoundation.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251006222002.2182777-1-wesley.cheng@oss.qualcomm.com>
 <20251006222002.2182777-3-wesley.cheng@oss.qualcomm.com>
 <f5e4ae02-b8fa-4406-b2e0-3602b07b7e23@kernel.org>
 <00408896-2e25-2dd1-6e6e-2195317ee7fb@oss.qualcomm.com>
 <14bc2a85-0f1d-3834-9b9c-32654348603a@oss.qualcomm.com>
 <387c707e-613d-433b-a76d-16ef10dabc59@kernel.org>
 <2a70f878-269c-1b40-2e8c-77b5851de9a1@oss.qualcomm.com>
 <99ab26d3-eb44-401d-8a7c-1d9efd2a1a10@kernel.org>
 <b2b68430-5127-5eca-6bd8-4af31eb9fbed@oss.qualcomm.com>
 <bb299df0-58b9-4a6e-9625-305785d38eb4@kernel.org>
 <da34ecf0-c2eb-2afa-bd4d-9dc30fbe5cf5@oss.qualcomm.com>
 <78445973-6a5e-4dd8-a661-4e784af49b4e@kernel.org>
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
In-Reply-To: <78445973-6a5e-4dd8-a661-4e784af49b4e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX+Ug+zvBcRyYm
 FFtIfiuCGk8YLWZnQ0OWLEWYWTRCKZZMA3CqKcoVRFb/pI+7dILiwON8+Y/6IqO2KErYtj/cxle
 pBi8toIVIKsnXpHFYO1C8IwUjkTgeGseFD9dCECexvBAjhd8++X7fVVZNIJ9nYT4OTn5HAEnq8y
 y4rQIQhdpwRGfD2bB6eRrYHv3YaCXU/4Hoe0G39L2OJfRYdR+Hz5QzoRu6gDUiK84FJemJk9n3Z
 InxOSW3UP41pOTHTqQTwMby+sun7ZS3A36A/YDNE4BI9+P/niVPqgMK0p13MUfWJGFOklnbc2NR
 QPPqyMNI2aQzWxokiaGrEcLwMMv47rQdm1IlhMivlyjoXD++/nTeIYtsp0DPRkEfenXKaqlHbI0
 4wZuTMh0/cpHJBtKo2aACDZEqGRrXQ==
X-Proofpoint-GUID: Q6bAxdpHvYcMLEgmACrsry4UXKd8DnoL
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f80e68 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pKGxRwtwl3AlX2zDoJUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Q6bAxdpHvYcMLEgmACrsry4UXKd8DnoL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000



On 10/18/2025 8:39 AM, Krzysztof Kozlowski wrote:
> On 18/10/2025 02:20, Wesley Cheng wrote:
>>
>>
>> On 10/16/2025 9:41 PM, Krzysztof Kozlowski wrote:
>>> On 17/10/2025 02:15, Wesley Cheng wrote:
>>>>>> Technically its all handling the same clock branch (CXO), we have the
>>>>>> TCSR clkref register that allows us to gate the CXO to the USB PHY, as
>>>>>
>>>>>
>>>>> Ah, exactly. Then clkref is not a clock. You need rather proper clock
>>>>> hierarchy.
>>>>>
>>>>>> CXO is shared across several HW blocks, so it allows us to properly
>>>>>> powerdown the PHY even though other clients are voting for CXO on.  Then
>>>>>> we obviously have to remove our vote to the overall CXO, so that it can
>>>>>> potentially be shutdown.
>>>>>>
>>>>>> Maybe we can rename it to "clkref" for the CXO handle and
>>>>>> "clkref_switch" for the TCSRCC handle?
>>>>>
>>>>> Naming is better, but it is still not correct. This is not independent
>>>>> clock signal. It is the same clock.
>>>>>
>>>>
>>>> Hmmm... I guess that's why I kept the same clkref tag, to denote that
>>>> its the same clock, but one is a switch/gate for it.  Would you happen
>>>> to have any suggestions you might have that makes it clearer for
>>>> everyone to understand?
>>> To me it looks like:
>>>
>>> |-----|            |-----------|           |------------------|
>>> |clock|------------|TCSRCC gate|-----------|clkref to this dev|
>>> |-----|            |-----------|           |------------------|
>>>
>>> So you need proper clock controller for TCSR (TCSR Clock Controller, in
>>> short TCSRCC, what a surprise!) which will take input, add gate and
>>> produce clock for this device.
>>>
>>> Nothing non-standard, all Qualcomm SoCs have it, every other platform
>>> has it in some way.
>>>
>>
>> Hi Krzystof,
>>
>> Yes, the design is exactly how you outlined it above.  How about clkref
> 
> Hm? There is no connection between the clock and the device. Do you see
> any line going there?
> 
>> for the clock and tcsrcc_switch for the clkref switch?  That removes any
>> notation that the gate/switch is an actual clock...
> 
> You really did not get the point of this entire discussion.
> 

I won't argue how I interpreted this conversation vs your understanding. 
  We can remove our vote to the clock itself, since tcsrcc registers the 
CXO as its parent, so it'll handle the reference counting for us 
whenever we vote on the tcsr clkref.  Thank you for taking the time to 
explain what you were looking for.

Thanks
Wesley Cheng

