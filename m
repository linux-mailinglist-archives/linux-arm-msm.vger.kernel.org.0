Return-Path: <linux-arm-msm+bounces-42672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1689F6578
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 13:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACE7165E7D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642E219CC24;
	Wed, 18 Dec 2024 12:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxsgXDMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CDC18E047;
	Wed, 18 Dec 2024 12:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734523356; cv=none; b=h84slYgqcdfIe8pqNRdMB6LPA+LA+PLo8AGReLm/BoxULkOM2PgIwhIeiY63tRjQUePL22dztr2k0kpSuEcKqIh0tiI9ct3PPATm4DTHnyhDrMJsMTNtw5AVhWJgfX2gtjaW7wgpibLpVpHNDVxfvVYP34JiWsBpox+aa56wgr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734523356; c=relaxed/simple;
	bh=3Cwj7Gx5cARel8PFfo5gtUvDycrf6l+ez9Cspd+nl50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhl9MGwTQXtPTSF8xy7X7oAMGXvZO9JMVoP+6I3ltQO3951hnmq6+gS2BPxU31yRge8Has2NjXCMRxK8V9EjdSBwA/l8G8oWQyZv/HCBLolvkteACU548aPhsoASIuEzK/ZlYHBqFFu5SZUiFyCrh8HUpBIxB+G1qggqS5GprhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxsgXDMN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA63FC4CECE;
	Wed, 18 Dec 2024 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734523355;
	bh=3Cwj7Gx5cARel8PFfo5gtUvDycrf6l+ez9Cspd+nl50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LxsgXDMNuSnI7NAQ1LlssFu71ndEMEn0HBMJkHCoGt98Ed1YrZ9QHenDfBbGYdsiC
	 CHd+Jx/TB7M8xEKx4U5acvpmuH+A5A6ItbnoUkpIUxx/e8DlEj9S9xveovRvMlC/Zb
	 nIOqno6MvMIhIx1EvIRCrVfsOF6wBy3bDYdF7ehlmZGuHkJ6FwezzQchNharGzoa1x
	 sxP6Ia93Aro3xyTYVXrqAurg/zeZ/ppLmHJpOWymQh9GwmuFl7YhvT+BMJfFYoVD1B
	 OPF6CdwhDNoDgYVma1O8VPOU1dfgZUg3/T8D4atk6vh5O3P9fkDtddOZOevsuLGf2/
	 PRfeUSzpVS8ZQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNslD-000000007ts-36c3;
	Wed, 18 Dec 2024 13:02:39 +0100
Date: Wed, 18 Dec 2024 13:02:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z2K53-As8w4IH06U@hovoldconsulting.com>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218113830.efflnkxz7qu24xux@thinkpad>

On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:

> > I've tracked down the hang to a deadlock on the parent device lock.
> > 
> > Driver core takes the parent device lock before calling shutdown(), and
> > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > finish.

> Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> instead of pci_reset_function() in mhi_pci_recovery_work().
> 
> If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> not need to worry in that case since the host is going to be powered off anyway
> (and so the device).

That may work. But note that I've now also seen this deadlock during
suspend (i.e. when the device is not going away). The
pci_try_reset_function() should avoid the deadlock here too, but we'll
end up in funny state.

Now I'd also like to know why I'm suddenly seeing these runtime PM
resume errors of this modem. Haven't seen them before 6.13-rc, and I'm
not sure that it's really the firmware that is crashing left and right
all of a sudden.

Johan

