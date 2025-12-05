Return-Path: <linux-arm-msm+bounces-84520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D6CA9633
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 22:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE468300AB00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 21:30:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47A84218AB9;
	Fri,  5 Dec 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GF7xIsZE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C5140855
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 21:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764970200; cv=none; b=DLdFEdDmSvOgZllYGf8z4waTfnmztNecuAk//zvEj5X38qKrmiOb6LcyTgvJCDphZy8TBeRH6Uv0U9QR5oikgWFCl3n1KsH9i8D7sSGkAsH95zpBTIaPkB4gn2gF2etXYT8PWWN7Fjn1ZOM2LvzB9ZeOzUHGnBnEX6ppM2pc0zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764970200; c=relaxed/simple;
	bh=Wat73citxRfjTfvKv7uOEzz1Pks+to1ns7XuxiJ2Xpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oasHFBiNl5G22ly6HZxLDDfZw8q8lqRgJqw8Ql3D/szEpGmYmX3Lsiaat/uA70rL438ZexUBdugoMGIg6WxccFC+88ayAF3L5fwKDHUxb7XprwUn77W1vW1wRv4ABJnRtUNDChXdbaYnKQOq2aX809QpjQnkIEw/FFS5iAQnF60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GF7xIsZE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3697FC4CEF1;
	Fri,  5 Dec 2025 21:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764970200;
	bh=Wat73citxRfjTfvKv7uOEzz1Pks+to1ns7XuxiJ2Xpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GF7xIsZEevHR2TvzVOgtaQJYt3cX4vrLPuut4at/iIrOgwImO3H6pKRj5M8uoTQCh
	 KYxV+nJBWFo9XgBP1tGrX8t8mXg4ikQ+CjFHieyT2lH9vVLbm8aCskI9MGUbcrVd57
	 tjnide0sHBrtBAFQqsMSJ9DAY34Gn/9NgZwUt3KOid+qt6k4247XB9pftKYXXH/ZzW
	 CIqA9LDExgb5mTE/N6vWqL5lHNUcdD2bJPL7uvDKrJrJ0LTfEH1IkkHZWLv15maede
	 MYyq/MLd85bFzyCHMNJdzZeioyP5zb7DWJ/VBAnXsuPOrZN3qpcEqVd0sy2ua8BsLj
	 FL+wB90fOkq+g==
Date: Fri, 5 Dec 2025 15:36:18 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH] phy: qcom-qusb2: Fix NULL pointer dereference on early
 suspend
Message-ID: <r33k3aif4lzwfwashvkstqbxyncrr2yrtqejobfj6pm65wasi3@gyy3zex3u7lx>
References: <20251205160437.259125-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251205160437.259125-1-loic.poulain@oss.qualcomm.com>

On Fri, Dec 05, 2025 at 05:04:37PM +0100, Loic Poulain wrote:
> Reorder runtime PM setup to ensure pm_runtime_forbid() is applied before
> enabling runtime PM.

Your commit message is pretty good, but in the future please consider
following the documentation [1] and really start your commit message by
establishing the problem. The "most significant bit" of your change
request isn't "let's reorder something", it's something along the line
of "enable before forbid can result in autosuspend, which results in
NULL pointer dereference".

[1] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

> This avoids possible early autosuspend and prevents
> qusb2_phy_runtime_suspend() from being called before driver data is
> initialized, which could otherwise lead to a NULL pointer dereference:
> 
> ```
> Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a1
> [...]
> CPU: 0 UID: 0 PID: 11 Comm: kworker/0:1 Not tainted 6.16.7+ #116 PREEMPT
> Workqueue: pm pm_runtime_work
> pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : qusb2_phy_runtime_suspend+0x14/0x1e0 [phy_qcom_qusb2]
> lr : pm_generic_runtime_suspend+0x2c/0x44

If you pipe the log through "./scripts/decode_stacktrace.sh vmlinux . ."
we get these decoded.

But that said, I'm pretty sure that what fails is the attempt to pull
cfg out of NULL on the second line?

> [...]
> ```
> 
> Fixes: 891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qusb2.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> index b5514a32ff8f..97bc3755a390 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
> @@ -1093,13 +1093,14 @@ static int qusb2_phy_probe(struct platform_device *pdev)
>  		or->hsdisc_trim.override = true;
>  	}
>  
> -	pm_runtime_set_active(dev);
> -	pm_runtime_enable(dev);
> +

Doesn't this end up being two blank lines?

>  	/*
> -	 * Prevent runtime pm from being ON by default. Users can enable
> -	 * it using power/control in sysfs.
> +	 * Enable runtime PM support, but forbid it by default.
> +	 * Users can allow it again via the power/control attribute in sysfs.

I think this warrants adding "TODO: Removing the pm_runtime_forbid()
might allow autosuspend to invoke qusb2_phy_runtime_suspend() to
dereference the NULL drvdata" here.


But, if we know what the problem is, perhaps we should just fix it right
away?

Looks like the fix for the NULL pointer dereference is to move the
dev_set_drvdata() and phy_set_drvdata() above thus hunk.

And the "problem statement" stating why we're doing this change (which
still makes sense) is that "a wasteful autosuspend might happen between
pm_runtime_enable() and the pm_runtime_forbid()".

Regards,
Bjorn

>  	 */
> +	pm_runtime_set_active(dev);
>  	pm_runtime_forbid(dev);
> +	pm_runtime_enable(dev);
>  
>  	generic_phy = devm_phy_create(dev, NULL, &qusb2_phy_gen_ops);
>  	if (IS_ERR(generic_phy)) {
> -- 
> 2.34.1
> 
> 

