Return-Path: <linux-arm-msm+bounces-42340-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473419F3163
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86543163D5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 13:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FB94204C25;
	Mon, 16 Dec 2024 13:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s8rucFmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992A204597;
	Mon, 16 Dec 2024 13:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734355208; cv=none; b=I3li5seSkiPhhc5W9CuDmoffbI9fALQ0PZ82uwKIe6DzVZBm0EgQc6iX3SrtMnpH2tNV0JrqgxUdaJhGML+vJDozGtdrPNtuiq4Pv1wQqAC9TIdOwg8RQJsBrrCzLY6hbQFbf2vQ2AQyiTLL5eknfw22O2paobRBhJrk9I/cvyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734355208; c=relaxed/simple;
	bh=XWQtd3OIQ1+hddYdelD8wN1PPbNt/mGKC46IATBq2tk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g0d+fCuEEfQfBJnI/4pbwKyyCnoau/ABxqNMO17PJwxCnifanTihTROA66p/MtxfZO6D6rwm/NRsr83yOiobVUalLAMHM9u6h8odTer/XSC3CllnY6Opj1DBnedTi/hG/v1EIiM/ysWXEuma7KEOXqCNPtrF54KYsfQ/aSMWcjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s8rucFmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB17C4CED0;
	Mon, 16 Dec 2024 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734355207;
	bh=XWQtd3OIQ1+hddYdelD8wN1PPbNt/mGKC46IATBq2tk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s8rucFmEvIC4Pt04PRIjO/8QEGuHQOul3hZE/Ve1OXyMYy3HwBqnvu58Mpt6xz8TF
	 AzhvaNq97p/oZtzP1x7DN7GHDuz/aXwO2BINNhyY0sSaXDCulGRJdh22TThdmGiRQx
	 GTMKOCtyuKoOm54fS1D837VbVh9g2AlOqUQo+oPohX7xk5S4I/30CdVUNlxrVJYXmp
	 lRYlcndUOQaSYJi+RqhtNtxzt8TmMs+1IqNE+OfyNX4zN4aGnX4C5rn9mDyHFXp1qq
	 8mfL1b+h1ibCAi4eIwxCCt0rgPI3QE3o55s+ToPMCToDgrQCvH9y6u2DeV11HJuh1c
	 To1Sx90GUdUBQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNB17-000000001rn-3iUp;
	Mon, 16 Dec 2024 14:20:09 +0100
Date: Mon, 16 Dec 2024 14:20:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241216074021.kwoid2747o7piquv@thinkpad>

On Mon, Dec 16, 2024 at 01:10:21PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> > On Wed, Dec 11, 2024 at 08:23:15PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> > 
> > > > I just hit the following modem related error on reboot of the x1e80100
> > > > CRD for the second time with 6.13-rc2:
> > > > 
> > > > 	[  138.348724] shutdown[1]: Rebooting.
> > > >         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
> > > >         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> > > >         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> > > >         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
> > > >         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
> > > >         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
> > > >         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
> > > >         [  138.702604] mhi mhi0: Requested to power ON
> > > >         [  139.027494] mhi mhi0: Power on setup success
> > > >         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> > > > 
> > > > and then the machine hangs.

> Could be. But the issue seems to be stemming from the modem crash while exiting
> M3. You can try removing the modem autosuspend by skipping the if condition
> block:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pci_generic.c?h=v6.13-rc1#n1184
> 
> If you no longer see the crash, then the issue might be with modem not coping
> up with autosuspend. If you still see the crash, then something else going wrong
> during reboot/power off.

I've only hit this issue three times and only since 6.13-rc2. So not
sure how useful that sort of experiment would be.

> > Is there anything you can do on the mhi side to prevent it from blocking
> > reboot/power off?
> 
> It should not block the reboot/power off forever. There is a timeout waiting for
> SBL/Mission mode and the max time is 24s (depending on the modem). Can you share
> the modem VID:PID?

I just hit the issue again and can confirm that it does block
reboot/shutdown forever (I've been waiting for 20 minutes now).

Judging from a quick look at the code, "Wait for device to enter SBL or
Mission mode" is printed by mhi_fw_load_handler(), which in turn is only
called from the mhi_pm_st_worker() state machine.

I can't seem to find anything that makes sure that the next state is
ever reached, so regardless of the cause of the modem fw crash (if
that's what it is) the hung reboot appears to be a bug in mhi.

This is with the SDX65 modem in the x1e80100 CRD:
	
	17cb:0308

Johan

