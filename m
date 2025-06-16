Return-Path: <linux-arm-msm+bounces-61490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E644DADB75A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 18:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A076188B75D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jun 2025 16:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9976E28850A;
	Mon, 16 Jun 2025 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5Xd7REY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF32B2868BE
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750092516; cv=none; b=FUUHDonTjpmnj2u7myl4lVddc59qabAFAm3vavp6DwFdWYggHnS3HM9iQCYK0dM4orfVTCWs19/bLTqeryzJFmHJZoUkw9lhmEbNPWRUKgNQbtEwNmHn7GUr2bv/3PJdxGhb6GXbRowOGcwNF/zAqCLO4JEA1M3H7uspTT8kqh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750092516; c=relaxed/simple;
	bh=/h+0C0+QWS3aA/QPz3SawkeyoNRtLolokTJ/FYPaC3o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pKEZDN44pR3JjEUrsEAFtqI4DqTU3m+MWBAm5BgCSuv9JqNsZzv0WqGI+EUg3Wyow+fpWKio3GxMx+lpLVMV/HZRkZtK67qBDO6mTf51isuHMzrMAacQkfWJUlqJfTm7Z2y4KMX+csZUmki1Yl1Z20aJ3Sxbw0LguK9HjeASIzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d5Xd7REY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G9AY8h027925
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=; b=d5Xd7REYM3S9gnS5
	n7bYGFpFbiw+1+kJ2EqZbnWEMgfB2xuele5T5Pwm9aKsDRA78/EKtOy0F2QNTYzT
	KJvLT7ey6fAz3mjnpAWR432o8QADvN+IEnRwpM9Yj6bc0Ge8sjvzz0ZWiAwbFZTq
	nSepVk6eUNbh2ajDno4AWOc80XhTQlCWJcNa+Xm0CfPGPAoe58ojfQ9t2H2KbETZ
	z7mYYqFgR+aN0ahVuhbD8tNmbaw4ythr6pL1F0kGDSq4MFutDxLYRwjZC/QWS+ot
	Q/wBmVMGl0R5Qzntex2p8lKoFoNZds64/OuZsZjde6FVoaFAvIo75Ja0bP5wgTr2
	Mlo+Yg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crn7ff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 16:48:33 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e73d375aso5060799a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jun 2025 09:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750092512; x=1750697312;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=;
        b=CQj8YdE1rbQO4iMHkrFaa1HvmnR9EG1ihQBJZO5Wb+5888SdoVBfjL2CCCkH+0HS+Q
         rlS+1mq6PRXkV+7at+B+KkUO8cncaAiX37lNP8c9hifNElS5o+U8Ev7Mss+IHXSuar4d
         eVLyBE2OQRT32BouW3godMtMrx9wMTfrQf1GHRLcBJ0BOmCv9cUUt52NqV/TBLHITu9r
         eMcn/Zy0CBm3dBgy/B/DJAc4VW9Wi291cUuC8e2W6gLlYM39yrP9spMgPm+2GA76Tdy6
         0bls5GI+YXQJxpHEQB6hfN7qkLI+EbFTFC8o/SzQiUtZ/dZOS5YETrmCo8wERmdcqGyJ
         vXWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSAe2HTjZGUJdeH2zSAbr3C76UqC0w9Dbzl8WF1cTZgLdn+VxiIN4MvkNgRvc7ZbIsyKux9/YW+80lU1Jz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd+ezPx5xVQko93yweerp/8PnsZAk7i7QGPaMrqgOu4m/Ja1OS
	FwueB3FbYM8A7YIVJ7MW0OuK9se+q2OcaEJG6AR6BXYejnsScJpVzXoYQ3klBxcE/zSEREmdG+R
	rvNjwTs0BzSKvySAlo6VC5NJdMaCGoBoBD6pAG44Ocz3ABLCfaNaP043VMepN9+t9Xwv5
X-Gm-Gg: ASbGncu8hTEbFrcodDtK9CfldElY4W0qhPLiXXMgwzYFaK9Ko1n9wXA0+xccLns7B20
	InPNHCx9xskj5EQFKG4U+xWztoHC7RZyMydSP02hMgaYjk7pQrF19mzaff9ipFNNykQn7LEkHfi
	V/Ia795oWc2Y+ywGPDS30MWrfvl6dF/ZqExBLo/JXH8km8xP9mkpmPQIZ4QK8RKuQRmHBl3rq+W
	9V1X6uv1klfNKqy7+03nrAo2lK/J09oU7Poc+L0e4mHVmGMnsmkFW3YIo614AJzudQUl+50fmcP
	wu7sRjbjyqyGlQn456DFmZ0ALM6Q/iHvykg94dBxNA==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id adf61e73a8af0-21fbd4bbd5fmr14908417637.12.1750092512624;
        Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiRsfJISsTnkxLW8qZGNZNt7p0Rfn9bVYWR0l8aBesdxG90+o4bb4c6x4zbi0HdUx7zVZcJw==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id adf61e73a8af0-21fbd4bbd5fmr14908365637.12.1750092512245;
        Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
Received: from [10.206.104.82] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680454sm6019135a12.37.2025.06.16.09.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 09:48:31 -0700 (PDT)
Message-ID: <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 22:18:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP
 entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
 <492417fe-c086-4980-b108-0487bad08155@kernel.org>
 <d482653e-5c0e-4b03-98d6-2c898b445917@quicinc.com>
 <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Tauyp040qudIYHGGuQ254jOxK2yX6osj
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=68504ae1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=DDAlTcr3_WI9VELS8V8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Tauyp040qudIYHGGuQ254jOxK2yX6osj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDExMSBTYWx0ZWRfX3uC4JO/Zbe+4
 FN3uVN2nmFy2X35XjioV/8ybmSPP1DzaE1yGbAEVd6RwbH7NKuznBdGRdA1ZDU3moD3Mcr8cKhc
 RMmEEQuPaCBof9DbyMm41KISmJrOtIallO7kwYh8NP/P0tjboMWZJ2jy/9kkv68x14PY9Uq6TCD
 4yj8FjGwlA2ep8GUocYHFMBWrQgCp4wXGeeHcN+QgMEGP/8hqVrguaKXBWPtm3r8UQ9cKF66ucX
 t1dkzgDRHi5vBYXOigPomnndbaLgoQGOngtf1VMH8ZLmRhVi0rvPKhDatz5UmSl6moYW0Tzp52U
 o0jmxXSzzfRIfKHj/sb2LT6VQMbD7irOoGqduP4vpGmdDcX6DQ1qV0kYKKh5+R3H7I6ToDOKDI9
 owOFBJOfANOgppBsYuyABWTDY7W8wBN1ik66cKVqG4SGjJsdguqQtyXry8MkE6oExsLieUAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=969 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160111

On 6/12/2025 4:59 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 14:24, Akhil P Oommen wrote:
>>>>  
>>>>  patternProperties:
>>>> -  '^opp-[0-9]+$':
>>>> +  '^opp(-?[0-9]+)*$':
>>>
>>> Not correct regex. You allow "opp", "opp1" and all other unusual
>>> variants. Commit does not explain what problem you are solving, so I
>>> have no clue what you want here, but for sure opp1 is wrong.
>>
>> Just to confirm, would this be fine for the requirement I mentioned above?
>>
>> "'^opp(-[0-9]+)*$'"
> 
> No, You did not solve half of the problems - still allows "opp" and
> commit msg does not explain why "opp" is now correct. Describe the
> actual problem and then write the regex solving it in specific way, not
> causing other effects.

Gotcha. If we want to be super strict, the regex should be:
^opp(-[0-9]+){1,2}$

I will send out a new patch.

-Akhil

> 
> Best regards,
> Krzysztof


