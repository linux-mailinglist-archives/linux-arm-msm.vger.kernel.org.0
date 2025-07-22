Return-Path: <linux-arm-msm+bounces-66162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA2DB0E593
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 23:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385846C5E0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3102836A4;
	Tue, 22 Jul 2025 21:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ftvMARh3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E082737F6
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753220020; cv=none; b=b3Utjm9EWeAtbhW0AM4CsODN8LmMnT/tTNq0bQu+bUEgl8Y04jGYg2J11fvNTPLMtTjikCigzbf4SctCz+mk/B6EIBqMKpaH2yBUVRS9/01LU71S2qqjo/huxcrIPsmMmOECmBbTgvgNOcIwkaH2X5SWEm17lbhlsNIVVxntgS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753220020; c=relaxed/simple;
	bh=HMCOmcDNpHHGlPVhnj4DVX3A/4A3uJRcWnwWn9P8U70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mOooq0DwUdXBkASWsAmyVk77xrQAhTKyMfQRhgdT/NKYpJYTxldHBdy8Cka0we085B5Ig3Efl1Z0D/A1Q8zSG7jyNZchnHl0xmpBM83kheGHi7cblRoIf9bzDjwcslh6Pb3wRzxdAHsZMF/ljcT+vCuz5jIWzMGrIx5yLmd/c9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ftvMARh3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MKTkRD015557
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9qRWH5+ZW9GBx8iVLnvrSB0e+DqRvlgDbboXKfgFMmo=; b=ftvMARh32A9+CJ+d
	Hrd6jmIQGG6LkxPudAmk09lRXbIhwhWrSYq61QwIAKjYMsA574Ccq0VefBgB9qLT
	N76DtVkPsMD3TzPyUKQx7mMpi1YYd6jtMXvftLvd1T6cOsS0QtTnZpnKyrE82TWA
	POgqg9zD1YkFlWKiapVC5/q1GxRWDU646aOmBCugyDqfmtfLWfjKzwYxo3xthWSH
	nxlVADJ+rApnGFdksmGUdEabQFb//f14iQ+N7vyfVFv0IjilUzhTykLxyTW7H1Yi
	HzlNFZqub4Wu+wAJJ/1b6JmlKZHYeEY2aG3PAGXjt6mUKy2QdReAg/MHULrYZtpV
	7awRSg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w193v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 21:33:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b3510c0cfc7so4106352a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 14:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753220017; x=1753824817;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9qRWH5+ZW9GBx8iVLnvrSB0e+DqRvlgDbboXKfgFMmo=;
        b=uqply48dv8jYnnQodznIaWeH5yjhNWW5m7RVsmS6JnHlLNR3n2TdHjXzRkI/eFBgbZ
         79WGXzBS75LK9jt4tAuumLy5/0Mhby4dCznxnCEZKT0uD5Hlx8ywmSHYaY18/erDFBFr
         OCz0Dq34kudjUrQKBsdhalmGrroJgwXFPw04u2Z56q6Or9wBip7yp59RJ19pxnA4wjR4
         ApYfCqQW6+3q3F5W4ZcrKq5yJJFp7rDSSvanbik7UUc0ov+j/0ou7duOzLnsSSfM4IXZ
         75VDA9TUJwwfEdGkXH+MuTluyrnXAmw89gk/EA3gLb++yl/hnH6LXFXvcC0TONm0WkEr
         iUJg==
X-Forwarded-Encrypted: i=1; AJvYcCWh6YwKq23+SHaFwsw+LLvS1TCRtlXCWYT5XGgLEHRtUC8sk6LqLoUQs5c4fmCmnJl99rmjbSlj7VecwPhU@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7DqEvw5UPyXr1SEvQRLQuzgzm394JlduJhvkAPSuIGKrfv5H7
	9HmEf9vU/mkZBvmDCY4X0KoZ9LGHBhfuvxIC4+izI4T8jXAtvOBUwLSEp4B+kx9bifMzWZD7+yf
	QipFjh6QBsm5034Jfohxa6dAAkD5igVqf0Ltn0hGxwvqwoZwP7ri5tD51Baptm7cPmeY2
X-Gm-Gg: ASbGnctmzBi1I/QbaSW3LVbXav5NbLnFw8gkgQaJa6lM7jGRcTX/GcYX4bncGyKM/Ec
	CXtoa3cf9CgUfCW+wKczs01ikbfadyx4uYjvPNT3pxBAw1xvHWpm4soHhXIr27vOa2c2585K0yL
	wa9oleQEhVqw3l425Qw7dEKQ06d0Cx8WkkNsyo204IGhrTQVBhwRBp9SrqFPrqGJd5ZgVw04wFs
	hWEnC5ueQQ4D0UlQP9HT4pGG93UVhH79pCxOH/t1C3X1zlQLWXSMhlQ7iM+oT1xPIqnzZpfkqQz
	mFWEAVv4LYVCkdZoQan17+8W/yDtoLmTKmDMyCV7xLtCxXx0U8CSEBT7UyHoEtV/
X-Received: by 2002:a17:903:b8e:b0:234:cf24:3be8 with SMTP id d9443c01a7336-23f9820461amr4935735ad.28.1753220014585;
        Tue, 22 Jul 2025 14:33:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHiLcMOkApVl8sBrggOyOYLjHKG4LM2qy9YFRdUAYb7bhhEcERxourvdjtEQUEK9sitkC4Pyw==
X-Received: by 2002:a17:903:b8e:b0:234:cf24:3be8 with SMTP id d9443c01a7336-23f9820461amr4935365ad.28.1753220014085;
        Tue, 22 Jul 2025 14:33:34 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e2de8sm82627185ad.11.2025.07.22.14.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 14:33:33 -0700 (PDT)
Message-ID: <28b85705-dba6-46d2-ad06-ac548528fdf9@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 03:03:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/17] drm/msm/a6xx: Fix hangcheck for IFPC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-13-9347aa5bcbd6@oss.qualcomm.com>
 <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <i4o3ivearks7gwg37ywyqyl4jpmbwnuczac6h7dscrmlepawag@jhedlyj2hzps>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=688003b1 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=e3cV7b4uTqknVPGEt5AA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: uHoTOc-ZDmYrR38pT7ZgLQGwF6bsVqUC
X-Proofpoint-ORIG-GUID: uHoTOc-ZDmYrR38pT7ZgLQGwF6bsVqUC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE4NiBTYWx0ZWRfX1jk7p99w13d+
 pBd587aEH39n1U1oFZKXgejFa7eaaP9/EBqra/gmrvWFOShGJbehSc+rVSlFjMsE5PldZQ60sK5
 vEBdcMdfQB8cih4cUx9RrgOF5BurHWPCUnRRqMWWGUhrpOZG5HuNm4pDRRWxAenm55Dp/OYjIKV
 qyftR5NueeiL8Ip4ESW1hdJapW7uj2yH2t52G84pyCpHk3hXzF8lOr/rybgR8BiVGtGMHFrT8GT
 s3ELvJmQQvRUFVagsLEgZqwB5k6Z5T5nsLF5nPCsbfQkrIoarevfqY2rmQ66nSafHS+j25TxaZB
 nG8Sx8ERH3hwNfKtqf1Hp4d9ikS7N8kPXcfhGeGEjqk/igMRQMkGyVoNb8Tin0+Ow9pOZqWv1yZ
 yDJDecwNFWBTsAA47sDsyzkpRdc4M6gPCasq/fOsa7fcehD3PXWIW1QbMp6jC9tVZOHgYCQN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_03,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=923 clxscore=1015 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220186

On 7/22/2025 7:22 PM, Dmitry Baryshkov wrote:
> On Sun, Jul 20, 2025 at 05:46:14PM +0530, Akhil P Oommen wrote:
>> From the hangcheck handler, KMD checks a few registers in GX
>> domain to see if the GPU made any progress. But it cannot access
>> those registers when IFPC is enabled. Since HW based hang detection
>> is pretty decent, lets rely on it instead of these registers when
>> IFPC is enabled.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++++++++++--
>>  1 file changed, 12 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index e331cbdb117df6cfa8ae0e4c44a5aa91ba93f8eb..b3becb230a94163cccff4eaffb8eed44f1c29ad0 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -2399,13 +2399,23 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>  
>>  static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>>  {
>> -	struct msm_cp_state cp_state = {
>> +	struct msm_cp_state cp_state;
>> +	bool progress;
>> +
>> +	/*
>> +	 * With IFPC, KMD doesn't know whether GX power domain is collapsed or not. So, we can't
>> +	 * blindly read the below registers in GX domain. Lets trust the hang detection in HW and
>> +	 * lie to the caller that there was progress.
> 
> I know that we've relaxed code line width to 100 chars. Would it be
> possible to reformat the comment to 72-75 chars?

Yeah, makes sense for multi-line comments. Shouldn't the limit be 80?

-Akhil

> 
>> +	 */
>> +	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
>> +		return true;
>> +
>> +	cp_state = (struct msm_cp_state) {
>>  		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
>>  		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>>  		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
>>  		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
>>  	};
>> -	bool progress;
>>  
>>  	/*
>>  	 * Adjust the remaining data to account for what has already been
>>
>> -- 
>> 2.50.1
>>
> 


