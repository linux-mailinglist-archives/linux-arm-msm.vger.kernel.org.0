Return-Path: <linux-arm-msm+bounces-59796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D48AC7AEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 11:21:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34D1A4E7343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 09:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9488621C188;
	Thu, 29 May 2025 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOWJ42jS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E5521B9FE
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510462; cv=none; b=C7tmMFJ03v6WWsVYNARwYWJmbob0/iZmqvqT6nhnhwGlvxyVNNivKf88Y/TGoF1MLfFrmowRKdMuDd4agOxN12BCMSHa/F0RfzLR0MPV4WWxRb//tAcHmTwe8utmQZ4OkVtR9xIJZrkzPjQmhlFyB9raCusuFyF72+JYCHiuhaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510462; c=relaxed/simple;
	bh=L4s52w8/kLW8XlEfsikn2Ky0fab9wuw9vsM2KIVpWIs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrHP/p6PKOzzwIGWdgC+o/BSkJbXtQHJgJLCpn601lcMgeEwZ3/HsL1r6lC+/yGsIGS7H1com26JTE6mjx8gOVUokPLLKZn8xzhIC9tFXMdjB3n5K+pGJ4wBo2FoNn6ZrqqtL3g4PJ12c6c0ywJwyYDJm/rN/ybmympk2uaf4eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOWJ42jS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T6WoVc023876
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fK2aLxCi/pD0NxBchLLM+RpJQItFN6CcDN585z6c3/M=; b=gOWJ42jSinOMwcFO
	Mruay/q3M9GdMi2t4wCd/qHJDA4TIewJYssc7M9dOMZaCKCiB3AMN4tGQH9dYYDT
	NDvleWuF5SX9fXGdxvzegGcjJ49u8dWMNbiPOwViVVNMzEbhAPZyGvi2y/KRjz+Q
	NaXYpKzG7/9iWQk7Dr/lybMk8vXwYknxJHFYasFaJxrWWgkAbnpHFK1O3LJMp97P
	Mg6Xq0oWFZeYW5+4zCOGLTDw3E4/pzGITJmZeEfd3Y1Ikwv7dMdUu1QJws2ZvImH
	aCA3fSoKsXFgk7UXCI351Ew3pP4wamTRPs0AgSOTpZkcI7iQYHz7DA9WRZs2zOIA
	9E++Ew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjw7px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 09:20:59 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097fd7b32so134413085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 02:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510458; x=1749115258;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fK2aLxCi/pD0NxBchLLM+RpJQItFN6CcDN585z6c3/M=;
        b=KSfKnRDywq/SLYjIsjbCFUqNioHyeGckC4e6+Ge6I0xWr06u09azEk72vYTIlpjqwa
         QSSs35aUuTLwGW8OXedoo0egVS5QmfIJyOHC3s+3/IJox0DoHSF0O1pYDV9sFpPQLv2e
         tee2O6Jlz89Dzbl2dx0CqcynSoV7z2NDS1zS3ET8ViQJ0Z6Lq6JXixI/yAXcUSyepyI2
         2M/P8TxSvSeRhQHtj6bNpUliuWoNFXQlie528Lc0uIDZ+K5fEk1UXOA7D9uNEDO5l1DI
         PlFDGLeYL/eabpVjP29eCnOQt6sCGD22QdAtsgr4j6SoPP4tZItacen8LUtEu7CJL6Fw
         cNyg==
X-Forwarded-Encrypted: i=1; AJvYcCVFhQCcp7brGOOJ6ttpNWrdqoP+91dqByEjPQTxBw3tTbuXW5j1ymcJr0InU8hv09bYCzY7s2bRJw4WUQW0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3MX7QoB5SmaEAqVrQ2lrp3rC67BzWU6MSrYQ3cvKGP4MW+7R9
	WV/JMW9Zl73t4u2QqnFGFNCJJpWOLEl3rGuoF5jcondaf4JMVe7BoKedHqHGHli54pgSXtxO56w
	9WQc/wwLVFU/Mkf2j3M3YyqAwEx3tigsG3xV+um1m9yN+y/Rn5gWaXvA20tHtW/bGHZ8z
X-Gm-Gg: ASbGnctZPB81GnUp6xjdXt66V14TtJ+4QSmnKBnFxiddBaH2euEUwe0f87oxr/uKdtR
	5p35N6jPwl309nEG4tUyxt7b7ZZPTzOisNkJVB0T9lueI1ZQO1mLKNUbJsqeDVfrwZWDwn0faW2
	ZUI+RPmncEC2OyM9YkHxqrX+8cYEl6ESWFN7pOUyTcF6ZoxMtLwgCWi6A6a9CaUIeOhDAWtMJyf
	o7TleXUzPTvY3KVBS4P776aSxGcTuCnFdJR+Xn1z4VgalGwhb26gRiIZZ9VzbODkuHQ7lFUCzmi
	WXyfmULSd0V+c84n6UR8b88DnzuIFIy99UQWew==
X-Received: by 2002:a05:620a:29cf:b0:7ce:e89c:7034 with SMTP id af79cd13be357-7ceecc47330mr3414854485a.54.1748510458182;
        Thu, 29 May 2025 02:20:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFARviQoTt32XuVus+Hg1NVtxvnQWat2/gBG0kwZldF4ALlWhMfHSvxPfbQYwCTS8VMYZNGFQ==
X-Received: by 2002:a05:620a:29cf:b0:7ce:e89c:7034 with SMTP id af79cd13be357-7ceecc47330mr3414852185a.54.1748510457805;
        Thu, 29 May 2025 02:20:57 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a4efe73ee0sm1390768f8f.46.2025.05.29.02.20.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:20:57 -0700 (PDT)
Message-ID: <81e34c57-d2ed-466a-9ab0-8ea9e7ee437f@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:20:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] ASoC: codecs: wcd93xx: Few simplifications of code
 and extend wcd939x
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=683826fb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=PGxqiohRGJHFK62Qb5wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 7Obi6LZlK1ZksD8YYV9TTd9mOxmGnlQx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA4OSBTYWx0ZWRfX1VeuVDgPVOIH
 Uw1U0icaRjZYxNk+6bSG1qzuLKLxIVdPCltduaKqFr/WICRm5HEeuDAajiZBlOMwxnFX+dhnvNJ
 dGWXzsJznYTSu38Ly74SZ4wxCqoLxnf+8B83MH8o8Xjrc8XfG/8cXjY7ktkNVFKSkBE8vHxR2cT
 7Jp52WhINLrn23rnAANKGdne25ckKceYyeqd1q1YEoi6KtJR2wr+ndtzjVdkoSXQU6suhQZX/D7
 /QheQCC9mAs24eN+d65YeBOcyDl/fZ6vZN1+wRmaV4xVnD3VqYdb+zV52wLrMC4EBm7uCM0Q1hK
 K+b7bm39k1HYcHtYqRGVu7ljo3W9v/27KtnwhyNvMlS0w6aeze+V46qQDjy/AmuhNv5bHKco55h
 zafo8IpctB/Iee5VOVQQqubAQUsOokylTKzvlqrAp3jdUxNZV2/cl4EtGo4S97suXeQmGCiq
X-Proofpoint-GUID: 7Obi6LZlK1ZksD8YYV9TTd9mOxmGnlQx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=722 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505290089



On 5/26/25 11:49 AM, Krzysztof Kozlowski wrote:
> Make the WCD93xx codec drivers simpler using
> devm_regulator_bulk_get_enable() and obtain missing VDD_PX supply on
> wcd939x.
> 
> Context depends on fixes:
> https://lore.kernel.org/r/20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org
> 

LGTM, thanks for the cleanup.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


-Srini
> ---
> Krzysztof Kozlowski (6):
>       ASoC: codecs: wcd937x: Simplify with devm_regulator_bulk_get_enable()
>       ASoC: codecs: wcd938x: Simplify with devm_regulator_bulk_get_enable()
>       ASoC: codecs: wcd939x: Simplify with devm_regulator_bulk_get_enable()
>       ASoC: codecs: wcd939x: Simplify return from devm_gpiod_get() error
>       ASoC: dt-bindings: qcom,wcd939x: Document missing VDD_PX supply
>       ASoC: codecs: wcd939x: Add VDD_PX supply
> 
>  .../devicetree/bindings/sound/qcom,wcd939x.yaml    |  3 ++
>  sound/soc/codecs/wcd937x.c                         | 31 +++++----------
>  sound/soc/codecs/wcd937x.h                         |  1 -
>  sound/soc/codecs/wcd938x.c                         | 35 +++++------------
>  sound/soc/codecs/wcd939x.c                         | 45 +++++++---------------
>  5 files changed, 34 insertions(+), 81 deletions(-)
> ---
> base-commit: 3717d2adda1ad07b4ecf3bef144ee489cc1563a1
> change-id: 20250526-b4-asoc-wcd9395-vdd-px-ec173383bd02
> prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
> prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
> prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
> prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5
> 
> Best regards,


