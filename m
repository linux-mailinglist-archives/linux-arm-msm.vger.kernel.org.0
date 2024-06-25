Return-Path: <linux-arm-msm+bounces-24071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F381915F0E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 08:47:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3904A282DE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2024 06:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B29146583;
	Tue, 25 Jun 2024 06:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F7hE66ck"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95414600C;
	Tue, 25 Jun 2024 06:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719298043; cv=none; b=nNDSQrH1t67j0HkViH8fhzP9043bg2B7QLo0oA1ykt0qLMAx0tHDRa6nIxiU7RgPlkMrUcGw2i7mjJ2VkIRh2q0ZJCggOJ4OuInHoG+imDRRbxowyNy2mMyI7h+t6cIyDEowfgUEYLprFuZu0uvOsaF7FWxJDdbQAtlDTUyo9kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719298043; c=relaxed/simple;
	bh=pJJu5s9KBxupbvcL1lu1+U5fHpLZ++eVwWUD05uzpPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7NxSDMnCNxFAlDnKwv/UnXzs9Op90Qc5XQcTKQvTsu6+L35H5Dq4PjFc1qbIEMELNSjexxSP5cL4xLKuPoxzwD+UsL/ySIEEDX3z5A0VfYDLGhFlfFfKNeMnrQYAqWvqKSZdcgWU9t9zqk1uQEuQY2b/3FxyFM1yiovN8YdkZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F7hE66ck; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FDAC32781;
	Tue, 25 Jun 2024 06:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719298042;
	bh=pJJu5s9KBxupbvcL1lu1+U5fHpLZ++eVwWUD05uzpPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F7hE66ckoIiNZDCC/BKpdORZyZ1F8SNYkxPHAs62E7ZzqtjWc3vUgNK5qodSyTktz
	 sF+vVkvwAs5vCg4puoKPidU8+M4B9A7cmR8a1d8Je/6fKZLew2cEA3BRTwP4v5ami0
	 GHHk1ybDEUctvr8faom0P1IGGUwMBKulUeGeea/+hBD5fykd5KyEL2n2BzRWl7lXUT
	 qkfYt+cOSuHTRaNFgRabcSyV6TgxMpkacyqQPUxgvcib/F825ihOkaWROgK8c3rBBQ
	 8ltpBPkGZWHekBvobIfeUAMUKMzn2H4ul1JECtfBbxYL3WLy5bwDrYWxMhCuRjlJuq
	 9AKgHzD8B8Nmw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1sLzxh-000000008Oq-47Ci;
	Tue, 25 Jun 2024 08:47:30 +0200
Date: Tue, 25 Jun 2024 08:47:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"vkoul@kernel.org" <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Lockdep broken on x1e80100 (was: Re: [PATCH v5 0/7] sm8550: Add
 support for eUSB2 repeater)
Message-ID: <ZnpoAVGJMG4Zu-Jw@hovoldconsulting.com>
References: <20230208190200.2966723-1-abel.vesa@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230208190200.2966723-1-abel.vesa@linaro.org>

On Wed, Feb 08, 2023 at 09:01:53PM +0200, Abel Vesa wrote:
> This patchset adds support for the eUSB2 repeater found in pmic PM8550B,
> used along with SM8550. Since there is no dedicated generic framework
> for eUSB2 repeaters, the most appropriate subsystem to model it is the
> generic phy. This patchset also adds support for such repeater to the
> eUSB2 PHY found in SM8550. Basically, the eUSB2 PHY will have its own
> "phy" which is actually a repeater.

The decision to model the repeater as a PHY unfortunately breaks lockdep
as you now have functions like phy_init() calling phy_init() for a
second PHY (the repeater, see splat below).

As long as the locks are always taken in the same order there should be
no risk for a deadlock, but can you please verify that and add the
missing lockdep annotation so that lockdep can be used on platforms like
x1e80100 (e.g. to prevent further locking issues from being introduced)?

Johan


[    8.613248] ============================================
[    8.669073] WARNING: possible recursive locking detected
[    8.669074] 6.10.0-rc5 #122 Not tainted
[    8.669075] --------------------------------------------
[    8.669075] kworker/u50:0/77 is trying to acquire lock:
[    8.669076] ffff5cae8733ecf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
[    8.669087]
               but task is already holding lock:
[    8.669088] ffff5cae8a056cf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
[    8.669092]
               other info that might help us debug this:
[    8.669092]  Possible unsafe locking scenario:

[    8.669093]        CPU0
[    8.669093]        ----
[    8.669094]   lock(&phy->mutex);
[    8.669095]   lock(&phy->mutex);
[    8.669097]
                *** DEADLOCK ***

[    8.669097]  May be due to missing lock nesting notation

[    8.669097] 4 locks held by kworker/u50:0/77:
[    8.669099]  #0: ffff5cae80010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x1a4/0x638
[    8.669108]  #1: ffff800080333de0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1cc/0x638
[    8.669112]  #2: ffff5cae854038f8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x38/0x1d4
[    8.669117]  #3: ffff5cae8a056cf8 (&phy->mutex){+.+.}-{3:3}, at: phy_init+0x4c/0x12c
[    8.669121]
               stack backtrace:
[    8.669122] CPU: 9 PID: 77 Comm: kworker/u50:0 Not tainted 6.10.0-rc5 #122
[    8.669124] Hardware name: Qualcomm CRD, BIOS 6.0.231221.BOOT.MXF.2.4-00348.1-HAMOA-1 12/21/2023
[    8.669125] Workqueue: events_unbound deferred_probe_work_func
[    8.669128] Call trace:
[    8.669129]  dump_backtrace+0x9c/0x11c
[    8.870384]  show_stack+0x18/0x24
[    8.870386]  dump_stack_lvl+0x90/0xd0
[    8.870391]  dump_stack+0x18/0x24
[    8.870393]  print_deadlock_bug+0x25c/0x348
[    8.870396]  __lock_acquire+0x10a4/0x2064
[    8.870399]  lock_acquire.part.0+0xc8/0x20c
[    8.870401]  lock_acquire+0x68/0x84
[    8.870403]  __mutex_lock+0x98/0x428
[    8.870407]  mutex_lock_nested+0x24/0x30
[    8.870410]  phy_init+0x4c/0x12c
[    8.870412]  qcom_snps_eusb2_hsphy_init+0x54/0x420 [phy_qcom_snps_eusb2]
[    8.870416]  phy_init+0xe0/0x12c
[    8.870418]  dwc3_core_init+0x484/0x1214
[    8.870421]  dwc3_probe+0xe54/0x171c
[    8.870424]  platform_probe+0x68/0xd8
[    8.870426]  really_probe+0xc0/0x388
[    8.870427]  __driver_probe_device+0x7c/0x160
[    8.870429]  driver_probe_device+0x40/0x114
[    8.870430]  __device_attach_driver+0xbc/0x158
[    8.870432]  bus_for_each_drv+0x84/0xe0
[    8.870433]  __device_attach+0xa8/0x1d4
[    8.870435]  device_initial_probe+0x14/0x20
[    8.870436]  bus_probe_device+0xb0/0xb4
[    8.870437]  deferred_probe_work_func+0xa0/0xf4
[    8.870439]  process_one_work+0x224/0x638
[    8.870441]  worker_thread+0x268/0x3a8
[    8.870442]  kthread+0x124/0x128
[    8.870443]  ret_from_fork+0x10/0x20

