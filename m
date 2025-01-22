Return-Path: <linux-arm-msm+bounces-45849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C65A19794
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 18:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F3F33A38DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 17:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95E462153CF;
	Wed, 22 Jan 2025 17:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AECjqbSR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C602153C6;
	Wed, 22 Jan 2025 17:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737566747; cv=none; b=asrgZ3gz8X8IiyZgz2yX8Hr1VZo4wpJhKYpkoSP652OVlg6fpqg3RrWPe2FEZE2UkcX4GDXPA2VA8JakHOAgZH4bajoEjOllhF9jHe+gHuqEXb3SshwEwsviLY5u3TfNULhRk1dPT7Md/93BSlHyLnjamK1OORnHIHBUh2AYEeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737566747; c=relaxed/simple;
	bh=LWiOetpLYWj2C9G4oYP4XduNRB4PwJbMWrmJI504OZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YUzhlG2ed4Yno5QfRsN1f6Lz0nT8FnRAvqewEQLlTh74cCR4+NaPzOun8DdSs9PqMWgZRsmjb2HbYFHSgVT8p6RaL2O4PaZ23P3c5GFakXoppSzT89K9JQc56Xtp2pHNXW3H7D0odE5Ysa/ZltPfEykNDsNOCCc3reXrev3crlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AECjqbSR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79A7C4CED2;
	Wed, 22 Jan 2025 17:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737566746;
	bh=LWiOetpLYWj2C9G4oYP4XduNRB4PwJbMWrmJI504OZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AECjqbSRoylzOg99N7HHnH4L7nZlP01GDR5u3/stuxPD5A1z2wgyy25382cMfRkkE
	 mpeu2n1wpFZfaBylK0B/1voGzdJ5kEJ8n49leN4rxeHXgUJ03E+D9QAxj9iHD2ROEM
	 lURR02gRvAV5yTMbaSPv81ZuCdKVHyoXymL/QZXKg5qM6/OujiEN0TUwyvV4yUTOew
	 9gEePS0VY/gFRDIXiZe1cwfyBdTi6NJfP33G+EcsYli1fsZDycDJ5W2XVPLzN73VUo
	 D6puM5Vc8O0krk4WF6uo9EWgPeiIJ/dDLQhKe63rO/Cf54thkYqTvYNdEEzF4HiKwc
	 j0GnNAzYxeXmw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1taeUB-000000002TY-3MDU;
	Wed, 22 Jan 2025 18:25:51 +0100
Date: Wed, 22 Jan 2025 18:25:51 +0100
From: Johan Hovold <johan@kernel.org>
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
Message-ID: <Z5EqH95TWIGJhPG9@hovoldconsulting.com>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
 <Z5ENq9EMPlNvxNOF@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5ENq9EMPlNvxNOF@hovoldconsulting.com>

On Wed, Jan 22, 2025 at 04:24:27PM +0100, Johan Hovold wrote:
> On Wed, Jan 08, 2025 at 07:09:28PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> > is started asynchronously and success is returned. But this doesn't align
> > with what PM core expects as documented in
> > Documentation/power/runtime_pm.rst:

> > Cc: stable@vger.kernel.org # 5.13
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Reasoning above makes sense, and I do indeed see resume taking five
> seconds longer with this patch as Loic suggested it would.

I forgot to mention the following warnings that now show up when system
resume succeeds. Recovery was run also before this patch but the "parent
mhi0 should not be sleeping" warnings are new:

[   68.753288] qcom_mhi_qrtr mhi0_IPCR: failed to prepare for autoqueue transfer -22
[   68.761109] qcom_mhi_qrtr mhi0_IPCR: PM: dpm_run_callback(): qcom_mhi_qrtr_pm_resume_early [qrtr_mhi] returns -22
[   68.771804] qcom_mhi_qrtr mhi0_IPCR: PM: failed to resume early: error -22
[   68.795053] mhi-pci-generic 0005:01:00.0: mhi_pci_resume
[   68.800709] mhi-pci-generic 0005:01:00.0: mhi_pci_runtime_resume
[   68.800794] mhi mhi0: Resuming from non M3 state (RESET)
[   68.800804] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
[   68.819517] mhi-pci-generic 0005:01:00.0: device recovery started
[   68.819532] mhi-pci-generic 0005:01:00.0: __mhi_power_down
[   68.819543] mhi-pci-generic 0005:01:00.0: __mhi_power_down - pm mutex taken
[   68.819554] mhi-pci-generic 0005:01:00.0: __mhi_power_down - pm lock taken
[   68.820060] wwan wwan0: port wwan0qcdm0 disconnected
[   68.824839] nvme nvme0: 12/0/0 default/read/poll queues
[   68.857908] wwan wwan0: port wwan0mbim0 disconnected
[   68.864012] wwan wwan0: port wwan0qmi0 disconnected
[   68.943307] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
[   68.956253] mhi mhi0: Requested to power ON
[   68.960753] mhi mhi0: Power on setup success
[   68.965262] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event timeout_ms = 8000
[   73.183086] mhi mhi0: Wait for device to enter SBL or Mission mode
[   73.653462] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event returns, ret = 0
[   73.653752] mhi mhi0_DIAG: PM: parent mhi0 should not be sleeping
[   73.661955] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - returns
[   73.668461] mhi mhi0_MBIM: PM: parent mhi0 should not be sleeping
[   73.674950] mhi-pci-generic 0005:01:00.0: Recovery completed
[   73.681428] mhi mhi0_QMI: PM: parent mhi0 should not be sleeping
[   74.315919] OOM killer enabled.
[   74.316475] wwan wwan0: port wwan0qcdm0 attached
[   74.319206] Restarting tasks ...
[   74.322825] done.
[   74.322870] random: crng reseeded on system resumption
[   74.325956] wwan wwan0: port wwan0mbim0 attached
[   74.334467] wwan wwan0: port wwan0qmi0 attached

> Unfortunately, something else is broken as the recovery code now
> deadlocks again when the modem fails to resume (with both patches
> applied):
> 
> [  729.833701] PM: suspend entry (deep)
> [  729.841377] Filesystems sync: 0.000 seconds
> [  729.867672] Freezing user space processes
> [  729.869494] Freezing user space processes completed (elapsed 0.001 seconds)
> [  729.869499] OOM killer disabled.
> [  729.869501] Freezing remaining freezable tasks
> [  729.870882] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> [  730.184254] mhi-pci-generic 0005:01:00.0: mhi_pci_runtime_resume
> [  730.190643] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> [  730.196587] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> [  730.203412] mhi-pci-generic 0005:01:00.0: device recovery started
> 
> I've reproduced this three times in three different paths (runtime
> resume before suspend; runtime resume during suspend; and during system
> resume).
> 
> I didn't try to figure what causes the deadlock this time (and lockdep
> does not trigger), but you should be able to reproduce this by
> instrumenting a resume failure.

Johan

