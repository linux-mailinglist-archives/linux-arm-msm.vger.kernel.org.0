Return-Path: <linux-arm-msm+bounces-66834-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 085CEB1396D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 13:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AF6617BA50
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 11:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B1DE248861;
	Mon, 28 Jul 2025 11:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frPYx53x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E42202998
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 11:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753700535; cv=none; b=iFdRwN+UYDIG5DOgM3ZJeNAQtw8NsHHwv1OvT8xh0KXcta2uLFvSOpPnF1LIhk4Ac8rm3GLBcULczB3vC78TAtcBSLSUqX36vNllvXcCGtVoi52kG0WOSDAgRrpsmAqyHJHC23IQM/61XQwGtqP6lxeHYLKAEy8Gy3xQbmbnGfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753700535; c=relaxed/simple;
	bh=QTMRuquNtkVF7801cvDRB8V3A6EINsz1F+qf1uDU7N0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HcfBiE9jj+4mu/wHh7iwoQXEb64slf/fnD5GfuUfMDxiGIukDJ6lAHWNBsPr4cGWH6NEWk+ooVB5ps3lvOncsyxLzV/luAl+EcZyVO39OieopD0KUdMNTWizD0me05fqjnxIefii/X0srvkNCwm1fGBWGz08bKWx12uTUd661So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frPYx53x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMdj017619
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 11:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tkOmERj2A/upJpeVadcUk/yz4v7zZx5u22OaAAkVIQ0=; b=frPYx53xW8xjyAwY
	iu3awnkfSND/Krjea0qeDHUldMRhw9jEwAazzOcP4RE6Ovbw45RrY6VDy/EdHhOU
	M09zEmmP+Xm3EjpePYMbRGqFtwM+K0SPQHot7TqHA6gcPDvb+jIOO5ue1fovYMom
	+XXbJ0W/njAJmmwTorqKzmtnVjYIJ+ZkNxItWA/Jx+MuOyuthG7OqvRXqhzZd63M
	RCAb+DFFF0g7oLWgAd+a3IaL2UmhvJztSVvOqkyQiCXmzM6WTJQkm/MrwAupvnNX
	H6Z0ZFbkMm6MeLsg1bvI1g3tif6JSivamMaJFP43mbLnOcSFyoHxJgJvDAdu00zQ
	0EveqQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1acbv4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 11:02:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e34ba64a9fso7032585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 04:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753700531; x=1754305331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkOmERj2A/upJpeVadcUk/yz4v7zZx5u22OaAAkVIQ0=;
        b=IQIlOi9GLOvIqLP9JUGzBAfN6wBCXcR1daRB2jUypPwojQ3D0HNyaC1UixX0W08vvL
         lt+Y/LLMrjVzRKFKvLvCNPyt3TmMdUuIZVPykNj99YmL4tf29Im60Ow2sK3A9Ks+YS+q
         R87TwRPoy0KWBx8FwtD0XfqKWwszE6B6AMlNdPazrfwT+t7YcXI2jizr/cgzIiUulUWX
         zXGo1JwzhAJN/we0C49bSgT9aEczOwtA047IUgz4E4Pb/wBLPPUP5dKLfrMdYre2IBug
         f7sSt1xVqOXUFDiLdROEH+nrHDoSR8pmmtG1RJGEctng5MzgbgAHjMSAIm7NvmdsWG1d
         d89w==
X-Forwarded-Encrypted: i=1; AJvYcCWOGW40FIPwLSQmMqSb7oyYsyjKBSmBeoaz3NTj3avkNVyZxhszbiXm/YxQhLZ0hhby2yhXKVFkLmU0+paz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5n8GQIkQcvzGEjpYZr82hWa94QhX929AvnwL+AfbZ8fYYxv4j
	JKA6awio4lFXGplX+Z35KwmLxsjzopvRnPvylqNrGtIauR1yJzEgjWMttvVKjWUjn0jycbbgLQH
	8youQYTsbaBSX4RP7ZeIv2s6+iHi3q8Gqs4LEGxt/I3MjfRhnbl8kSEnYFX08z941JptX
X-Gm-Gg: ASbGncuJqcxgCP5t1PSEGRd5Njmh/vJStN01LuEU7R6rSF+ruKImTjVs0lMM+FnqNTM
	W4N/SMK5MVjCfhohXkd5r5cpcoQFOIjKHOo3a58Izu/qlxaKnK3dcWI4zYRBSZWE/TwMxb2o0PU
	obDiGjeeED+7h7r1K2kN2DSqcrKLuJ9Ktgs9wQGOEBGbBbupVpCH+g+hfpRftViVaaMY0zCrwbt
	OEfEEsyTTeicNQnpoF+FJzLU7SngaS0JocQz4s0JzVpqC2gt0fHOXAoDU7lyebiPk30uKzw3LoA
	tGe5dgq9RYvmo7mUx+t3F5GvBVJcgQomujOwuJb2zPQN1IXAbFgc0Zw9RFp+HocaP/h4kts55bX
	3jlIGxOUh0j9xuLfk2A==
X-Received: by 2002:a05:620a:a00b:b0:7e6:3c4f:6e44 with SMTP id af79cd13be357-7e63c4f6e8cmr594471085a.7.1753700531153;
        Mon, 28 Jul 2025 04:02:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUIgDqBhwTM69wrpR7rB+q9FoIvwjatH6qNVoaRQs0g4MWIANkOEW6KBTVIFmEb1l0QgxQIg==
X-Received: by 2002:a05:620a:a00b:b0:7e6:3c4f:6e44 with SMTP id af79cd13be357-7e63c4f6e8cmr594467285a.7.1753700530518;
        Mon, 28 Jul 2025 04:02:10 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635af3c15sm406076066b.127.2025.07.28.04.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 04:02:09 -0700 (PDT)
Message-ID: <dda5b873-4721-4734-89f4-a0d9aeb5bdab@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 13:02:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: qcom: Add SM8750 GPU clocks
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723-topic-8750_gpucc-v2-0-56c93b84c390@oss.qualcomm.com>
 <20250723-topic-8750_gpucc-v2-1-56c93b84c390@oss.qualcomm.com>
 <20250724-blazing-therapeutic-python-1e96ca@kuoka>
 <54b617c1-bd1b-4244-b75d-57eaaa2c083d@oss.qualcomm.com>
 <5b8d42d5-d034-4495-9d28-27478a606d62@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b8d42d5-d034-4495-9d28-27478a606d62@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u7UQEN8SpPbA8sUtdGJcVxSL1QfeLTm7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA4MSBTYWx0ZWRfXxepujbMF1KL9
 +SwoFjuMAuhaBckc7BDWFDJTMZnyAR7eL0j/0IBP0LjinDlfrgghA5N870mly2FPj6vGwsK8anm
 AM+w6l0ovREnB3jJx6EkLtIawP2P3jiVeZIB4dIetFJ1ZmBEBW2/cjikTAUFLRgfzv4/qgIU4VG
 zgTTJ4zCrbEWa7f99RG9kgfyvT54clRT/JTE+zWbtdXyY1eJNltwH4iWnWh5s7pJ7GSfJb7Y8X9
 kLTk0mgLHL/kGnqpGfYv1m3fZlXVOFf7buXwjnBD2mo/+1zN57CdKcc/UCjnqgtEu9jECxo2vA9
 peuKxJRXhy5mPXwYeG/EZNPST/RnLzu/qz6vO0KtyKPQGpztJcSK8ZSRi+ilSi9oRh6dDbbwBlr
 7F714YtMotzPHVHH7EUSo5hYdL/bJR7yiEBJmBq/yYsAShqGD8/U/4O2WH0Nf/P1HsPlZlRi
X-Proofpoint-GUID: u7UQEN8SpPbA8sUtdGJcVxSL1QfeLTm7
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688758b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=N0DHfeS2NgGftJ_ZqQEA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280081

On 7/28/25 7:01 AM, Krzysztof Kozlowski wrote:
> On 25/07/2025 11:30, Konrad Dybcio wrote:
>>>>  
>>>> @@ -40,6 +42,9 @@ properties:
>>>>        - description: GPLL0 main branch source
>>>>        - description: GPLL0 div branch source
>>>>  
>>>> +  power-domains:
>>>> +    maxItems: 1
>>>
>>> This should be a different binding or you need to restrict other
>>> variants here.
>>
>> Actually looks like this is the same case as the recent videocc changes
>> (15 year old technical debt catching up to us..)
>>
>> I'll send a mass-fixup for this.
>>
>> Some platforms require 2 and some require 3 entries here. Do I have to
>> restrict them very specifically, or can I do:
>>
>> power-domains:
>>   description:
>>     Power domains required for the clock controller to operate
>>   minItems: 2
>>   items:
>>     - description: CX power domain
>>     - description: MX power domain
>>     - description: MXC power domain
>>
>> ?
> 
> This is correct and should be in top level, but you still need to
> restrict them per each variant (minItems: 3 or maxItems: 2).

So I was happy about how simple it was, until I realized we also need
to poke the VDD_GFX domain. It does however not necessarily exist on
all platforms and I don't want the binding to become a spaghetti of ifs..

CX & MX is present on all(?) platforms
GFX & MXC's (any combination of those, unfortunately) presence varies

Is there anything better I can do than creating a separate case for:

* CX_MX
* CX_MX_GFX
* CX_MX_MXC
* CX_MX_GFX_MXC

?

Konrad

