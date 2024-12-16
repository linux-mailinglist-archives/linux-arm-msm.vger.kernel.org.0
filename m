Return-Path: <linux-arm-msm+bounces-42299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBF49F2B0E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CED0D1881A2F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 07:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0061F707D;
	Mon, 16 Dec 2024 07:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nYRT1oH+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5341F4E4F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 07:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734334837; cv=none; b=nZXG6JogFjemusZ6y2kfLZrr4WAuf8V+B8gIdF4vPJWTMiIs8zOd6C658JXPsfi/+HUhmNDn2d0OuyY8YdemfZIHTpICFw/5Z8xL5W8wsGonFnDK36XFjcb1l8bsvk9AIFknXSpu/8jM8VgpnLeBnMWYRIdtJ6riSzlJ1Dxgmsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734334837; c=relaxed/simple;
	bh=sSaYK2tg4AyOEiujF9xShUjCJHhLBfgOPM3fu4GnXkc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTRgwgBT6ZQdStGvmdcLUvOJEd37TuhcG1UdlMkcxyg/aW6Hv5gQigaOaADWL2WAMpEUZUDYESb6OMNXgOHNdQkRNgb0G6eF8xQBU0hr3yHDKuDJGCjfkBSpet9Lu6fa0ndD7axiz6rlgYv6x0623arPHENzmoSMMmBs2krxKr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nYRT1oH+; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-728eedfca37so3908652b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 23:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734334835; x=1734939635; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8mDgxM0yEOok2sKIVcUGDtQKV48thFUw050xg1Tx7VU=;
        b=nYRT1oH+Lmol8aJbdMdmr2CER42eB2AvUfdSGxVXWsbp52P/pKHIAeiQkPYDvrp+aM
         UDxXjAtxekUKdnH6O3t3VT6LKquKA7OfNgkzA+nZ3CRPTa0xpM+3sYcBybn98MR3hwCu
         6j5B8ctnSor9yeUVNPPqf7JYNmc52Gro4BRnfaoj/frS/cAZJ7vVFXXAVSW/vw6l3bwI
         A/6I0FxDvyTfHVwyMEcXWai0+U9KLTS0aVlv1B1EMOT5xqjLGwMFxPeNB6epkT4rIxcQ
         bMlsll0irf/0k1PKxc6v6ht6Z0NhLDSLCSBzyJosSGdqDdooWvPkE1DllQdxi/Xzktsr
         Rvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734334835; x=1734939635;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mDgxM0yEOok2sKIVcUGDtQKV48thFUw050xg1Tx7VU=;
        b=UsIhJJAeslIie9xneU0naBnfg8SuVnXd/YaJScgWpMcct3gD80RHaBcfGnKfNQOCvp
         xUdn25g+xqdl2KC0Qz6SNWTLpTsUHae8sYUzLM/oWr5/f1/PB2u8CRo4y7zHorsrjC8V
         e0/C4QE5s5DMMySaf1BxqtnZ2fEBvKi5wMXTpAemg5TkSLlBFqRFrCkUrDTF59u4Xntn
         IWORl7eRTNeBL2iosGSVTFkr21mJ6O4t6lqLdEDciTmM5Eg33GaBiQY+ts81SCisJtsE
         OisgHZJp7gJsRV+UzRRwQV/UGjBrU2QAynEnUROFfdj022UYMTl5jEysAQv0Jii18l/n
         gmmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgod8OJe5fSHKisiFyk/3O2X26e+Z5X+/q2CGoZbho1JUjK42DBEPiQzxAQCpfN45jftmLhlfL80iIxSoU@vger.kernel.org
X-Gm-Message-State: AOJu0YwLk8mmKL459nMi5mvS/z+uk5jl/xIRafti+quJ6PzzcGYovkQh
	4PVUEyc3FbA1Zvuex2dCF+myKDTv0hppdkKaOhpV60PlHtdIFR1Zeu8AwbuNOQ==
X-Gm-Gg: ASbGnctiJY/mQr5InX/+Tw4eKkghETqfDxfVtwwRYPvO52brm+Zdkcbp4pR3GtZVfjM
	QjzRYhyIQg2e4wpTSYW3zSVPxJpEMP2CcNQF5JXLXPeqdR7BtYBAxXNO0v7vB+cBgLYcpWdqn1J
	rBh8z1z+lVezH8m8bJjluMIOGY4bjXCZUZ7gk93NKSpnmdnXzmOauFv8uUxJlUMxvbe7isx0Bj0
	6ggp9hG/9cL5wlQagyF55iLxRhtHiNJ7gqfIEbVqXkNoxgNLt2MV7fuh5Wi+91Hz6s=
X-Google-Smtp-Source: AGHT+IGGVu4KJwdCoYzSffGoaGBpFi0gWJGthQi9td/n7fVzDFpB7iakWS1EO51d1T+rE8NLKPwRjQ==
X-Received: by 2002:a05:6a00:1815:b0:724:d503:87a1 with SMTP id d2e1a72fcca58-7290c144b3amr13962615b3a.7.1734334834646;
        Sun, 15 Dec 2024 23:40:34 -0800 (PST)
Received: from thinkpad ([120.60.56.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad6536sm4132897b3a.76.2024.12.15.23.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:40:34 -0800 (PST)
Date: Mon, 16 Dec 2024 13:10:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241216074021.kwoid2747o7piquv@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>

On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> On Wed, Dec 11, 2024 at 08:23:15PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> 
> > > I just hit the following modem related error on reboot of the x1e80100
> > > CRD for the second time with 6.13-rc2:
> > > 
> > > 	[  138.348724] shutdown[1]: Rebooting.
> > >         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
> > >         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> > >         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> > >         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
> > >         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
> > >         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
> > >         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
> > >         [  138.702604] mhi mhi0: Requested to power ON
> > >         [  139.027494] mhi mhi0: Power on setup success
> > >         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> > > 
> > > and then the machine hangs.
> > > 
> > > Do you know if there are any changes since 6.12 that could cause this?
> > 
> > Only 3 changes went in for 6.13-rc1 and they shouldn't cause any issues. One
> > caused the regression with pcim_iomap_region(), but you submitted a fix for
> > that and other two were trivial.
> 
> Ok, thanks.
> 
> > From the log, 'mhi mhi0: Resuming from non M3 state (SYS ERROR)' indicates that
> > the firmware got crashed while resuming. So maybe you should check with ath12k
> > folks.
> 
> This is the modem so I don't think the ath12k wifi folks are to blame
> here.
> 

Ah, even after these years I always confuse between WLAN and WWAN :)

> It may be an older, existing issue that started triggering due to
> changes in timing or something.
>

Could be. But the issue seems to be stemming from the modem crash while exiting
M3. You can try removing the modem autosuspend by skipping the if condition
block:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pci_generic.c?h=v6.13-rc1#n1184

If you no longer see the crash, then the issue might be with modem not coping
up with autosuspend. If you still see the crash, then something else going wrong
during reboot/power off.

> Is there anything you can do on the mhi side to prevent it from blocking
> reboot/power off?
> 

It should not block the reboot/power off forever. There is a timeout waiting for
SBL/Mission mode and the max time is 24s (depending on the modem). Can you share
the modem VID:PID?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

