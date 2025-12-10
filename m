Return-Path: <linux-arm-msm+bounces-84892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9F7CB28E0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 10:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0527300528E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5DB30595F;
	Wed, 10 Dec 2025 09:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CligV0kg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LkY25fE+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1682701D1
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765358944; cv=none; b=bFLPvFYpydhJ2wzYv1S2+U6ppCjK1dmFTnKMOIQUFGlfyAWoWP0qWOGVy0VUFnhVGB2Fru8InCicqqQP0LEZuu2xOOe97eQ0rhFYqwIBLjloc3P44/Y2V2uVRrgsLgGHVj8vqZ1OU4nVX6dmf/zMkzIsO9eEOtpA7kG0cnbE+Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765358944; c=relaxed/simple;
	bh=xF8db0JGCazTGtaxnBHSEaVgUg9yACFqexd484LtBwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9cI6zSeAkfbvz7jzLyHex83PgJRMdrm/bHMf5mpwlI3hSq9Ja3tsXv9te/lXBWoQ2aV87zc7iKut51Lje3Id/7r1H3gLsqpn64fX9wFjTaaOjntOVKVYO59HO2J2XRDLhjL+pjlVdKjY1+ajF3iEEnnrrNjBfriuNhKhb64gmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CligV0kg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LkY25fE+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA8eTIH2669763
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:29:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mM27yhqxHWL44fHStwtMqO9bKL3UXMlwIZdo2HspMiQ=; b=CligV0kg/RWjRaI6
	UOQM7L1nhjxcXT5lwn834iazV85UyGq9cb/9zJ0gNevYRWEP0M+mWxSMP9zAZGrj
	NtLnV0YZkzMw0sKts3AhcWrYJuVrQEjVyrdP5uzpyirvo47nw93ckmiON9Pq9gKj
	Uezr82gpMX/PlkO4xxfYZrDbbFhi1CdeXCqpen110uqW26p2VEVtv4XlYs2MIXBi
	G9V+/qGJGw+YUPGPR7wZR7k+j7gVQtoKafufa6CEc6d2X43LVzLsdAAWDmz/V4FY
	8jIv0QjSZ5+SEd4K1fw9oGynnfyfIhf8sNgAQ5m1iarA/RBu0Szk9aS+LJrASRhR
	F5G/1Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay4ykg9aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 09:29:00 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7e1738754c7so589254b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765358940; x=1765963740; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mM27yhqxHWL44fHStwtMqO9bKL3UXMlwIZdo2HspMiQ=;
        b=LkY25fE+5FE9sXO5B26w8xT5Do7lii1qBq8WAhY1KzmI2aURMhefUKH4CEU9Sr4CLQ
         mT4lj7KI5ugvCpT7PdXjEpf9Ph2vhxkmVinXcmeF+T2mfTK81ZHjQWmgGQEELGXAdqvX
         pCksa6Lly/YqR6RfSlzvlD57qBAtL8pPexMcIEvgsFglN+6F3Zfmyav+IAvCEgmrCS+N
         52xV6edbAPNw1XnBupk0JdgevKF7OAAPs7kkIHmWGU/JhD9Gbrj1BXotIDgUS42uq/TM
         5QKzYjj++mXLl84qjG7jjTKfhEoV10Sq1bCnryYhdYwQWLXDe1tHJm0yXBGZRvU54EA5
         I9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765358940; x=1765963740;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mM27yhqxHWL44fHStwtMqO9bKL3UXMlwIZdo2HspMiQ=;
        b=lx22L+VNYAZOf2skrzRqoJfLu0vgc6+ulXCBvnMBamrSVKNdWLy48l++6fDs4yTsYZ
         jpSStIaErW886ZGfU7V9C2hG15bQW2KM69mvBeaBdf8IwNsystr2WyBfDwnKMN7MPLkH
         JhExb+d5GRUJgVR3cfWdgNJXzl8GccQs9nSJ9ecBj8fB6FNzCNHx5UQTqrU4vRRKIhc3
         mmtZxWHqZgNIgLd8Xsm1LAyOXmkfiHzlBz7eP+lG+GFrHDrSVNoD6JfEn1sb5TIRqef6
         9oUhOYG1y3XBHbVhbKxGhHyA7Os5iDwlDRe4s+DzfW8Biq7i64N9mM9T7cqKgwVzVfjJ
         /P+w==
X-Gm-Message-State: AOJu0YxA03kSlMcXQjqUhPfxXqr2ngSMXC1cgGisFvN44nGutkhO2KUz
	e07HycumwdQfb4eg+51qB0mMMue9fOCH9jqB/qfVrs1ymdu+b/orp2i166Q2nYN9a4yhyifYc9n
	sNpwi5C+hY8Yf8/+s+X7AOcf97ljvJ9+owlQ64f+H537q30FCzxTbvEZ+7EaOI9jRPN6G
X-Gm-Gg: AY/fxX7s3kNI9p+Jwa+X90IRLfwSEF1dkcBNDj7YLirFar4HNwhMjH0pl1b240Ux4N+
	WO5vzHRhhId9pOJExzHOoTBGrYXZtteW2Ot+pElRRx0ssrzgt0PC9V8OjHxPMJh6fSU1gXnoEdj
	SWor+hNjUeTlrR7TR7AQCkl/Mr0WRMFODC+gA5YYK6GnvariEMJjmkLSE2+CCcUM4n27ksWWFvJ
	dXciQp53JNb040RrWwzvndlr8pb27yaKTpbDMOTDvYbRYIJ72GO6p5/sOtoEjooClWJNaOUCv1Y
	PThbYEES7F1hg/NgxIqad6DPXZltg8mVU9Lrd1PzaI+QolR3s/o2A9nbBNTbNkR1Aq8oBMB0vlt
	ZkhTMJgUOnV4r6Ti6JT600wDeeDk=
X-Received: by 2002:aa7:8317:0:b0:7ab:242b:95c6 with SMTP id d2e1a72fcca58-7f131e86ee1mr2885909b3a.6.1765358939368;
        Wed, 10 Dec 2025 01:28:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQTC/ORdxDDt4YIU7zYdQzJdsoCAeFlabOTE/dcu6LbjHnoT7gza0rzZBiJ7KqzMSwzkoVuw==
X-Received: by 2002:aa7:8317:0:b0:7ab:242b:95c6 with SMTP id d2e1a72fcca58-7f131e86ee1mr2885892b3a.6.1765358938892;
        Wed, 10 Dec 2025 01:28:58 -0800 (PST)
Received: from [10.147.240.173] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7edac47617dsm7947795b3a.42.2025.12.10.01.28.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 01:28:58 -0800 (PST)
Message-ID: <0afa55d5-20bf-487b-abe0-4e2126ccf453@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 14:58:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: hamoa-iot-evk: Enable TPM (ST33) on
 SPI11
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251112-arm64-dts-qcom-hamoa-iot-evk-enable-st33-tpm-on-spi11-v3-1-39b19eb55cc3@oss.qualcomm.com>
 <55eb7543-7b88-42e2-bb11-7c54c4e59801@oss.qualcomm.com>
 <dc500814-3b1d-4cf9-8f73-6fd71ddac28f@oss.qualcomm.com>
Content-Language: en-US
From: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
In-Reply-To: <dc500814-3b1d-4cf9-8f73-6fd71ddac28f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wVjHJKLTgZiLM8s31ZQmi51VTxkaQYzA
X-Authority-Analysis: v=2.4 cv=Mfthep/f c=1 sm=1 tr=0 ts=69393d5c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=nh_5fiOn-7Ul9u4raNsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: wVjHJKLTgZiLM8s31ZQmi51VTxkaQYzA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4MSBTYWx0ZWRfX/Ow6BmehD2P1
 tlCECJS0/VrtwUhsIwGf3bT5LaHTAv2QocQtCmB7TowsMxRBTsRrbadjD42lhviDK/MejxoZucN
 wmBFnvjO+biTIJUsXnRl9BioFQ/LZfM/6LRDu3i/awZv8nOkKcUq1gVw9KRBpA26p5S/h06pqau
 bWLnLAkvG/qhydoQtSVny7ZXx5jlC4u7I2xgWkkJiDyr9CJ46JxaXUjyXY6WHSSnAvOusy1dyUt
 PJA+nszzc1tvs7MO9mtX5lrwvLxMYLTW5P6wJjnYpi06q55yVusGkFPxkjQdY5oCSqxrxzyFqd4
 cGmyiY8zv2mtPCloNoAIBVW5Xd2DtpPPg6Y5oI/cM72pwDiyIz9O6eA+RVyvXG+1iSmaXFWXVle
 pJV/w/ZuA6Ex/2NVipERQ0/eff0WSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100081

Hi Kernel Reviewers,

I wanted to follow up regarding the patch. It was reviewed but hasn’t 
been applied yet. Please let me know if there’s anything pending on my 
side or any additional changes required.

Thanks

On 11/12/25 16:39, Konrad Dybcio wrote:
> On 11/12/25 10:28 AM, Konrad Dybcio wrote:
>> On 11/12/25 8:42 AM, Khalid Faisal Ansari wrote:
>>> Enable ST33HTPM TPM over SPI11 on the Hamoa IoT EVK by adding the
>>> required SPI and TPM nodes.
>>>
>>> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
>>> ---
>>> Testing:
>>> - TPM detected via tpm_tis_spi
>>> - Verified functionality using tpm2-tools (e.g. tpm2_getrandom, tpm2_rsadecrypt)
>>>
>>> Depends on:
>>> - <20251106102448.3585332-1-xueyao.an@oss.qualcomm.com>
>>>    Link: https://lore.kernel.org/linux-arm-msm/20251106102448.3585332-1-xueyao.an@oss.qualcomm.com/
>>> ---
>>> Changes in v3:
>>> - Squashed patches touching the same file into one.
>>
>> Doesn't seem to be the case
> 
> The author was referring to a faulty previous revision, not my
> suggestion of coupling this with the dependency
> 
> for this change:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

