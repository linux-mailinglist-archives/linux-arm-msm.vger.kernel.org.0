Return-Path: <linux-arm-msm+bounces-64424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB46B0082D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 18:09:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF547189015E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 16:08:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76ECB2EF649;
	Thu, 10 Jul 2025 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oICxTjVT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE092EF283
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752163695; cv=none; b=h74UaDWxE+NOMglv1O9olp057uo388X9EqFRI4XCRRQtrvO0ixKlxzsNJGDPPppyxbcSviweCm/zHbaOCGwZHun7X2PI2Bx/Qm1m6Kp+byhuFkaFtN8X1XOBM31WCSR0La8dlI733DgyJ1ZefFXOr814GrmAyar7KMqfsORb0rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752163695; c=relaxed/simple;
	bh=AVD1kMYGIExMzyPsfxDrCf9QKtVSrXXMN1oDchn4Ths=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bs+V9OND4HPpz06wjTv7o8ti0SUNPXZx0cz91v093ctC9wKawaFpDtFqJhgpwaw5tGryjoreIKj7k7JfgQ3lgjPOqs5TRo3y1gl6prHgmyv7MwbA1znvDTojm4pOkyobhOyvRcmMcXwAK7SeEGVzp+Xd4B+0bztuxHUNACeFjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oICxTjVT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9G9hl016991
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NmMTiOE75i7FjR8nyzZQYmPjnfwLoajGbC1p8IPyPcc=; b=oICxTjVTTYLH+iWr
	6+w7QmCLd7z4BG+4ChHHt8sMtOzGpBGwqtV+QOZw6LlQtFPTQ6lSOboFUnr9PD05
	ckcyb2f5EfWeknq0dqKOewrVVdEB/vu7MO/LwpHdp9SlJo2qkfsQRlZ4i6sEGReF
	OZEUlI31/IIR4WshBdrB3gpYgAl+gPMNkiT1moiFtuaf0Q2ynEt2AA9uBCBmxIZv
	ES8T6Pv0fKHyYFJRn2Mz1LyN0IjflmGkQCRqeFc9TMJQVBSnZMUaOjS46jEml0kl
	hlTFxKU0W2xWVB1f6bDH50vqwKDUg4+1SMETLX7PqVYBf1Uw6L+mo+5QQULKppCG
	QaVFog==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbnwkc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 16:08:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d21080c26fso18524585a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:08:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163691; x=1752768491;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NmMTiOE75i7FjR8nyzZQYmPjnfwLoajGbC1p8IPyPcc=;
        b=CATAWHUWusylFzIbN4RxbfEH85GTN5egUnauk2mVBrB2jFpMRKzCCO01acc48kIMjh
         MntpwjTAjBM8gq2+jfsnFhkshOIpe+4YoueMHVyEOtT/94yIF8NUrWys+aWyQ+rvj3aK
         IXa574EGCe+r+PfaTlnXp9IwLMvls2nPRTExbuRlEhqLTFkS7wJqv1R6ATHQA5Yg//ud
         QNehinD8dbJeBbnXtF3UHBtY/gZT/Rkp2HJkPM4i6II9mLj76ehQdBntayJgpJQUXAC0
         psU32Yio4V58u4jgzEXU7s+0AIG3ZqvkXCL8Yd6Ys0MhtIczhNoLe0y8SDdx9e20TyMa
         DybQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS4SZpvAAxySi+49DakP8Su4C1CnYl9W2vzAIihramXGSc98fzH6hDcgBP14LGDyzrQVBRbPIfjpiY6qaR@vger.kernel.org
X-Gm-Message-State: AOJu0YzeFoqMgIkIHKT26y1ceMohPC/fgE3LuN0p0fkQ+R6RbtrjXU6U
	7bNoihTqGVeTQ75B+sSJ/Taxpwd1sQe48+NsCwD91uqJIWsslHz5NtQoDL9reUCbRcHwI9FjS0N
	R8A3E3dW0Ovi3JjsPsT7nh0Wce4ueF6SNlBKbu5ax0cehhB/6n379QjuaV9KfGTvfa09G
X-Gm-Gg: ASbGncudOBgNJJbOE04mkdfRaBBUiD2gvU8sZFTCMNoRH1vq/le6xQwHdw0r7Yvr6Sn
	mhDSyOVUsGAicJAxGaXhkQJfxalIdJdAuhWzGbGjXZdxJE3d9R/dpFUWaJXlUQaABMX5+VCS1Qc
	Tq2fPXXfgGaNg+EnV7eZHgP9gVh8laR8W5pI7Dd1BfIGIEzhDO+/pSzIpfwg3SvSmW9g9QqZ7ld
	QRdOWqg9qWCMlli3HlByHO6DiIsDWQKnonzA9kJRgPloyS87aGVTDbitIeMJTMu181OA4XNet8H
	yQUBGhjyk/3K9riYiefuTubZq1hPg1sLTW1bYciznC4dfP0K5MXpcKqh6OUmgx9QxelC7EuxyDS
	PoQw=
X-Received: by 2002:a05:620a:2099:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7dded2e75bemr2036485a.11.1752163691091;
        Thu, 10 Jul 2025 09:08:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHISGQpxtE/AyJnavWSuFhqb8t726eVkNgkSU/hbrzf+VDGUVaz0Z0DftzVP24+mMp8ybyoZQ==
X-Received: by 2002:a05:620a:2099:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7dded2e75bemr2033385a.11.1752163690359;
        Thu, 10 Jul 2025 09:08:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82645dbsm154521866b.93.2025.07.10.09.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:08:07 -0700 (PDT)
Message-ID: <c57e130c-38a7-491d-945c-7d5530d4fb46@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 18:08:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] regulator: qcom-rpmh: add support for pm7550
 regulators
To: Luca Weiss <luca.weiss@fairphone.com>,
        Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250625-pm7550-pmr735b-rpmh-regs-v1-0-cab8ef2e5c92@fairphone.com>
 <20250625-pm7550-pmr735b-rpmh-regs-v1-4-cab8ef2e5c92@fairphone.com>
 <bc27209a-e0f8-40bf-979f-3d747c501ae8@oss.qualcomm.com>
 <23ae6ddb-682a-4c4a-bd63-f0a1adb6f4f8@oss.qualcomm.com>
 <DB7I7D3P01FF.3T5WRSTJIWLVK@fairphone.com>
 <c1a48230-c4f5-4c04-a53a-449bd90b1fd8@oss.qualcomm.com>
 <DB8FM0YYS9UL.JP6OVNZAXWBP@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DB8FM0YYS9UL.JP6OVNZAXWBP@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNyBTYWx0ZWRfX5b3ZlCxmH41d
 6v6HqFzCLUogzsLHoX+vYbyylo/24tJZFQl3shDzEQzJbKZ/8RrFcfKUN09xzz5JSKdl0xnsM0E
 EJVEQGKyKa97aNG2q+yAPEKOUUwlSx9L7n7rz2xI3KO55ePXD8BO1KO7ecI01rjZzPkdsRTcUC2
 rixF3E58hX5d3NFlhRZR3V6FGjjjLa3PhGGp8UWNSZKXANzSPqpdg+/9Tn12bjHy1g3IGYvwcjC
 G+AihBgk80tdjvUIFoeAPMzrG3M31xPEeEeYvpSVLR81uBD5Guoc0e6fD75De1j5iCAwOlW2G13
 Vm5s7GCnUTGy9W5bMCJrusuME7HsJb+tq3tFTRQ+qOrtYFsKb4KE/AHa7bcNP8bUzkk2zDzA8BI
 N2RcIcUbj2rHNLoC20gd1LSExX99GJDxhSqHeMhuYgj2aZ2bHjwvZtiaGMnbYXWgk6BBZgn2
X-Authority-Analysis: v=2.4 cv=QM1oRhLL c=1 sm=1 tr=0 ts=686fe56c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6H0WHjuAAAAA:8 a=1rhfSWexEic9pWZXMcsA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: QJGXNmM_QnUL2XqbjkxEJ0Q1K30v-vB7
X-Proofpoint-GUID: QJGXNmM_QnUL2XqbjkxEJ0Q1K30v-vB7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100137

On 7/10/25 4:06 PM, Luca Weiss wrote:
> On Thu Jul 10, 2025 at 3:03 PM CEST, Konrad Dybcio wrote:
>> On 7/9/25 1:56 PM, Luca Weiss wrote:
>>> On Wed Jun 25, 2025 at 4:20 PM CEST, Konrad Dybcio wrote:
>>>> On 6/25/25 4:10 PM, Konrad Dybcio wrote:
>>>>> On 6/25/25 11:18 AM, Luca Weiss wrote:
>>>>>> Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM7550 PMIC.
>>>>>> It has 6 FTS525 (FT-SMPS) and 23 LDOs with 3 different types.
>>>>>> L1-L11 are LDO515 LV NMOS, L12-L13 are LDO515 MV PMOS, L14-L23 are
>>>>>> LDO512 MV PMOS.
>>>>>>
>>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>>>>> ---
>>>>>
>>>>> FWIW everything you said in the commit message is correct, but I'm not
>>>>> 100% sure how to map these LDO types to the existing definitions
>>>>
>>>> OK so found another page (also made sure that the supply maps are
>>>> indeed OK)
>>>>
>>>> SMPS is OK
>>>> L1-L11 is OK
>>>> L14-23 is OK
>>>>
>>>> L12/13 -> pmic5_pldo515_mv
>>>
>>> Based on what are you saying that?
>>>
>>> Based on 80-62408-1 Rev. AG for the LDO515, the Output voltage range for
>>> MV PMOS is "programmable range 1.504-3.544" which matches "pmic5_pldo".
>>>
>>> But yes, in the table next to it, it's saying 1.8-3.3V, which matches
>>> "pmic5_pldo515_mv".
>>>
>>> If you're sure, I can update it but the datasheet is a bit confusing.
>>> Let me know!
>>
>> I was looking at the same datasheet as you and took into account both
>> the LDO type from e.g. Table 3-12 and the output ranges from Table 3-24
> 
> But why, looking at table 3-24, is there a mismatch between that text
> "programmable range 1.504-3.544" and the table on the right saying
> min 1.8 and max 3.3V?
> 
> Programmable range sounds more like what we'd want? No clue...

>>> (3.544 - 1.504) * 1_000_000 / 8_000
255.0

I would asssume there's an 8-bit register that holds the value,
hence the >>>programmable<<< range may be larger

Konrad

