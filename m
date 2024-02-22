Return-Path: <linux-arm-msm+bounces-12136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFED85F11B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 06:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F8B0B237AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 05:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E005112B81;
	Thu, 22 Feb 2024 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ul/ppe0Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D96210942
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 05:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708580868; cv=none; b=oNPg9vHkve4f1j0KaYSJjOsF7r7m2oOYoxGGuCdgg4y9gbJnpCjJ6lPi758zpXwUKRoP6vhPh+lMHdFZUtMjDWiC0TNb9VaCJqG9DJ6veLVCYpig1BqBLX+4dqw/jEiKv1rsfYrL1JzLhxIIUcUd35is4LXFAg8I1CULJ0zqjZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708580868; c=relaxed/simple;
	bh=qdDEQ/odklpLTC89u2grpARtU2NkpDJ3xSWe0VUu6UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onLqLip6m0nNNN2Yeraq2N7FJblFzxvBKHks/8i4EwcEROmxWkEyH0+x6V4u0mbU4zOomCLv0X6AmfTxa38rtVp35NHCUafseo3+UVst+HSyZ7RLE9xY438KL4uTfBCc9Ttiw6reeRUQcl/8vDJlImwEb3ob/+FMQr8gofpAxtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ul/ppe0Y; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6e457fab0e2so342117b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Feb 2024 21:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708580866; x=1709185666; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wSWmeGU/PHEWXrJBkyrdMCv0vQ2HmKobzP0FHV/IZQY=;
        b=ul/ppe0Ys0tdOppd+Dygcuxs5uzpbBUWoI88prMGpADwiSWfswYtfsgjVQaDbceI3r
         v6klax3A0mE8EKBNWo/mJ02spHqw21oGB+EqfQmRFlUVKrz5Sb6F+qfXDOG/DBSc8kLK
         bQk4we4YgxgRXidVT1riMmugMXUNmLoVnvWFhOBd8dJq/ikyb6zoHU4lNNHapD3i9ZUn
         SknFuzC9Ee5u/Jt1o3SAzJDW3JIw/AaBHKqAeyVB11j186z5jm2ZO4l6ZTaAcQE2edzi
         mIV4jDEJFa7pGxsGDrz0rQkJNVhZRY73faXzmkyiOuN1Ji4nIYGwWjfpEfuCyXTKWeYs
         SXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708580866; x=1709185666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wSWmeGU/PHEWXrJBkyrdMCv0vQ2HmKobzP0FHV/IZQY=;
        b=cRRG/GT5LoPC37TlFqURNyDz/iKWzbvvIdaLHwEXFSA+RfDZBjqGSOG7k5w4GC88Mb
         xLYbLSGtJZyG+gwvRUQJlaw1VxMHWS0vWgv3JgNKvtiyuW8vfJID3rOU+yl2+xraMt5F
         jtxmEQmmrDpxJoNx3jTKQmuntiDiRGTUhhRCr158gfKazIe6PbZ6VfQUpxBvPBzlLYRS
         qPyK6KAHa0p3z6gxfLly/XKLnzvdvvAnvXuRSzdDhWd0SCpaI7iQL3DjIP7u35WBKBE6
         26SswAI2bFFJ5OzkuZUm2BIvpCuBLVJcInUpYL/ZZtvxH+a7cqunQs+QiYBZeU+4DKzj
         weUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdJtPeZZxsJFYav5FpBVMaPuNSi1gdmBVvM1OFlDJVOJW44a+wZ50PQPKZDPWUIPv1fM0d9B3jn8aNajnpDgMhASTQZMDppjWN5lFaUQ==
X-Gm-Message-State: AOJu0YzlLw750XvpUvaWMudB5btQam/GtZeNwe9VT7EoPsvDV74xT1JP
	nJVbGqmv8vDuj1HKJjGD/gQ6R8LioVDybilKfZFdgjG5ZweHgmMwvrLBY5uLcQ==
X-Google-Smtp-Source: AGHT+IHcAZ7rWFCCCCrNCo/vjZ7VNYn7nL2POZRFMS+2IBVvi+pUx8xK0KHdEmv6esp16oSwmLVbuA==
X-Received: by 2002:a05:6a00:2d0f:b0:6e0:4a19:8da6 with SMTP id fa15-20020a056a002d0f00b006e04a198da6mr2882834pfb.3.1708580866081;
        Wed, 21 Feb 2024 21:47:46 -0800 (PST)
Received: from thinkpad ([117.193.212.166])
        by smtp.gmail.com with ESMTPSA id fn16-20020a056a002fd000b006e3dfb2ef4esm8623980pfb.95.2024.02.21.21.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 21:47:45 -0800 (PST)
Date: Thu, 22 Feb 2024 11:17:39 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Kalle Valo <kvalo@kernel.org>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	ath11k@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: ath11k allocation failure on resume breaking wifi until power
 cycle
Message-ID: <20240222054739.GG3374@thinkpad>
References: <96481a45-3547-4d23-ad34-3a8f1d90c1cd@suse.cz>
 <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0994ae16-8174-4a04-b454-1974b16bc106@quicinc.com>

On Wed, Feb 21, 2024 at 08:34:23AM -0800, Jeff Johnson wrote:
> On 2/21/2024 6:39 AM, Vlastimil Babka wrote:
> > Hi,
> > 
> > starting with 6.8 rc series, I'm experiencing problems on resume from s2idle
> > on my laptop, which is Lenovo T14s Gen3:
> > 
> > LENOVO 21CRS0K63K/21CRS0K63K, BIOS R22ET65W (1.35 )
> > ath11k_pci 0000:01:00.0: wcn6855 hw2.1
> > ath11k_pci 0000:01:00.0: chip_id 0x12 chip_family 0xb board_id 0xff soc_id 0x400c1211
> > ath11k_pci 0000:01:00.0: fw_version 0x1106196e fw_build_timestamp 2024-01-12 11:30 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.37
> > 
> > The problem is an allocation failure happening on resume from s2idle. After
> > that the wifi stops working and even a reboot won't fix it, only a
> > poweroff/poweron cycle of the laptop.
> > 

Looks like WLAN is powered down during s2idle, which doesn't make sense. I hope
Jeff will figure out what's going on.

But if you can share the dmesg after enabling the debug prints of both ath11k
and MHI, it will help a lot.

- Mani

> > This is order 4 (costly order), GFP_NOIO (maybe it's originally GFP_KERNEL
> > but we restrict to GFP_NOIO during resume) allocation, thus it's impossible
> > to do memory compaction and the page allocator gives up. Such high-order
> > allocations should have a fallback using smaller pages, or maybe it could at
> > least retry once the restricted GFP_NOIO context is gone.
> > 
> > I don't know why it never happened before 6.8, didn't spot anything obvious
> > and it happens too unreliably to go bisect. Any idea?
> 
> I've asked the development team to look at this, but in the interim can
> you apply the two hibernation patchsets to see if those cleanups also
> fix your problem:
> 
> [PATCH 0/5] wifi: ath11k: prepare for hibernation support
> https://lore.kernel.org/linux-wireless/20240221024725.10057-1-quic_bqiang@quicinc.com
> 
> [PATCH 0/3] wifi: ath11k: hibernation support
> https://lore.kernel.org/linux-wireless/20240221030026.10553-1-quic_bqiang@quicinc.com

-- 
மணிவண்ணன் சதாசிவம்

