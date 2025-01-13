Return-Path: <linux-arm-msm+bounces-44905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F84A0C144
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 20:22:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B8463A6157
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 19:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A1441C5F28;
	Mon, 13 Jan 2025 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OZrTsEWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0441C5F0B;
	Mon, 13 Jan 2025 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736796158; cv=none; b=gDweUx2kEDyxmnoU5aPltAw3pQhjbEKI+e/M6wUa3tiPikxek6Zu3z6zSbypRMJ1yrNflNl4s5LtqnYNQSweocB0o21KHq0QE8ixGKqvZJb4VwYmXXbfNH1KltPGdKkowo6KKjLwgUUMXo62ymIkpMc1RNvhQqOxSC4OlfVWmd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736796158; c=relaxed/simple;
	bh=GYRl0JUZIQEqvO6vIvCY3c08OntyOFNpU1PBoZi0uB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlHDlmVNpxfb7bRj2J43OTg0A5HbXTPvmF1YngPs0Nw+w/fN4yqPRq3iitLQsQjxW/sY0FItH+l6fQWrhjo/9A+G4kC+Qq6LhvP1GKJ0ewPCtpRPxQS9dc7ghibQn0CLhV63FPU3bOiF8r8e5nc5VMVPMBNmP7saXW1oSKLOu4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OZrTsEWc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3415BC4CED6;
	Mon, 13 Jan 2025 19:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736796157;
	bh=GYRl0JUZIQEqvO6vIvCY3c08OntyOFNpU1PBoZi0uB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZrTsEWcVJZhrWFOkubBdWS+o+oe3T/Oe90mZhFD1EKM6zKWBITjGnXAEr6OCIcnk
	 FL18cswuKd2Aedr48cxyhG9PG4mJhUYERvMvYkQmnnnU39oUC2jePzKB8HA1hAHyvs
	 v2Un/pY/53ikG5UaPl6zyF6leOC4XUxp9yT9SYA+nsj+dEhY45U9wfMRp1ngSV4rLQ
	 /eJSx07dEwWnG6E9JP/gsJ5u92o3RsXW1erry8GEL28QBKYO2IEbZdXOd3xYMw9MY3
	 qP5e9TeDu2NEzgSx3dV5kxVXVQwdv+PilroCIxx8U/uXHyRbNHa+aXVoap7ul3zHNt
	 Wm6dlwnDnJg2w==
Date: Mon, 13 Jan 2025 19:22:35 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: pltfrm: fix use-after free in init error and
 remove paths
Message-ID: <20250113192235.GA1800842@google.com>
References: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250113-ufshcd-fix-v1-1-ca63d1d4bd55@linaro.org>

On Mon, Jan 13, 2025 at 07:13:45PM +0000, André Draszik wrote:
> devm_blk_crypto_profile_init() registers a cleanup handler to run when
> the associated (platform-) device is being released. For UFS, the
> crypto private data and pointers are stored as part of the ufs_hba's
> data structure 'struct ufs_hba::crypto_profile'. This structure is
> allocated as part of the underlying ufshd allocation.
> 
> During driver release or during error handling in ufshcd_pltfrm_init(),
> this structure is released as part of ufshcd_dealloc_host() before the
> (platform-) device associated with the crypto call above is released.
> Once this device is released, the crypto cleanup code will run, using
> the just-released 'struct ufs_hba::crypto_profile'. This causes a
> use-after-free situation:
> 
>     exynos-ufshc 14700000.ufs: ufshcd_pltfrm_init() failed -11
>     exynos-ufshc 14700000.ufs: probe with driver exynos-ufshc failed with error -11
>     Unable to handle kernel paging request at virtual address 01adafad6dadad88
>     Mem abort info:
>       ESR = 0x0000000096000004
>       EC = 0x25: DABT (current EL), IL = 32 bits
>       SET = 0, FnV = 0
>       EA = 0, S1PTW = 0
>       FSC = 0x04: level 0 translation fault
>     Data abort info:
>       ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>       CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>       GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>     [01adafad6dadad88] address between user and kernel address ranges
>     Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>     Modules linked in:
>     CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G        W          6.13.0-rc5-next-20250106+ #70
>     Tainted: [W]=WARN
>     Hardware name: Oriole (DT)
>     pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>     pc : kfree+0x60/0x2d8
>     lr : kvfree+0x44/0x60
>     sp : ffff80008009ba80
>     x29: ffff80008009ba90 x28: 0000000000000000 x27: ffffbcc6591e0130
>     x26: ffffbcc659309960 x25: ffffbcc658f89c50 x24: ffffbcc659539d80
>     x23: ffff22e000940040 x22: ffff22e001539010 x21: ffffbcc65714b22c
>     x20: 6b6b6b6b6b6b6b6b x19: 01adafad6dadad80 x18: 0000000000000000
>     x17: ffffbcc6579fbac8 x16: ffffbcc657a04300 x15: ffffbcc657a027f4
>     x14: ffffbcc656f969cc x13: ffffbcc6579fdc80 x12: ffffbcc6579fb194
>     x11: ffffbcc6579fbc34 x10: 0000000000000000 x9 : ffffbcc65714b22c
>     x8 : ffff80008009b880 x7 : 0000000000000000 x6 : ffff80008009b940
>     x5 : ffff80008009b8c0 x4 : ffff22e000940518 x3 : ffff22e006f54f40
>     x2 : ffffbcc657a02268 x1 : ffff80007fffffff x0 : ffffc1ffc0000000
>     Call trace:
>      kfree+0x60/0x2d8 (P)
>      kvfree+0x44/0x60
>      blk_crypto_profile_destroy_callback+0x28/0x70
>      devm_action_release+0x1c/0x30
>      release_nodes+0x6c/0x108
>      devres_release_all+0x98/0x100
>      device_unbind_cleanup+0x20/0x70
>      really_probe+0x218/0x2d0
> 
> In other words, the initialisation code flow is:
> 
>   platform-device probe
>     ufshcd_pltfrm_init()
>       ufshcd_alloc_host()
>         scsi_host_alloc()
>           allocation of struct ufs_hba
>           creation of scsi-host devices
>     devm_blk_crypto_profile_init()
>       devm registration of cleanup handler using platform-device
> 
> and during error handling of ufshcd_pltfrm_init() or during driver
> removal:
> 
>   ufshcd_dealloc_host()
>     scsi_host_put()
>       put_device(scsi-host)
>         release of struct ufs_hba
>   put_device(platform-device)
>     crypto cleanup handler
> 
> To fix this use-after free, register the crypto cleanup handler against
> the scsi-host device instead, so that it runs before release of struct
> ufs_hba.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
> In my case, as per above trace I initially encountered an error in
> ufshcd_verify_dev_init(), which made me notice this problem. For
> reproducing, it'd be possible to change that function to just return an
> error.
> 
> Other approaches for solving this issue I see are the following, but I
> believe this one here is the cleanest:
> 
> * turn 'struct ufs_hba::crypto_profile' into a dynamically allocated
>   pointer, in which case it doesn't matter if cleanup runs after
>   scsi_host_put()
> * add an explicit devm_blk_crypto_profile_deinit() to be called by API
>   users when necessary, e.g. before ufshcd_dealloc_host() in this case

Thanks for catching this.

There's also the option of using blk_crypto_profile_init() instead of
devm_blk_crypto_profile_init(), and calling blk_crypto_profile_destroy()
explicitly.  Would that be any easier here?

Please also include a Fixes tag in the commit message.

- Eric

