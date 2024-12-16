Return-Path: <linux-arm-msm+bounces-42349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F33549F32E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 15:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69A5C16948F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 14:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF9F205ADE;
	Mon, 16 Dec 2024 14:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h/j4kboh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC9C205E1B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 14:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734358390; cv=none; b=u0+HanOzPjjf3pVYwaVh17leEqSHdY8Qu7yZoM3NhK9MrlK2qccVoMEhsE6mJg/IgrE16ffTD8g6+yKhJ/iDthCSHWFEFgXdNgmQ6BSywnlM+lufsHUP4ohu0eZrlKZ33AwK6a1rhh7XGZ4p+NRW5g1dA2kWLIUrlBbox7ifZjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734358390; c=relaxed/simple;
	bh=YXb2OO26JuzzRT5gugYbGq1eBtgz8qYkjN+bl/xvvu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzB5W+6m1ENZFu7iNn59O9zZ48n1KaWClY1bRBdt5fuLlrfCGHcAWZggG2aSODGnfFodQYxO7B+Ax1nQjjrUdyJEpD4jNQCBeggUk48ot118AfSLgkRvz7Kf+DnAgE2NYMWuWs+XAy96DGaGhbz+b2ItmC7ToEW3wKIDr5AYT5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h/j4kboh; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-215770613dbso27773785ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734358388; x=1734963188; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4lqEeDutj/XDSerpsZ8M++ye4tVb7VkggEGa71i6G0U=;
        b=h/j4kbohbp/x/KkqotjtwlA/pm74b5QUwAvAGcOoA1ju5OvRE08xI/TA7TzL4gGrlQ
         Zd8dZrPhOFV36metvoV/sxlX+Dhzgv5qYBSkCCBCYB5L0HicBflopsEHNURhKTvDgi7/
         rE/oP8Zd0WTl4yAr8LQUTF60PbNdU+iYe7Jv3JdJNzR3SWmZOZwLznAagd14+UpvEbQX
         dm4vN7bf2rtV+nS0uPA/kfUQj5LaDyTLgjJPBohYl6HOosqaPAiKxZYa5Bgte8AieK9f
         Upwgrf7kY3knKmptlCDAU11VLCiSdHywNwnLDkjyBo9bhJWWQkBy3jEmGTjZ380iahsG
         htYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734358388; x=1734963188;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4lqEeDutj/XDSerpsZ8M++ye4tVb7VkggEGa71i6G0U=;
        b=w5DOX34m0wFKpnwkXRL87czdEHLUnkI+tkAB9Q9YoTOu3TIm/M79bzvPr5MUyN1kzQ
         FLZ5NaDFxQwUAkV87Rx12L3CyELAjL0MxEMxzWloZhBne1XuKrthRsGdfPcxcPX7Klq3
         W0lvs4aVAFP8/U7YOSzubSPhU+sdwrfI/8s1QVPzWcqY2mk0UHnHkWN9j6V8EF6z67eV
         5Ps68R7OTB483zT/vJgQgMHgK6qG/vPsrDxfKtZRH2xUUOxRgIo3R8DV+LuJWAULPaAj
         ZyZQ9k2mpZQk6EiNMgSf2bEDyUVcavrnOTCBYQMsxx4cua5nnN+tCnqJOPu1wtcHi7I4
         1ofA==
X-Forwarded-Encrypted: i=1; AJvYcCUvRYmX+11orbXBhQGIh9nAgId9ez/uUSU5U1UqS4WZ7vKoyp52rzL0SMFfThXFZfnJElwLldcSTt0Rzrsu@vger.kernel.org
X-Gm-Message-State: AOJu0YyzxrsgrkPBmx1uQbu9ET+Y1sC3IwxTAz4gEfM7tCZhmWKxjh5h
	/022ujRAGahNpE7swgab9311UkeKpPLWCnbPypHOkKOsgWtvyXNfFlsxLTfczA==
X-Gm-Gg: ASbGncugIMZcxbrgxJ9nvI0TlbmwDyNSXrIvGkHc4uiAKeGtnPIIz44BIEsNhUWu3yX
	eg8q0CpuCVWhpTNcoQOvGnkMpu0LHi9F9WQCYJ/MWhy6fkkHT9ycj5B7HZcBHYH8XK/Q4S60pCi
	0ByXnGcka0OT53wAC7TJsPnoC313gI2EO8vhG9smzaPJdjEi6+EAhY3ItODawk+a7uQq31lCht3
	0N5mrHIHa/IT2FAFjsEDe1w3A8IdPqzbsdwXHqyiuZ/hs3LlqoTJmwzmLSl+IE6k4NF
X-Google-Smtp-Source: AGHT+IFbwXMmkjRCJjhB390rc2YrPcY2ddmkYzVMrHtWWR7ffsZEsQAAigu4VplGhhTpeUsoGW86wg==
X-Received: by 2002:a17:902:db09:b0:215:83e1:99ff with SMTP id d9443c01a7336-218929c7077mr158661225ad.27.1734358387786;
        Mon, 16 Dec 2024 06:13:07 -0800 (PST)
Received: from thinkpad ([120.56.200.168])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1db63cesm43415695ad.33.2024.12.16.06.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:13:07 -0800 (PST)
Date: Mon, 16 Dec 2024 19:43:03 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241216141303.2zr5klbgua55agkx@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>

On Mon, Dec 16, 2024 at 02:20:09PM +0100, Johan Hovold wrote:
> On Mon, Dec 16, 2024 at 01:10:21PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 11, 2024 at 08:23:15PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> > > 
> > > > > I just hit the following modem related error on reboot of the x1e80100
> > > > > CRD for the second time with 6.13-rc2:
> > > > > 
> > > > > 	[  138.348724] shutdown[1]: Rebooting.
> > > > >         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
> > > > >         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> > > > >         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> > > > >         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
> > > > >         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
> > > > >         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
> > > > >         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
> > > > >         [  138.702604] mhi mhi0: Requested to power ON
> > > > >         [  139.027494] mhi mhi0: Power on setup success
> > > > >         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> > > > > 
> > > > > and then the machine hangs.
> 
> > Could be. But the issue seems to be stemming from the modem crash while exiting
> > M3. You can try removing the modem autosuspend by skipping the if condition
> > block:
> > 
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pci_generic.c?h=v6.13-rc1#n1184
> > 
> > If you no longer see the crash, then the issue might be with modem not coping
> > up with autosuspend. If you still see the crash, then something else going wrong
> > during reboot/power off.
> 
> I've only hit this issue three times and only since 6.13-rc2. So not
> sure how useful that sort of experiment would be.
> 

I do not have access to the device. So if you cannot spend time on debugging the
reason for crash, then I'll have to rely on Qcom to do it (which I've asked
anyway).

> > > Is there anything you can do on the mhi side to prevent it from blocking
> > > reboot/power off?
> > 
> > It should not block the reboot/power off forever. There is a timeout waiting for
> > SBL/Mission mode and the max time is 24s (depending on the modem). Can you share
> > the modem VID:PID?
> 
> I just hit the issue again and can confirm that it does block
> reboot/shutdown forever (I've been waiting for 20 minutes now).
> 

Ah, that's bad.

> Judging from a quick look at the code, "Wait for device to enter SBL or
> Mission mode" is printed by mhi_fw_load_handler(), which in turn is only
> called from the mhi_pm_st_worker() state machine.
> 
> I can't seem to find anything that makes sure that the next state is
> ever reached, so regardless of the cause of the modem fw crash

This code will make sure:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pm.c?h=v6.13-rc1#n1264

But then it doesn't print the error and returns -ETIMEDOUT to the caller after
powering down MHI. The caller (mhi_pci_recovery_work), in the case of failure,
unprepares MHI and starts function level recovery.

> (if
> that's what it is) the hung reboot appears to be a bug in mhi.
> 

I'm not sure where exactly it got stuck. I've asked Qcom folks to reproduce this
issue. We will investigate and hopefully get back with a fix asap.

> This is with the SDX65 modem in the x1e80100 CRD:
> 	
> 	17cb:0308

Okay thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

