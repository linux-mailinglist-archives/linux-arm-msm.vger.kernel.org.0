Return-Path: <linux-arm-msm+bounces-28045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3202F949C52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 01:30:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DAF0B26DB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Aug 2024 23:30:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C10AF3612D;
	Tue,  6 Aug 2024 23:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TG4BiBHM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC676BB39
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Aug 2024 23:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722987032; cv=none; b=U2Uh/LGpnxOzvu2jejABsaUtKOTFm5ahBkHs2glWMvP0qK+dCijnwz6byEzWZkXOPufR3zcVc7LPVe4u4zasvx2Tqhj3MMJFrMn4+xQCUYTIIrCl2LdUsytHCXr8hLDEUb3YsPDWX24D9ntXr+3Tnat9W3Wj/Zxh5RwwPIiHbB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722987032; c=relaxed/simple;
	bh=9OfrFLad72cTHf4u3agSjc2MxlXEzSHw2Lxtd31B0xI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLl0MQJQs8IZYm6BZA5TllZAhr61DM4dAam32RZRYztCyFByUW5xyzxSyzTy38V7ExkbecmG5oTbyJgqvVhOCDi8UXti2DXAv3KpyBCYpw85fM1+sSsVGSHeOa+Yh8bUwVeQn8Gowsm1Ba6d4kzfhBFauP/Hyn+g95Tw59haefY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TG4BiBHM; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-428ec6c190eso8878215e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Aug 2024 16:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722987028; x=1723591828; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQAK3ORUpdSNyEh0PsJ7BXFhW0ECFf47+C60oBDMvgM=;
        b=TG4BiBHMmWZdBbBoMso+Avv6RBMWrDEWi7SGDy5PYLXJcBOxyzrSTjYgm8zOJ+j/wX
         efEtyknWewVno/EQNAOHzoLsdHNQCIgtnK7jgsErk5EZY66chJiklRV3Tb6+nuevLgx5
         0dHZ9Sk4E9GUgm0ExWr0hfP7NRA5mu+Cc2NwCRpVbCbYyGwqjqkKfbNnxyZBLozj9Lhg
         k6PgQXq0PjH8GxFRGAtkDkdc/LjjnIfFsrHS+dOHbkmMXYSlOv8VdmL/nUELNexaJagU
         fQFhlQECax2zbkhLLobYXvtvcdgHOUB9VOBqA4IwcueBYBO7fl8gZK4PtU9FreKct8P5
         QsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722987028; x=1723591828;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQAK3ORUpdSNyEh0PsJ7BXFhW0ECFf47+C60oBDMvgM=;
        b=lrVVRp+oJhKtFGpf7L/oQmIDnc9S1/19x2vTs0HwUpTRavFO8K09Ce4XWmJ6WNFv/c
         V17saiZlflyn0s6g6lnPGYdjQN/JEMlxGMb4jyy9I1EPuPAqFPsZR8G80bwa3rKo25hk
         eagALtoH6g++G2T8+SLj6jPIA6oAWbwahcUg2IHGH31mCYBcW9shXFZOT9px1Ti0Fr8Z
         oQQ8wbZOoSZu2lZv/xhyCyaWghxSC+xpCi+y3tiuIa6LtuEDWuP8ncfXmXxLInVI39ND
         MIfHo5YOUUSNzIiOZnE+op8hm69TGjt6z3AaV4iph+A4er/UhA7OVuj4e3cqDxFykVvk
         ZgfA==
X-Forwarded-Encrypted: i=1; AJvYcCUvQt0LlCmQ8JINO7cAGms64K+ksSZ9JEpW/GyStsUCDeHqrdnT9ftOJwIDr+r7YBP0mYwip2B/Wl7w8O4UyknrOuOLK2xVgBD2lW1sAw==
X-Gm-Message-State: AOJu0YyDJfuJEpIFL31w9Ac3G1uR3bU8kX8u83vqdFIg8WoOVm2KP/xu
	9nnr3vJYDsMafNhIpeF1U7bljqaHcJMNxa50nF1ZK2eBceo6lYem61rXw632KtZAi6fyKROwTdm
	XJCk=
X-Google-Smtp-Source: AGHT+IHSL2QjkWqxgsvQ51wxun3ZyWM3dPF+b0b06olFKHSku9T/dDEK0fSuJIbxSU3DMVhQKLnJSQ==
X-Received: by 2002:a5d:5d85:0:b0:36b:bcef:b39f with SMTP id ffacd0b85a97d-36bbcefb571mr9944637f8f.56.1722987027721;
        Tue, 06 Aug 2024 16:30:27 -0700 (PDT)
Received: from [192.168.0.25] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36bbcf0cc9csm14292666f8f.17.2024.08.06.16.30.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:30:27 -0700 (PDT)
Message-ID: <60408fc6-29c0-40ab-91f6-79b93889e525@linaro.org>
Date: Wed, 7 Aug 2024 00:30:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: fix error path on configuration of
 power domains
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Robert Foss <rfoss@kernel.org>
Cc: Todor Tomov <todor.too@gmail.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240806221204.1560258-1-vladimir.zapolskiy@linaro.org>
 <bb8398a7-3661-437e-8173-09117aedab16@linaro.org>
 <a2bb7c94-351d-49d2-b1df-961902243116@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <a2bb7c94-351d-49d2-b1df-961902243116@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 07/08/2024 00:27, Vladimir Zapolskiy wrote:
> Hi Bryan.
> 
> On 8/7/24 02:15, Bryan O'Donoghue wrote:
>> On 06/08/2024 23:12, Vladimir Zapolskiy wrote:
>>> There is a chance to meet runtime issues during configuration of CAMSS
>>> power domains, because on the error path dev_pm_domain_detach() is
>>> unexpectedly called with NULL or error pointer.
>>>
>>> Fixes: 23aa4f0cd327 ("media: qcom: camss: Move VFE power-domain 
>>> specifics into vfe.c")
>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>
>> Have you tested this with and without named power domains in your dts ?
>> The logic here is complex to support both the legacy non-named case and
>> the updated named required case.
> 
> The problem and the fix are pretty straightforward, if you notice any 
> issues
> with it, please let me know.
> 
> As it's said in the commit description the problem is unrelated to 
> named/not named
> power domains, I tested the fix only on a platform without 
> "power-domain-names"
> property in camss device tree node.
> 
>> Could you also provide a backtrace of a failing camss_configure_pd() for
>> the commit log.
> 
> Sure, I believe anyone can get a backtrace simply by disabling camcc at 
> build time,
> so that camss power domain supplies disappear:

Ah OK, that's how, proof positive if its not tested, its not working, 
I've extensively tested both named and non-named pds but, yep never with 
camcc switched off.

> 
> [   13.541205] Unable to handle kernel NULL pointer dereference at 
> virtual address 00000000000001a2
> [   13.550224] Mem abort info:
> [   13.553110]   ESR = 0x0000000096000004
> [   13.556975]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   13.562438]   SET = 0, FnV = 0
> [   13.565580]   EA = 0, S1PTW = 0
> [   13.568813]   FSC = 0x04: level 0 translation fault
> [   13.573824] Data abort info:
> [   13.576787]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [   13.582424]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [   13.587614]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [   13.593074] user pgtable: 4k pages, 48-bit VAs, pgdp=000000088a55a000
> [   13.599693] [00000000000001a2] pgd=0000000000000000, 
> p4d=0000000000000000
> [   13.606666] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [   13.613104] Modules linked in:
> 
> <snip>
> 
> [   13.632753] Workqueue: events_unbound deferred_probe_work_func
> [   13.638776] pstate: 23400009 (nzCv daif +PAN -UAO +TCO +DIT -SSBS 
> BTYPE=--)
> [   13.645926] pc : dev_pm_domain_detach+0x8/0x48
> [   13.650521] lr : camss_probe+0x374/0x9c0
> [   13.654577] sp : ffff800086ec3ab0
> [   13.657985] x29: ffff800086ec3ab0 x28: ffff8000855079c0 x27: 
> ffff800085507000
> [   13.665329] x26: ffff000800c4b040 x25: 0000000000000000 x24: 
> ffff00080aa72c20
> [   13.672659] x23: ffff800083060588 x22: ffff000801397010 x21: 
> ffff800083060588
> [   13.679989] x20: 00000000ffffff92 x19: ffff00080aa72880 x18: 
> ffffffffffffffff
> [   13.687318] x17: 6e6570656420676e x16: 69726f6e6769202c x15: 
> 0000000000000000
> [   13.694648] x14: 000000000000003e x13: 0000000000000000 x12: 
> 0000000000000000
> [   13.701988] x11: ffff00080b350460 x10: ffff00080b350248 x9 : 
> ffff800081ddcde4
> [   13.709318] x8 : ffff00080b350270 x7 : 0000000000000001 x6 : 
> 8000003ff0000000
> [   13.716658] x5 : ffff00080149a300 x4 : ffff000a72592b70 x3 : 
> 0000000000076404
> [   13.723998] x2 : 0000000000000000 x1 : 0000000000000001 x0 : 
> ffffffffffffff92
> [   13.731338] Call trace:
> [   13.733865]  dev_pm_domain_detach+0x8/0x48
> [   13.738081]  platform_probe+0x70/0xf0
> [   13.741864]  really_probe+0xc4/0x2a8
> [   13.745556]  __driver_probe_device+0x80/0x140
> [   13.750045]  driver_probe_device+0x48/0x170
> [   13.754355]  __device_attach_driver+0xc0/0x148
> [   13.758937]  bus_for_each_drv+0x88/0xf0
> [   13.762894]  __device_attach+0xb0/0x1c0
> [   13.766852]  device_initial_probe+0x1c/0x30
> [   13.771165]  bus_probe_device+0xb4/0xc0
> [   13.775124]  deferred_probe_work_func+0x90/0xd0
> [   13.779787]  process_one_work+0x164/0x3e0
> [   13.783920]  worker_thread+0x310/0x420
> [   13.787777]  kthread+0x120/0x130
> [   13.791123]  ret_from_fork+0x10/0x20
> [   13.794821] Code: 828a2cb8 ffff8000 aa1e03e9 d503201f (f9410802)
> [   13.801088] ---[ end trace 0000000000000000 ]---

I'd be obliged if you could add to your commit log and verify everything 
works for you with both named and unnamed power-domains.

---
bod


