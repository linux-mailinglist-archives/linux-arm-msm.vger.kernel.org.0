Return-Path: <linux-arm-msm+bounces-88666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5316FD16C25
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 07:01:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9EF6D3010297
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 06:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9B92DA750;
	Tue, 13 Jan 2026 06:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faCJqzdj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KsJq8/q/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6C1F3B87
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768284089; cv=none; b=bKIXm1WibMqtIuRaGyFG/8Gm38wGKA721xjsvt9bvwvIYw672N5IWxbbshxPN+IBb5Qc0ZzhJXLI5pOWks5W2IxTOArkaXBq2hYh+hwMIrHbh2Vh4hwejYVim6UAW5ur4cH4qsPQMTL8PmmQ3GryvNQEteEeorwW4NQUhtoQT1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768284089; c=relaxed/simple;
	bh=ExFtf1dq3lSreIpntFmRGLkfTfR1R3Y1ehLQ2GfmSN0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjZzBeX5eV41uhECsbnRbGtJWpSH9sIjJsCCI+fa0sAy0KYyoanRirqiF/v6ezO6M3GkTQzok03klf3ke79uXtAU0f3dH3ghszDR4tcMFGDsMG5PyLzvKnwVe77CXanEagk59koyqXWpBZ2S9Mj68Uv1PpSeN7+tXkEXfCUNw0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faCJqzdj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KsJq8/q/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5TXaP3870136
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:01:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UE8MfK0gQU/+v4SfmTZbwuu2WaGJyuUhtz4oKoxzIJE=; b=faCJqzdjZysdhUgc
	zJHG/ANGupldsybM1PgJTYlZ8JBLmqKbNWfSrR2AEHcyIUaQyJWYOdqklLUbmO2f
	AYp0LrH5jpHBLIaAtUB0jGEvCX5I7Kfj910tupRTsnqRIIJZn31YwU3b9OA8/yn2
	4U8gTsBnBlMCLHDriRRzuPs+4a7KfepiRpw7k+BYLjcLlNDu5e839fbblT1+B1/+
	wfLQw1fxF5v1jGs2q11ezrWPQOVrG5T+gd8T0EQhO/XvBUZdA5/9Q51e4efeXpUY
	RpVSNWLHeRvROH+1G1WCs/yTFUU9GHq7lXEtaFA9kbl9GaQZZhQKItu2xYqTxXc8
	3ETpnQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk825g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 06:01:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8bc4493d315so1883950885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 22:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768284086; x=1768888886; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UE8MfK0gQU/+v4SfmTZbwuu2WaGJyuUhtz4oKoxzIJE=;
        b=KsJq8/q/U/g+IQXkEDtrBGZu+YkqaZ7d0CT8BLfq+MHFeyVVdbiDYpSXni0W3iQcsn
         GBsIl//oEk1eWhoORZveUC599eNGvNTTF7fTdSBlDOoLzK+Q2P8dquZEJTlhvykTdadv
         JifnbPbILGskolRkxdHMI37vKEGH9PAxjvPHR27Fce18OXhcWpdEjP6sfa0uZGkDm2cp
         OB3XLfeZ3GFJLvuNgNT/7fbr/ETRBSa3Mb9ytIZuFvc3ym4cMbZj2U0rX7uC+u1NmU0E
         RximaozqyreOuE/ylZ7z5kNEvzYMZHlTnnWlCKyCjTI4BewmMqz6SXKzisfXqjRZN81d
         qE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768284086; x=1768888886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UE8MfK0gQU/+v4SfmTZbwuu2WaGJyuUhtz4oKoxzIJE=;
        b=QJnkJ7uOkvMCTpF0RBGBWxTLeo68siTq+V53kCiGEQIuduZjzXjNirzfHGEEyq8g/I
         nncpA+XM3efx7L9gIDQdMf3d0KFwO4FVuYwns2r4/cWhTwymlUpAOdqhp0YOfCQ5XRvk
         238BBU59BJAIGQYzrcWyfujXHcswomH3nFTm3rLGq1Ir2PuWVJLjG8s+liaF9fOGvEEF
         Tpnsoo12EB9EwWQZZINed0ypVvTbNNk+cPA3uLQo6Fcl/mKb3K67dU40wSj6irPor7DG
         MXsm2C/guYm0B11Wtz58lo3T5WHGBWURbom5MtqG1eOcRC7O2WJqn9gwco+fPvRneIRD
         t1fw==
X-Forwarded-Encrypted: i=1; AJvYcCUK/vFhcnfMRKHzI1O08VrhDluGaZD9Wy9DFyV+Lwc0r4cVQzzon+soq7lvCFSqckPyk6a01nz6fN/+aVp1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9a9VYZpVScVdC9I0y4aGnE/iwzk523i3eL5iYeuhpygU33ae/
	LTuG7yuZYDJR5przfaKLD1SNaI1NZ+wpl/a2xsAXPVOMn6f4TtqxYMIA0Iv9I9UEzopogT6zdsq
	aYCP7Gig35zUisLAfaOG1yd2oVyklnLzefSJwFexr0OomfaVADm9YKYrKBPLvhPEkJlii
X-Gm-Gg: AY/fxX4mnpqWBsZBHWNDlh0vv6end6f/ngwlqujd9Hj1mHRF7grFpwCzo5dZzhtY+nM
	IErFAoEzQllxhmShMEY+pIy8fXZV7m+ZcqJPe0A01ekqQzkqkGdGtA5LnYpsxPjqIDfaHAQUve0
	YpiZnxSFHWHekTU63XUvNkcBpRqEcQFT5ACU3BBJFUkkjXtt46CI1UxKdqO5lPAEpAvIy2/UV8f
	+xJL2EG7X+0YMcG15OiX6p6z9JmqMdw0GulOmTlNoiFg/tCLMyspwWjt96MZqKdK/YW7QAl7+0O
	XqNUk4rODiySOjQ7hnYk62FVwr0lDxp00zROyVVnhl6muk40jg5gGAjhA4WgZV6rZJY7K130wxV
	8D3fEW8jrYps9/8n+TiGc45Rl/MV8u4m6eiTW/jcS1n/VFczJVDgylUD2uypzwd/s7lSpHGuD
X-Received: by 2002:a05:620a:2a0b:b0:8b3:eb4:720a with SMTP id af79cd13be357-8c3893a28dcmr2960771985a.38.1768284085948;
        Mon, 12 Jan 2026 22:01:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyKSW6/UDtn6iXo+OfnG5T1IMbLQQ6Qo5k6ywT1sJoHyq2E0QCBHbEYFD0ECiXarD+FMZ4Qg==
X-Received: by 2002:a05:620a:2a0b:b0:8b3:eb4:720a with SMTP id af79cd13be357-8c3893a28dcmr2960767885a.38.1768284085362;
        Mon, 12 Jan 2026 22:01:25 -0800 (PST)
Received: from [10.38.241.242] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51bf8csm1649498885a.28.2026.01.12.22.01.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:01:24 -0800 (PST)
Message-ID: <e93f95e7-59ec-405a-aa05-df78ad86be9b@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 14:01:20 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] media: qcom: camss: tpg: Add TPG support for
 multiple targets
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20251226-camss_tpg-v7-0-ccb536734805@oss.qualcomm.com>
 <20251226-camss_tpg-v7-3-ccb536734805@oss.qualcomm.com>
 <250743e3-66d8-4a39-a487-947ae1c831b8@linaro.org>
Content-Language: en-US
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <250743e3-66d8-4a39-a487-947ae1c831b8@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: g5bUCNLgIjKrE7jhOq8RMZ0F0Zfji9LF
X-Proofpoint-GUID: g5bUCNLgIjKrE7jhOq8RMZ0F0Zfji9LF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA0OCBTYWx0ZWRfX9pJYcBjX2wJV
 yVKGXq4nKV7SaQHfwovJjYlQa3jgTs/pbUUTHNPKlIy10lZqcMuiko8fqAbhVfsk0X1bgpdICvO
 +An9MUjHpTsRjLUbYKCIWwVWbU3hkXZPrBWmXGz5Ig0H/cl3b6lF2HZH837wL+GPmTiVhpPGXs6
 XBEfzHJdMI8Brt16GsQfEeMtK8jXW3UG+25fOVfRinCfow5gbAHvuoUUK3WD6jkL3Cexp8L775q
 UHXqTURmngg9Bu0D/enJt/eMKDSoYuL1PzImJFDSdRvJSQ2GOx8PSqfa53AVxDQQ1tVqn/DKVPE
 cJujuesZBSs34BE1whvAutoplG6Oa8pTzmYtnqMw8gvT1+Vk4rYx1QFMt8+t28qgchyKQs+8F3y
 4PfOFo5qy13rLYMBe/gvpp+wJD2UjJcaFxqwui1njW3atYSkzFxPdEbUlg6zS5awtfHsm76kN4g
 pun91pfKL5/5HD17mQg==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=6965dfb6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=yaJj5qA20OuGLx1VwxsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130048



On 1/12/2026 11:43 PM, Bryan O'Donoghue wrote:
> On 26/12/2025 09:19, Wenmeng Liu wrote:
>> Add support for TPG found on LeMans, Monaco, Hamoa.
>>
>> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/camss/Makefile         |   1 +
>>   drivers/media/platform/qcom/camss/camss-csid-680.c |  16 ++
>>   .../media/platform/qcom/camss/camss-csid-gen3.c    |  16 ++
>>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 257 +++++++++++ 
>> ++++++++++
>>   drivers/media/platform/qcom/camss/camss.c          | 128 ++++++++++
>>   5 files changed, 418 insertions(+)
> This is causing a regression on Hamoa.
> 
> Did you check the camera itself still streams ? For me, camera streaming 
> breaks when this patch is applied.
> 
> Please look into this.
> 
> ➞  git bisect good
>                  [git:60c1b50b1f2f5] ✖
> 9d1d90cca34ca66617ade951d42c94d5f086717f is the first bad commit
> commit 9d1d90cca34ca66617ade951d42c94d5f086717f
> Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Date:   Fri Dec 26 17:19:12 2025 +0800
> 
>      media: qcom: camss: tpg: Add TPG support for multiple targets
> 
>      Add support for TPG found on LeMans, Monaco, Hamoa.
> 
>      Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>      Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> 
>   drivers/media/platform/qcom/camss/Makefile          |   1 +
>   drivers/media/platform/qcom/camss/camss-csid-680.c  |  16 ++++++++
>   drivers/media/platform/qcom/camss/camss-csid-gen3.c |  16 ++++++++
>   drivers/media/platform/qcom/camss/camss-tpg-gen1.c  | 257 ++++++++++++ 
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
> +++++++++++++++++++++++++++++++++++++++++
>   drivers/media/platform/qcom/camss/camss.c           | 128 ++++++++++++ 
> ++++++++++++++++++++++++++++++++++++++++++++++++++
>   5 files changed, 418 insertions(+)
>   create mode 100644 drivers/media/platform/qcom/camss/camss-tpg-gen1.c
> 
> ➞  git bisect log
>                  [git:60c1b50b1f2f5] ✖
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [2ae8c3645005e9115f39e8aa61dea9ea48cc356e] media: qcom: camss: 
> add support for SM6150 camss
> 
> git bisect bad 2ae8c3645005e9115f39e8aa61dea9ea48cc356e
> # status: waiting for good commit(s), bad commit known
> # good: [f89c11002f67740aaed818137d513d6c3dbc348a] dt-bindings: media: 
> qcom,x1e80100-camss: Add missing regs, clocks, iommus
> 
> git bisect good f89c11002f67740aaed818137d513d6c3dbc348a
> # good: [18f74c5866cb470123eb0b39cf3248a09fab3ef9] media: qcom: camss: 
> Add common TPG support
> 
> git bisect good 18f74c5866cb470123eb0b39cf3248a09fab3ef9
> # bad: [9aaf62e09bb1bb17c186addc49984343623df50e] media: qcom: camss: 
> csid-340: Fix unused variables
> 
> git bisect bad 9aaf62e09bb1bb17c186addc49984343623df50e
> # bad: [9d1d90cca34ca66617ade951d42c94d5f086717f] media: qcom: camss: 
> tpg: Add TPG support for multiple targets
> 
> git bisect bad 9d1d90cca34ca66617ade951d42c94d5f086717f
> # good: [60c1b50b1f2f5466c07aeb4148df25227b5f6d55] media: qcom: camss: 
> Add link support for TPG
> 
> git bisect good 60c1b50b1f2f5466c07aeb4148df25227b5f6d55
> # first bad commit: [9d1d90cca34ca66617ade951d42c94d5f086717f] media: 
> qcom: camss: tpg: Add TPG support for multiple targets
> 
> ---
> bod

The actual result of CSI2_RX_CFG0_TPG_NUM_SEL | CSI2_RX_CFG0_TPG_NUM_EN 
is 28 | 27 = 31, which is just an integer rather than a mask.

Sorry for lack this error code fix. will fix it in next version.

Thanks,
Wenmeng




