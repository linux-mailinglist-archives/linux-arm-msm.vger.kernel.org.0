Return-Path: <linux-arm-msm+bounces-60280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BB9ACEB6B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 10:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BAD4E168EFB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jun 2025 08:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80D3A28E3F;
	Thu,  5 Jun 2025 08:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoJZTW4T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2EA2F5B;
	Thu,  5 Jun 2025 08:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749110601; cv=none; b=nG8jKt5CJ4QeQbuPfiIfP7WhSK/kTHe1KwgS2UX6wghrqETbbATYl7I77mm6UFyxvnJmDONqsNrT6/q44eAJ5OzoAerxeO461E8SnyVMS8C0qxTM9r2wXhfQqtYzhLsQwiKwXLr1irHTyETcbEYB+gO9hjxcy/te6anNaRege+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749110601; c=relaxed/simple;
	bh=vIck/aI7o/j2TdP1WtctZ4n5LTFEe86IRscOn0Amryk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZ4KSYyw1qstS9gkd2fOy9mfYBX7kuW63WGxzWL8+w6QW236+vNcdvNOW2dETddRqB26mcK+sV+pZPLa5K2mDoZ4+q6wnTvv4XdbxY2V7Y6cj+YXkzOswhSkDCpa8i+f7Fl5VH0QLse3GUlctWThYEBWeQEIcbZCiuiYZig+T+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoJZTW4T; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BEAC4CEE7;
	Thu,  5 Jun 2025 08:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749110600;
	bh=vIck/aI7o/j2TdP1WtctZ4n5LTFEe86IRscOn0Amryk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BoJZTW4T2E5gIxRD0FE9cTQGT9qwAExYR+Nruj6oEtUQeDxwaleDwG8jSoE3sjtPe
	 pS2JNOUGEs2uZ498STCliar9BO/5ElrVUmjzzDxN6/oWIS/AiWCpc+LTFpYJQXk/Hk
	 tDEM1Vz2F83zX7jdkN9doP4zrOQ+N4WaVCA8x4sv5/zIm97gqISfxBKqFh7oFfZ5Bj
	 cqIAnxPS4W/cIZfUwApopUVdkaPKu+fBl+06POSwlDzyAETbV9MtWZyGxM2aHoDkrf
	 eTW9rm3tNnqJwsl27UOMUvb5l4Bf6zmii/rIYZb3PqnHwQfwhR0Ft1Xt6OWUk9qVmc
	 RPuinMl0UbKfg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uN5ZF-000000005bD-3s24;
	Thu, 05 Jun 2025 10:03:17 +0200
Date: Thu, 5 Jun 2025 10:03:17 +0200
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] phy: use per-PHY lockdep keys
Message-ID: <aEFPRWErB4QkbMkt@hovoldconsulting.com>
References: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>

On Fri, May 30, 2025 at 07:08:28PM +0300, Dmitry Baryshkov wrote:
> If the PHY driver uses another PHY internally (e.g. in case of eUSB2,
> repeaters are represented as PHYs), then it would trigger the following
> lockdep splat because all PHYs use a single static lockdep key and thus
> lockdep can not identify whether there is a dependency or not and
> reports a false positive.
> 
> Make PHY subsystem use dynamic lockdep keys, assigning each driver a
> separate key. This way lockdep can correctly identify dependency graph
> between mutexes.
> 
>  ============================================
>  WARNING: possible recursive locking detected
>  6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 Not tainted
>  --------------------------------------------
>  kworker/u51:0/78 is trying to acquire lock:
>  ffff0008116554f0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>  but task is already holding lock:
>  ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>  other info that might help us debug this:
>   Possible unsafe locking scenario:
> 
>         CPU0
>         ----
>    lock(&phy->mutex);
>    lock(&phy->mutex);
> 
>   *** DEADLOCK ***
> 
>   May be due to missing lock nesting notation
> 
>  4 locks held by kworker/u51:0/78:
>   #0: ffff000800010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x18c/0x5ec
>   #1: ffff80008036bdb0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1b4/0x5ec
>   #2: ffff0008094ac8f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x38/0x188
>   #3: ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c
> 
>  stack backtrace:
>  CPU: 0 UID: 0 PID: 78 Comm: kworker/u51:0 Not tainted 6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 PREEMPT
>  Hardware name: Qualcomm CRD, BIOS 6.0.240904.BOOT.MXF.2.4-00528.1-HAMOA-1 09/ 4/2024
>  Workqueue: events_unbound deferred_probe_work_func
>  Call trace:
>   show_stack+0x18/0x24 (C)
>   dump_stack_lvl+0x90/0xd0
>   dump_stack+0x18/0x24
>   print_deadlock_bug+0x258/0x348
>   __lock_acquire+0x10fc/0x1f84
>   lock_acquire+0x1c8/0x338
>   __mutex_lock+0xb8/0x59c
>   mutex_lock_nested+0x24/0x30
>   phy_init+0x4c/0x12c
>   snps_eusb2_hsphy_init+0x54/0x1a0
>   phy_init+0xe0/0x12c
>   dwc3_core_init+0x450/0x10b4
>   dwc3_core_probe+0xce4/0x15fc
>   dwc3_probe+0x64/0xb0

>   platform_probe+0x68/0xc4
>   really_probe+0xbc/0x298
>   __driver_probe_device+0x78/0x12c
>   driver_probe_device+0x3c/0x160
>   __device_attach_driver+0xb8/0x138
>   bus_for_each_drv+0x84/0xe0
>   __device_attach+0x9c/0x188
>   device_initial_probe+0x14/0x20
>   bus_probe_device+0xac/0xb0
>   deferred_probe_work_func+0x8c/0xc8
>   process_one_work+0x208/0x5ec
>   worker_thread+0x1c0/0x368
>   kthread+0x14c/0x20c
>   ret_from_fork+0x10/0x20

Nit: This last bit of the stack trace adds little value and can be
dropped.
 
> Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Note: I've used a Fixes tag pointing to the commit which actually
> started using nested PHYs. If you think that it's incorrect, I'm fine
> with dropping it.

I think it's warranted. And if there were further users before this one
as Neil suggested you could just list them all as each has been
introducing a new splat.

> Note2: I've tried using mutex_lock_nested, however that didn't play
> well. We can not store nest level in the struct phy (as it can be used
> by different drivers), so using mutex_lock_nested() would require us to
> change and wrap all PHY APIs which take a lock internally. Using dynamic
> lockdep keys looks like a more ellegant solution, especially granted
> that there is no extra impact if lockdep is disabled.

Thanks for fixing this. I've been using a local hack based on
mutex_lock_nested() too but dynamic keys looks like the right way to go.

Perhaps you can add:

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Link: https://lore.kernel.org/lkml/ZnpoAVGJMG4Zu-Jw@hovoldconsulting.com/

Works fine on the T14s:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan

