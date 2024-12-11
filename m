Return-Path: <linux-arm-msm+bounces-41517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F25A9ECF46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 16:04:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33939281BB8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 15:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5608E1D3576;
	Wed, 11 Dec 2024 15:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZk2lAsD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2083E1C760D;
	Wed, 11 Dec 2024 15:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733929436; cv=none; b=Ws4iEYz+m0kDlXZLxiLFSxnNdrXKWjfchHEbx3Zg2GApClPAcWKd6OaCYWCn39Rr6aOwMPvXtxDsVfBpO0+OPx3319VdZOv2dJIhh76wIZ/poDjX7lGjFAQD8Otk1fuyCC+5LKhTfADeFrnRnKQS3X8iK7jVfk/RonrDzXJbKNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733929436; c=relaxed/simple;
	bh=mw71t82jD0CQi9LhZ5rxTxs5BlvVs5RdtW5M5Mj8cjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CGGGe986mlcAzwotb24rubq2Ii2rQNwT7rg+TXJA1e40cufA4Oi1eemr58/p4PXYqdlkr6R6QrdFy5DBDrMQukFW9Q3G4O/ySjYmOWnM5VAINJNa47EiZfvXRND30/GJD7VjkRSWqEvyf7EnjKSYmJDRCWBpdkNHgPIYExQSCF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZk2lAsD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964A2C4CED2;
	Wed, 11 Dec 2024 15:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733929435;
	bh=mw71t82jD0CQi9LhZ5rxTxs5BlvVs5RdtW5M5Mj8cjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sZk2lAsDaHyBb9LryMFq4mO8I9NSVrAnuMLLVLCC9YfHnhLMOGRQKQhQHtdcsAmku
	 RN7rLC8TaW9QCYFd66bWdU5OU6/dCZNyA78m8XQQeW0oAAqfxGkedEdrPylXTNduXh
	 a2E3WOHODHPc99uDgZNdRMRiZOcc8cDzjaYd+74fDNtxBrnjSHU5B9ZD2A/FiRd7pN
	 v0Aip42sBlJIooB+q0MHPcWgmEccpp98q3SkK2LOt1vbYYMf+Re8W+rvjzET9GERRD
	 7ztnixpyxsRAnpZxy5s3jgirxqGm4/d7ACzrewYXXFMc/+MTdFCA12EZUu7SuwkZW6
	 kodWqxKsU+Hzw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLOFr-000000003Kf-1Ft9;
	Wed, 11 Dec 2024 16:03:59 +0100
Date: Wed, 11 Dec 2024 16:03:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211145315.vaf7gbapieywcvau@thinkpad>

On Wed, Dec 11, 2024 at 08:23:15PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:

> > I just hit the following modem related error on reboot of the x1e80100
> > CRD for the second time with 6.13-rc2:
> > 
> > 	[  138.348724] shutdown[1]: Rebooting.
> >         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
> >         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> >         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> >         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
> >         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
> >         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
> >         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
> >         [  138.702604] mhi mhi0: Requested to power ON
> >         [  139.027494] mhi mhi0: Power on setup success
> >         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> > 
> > and then the machine hangs.
> > 
> > Do you know if there are any changes since 6.12 that could cause this?
> 
> Only 3 changes went in for 6.13-rc1 and they shouldn't cause any issues. One
> caused the regression with pcim_iomap_region(), but you submitted a fix for
> that and other two were trivial.

Ok, thanks.

> From the log, 'mhi mhi0: Resuming from non M3 state (SYS ERROR)' indicates that
> the firmware got crashed while resuming. So maybe you should check with ath12k
> folks.

This is the modem so I don't think the ath12k wifi folks are to blame
here.

It may be an older, existing issue that started triggering due to
changes in timing or something.

Is there anything you can do on the mhi side to prevent it from blocking
reboot/power off?

I'm guessing the mhi timeout, which I've hit in other paths like resume,
may trigger after a minute or two even if I never waited that long
before hitting reset during reboot.

Johan

