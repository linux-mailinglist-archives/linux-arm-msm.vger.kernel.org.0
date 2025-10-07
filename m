Return-Path: <linux-arm-msm+bounces-76217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD0CBC192C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 15:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F21174F68B6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 13:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5952E11C7;
	Tue,  7 Oct 2025 13:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y3WqfNXH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1012D9789
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 13:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845167; cv=none; b=JW9XHsfFQsSaRkfft7D5BB7eGxURk+XKqlNstay91FbMMg5q6NPjxF6FkbwXfGq3jXbQxgwCNhK1naw45jN5JOo1enUtWVw3XJal/4WdmyWMYvUMIWEcBRYyd3dSJR7dM9W33Xbi84o+Go110yoSWnGRMz+NO7qO4y1Nkiqlf1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845167; c=relaxed/simple;
	bh=f5quxsD7kD6Ih9GEhCBk0VqY9TBIGBE9qAz7H4Uv878=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qXmJYvmk+SHROFlpJF48gscV2jPzF+m5X2Jm08z42D9EC3rlm2K/eyqclSjtqMin1MwN5mpVshCC0X9jy8PT6bWaFEhlkr18l60gUj/zJUDGlY27pThbM30Migr+FfoEtR81ONcZXj/xr+Kcd5BFXIJkeU32PmIAoJit5SppZMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y3WqfNXH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597A5gev006173
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 13:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f5quxsD7kD6Ih9GEhCBk0VqY9TBIGBE9qAz7H4Uv878=; b=Y3WqfNXHWWrYHtS+
	BDgYT68WoDhWcu2R5JHS49VIqXT/TWGRmR701oy4hxC6ndSR420niwdpD9AHdmG+
	/j71wZCnVcEV6CIxKzsi4paE174yQoVeKupmA/JMjJYLPt+iwAb69Zq7fGPBC/XH
	f9lWmRdlHyuSNy31HU74p7BMDIPGUlsFuw6wRIO+WJQCnLSqhgbQneR3rABu4jXB
	xLQzE6Qcy4qHt8cAciGAkvSLOXCXbbPNTSeFDHwbRX1NPVDZoHz47g2SbkWq9YH0
	X3EFBVdcvUo3mWqkprhj5Y5ZZ6dOZTylj1U1BvW/hNgDbYHE7fu8WyVZDpqPLAmm
	gayWsA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6yed9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 13:52:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e231785cc3so26181981cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 06:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845164; x=1760449964;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5quxsD7kD6Ih9GEhCBk0VqY9TBIGBE9qAz7H4Uv878=;
        b=XHm8V2X9ZFGvdxDs8YSUKxWt5pQKv9bPTRt5+cWK/0T3z7O/mXwQlkMYG81gjkopdq
         v70bT3kf8Tsol/w2GDvO/bteXQFlJa0Co/jd//pcjn56qis6xa4Mt3esPkDi386RXYAd
         RFTGtXic3bEtRUydOAt9MZ2j64aRZkLg6oiOym4KYSqOSB8EnUJfBQmZzhcHYOOGs3D9
         2jloEvXa1G8ntjilTQtSFZ5+66MlliPCFFxoOac31OLO5VCkmcA+T1KkJ//wG8eOzaQI
         Crn32YGxpm4wvkLdMza9ytZfeHi+jawn3HPmVfF1po8Up+Jzfsh/74xMZq74/5ob/yGz
         AZmg==
X-Forwarded-Encrypted: i=1; AJvYcCXeZ0FZM6Zeg2Fvn6UpHMyZCv3gp1eaxoblrwfzNIYjm4eHbQMvvYi5Qn1YDSgBOQF2H4uNF2d8BW/CMVw3@vger.kernel.org
X-Gm-Message-State: AOJu0YzlhjmfIuOj3k6ISAMQ7P84jVRNPFgy4a/gqpPMkq4Bm7/t8gIW
	96jnkHyR/j2KIlER9YFC84RtRX8GxLqS9ZJo7q9M4kUg/JNLHBfjbuqd945u3yV+y7qsqf1kSJL
	QN7zfyfesKbeN6bg9SLM2ASdjMJiQSLCtotCO5S0/tHGvTEWH83RTTrdUA79a1+IBtviF
X-Gm-Gg: ASbGncudoUrroRhhs3Bo4uSUWZkYD7V6LeAwSvjrd1s2ZUNefheF7QekVylp9/av309
	BDqHLmXOZZMnuLDtQq58Q4aM/UogID978JmMOvmYpNY/pD7F98BKDlq/8H/4a1OZTjsihldZm13
	gCqBDFLoeFiJy/NEwHATWF1O7M9KFML/ym0DrZD88apPZ3wCwayWCnEtChg3idvWFEBI5AZBgir
	9o4EfWrXShhMppksxdZ2SGGzN1R8gAmSvSrHwcY03FAQwcOQytjW9rYdWYNSJFuGxKJUNfrEVjY
	M6aQ3LPC+2FB0X9jvIfvwHgB5oP6poIeByALSaA/2scnZq3Ng8DWLYwb3Tos4lq+YkG4+HKRo3c
	EqGVlXKrIBlRcvGE9TPGRfj6Opy8=
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr148653581cf.10.1759845163793;
        Tue, 07 Oct 2025 06:52:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrbYCke4RKbJCWVLHrYFekPQqhct84fVVqozOHno+gW+Ehu+hQR4MkHPlWeZtq07QH/BIUVQ==
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr148653151cf.10.1759845163203;
        Tue, 07 Oct 2025 06:52:43 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5007639379sm109584766b.48.2025.10.07.06.52.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:52:42 -0700 (PDT)
Message-ID: <c4498ebd-cffa-45c9-ae7c-ea59f475e10f@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:52:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/13] arm64: dts: qcom: sdm845-lg-judyln: Add battery
 and charger
To: Chris Brown <crispybrown@gmail.com>
Cc: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-3-5e16e60263af@postmarketos.org>
 <772be3c8-751b-4f96-8ed1-fc8033babe74@oss.qualcomm.com>
 <CABN5=wFgARbrhqyNbgQ_iMKPt8M7ixZPEhvXVd6AY+Jv+7=YWw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CABN5=wFgARbrhqyNbgQ_iMKPt8M7ixZPEhvXVd6AY+Jv+7=YWw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfXwwuwVGziOHsu
 TSaN01dLI26RLmwU2xZtydAmfBJjBrNLL7L6sOOdT43Mpc6Vup7kCF0YNDMrdmjw3UWzW36wnJf
 0BOLrnCOFAgxm2Zoo1Gdt/DwDYaxM0LN27X4f3tRxC3zLDUYiHkmnGaUgvxhBKEf1FVL2CV2f3j
 iLudWXDSihogZJnyHbXXD997Xq+lAEas5+ZfjE6vsRRoc11AZKSVnh/o5nDYKEE8iImu8bqCe96
 WNoYEoWhpLSa/1zYk5CMoY9hHupcdsI7vSGfm4Hl2iYSk/hkzdCP5cH+1SCgRNDFDJKA09WLOfb
 WgzSlnjQue1Xu9NNaUZsJSPWvoAhb4Fz9HIQetaxRnWrU+po4gm5FPT2AUK9VOCyv33NayJH01R
 VdZZm8aPdrpAQh24VakJB3INyqtD1w==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e51b2c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=NEAV23lmAAAA:8 a=2WuTmijT5FzHyVTfSM8A:9
 a=QEXdDO2ut3YA:10 a=8veUMr47oZIA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: QfVOLcyc6fSgiPsUbwTsqSdW_6eHsbv9
X-Proofpoint-ORIG-GUID: QfVOLcyc6fSgiPsUbwTsqSdW_6eHsbv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 9/18/25 3:29 AM, Chris Brown wrote:
> Source
> https://github.com/EmanuelCN/android_kernel_lge_sdm845/blob/U/arch/arm64/boot/dts/lge/sdm845-battery/LGE_BLT39_LGC_3000mAh.dtsi
> Small assumption on my part that "fg-cutoff-voltage" has the same meaning
> as "voltage-min-design-microvolt"

Hm, I suppose we're not getting any more information

As an additional test, would you like to discharge to phone to 1% and
check what the battery voltage property says in sysfs?

Konrad

