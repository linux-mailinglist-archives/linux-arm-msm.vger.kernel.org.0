Return-Path: <linux-arm-msm+bounces-37383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 253339C2C4A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 12:53:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7D421F21DDC
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Nov 2024 11:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673CE185B62;
	Sat,  9 Nov 2024 11:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ljK6H66X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EFB1465B1
	for <linux-arm-msm@vger.kernel.org>; Sat,  9 Nov 2024 11:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731153193; cv=none; b=cNmAIvsz0PY1XTtpYXB9nkv0EHXTn4qiWYCq2CvTQWXzJcGLu3kw3jnUHOcqyLNuRy8vK/QBusXcCHppKMj1SDcg4ztvSyPVlP6LFWKOoYrgPzXaUMDlbGhYJf2Zz1CKvMvVSkpU3UiOucSRkaOjUkpxkcCLmJEXRr2RCR3B1gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731153193; c=relaxed/simple;
	bh=WbO3bwNTbo9CJaITdFuh3lFQvk9b5CAZsrlvd0nPISU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r3TRQJ+zsQ8CrG7mW4MVy8FuZDrtrcaslcuOtvd4D2HhS0Vj2E96jBuRlgpNbuUo/jMqJLzzTzyGUdxGfis+7qQ6C2ijRsfNAWwVCl7+T3x5dA/M9PIm9rRiMgCqDwtu+mYIJXzUaNgN2NAsTbQYyYsRDOniKBBysu8Jf0S04Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ljK6H66X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A9BmeA6015503
	for <linux-arm-msm@vger.kernel.org>; Sat, 9 Nov 2024 11:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WbO3bwNTbo9CJaITdFuh3lFQvk9b5CAZsrlvd0nPISU=; b=ljK6H66Xjg6/l9L5
	msKLXhOB/aHsEyWw+SyAtPdiDrmdJAhQ28YGhSTKoJQtf4p0C8rDC1BA6Y9whRj+
	hEad6Zwc+rPEziO5SypeoWR/kb2EE95u+c1pFEvXmmSg6ihutXg9iaMtPrZzNIy0
	jPu2boRS2nh9zbeSZ1hOcnOLo7h2kxQP7rKOdfhdhOMW8ZWIvXVGpdF8adUYRdUu
	l0gfU8OrIfPtgFLpwoI/tjbFcE7uezjmYBqGh+nXPskqaoR8RrTAd/X385AlN3r9
	t6bjk1NlqgFOk+RH2w6qxzS4UEHh7RI6YBd9jFLZtAyxscsdXnL3WEORzSAjTmcs
	45jZhQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42t0gkrgeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 09 Nov 2024 11:53:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6cbf5a3192aso1212946d6.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Nov 2024 03:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731153188; x=1731757988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WbO3bwNTbo9CJaITdFuh3lFQvk9b5CAZsrlvd0nPISU=;
        b=Rmek3ZmAtJ483kCiCo8J8iFqpZJtqzILlARY0TzjzqQyxJLhzRO9Gwtr3sWDzaMhct
         FDuFau0Sfxl7sfcscnQTob1+KoDk8XYOgm171KtN1R2XCGdovD9ARiN7+nl6cf9S256D
         qutVuajKiukRPaen/Xb0P8aBcfrrtkjqLSF0maBcvHni86T7/7YiIpgGt9sRY6+mBT9q
         VdDvz14K8Up49y189ManB1kmesOlRXLl9dSR8MecBO+nM4g0F+hsnwDy3RV58TA49TB/
         38EzcKjPFSiGfqyODYOCPVtvMbjOmjPh81DoGbf5ZO4hDB8hFOA4sCiAbLpxayihhP/e
         DEtw==
X-Forwarded-Encrypted: i=1; AJvYcCXLl4hkQavktMWgB7aXwL4Bohrk+73ytkM/UwQ1i4fpd81Py5SZpKOFB0mcPUKd+WIZBeNc/5UnZ2vG+nj4@vger.kernel.org
X-Gm-Message-State: AOJu0YyTfQZGfWEe1g5ksQ72xaEWpTuN+m8OcF7Pk6dsrhNGLvXFsvN2
	6Ug+QDqfix6CeKLC3UZKjnB3+2jpkLQcmOqrZUa+nPIDuQ6PrcllZIRY8bktSDfENm3BrjFZSv3
	FQB5vnzN5YQn+ccsbtKiGof1J1RY9Xsvwzxrf1CWAZSQcTPQU3pIWl5Y0LoO35Rsf
X-Received: by 2002:a05:620a:24d6:b0:7b1:8e09:5122 with SMTP id af79cd13be357-7b331dc1d1amr357303785a.1.1731153188359;
        Sat, 09 Nov 2024 03:53:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHl7UYZzV/NRfxqM1jrH9cTW8r3ctv9OuDpOq1GOlGbjBAVwnStnlfGHEtxjiNYaEuj2o1SYw==
X-Received: by 2002:a05:620a:24d6:b0:7b1:8e09:5122 with SMTP id af79cd13be357-7b331dc1d1amr357300985a.1.1731153188005;
        Sat, 09 Nov 2024 03:53:08 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0a48561sm351434366b.48.2024.11.09.03.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Nov 2024 03:53:07 -0800 (PST)
Message-ID: <f4a2598f-28be-47f5-9f6c-5cbbf911c3ef@oss.qualcomm.com>
Date: Sat, 9 Nov 2024 12:53:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/14] arm64: dts: qcom: Add initial support for
 MSM8917
To: barnabas.czeman@mainlining.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, iommu@lists.linux.dev,
        =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>
References: <20241107-msm8917-v3-0-6ddc5acd978b@mainlining.org>
 <20241107-msm8917-v3-12-6ddc5acd978b@mainlining.org>
 <0293b1c5-d405-4021-b9c1-205271107350@oss.qualcomm.com>
 <2c5f429d01fc04b2b40251e841bd4f64@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2c5f429d01fc04b2b40251e841bd4f64@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1jC8tvGdAclRcQjR7M5Vq8WgNuhesto8
X-Proofpoint-GUID: 1jC8tvGdAclRcQjR7M5Vq8WgNuhesto8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxscore=0 mlxlogscore=870 lowpriorityscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411090101

On 9.11.2024 12:36 PM, barnabas.czeman@mainlining.org wrote:
> On 2024-11-08 18:03, Konrad Dybcio wrote:
>> On 7.11.2024 6:02 PM, Barnabás Czémán wrote:
>>> From: Otto Pflüger <otto.pflueger@abscue.de>
>>>
>>> Add initial support for MSM8917 SoC.
>>>
>>> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
>>> [reword commit, rebase, fix schema errors]
>>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
>>> ---

[...]

>>> +                opp-19200000 {
>>> +                    opp-hz = /bits/ 64 <19200000>;
>>> +                };
>>
>> Does the GPU actually function at 19.2 MHz? You can check this by removing
>> all other entries and starting some gpu workload
> Yes

Thanks for confirming, feel free to keep this entry then

Konrad

