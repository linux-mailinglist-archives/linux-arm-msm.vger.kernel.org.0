Return-Path: <linux-arm-msm+bounces-55560-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DDFA9BFCB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 09:33:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 974243A9F4D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 07:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79A622E41D;
	Fri, 25 Apr 2025 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jhg3DFdw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235171E5B95
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 07:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745566379; cv=none; b=kmvR5dRVpfbR4SUYlD/7bDRkIF1b/kBXdnoCrFO5bjZgnfX9jEgjQRu8qssU2yJHbFb96XXRHTyldv7rve5J6uSIwY+IFLSBsDDPuYTdfhLyS5XUDesLXkHlc18Hiv2PW+A0LFe6zF+2VgdFtZHyOzQ8qqK5qoaGLvJPycV0Msk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745566379; c=relaxed/simple;
	bh=aA0ZrtbPTCPf+u7y5/pHP9XzFYTNwoufRKaVyQtLdHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SFlILqu4F99Kpd2Q+kVJAoedGMjPNolt23cuXWNKLPreN7eqx3/8Px++sakOFYOXcKAp5iHmV/+mvhUPyIb3PBJf2vkhdCsJHZm+daaZ5zWNOng2IpCgBzs1FJ5ZsNADblh43Rw0Kk1pxpOG6h8yx5RQe4L9w/iPgnUSx/ZWjaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jhg3DFdw; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2264aefc45dso31136375ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 00:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745566377; x=1746171177; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJc0VC1OPnf8MGBGBVEvJ1rm1gHV5SYp4RtZ7UBjMoI=;
        b=jhg3DFdwEqMEyeM3RCxINZyz6q6OOIM7TBH3nU8PKLA0BBroqLxM+iolUHfd3ArqLF
         oZPZdeGRBatlvCDxRaAKvcqR8nKDpmpUW6sUVQXij0gVFsh9zdYY0qXnO5zjnPobw/no
         VNKN+w6fhAyzwndKFGelgK3efiAjdNowAmvUZZ/4GLlyACdZ1xfB4iAVSnDbcs+aQXf4
         SezvyP1mh99FBVNbBX8hG3BNjLqsGw1rTBQr/Kom1/MUCqeQ61qII/Yv6js7kU0q2Mab
         XuBsA5nh8PIzz9Pg7+Z/SYNK7oDYU3HN3vuJ5AOcUN56qU7Jl4oIFktbvfp2Jl2Eyz7T
         L5CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745566377; x=1746171177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJc0VC1OPnf8MGBGBVEvJ1rm1gHV5SYp4RtZ7UBjMoI=;
        b=Mx/VbKxGI71euP4liUrHTqTiLaFqIJITGL53sn77zffKhSxSWVZfYCHexIBSq+oVA3
         iyZQ6VYyQzOLy4oHTvRhzAFN731SNdkD/j3u4SzzYtSswxQ+f3flFul5GCNn2DaQm1Rw
         HbWWNfmWkF9iXqYtlGJT82la5elur7h/wHtrRXyA/P1+VBVeKUvNLnqUDek14vVv4iqh
         UhniamM8MAEoRMt8cpeNivkIo5HyG3ho4fdw6RvfSMCpL2chHuRqqZHxZnDjOQeF+A8H
         3gL4lM/1P10AwFBO/k8kFLMFpu2KpFSNg+3L/xY7I9O5tId4zmhwS6uSfms6unSv/0HS
         W8Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXZp0k63X/uWpZnLvD98WzqPVwmm5nEV2O9xKbJrdW0gxVh2KA/iPLGg1BGX6UD1Q+ShQmkp2rcKslExMTg@vger.kernel.org
X-Gm-Message-State: AOJu0YxCkrgIo9woB6DD0UwW1zjby8BSsD0HIkaxbkWPDDUSzLljA5qb
	Gy4oy8FGPvD8+az5vZGrO4SP9MDs4vKgUYJwPEWOYfeNPpPw+hBQsuHhx+Zd2g==
X-Gm-Gg: ASbGncshtn3yNKGtQnH+5yIXJly2vtFkw8/QN+iXcl+5T5scIQF86dvPFsUNSZGL1dD
	IK/sPIkXP1PLcg8007ZkVyvW10DAPM/z1IN/7wGwW52OpSfshl8Fj45LIgjrG+xlTThgAcVWrdn
	aLQn1WVUp2Tr5EssTzT9/rXf8cH4H2KMcH5dIgZpp51o2CJKMG4mL8SCNsy3pehGNaov6adzDoX
	bpKLGkNTQT+GPeweZYj6DbdsRh8TN0WEC5krgaZXtmcOXeMas2jQo6vNKphcaln+rfNmHJbrcKD
	NQP4QpBgbMUYexfPaNOhPpq8rA2XSCmAY8MvO4jH8qRnhNmdqdw=
X-Google-Smtp-Source: AGHT+IEaSjf7mjPyqkb9SLHl28S3KtutHrHtesFq5IWR5am6CHVSmDDpdOQGUAksLd+HiuHc9w/Ahw==
X-Received: by 2002:a17:902:f541:b0:224:a96:e39 with SMTP id d9443c01a7336-22dbf5d89bfmr18972215ad.9.1745566377452;
        Fri, 25 Apr 2025 00:32:57 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4db97b3sm25701435ad.55.2025.04.25.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 00:32:56 -0700 (PDT)
Date: Fri, 25 Apr 2025 13:02:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>, 
	Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kunwu Chan <chentao@kylinos.cn>, kernel@collabora.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
 <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>

On Fri, Apr 25, 2025 at 12:14:39PM +0500, Muhammad Usama Anjum wrote:
> On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
> > On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
> >> Fix dma_direct_alloc() failure at resume time during bhie_table
> >> allocation. There is a crash report where at resume time, the memory
> >> from the dma doesn't get allocated and MHI fails to re-initialize.
> >> There may be fragmentation of some kind which fails the allocation
> >> call.
> >>
> > 
> > If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
> > workaround that in the device drivers. What is the guarantee that other drivers
> > will also continue to work? Will you go ahead and patch all of them which
> > release memory during suspend?
> > 
> > Please investigate why the allocation fails. Even this is not a device issue, so
> > we cannot add quirks :/
> This isn't a platform specific quirk. We are only hitting it because
> there is high memory pressure during suspend/resume. This dma allocation
> failure can happen with memory pressure on any device.
> 

Yes.

> The purpose of this patch is just to make driver more robust to memory
> pressure during resume.
> 
> I'm not sure about MHI. But other drivers already have such patches as
> dma_direct_alloc() is susceptible to failures when memory pressure is
> high. This patch was motivated from ath12k [1] and ath11k [2].
> 

Even if we patch the MHI driver, the issue is going to trip some other driver.
How does the DMA memory goes low during resume? So some other driver is
consuming more than it did during probe()?

> [1]
> https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> [2]
> https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> 
> What do you think can be the way forward for this patch?
> 

Let's try first to analyze why the memory pressure happens during suspend. As I
can see, even if we fix the MHI driver, you are likely to hit this issue
somewhere else.

- Mani

> > 

[...]

> > Did you intend to leak this information? If not, please remove it from
> > stacktrace.
> The device isn't private. Its fine.
> 

Okay.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

