Return-Path: <linux-arm-msm+bounces-87538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 91FD3CF523B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 19:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F34E0302AADC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 18:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965612D6624;
	Mon,  5 Jan 2026 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="e47uNKZ7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A379E22578D
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 18:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767636138; cv=none; b=iO57g4WZLXDPsGhF653XEO9cpYBJXyOW6UA4Ts1eXM6H42ubUex7Y9VjMS3pzfXOC0cppDlTEfwP1rTW09Vd+uFCSLAEBt2N9X19VB+4GRSJzyZ57L39vjkotH4MLX6ScUfFe3ZvaV8gt4rgOFilIMrtU+R24ytNWMEATV3fOps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767636138; c=relaxed/simple;
	bh=J2ifw4ZRsQ9TrX3pkMbT12XKImaFrB1+bL172ft1MMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw21Z2W49YbnNSZYdxRuAVNbAjfHWrSeQ1JE4xk9DXO0zH64iKzxMpyXjzwWDLXnGbs7iUdSAf6Tl+e9nOLJ0Gu2H0NTOZaJqJ0Zmo59XHRNiVRuxwF3rMs1XGjYhJS4qHXsXWlPpFMHjbmSJ9bkv5W5Z3rOVRMHbOh1rYrsThQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=e47uNKZ7; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ba3ffd54dbso21241185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 10:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1767636136; x=1768240936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3nbp59mhgTws0br3p+6wkvcLWwbjOWOkhKphzo8jIA=;
        b=e47uNKZ7mO/SOPzDlB1Mm2pV5+hrMTW2bAJ9ykPF/WhXlbSZiAIR9gXq7Rft0mEM9A
         ZjT5uod56vFX12xlSKuzbUSazo79iqN+WBvGm+VtEyTgcMjSuOpLsGC6tnPjKoWuDvMg
         6rPgyOAcBfqV4l6+yHX31OX6BV13igwhY+2HXuzjwJ91r4iF+2qExmi0hfFvHOLtikyS
         PyHBg6i5gVveLPAvkjySvbQpzvNI5xBH5xSKBxavsJpUqhnjuilJaqhM+T/mzIaSKc1t
         CF1FZt5eeWptmatksJdJKdmFwhMsymwtby0xL5i1SdGElcwD2y4GM3tmpFQFzJ4T2mmH
         2XqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636136; x=1768240936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3nbp59mhgTws0br3p+6wkvcLWwbjOWOkhKphzo8jIA=;
        b=ldeggzRz3+HEQ9WrEVlunMHYi1Ly0Fae/jRXYivVmqFiAuJ/KREQ96nx5G/A5HLPIs
         PQlXmZV4kpT81KnOjR5ZC9bLRL4TW+kuXoiIp1JwKzuE0tg2rb2QmqbYRtNvDWvzXghN
         6aSHhd9ELjrzGMaPzemPjFQDXxug5ZrI3qnyjYpZtyb2FfPsx01854D48pgjg91iUhBk
         bp9X1MaQm7bN5JqjylzU9ajt7b53WU1EPSSGNXwi1nLT0ElARpHgku39dAueTngZdRba
         HEJREd/OcmCCXWrwwGCGFeMT+HTDsPTl9xwaNnO2hmkhMd1jOmLZrKtYKlxyAUqDJWHm
         zwQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjFq3HvsaZQp0J2zDRfwScCqvdVt5t7i0/Wnh72DsBOX8M1qcW8LQUh7jsI8Tr1PBBsg5f2CYpycC0TMhX@vger.kernel.org
X-Gm-Message-State: AOJu0YyQaVHEkd7AficIhkUHMH0ca5B6YG/z6CanABwORYcQCSPP271x
	ZWG6WgYwUiI+koHuJlzXvRqboSyoXl7pirFBmp+9X/bliPe9m59t+dXV0YqexPMxYG8=
X-Gm-Gg: AY/fxX6pbYz2oLnwD009f7n32gf8eYQrH3U2zR5QkC3sv9BuZGhFHS29imEaePhZ2dH
	ByJWtUCHexalEKGCHqs2XerXaNq2y8uXAr/Jgp+1dDv2eLqKdhsF2SMkBVw28+9XOAzitWBJRtT
	k2SWpmizJbXbuTC9dZKiAJ8BznJMiP+Sg+04txPU9VGF7zy1OVnSWal44PA+PWGx3NH4xBmDc0m
	3aD48m+UMq+Dr3Azpx0qrRO2Rvmkb2Bhf3cescN6oScyz6E6pHQCqNxP2D6RwzE3UNj5ygTjD3J
	wGVYl5jnVmFgmS19ntZxiFLfOE+/wXuaSXXWKCa/4wZejxoirSU7HDcHAInlSei7MgG7DBDRhf0
	us6OrpigGCw/McioNtK6tq4qsKIRIrVTL40yy4vclzlznVWrn3Knu1H7/ks5BfLv6OHaXhyvDUH
	KqJ0lAceWjA8Tl5tYtYw5I2OSyzAfvYvtYCYhu9YilGh1Zhge4fHsjO9aU/QK2voD/OjA=
X-Google-Smtp-Source: AGHT+IHRi2JeGLgddwIBbL3/jFiLlbsJ9ZkBik0QV2GMfdv4mRpNXrWXsxjaLvNVDtTIrWyY23IT9Q==
X-Received: by 2002:a05:620a:1a07:b0:8b2:e7d8:d630 with SMTP id af79cd13be357-8c37ebcd17cmr60238785a.72.1767636135387;
        Mon, 05 Jan 2026 10:02:15 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51bf8csm677385a.28.2026.01.05.10.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 10:02:14 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vcouD-00000001Bdl-0wbb;
	Mon, 05 Jan 2026 14:02:13 -0400
Date: Mon, 5 Jan 2026 14:02:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [REGRESSION] qcom: iommu: nullpointer dereference on boot on
 apq8064
Message-ID: <20260105180213.GG125261@ziepe.ca>
References: <569d7de2-cfcd-4d28-8bbf-14a0179f665e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <569d7de2-cfcd-4d28-8bbf-14a0179f665e@gmail.com>

On Mon, Dec 29, 2025 at 11:26:42PM +0100, Christian Schrefl wrote:
> Hi everyone,
> 
> I've found a panic on boot with v6.19-rc3 on the asus-nexus7-flo tablet with a APQ8064 CPU.
> 
> I've bisected it down to commit bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper 
> probe path"). Reverting the drivers/iommu/iommu.c changes (removing the added if block)
> fixes the crash, but that presumably exists for a reason.
> The diff for the fix:
> ```
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 2ca990dfbb88..9f32d70b207d 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -453,14 +453,6 @@ static int iommu_init_device(struct device *dev)
>          * already having a driver bound means dma_configure has already run and
>          * found no IOMMU to wait for, so there's no point calling it again.
>          */
> -       if (!dev->iommu->fwspec && !dev->driver && dev->bus->dma_configure) {
> -               mutex_unlock(&iommu_probe_device_lock);
> -               dev->bus->dma_configure(dev);
> -               mutex_lock(&iommu_probe_device_lock);
> -               /* If another instance finished the job for us, skip it */
> -               if (!dev->iommu || dev->iommu_group)
> -                       return -ENODEV;
> -       }
>         /*
>          * At this point, relevant devices either now have a fwspec which will
>          * match ops registered with a non-NULL fwnode, or we can reasonably
> ```

> [    5.900971] Call trace:
> [    5.900999]  qcom_iommu_of_xlate from of_iommu_xlate+0x7c/0x9c

Did you look at what line in qcom_iommu_of_xlate() is crashing with
NULL pointer?

It wasn't so obvious to me what it could be..

Though this looks really weird:

        struct msm_iommu_ctx_dev *master = dev_iommu_priv_get(dev);
        int sid;

        if (list_empty(&(*iommu)->ctx_list)) {
                master = kzalloc(sizeof(*master), GFP_ATOMIC);

So maybe master is NULL and !list_empty()? It is really confused, it
looks like it only adds exactly one entry to the ctx_list? Why have
the list?

Jason

