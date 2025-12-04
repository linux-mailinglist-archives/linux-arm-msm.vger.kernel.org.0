Return-Path: <linux-arm-msm+bounces-84366-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C428CA3C10
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 14:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EDA073121F4D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 13:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674BB342512;
	Thu,  4 Dec 2025 13:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqFv3iHA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P3WNQ8ku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78A633F377
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764853843; cv=none; b=hsgVrboXjqz9hmGK6kbesyhI0OF8zNh35nUmAQbDX1pfr6w2I0XvqcQfgyRCw7BgCp+uTtOLw6XnMdQwaPfeJJ11wJucWXuyAeKlPVLqDO52BKxJX1lgM58+nn3Gtme+WGz2t3OJ6iR79CqiAB2JXJSWEo2EV3llESgJK8pH4Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764853843; c=relaxed/simple;
	bh=gGu+paqPdC7mnHt9rPYBqZXYrdM76LcBZv7bVEm5vA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p9brRfaAxVi2+AapYQUscSS395z0aJy/KKnm0p8fK0bGF++MCFeks1c+5Hb2IOEjfuJmvkWPunoevte23srN+hJVLass9EIFQQHZ1r12SbyzP7jeoDd4jsIYKL+YFx28xLjw+XeC8RycqrGduZBoga0SsHyJ4FG+AuN1Hp2sI38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqFv3iHA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P3WNQ8ku; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AEuWC926199
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=; b=dqFv3iHA/AWscMfT
	XmV19C7dBQ51O2gGGN34PlVrHuNtuzY8+B2hwucwHavQrm5v16imz0tw6bpj57Vt
	uWSS0rOW+k6gcl9g2uYjYGm2O5ViPSo6laRXs9OJXLG1a6R9RRP7TzhbjR+IeZqk
	TWV5OO67yFhGmmLLVpJGpA7NmUSpjRdwTGX1X/McdTEJ6s7oCdY5D7Fumy0Q3zvJ
	Tpm6CpzdoX4nIQBLBPWrkD+H8eO294HbdJTm6FsdUaPgYJkqIF2w6sG0GnG7Eh1N
	4aKbNx3rTrn0toEA564IFjRufwuzzlhO8gkbgaKJ9dAh956qPO6j7dzC1qpCm2hy
	siq0Mw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au5m312s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 13:10:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b8973c4608so2512431b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 05:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764853839; x=1765458639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=;
        b=P3WNQ8kuwrXceDP1Rk4PITfDO9IMT3fPuAscWJYXiG2WTnc0exrKQuAu8uqvbHAhaY
         oFHLyRJ1zjCUTrf9d469DDHosacuuEPtT20exnyWcvbCqE/y+ttuA8576Nuln1jneyQe
         2Y97/kkA+5GCfD3mME4/VTOTG1hiBtleaqxPyXDJ6rupbMxRRERY9U4feDN68WxOjd0R
         7xXr1Wjg1HYyhf0L2VUDDhPVI2B3OGOAnXWDE6u4pkpl3/+pWsPl85cF43IW+vU+fd4A
         IlL/3pQkrQZXZnNyGZ14YIZ8++L0rWUMV06orAawFEK+tJkEZibq5wW9qI4tvXqPo6bp
         a8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764853839; x=1765458639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m2K2dG+OAFsTlsLCX6kJRr1wk8NbZkGqj6db/5frYcE=;
        b=CtWVzjZb1owQNQDzg/TbCqRoLeUdxJkByWYhvYon+5j3x8mFg+gMtTc1Ss24RL2dlW
         wO5dpu0eFbxQ5Npz0/luKmdz0iatskDTmz0MrnAyWnWTiX9NmAXJWQZaSIhW2ZvuhC52
         l77yyqkbr9YwYveXVrH9094gEE07wqRS4hYY5VMikho/Bn15+JIwqg0BRg87P58IPVsN
         q35/en7dL1gZ5lNEylNtkYs3ztMABux3nBCw/MTzdd1n/nuXqrazgC5qvBgBSL8YFkYV
         5meM5sfV/8bcUG6tQ0iQANANpeiW4xIa3aWUZcr45p5c7iL4e1A6kossVcMr8aNphlTd
         vc2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGoFKGvTfqASZHEDxxVLsif2YI2M2cMUGzmSV3vpTKTbRx+lxgqnBQU8ohTRJYPYU5MKevmcuoN8AC6sJY@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5jFwv7S9Gy+TK1CCeFLNBaTn1ERniUoZtkleBvSrakutSGpC8
	Nn+2cbF8yEj71qqfR7j3L4xaCGk7taO3QXK2RouXDc3jSfhaGYV9N/TdhXFGWKu0p8vyHTt1uhe
	kOWc//cIzucLAQkA4/q1PmX/uwVHNe2/HklNhEg0mRJQbzMzjqIshzQKOZmaF+u0QC9pI
X-Gm-Gg: ASbGncvjyIrQU+g4991nr9nvl4nbcDbxzoeSs6gxoQbvg3sxUoMDV6+4xR2yaNkppBP
	NV4tfwNreCK7yJRQ/7It+iVB9NNAuAGHOshZFd+7mvGAJqh6wih264ZqTBCiKaOgZf5NPRpgLkR
	W2uMU7vSOyVydvfXB6n6Em5m/abU+W/r6n18iygVWlFi1uD+RTASodUcwPdIOBMbkaSxXXQXr9n
	11AjulvbThBUiq8z1/JTSvWXjeW07gP42c2/MR83or61xYskgaYYoatkr8EQKJn6644M3piMEnU
	0yRHa0wInm60l8rW2Ura3OAYjbi6+jQ65o9E+8wW7R8IvHNuaDP0ViQSlDpLjURSDCY1A6kPYV1
	2RZNvsrx2/5xCcKBnD1sICn7WY5yxNuXJhg==
X-Received: by 2002:a05:6a00:3a1c:b0:7a9:c21a:559a with SMTP id d2e1a72fcca58-7e226e2de0bmr3219786b3a.8.1764853839416;
        Thu, 04 Dec 2025 05:10:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzWjvtqQGT91E8vkBQvMcAoAvWRgDe3oW5gq4ULEbuYC5TSGRTZv0nuedZ7pKUKHPPmAwtCw==
X-Received: by 2002:a05:6a00:3a1c:b0:7a9:c21a:559a with SMTP id d2e1a72fcca58-7e226e2de0bmr3219746b3a.8.1764853838937;
        Thu, 04 Dec 2025 05:10:38 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e2ade44a4asm2174039b3a.36.2025.12.04.05.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:10:38 -0800 (PST)
Message-ID: <936b6a48-a5e5-4efb-be7c-215ac670677d@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 18:40:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] drm/msm/a6xx: Retrieve gmu core range by index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-1-9f4d4c87f51d@oss.qualcomm.com>
 <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <9cc55934-6980-4673-8501-2d1efe2f816e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hKQLC4nuu5Z-7_Hhh7HyKM5V3fDfEvNc
X-Proofpoint-ORIG-GUID: hKQLC4nuu5Z-7_Hhh7HyKM5V3fDfEvNc
X-Authority-Analysis: v=2.4 cv=esHSD4pX c=1 sm=1 tr=0 ts=69318850 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8zqzhdr9uPwxYiBKMiUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwNyBTYWx0ZWRfX32RV65OYoNmt
 lo10MsctupN5flWF+Rk72p8EgiU0tb64ChodbRmS37xQUAVUQj8g3uCEO1sMIV2w9DKEm1V3up8
 o/kbIXJ2tCkUuocKjRjlderL2PI1ep3NQ3gimnJixzLOdcnmK5t3PbPTdbYBFEHQJD4V+Ni67qW
 DChZ3uQLqvapUKjPO9K7iMbM9KlJDezO9SPTnqfy2Tks3R9775qy+l0NkbhNSYf0iTSgI8yG5wt
 M3Wzr1REPqlIElOQMKWLPZvdmFkkCst/YxdQNc4FVkFcc8YG5z0jyeeZyGKOgNNyUSK+P6qJmIg
 IP8QZmbN2u4OLdqUuwDgCksJOllC2k1pyQDNy4YIrCBtQEoBtm67J9by9NFKjg2QMgRzCZ2qBnD
 oGbnYgRyyanz5pDuLFdC3og8OQo5qQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040107

On 11/22/2025 7:08 PM, Konrad Dybcio wrote:
> On 11/21/25 10:52 PM, Akhil P Oommen wrote:
>> Some GPUs like A612 doesn't use a named register range resource. This
>> is because the reg-name property is discouraged when there is just a
>> single resource.
>>
>> To address this, retrieve the 'gmu' register range by its index. It is
>> always guaranteed to be at index 0.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 14 ++++++--------
>>  1 file changed, 6 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 5903cd891b49..9662201cd2e9 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -2029,21 +2029,19 @@ static int cxpd_notifier_cb(struct notifier_block *nb,
>>  	return 0;
>>  }
>>  
>> -static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
>> -		const char *name, resource_size_t *start)
>> +static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev, resource_size_t *start)
> 
> Can we drop this and just use devm_platform_get_and_ioremap_resource()?

This API seems to lock the io region and fails with -EBUSY if the region
is already in use. I am worried it may regress other chipsets. So, I
dropped this idea at the last moment.

-Akhil

> 
> Konrad


