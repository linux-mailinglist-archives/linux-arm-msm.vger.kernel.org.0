Return-Path: <linux-arm-msm+bounces-45820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D11A194CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6259C162DF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D67B0214226;
	Wed, 22 Jan 2025 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CW3oxtr/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EFF214216;
	Wed, 22 Jan 2025 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737558697; cv=none; b=Z8Tdr4wq+wNPA14hSFhOU/4E89P1IjgMO3Kt8aINGXSiTm0U3iZO1b01ovH/x7VCUogHUnZcfTJuRKJs6oo72HdeybXmqI7P0Ixl4PGUlJmm9VNyB3donxlSnHipEwKWBcxPwAYx88sY8/16vEUD98h55RIFCcmfVE0tG3p31Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737558697; c=relaxed/simple;
	bh=9vQhFq9g0lb6Y0ZgvUv/HGm4Wh9t8ZPVZzS4OxSVGNY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ArhSV8rzogMtC5E0sJZNZwzJHr2tSPvPSkwJtIbVOa2oafa59q/dKTOHq9fdiuj5dtn0WCCW5jvXgDftO44/Z+/nNCunUcVlpE6FrYFvegSfbCc+wrJgK2aVfdEvQxUfmdNxIZLU9qr57To60qxDhAhGxC4VnMJNHx2XMwnJE9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CW3oxtr/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C13C4CED2;
	Wed, 22 Jan 2025 15:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737558697;
	bh=9vQhFq9g0lb6Y0ZgvUv/HGm4Wh9t8ZPVZzS4OxSVGNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CW3oxtr/BGzr4Tflp/hVvLJfHDoMXvXWznwY/WOuGOq3pkYL9AWjllGYYqScTUbCl
	 HpcwMXX9XDNX9uvbmmxuNAWCW5UNRy4Wysc7oUCLYbi7mZbBtVUOuOOpt8vHk7+LAr
	 jV746vmROMcKU82f7Gp3m4B1ZwPr63Zp129Obosyhn/k0NMHPlCC9HiI9OJ/yRrut0
	 xbuwni6ybynfxVjmolSK21TQY/+epcPfV7USbiTetKy11sZTmeBYvpX/uXQh8ro11z
	 0p/jy6n6ygOMoyxx6yMXI1U4fzv8AZxDLzQcojNt9SBA0xiKyYZzgisT6wBkyU4LpY
	 43y1thbOhEfzQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tacOL-000000008Ft-1Lz4;
	Wed, 22 Jan 2025 16:11:42 +0100
Date: Wed, 22 Jan 2025 16:11:41 +0100
From: Johan Hovold <johan@kernel.org>
To: manivannan.sadhasivam@linaro.org
Cc: mhi@lists.linux.dev, Loic Poulain <loic.poulain@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] bus: mhi: host: pci_generic: Use
 pci_try_reset_function() to avoid deadlock
Message-ID: <Z5EKrbXMTK9WBsbq@hovoldconsulting.com>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250108-mhi_recovery_fix-v1-1-a0a00a17da46@linaro.org>

On Wed, Jan 08, 2025 at 07:09:27PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> There are multiple places from where the recovery work gets scheduled
> asynchronously. Also, there are multiple places where the caller waits
> synchronously for the recovery to be completed. One such place is during
> the PM shutdown() callback.
> 
> If the device is not alive during recovery_work, it will try to reset the
> device using pci_reset_function(). This function internally will take the
> device_lock() first before resetting the device. By this time, if the lock
> has already been acquired, then recovery_work will get stalled while
> waiting for the lock. And if the lock was already acquired by the caller
> which waits for the recovery_work to be completed, it will lead to
> deadlock.
> 
> This is what happened on the X1E80100 CRD device when the device died
> before shutdown() callback. Driver core calls the driver's shutdown()
> callback while holding the device_lock() leading to deadlock.
> 
> And this deadlock scenario can occur on other paths as well, like during
> the PM suspend() callback, where the driver core would hold the
> device_lock() before calling driver's suspend() callback. And if the
> recovery_work was already started, it could lead to deadlock. This is also
> observed on the X1E80100 CRD.
> 
> So to fix both issues, use pci_try_reset_function() in recovery_work. This
> function first checks for the availability of the device_lock() before
> trying to reset the device. If the lock is available, it will acquire it
> and reset the device. Otherwise, it will return -EAGAIN. If that happens,
> recovery_work will fail with the error message "Recovery failed" as not
> much could be done.

I can confirm that this patch (alone) fixes the deadlock on shutdown
and suspend as expected, but it does leave the system state that blocks
further suspend (this is with patches that tear down the PCI link).
Looks like the modem is also hosed.

[  267.454616] mhi-pci-generic 0005:01:00.0: mhi_pci_runtime_resume
[  267.461165] mhi mhi0: Resuming from non M3 state (SYS ERROR)
[  267.467102] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
[  267.473968] mhi-pci-generic 0005:01:00.0: device recovery started
[  267.477460] mhi-pci-generic 0005:01:00.0: mhi_pci_suspend
[  267.480331] mhi-pci-generic 0005:01:00.0: __mhi_power_down
[  267.485917] mhi-pci-generic 0005:01:00.0: mhi_pci_runtime_suspend
[  267.498339] mhi-pci-generic 0005:01:00.0: __mhi_power_down - pm mutex taken
[  267.505618] mhi-pci-generic 0005:01:00.0: __mhi_power_down - pm lock taken
[  267.513372] wwan wwan0: port wwan0qcdm0 disconnected
[  267.519556] wwan wwan0: port wwan0mbim0 disconnected
[  267.525544] wwan wwan0: port wwan0qmi0 disconnected
[  267.573773] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
[  267.591199] mhi mhi0: Requested to power ON
[  267.914688] mhi mhi0: Power on setup success
[  267.914875] mhi mhi0: Wait for device to enter SBL or Mission mode
[  267.919179] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event timeout_ms = 8000
[  276.189399] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event returns, ret = -110
[  276.198240] mhi-pci-generic 0005:01:00.0: __mhi_power_down
[  276.203990] mhi-pci-generic 0005:01:00.0: __mhi_power_down - pm mutex taken
[  276.211269] mhi-pci-generic 0005:01:00.0: __mhi_power_down - pm lock taken
[  276.220024] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
[  276.226680] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - returns
[  276.233417] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - mhi unprepare after power down
[  276.242604] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - pci reset
[  276.249881] mhi-pci-generic 0005:01:00.0: Recovery failed
[  276.255536] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - returns
[  276.328878] qcom-pcie 1bf8000.pci: qcom_pcie_suspend_noirq
[  276.368851] qcom-pcie 1c00000.pci: qcom_pcie_suspend_noirq
[  276.477900] qcom-pcie 1c00000.pci: Failed to enter L2/L3
[  276.483535] qcom-pcie 1c00000.pci: PM: dpm_run_callback(): genpd_suspend_noirq returns -110
[  276.492292] qcom-pcie 1c00000.pci: PM: failed to suspend noirq: error -110
[  276.500218] qcom-pcie 1bf8000.pci: qcom_pcie_resume_noirq
[  276.721401] qcom-pcie 1bf8000.pci: PCIe Gen.4 x4 link up
[  276.730639] PM: noirq suspend of devices failed
[  276.818943] mhi-pci-generic 0005:01:00.0: mhi_pci_resume
[  276.824582] mhi-pci-generic 0005:01:00.0: mhi_pci_runtime_resume

Still better than hanging the machine, but perhaps not much point in
having recovery code that can't recover the device.

We obviously need to track down what is causing the modem to fail to
resume since 6.13-rc1 too.

> Cc: stable@vger.kernel.org # 5.12
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/mhi/Z1me8iaK7cwgjL92@hovoldconsulting.com

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

And since I've spent way to much time debugging this and provided the
analysis of the deadlock:

Analyzed-by: Johan Hovold <johan@kernel.org>
Link: https://lore.kernel.org/mhi/Z2KKjWY2mPen6GPL@hovoldconsulting.com/

> Fixes: 7389337f0a78 ("mhi: pci_generic: Add suspend/resume/recovery procedure")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 07645ce2119a..e92df380c785 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1040,7 +1040,7 @@ static void mhi_pci_recovery_work(struct work_struct *work)
>  err_unprepare:
>  	mhi_unprepare_after_power_down(mhi_cntrl);
>  err_try_reset:
> -	if (pci_reset_function(pdev))
> +	if (pci_try_reset_function(pdev))
>  		dev_err(&pdev->dev, "Recovery failed\n");

Perhaps you should log the returned error here as a part of this patch
so we can tell when the recovery code failed due to the device lock
being held.

>  }

Johan

