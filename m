Return-Path: <linux-arm-msm+bounces-72619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B629EB49614
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 18:49:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AC9E1616BE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 16:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88C7930F53E;
	Mon,  8 Sep 2025 16:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWoo2BWm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207EF183CA6
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 16:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757350162; cv=none; b=cRp7otPK3xopTcQfVq22rbWDc38gZDVXCmBD1N0x0BCrL3dPHFSTwNtBkKLq3+TLNNYS6zMezgKfBj5H/8uLbgxZLZvWq79Gultzz4y0LLrryYi5mX5Hnm+VpQXTb8/H+PbYbWqOsBAIZikDsTiHGo35LwM/gIK/wGtS8SUbanw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757350162; c=relaxed/simple;
	bh=c03Lsp9g+s3ZUQfrxI50tf7mrulwncy6J8ERz/IJdF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=liJIe3wFt6Z4wLrz0VyDY5mUShg9T9N/afDT50lbPiyEA8gALKVBtTGfYxIKsDTUc0mGskmrqwLFfQGpyylQCxjB7k+fC6NlkeV4GOuAkK1ED9cMae2l9SCAAQQaRxudDnpV9XQI4k8qJ/lge46BYPUhyrT3ls9i5b7pTiPF+sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWoo2BWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Diwpi005565
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 16:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TOMlKuJgvjAl2wbNgrUtIbyGV3gXkbep4YDrso3Os/g=; b=OWoo2BWmjx+yIUc3
	MO5SzcHPNtwZdQIA8PCIKO31LNgsMDkQ1hdhc78d0xge96cYO4rpl5obdVFtZkAW
	tkeicnfjZetwGtMsSCHOGYPADaK07E3uVm4olike16TqV6tDnmwb8Z0H29+ioEeU
	uoWRbO20+wV2U4243ZCYAVaqgVQBvcJaQlKENVRioPNRJUD49vixeQ5ITQlLZXdv
	F72Mq4WYV3ZIi2vMZqZV7EDF287CTKcqIWpni+jE+vzrdyFxQdi33i2tFLy+M+tC
	b5sxGIy2Rytfr0cIVI/Sp2G6oxTlv1yeVcdX+VDYLnlMSc8dQXF/XqtKjLNA6Z0O
	zUEeQQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37ssm8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 16:49:20 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77260707951so7848832b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 09:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757350159; x=1757954959;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TOMlKuJgvjAl2wbNgrUtIbyGV3gXkbep4YDrso3Os/g=;
        b=SHceh2eTBovSuuCfGxQRvdqV2JSviVrsDXmhyMGpdtNYyKDTO0GZLjCCDaq3dsrpFz
         S4qN5tLDXbttGpzFqJxSMZbRmmOUip87Jt5wKCVj5Zm03l5kiFXddqNUwTnQB2l8USOI
         8a9a7GJMymKZgKfiqA6GVCJ6q5NuAZ9o2un9VKs5J9ZSEvU3f7AFDAdNRgD9rMGZzSvi
         dSWiDMQfStd6JdM1Jd+VEaI198LIQJ097qrlpD+K2WCUb7b9NzLDRm/AnO7TRsBHni4g
         kA6YUxe8rUV0XHUUuVqt1u3lGGXDalgwG8J1wntzYWzca3qKT10j/JvOBpPvRlHUu8+P
         SFtA==
X-Gm-Message-State: AOJu0Yyv7hoHvN7gl/R8cp14R5p8rnd5fjC0h33IaWguHNtYcgB61x2P
	ulfspJ/1xWJMMNjaV+7incoBnZ7JR/6suYnGKtHxob8fezTFXSel6XH9NgvD8b/OqeMR6KihHGB
	vLuNWE5n+OAwMwTCT/fCbrzQ6gPclrgt1yoc3KPVwbmCUXMz16LXbOPY+bgYj0hUY0PNk
X-Gm-Gg: ASbGncsLNwIg2PWJqDO6o5c6BY324pkBGR7SF40IuQFNqeYmaCn+gl6WJPiezbf+Z+f
	ekW98h3wXrEwnCM5F93Qv4wdKRUAbTiY/4QH6/Toi7rkCy84SpRt0Nqy7BIlaQcnRZGbCd7ymb8
	mvQ0VjqNf8qjIxtsa6xmEdwpqREt70EzyKlpQtG1p1CYUIj7A9SEqhVnw6TCiJEgRcRSONQJHaL
	r0RZPv3QwEF91xFL7vYPz/sxSxjAAyT6T/ZTdUhGFgnCwsaExSxp8tee4M1BAzdEEq6Fgp6PDc3
	Sl6LgRVbZz4IZNSDl5TBfeXE5MxklOyo9zMav2DB9jngnLF5/Ogw3XVsrNGgFA==
X-Received: by 2002:a05:6a20:72a2:b0:243:d1bd:fbbb with SMTP id adf61e73a8af0-2534775a1e6mr13236796637.59.1757350159285;
        Mon, 08 Sep 2025 09:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1It0dv5BR9m68fGngu0EK/yeg+C603sZAq9ZhSJtilPcPbfpfhlLXJ7uaZ1TlMyG2wUj1rw==
X-Received: by 2002:a05:6a20:72a2:b0:243:d1bd:fbbb with SMTP id adf61e73a8af0-2534775a1e6mr13236761637.59.1757350158859;
        Mon, 08 Sep 2025 09:49:18 -0700 (PDT)
Received: from [10.91.118.43] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e5b44sm29578565b3a.88.2025.09.08.09.49.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 09:49:18 -0700 (PDT)
Message-ID: <dc2ce606-52e3-4ffa-87f3-ce4c42b055c4@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 22:19:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/16] drm/msm/a6xx: Poll additional DRV status
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
 <20250908-ifpc-support-v2-3-631b1080bf91@oss.qualcomm.com>
 <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <77cfd9d7-c3f1-4e0b-8cf4-8567611c3a9d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8srBB33gzGtOoR-cVnvONUbs0zFk70J7
X-Proofpoint-GUID: 8srBB33gzGtOoR-cVnvONUbs0zFk70J7
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bf0910 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MmCsC9iFmiawHEAYgzAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX2PdY9fnTetE/
 YeElOOY7N3IHo4eYLJFtfsqLNAkWWxIXlI5REs5rFS+h4DHJNDhq97a4AmWlEcBZ3xhOcSaFp/T
 PBToWnslhIz1ZnONW++kmSgQMSCmIuBBF4RO4rI+tGeKyd7ci1M2D71039svQZRCMKzopSLyWMt
 GJd834fr1+EDShXwahYxmkEFd0NqMf+kgZKBqeFy2geKoW64JxflLA+ZT5pYntiAu4fsR2hTv5m
 UZMoQePq30v4dlA60YOJ8SdHFnxPtYlp1dSTP2tMHRXnACLam4i+x+BpChudX9XjTWVM8T9gNgB
 tpkZXHBZdoeTQD/mQ85Hj2hgSfKnYGt0HpitQMTEfTRmck/8j2ZkbaFzw3YCnt10SQCT4ZQykX3
 6g/wC0Mh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

On 9/8/2025 8:48 PM, Konrad Dybcio wrote:
> On 9/8/25 10:26 AM, Akhil P Oommen wrote:
>> A7XX_GEN2 generation has additional TCS slots. Poll the respective
>> DRV status registers before pm suspend.
>>
>> Fixes: 1f8c29e80066 ("drm/msm/a6xx: Add A740 support")
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index bb30b11175737e04d4bfd6bfa5470d6365c520fa..06870f6596a7cb045deecaff3c95fba32ee84d52 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
>>  		val, (val & 1), 100, 10000);
>>  	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
>>  		val, (val & 1), 100, 1000);
>> +
>> +	if (!adreno_is_a740_family(adreno_gpu))
>> +		return;
>> +
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 10000);
>> +	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
>> +		val, (val & 1), 100, 1000);
> 
> https://lore.kernel.org/linux-arm-msm/002eb889-87cb-4b8c-98fb-6826c6977868@oss.qualcomm.com/

I missed the timeout value update. It is not bad since we already have
the same value for TCS3 above. Will fix them all separately.

-Akhil.

> 
> Konrad


