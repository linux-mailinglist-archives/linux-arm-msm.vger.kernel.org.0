Return-Path: <linux-arm-msm+bounces-88300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF50D0ADD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 16:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15F48302A97D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 15:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB9A35C18C;
	Fri,  9 Jan 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KxPoJCGM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d2c6yrYb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7071D5141
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767972032; cv=none; b=BSQQ66UdVXWEbkBzUehkaJwvjfZAfZ38LIRFGN/Bh8rivIq7QeS006mADRY7YFza9bpWDeoh+lxQBfFU9FYsdCFArOTFOE/nOYdtkP9v0EZyVy5pTlvvfZFH9aH/OF2DYxp1f9SPCwakKylpKjiHJw4+11TJ0lp3m9IDsaRZoP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767972032; c=relaxed/simple;
	bh=7OoT8ZPcTVUu34J0z/Lza2gdt2rcWcp79sDbJOJ8v5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p3cEAgAwQh4Duy+htMhviJpUvROJhiCDBVrT9fJJnm4HU/2T2ptmdzoZNC4ofMkIKn6DRjGwYUlzsfEUbN6QNsui22l2S3XQKa8KhJ+Jpp9A2QQ7mwwYQSssCMwiMEOQUg6f8VXCtcCqRMtKRPOW6ApdUrquvWsTn5TE0t5ZhLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KxPoJCGM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d2c6yrYb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982XcQ2184008
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 15:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=; b=KxPoJCGMd2q3ygLU
	Hq8LIjz4xl5PNqjiQ5vpUjELOg4YFU0Galj1+LDodqf1jmHCZyBHtpXc0zsWDQHq
	AOnk6oLA6TWcPSkliboJhzvpqJqSi+P8fIRapAv3PpEVjUkuBLYM2bq2JSm3t3LX
	mixYHafZqiZQmE5Xbph8rV1OkitED2NJGLwjSRoGw3DRMCWs56awEQYiRrtCVKoq
	3/HUzuiYfRnUL8DUErBdscKxUBEwLSOGvYYuYLW2zURUcBqQ2Z9lcqOAPGwt7tp7
	vlPzObkiYa/JfA4PDQb8kYaUu3rObLeJRAylvPJDpxR+xVuPrdMTiE61ynlbtaY7
	hINskA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn99at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 15:20:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2dbd36752so1079118585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 07:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767972028; x=1768576828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=;
        b=d2c6yrYbl0TgKmD+juhL6xH2wpnMe4+yaRi2WULjsyLp6MzWt10GiuuF4625FLjAFM
         6FWNjO58HuMukqILSlqoEEYchadF+rLO9t/u4luZYEY5NJnxSY2/9iqVib6yVcGfla6P
         gTeeZLdWO42XoFpgbrdben0QoK09OIusbcPTliaiM+DjJu2QFURXKjvo6fJFN9J229/b
         PCDpZIr2az1Hw5uvhAMXofl1fPYOhhptc4NzNJpH9mO5JQi4s4tH2A5C1S6p2Lom1rAQ
         teHUxEAdNRy7ZbFdceMzO0FIS69ZXxupEj2F7Sa5u5wEd5JDEiktk/uGhE4Egp+Bo79z
         sMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767972028; x=1768576828;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49tXLgJm9KB8UQ6tr2ES8NVrNO8u4KMgkHOdrGNgtn0=;
        b=Tl1ggwGpmXdVLnA3nZzvaEyikaIacAVr8m4az1QJBshVrnQfErHqVKoLmKuxebk0+y
         UtHv2v2X8wS0PvXm3LJo+KF6AZNwSPhmV2FfdBtgQpLelXE3mk3KoOr+pJ9oqKYAwki3
         qon9hN7sy0BurG2CKJ2H5TeNYWLs+gLXxwkcIooVJ52aGw4xjXtpV9WLrq9vEkRHeJeX
         Pu6VXYXXejOj8vcXmkZDx5G1QduVzwaJuuohzJIpJmEkvU44plEtjSUVPvjdtI+f7k/o
         yofwy6EndiTEzXcvXolHOqbyKVcyhH5jgvxleZ/PMF0RUCwRkk6GHFSw2NWSq+f+7ENa
         kFaw==
X-Forwarded-Encrypted: i=1; AJvYcCWWztFpd78JX67QdZeEhCWKTWJ0nI0QqwJsYQBKaOY7XU3ucEVqG64i5IFOvCfwgebB27/XkJ/ooA/rgko5@vger.kernel.org
X-Gm-Message-State: AOJu0YzWB8/SH+geiDlffvvFB2Brf94pE5gGq6r+urlcLHM7jSE9WjMy
	n15MvcgHOFzPCgXPM+C6Olk4K3jHcsTvtJntzkJSAWsF5n04fhNQZ2VEuZQW8l31IyvEK3CWNLl
	15jSP+4hClEwI9hwwQmtbdKMcmsfnbXFbhGB+jOh7JvIHVxo3jbiK3Xg1HdpLarUW9ovQ
X-Gm-Gg: AY/fxX7iJge+JAWjJ+ckw9QS5j+8ggkuvu/QtdJxCizR9kMah8nea46d0cbT9mOObbt
	xRUXbEk4bBRzVCFLGW456DzJdWOdw2v9IlzzF5O4GcFw6Gzn1Qc6OgmRRPpf/fuAQRVlgR7LK53
	6leJ+K37J7atnprcVC96BDCpr7fUw2dyC+Mjmbremt2emeEwiWI0D4/vHCDi5L4Kd4Wm5UIXstt
	eHgqJigC2Y0DGH3c7Wz0GCh6ZmU99K9vd4iftF0QTrKk5yIKtMzubuV4W+iKpaz72wiZ+lzRIy+
	7NMcp+ziENH8uXyOVZzPVLLemL6sJl/xazrLxKA5VTmdiz8ep5qNZH8fSvGWbQIjghEXkxwN64G
	2muUKKpCKURGv8W4xRL50IIq8Pz5eu0PxwIqalg==
X-Received: by 2002:a05:620a:191b:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8c389411a4emr1096205085a.77.1767972028251;
        Fri, 09 Jan 2026 07:20:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4T7EpPkz3EWkla3fr6+RN+eZME331kblvXjFVWSsrchwbSfgu8tBxJVnkAZJ/PMc9qkoTFg==
X-Received: by 2002:a05:620a:191b:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8c389411a4emr1096199885a.77.1767972027621;
        Fri, 09 Jan 2026 07:20:27 -0800 (PST)
Received: from [192.168.1.29] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6ef885sm209365935e9.9.2026.01.09.07.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 07:20:27 -0800 (PST)
Message-ID: <955e5ed7-6469-4f17-9e8c-3ee06f5dc3bc@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 16:20:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] bus: stm32_firewall: Use scoped allocation to
 simplify cleanup
To: Gatien CHEVALLIER <gatien.chevallier@foss.st.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260105143657.383621-4-krzysztof.kozlowski@oss.qualcomm.com>
 <20260105143657.383621-6-krzysztof.kozlowski@oss.qualcomm.com>
 <fe8bdea9-4bd2-4200-8b7c-3c231dc6dcb2@foss.st.com>
 <ccebe9a6-34e7-4699-a4ff-1ee925f9c150@oss.qualcomm.com>
 <cd8fc344-37a0-4281-b3c0-29514b97f5f3@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <cd8fc344-37a0-4281-b3c0-29514b97f5f3@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SB9IvFwRn2QXLq0KgztyZnHcdj5mdPev
X-Proofpoint-ORIG-GUID: SB9IvFwRn2QXLq0KgztyZnHcdj5mdPev
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=69611cbd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=i0EeH86SAAAA:8 a=EUspDBNiAAAA:8
 a=xCSfWrHGVKLGKJWD7hwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDExNCBTYWx0ZWRfX4/Hx70kiLK3E
 HK5ii/e5x2PP+hW4BzQVQumvjqWrsG81SPot3pVo7ki+W93cO3IuumVRFSQCw4o5nFORbjnwsbV
 PUJsVAQJI1WG0eQirrL80gv+ZIG5HluivYgJYt7Ixox3M7meUKuaFLy1g8TidGxeSnFjeG6iESs
 e21z+vyPdXrWXG9WxAnRECemUY6MKMAQC04axmuMxPrapseFQQFzo3GAIymJz5PR7SFuTmgbG4p
 4zR+XxsmnkhYoihJ9H87bItPE8pvPizTo7qCY0twGtzLP0uZASUYn/otE+kXVlU0XLHLaQ726/7
 gDHolPyfCV2VSxLNYatQbr3HJLSA90a4Pt9bNZP/zbg4In+drGl73KwN0E2F3fBnuRF2x8yBQ/h
 S1Zifvekj0XiiBSNsDbO/QyH0uIpancAtQ9J263PTC7I5ZbwzNCMjoMv9NbpO6HwreLVC2KuR6/
 0+uapM6cV4YBAyHkguQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090114

On 09/01/2026 13:34, Gatien CHEVALLIER wrote:
> 
> 
> On 1/9/26 12:55, Krzysztof Kozlowski wrote:
>> On 09/01/2026 11:37, Gatien CHEVALLIER wrote:
>>> On 1/5/26 15:37, Krzysztof Kozlowski wrote:
>>>> Allocate the memory with scoped/cleanup.h to reduce error handling and
>>>> make the code a bit simpler.
>>>>
>>>> Suggested-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>>>
>>>> ---
>>>>
>>>> Changes in v2:
>>>> 1. New patch
>>>> ---
>>>>    drivers/bus/stm32_firewall.c | 10 +++-------
>>>>    1 file changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/bus/stm32_firewall.c b/drivers/bus/stm32_firewall.c
>>>> index fae881cea9a0..92414a4c7bb1 100644
>>>> --- a/drivers/bus/stm32_firewall.c
>>>> +++ b/drivers/bus/stm32_firewall.c
>>>> @@ -240,7 +240,6 @@ EXPORT_SYMBOL_GPL(stm32_firewall_controller_unregister);
>>>>    
>>>>    int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_controller)
>>>>    {
>>>> -	struct stm32_firewall *firewalls;
>>>>    	struct device *parent;
>>>>    	unsigned int i;
>>>>    	int len;
>>>> @@ -257,15 +256,14 @@ int stm32_firewall_populate_bus(struct stm32_firewall_controller *firewall_contr
>>>>    		if (len <= 0)
>>>>    			return -EINVAL;
>>>>    
>>>> -		firewalls = kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>>>> +		struct stm32_firewall *firewalls __free(kfree) =
>>>> +			kcalloc(len, sizeof(*firewalls), GFP_KERNEL);
>>>
>>> Hello,
>>>
>>> I'd prefer to keep declarations separated.
>>
>> Separated how? This is the coding style of cleanup (which is quite
>> explicit around other styles)? Or you meant one line without wrapping?
>>
> 
> I found odd to declare and assign a variable mid-loop but I found
> multiple occurrences of the same kind of cleanup.
> 
> You can drop my comment, I'm fine with how it is. Thanks for the
> cleanup.
> 

Sure, just to let you know - it is fair to reject cleanup.h entirely for
code you maintain (like netdev did). I only disagree with sort of
semi-cleanup.h without following its declaration and initialization
rules, because it is more error-prone, leads to bugs and often does not
make the code easier to read/simpler.

Best regards,
Krzysztof

