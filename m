Return-Path: <linux-arm-msm+bounces-45842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF485A19644
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 17:15:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0296E160EBE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4A3D215051;
	Wed, 22 Jan 2025 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="QUqDwXzt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923B21504E
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 16:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562505; cv=none; b=EorTNl+qYMW5l0bfTxYHfS9xZItNe/PLinN1kb29031QIlnFgEP/XS2CpGDNslD8nVs+tWpCswWmB/CDA9RC6Brn1PeMCtXpHTYSLuWZvo14B4eQxBYIcqVBOBuNER+oZd4Pp8tfIdCIBDj4w1zKdwBLvpdiL9jab1WEqsC/P8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562505; c=relaxed/simple;
	bh=XKmIdC74Rr23gvHHYjnvTOjQPg91btg6MT5in6EwDAU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBYd80Nphy0QmxKKsseaPT7yaAf9/AY1AQlLdGQkK7Av0ZwOJ31E33oqOJjUJLkuEIz1OSTyA+N2HYFN0PNx0nROJ7najQrplTrQQdSzFz0JVMrFJRntZb/agXLYfGHOeKB2f8Qm+QDc69m9QsnoCJlOVQuu6xZKeXrWJrI6Ipo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=QUqDwXzt; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4363ae65100so78826405e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 08:15:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1737562502; x=1738167302; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k6yifiK7k1egD832rtDY2X5ShBnrSfrr32YKaeunTC8=;
        b=QUqDwXztEinUm5jOAMqrnzLcsj21Y5OF7IJ3blMKSysrwFwPXkXHcRi2n/Mld1bx07
         v7I4dfBK6hrRZfhOXYeRD/DNktqA34NLp6F7Cdhf1WbyqXqnoN8RDt75thAONB26pBx7
         SCl4GngW78fCB5b2v2LQvT9f8bJaj/g/y78iizvnulREKSSDphwCch2IPKMX5soTuk/8
         M5nTW7uGc/lb7+bABXg8sKMvNR0aS5pg4LRpWmo1l/TIJLdGdFmSk2pTqDFeP2lF64un
         t6vkwW1ZXaEyG5uVBcREgQiZJYReXs0Ln0YDt0Y2RrktD46lTc8AuW/dVwWhxv6zTPq6
         aWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737562502; x=1738167302;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k6yifiK7k1egD832rtDY2X5ShBnrSfrr32YKaeunTC8=;
        b=GDOtM4w1Q3VjJlhcgvj9O4knXU568WuE/mt1BF0hSC6VxHLtgfRb57OSgA0qpbQLru
         oR3+6HQ8ACHmGtPIOV2pNyjhS6n9VLsGr0xiqMNgY78iNa4A56+s/tBPe5LGyv6vCRw0
         jCiIh0QzGfujt8ox+3vJ1xtEd7P3SD4O2pQlPlqjWNaWd5ieIvQ9aCCg1T/p9Ctw4sGu
         Q8VakWwvQV4AyVpnk2bPlHieGSYwpHCoU13dn2xX2l3Ap0aJQavtsBtcfe6Hm5ZAkoZo
         +hsl0/ZDIG5gV6A8+G/UTrqQ4ghdMqNTgNcnmprmEb0eWEGdYTykUQATq8zvPZRUC2DM
         LX+A==
X-Forwarded-Encrypted: i=1; AJvYcCXtONC3QphcRUBxoY3KzSLKYCxP9w9oqSyQgNb1r5pIVqq6n/yNXtcl6my8fLu5RG0g6JewhTJ8JDDj2FPi@vger.kernel.org
X-Gm-Message-State: AOJu0YywPk2dZkgSaN6/GTMZTjs7OYzxt2XJSc57WYVWBjymIN6YVgdV
	FgxKHCa2MqMl9Zu9ZONwGFwfVIHGJrd3ds5IIOsNO/n7zOY49dgRCnhP1LsjCSU=
X-Gm-Gg: ASbGncshWVoOR9rnqSRK0LhWGzK4yjw2Lbew8jJL7YXOiRv+8xBM1mX8cMfJppxp6XX
	GiPdObUpo+4rxA0sEqN3tVEN5pBh66o/c8M1DeByMZY1Bmfa/pgmhSfmAEPPkiuV254HLqAyTDs
	Vf391EutBBVzpu51pwwCIaKL6gpXoRzBPNfPpvtfQHsFQj4GdfJd+43978laPOHgfPH3Qa+zkGE
	OfdrEuYN83BP5HzOjDX/aIiAIyL0Rp14CBnzdgW+3veG4g7PKiLhk16kbRGVSvheDzBYpwK69RD
	zPrTcTyhBw==
X-Google-Smtp-Source: AGHT+IHjMS8YRSk6XzW0Efeh0A/XzjKRZHlKqwNXg3TUjzGuKVwVdcPgC6qrdd/tzzJ2CrO/z5EPcw==
X-Received: by 2002:a05:600c:4ecb:b0:434:ff45:cbbe with SMTP id 5b1f17b1804b1-438913f5c63mr219797095e9.18.1737562501952;
        Wed, 22 Jan 2025 08:15:01 -0800 (PST)
Received: from [192.168.0.101] ([90.241.98.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1718741sm20115825e9.0.2025.01.22.08.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 08:15:01 -0800 (PST)
Message-ID: <ce6bd1f3-8d7c-4b3c-af07-b8c9e0912f51@ursulin.net>
Date: Wed, 22 Jan 2025 16:14:59 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@kernel.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sunil Khatri <sunil.khatri@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>,
 Yunxiang Li <Yunxiang.Li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122165104.536c4143@collabora.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250122165104.536c4143@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 22/01/2025 15:51, Boris Brezillon wrote:
> On Wed, 22 Jan 2025 15:08:20 +0100
> Philipp Stanner <phasta@kernel.org> wrote:
> 
>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>> @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group *group,
>>   		   const struct drm_panthor_queue_create *args)
>>   {
>>   	struct drm_gpu_scheduler *drm_sched;
>> +	struct drm_sched_init_params sched_params;
> 
> nit: Could we use a struct initializer instead of a
> memset(0)+field-assignment?
> 
> 	struct drm_sched_init_params sched_params = {
> 		.ops = &panthor_queue_sched_ops,
> 		.submit_wq = group->ptdev->scheduler->wq,
> 		.num_rqs = 1,
> 		.credit_limit = args->ringbuf_size / sizeof(u64),
> 		.hang_limit = 0,
> 		.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS),
> 		.timeout_wq = group->ptdev->reset.wq,
> 		.name = "panthor-queue",
> 		.dev = group->ptdev->base.dev,
>          };

+1 on this as a general approach for the whole series. And I'd drop the 
explicit zeros and NULLs. Memsets could then go too.

Regards,

Tvrtko

> 
> The same comment applies the panfrost changes BTW.
> 
>>   	struct panthor_queue *queue;
>>   	int ret;
>>   
>> @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group *group,
>>   	if (!queue)
>>   		return ERR_PTR(-ENOMEM);
>>   
>> +	memset(&sched_params, 0, sizeof(struct drm_sched_init_params));
>> +
>>   	queue->fence_ctx.id = dma_fence_context_alloc(1);
>>   	spin_lock_init(&queue->fence_ctx.lock);
>>   	INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
>> @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group *group,
>>   	if (ret)
>>   		goto err_free_queue;
>>   
>> +	sched_params.ops = &panthor_queue_sched_ops;
>> +	sched_params.submit_wq = group->ptdev->scheduler->wq;
>> +	sched_params.num_rqs = 1;
>>   	/*
>> -	 * Credit limit argument tells us the total number of instructions
>> +	 * The credit limit argument tells us the total number of instructions
>>   	 * across all CS slots in the ringbuffer, with some jobs requiring
>>   	 * twice as many as others, depending on their profiling status.
>>   	 */
>> -	ret = drm_sched_init(&queue->scheduler, &panthor_queue_sched_ops,
>> -			     group->ptdev->scheduler->wq, 1,
>> -			     args->ringbuf_size / sizeof(u64),
>> -			     0, msecs_to_jiffies(JOB_TIMEOUT_MS),
>> -			     group->ptdev->reset.wq,
>> -			     NULL, "panthor-queue", group->ptdev->base.dev);
>> +	sched_params.credit_limit = args->ringbuf_size / sizeof(u64);
>> +	sched_params.hang_limit = 0;
>> +	sched_params.timeout = msecs_to_jiffies(JOB_TIMEOUT_MS);
>> +	sched_params.timeout_wq = group->ptdev->reset.wq;
>> +	sched_params.score = NULL;
>> +	sched_params.name = "panthor-queue";
>> +	sched_params.dev = group->ptdev->base.dev;
>> +
>> +	ret = drm_sched_init(&queue->scheduler, &sched_params);
>>   	if (ret)
>>   		goto err_free_queue;

