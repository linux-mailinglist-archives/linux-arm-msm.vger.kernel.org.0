Return-Path: <linux-arm-msm+bounces-42695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CC49F6D74
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 19:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 684361889F19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 18:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147271F75B2;
	Wed, 18 Dec 2024 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BopyAYXa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C501591EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 18:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546963; cv=none; b=VXWTTPhdz2h8FFZSmkdA+oJCGtUDxyPMPzZlo/pj4/RQkerere5UHoKudrjsScarwcE9SMYdPeBZ0++CNkQ5Oy1Nv7tpOH47IhR0LwQtWQI7n0E2a9K/kjIuZzhaRqoL8WrvwWGenE+OqSrWk5CnnNaH9aRdkGrBWPW4PaZlAJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546963; c=relaxed/simple;
	bh=H1Aai/I3cMUgqmRzeGvI0h98A1euYUjcp5CSf43av30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EGIqAo/Smd/ex/lGFYAH5I73A0PHhOJ1OvNBDUFrWbjJMTWvmiY2TeVbdcvAobc6r7P1KJGRtvVO0HtD1ClQaHdinI/8LW/kcwd9vWTOVKggsDrM9VLxT0Dp7yWoHkn8HModF/lHfI029KJ3FSDOksNRAgWwGw243qIAy2VR4Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BopyAYXa; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216728b1836so143885ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 10:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734546961; x=1735151761; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9QoqmFThgpYYfz6z8XdmslArNzKFpNPLkZLyt30Nm9Q=;
        b=BopyAYXa5flXY36wutb9MFjvR1YSsg28H2FYk/gGdkZJrGinS+9dps2gJwQLq9SZNn
         9XErACO/VDmDT+cQD2sjk+usFmvy9DFTMItkqob9dzxF01wUY/1TlBxWlAC51BPgwWqr
         1lnYhB0oD2J1pkhvjSNpRaWwH2eosGz0+Tx+XOchyPwmeImSTj8uD2WAkTOQh1fsMhO3
         r0ap/WIRoVDVQeXSqThVohdYpJ6TSXVzPQctbolLY6uoXOoVqcdnMGoBDN0PF/S+Hp+Z
         DY7tDhs2F8XgfeZjcknuWdXeS2TtjYAZO4BudQJo4ZEZUoxDAjIInEcL9eQv5Pmff1Xu
         Qs/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546961; x=1735151761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9QoqmFThgpYYfz6z8XdmslArNzKFpNPLkZLyt30Nm9Q=;
        b=EljJATmZFDqyZWCDGiAiUgFA4VkUJkYDMwHqMN3FAXcHQzIx/sCotsr8b9+EKd9lzt
         xzEH92zhwkOkO6QwjijyyDWsUCqNoXrbKsO+szz9x0rg7U0lAq8aOl7FkIwIUTOpgf10
         FHcZvDERwTRk2XwcbdaLTfd9I7yv1K0p7EnYOJDS3HCYgynXHHP99HL3fdFeGAW+vcmc
         NEOpWU6pTJ4EQjhrtqRtVr+HDhLYNrdf541o5++zBm7xK2SJzDMgUYo2HRkEx0QegWi5
         aLXf4Wwox4zbJC1nphELZD1yMLGVHlzZZGQTZRe/Y39fUw1sgg1Jp4WVdOdtDNo+2Ujy
         vaHA==
X-Forwarded-Encrypted: i=1; AJvYcCV0ytYHq1OHsnp7BOSaw89GoK7kFQb9JF1IX49iAeQP/hyB7xDYVKprPNSgQZD5y9sEDA0KZ8y7us4gaZxa@vger.kernel.org
X-Gm-Message-State: AOJu0YybfO8qJs3jxlmvfJopopq4q2Q9OKNjr9+KYjVaRwt1nd1ooiE0
	OGthcmjZps14eVIImBZTxUxSIag0nuUUbwxRETtOSQa77CNRNJQwqhawtb8Xbw==
X-Gm-Gg: ASbGncs2HovN1RWcAyATtajwTLxP7fD2E5zmGPkZqXDruB/M8idl+fGFWoXpODTSpL6
	bMetvR7IADMgdk/p8bfwv9G/ooMcJcAh8i4/yAThkW6Y52ZeXKTtwzVGS9obMAA8LI07h7MelyK
	N02QaxjsDxnnUzuWbBouU+lbe8geO701L347HTDv3etoR1dXAxgN338R9RFPk12ooVgX8UpHd+Z
	Wvj/EENrmm19ysK/OheX2s/EV5Z8AH3RSJlMPIs0xuoC1pivvKh/zdd8E5KoQHMAyaB
X-Google-Smtp-Source: AGHT+IFx0Y0NES4XTZAx/Y6m34o9Df/LrhxXriUYjPamGfrz7/WYfDVESUdiB5qH/olNqFvYxmIpFw==
X-Received: by 2002:a17:902:f64b:b0:215:9f5a:a236 with SMTP id d9443c01a7336-218d6fc3a62mr57682555ad.6.1734546960758;
        Wed, 18 Dec 2024 10:36:00 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1d000d9sm79253785ad.0.2024.12.18.10.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:36:00 -0800 (PST)
Date: Thu, 19 Dec 2024 00:05:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241218183555.qste4gve7vnvdml2@thinkpad>
References: <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
 <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
 <20241218140910.ysovysnvns26vbmd@thinkpad>
 <Z2LbnoSplfVNmNaa@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2LbnoSplfVNmNaa@hovoldconsulting.com>

On Wed, Dec 18, 2024 at 03:26:38PM +0100, Johan Hovold wrote:
> On Wed, Dec 18, 2024 at 07:39:10PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 18, 2024 at 02:55:02PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 18, 2024 at 06:00:19PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 18, 2024 at 01:02:39PM +0100, Johan Hovold wrote:
> > > > > On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> > > > > > On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> > > > > 
> > > > > > > I've tracked down the hang to a deadlock on the parent device lock.
> > > > > > > 
> > > > > > > Driver core takes the parent device lock before calling shutdown(), and
> > > > > > > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > > > > > > finish.
> > > > > 
> > > > > > Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> > > > > > instead of pci_reset_function() in mhi_pci_recovery_work().
> > > > > > 
> > > > > > If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> > > > > > not need to worry in that case since the host is going to be powered off anyway
> > > > > > (and so the device).
> > > > > 
> > > > > That may work. But note that I've now also seen this deadlock during
> > > > > suspend (i.e. when the device is not going away). The
> > > > > pci_try_reset_function() should avoid the deadlock here too, but we'll
> > > > > end up in funny state.
> > > > 
> > > > Hopefully, recovery_work() started by mhi_pci_runtime_resume() would be able to
> > > > reset the device.
> > > 
> > > But that's not going to happen as that reset is what is currently
> > > causing the deadlock and which would simply be skipped if you switch to
> > > pci_try_reset_function().
> > > 
> > 
> > mhi_pci_runtime_resume() will queue the recovery_work() and return. So I was
> > hoping that by the time pci_try_reset_function() is called, the lock would be
> > available.
> 
> We can't rely on luck with timings, and this is the very reason for the
> deadlock I'm currently seeing (i.e. the recovery thread is still running
> when another thread grabs the lock and waits for the recovery thread to
> finish).
> 
> Perhaps the recovery work should be done synchronously in the resume
> handler to avoid such issues.
> 

Synchronously? How can that help when the recovery_work() cannot acquire the
lock?

Anyhow, even if the lock is not available during resume (worst case), PCI core
should reset the device when it tries to change the state.

I don't know if there is any better solution available.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

