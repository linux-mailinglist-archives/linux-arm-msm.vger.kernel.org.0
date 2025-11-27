Return-Path: <linux-arm-msm+bounces-83672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E03DC9054D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 00:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DF9813AA928
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 23:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17119322DD0;
	Thu, 27 Nov 2025 23:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RemFNRwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0E0311C10
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 23:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764285175; cv=none; b=r1BNu6cE86kYXxC9x8QVip2JS5Pl1s/UKK3W/6YVT9nwrH7eNbNW2PLKEYSWMZFw6ZEWo5kiCiCOQtQNr2L4Qi904+zwVT1LxNKOsHTiIkl0TiTZzaolv5tM32m7u1glWodJKWlUxbG5RMwt66b6HLIYDp3SjLpwmFquf2GQegw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764285175; c=relaxed/simple;
	bh=wyto1R2GJUCS85I7MwhpNZhD3/bNc3GHhzBsFMtA+9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psbGORjaQv0bJm+BP5Xkjbr32pA14qcGmf8A+vQyA5Z+tIwOy6lEHZy3zawLHFjYh2KiRCSYrJI5+8ka2lqhkn2rE8UYLUZ/yKaxIdofo+Sz+8YQ7FXx9p6Zqikj5TK0dczC/xcQ9tcNvEW0WT27Uha4pKNIdJCjyZUCeCOJIUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RemFNRwW; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b71397df721so219654466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Nov 2025 15:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764285171; x=1764889971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AArP4+DUIM0Nfx2IVwUELwdJRuSoxBV1rN2oDzCFiJ4=;
        b=RemFNRwWYbsSSPtpMAB7XTkl4E08vkZVdfzrqhsQnyKR67/mW04Bk12bYYq2NqhcIK
         7Osj+7zBVZPTs0k02SbJ+vvUhwQkY1SxdDg/wJNksxDykAqLZWygVgWVZyQBmU1V07pY
         StQqa9RyzaEq5IYIYX82gZzvHO/g9/pMqcu/ylt/mfIGZJM/vkait0e7CyhnPtcqQlAK
         AeXGz9vcFIxl11V0Is8PLEQDunGEP61XX0K2vIo65mli0Y/qzLRXBdZE6Omez6VRa99K
         t4AXaaz2H5szi07QJ62MSsMMFv+YXl54ZWD2XaPTUYPDpPu/qR2QHOzRpd+IkAnUWfl5
         b27Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764285171; x=1764889971;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AArP4+DUIM0Nfx2IVwUELwdJRuSoxBV1rN2oDzCFiJ4=;
        b=DfwScK9x4ZfPVwFIac8tAk61G3UfPashzlZ6Pr9Igc0rEQ0JcAk7QbvfHpgVnxTIt5
         WVZqAWnMR3CevG0xgUqgp8ve5unv2vWAG47tM1+jil0pqsXh0xd0ldo15y1exLfmqRZW
         bTNVA97QcYzGVYvlccOYCs0AtJaQFQJQngjDY81gxEq2jzcbowmFIjaF7gxlDM957RPQ
         B85Dq5tDUYkenr4I+QZZhJw1wchEvf4WnYY+/+QsI4W2c1pAdU6iVZFnu7TqTyqh9zEJ
         NAZaZR8rATvYFlxNdIwccM6hZ0adjuZcHQunAEMJPaE/fTgEpqC31LiUA9TX3IpNUWIV
         fKuA==
X-Forwarded-Encrypted: i=1; AJvYcCVivLOzwNBUBlNscB68fAXgUvxihbwUVhzzRvU97uhL2YDI6DaSOZgKSALHcOOui8+jjMoH4x8+rZVxZSUV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzh4rECMAJ3hgDFaYxid94+8ddOSUPFzBz5zIgXVj4Qvz0JkwRx
	pwaKKlRH0qTAkE2rbNn5G7cgCWtffTjOwwyVkSMUsoXLTOrOfOzBKZ0=
X-Gm-Gg: ASbGncs+OTXvKyieb1OMW/qfRcRK9AQpbrRCGgLh9fTBYh9rcJjiDHysi57c0nT+kJi
	RXCikerJlAz++0z/YbBz2f5wdfLcwqhnf6s98blUc51i90zw0Fm0VuBHkREO0XTLZUQB49gZVD+
	KR1GZiezYfgQyICYDSsmMh66wTl4+LIHaI7x6eDo9/FZfd2yQcI8ee0UnxJ8yOZKFHu3iLnV/T0
	qw92apInMLBirezOdpxjOanvS/dzN1NEZpcgoUGfFqMql6EqNGQUXkL5k/FJbulMVGp2TmUml4k
	CDCETzbYh0xDmz4Ltmlea0p2qzmTjayxopTE5TpUGJskJzd0UmPwNGb+EMtyVK3UcQ80zEfCBSB
	dK25duw4S7FUuVhPhNAe4GRsJMdwAoD3pTkt6uxnRjYtaPAdn8W7egquuDgHTe0e77um0L+b81t
	XhZOzfZRcSEaiIQM9B+pDOyXx62zwA/ZR7QUfmkkFhH5QdUiDm6pw+P4o6yMrICsOZbrMx2BjLj
	VhosUuAsXEBPnE=
X-Google-Smtp-Source: AGHT+IEMxWnzG2ifJWh1BSUMm17RVos9fkFVww/FGBjxH3SNJrhVm3/rCAoCO3j22GYBP3LKDHiAtA==
X-Received: by 2002:a17:907:801:b0:b73:7de4:dfdb with SMTP id a640c23a62f3a-b76c5515010mr1164030966b.37.1764285171107;
        Thu, 27 Nov 2025 15:12:51 -0800 (PST)
Received: from [192.168.1.17] (host-95-250-160-223.retail.telecomitalia.it. [95.250.160.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f59e93acsm278805066b.50.2025.11.27.15.12.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 15:12:50 -0800 (PST)
Message-ID: <c7d9f540-b1c0-45a4-befe-177b6d79277a@gmail.com>
Date: Fri, 28 Nov 2025 00:12:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix a7xx per pipe register programming
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251127-gras_nc_mode_fix-v1-1-5c0cf616401f@gmail.com>
 <bf66095e-9f25-4e0f-876a-00f637a7c696@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <bf66095e-9f25-4e0f-876a-00f637a7c696@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/25 10:57 PM, Akhil P Oommen wrote:
> On 11/27/2025 5:16 AM, Anna Maniscalco wrote:
>> GEN7_GRAS_NC_MODE_CNTL was only programmed for BR and not for BV pipe
>> but it needs to be programmed for both.
>>
>> Program both pipes in hw_init and introducea separate reglist for it in
>> order to add this register to the dynamic reglist which supports
>> restoring registers per pipe.
>>
>> Fixes: 91389b4e3263 ("drm/msm/a6xx: Add a pwrup_list field to a6xx_info")
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  9 ++-
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 91 +++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h   | 13 +++++
>>   4 files changed, 109 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 29107b362346..c8d0b1d59b68 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1376,7 +1376,6 @@ static const uint32_t a7xx_pwrup_reglist_regs[] = {
>>   	REG_A6XX_UCHE_MODE_CNTL,
>>   	REG_A6XX_RB_NC_MODE_CNTL,
>>   	REG_A6XX_RB_CMP_DBG_ECO_CNTL,
>> -	REG_A7XX_GRAS_NC_MODE_CNTL,
>>   	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
>>   	REG_A6XX_UCHE_GBIF_GX_CONFIG,
>>   	REG_A6XX_UCHE_CLIENT_PF,
>> @@ -1448,6 +1447,12 @@ static const u32 a750_ifpc_reglist_regs[] = {
>>   
>>   DECLARE_ADRENO_REGLIST_LIST(a750_ifpc_reglist);
>>   
>> +static const struct adreno_reglist_pipe a750_reglist_pipe_regs[] = {
>> +	{ REG_A7XX_GRAS_NC_MODE_CNTL, 0, BIT(PIPE_BV) | BIT(PIPE_BR) },
>> +};
>> +
>> +DECLARE_ADRENO_REGLIST_PIPE_LIST(a750_reglist_pipe);
>> +
>>   static const struct adreno_info a7xx_gpus[] = {
>>   	{
>>   		.chip_ids = ADRENO_CHIP_IDS(0x07000200),
>> @@ -1548,6 +1553,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.protect = &a730_protect,
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.ifpc_reglist = &a750_ifpc_reglist,
>> +			.pipe_reglist = &a750_reglist_pipe,
>>   			.gbif_cx = a640_gbif,
>>   			.gmu_chipid = 0x7050001,
>>   			.gmu_cgc_mode = 0x00020202,
>> @@ -1590,6 +1596,7 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.protect = &a730_protect,
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.ifpc_reglist = &a750_ifpc_reglist,
>> +			.pipe_reglist = &a750_reglist_pipe,
>>   			.gbif_cx = a640_gbif,
>>   			.gmu_chipid = 0x7090100,
>>   			.gmu_cgc_mode = 0x00020202,
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 0200a7e71cdf..b98f3e93d0a8 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -16,6 +16,72 @@
>>   
>>   #define GPU_PAS_ID 13
>>   
>> +static void a7xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	u32 val;
>> +
>> +	val = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe);
>> +
>> +	if (a6xx_gpu->cached_aperture == val)
>> +		return;
>> +
>> +	gpu_write(gpu, REG_A7XX_CP_APERTURE_CNTL_HOST, val);
>> +
>> +	a6xx_gpu->cached_aperture = val;
>> +}
>> +
>> +static void a7xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	spin_lock_irqsave(&a6xx_gpu->aperture_lock, *flags);
>> +
>> +	a7xx_aperture_slice_set(gpu, pipe);
>> +}
>> +
>> +static void a7xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +
>> +	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
>> +}
>> +
>> +static void a7xx_aperture_clear(struct msm_gpu *gpu)
>> +{
>> +	unsigned long flags;
>> +
>> +	a7xx_aperture_acquire(gpu, PIPE_NONE, &flags);
>> +	a7xx_aperture_release(gpu, flags);
>> +}
>> +
>> +static void a7xx_write_pipe(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 offset, u32 data)
>> +{
>> +	unsigned long flags;
>> +
>> +	a7xx_aperture_acquire(gpu, pipe, &flags);
>> +	gpu_write(gpu, offset, data);
>> +	a7xx_aperture_release(gpu, flags);
>> +}
>> +
>> +static u32 a7xx_read_pipe(struct msm_gpu *gpu, enum adreno_pipe pipe, u32 offset)
>> +{
>> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>> +	unsigned long flags;
>> +	u32 val;
>> +
>> +	spin_lock_irqsave(&a6xx_gpu->aperture_lock, flags);
>> +	a7xx_aperture_slice_set(gpu, pipe);
>> +	val = gpu_read(gpu, offset);
>> +	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
>> +
>> +	return val;
>> +}
>> +
> All of the above helper routines are unncessary because we access only a
> single register under the aperture in a7x hw_init(). Lets drop these and
> program the aperture register directly below.
We also access (read) it in a7xx_patch_pwrup_reglist though, so do we 
want to inline it twice?
>
>
>>   static u64 read_gmu_ao_counter(struct a6xx_gpu *a6xx_gpu)
>>   {
>>   	u64 count_hi, count_lo, temp;
>> @@ -849,9 +915,12 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>   		  min_acc_len_64b << 3 |
>>   		  hbb_lo << 1 | ubwc_mode);
>>   
>> -	if (adreno_is_a7xx(adreno_gpu))
>> -		gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
>> -			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
>> +	if (adreno_is_a7xx(adreno_gpu)) {
>> +		for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++)
>> +			a7xx_write_pipe(gpu, pipe_id, REG_A7XX_GRAS_NC_MODE_CNTL,
>> +					FIELD_PREP(GENMASK(8, 5), hbb_lo));
>> +		a7xx_aperture_clear(gpu);
>> +	}
>>   
>>   	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
>>   		  min_acc_len_64b << 23 | hbb_lo << 21);
>> @@ -865,9 +934,11 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>   	const struct adreno_reglist_list *reglist;
>> +	const struct adreno_reglist_pipe_list *pipe_reglist;
>>   	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
>>   	struct cpu_gpu_lock *lock = ptr;
>>   	u32 *dest = (u32 *)&lock->regs[0];
>> +	u32 pipe_reglist_count = 0;
>>   	int i;
>>   
>>   	lock->gpu_req = lock->cpu_req = lock->turn = 0;
>> @@ -907,7 +978,19 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>>   	 * (<aperture, shifted 12 bits> <address> <data>), and the length is
>>   	 * stored as number for triplets in dynamic_list_len.
>>   	 */
>> -	lock->dynamic_list_len = 0;
>> +	pipe_reglist = adreno_gpu->info->a6xx->pipe_reglist;
>> +	for (u32 pipe_id = PIPE_BR; pipe_id <= PIPE_BV; pipe_id++) {
>> +		for (i = 0; i < pipe_reglist->count; i++) {
>> +			if (pipe_reglist->regs[i].pipe & BIT(pipe_id) == 0)
>> +				continue;
>> +			*dest++ = A7XX_CP_APERTURE_CNTL_HOST_PIPE(pipe_id);
>> +			*dest++ = pipe_reglist->regs[i].offset;
>> +			*dest++ = a7xx_read_pipe(gpu, pipe_id,
>> +						 pipe_reglist->regs[i].offset);
>> +			pipe_reglist_count++;
>> +		}
>> +	}
>> +	lock->dynamic_list_len = pipe_reglist_count;
>>   }
>>   
>>   static int a7xx_preempt_start(struct msm_gpu *gpu)
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> index 6820216ec5fc..0a1d6acbc638 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>> @@ -46,6 +46,7 @@ struct a6xx_info {
>>   	const struct adreno_protect *protect;
>>   	const struct adreno_reglist_list *pwrup_reglist;
>>   	const struct adreno_reglist_list *ifpc_reglist;
>> +	const struct adreno_reglist_pipe_list *pipe_reglist;
>>   	const struct adreno_reglist *gbif_cx;
>>   	const struct adreno_reglist_pipe *nonctxt_reglist;
>>   	u32 max_slices;
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 0f8d3de97636..cd1846c1375e 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -182,12 +182,25 @@ struct adreno_reglist_list {
>>   	u32 count;
>>   };
>>   
>> +struct adreno_reglist_pipe_list {
>> +	/** @reg: List of register **/
>> +	const struct adreno_reglist_pipe *regs;
>> +	/** @count: Number of registers in the list **/
>> +	u32 count;
>> +};
>> +
> Please move this chunk down, just above the DECLARE_ADRENO_REGLIST_PIPE_LIST
>
> -Akhil
>
>>   #define DECLARE_ADRENO_REGLIST_LIST(name)	\
>>   static const struct adreno_reglist_list name = {		\
>>   	.regs = name ## _regs,				\
>>   	.count = ARRAY_SIZE(name ## _regs),		\
>>   };
>>   
>> +#define DECLARE_ADRENO_REGLIST_PIPE_LIST(name)	\
>> +static const struct adreno_reglist_pipe_list name = {		\
>> +	.regs = name ## _regs,				\
>> +	.count = ARRAY_SIZE(name ## _regs),		\
>> +};
>> +
>>   struct adreno_gpu {
>>   	struct msm_gpu base;
>>   	const struct adreno_info *info;
>>
>> ---
>> base-commit: 7bc29d5fb6faff2f547323c9ee8d3a0790cd2530
>> change-id: 20251126-gras_nc_mode_fix-7224ee506a39
>>
>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


