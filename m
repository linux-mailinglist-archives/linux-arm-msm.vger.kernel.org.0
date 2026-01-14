Return-Path: <linux-arm-msm+bounces-88954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C026AD1D655
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 10:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ED9F530131C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 09:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7869B38756F;
	Wed, 14 Jan 2026 09:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmbwtpIp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMnfhxUA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8D33816EB
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768381864; cv=none; b=Qu1nF8A6RSlgCvqBw59GOJci8H6RzC3upschk9yW+mDE/UrjTHVfJt5HBgK3zOi5KN5Hngi+BS2k8i2ffmtM0CofmF/cSKP3WvcDDTO1DI1b19VT1rVxLmAtWhcVoiARqbqwGjTppj6t5243L/0zE7Pw9t782jLzdyQqHujVISc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768381864; c=relaxed/simple;
	bh=KqmCJ7ntm1OGH3eGMXJOxm6Ood+cQVFk/YCTSFpsBiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BoGk/QKQOyL4CwES5U3wBJfJz2hvzcwgopEHF4Bd4TN390RjSIwHZFOyj/L7WdXui9jqTexm4QG23a+uzls5m1OA1LNa8IhuCFBXlKEN3SgtaDMkud+a3TX8ph3EAAyWGHFmhgfUbGCyT+SeF4K5bjhIVsGZ87bR1U/oyVEBUo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmbwtpIp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMnfhxUA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60E7j6BG2841198
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4FMZa7ZHSstttEx5JquSC66UQvBOnUhm4EemIIqSfQE=; b=jmbwtpIprdDZck8u
	jhgVEWsMwO32JUrC3m38IA132VsBzs6QwWmJZsyOidoREmq0ipue4mE35X5Lshd9
	yPM4IHzR7KAmqgh+HMvLkfKJFaZOeuy/k/PQaBVCgDWnm7/StPj5NZgdqSto/1Wy
	x+s4QwU0p81VmKvKo1Lchdk0FCv8bIBKSnT6hVEAsdH9nRZXrFdOyrEphMyWWUYB
	6fcd4f6k2FVbFkgu1n3AxkIizJUl9HQv+hCf3mY4xv4LQSz2BUfNcxh11vWoKyn+
	PsOfoqjLonM8F3OunuO9k26Rio2VVI6PHwBlmnfKOFdBUmAkwsbdk3HcaFYCjt+o
	4LbmcQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnuk92mwy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 09:11:00 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f46844106so585633b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 01:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768381859; x=1768986659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4FMZa7ZHSstttEx5JquSC66UQvBOnUhm4EemIIqSfQE=;
        b=MMnfhxUAR2Oj6dFlaQ25AvVnAPPa+MhAWOlZ+Ncxc+lm5CJ4eF/T/xUhGZBOFKmzRv
         hUpXAW8Oow4wbSZ81ybcEphHvDqE7UULkjE06TMg9v1T56WOn685nzWWwS4WnOyicyyg
         CYjeLhQd5+XmP1JL/BClv1+gElHWa9GwsmjsubWeGPxlRtHCYWKcjA5q52k1/NclwKFj
         prBAwKiHk9ruSdN5OK+Nm0JDVcWDneebz4snbiv/P1ZkDlTrBnVF5ZqlglpnR7JbYahW
         Ky6onAyJ1kESbuHYwCq3JeM7rHaVisos698L7eKdOapcOs5c9QoecEc7qYbIubICjwMs
         Qnkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768381859; x=1768986659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4FMZa7ZHSstttEx5JquSC66UQvBOnUhm4EemIIqSfQE=;
        b=xDZLne374DSfPwCNEIj4oxL6rI8QOgQadEM0UNyx/VIKqg2RcEkzwF9mepJKyhItti
         06BxGw5eW7arsFjNdyiPfKSJePwuD/5KmXaf3d9fa6c3UUCwLnB3sCyZHdO6T60c0jdw
         qYWujkCCmP6wX2xT8V+ROsN6qFu5uqCakOARjZth23sgzIeVCsTPH299FwlYG8PhhYO7
         hBOWKuPuEk4UUXBG+MSufpXsTG1OiKvUWaJvQum0NiomofCAh2PS+f03wqrD7vF3NWKx
         Z5FOJ1Y7yKlcmRop4nY66UoLmFmrXni1CAKWRM/Q5XQEdV/lV2Wp/h+LztAufwyXnNb4
         S0dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNykX4GQQtAti7J1T+Q5/1yeSfVma2qNnn/ax0PWxZSSMfwvr34L2paqDVbsOCZmCgjxAZVCsbvyP8aISw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2D0eIERDi4Bv8uUPfo4p1B81MN3FXPjRSDLi93K+84QsZ9cb1
	PykRccPHhFkEmqq7boVsHUjttMwjpcVviyD92JKMiSD8FopBRR85dC3Ve2t+CWSFz1VuFpMiALs
	6EmjJmuW4j8eLq9Uk0BfwnO1MFZVXdu6yJtduXg7lXHWsJkV7sTfdO4qDsPf+ESG3v7OH
X-Gm-Gg: AY/fxX5v2Zdocdy0o0LdNwZGTigYhbVSj8KSou4QOeSIgldcDLd1GTdL4SY80n3LI6T
	z7V+MUz5OPhmX6NFwy/cNfAWKqJeRHKsUWGsFHpS8VnAWGeUV2CDjhMqQMiPVxNWTD+CFFDdvPV
	j81U2QYsOjLMZy5QIRjpcW/XhnLQIx8Nni2XSONeS4P2HhB2PgYmadZfPhmE1Hc4YpynUl/IQ62
	9PANBAGRYtGT1NahfOfWEcQa6tY4HjJUgJhMvyqGZGJLfzEiYGl2y6YabkZnULrkdMEc3GxHhOh
	rRf9wm9+sMM0momIRCbncHla1bjJgEXeWMJqxG/BO5KPEZc7RUPGZcSxJHxvfeEvD8FnnQizC4S
	pZ4h3T/ZzEJPl4NdYmd8q7g7w3ijgEkp7kkfWZ9V8rEJJzfqwF2rYTxD9mma0JF1wgGQ7XBIL8u
	RwoMDOLA==
X-Received: by 2002:a05:6a00:4208:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-81f81853057mr1758744b3a.25.1768381859263;
        Wed, 14 Jan 2026 01:10:59 -0800 (PST)
X-Received: by 2002:a05:6a00:4208:b0:81e:1b77:9e61 with SMTP id d2e1a72fcca58-81f81853057mr1758700b3a.25.1768381858718;
        Wed, 14 Jan 2026 01:10:58 -0800 (PST)
Received: from [10.133.33.186] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81e6772688asm14037376b3a.45.2026.01.14.01.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 01:10:58 -0800 (PST)
Message-ID: <c163d50f-d6ac-4a2b-beae-b33128d58912@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 17:10:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: dt-bindings: Add CAMSS device for SM8750
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
References: <20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com>
 <20260113-sm8750-camss-v2-1-e5487b98eada@oss.qualcomm.com>
 <20260114-notorious-bison-of-wholeness-0da70f@quoll>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <20260114-notorious-bison-of-wholeness-0da70f@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ebQwvrEH c=1 sm=1 tr=0 ts=69675da4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=nXVHHlikLqQEmL3_ZCoA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: p27ooF8GeJUosPfi54cZemPFslN9ENtm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA3NCBTYWx0ZWRfX4POiQ1f25WE/
 MyqJCJFkFXJPztkZygiV51FTJMklSlIq+cdzSewjGooYJmN7Zyq+KG42wRwTe4qUTSSTLInKfLm
 qiouRHhTGA38fNn0DFN1NVFFO5RjpoKriFquyMc1AXdZDvp4+UxPDobQld/STikHnq2TNzVRxj5
 L0CSx8bEOnXjna/3qLz1W8QpJBiC7i0hjg6Se4Hv1l1Z7bYRz/HXgHkKyGS2lCb1SFp5EPNNSC8
 4KQZRZcLmUHeE6C01XHLTGyd8gW8Ro1hPAuWT02uoneLD3IoRBb1ATHYV+Hz7oWYhrI3/I6CL8b
 xrWA6X/gzLqWaWXzR/T9k4e+YpHPmNUekEaMrANn7LhEyHau2vvS1PClzhx3OwsDEcb8TKZ0Z7k
 +/CZ0fM4seb85L6FElnZaD3T0Gl71kfKb0H8G01dAv+f5u6r+WTc1SPRUqg1mcSflvWyt41sALc
 Npw1x3+BrzT2xPDvPGA==
X-Proofpoint-GUID: p27ooF8GeJUosPfi54cZemPFslN9ENtm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140074

On 1/14/2026 4:39 PM, Krzysztof Kozlowski wrote:
> On Tue, Jan 13, 2026 at 02:28:27AM -0800, Hangxiang Ma wrote:
>> Add bindings for Camera Subsystem (CAMSS) on the Qualcomm SM8750 platform.
>>
>> The SM8750 platform provides:
>>
>> - 3 x VFE (Video Front End), 5 RDI per VFE
>> - 2 x VFE Lite, 4 RDI per VFE Lite
>> - 3 x CSID (CSI Decoder)
>> - 2 x CSID Lite
>> - 6 x CSIPHY (CSI Physical Layer)
>> - 2 x ICP (Image Control Processor)
>> - 1 x IPE (Image Processing Engine)
>> - 2 x JPEG DMA & Downscaler
>> - 2 x JPEG Encoder
>> - 1 x OFE (Offline Front End)
>> - 5 x RT CDM (Camera Data Mover)
>> - 3 x TPG (Test Pattern Generator)
>>
>> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>> ---
>>   .../bindings/media/qcom,sm8750-camss.yaml          | 663 +++++++++++++++++++++
> 
> Why are you changing the change IDs?
> 
> b4 diff '20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com'
> Grabbing thread from lore.kernel.org/all/20260113-sm8750-camss-v2-0-e5487b98eada@oss.qualcomm.com/t.mbox.gz
> Checking for older revisions
> Grabbing search results from lore.kernel.org
> ---
> Analyzing 8 messages in the thread
> Could not find lower series to compare against.
> 
> Look at your v1 b4 data. Now look at this one. This is completely messed
> up process, not how you are suppose to use b4.
> 
> You make it difficult for us to handle your patch and I do not see
> reason why this should be my cost.
> 
> 
> Best regards,
> Krzysztof
> 
Hi Krzysztof, sorry for this oversight. I did a rebase work for this 
series and found I couldn't fetch 'Reviewed-by' tags for the rebased 
one. I think that issue has the same substance with what you point out. 
Thank you for providing me the clues and apologize again.

Would it be acceptable for me to submit a v2 revision that only updates 
the 'change-id' in the cover letter? This approach seems to resolve the 
issue on my side and should help reduce your workload as well.

Best Regards,
Hangxiang

