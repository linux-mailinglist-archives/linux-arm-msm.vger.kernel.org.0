Return-Path: <linux-arm-msm+bounces-59864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C64AC8A8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 11:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FDD33B5A21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 09:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E489721767D;
	Fri, 30 May 2025 09:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w+x4MLul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B81E2607
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 09:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748596569; cv=none; b=JAudMIDXKjS5gP7HCzByOXSxbCvgODBg0QpcADvb+VV7+omXr5AphXS0w0PnqzK4xhboCUUnZlCwwPlrsbWSKOwo4BlqZu8t4PGKT7DiRr4eKiA2A1kJTsz9L9RBk9kNYBOxiENxKj2koIiDAVgwMYAvqjDpiUo7OhBJAD5Ac6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748596569; c=relaxed/simple;
	bh=owr2CtBbxpsrcTH/9aunq/TI9QRa09vxoY6sSA98HoA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bs3Sd7yfdRvx+YcHzCVAKuSzV3vLSxFZBKo18FcKW0FGOSAyfJ6U12emlKlTnS+BuHta4P1BH9pbja8NthQnoLxzaa3sJIyrDvdk8AAtu0mQEVlPhm7aDnI1taF1zHDfj+Jw2yMo53S2m4kZBH0H/QlII6ivTRev40CnKkHyj/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w+x4MLul; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so14904235e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 02:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748596566; x=1749201366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N+8n16Dgs+TLt7SXuEAKpeYWp0+QUtR4WGU4q9KQr8k=;
        b=w+x4MLulxFg0dtUx1jwEFAYwRH6etcoWfr4+Qx73kVHpt/b/2OiTkGjRT/J7f7jfcp
         yrHyUYj1zuPScIzJTqbBkDIPO795iAuC3j7EP34tTUBBA+VfLmyc5dgK0PLPoyCtNrqc
         QFTQOwxn7r7Ufe5IGyRzre9IjeYnmk3z+OXh4LHZaJVwJORzErhR4C9Y8U/XkmaHvttl
         D2YBDvCzSpwnWYeEDOUOSVDO/473AC7TYvISjqkPXfZtg+YJEtrFA/e4uoGMAn3MVCXd
         2iiGg7if21rM3HV28iU6deFLkMd9fRnIYjeevh1kwtxT7T9M4cmcl5/5/jJi8r0eJsoM
         45Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748596566; x=1749201366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N+8n16Dgs+TLt7SXuEAKpeYWp0+QUtR4WGU4q9KQr8k=;
        b=HEGVg0FPUon/Sv9oELIy8HXMJQEd3rafTlKiqbvXYUZw5O9/1KT93zsLmSCZBv5MJc
         dYRB4n43qz+ludbRYk0ZkqSBhLOiRUSttqFx9WNGiT3wS1zI3EFBKIRQAwnznL7sVkx/
         ytBLEJXWfv9EO6Fa1+Vnz0IZkxD7HTKspPr+I8A2nRfEYHOyu2RoqKDGLyGvCz9aOS0i
         y1KdV9Pf56omaIjtxvMceVC8UpPweT1MHnGPJopt8QwGxfwGc6i7dsGD4G18l8Y/2x1G
         sYsBBxt30v5hXYWP9OuSv0E5rex4eKb0cAf3NW30YfIPqoNrkkTvvgHNsF9XaMKBGYve
         VOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs6U7aWvx3gBR9rwoE2GFApN+IgUcOI43x57iRIA4WEsIedxnfeDLC4QziI/rTEyaQqmBiqUpTnLb0oeGw@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+SZyN60R2ZZyEpMIRa6da+we0QGE563aSQQrwhwcIKJkeIfIG
	rXESmgui2cjMZL11YSmW0bkqxOXw4kMMPKScKD2jDkmNSFWFxnwKZxGtPooLBukVT0Q=
X-Gm-Gg: ASbGncu/Oi/o6lLWbsJ2RJ9LRYk1T61TEiJ2bhqDUuFKFuCrXRPo+3SeDcOoSFimw4V
	NZ6DiSf6lFVSO/34Xt/11LEnZbyAFu6RmfhU6U+Rlji/mlF9I2+xnRWeWx2vHBE/sUUmRdMCvXU
	o5KOLyK61jjk4lgVc2FZW8KMsCI8YXsvGo5+NuInESPeIRF5AXOt3vmiOKo5YkrsBvs8sxMq7p1
	RMbs1q2eVvnZfTqknyeR4JcrcHE/pIBntbbDanLoyxAlXaAHfLpSLvjVxGps7iQiXJF/QESvtO5
	25Box3omySvAbHIaV7uGfilAyMLzqCgWGRYYejE1vS4HH20V1ZBm1l+AWrlFu3xwABsnOS06N7b
	p4oHWZdiVvfvv6bt7
X-Google-Smtp-Source: AGHT+IEbdS/TpOHmYnUw9uKw+VAaKchZFgRWMcMXvl9FMyzTyiK33jqXfpDzaSbVjh0F091zKNKyZA==
X-Received: by 2002:a05:600c:3551:b0:450:d01e:78e1 with SMTP id 5b1f17b1804b1-450d64dfffbmr27589655e9.9.1748596566095;
        Fri, 30 May 2025 02:16:06 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fa2541sm12493885e9.15.2025.05.30.02.16.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 02:16:05 -0700 (PDT)
Message-ID: <ca9f7308-4b92-4d23-bfe7-f8d18d20de10@linaro.org>
Date: Fri, 30 May 2025 10:16:04 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: avoid memory allocation when 'icc_bw_lock'
 is held
To: Gabor Juhos <j4g8y7@gmail.com>, Georgi Djakov <djakov@kernel.org>,
 Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Cc: linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <TIkPOGVjPeCjPzjVtlSb6V5CIcpaXf2-6WG6HjAyaOW59Hj01-9VK7Z8DKadakOKr6fJeQICi6h0Z8mft9DQyg==@protonmail.internalid>
 <20250529-icc-bw-lockdep-v1-1-3d714b6a9374@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250529-icc-bw-lockdep-v1-1-3d714b6a9374@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2025 15:46, Gabor Juhos wrote:
> The 'icc_bw_lock' mutex is introduced in commit af42269c3523
> ("interconnect: Fix locking for runpm vs reclaim") in order
> to decouple serialization of bw aggregation from codepaths
> that require memory allocation.
> 
> However commit d30f83d278a9 ("interconnect: core: Add dynamic
> id allocation support") added a devm_kasprintf() call into a
> path protected by the 'icc_bw_lock' which causes this lockdep
> warning (at least on the IPQ9574 platform):

Missing a Fixes tag.

> 
>      ======================================================
>      WARNING: possible circular locking dependency detected
>      6.15.0-next-20250529 #0 Not tainted
>      ------------------------------------------------------
>      swapper/0/1 is trying to acquire lock:
>      ffffffc081df57d8 (icc_bw_lock){+.+.}-{4:4}, at: icc_init+0x8/0x108
> 
>      but task is already holding lock:
>      ffffffc081d7db10 (fs_reclaim){+.+.}-{0:0}, at: icc_init+0x28/0x108
> 
>      which lock already depends on the new lock.
> 
>      the existing dependency chain (in reverse order) is:
> 
>      -> #1 (fs_reclaim){+.+.}-{0:0}:
>             fs_reclaim_acquire+0x7c/0xb8
>             slab_alloc_node.isra.0+0x48/0x188
>             __kmalloc_node_track_caller_noprof+0xa4/0x2b8
>             devm_kmalloc+0x5c/0x138
>             devm_kvasprintf+0x6c/0xb8
>             devm_kasprintf+0x50/0x68
>             icc_node_add+0xbc/0x160
>             icc_clk_register+0x15c/0x230
>             devm_icc_clk_register+0x20/0x90
>             qcom_cc_really_probe+0x320/0x338
>             nss_cc_ipq9574_probe+0xac/0x1e8
>             platform_probe+0x70/0xd0
>             really_probe+0xdc/0x3b8
>             __driver_probe_device+0x94/0x178
>             driver_probe_device+0x48/0xf0
>             __driver_attach+0x13c/0x208
>             bus_for_each_dev+0x6c/0xb8
>             driver_attach+0x2c/0x40
>             bus_add_driver+0x100/0x250
>             driver_register+0x68/0x138
>             __platform_driver_register+0x2c/0x40
>             nss_cc_ipq9574_driver_init+0x24/0x38
>             do_one_initcall+0x88/0x340
>             kernel_init_freeable+0x2ac/0x4f8
>             kernel_init+0x28/0x1e8
>             ret_from_fork+0x10/0x20
> 
>      -> #0 (icc_bw_lock){+.+.}-{4:4}:
>             __lock_acquire+0x1348/0x2090
>             lock_acquire+0x108/0x2d8
>             icc_init+0x50/0x108
>             do_one_initcall+0x88/0x340
>             kernel_init_freeable+0x2ac/0x4f8
>             kernel_init+0x28/0x1e8
>             ret_from_fork+0x10/0x20
> 
>      other info that might help us debug this:
> 
>       Possible unsafe locking scenario:
> 
>             CPU0                    CPU1
>             ----                    ----
>        lock(fs_reclaim);
>                                     lock(icc_bw_lock);
>                                     lock(fs_reclaim);
>        lock(icc_bw_lock);
> 
>       *** DEADLOCK ***
> 
>      1 lock held by swapper/0/1:
>       #0: ffffffc081d7db10 (fs_reclaim){+.+.}-{0:0}, at: icc_init+0x28/0x108
> 
>      stack backtrace:
>      CPU: 3 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.15.0-next-20250529 #0 NONE
>      Hardware name: Qualcomm Technologies, Inc. IPQ9574/AP-AL02-C7 (DT)
>      Call trace:
>       show_stack+0x20/0x38 (C)
>       dump_stack_lvl+0x90/0xd0
>       dump_stack+0x18/0x28
>       print_circular_bug+0x334/0x448
>       check_noncircular+0x12c/0x140
>       __lock_acquire+0x1348/0x2090
>       lock_acquire+0x108/0x2d8
>       icc_init+0x50/0x108
>       do_one_initcall+0x88/0x340
>       kernel_init_freeable+0x2ac/0x4f8
>       kernel_init+0x28/0x1e8
>       ret_from_fork+0x10/0x20
> 
> Move the memory allocation part of the code outside of the protected
> path to eliminate the warning. Also add a note about why it is moved
> to there,
> 
> Fixes: d30f83d278a9 ("interconnect: core: Add dynamic id allocation support")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>   drivers/interconnect/core.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/interconnect/core.c b/drivers/interconnect/core.c
> index 1a41e59c77f85a811f78986e98401625f4cadfa3..acdb3b8f1e54942dbb1b71ec2b170b08ad709e6b 100644
> --- a/drivers/interconnect/core.c
> +++ b/drivers/interconnect/core.c
> @@ -1023,6 +1023,16 @@ void icc_node_add(struct icc_node *node, struct icc_provider *provider)
>   		return;
> 
>   	mutex_lock(&icc_lock);
> +
> +	if (node->id >= ICC_DYN_ID_START) {
> +		/*
> +		 * Memory allocation must be done outside of codepaths
> +		 * protected by icc_bw_lock.
> +		 */
> +		node->name = devm_kasprintf(provider->dev, GFP_KERNEL, "%s@%s",
> +					    node->name, dev_name(provider->dev));
> +	}
> +
>   	mutex_lock(&icc_bw_lock);
> 
>   	node->provider = provider;
> @@ -1038,10 +1048,6 @@ void icc_node_add(struct icc_node *node, struct icc_provider *provider)
>   	node->avg_bw = node->init_avg;
>   	node->peak_bw = node->init_peak;
> 
> -	if (node->id >= ICC_DYN_ID_START)
> -		node->name = devm_kasprintf(provider->dev, GFP_KERNEL, "%s@%s",
> -					    node->name, dev_name(provider->dev));
> -
>   	if (node->avg_bw || node->peak_bw) {
>   		if (provider->pre_aggregate)
>   			provider->pre_aggregate(node);
> 
> ---
> base-commit: 5fed7fe33c2cd7104fc87b7bc699a7be892befa2
> change-id: 20250529-icc-bw-lockdep-ed030d892a19
> 
> Best regards,
> --
> Gabor Juhos <j4g8y7@gmail.com>
> 
> 

The locking in this code is a mess.

Which data-structures does icc_lock protect node* pointers I think and 
which data-structures does icc_bw_lock protect - "bw" data structures ?

Hmm.

Looking at this code I'm not sure at all what icc_lock was introduced to do.

Can we not just drop it entirely ?

---
bod

