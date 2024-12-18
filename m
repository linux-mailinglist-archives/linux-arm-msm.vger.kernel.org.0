Return-Path: <linux-arm-msm+bounces-42613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C0B9F604E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 09:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 982DF18834A1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 08:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BFE1791F4;
	Wed, 18 Dec 2024 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbpiSSi/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2393D14F9E2;
	Wed, 18 Dec 2024 08:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734511243; cv=none; b=hXUeOyidrwEuox8VWEUYRvSpFttWls4msORYbvusplpnqPSaWVtMylautOpegiOc0WRkSChmpS+z5++iz6eLOm26r58BSE40YDk5SSGyYxcxpPLcxvbDmGnkEMAeGlzDDCSG4qLSmkQnxKD7pSDd8JLecBVBefaYfR5ojyc7UAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734511243; c=relaxed/simple;
	bh=El/Q2d9tnenegpAEyb5i9kqTbQyLKRRBvG/mOP/vMtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CP5SrrSG/3SsA2tk3w+VZgfXi0tPI9H/5NsWNso1O62g25HVnzXJtCWFWQ2/unfQ93pASYRcYF1lLjymhwDy1yInFSISleYkiYKeBzKYhN2nOt9D0lLAN1/f+Od+RP/KEmAs67HvCNk/l4HQmOJFgo2tGQ9pPj5tO7M4gR12dak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbpiSSi/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5581C4CECE;
	Wed, 18 Dec 2024 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734511242;
	bh=El/Q2d9tnenegpAEyb5i9kqTbQyLKRRBvG/mOP/vMtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jbpiSSi/5OPaGcju8GTYOZpp5BjR9zuUIMKwjT3NptOBbc8wF4VzYvP/u3Be2OtV3
	 njhhaVHDLGKqAvhtxXgyDXm64/ycsBQ30TvtxyIijzgPRh5+C5M2SfsxG7wsUvKvH8
	 /m6vlXk1cfAlCHU8KAY8GXMgTz4eprlZRcXo8fBHzSkOQThENShe4tEn4B45YRUmRW
	 wKqZsTxHWTp8Dh8spO7pSnEvVITtKdAnDh1YhEt9n536AlxB19N0zCWSNfP1Irz5fx
	 jsqtcoAlGmLUavxG8fvJGt+4MmlQF6iuwOG40+Jcdk+mTLkIcK+6EEt9BaJ6wetkod
	 A6WOT1fE9RcXA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNpbp-000000001lo-45eN;
	Wed, 18 Dec 2024 09:40:46 +0100
Date: Wed, 18 Dec 2024 09:40:45 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216141303.2zr5klbgua55agkx@thinkpad>

On Mon, Dec 16, 2024 at 07:43:03PM +0530, Manivannan Sadhasivam wrote:
> On Mon, Dec 16, 2024 at 02:20:09PM +0100, Johan Hovold wrote:
> > On Mon, Dec 16, 2024 at 01:10:21PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:

> > I just hit the issue again and can confirm that it does block
> > reboot/shutdown forever (I've been waiting for 20 minutes now).
> 
> Ah, that's bad.
> 
> > Judging from a quick look at the code, "Wait for device to enter SBL or
> > Mission mode" is printed by mhi_fw_load_handler(), which in turn is only
> > called from the mhi_pm_st_worker() state machine.
> > 
> > I can't seem to find anything that makes sure that the next state is
> > ever reached, so regardless of the cause of the modem fw crash
> 
> This code will make sure:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pm.c?h=v6.13-rc1#n1264
> 
> But then it doesn't print the error and returns -ETIMEDOUT to the caller after
> powering down MHI. The caller (mhi_pci_recovery_work), in the case of failure,
> unprepares MHI and starts function level recovery.
> 
> > (if
> > that's what it is) the hung reboot appears to be a bug in mhi.

I've tracked down the hang to a deadlock on the parent device lock.

Driver core takes the parent device lock before calling shutdown(), and
then mhi_pci_shutdown() waits indefinitely for the recovery thread to
finish.

But the mhi recovery thread ends up trying to take the same parent
device lock in pci_reset_function() when recovery fails:

[  339.351915] shutdown[1]: Rebooting.
[  339.724498] arm-smmu 3da0000.iommu: disabling translation
[  339.760134] mhi mhi0: Resuming from non M3 state (SYS ERROR)
[  339.766211] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
[  339.773158] mhi-pci-generic 0005:01:00.0: device recovery started

The recovery thread is running before shutdown() is called.

[  339.779638] mhi-pci-generic 0005:01:00.0: __mhi_power_down
[  339.779650] mhi-pci-generic 0005:01:00.0: mhi_pci_shutdown
[  339.785422] wwan wwan0: port wwan0qcdm0 disconnected
[  339.791001] mhi-pci-generic 0005:01:00.0: mhi_pci_remove
[  339.791006] mhi-pci-generic 0005:01:00.0: mhi_pci_remove - cancel work sync

shutdown() waits for the recovery thread to finish

[  339.825892] wwan wwan0: port wwan0mbim0 disconnected
[  339.831320] wwan wwan0: port wwan0qmi0 disconnected
[  339.904249] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
[  340.025390] mhi mhi0: Requested to power ON
[  340.233771] mhi mhi0: Power on setup success
[  340.233954] mhi mhi0: Wait for device to enter SBL or Mission mode
[  340.238272] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event timeout_ms = 8000
[  348.400082] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event returns, ret = -110

The recovery thread fails to power up the device.

[  348.419967] mhi-pci-generic 0005:01:00.0: __mhi_power_down
[  348.472665] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
[  348.725069] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - returns
[  348.742644] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - mhi unprepare after power down
[  348.762737] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - pci reset
[  348.780904] mhi-pci-generic 0005:01:00.0: pci_reset_function

And tries to reset the device, which triggers the deadlock when
trying to take the already held parent (bridge) device lock.

Johan

