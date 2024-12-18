Return-Path: <linux-arm-msm+bounces-42682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AADEB9F67C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 14:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 068C616A14A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 13:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39A8F1B0425;
	Wed, 18 Dec 2024 13:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R9PMG28q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0970A158853;
	Wed, 18 Dec 2024 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734530100; cv=none; b=P3rqGXWYPUEdT82ylXNsBmVTA26mktfmz9phLtQ0w0YU80QnB8lOIBhRAvi3nhmqHC8CjlrdXwqfSA2SL5saBocmgeCmVyEd/Yn2qQfiSIPxYFR1Bonre27flkwbpDjNTk2LNVuRWZKOghw+0H+jCYmaeYiOBAjkEd5QI/s2log=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734530100; c=relaxed/simple;
	bh=SrJj45DUyH2I/e7xV3MMUieYx6rajlhRHQCw0UR/48E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZdq4XJzmHVqWOLx9F62t3/vlYFUdcmQVETewaWpYuvMq1vkIj4bfuqnbfIMFHG1weF79dliJRrBgyNK89kdxsVdNUPuhx+SV5mbyhfz2pjCuQp92qs4WKqm0dhfpfgecYdQXxD2L9T+ibZ+bCvMIn1Kaa3ELYcu+z6dYx5XIiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R9PMG28q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87106C4CECD;
	Wed, 18 Dec 2024 13:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734530099;
	bh=SrJj45DUyH2I/e7xV3MMUieYx6rajlhRHQCw0UR/48E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R9PMG28qhOuCv14KhYctBfyBAhccox14hrFTYHDY7+BIJ7GpiMsVD3c7IMUCdxQnN
	 c73W/O3utHB7QCKn1qDAu8lT+NOdjdZPEW+tEKN3rp+A9PHeT7QIOvquiEdk1tAuCl
	 puw7C5b6Wi/f/yYbKGfKIj1tE1YaqWt8R5dMx2PXJq7tqEaP0yXUx9q9M+UhmzDroX
	 HxiLF6DnppW1YGglojP5qnvTjB6iSNXQddQjEnVOV9MYYeKWOnLoD/s6a16C7SzVe8
	 fg0cp8IiQmFhbIIOet2lO2qSHgeGlAdgozjaGVmgQlmUHulmUSJQ5wGiS/zKmuxhLh
	 qfyHhG7rD5dYA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNuVy-000000001yE-3wPy;
	Wed, 18 Dec 2024 14:55:03 +0100
Date: Wed, 18 Dec 2024 14:55:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218123019.py57s4r3takm2fs6@thinkpad>

On Wed, Dec 18, 2024 at 06:00:19PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 18, 2024 at 01:02:39PM +0100, Johan Hovold wrote:
> > On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> > 
> > > > I've tracked down the hang to a deadlock on the parent device lock.
> > > > 
> > > > Driver core takes the parent device lock before calling shutdown(), and
> > > > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > > > finish.
> > 
> > > Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> > > instead of pci_reset_function() in mhi_pci_recovery_work().
> > > 
> > > If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> > > not need to worry in that case since the host is going to be powered off anyway
> > > (and so the device).
> > 
> > That may work. But note that I've now also seen this deadlock during
> > suspend (i.e. when the device is not going away). The
> > pci_try_reset_function() should avoid the deadlock here too, but we'll
> > end up in funny state.
> 
> Hopefully, recovery_work() started by mhi_pci_runtime_resume() would be able to
> reset the device.

But that's not going to happen as that reset is what is currently
causing the deadlock and which would simply be skipped if you switch to
pci_try_reset_function().

Johan

