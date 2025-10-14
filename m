Return-Path: <linux-arm-msm+bounces-77157-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F93BD8B91
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 12:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D50574FA823
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 10:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90A5A2F5327;
	Tue, 14 Oct 2025 10:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfvTtqIY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3912F1FE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760437226; cv=none; b=IG0SaGLw7zhoUlaSzyIaAilHHjctaem1tBFwOOBV/U5H4XPE2Hl3tpE8xXPwLsB7rnKYNKxVNfNo9GxLQg0sdComAHmPO7spICzYaj0y8oPg2IT5bD73RjDG82/ZtEHx2XXZgbQ3RUxGX9c0/osCTGEQ6oT54LShBmUsgzxdASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760437226; c=relaxed/simple;
	bh=Qvhh7mhFr0661zRDew/ivjX1TO3y1BkBL/5uZJKd22E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RUx7R3VVZhPYrmsjKJ4Gsi/hdGrJ1UnY9Zr3JltgkYKSxr+cj/jvTQB0p6a0JpqQ/R//xvB2QUuKljIJnk3Uql+lK6SzCjw8W58PZyf6dNyG881T85Qt0s7xexd/5CpxvFZmcVWdLlugmFlQyvZ/m+BpBOXQlXvBvP+Cu7l+Tfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfvTtqIY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59E87ISg017770
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qg1zK5JAFJjGuIOCOazR3tLH7idR/RgyyF0X8S0PXM0=; b=HfvTtqIYxmwEbRRU
	DkJMj1y8g7FU14nI1ruXY73WzyhEgelY1d9kCDbMXZiQ/bKqUzRh9Wqjiajn4uUr
	k2G3b0r9MhwwOtyfATSvSzuf7AzS+W6N/SgLLJi3QfKAU54a2BEViFR783mIBma7
	ntiapDPxlXl9XX2TZ7B3uadM7Nv60X0DgtLk+18HNypjmhmrLVcTAnv7eua71s16
	o7ZOrt7RAbplLI1ZAN0dPbc2hqiXIMMnHsC/3LlJZPxz+2kSRSRJQbA0wi3Bl6lM
	9kriClDZdMJO4ueIxcjiuTov4NyN+WlnGfk3RkfeWU87mOhVqR9srYmtwyEKnwNR
	0MHSYg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1acdde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 10:20:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8572f379832so239940985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 03:20:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760437223; x=1761042023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qg1zK5JAFJjGuIOCOazR3tLH7idR/RgyyF0X8S0PXM0=;
        b=H+iJaYdOig8qiG8SrKfmN+IvDpUy7onLVWXGdaVQMyUQs2j5MNH/WzLktOe04Dq9nq
         J79FR1oipUUVYnKFGOXd0ra78SQ5bJ34ZApboUnicBkw+gtbOKQUq8BeXjlW+Dp2+eaa
         SSTGew6J8nZMM/6ERrb/6xj/YeJe2M2e1e4T9mJERsTMpwr9OXagJTGStk816cF0LxR0
         T9BqAiBK8xgSlWSli1vS5xFx3193KlvlZAJXSnWFT6EVAWoWoMJTK/u64vM6DvAacSXD
         Xzz3PWxHFeDEk4mdPN8P28U9rVN0qkJNSvQbeESsdR93BdHh+OlQ9ZxBKrGUxlh08h17
         9xiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1sr1zKWvZka5HkINdW9vjYEXMV8EoxQwsUyIOU0Jvn6YMeLGyljiQFX7SUcxvqm8PKve0ubXblMRBQEsI@vger.kernel.org
X-Gm-Message-State: AOJu0YxWIunMNE8VP8jLF21jooKhWipY4LLljHJmmh/mrIWm0l5U4Smn
	7vGwyjAk6pEWhAEQpFzg9dYjO1UkuMIESfcvNfE3u0En+dy/P/hQYiBjCWCNZibTFa3zMv3XZDN
	CxFV6RpYdqu7lyTWDcut0T9dmFEoEjewUeUY+gL2UbwTb/CY1DHb7VQ3xX/BvGShkoVbK
X-Gm-Gg: ASbGncv80fRd8iOtx1xjsTZrFutUabNCB/RgY447d7If7LxowZi3/MEPjqvO4irlsva
	53usOj4Nz9hdZXd/OYYkO6u+lIe6Jg4DP/tm8M8pwOgp1VDc06RZRl85C0jcCl43qmjIP5Vjm/T
	1RvX4m8I2DymD0NRp3OPOj4nf10tfYoQHbQzAY+KMguhOqrXIkFzVMOQ0nqbdtmuJXdH+c4hX6n
	cusGuOewuTLZyO2fjJBITxpnZL9jE1jvL0/J2BJ7t5Uoo9a+Uao/jb2W/xYXYzAN0i+p5NxhdR1
	ejFGIMM9HzEqNErskqwH4IdtWaCw9iwXbo52yXZB8MthfXjCKDspimksZgASM99ZIMP396ocN/e
	pIMMLIAIuoy0jMGWFQDrvnw==
X-Received: by 2002:a05:620a:1a95:b0:842:88b9:7b79 with SMTP id af79cd13be357-88354304c1fmr1911800085a.11.1760437222913;
        Tue, 14 Oct 2025 03:20:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhACPoRGOSBddWY7B1Zhb1PqL/65a/EZxkxDjzvajJ/izAyHXkGL6T59GOfpPRrXCVWq3PbA==
X-Received: by 2002:a05:620a:1a95:b0:842:88b9:7b79 with SMTP id af79cd13be357-88354304c1fmr1911798185a.11.1760437222462;
        Tue, 14 Oct 2025 03:20:22 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad80bsm1095409966b.16.2025.10.14.03.20.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 03:20:21 -0700 (PDT)
Message-ID: <0e1ee660-e620-45ea-b1f5-b1608099abba@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 12:20:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550-hdk: Add SM8550-HDK Rear
 Camera Card overlay
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251013235500.1883847-1-vladimir.zapolskiy@linaro.org>
 <20251013235500.1883847-4-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251013235500.1883847-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ee23e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bWvAVwea9cAggUMJ640A:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: cVvyLUzrXvN5YIZI8hY9xoc6r7TigxEy
X-Proofpoint-ORIG-GUID: cVvyLUzrXvN5YIZI8hY9xoc6r7TigxEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXznTH5JcdBCj0
 Vxu82IRp1nGqigdvTHGAm7xbrFrd3rVWvOxiahqHDVVjgow6OObAfOcJS1jGPi4rsRrhurATGFt
 R4a0loPe2feVKjakJhNRza/jqi/ymGDRLRuEJavuKgGERcviukNrPrWoMZVPtZNwe5RiwszeGxF
 EWJt2pBpMpqJ2bG/nNzaUCdo1fan3+rhN+ewpzikDRYRx5BGhWA4r9eMCSkqrrMuT8UOAShgWYI
 dHZo4As7b10jFXNTXEBEYBSZuQcadnzDh6Z5oQqD8FwzX839odbnlVqAHvOylXzgq0UO2tnOYsN
 7tt2DzDFZyWXfs3Uswxsq8v+ogdjjVk87IXlxOl3UXnSwiFmPUgkOG4/XpBIt/BwAQ6Yd05Guuw
 o1MBjP/bmvLNUO149oQbL835lxPEdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On 10/14/25 1:55 AM, Vladimir Zapolskiy wrote:
> Lantronix SM8550-HDK board may be equipped with a Rear Camera Card PCB
> which contains:
> * Samsung S3K33D time-of-fligt image sensor connected to CSIPHY0 (TOF),
> * Omnivision OV64B40 image sensor connected to CSIPHY1 (uWide),
> * Sony IMX766 image sensor connected to CSIPHY2 (Wide),
> * Samsung S5K3M5 image sensor connected to CSIPHY3 (Tele),
> * two flash leds.
> 
> The change adds support of a Samsung S5K3M5 camera image sensor and
> two flash leds on the external camera card module.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

