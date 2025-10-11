Return-Path: <linux-arm-msm+bounces-76837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E223FBCF5EB
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 15:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8249189D881
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Oct 2025 13:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F0C327BF89;
	Sat, 11 Oct 2025 13:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PaqWxYq/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C94B26B085
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 13:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760190495; cv=none; b=tXbzI4B1rZPFCUXFMUh7f/XGtS2yp1h6370E1DEJgLZcTjf1EsBqOffgYRQXwSIi6y1Mv2BUvcfxGjxpJoBfNPI5mbHYQUQeeJl46q/sn6SsPjZ04VDbf7RzbsobEjO9gm9u8uPqy+HllqMT0RWs2ZAx4mFLfcJD/f/qWzH48So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760190495; c=relaxed/simple;
	bh=vcaJuw1clwXJ4jWIw04e4JaDkRS0s63ajXtRoop4cJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cyxGvOTvoypFwE58fppXeyikx4H/+fQywMcIqAQsUKVkXEhtkqLCp1yMeC15S4WmPJLzEA/Ytsb9RD5n91JDI3R9iiyR/1Uy0TCJnVMmQp6Kb/GwCTyBHEzg53ODvdJvGg2/9wzASMEbTtL/YFTOEMF+w10QHjcWMOEOCGSANfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PaqWxYq/; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b403bb7843eso621144366b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Oct 2025 06:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760190491; x=1760795291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ij0pRbpZK7DlOFmMLygfu4zYOW6yym5MECdSzEWg690=;
        b=PaqWxYq/mfmKwoodEEt7XtBaVTK6jxic09MkAeVGr9vntrezUsU3OzxQVkW8vxViLa
         Z/DWmLBJx944a43noJdKRhYXkyR45OFlvviCebbcs2Eu5gSh6OA08FWYEtl6v4WrvPWS
         eZ091w4XgN6HNlwMDLEo6cwc2v40yZtg2Mvz/sgb0x0l6grRNe2NI8ZkwGJ5YA2WDs04
         5bZaUxizTuqmWQMO+HlDlQbzZaxiU8SSn3Uhp2pU9PPNSXgp+lJbB0cYT2TOcKw9TQEU
         eu7oN2uf/S8LzEE1bYYfdfouwNhmCEePgo3+sbDDwZLq4NW7nKaGfK7vJWz9yAGlwOSf
         td0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760190491; x=1760795291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij0pRbpZK7DlOFmMLygfu4zYOW6yym5MECdSzEWg690=;
        b=cp3FoX9lybNrmZjkhHhx8SP77KPb3S/gEyKPfAGmBZA3lyxTF/pbO4iZe+O/6dWdpC
         o4/xLht/HszeYe/kU5kRaEWH3BQ+NqMPfmBTJuWpLA7YisowQZ94VXU2jJUGYyeXj9RD
         pg+gNOC8GEOPpr9kT8c3fGaEnrmoJm9F6wiSb0Nzp0Lhw8egHic04KP+oz6oYitlF5Gy
         FaG3Eva2Bt/5g8XlcqB08xLEp/I2haJWXln4HyuSJ5DgY8dQYjgHlXg6STgYmCM/+rOn
         LJeCIYzALcD/s/BOEYXoBPDUNXOR71WhdTT4mP4zGFPCove/z3Ar2/86h3r3Q8Dcc8rX
         13hQ==
X-Gm-Message-State: AOJu0YzFahuHrYx3EusFXM5mpzgImTYXSsw161sLJz8FfP9dTA4fsmiG
	qa9y8uRyyl1MwDA/SDNcE2/sPkn61y46tdnxWL3ynnZtxg7lGReiyG0=
X-Gm-Gg: ASbGncuDrOJwnCw5Qtci3TBbhEp8pgeEsvuuIkBCPNsSJLhBM74RBdl5b6cdA8IjRmk
	MW/pR9RdVR8Ybi8TJ2TsENGqMMRRx0AxY4NSLlHGHYoZQldRdl/IixFOP0j80fBdJYiiPXMXYv6
	Ypp+ozag3eIrKLSW3Im1wO0a8Qc5rgsIHrLnNCOkkJZKBAeMa+uBmSnX3WRnRX6eUSOwWbXfVtp
	cqvF0uDYjZ0VerRvoMXBxtpP/poz5vZE6N1FfbXRQ7Ww/ZJXh2vSd6QQgagJJiQJ+HOqvoNDaNn
	hjX2RfzYUrsxLXJq+TtaPU7I9MwAgWiQCQzTqjHg2JFjDjMkYIfUuwwHp8s2bHyHt2IwshL6nHs
	1RzjC7Xe8rze37LW0nU3g6eR6rJwAn45k7n/GNxBtM6vwC+oK7d9eAwcADlFOcYkz3fC4k0yG4k
	xV5b8DKNJUpk/lmuRwmtfv0GoZB+pf
X-Google-Smtp-Source: AGHT+IFd9B6gVvxY8KSFltf5N9REtQSNTlL7T1T8UAzp0xhQwwjQWYW8Is6AW0R0K0MvjyN1BJ+sLw==
X-Received: by 2002:a17:907:843:b0:b40:98b1:7457 with SMTP id a640c23a62f3a-b50ac5d0901mr1418839266b.47.1760190490424;
        Sat, 11 Oct 2025 06:48:10 -0700 (PDT)
Received: from [192.168.1.17] (host-87-19-169-144.retail.telecomitalia.it. [87.19.169.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d2a76499sm498766966b.0.2025.10.11.06.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Oct 2025 06:48:10 -0700 (PDT)
Message-ID: <f99f1fcb-2352-42eb-94b8-c7efa497caa2@gmail.com>
Date: Sat, 11 Oct 2025 15:48:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: make sure last_fence is always updated
To: Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251010-close_fence_wait_fix-v2-1-adb332dbff65@gmail.com>
 <39a7f9a7-b97c-4851-9a00-ab926967d7c8@postmarketos.org>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <39a7f9a7-b97c-4851-9a00-ab926967d7c8@postmarketos.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/25 9:09 PM, Alexey Minnekhanov wrote:
> On 10.10.2025 17:39, Anna Maniscalco wrote:
>> Update last_fence in the vm-bind path instead of kernel managed path.
>>
>> last_fence is used to wait for work to finish in vm_bind contexts but 
>> not
>> used for kernel managed contexts.
>>
>> This fixes a bug where last_fence is not waited on context close leading
>> to faults as resources are freed while in use.
>>
>> Fixes: 92395af63a99 ("drm/msm: Add VM_BIND submitqueue")
>> ---
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
>> Changes in v2:
>> - Only update last_fence on vm_bind path
>> - Link to v1: 
>> https://lore.kernel.org/r/20251010-close_fence_wait_fix-v1-1-fd3e394dcadd@gmail.com
>> ---
>>   drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c 
>> b/drivers/gpu/drm/msm/msm_gem_submit.c
>> index 
>> 3ab3b27134f93b01236fec5833a18a6e2ad2cf5e..75d9f357437006ff261db148901e176eae670d41 
>> 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>> @@ -414,6 +414,11 @@ static void submit_attach_object_fences(struct 
>> msm_gem_submit *submit)
>>                        submit->user_fence,
>>                        DMA_RESV_USAGE_BOOKKEEP,
>>                        DMA_RESV_USAGE_BOOKKEEP);
>> +
>> +        last_fence = vm->last_fence;
>> +        vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, 
>> last_fence);
>> +        dma_fence_put(last_fence);
>> +
>>           return;
>>       }
>>   @@ -427,10 +432,6 @@ static void submit_attach_object_fences(struct 
>> msm_gem_submit *submit)
>>               dma_resv_add_fence(obj->resv, submit->user_fence,
>>                          DMA_RESV_USAGE_READ);
>>       }
>> -
>> -    last_fence = vm->last_fence;
>> -    vm->last_fence = dma_fence_unwrap_merge(submit->user_fence, 
>> last_fence);
>> -    dma_fence_put(last_fence);
>>   }
>>     static int submit_bo(struct msm_gem_submit *submit, uint32_t idx,
>>
>> ---
>> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
>> change-id: 20251009-close_fence_wait_fix-00e1c2521eee
>>
>> Best regards,
>
> Hi!
>
> Since 6.17 I'm seeing gpu faults that were not present in 6.16, they
> look like [1].
>
> I was hoping this patch can fix it, because faults go away if I comment
> out put_iova_spaces() inside msm_gem_close(), and this patch mentions
> close path and faults together, ... but no. Perhaps something else is
> wrong somewhere?
>
> [1] https://paste.sr.ht/~minlexx/09a9b3d4bfff3e7be3e96cd88fe8cf34621cb655
>
> -- 
> Regards,
> Alexey Minnekhanov
>
If that fault appears when closing applications (which sounds likely 
given your workaround) then yes, this is very much the kind of fault 
this patch intends to fix.

Might be worth a try with this patch to see if it helps with your case.

Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


