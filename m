Return-Path: <linux-arm-msm+bounces-24082-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F67916025
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 09:37:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D3902821D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 07:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC030146A99;
	Tue, 25 Jun 2024 07:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VPTNJduO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16CF1369AE
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 07:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719301056; cv=none; b=Bx2GOZIacnb7MED7OUL6N2gjOFoFhbWqIZKWgFeC9jXzPco48qUoG3hthHWkOhVaLyZhxH5BBkzO1N9nFVR79mes+AIADA4YeJIhJNRLenLPbLsqsHhD0VCas+qPIxgiDb1Hud9gxtu9sHWopRngSf7pi1Bm7SI+QAhLVaZbAQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719301056; c=relaxed/simple;
	bh=f64MBD/7cfJDhhgnjCP+On1Bk31p8L2ViRRHIH0YTDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y3bvepqmjIJ/wvgPxS6CZpLT63aVzTZVczwEuRWJQwiKCL38QrFnEfAl3aRj47dggQN/OVcJDkLNx0cbNZr5f9IjPc/IBHygxLyUpvOfsNsrQRH5rScfmqfppcrKH+WEFs8mqI9kxoiQWQBxTNFs/AK7b9prHyn63b7nWkScL3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VPTNJduO; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42172ed3487so39193115e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2024 00:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719301053; x=1719905853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IA00d3kXembGJbTRrQC3GHeXDT+bmLkyWcsrNiRNxk4=;
        b=VPTNJduOx1Mm87Lp4Z6goxiVu2ZStu4Tn6mybsxRr8TbXabuc3mW6Sl1JLncd6xX+j
         38GYmwXjp3cbt5W+Qs5cTH2waQaWzVKB3HdEujiCvALAtvYbMavzfnIwbVWdbmN8X9lH
         MaEbXPD4iUwZOKUZMIa9kuJniAQVqYSPrc2rKT0/dSB8OnsXnngn0O5nkqgPky+o8Ur6
         fdW5eA1t5bOMFMEMrt12GHjHjsIwWOXr+0WNeiE5fxT3N1J49zrr17jyzlRU/m+dvwki
         cKTUc67aeq9kcgg//oyqBUtTUceFT4HfZG+4vEmAz2BDCp8+CVmBHUGa7OK/nNaCnSvw
         XjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719301053; x=1719905853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IA00d3kXembGJbTRrQC3GHeXDT+bmLkyWcsrNiRNxk4=;
        b=X/W5B/Pt+VTv6HLr0Zo6Mx1Wa9VhXgztzzxJzkniT92dIhMXVvMW0/5wgD2+f3MW08
         oIXHjH4tamyc2dnmnohQl+/1lFH2FE5evxFepjFYUJqkn7Tw5cz44MHuGwKxoQIxro9W
         cp33M3pTZq2UPN+P/+1UhqhO4WhL7tohPfgzGSI4iDFTepY30Ok1fEMYNOvCIK4bl0dz
         XiG2oCjGaGANdClYLGAORv44mVHMWsLjkA15o+MAJvdBBoXstoijEA2BprDNOZsLYi5i
         ZkvrM8xtoa5WLJxM10kml9CsNoWgKuKaStQlHTF/Maj1tNZUPWWP/wkhE5ZOPPkOMp4a
         xtlg==
X-Forwarded-Encrypted: i=1; AJvYcCXKTzmbV7SsSVsdFmsCk2lO7okJUxEOgxvpio+ISRVPVdazIdn2jG9d3cCSeT1shneYiW8g95C4xwwXLBfIxouKEElntN9FBBOTTfWxUg==
X-Gm-Message-State: AOJu0YzyUhcZjGYU05uS26pexPyw0SK7Dv55g1lw/gniHHllPvi7cHyv
	7jCZ7wr7EDd6xo1mtwwN98422vFoTK2YE5tGx5tnuOb6/ag9o/S1/tD66q6bBlw=
X-Google-Smtp-Source: AGHT+IF4VdM5dOrZ8HlsLIbSrR8JwJNLzbY53ONjUMXT1TZ83NWHj7Bn0RpZNW4PB6R45XccK7Ja7A==
X-Received: by 2002:a05:600c:3011:b0:421:72f3:33b5 with SMTP id 5b1f17b1804b1-42489e66ab0mr48271005e9.35.1719301052973;
        Tue, 25 Jun 2024 00:37:32 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a8ec8sm161372335e9.11.2024.06.25.00.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 00:37:32 -0700 (PDT)
Date: Tue, 25 Jun 2024 10:37:30 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: Lockdep broken on x1e80100 (was: Re: [PATCH v5 0/7] sm8550: Add
 support for eUSB2 repeater)
Message-ID: <ZnpzuhXqSLPkpkhn@linaro.org>
References: <20230208190200.2966723-1-abel.vesa@linaro.org>
 <ZnpoAVGJMG4Zu-Jw@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnpoAVGJMG4Zu-Jw@hovoldconsulting.com>

On 24-06-25 08:47:29, Johan Hovold wrote:
> On Wed, Feb 08, 2023 at 09:01:53PM +0200, Abel Vesa wrote:
> > This patchset adds support for the eUSB2 repeater found in pmic PM8550B,
> > used along with SM8550. Since there is no dedicated generic framework
> > for eUSB2 repeaters, the most appropriate subsystem to model it is the
> > generic phy. This patchset also adds support for such repeater to the
> > eUSB2 PHY found in SM8550. Basically, the eUSB2 PHY will have its own
> > "phy" which is actually a repeater.
> 
> The decision to model the repeater as a PHY unfortunately breaks lockdep
> as you now have functions like phy_init() calling phy_init() for a
> second PHY (the repeater, see splat below).
> 

This was reported by Bjorn off-list a couple of months ago. I did check
it then and the order is perfectly fine. The solution here should be to
use mutex_lock_nested in the PHY framework. This would allow supporting
chain-linked PHYs. The possibility of moving out the repeater out of PHY
was also discussed. Unfortunately, I didn't have the bandwidth to
circle back and properly investigate and fix it.

> As long as the locks are always taken in the same order there should be
> no risk for a deadlock, but can you please verify that and add the
> missing lockdep annotation so that lockdep can be used on platforms like
> x1e80100 (e.g. to prevent further locking issues from being introduced)?
> 
> Johan
> 
> 
> [    8.613248] ============================================
> [    8.669073] WARNING: possible recursive locking detected
> [    8.669074] 6.10.0-rc5 #122 Not tainted
> [    8.669075] --------------------------------------------
> [    8.669075] kworker/u50:0/77 is trying to acquire lock:
> [    8.669076] ffff5cae8733ecf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
> [    8.669087]
>                but task is already holding lock:
> [    8.669088] ffff5cae8a056cf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
> [    8.669092]
>                other info that might help us debug this:
> [    8.669092]  Possible unsafe locking scenario:
> 
> [    8.669093]        CPU0
> [    8.669093]        ----
> [    8.669094]   lock(&phy->mutex);
> [    8.669095]   lock(&phy->mutex);
> [    8.669097]
>                 *** DEADLOCK ***
> 
> [    8.669097]  May be due to missing lock nesting notation
> 
> [    8.669097] 4 locks held by kworker/u50:0/77:
> [    8.669099]  #0: ffff5cae80010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1a4/0x638
> [    8.669108]  #1: ffff800080333de0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1cc/0x638
> [    8.669112]  #2: ffff5cae854038f8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x38/0x1d4
> [    8.669117]  #3: ffff5cae8a056cf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
> [    8.669121]
>                stack backtrace:
> [    8.669122] CPU: 9 PID: 77 Comm: kworker/u50:0 Not tainted 6.10.0-rc5 #122
> [    8.669124] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
> [    8.669125] Workqueue: events_unbound deferred_probe_work_func
> [    8.669128] Call trace:
> [    8.669129]  dump_backtrace+0x9c/0x11c
> [    8.870384]  show_stack+0x18/0x24
> [    8.870386]  dump_stack_lvl+0x90/0xd0
> [    8.870391]  dump_stack+0x18/0x24
> [    8.870393]  print_deadlock_bug+0x25c/0x348
> [    8.870396]  __lock_acquire+0x10a4/0x2064
> [    8.870399]  lock_acquire.part.0+0xc8/0x20c
> [    8.870401]  lock_acquire+0x68/0x84
> [    8.870403]  __mutex_lock+0x98/0x428
> [    8.870407]  mutex_lock_nested+0x24/0x30
> [    8.870410]  phy_init+0x4c/0x12c
> [    8.870412]  qcom_snps_eusb2_hsphy_init+0x54/0x420 [phy_qcom_snps_eusb2]
> [    8.870416]  phy_init+0xe0/0x12c
> [    8.870418]  dwc3_core_init+0x484/0x1214
> [    8.870421]  dwc3_probe+0xe54/0x171c
> [    8.870424]  platform_probe+0x68/0xd8
> [    8.870426]  really_probe+0xc0/0x388
> [    8.870427]  __driver_probe_device+0x7c/0x160
> [    8.870429]  driver_probe_device+0x40/0x114
> [    8.870430]  __device_attach_driver+0xbc/0x158
> [    8.870432]  bus_for_each_drv+0x84/0xe0
> [    8.870433]  __device_attach+0xa8/0x1d4
> [    8.870435]  device_initial_probe+0x14/0x20
> [    8.870436]  bus_probe_device+0xb0/0xb4
> [    8.870437]  deferred_probe_work_func+0xa0/0xf4
> [    8.870439]  process_one_work+0x224/0x638
> [    8.870441]  worker_thread+0x268/0x3a8
> [    8.870442]  kthread+0x124/0x128
> [    8.870443]  ret_from_fork+0x10/0x20

