Return-Path: <linux-arm-msm+bounces-82377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F2EC6B0FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:56:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 9731D2B835
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 17:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 617A832E13A;
	Tue, 18 Nov 2025 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwmT8sKI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SpKi6BDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657B73559D9
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 17:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763488611; cv=none; b=WKhwcSjHxa2qAzjime7Ymk6TGmqu383dGq4b4YPY3he1qvHkuUFL/om/lpmmgjqOcwpmKc4EFVTF+W8PmGqnsukRs3E+KMOL446EawRRzV2DrDtnlHyYo0U5KpP6Q+NmgEi2IoxYPOTKfaYkS5VPa8qMzkz9uR3Jvgf2gb2u3vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763488611; c=relaxed/simple;
	bh=uf+40LotPEMgbLut4129kTZe9+ZPzyHrW2kpACe7kjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GrceU8K/T+3trl3Nn7r3xcS+AIR8alCNpwFhV5RPVl8/FOnewDcaCTNYwgga7q38uDe4UfSikpav6VHQUr45D1ceyMk5JNjhzSz6gU2eMha8qPrT3Hevbd8F0vIEHTaJ4Rj4Ciewkgkrj6cRfJG6ELLEz0QLqbg5zz93RnABm1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwmT8sKI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SpKi6BDm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AICAsUQ2802392
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 17:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=; b=VwmT8sKIt895LNEz
	nwSV2POpOiQMw4EJCsVpK5GouVyWWNQZJ1P6cik/hjPgO4GxpurwtjD7LuUnMYb/
	bPWDsi/sXEfi4S4XbTcgu0LrBRo0GYJXljXPaMAy1HqQy46w+FmJZM3bHqzPC1hc
	GkpMr/ezsxZFq8ynz9hbFSU5g5Nh45FC4OBrq+/RBzt2KRz14Obd/pVyhaBNphZB
	R2BBcweU7do7EBFhZTez5gotoEl5BwAluHE2aRi/TUC6HiKkB0RO314WJ2lZZB/K
	cSGPE71k5SWTGHiMbjNPHDdNRjI9/XXy8OccCbSEnVG8YXLYT6lTMfst37Ml9csq
	d1XdFg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agrk211ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 17:56:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-297e5a18652so68053285ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763488607; x=1764093407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=;
        b=SpKi6BDma3BpKLZ73FAbk/pqyQrutlytKEAGG2WnKTLb0cH5ppkOowaxFERtT4d1EO
         ZVfVAaGjqFFFP/Zvsf15n9GF4769ZCMYPagZ4WO7VFEa9SrwxSrHaBQOQx9h+d54GFeN
         G2V/8ODrREmoE4h8GIl5t+0g/tNfMiIXt779xU8NtN9TO6ZqbOxrFk3KYviNF5WA5cq5
         4DGwGP6OvOwkSzHRB5V2Yhp7FJ2FjlCRaVb1zD6TwFB0RVAUn+Q3Cb2Ebyt+kjcfOzJj
         k9mKaXOmW/j26+39C9Mt2K5iXXs+1LoBHy6w/e12sw/bR7GQP4nIggRLSLjhywgKyLY6
         ju+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488607; x=1764093407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGfq3+o76gasNqjhRUD5fDSxtMn7/maZ/Vlsn3dafG4=;
        b=aOcnszslPMLq2x0PdDSGslQ1rMAgFoIBmWzMtTgyhsJKYfGktkMCxZ+d487yV6p6xF
         0gbFFuPd7B363vyfvfZOwVKA5GaYmEyWtMPkUYORIlwFZlQnuC5qCNqbKvhceT2oKXzy
         24zWPnEk2L5ZbAeRoUk6273z6m63oq48gLVfRnAWrNYUxfHZz926AgNCxs0LVvlSwIdO
         ejXJXgCIPE0PA9BESO7Bisd+TbUTW6pzV34wvR5G9+qbK0zIn5Cmk0u/IHVD0ewKeuMK
         s2tsvzw8F0rlwFz7koH8LWV2Ht5WqckktkWAQMGsE9dNTPoIh054KIoZfsJXBUIIdfFZ
         3qfw==
X-Forwarded-Encrypted: i=1; AJvYcCW5zdWjZg3Ia76AVRXxNxmAQMGqghCpiheQadf/c0H8yU+ugswn62n4WOzeXhj67k7mSUz9aAix42YCh3z6@vger.kernel.org
X-Gm-Message-State: AOJu0YxC2egtmx/pDGdt1qLsGNqV1JCNBkN5JgjuVVQIQsaiGnaJb+5i
	Fe4HAAwre8TYD25b+7/2STKncdvlvyoA1Ts9jWrpXHH8ZflVEq/LC4YAslVdB5ig6Csz/xHTyJb
	d7yyRwDCVrxGWc2KtFaQNa499rSEk7CmaUp/GWiahpujKXNHOgss0gI9ysTH1LXRSUf0v
X-Gm-Gg: ASbGncu7WkssNGzt5q+gKIV/G61QcCmCUaNbE2GFdYrolKB/TgF2x3dE5Rw0w5BM20x
	42uvi+9qEDmScGFF/QQ2LlGHvnx+XB5L14F4qRG698+1elZwwHs0G/dpH+SZ6L3sldKEUrsV4lL
	PsO+WjZJcOJh+4I0Ovvs/sEu/pJZ6KaadtYFdR8X47C8yrOjPtioLD9O8shyzVqzHihLuE8CsAj
	07XpYFVXRbCLrAvjtGOzJKPWW7a7WtuE7TxzannddR5JggEW3vnKiFNA0JBKupV+9QUP8ZyBld5
	iMhwThYzQYfmwOyUvjaAUh35oii4h7JXL27VRJIB1xEFer8UN078rSvlm2wVBjJK/sTUrgnKv41
	9ofpOdyWHr05ODlgymxZISlw=
X-Received: by 2002:a17:903:388d:b0:298:8a9:766a with SMTP id d9443c01a7336-2986a76744amr178497765ad.53.1763488606649;
        Tue, 18 Nov 2025 09:56:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQlMErgROQXlsJJoTVKsYRv9QN0O/2YGJMmSrS6nuYJu/7XEVDBts4CiDzoWr4bcLhtAddlA==
X-Received: by 2002:a17:903:388d:b0:298:8a9:766a with SMTP id d9443c01a7336-2986a76744amr178497255ad.53.1763488606089;
        Tue, 18 Nov 2025 09:56:46 -0800 (PST)
Received: from [192.168.1.13] ([106.222.233.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346b8sm181565255ad.16.2025.11.18.09.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:56:45 -0800 (PST)
Message-ID: <dcaaba7e-1073-4900-a4c8-88dac40be434@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 23:26:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/22] drm/msm/adreno: Support AQE engine
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse
 <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org
References: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
 <20251118-kaana-gpu-support-v4-15-86eeb8e93fb6@oss.qualcomm.com>
 <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <CACu1E7HzsnSjz0SiUJT0SMNJ7cFhiNdtUE9jKHpvD3UzG6EegQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a6Q9NESF c=1 sm=1 tr=0 ts=691cb35f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=/VsID1VB8JbHTH3F2fYZMQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=neJfBgYAGg7YAZYFY1IA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: SQ5CMSg-JupUOaXWBJ2vdac_6U5ljBnp
X-Proofpoint-ORIG-GUID: SQ5CMSg-JupUOaXWBJ2vdac_6U5ljBnp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NSBTYWx0ZWRfX9ieij2b50x1r
 H4LCgWSi90fjDtryqzUUMAq8GXFK9dcC9AFXqRbR1CtQnZXT1isGkrjNWRrNn135fPlnp/g/ADB
 038qhNlmeS4mhzIjtcYup4xFce3Aexb6RgdfcmCBkuX2hlWe9tQdRBD5BkEui9tAHZHqtjuOUCl
 jBeQYnhW3rKMP3a4dj+tvc3KBXlRKWssVVoA6yOU4kpEKOE4XFgZCKuuO+pg+iher8eErs2WPHg
 yYkCvDmyjr/MCNVwS3Blsqgv/JYKgoYD5hKhlkI5X/FIkytfqqaDP+skUgGRdDztsX8B0a+6vN1
 vmHoQV3iTuiBrushphKbs4CMHD4f75i5ZUCW96iaBW80zH+322/6+EYr48JoWoLa9FdAthf+NL0
 SmXkbWbHyDDS2blPuubccnx7HvImlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180145

On 11/18/2025 9:26 PM, Connor Abbott wrote:
> On Tue, Nov 18, 2025 at 3:53 AM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> AQE (Applicaton Qrisc Engine) is a dedicated core inside CP which aides
>> in Raytracing related workloads. Add support for loading the AQE firmware
>> and initialize the necessary registers.
>>
>> Since AQE engine has dependency on preemption context records, expose
>> Raytracing support to userspace only when preemption is enabled.
> 
> I guess the plan is to expose MSM_PARAM_AQE later once preemption
> records are in place and for now just load the firmware to ensure that
> people have it?
> 
> The interrupt error handling is still missing, but I guess that can be
> handled later if that's the plan.

Correct. The stale 2nd para in the commit text will be removed when Rob
apply the patches.

-Akhil

> 
> Connor
> 
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 22 ++++++++++++++++++++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h   |  2 ++
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   |  3 +++
>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
>>  4 files changed, 28 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 810b64b909f5..9a643bcccdcf 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1118,6 +1118,23 @@ static int a6xx_ucode_load(struct msm_gpu *gpu)
>>                 }
>>         }
>>
>> +       if (!a6xx_gpu->aqe_bo && adreno_gpu->fw[ADRENO_FW_AQE]) {
>> +               a6xx_gpu->aqe_bo = adreno_fw_create_bo(gpu,
>> +                       adreno_gpu->fw[ADRENO_FW_AQE], &a6xx_gpu->aqe_iova);
>> +
>> +               if (IS_ERR(a6xx_gpu->aqe_bo)) {
>> +                       int ret = PTR_ERR(a6xx_gpu->aqe_bo);
>> +
>> +                       a6xx_gpu->aqe_bo = NULL;
>> +                       DRM_DEV_ERROR(&gpu->pdev->dev,
>> +                               "Could not allocate AQE ucode: %d\n", ret);
>> +
>> +                       return ret;
>> +               }
>> +
>> +               msm_gem_object_set_name(a6xx_gpu->aqe_bo, "aqefw");
>> +       }
>> +
>>         /*
>>          * Expanded APRIV and targets that support WHERE_AM_I both need a
>>          * privileged buffer to store the RPTR shadow
>> @@ -2400,6 +2417,11 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>>                 drm_gem_object_put(a6xx_gpu->sqe_bo);
>>         }
>>
>> +       if (a6xx_gpu->aqe_bo) {
>> +               msm_gem_unpin_iova(a6xx_gpu->aqe_bo, gpu->vm);
>> +               drm_gem_object_put(a6xx_gpu->aqe_bo);
>> +       }
>> +
>>         if (a6xx_gpu->shadow_bo) {
>>                 msm_gem_unpin_iova(a6xx_gpu->shadow_bo, gpu->vm);
>>                 drm_gem_object_put(a6xx_gpu->shadow_bo);
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index e6218b0b9732..3a054fcdeb4a 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -59,6 +59,8 @@ struct a6xx_gpu {
>>
>>         struct drm_gem_object *sqe_bo;
>>         uint64_t sqe_iova;
>> +       struct drm_gem_object *aqe_bo;
>> +       uint64_t aqe_iova;
>>
>>         struct msm_ringbuffer *cur_ring;
>>         struct msm_ringbuffer *next_ring;
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index c9cd7546024a..e011e80ceb50 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -627,6 +627,9 @@ static int hw_init(struct msm_gpu *gpu)
>>                 goto out;
>>
>>         gpu_write64(gpu, REG_A8XX_CP_SQE_INSTR_BASE, a6xx_gpu->sqe_iova);
>> +       if (a6xx_gpu->aqe_iova)
>> +               gpu_write64(gpu, REG_A8XX_CP_AQE_INSTR_BASE_0, a6xx_gpu->aqe_iova);
>> +
>>         /* Set the ringbuffer address */
>>         gpu_write64(gpu, REG_A6XX_CP_RB_BASE, gpu->rb[0]->iova);
>>         gpu_write(gpu, REG_A6XX_CP_RB_CNTL, MSM_GPU_RB_CNTL_DEFAULT);
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index c496b63ffd41..0aca222c46bc 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -27,6 +27,7 @@ enum {
>>         ADRENO_FW_PFP = 1,
>>         ADRENO_FW_GMU = 1, /* a6xx */
>>         ADRENO_FW_GPMU = 2,
>> +       ADRENO_FW_AQE = 3,
>>         ADRENO_FW_MAX,
>>  };
>>
>>
>> --
>> 2.51.0
>>


