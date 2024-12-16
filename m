Return-Path: <linux-arm-msm+bounces-42300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1509F2B15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 08:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 96334162021
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 07:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5450F1F7093;
	Mon, 16 Dec 2024 07:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zi8x50Wm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ED91F708E
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734334993; cv=none; b=AkgNuo+ZNfZXgyXSbdssgLP1y2vAEYYPS9rwCipM2VI8jVfPzYvcPOboQk22zVeN4pzRgDG0CyitbQNCPr5BjOhYUOYRPbRJ0eiDzdUlI5JpPv3GaOCjDhnCBcXn4hsrEJr990/kIU35Mzsefcg+OAa5oNoU9Ybud0hmBj+DYlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734334993; c=relaxed/simple;
	bh=Ye88qFLX5HI4+U38FVJ4i7I+vH/sXr/Yot1iejoMnUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pi2E9CKEnUX3A+jLEGxyHbgQBfZ04/FRyg5R6n2DQh18TodpUtyOXF+y+a4LU5qOJ504NsqhRKltq2jr38AJ+WS2P2bbhyOuiNZCIBITmxjoLPMnA9N81LXDk3pF4r/1aZ5jTXOiHloI91NGi8h46Lu0eWMhY3Psp9Bzc0rA9bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zi8x50Wm; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee74291415so2540588a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Dec 2024 23:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734334991; x=1734939791; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/l8fwYsQj+IYORzM/E/MJZXwbCcU+26Kqg52kYzTltU=;
        b=zi8x50WmSCO7Um0a4c+YUyEXfaQC2aBuPexoH7kfrC0ZVEu4ORJAc7zEGihBlHePKe
         V5RcTgvSYgy8U+l4HIGp8CTsRs3jjkUF7QzQcQ87sjnegrc9+yIzSz5BHUj/LaDC7qPh
         OjBN4VTBIqSwFR8Ni4BF73q3lBHMiye/J7wWNQ5zuy3SkiO+GU7/QKhr1S64OReTa3sh
         FEnnLqaLU5eNhFHvax75yYkGOz59OvyLH1qbGgrmqk7hbSNmSfy808oIkRo/ls1dmAlE
         AeWaY1J/OBZ+fXA4O69zD2ZBapQYUD7mQ9EFsotubJ4ymTJI1N6V2OwuOt9AMyCeaWT0
         n/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734334991; x=1734939791;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/l8fwYsQj+IYORzM/E/MJZXwbCcU+26Kqg52kYzTltU=;
        b=PLuaL72vxcgrZytl8AjXwVBB5cB08+5PfzVQ4JQOS6+ncnNzyr98pR87BV4T4aymcn
         4WQtFHy88vxPtdSg+fHAmnKOeOr/LMkKG+g3p82+bmAY7UJqCt5Uy47DGICbu6A9EFyd
         icyey5QkPkxbiMOgBb5rq1zzoUmejoulGra+tscfmPtduPaprBmdbA4jinufNvJ0NZSC
         7RObxhUx9igyTzGOZ+NgYDJeOT7SCUpEoN15g5K5CVsW7VwwM5fVybjz9CuRPSD9ArDQ
         d1vcbKQAatoZqqCcBgtoTSkIed6tbK0eLAmsNR0Kj2F/tyK0/YRzhz1+MFhaUA5kY8ra
         hoPw==
X-Forwarded-Encrypted: i=1; AJvYcCWs7/0UUEHI+5UuJRc9M6zLRjyWu3pPqdlFGbZogcaPYYfff7UlRmad1rASARY57ZlW5J91EIoPyxXDMoWf@vger.kernel.org
X-Gm-Message-State: AOJu0YzMscv1PLPnU0kdGRjjXVmSZdSPFtUA8Sw4KXMHNOySe/Edatu7
	2Ed1SgyM128hXtdn4XQVUcFm4u672leapHI75yRw3jqX1pfm6uiirtNMvVBYTofPxWJq3h7Zw1A
	=
X-Gm-Gg: ASbGnctqFSDxT+d6/f8N01PGkjbCQcpJQw/2341Dyyb7e+8eRRsYec5Eq8GKuG9eOb6
	YRb0suiJuNZo68O4qZrSRFdaDiBPDy524PWNih+Ux/Ac4zdMLdWJ/28NgB+nskwY6Gx/yBvDxdT
	QD9BCpvIURtZTJaMFk51o4Wi0y8txqRMSvBeKMFB8m3giJoWncVxIjkXkqTSXmKcayub5dWSs+c
	Q958TarnvY872RS9Hhc/GxYfEtWrUKVu2PK4UWJd6KmKJhYQczC0qfbRprOjS38gBM=
X-Google-Smtp-Source: AGHT+IGQXls+40yPYcJwk8rRuyh/A02EDV16rLP7ttE0d93mVWvw1peCe8rFUJC4XXeXRk3dH1y7ew==
X-Received: by 2002:a17:90b:3c8a:b0:2ee:dd9b:e3e8 with SMTP id 98e67ed59e1d1-2f28fb50798mr18150305a91.8.1734334991001;
        Sun, 15 Dec 2024 23:43:11 -0800 (PST)
Received: from thinkpad ([120.60.56.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f142f9e505sm7420531a91.36.2024.12.15.23.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:43:10 -0800 (PST)
Date: Mon, 16 Dec 2024 13:13:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241216074306.zoq7zvkcds72svbh@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216074021.kwoid2747o7piquv@thinkpad>

Adding Loic, since he authored the pci_generic driver and knows more about
modems than me.

- Mani

On Mon, Dec 16, 2024 at 01:10:34PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Dec 11, 2024 at 04:03:59PM +0100, Johan Hovold wrote:
> > On Wed, Dec 11, 2024 at 08:23:15PM +0530, Manivannan Sadhasivam wrote:
> > > On Wed, Dec 11, 2024 at 03:17:22PM +0100, Johan Hovold wrote:
> > 
> > > > I just hit the following modem related error on reboot of the x1e80100
> > > > CRD for the second time with 6.13-rc2:
> > > > 
> > > > 	[  138.348724] shutdown[1]: Rebooting.
> > > >         [  138.545683] arm-smmu 3da0000.iommu: disabling translation
> > > >         [  138.582505] mhi mhi0: Resuming from non M3 state (SYS ERROR)
> > > >         [  138.588516] mhi-pci-generic 0005:01:00.0: failed to resume device: -22
> > > >         [  138.595375] mhi-pci-generic 0005:01:00.0: device recovery started
> > > >         [  138.603841] wwan wwan0: port wwan0qcdm0 disconnected
> > > >         [  138.609508] wwan wwan0: port wwan0mbim0 disconnected
> > > >         [  138.615137] wwan wwan0: port wwan0qmi0 disconnected
> > > >         [  138.702604] mhi mhi0: Requested to power ON
> > > >         [  139.027494] mhi mhi0: Power on setup success
> > > >         [  139.027640] mhi mhi0: Wait for device to enter SBL or Mission mode
> > > > 
> > > > and then the machine hangs.
> > > > 
> > > > Do you know if there are any changes since 6.12 that could cause this?
> > > 
> > > Only 3 changes went in for 6.13-rc1 and they shouldn't cause any issues. One
> > > caused the regression with pcim_iomap_region(), but you submitted a fix for
> > > that and other two were trivial.
> > 
> > Ok, thanks.
> > 
> > > From the log, 'mhi mhi0: Resuming from non M3 state (SYS ERROR)' indicates that
> > > the firmware got crashed while resuming. So maybe you should check with ath12k
> > > folks.
> > 
> > This is the modem so I don't think the ath12k wifi folks are to blame
> > here.
> > 
> 
> Ah, even after these years I always confuse between WLAN and WWAN :)
> 
> > It may be an older, existing issue that started triggering due to
> > changes in timing or something.
> >
> 
> Could be. But the issue seems to be stemming from the modem crash while exiting
> M3. You can try removing the modem autosuspend by skipping the if condition
> block:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/pci_generic.c?h=v6.13-rc1#n1184
> 
> If you no longer see the crash, then the issue might be with modem not coping
> up with autosuspend. If you still see the crash, then something else going wrong
> during reboot/power off.
> 
> > Is there anything you can do on the mhi side to prevent it from blocking
> > reboot/power off?
> > 
> 
> It should not block the reboot/power off forever. There is a timeout waiting for
> SBL/Mission mode and the max time is 24s (depending on the modem). Can you share
> the modem VID:PID?
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

