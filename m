Return-Path: <linux-arm-msm+bounces-88045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E41D03F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 971B034E0FF2
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BFB4311F4;
	Thu,  8 Jan 2026 09:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYqkHID8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XBFKmzmT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B94E43531D
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864184; cv=none; b=UsLZuCJHlqQtHvJh3zCB5MzB5ARQomZitQIyESPqKYshPDeHfg4ND1UfuRbuhaT7Xn2Zolqucaa082UTLE0RFflINbahpEbcen5LSDJBBkmJfcKAq8BkP9MbWFEAfLhMt6mghMOHZc74S3Q0dkjGQVj8bPm8fmv91u/Gv7bmDzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864184; c=relaxed/simple;
	bh=rEK9eOmfwrcdm9xKIPuyi2yOvQ6nKX2oKik+EL0r2Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a+l8AuEy+RNwt4+lHBovWt00x0IG4jvlVQHoynaWi99VUcLhbmk9FgjmADXF9Ajg8yKRvUcLTWxtA6/uXNKnP8mmIwDQ+lLXcbXlh25NSsPQSUKEV3wAYpvB/A/ZUVe2yZd05mDuxueDmU9RYobG/1IpEVLziZL7s9MVgSf9BUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mYqkHID8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XBFKmzmT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084g8NV3751433
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 09:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=; b=mYqkHID8mg2NfpF8
	gqQcF0cxspHvu4+F2yjd6y/tJ9Uqj/hLpuU10za9QN/bjEQOsCrGJP0GR73LkmRl
	4UVnKKZE3pantLlDnLBq/eZAKZvrWhVa+1AgsKaGaBnd0PUBcZzKHo3MjqemZR0H
	8fIlZ2W6U6i+bUDhihG5ZkUt6Xl1IZ+LrR2y7zke+srPFoLchlm6oplP2+iE1e/2
	ESlPhKZbg0f9CQdZHSxbiqSas8groGlYgpabrEs0etQ9W59QUWMfeQibh9+usZyU
	5PiB8cxZTANW1A6enj95UlbHWFKSsUqWhGUWmXs7/Lv/WdLxdKrgZSbTDfUFd7vk
	tjKeFQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhuxctnqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 09:22:57 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b196719e0fso92249585a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 01:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767864176; x=1768468976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=;
        b=XBFKmzmTNIO1g50RLe6gqTF1W/AbhJS/feLzFeA4mzph5YHLI3h0H76Jf6kEkmZSb5
         8zPYvKka8rGKw/25GvORKgANOu7IaJ9qdClWxd67mZKLf7cyOmD3dXP/raI1tfcJ+ito
         7PPOeveRtstlOYnRmCaL7IeQag64tkTy9Lwi1MHjIAUwOJ3m04doXhPB41YJ3YDr+D4P
         QwKSxTGolw482C5B0wpNip4LhbkcriJt0ulJYL9Lbh6oQSfbyqT9O5ChTn8EYkKrLl5v
         zfEvE+jw6ydDOFj8mNeelqjXPfTqLg2t5BnNw8x/NKgS4NY7mwfdEhBWr9VUMX58H2Aa
         KeZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864176; x=1768468976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4qHXzXN/j3GloedtwAbja7LzZdHCV0m7/7mZLc2m/8=;
        b=hovlhqdIm/h846YjBjPilEqUs6LzY9uisGaxc13L1N8h0yJwNLKfTpHvjTWhi5VIXD
         tN5Wn/Ui2IDIXnHwZ5GDahCR4IgB2uYp3Aa+xmd3Igc7ERO8yYo/VOqz3odolLx5jdyc
         7bQ1SpNSe7oHBVwYF7VomIuNHdLD5OK4sEMf0cTfK3TsD3UAY26fuV/LXECCoGCk8tc6
         Bei/ykl9XIrfy8mu0ODEBKKbCRDgHIZ/NjH1b1N9iPKZzKL6D5DpAivKgIa/+mJ3s2du
         TqtibkxTpzJxMB/5JgPZrbmpd0AXrknVYieICsk/ohRBzF0tdfEdV1A8odYYTGCK1ktY
         /GFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0tY5o/Kwo6WxbApScQKL/SNlboscJyfLgHB2xrFwJhq2jxKxoZ2W9EQI0bWQOhPi1SNApbMiPue38TJgd@vger.kernel.org
X-Gm-Message-State: AOJu0YyFllN1Pl6DL5NAIDCaPwQVhlF6JaF0I2NU6A9eSO2/qFNfKWur
	znTGZAavGtfWFJZRiMqRhrvBmRIYV3OT5j0yI/gfaq2462TbWjFfgKuG71pgViB5d8cVJKgzPHg
	3u4KNutAyFXRPxkY3KHVDt9wk6UCN5M/ya4GKMO9scyrEE9I5sZK2rOkBlfMPF0fHg79p
X-Gm-Gg: AY/fxX59+GvQR54TJ2RHTngzkuwF0qcObAc9pmcM+fSipg4H9YrWq6Qu5whNs3UDepf
	Ttagvm1syeV7aivIwFQYvGAYzBIWQ79XeBWMADNjIz2VUAWaxhuyQ5L6iY5yNXpboVONHFUESiI
	q1vKYKYelk/9UQxsC3OhWFzIjk/V13F3+VVlQ9epRVUEsomSIcMtCPebGoDm+j+18hpxD3Bvv6k
	pqi8fGTBd8CadNf49rc6bEOrk4/USJKkxpDhtbsyhRwsGaYD8Stouw2cq7IHHpz3ud9+YCOCpqy
	hijerFYi/i3jy2RYyFUrO1ZWBJNNNZ8mFQQelkR4yYG+Y6rZn7B6hNvz1Ru5r3k6yY9J3vMaY+P
	nuB/BSnSRnKiZeKdEdk7bCfsqM5AA1MuZZOVj4Lu/Iac9r0e1uFEVZrEllExwh0yCp+I=
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr508523085a.10.1767864176215;
        Thu, 08 Jan 2026 01:22:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzo9qVwE2Z0L9gMrnjAB3lduyOMVsOLQ8jFn4jFHZjA763oWPC0dpsRmyX5dSTtMfXTGlU5w==
X-Received: by 2002:a05:620a:40cb:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c3894104edmr508519885a.10.1767864175781;
        Thu, 08 Jan 2026 01:22:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a230db0sm767583766b.2.2026.01.08.01.22.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 01:22:55 -0800 (PST)
Message-ID: <0b768afe-8bed-4ee3-83af-45bb51faecbd@oss.qualcomm.com>
Date: Thu, 8 Jan 2026 10:22:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] backlight: qcom-wled: Fix ovp values for PMI8950
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>, Helge Deller <deller@gmx.de>,
        Luca Weiss <luca@lucaweiss.eu>, Konrad Dybcio <konradybcio@kernel.org>,
        Eugene Lepshy <fekz115@gmail.com>,
        Gianluca Boiano <morf3089@gmail.com>,
        Alejandro Tafalla <atafalla@dnyon.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20260108-pmi8950-wled-v2-0-8687f23147d7@mainlining.org>
 <20260108-pmi8950-wled-v2-4-8687f23147d7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260108-pmi8950-wled-v2-4-8687f23147d7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA2MiBTYWx0ZWRfX/RXy5N+9vdss
 i9qFh2Ibwb6AnonTah0hkncDVZScyXHrPT1vWmG4OW40qtzUHx76ZjE+gI6163kt36De14vq7zC
 vra2Z3PiS79sbFtD+VTPijo96hsoK/9HGvIhDpziX5SYoR6EYMkcVn7j8sGGeAT4mk/VeAj3RIi
 P0usghnGdHA5gGG02nVrnzC2QDMR+HDU5s1RRjqtWFrdzziZD8lN4Q5sD2txgHFHkFN994s2mZm
 EKcyS1LNG0ezmS3LOL2ufBsl7cLJtElEIW8n0cfEcimM6l8/mr/06JmUPcB8qXlOatVVqBiMqSK
 559/CJK/JpVGkiWFCT8KgvNni1e6adnQSQaFtToWKAmoq7KpP/5pYoDUSjNngYddihx87ZqvcCS
 IeaemsWRo1+MCi4/dOKb414ZVM4hHOg2vXK9k3Z1tohwDxtkUqYIhgbOKbKvgugmpw8eR3Sy1Ug
 EvieLacztEA6vJ7l2vg==
X-Proofpoint-ORIG-GUID: cGBrWjcCX_erY36KScKRvooJD7ykfjaF
X-Authority-Analysis: v=2.4 cv=SPdPlevH c=1 sm=1 tr=0 ts=695f7771 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8
 a=x0-Ntm4DP0gVEan9CnAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: cGBrWjcCX_erY36KScKRvooJD7ykfjaF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_02,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080062

On 1/8/26 4:43 AM, Barnabás Czémán wrote:
> PMI8950 WLED support same ovp values like PMI8994 WLED.
> 
> Fixes: 10258bf4534b ("backlight: qcom-wled: Add PMI8950 compatible")
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


