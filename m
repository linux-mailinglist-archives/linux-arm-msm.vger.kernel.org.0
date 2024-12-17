Return-Path: <linux-arm-msm+bounces-42497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D559F4828
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 10:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 64A461881DAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 09:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 596CB1DE3D7;
	Tue, 17 Dec 2024 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYWIq2W4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2791D5141;
	Tue, 17 Dec 2024 09:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734429457; cv=none; b=UQxXaG9RU5dcnIKqzRTkzplaGWIWEQvmRs6R0ovR9hvu55/LWzWaGIKXWpfGMOzhx/aKknqjw189S1wmvCb67JrMJQDTFl9AmhGa4uoY/E8R2RPFIRXcdEQAtGCzDz1SuqDUqiXPafigb3RERwaIQ9SupE5rHqAjS41bPTUIS1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734429457; c=relaxed/simple;
	bh=LDC+ULAnGHRXKXKhVLiwRfLf2A87PEO93BZE4W7WmGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwb5v+1neIj1JAxEujTjGcIP8fkiUDNUPJqJWNZIgE9VLEKLQxyYgSZ8cp9VjCDs8LW2LmA2+vtmw7wkfh2R01ZlywvYOBcTv30h1ZJtTp3vAYEk5z+BGoubXUwAAIOLHrOeyM6Djx8Fldm9Y7odekZxkt+SDtOPtyfW6UetXCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYWIq2W4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7FDC4CED3;
	Tue, 17 Dec 2024 09:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734429456;
	bh=LDC+ULAnGHRXKXKhVLiwRfLf2A87PEO93BZE4W7WmGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VYWIq2W4Xeo0l+LKDOnVcAyd78Z7qircxd1vPXOXI3uvz/4v00ht7ogLWnFKnUo02
	 mZHIlwuuU53K2/Q+tbj32Y+3Z/KVohqCMo2tqvi67Isko3aNUKlHt6jkMOjCAPEZcO
	 zJUiO85FlhArwh72jWjABbM53woTDqC4Vpf3vNP/gq8ygCH4liqFi6OhgVYaB0o+2I
	 zAlyWQBHa0tACs81Ispdsb5Y15Ei4BTFwRzmn2WNNYHPAGFmz0SaDOTTT8tohpelvW
	 WXAaOBsX1rmeLGmLPLmiW3N9yBOnf9j54qgUonFDRVGFzGPme2aooBsrzW9YKLJvHE
	 DVlMBo9PSZ0tQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNUKg-000000002F4-46sZ;
	Tue, 17 Dec 2024 10:57:39 +0100
Date: Tue, 17 Dec 2024 10:57:38 +0100
From: Johan Hovold <johan@kernel.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z2FLErzdRAI73jm8@hovoldconsulting.com>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <CAMZdPi_0oiTFmgkq0hAhamVq-Noqa+jGDLZ_6yVaqHvcO+N=nA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZdPi_0oiTFmgkq0hAhamVq-Noqa+jGDLZ_6yVaqHvcO+N=nA@mail.gmail.com>

On Mon, Dec 16, 2024 at 05:25:23PM +0100, Loic Poulain wrote:
> On Mon, 16 Dec 2024 at 15:13, Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> > On Mon, Dec 16, 2024 at 02:20:09PM +0100, Johan Hovold wrote:
> > > On Mon, Dec 16, 2024 at 01:10:21PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> > > > > On Wed, Dec 11, 2024 at 08:23:15PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> > > > >
> > > > > > > I just hit the following modem related error on reboot of the x1e80100
> > > > > > > CRD for the second time with 6.13-rc2:
> > > > > > >
> > > > > > >       [  138.348724] shutdown[1]: Rebooting.
> > > > > > >         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
> > > > > > >         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> > > > > > >         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> > > > > > >         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
> > > > > > >         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
> > > > > > >         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
> > > > > > >         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
> > > > > > >         [  138.702604] mhi mhi0: Requested to power ON
> > > > > > >         [  139.027494] mhi mhi0: Power on setup success
> > > > > > >         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> > > > > > >
> > > > > > > and then the machine hangs.

> > > I've only hit this issue three times and only since 6.13-rc2. So not
> > > sure how useful that sort of experiment would be.

> > I'm not sure where exactly it got stuck. I've asked Qcom folks to reproduce this
> > issue. We will investigate and hopefully get back with a fix asap.
> >
> > > This is with the SDX65 modem in the x1e80100 CRD:
> > >
> > >       17cb:0308
> 
> I have another MHI modem model, but will try to reproduce during the
> week, any idea on the bug rate?

I've now hit this four times. And only since rc2. So I guess that's
something like four times in a hundred reboots or so.

I added some printks to the pci_generic driver this morning and have
been running a boot loop for one hundred iterations without hitting the
issue even once, however. Perhaps the printks alters the timing enough
to avoid the fw crash or race.

Johan

