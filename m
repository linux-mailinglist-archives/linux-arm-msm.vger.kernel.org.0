Return-Path: <linux-arm-msm+bounces-42774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD099F7779
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 09:36:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 977847A260F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD00B21770B;
	Thu, 19 Dec 2024 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q87MNCIe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C31FC7DB;
	Thu, 19 Dec 2024 08:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734597388; cv=none; b=gvDK+Knri7EXqmEDG2s9tJ4kGVb1Q56lZ7wrskFtb1kxvC4qHLm0lKkdMH5HfGOWL1FQrLtzHOobcO7OWz7IdyuwRCK7K3Uv0MizFYW+F9qTJgtuc3wiJylPreG51EGtstJERrK6achXPLYoM71mpMjiAjo5DlD8sxD48S7kP40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734597388; c=relaxed/simple;
	bh=It2N0DIRz63mOtpXdqeynDJCYLh50whKrkYv/EBFAOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9g0I9H2CIpExtm8OSEfpm5FxWlzhrf7hEHAwE3J7n8G8n3n7gQMHIxTxvJ2TfQimFB5LpdqewjWqsy9pEp6XLhzyY8ozDDoeruNmcl74JkVwzU3XdygEu3B8Q83oaQlE+JCqcYBPJHpUH38/TcnDxg0cv4O3kZpFsSWkcDpkl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q87MNCIe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D37C4CED0;
	Thu, 19 Dec 2024 08:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734597388;
	bh=It2N0DIRz63mOtpXdqeynDJCYLh50whKrkYv/EBFAOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q87MNCIe2ZiqBH07cHiUquSBlg8VEHMuZxsue7JOW+CNHYu839wi4lEOymQnC88Sp
	 7y70+KGahIMtPJW9nhPiTBYi29aaVSwpAm5FalBTfE7ry/IZviMu9SsRAsgYM24so+
	 SV2vk5O7LPS9v9yTXRE5Fgx8EVUTHN12OA3xuPrylZqeIqgyayXZIa0OEsUmhS89+E
	 nbMbYzMEJO7kQn2Cf2gBX4sg5BsaAvWB8a1lvqIo23ncbqSuRG95c/Ew1FimLmBNqD
	 Ifxn9UCuPbmvJ1ciI9JHlQtA345GECIFwVa/0mnHBVcHt0MkrgFaarZU2g/M9HGyYV
	 54v4kJYlC/lgQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tOC1I-000000007Bk-3Ohx;
	Thu, 19 Dec 2024 09:36:32 +0100
Date: Thu, 19 Dec 2024 09:36:32 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z2PbEPYpqFfrLSJi@hovoldconsulting.com>
References: <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
 <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
 <20241218140910.ysovysnvns26vbmd@thinkpad>
 <Z2LbnoSplfVNmNaa@hovoldconsulting.com>
 <20241218183555.qste4gve7vnvdml2@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218183555.qste4gve7vnvdml2@thinkpad>

On Thu, Dec 19, 2024 at 12:05:55AM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 18, 2024 at 03:26:38PM +0100, Johan Hovold wrote:
> > On Wed, Dec 18, 2024 at 07:39:10PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Dec 18, 2024 at 02:55:02PM +0100, Johan Hovold wrote:

> > > > But that's not going to happen as that reset is what is currently
> > > > causing the deadlock and which would simply be skipped if you switch to
> > > > pci_try_reset_function().
> > > > 
> > > 
> > > mhi_pci_runtime_resume() will queue the recovery_work() and return. So I was
> > > hoping that by the time pci_try_reset_function() is called, the lock would be
> > > available.
> > 
> > We can't rely on luck with timings, and this is the very reason for the
> > deadlock I'm currently seeing (i.e. the recovery thread is still running
> > when another thread grabs the lock and waits for the recovery thread to
> > finish).
> > 
> > Perhaps the recovery work should be done synchronously in the resume
> > handler to avoid such issues.
> 
> Synchronously? How can that help when the recovery_work() cannot acquire the
> lock?

During system suspend, pm core waits for any on-going runtime resume
operations to complete before taking the device lock and suspending the
device.

Unfortunately, that's currently not the case during shutdown() where
those operations are reversed, so that would indeed need to be addressed
first.

But what the driver is currently doing looks highly questionable as it
returns success when it failed to resume the device (after scheduling
the asynchronous recovery work).

Johan

