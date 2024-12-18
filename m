Return-Path: <linux-arm-msm+bounces-42686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A89609F6869
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 15:27:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E4D189389E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 14:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E971C173D;
	Wed, 18 Dec 2024 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D89w/oTo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF051ACEA9;
	Wed, 18 Dec 2024 14:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734531995; cv=none; b=lKAXqP4oH0LrgT5fehhg0McmxGRKAR0KHlwO4xISUMS56JxZwE7u1ut9VHmtjaTpCas6M9QzDnbs9e4579TUkDjTuG5ZS6nLCZJ8pnCgEKtjpsN2ZhYAlejQXwLgyNg2yXgDBhiD1AwcouCKAeW5W4tI1cKB8gZNw/qMEk6OiZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734531995; c=relaxed/simple;
	bh=BL4MPgDub0pCFY9zwpSNxh7+f4BtSjahXF+c/AaN+AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUgbM/MvTX68PgFVWe/Jv27IdIGKp+h7jnFcl0g1OJjvQMdzsWYxfK4NGLtqgz2Qra+scP3HkVEsVU81tTO9NhtOkfRqBn5P5srCU5GgB00llkotIOaUc8mFl6sIpzLx14iubSORyPU54N4nz+cuPkkjqqbLVv+iNx0yBHlhOTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D89w/oTo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27784C4CECD;
	Wed, 18 Dec 2024 14:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734531995;
	bh=BL4MPgDub0pCFY9zwpSNxh7+f4BtSjahXF+c/AaN+AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D89w/oToBzGvcUU4mz7QX4rp/FxXj5JJagg3Ii74UdTfyd1V6khX6aURlFm7qRxOf
	 BQlpuKpg+qkWQLDU9jn50Klvs+USJhheznwc88/vz85quI1svD9NSYqKN0KU8NsD/h
	 2UF116YC3Wtol/BJQg2LGq3Y6Hca1ibRUWZA6T7+RhzcZYmXpLlsWNy5uVjk5KWaqA
	 QFZLmlOx3igJtJJPWfHd8unBI924ua1DEHFCncd15pdmRCa61fQfNBV55VWS5ykt5I
	 sCqaCVBhW32PhJBJ6I5FJ+doKBxJNW2+vemJc7i+IBUCFicUCPyIZ9/p41uQITZay3
	 bO53ZEgOANNUQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tNv0Y-000000002mf-28TE;
	Wed, 18 Dec 2024 15:26:39 +0100
Date: Wed, 18 Dec 2024 15:26:38 +0100
From: Johan Hovold <johan@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <Z2LbnoSplfVNmNaa@hovoldconsulting.com>
References: <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
 <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
 <20241218140910.ysovysnvns26vbmd@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218140910.ysovysnvns26vbmd@thinkpad>

On Wed, Dec 18, 2024 at 07:39:10PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 18, 2024 at 02:55:02PM +0100, Johan Hovold wrote:
> > On Wed, Dec 18, 2024 at 06:00:19PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Dec 18, 2024 at 01:02:39PM +0100, Johan Hovold wrote:
> > > > On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> > > > > On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> > > > 
> > > > > > I've tracked down the hang to a deadlock on the parent device lock.
> > > > > > 
> > > > > > Driver core takes the parent device lock before calling shutdown(), and
> > > > > > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > > > > > finish.
> > > > 
> > > > > Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> > > > > instead of pci_reset_function() in mhi_pci_recovery_work().
> > > > > 
> > > > > If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> > > > > not need to worry in that case since the host is going to be powered off anyway
> > > > > (and so the device).
> > > > 
> > > > That may work. But note that I've now also seen this deadlock during
> > > > suspend (i.e. when the device is not going away). The
> > > > pci_try_reset_function() should avoid the deadlock here too, but we'll
> > > > end up in funny state.
> > > 
> > > Hopefully, recovery_work() started by mhi_pci_runtime_resume() would be able to
> > > reset the device.
> > 
> > But that's not going to happen as that reset is what is currently
> > causing the deadlock and which would simply be skipped if you switch to
> > pci_try_reset_function().
> > 
> 
> mhi_pci_runtime_resume() will queue the recovery_work() and return. So I was
> hoping that by the time pci_try_reset_function() is called, the lock would be
> available.

We can't rely on luck with timings, and this is the very reason for the
deadlock I'm currently seeing (i.e. the recovery thread is still running
when another thread grabs the lock and waits for the recovery thread to
finish).

Perhaps the recovery work should be done synchronously in the resume
handler to avoid such issues.

Johan

