Return-Path: <linux-arm-msm+bounces-45823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3528A19519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:24:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0590167A09
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C1B21420B;
	Wed, 22 Jan 2025 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXJK0+lP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965F38DF9;
	Wed, 22 Jan 2025 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737559463; cv=none; b=TkLuhzz3wJCmNzu9HFRz7z4afu9IiLNndmj87j3f40vWxDswTY37bdoBrvn0bJe/UMz8S1HCPSsbj0X8VOJmpWD7B7OC/QlJc+UWl8FEuk2kx1CGypS6pwO5Y+1SNmB8Y5rTYaF4z1nY80IYjFyy5uoqV+UZNh6aFz/OCfn5iR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737559463; c=relaxed/simple;
	bh=Zzl9rUkD1sGH8a0i7b1qKCI2ZTbgUGZSjND7FivX6Lo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTGldsPqzeFkzuuhoY5q8wg4PD28xdf/1w1rYXU/Wuoi1XQSQSHOm3LwWWhMwJI0fLw4x0QTKqiiWiF0cSKcVNnqmPjGxct30L3PKfmP6P+Ipn7cBOE8z7rNmGy5X48ISyWUTumVjnLwUzbWdZqWqB5sLgjn5yb23xq9wW6kXC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXJK0+lP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23955C4CED2;
	Wed, 22 Jan 2025 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737559463;
	bh=Zzl9rUkD1sGH8a0i7b1qKCI2ZTbgUGZSjND7FivX6Lo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXJK0+lPpjNG4+BBiSPyS7MDU5SJOmxg6q8Rdk+QYk5PRuymTU44BSL3M5vpej2Rd
	 BBIESbFdgDndJuyjcljDjWTYPt5Y5htyoPZEoMeXdvfM9n4dTKCHgdyCUlWfwNMoom
	 BKOM0du3o+C7dAplVnKMrZlP1HnBITBQ91wnLSkSrX+5E77jzIIwFhK7/0agNF8aQ7
	 jFUKVWBr47NuJKQmXhH5Y9O+AREwp7Mpq5NzaxNM3PP2uS4zPdBdkyxFYMmD/m7oVm
	 0826hfJxAeX7TmKLEjulUeoY1CT4C8xZHlUTby75sSKvIs3Y1lVdCvBlJKBZbjAKiu
	 7lNv9wSuBf6jA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tacah-000000008Rz-0oyy;
	Wed, 22 Jan 2025 16:24:27 +0100
Date: Wed, 22 Jan 2025 16:24:27 +0100
From: Johan Hovold <johan@kernel.org>
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
Message-ID: <Z5ENq9EMPlNvxNOF@hovoldconsulting.com>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>

On Wed, Jan 08, 2025 at 07:09:28PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> is started asynchronously and success is returned. But this doesn't align
> with what PM core expects as documented in
> Documentation/power/runtime_pm.rst:
> 
> "Once the subsystem-level resume callback (or the driver resume callback,
> if invoked directly) has completed successfully, the PM core regards the
> device as fully operational, which means that the device _must_ be able to
> complete I/O operations as needed.  The runtime PM status of the device is
> then 'active'."
> 
> So the PM core ends up marking the runtime PM status of the device as
> 'active', even though the device is not able to handle the I/O operations.
> This same condition more or less applies to system resume as well.
> 
> So to avoid this ambiguity, try to recover the device synchronously from
> mhi_pci_runtime_resume() and return the actual error code in the case of
> recovery failure.
> 
> For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> and call that from both mhi_pci_recovery_work() and
> mhi_pci_runtime_resume(). Former still ignores the return value, while the
> latter passes it to PM core.
> 
> Cc: stable@vger.kernel.org # 5.13
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reasoning above makes sense, and I do indeed see resume taking five
seconds longer with this patch as Loic suggested it would.

Unfortunately, something else is broken as the recovery code now
deadlocks again when the modem fails to resume (with both patches
applied):

[  729.833701] PM: suspend entry (deep)
[  729.841377] Filesystems sync: 0.000 seconds
[  729.867672] Freezing user space processes
[  729.869494] Freezing user space processes completed (elapsed 0.001 seconds)
[  729.869499] OOM killer disabled.
[  729.869501] Freezing remaining freezable tasks
[  729.870882] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[  730.184254] mhi-pci-generic 0005:01:00.0: mhi_pci_runtime_resume
[  730.190643] mhi mhi0: Resuming from non M3 state (SYS ERROR)
[  730.196587] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
[  730.203412] mhi-pci-generic 0005:01:00.0: device recovery started

I've reproduced this three times in three different paths (runtime
resume before suspend; runtime resume during suspend; and during system
resume).

I didn't try to figure what causes the deadlock this time (and lockdep
does not trigger), but you should be able to reproduce this by
instrumenting a resume failure.

Johan

