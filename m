Return-Path: <linux-arm-msm+bounces-42669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3699F650D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51E4D188A143
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08BA61A2381;
	Wed, 18 Dec 2024 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RVUIJBzv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649819E97B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 11:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734521919; cv=none; b=qlULnBT0b9AtyRRDPCFiBqdbHLMi4v/+Or3cr8JxRvZ4PfEVXON1IOwR2EPhOf4IQ4PtupIp03pr8ruT9Pipa2UP1KdDNCFA8gYC4iTv+B+cqXhF2uFMk7cZ62586R3QzcOhPcPcdNJMl6D+WCQ05mmwWeTSDimdeRePMNIvBJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734521919; c=relaxed/simple;
	bh=4yfP5WU7a/pVrsCJ7B/M/xfP8WOHCD3Dq6wN1kvsLRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFra/Kfa5LXawD+2z2n4rJjiZCfT7ePRSew5xr6QXuFBtuBdcNiG1Har0LFrzlThbb5A3gPx6M+ou6syrK4KGDLbh6La440IJbeuqHsmo1MdbGI8FhNCVspr8JgbtniSOJiydzwN3z+16Rd039BWPF3CGD5nejBGOHbwuOsuv3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RVUIJBzv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2163b0c09afso56207615ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 03:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734521916; x=1735126716; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GvY1ReTdW6brhPpJplDpvn3n8IDN60bd5c4AH0ipMaM=;
        b=RVUIJBzvbZSt8wOQk/9ibFuP825a1h9epcZALxxIq8xxo5gZ/OWWXmvV4vUuP5qzi9
         ri0aV/9dRgs4+6nyJlOrkU9u0G9hQwK/8Gz+Vr0PGNyAaBsmcvwqotGhGMUshMA9K0vy
         gh+BKbs87xSy7M7Au3/EAohv6iMC0thS7sLqYKklRKyzaia5g5Dy88hcgwq4qfRpD2Jm
         X1lIJhZwLMCOq+JzPM7YqdUenU+xlRj0FBw7V6SxulmVsZypCMU+U0oXnMVHJTXzchDb
         yBXWm/2jx7Lj3772snnEI5mCBYfIsu3+YmB98QZE2qaUFQxlCLrelmY1bk2BYYVZQT5j
         ZBXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734521916; x=1735126716;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvY1ReTdW6brhPpJplDpvn3n8IDN60bd5c4AH0ipMaM=;
        b=Ia8nKoxw0XJ70nJm8SN66YgrAXDgGlRDcvRfEsl8BdzOTtSlkDXZ7fYJ/AwC8VNc6G
         fxbXa2AXzjYEQS8VlezMG9P8gmZVesM18xYMt/+7ldpsu6pnMvNLcaxDLHZb4sRup8sb
         +7w56+WdSsDNqFpZoy0wMBb+zuZ+P9ADdgsp09HRnxFxscnokZmB94TUUfx1MoNQ37wz
         zZ9FdYOLaw0qfaQ8ou9iuYs8Y7hKPD95+9y3hZa68UGsAzARNTz3OzE7go1eVcUpVmwO
         GvSkOfbf/Smqv992HaN8OIREwvfdSkNDUzIKa3MTMTUfy+DWHF/fL3DR0dwFBMuW46Va
         flwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjpb/Ao81lfKY0pjqzkETN11/aVgO7ZL747qdUkzgkQZ9ughNfedAt4LOOwOGLcnTkqXR/1k9+cYa9wgxg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/6O3c+G/pOgI3VwFSN8Ra+AnsUYbVm6LP7q5Ov7abF57qk9D9
	6MGcVYBFz7uNYGAyxafMlUygxXC6Lin9/28nad4+LouWBSLBJVPNpolDKXI6iA==
X-Gm-Gg: ASbGnct1m2M3/biqX8QdgQxO7+76axNBUeocSxhEs/eORjleSgR+GlQvsRWkL0zXCu/
	z5Mj4o3leXJcyWMZR5T77Ufhs8SGE2f/LwGdiUsmKAjl7xkgskuZ2niU9Xf9hBYqyVPJ20Ly4jm
	UIZnOirAAwCpYQ+jP91Kj26Lehg1S/AenlbvOHWavX5j4rwEOXdvIbZBX2Xfj7mWBcVmSN6c0Ga
	uQBfLgq/f5ECGINhlPEKpaM8o85E0ylrOH1XPL6MQOGCNGJZ549ttada1hAhjKPmHWF
X-Google-Smtp-Source: AGHT+IHX7hi8Bt767lKAE4MHsWyaXEw7oDBc31jaTBX9wt+ORcrbTTXMJJbcsgzFDoCQCj8Bd/5hKg==
X-Received: by 2002:a17:902:dac4:b0:216:2dc5:2310 with SMTP id d9443c01a7336-218d727e651mr36313535ad.48.1734521916156;
        Wed, 18 Dec 2024 03:38:36 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e721easm74281915ad.254.2024.12.18.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:38:35 -0800 (PST)
Date: Wed, 18 Dec 2024 17:08:30 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241218113830.efflnkxz7qu24xux@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2KKjWY2mPen6GPL@hovoldconsulting.com>

On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> On Mon, Dec 16, 2024 at 07:43:03PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Dec 16, 2024 at 02:20:09PM +0100, Johan Hovold wrote:
> > > On Mon, Dec 16, 2024 at 01:10:21PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> 
> > > I just hit the issue again and can confirm that it does block
> > > reboot/shutdown forever (I've been waiting for 20 minutes now).
> > 
> > Ah, that's bad.
> > 
> > > Judging from a quick look at the code, "Wait for device to enter SBL or
> > > Mission mode" is printed by mhi_fw_load_handler(), which in turn is only
> > > called from the mhi_pm_st_worker() state machine.
> > > 
> > > I can't seem to find anything that makes sure that the next state is
> > > ever reached, so regardless of the cause of the modem fw crash
> > 
> > This code will make sure:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pm.c?h=v6.13-rc1#n1264
> > 
> > But then it doesn't print the error and returns -ETIMEDOUT to the caller after
> > powering down MHI. The caller (mhi_pci_recovery_work), in the case of failure,
> > unprepares MHI and starts function level recovery.
> > 
> > > (if
> > > that's what it is) the hung reboot appears to be a bug in mhi.
> 
> I've tracked down the hang to a deadlock on the parent device lock.
> 
> Driver core takes the parent device lock before calling shutdown(), and
> then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> finish.
> 
> But the mhi recovery thread ends up trying to take the same parent
> device lock in pci_reset_function() when recovery fails:
> 
> [  339.351915] shutdown[1]: Rebooting.
> [  339.724498] arm-smmu 3da0000.iommu: disabling translation
> [  339.760134] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> [  339.766211] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> [  339.773158] mhi-pci-generic 0005:01:00.0: device recovery started
> 
> The recovery thread is running before shutdown() is called.
> 
> [  339.779638] mhi-pci-generic 0005:01:00.0: __mhi_power_down
> [  339.779650] mhi-pci-generic 0005:01:00.0: mhi_pci_shutdown
> [  339.785422] wwan wwan0: port wwan0qcdm0 disconnected
> [  339.791001] mhi-pci-generic 0005:01:00.0: mhi_pci_remove
> [  339.791006] mhi-pci-generic 0005:01:00.0: mhi_pci_remove - cancel work sync
> 
> shutdown() waits for the recovery thread to finish
> 
> [  339.825892] wwan wwan0: port wwan0mbim0 disconnected
> [  339.831320] wwan wwan0: port wwan0qmi0 disconnected
> [  339.904249] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
> [  340.025390] mhi mhi0: Requested to power ON
> [  340.233771] mhi mhi0: Power on setup success
> [  340.233954] mhi mhi0: Wait for device to enter SBL or Mission mode
> [  340.238272] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event timeout_ms = 8000
> [  348.400082] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - wait event returns, ret = -110
> 
> The recovery thread fails to power up the device.
> 
> [  348.419967] mhi-pci-generic 0005:01:00.0: __mhi_power_down
> [  348.472665] mhi-pci-generic 0005:01:00.0: __mhi_power_down - returns
> [  348.725069] mhi-pci-generic 0005:01:00.0: mhi_sync_power_up - returns
> [  348.742644] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - mhi unprepare after power down
> [  348.762737] mhi-pci-generic 0005:01:00.0: mhi_pci_recovery_work - pci reset
> [  348.780904] mhi-pci-generic 0005:01:00.0: pci_reset_function
> 
> And tries to reset the device, which triggers the deadlock when
> trying to take the already held parent (bridge) device lock.
> 

Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
instead of pci_reset_function() in mhi_pci_recovery_work().

If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
not need to worry in that case since the host is going to be powered off anyway
(and so the device).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

