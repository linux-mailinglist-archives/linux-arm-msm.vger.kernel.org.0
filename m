Return-Path: <linux-arm-msm+bounces-47973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8D2A35520
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 04:01:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8DD76189146A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 03:01:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2BB815198F;
	Fri, 14 Feb 2025 03:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L5ho3Lu6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2CF376F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Feb 2025 03:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739502075; cv=none; b=KT2L/qR9jCay2842Ba181n+8Qpn4Th0dK8G+epZ4GlfaRW4JP0TN6c5xWO/AMtXi+AN7cg6YUQjg8mxEmAOu+xOtIA5jH5hVlIHU9uFXAkhtDoffAh79aUVoxvMDd9HJRifOo4iPOkqmf//ZQT6CrIhvlKmTPOPFO0Xx+roK3Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739502075; c=relaxed/simple;
	bh=KJvJysIsmaf/18xTfixy0CXTPEbocyW1TH3mI92lQS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cSJ5hThOcjsaT0EFuq5q/ga0e98mPRQPSQKMf+noiVdZSaRQUyjUEgIL5r+ZeCF1hK5kfmR2vejBSkkMzlb/ry3krPYVDWxaHX3s4qy9Fn1dr3pY/En6MHDC21g7o54+OKpXyD/P05yw4RaQyMH8LqYfU2eiQEy0+jvletYqtms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L5ho3Lu6; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54298ec925bso2225029e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 19:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739502071; x=1740106871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CphyPEj/nIGWcbqF531VSGV3qr1xTmbTkezkMFIl3Eo=;
        b=L5ho3Lu6mXUbTmwggrCtI9W4Px6+JTFFHDPejrJQJvLNHlounyTUVCqYXxzkZY1Ui6
         XfUabC10xhvnwZhXVdNmsjPoylNUYpIJOaqfjZtCAO8sPcfyXl0c49InSk4Dnt0go4XU
         2sMXWorlgcGdERb3lJDkCOFJrZLYGnZH8VwXnixoemyDj7VW7XAkLTdGLtTC0hs0gj6s
         /4lu8khF4QJF3+75oDkLKDz/VFxZ7twb/CO4nTYzWXwucQzkMg+MrmnDDqMZUUJ44iPR
         YDtgS3q3fK2HN44mQpmQsRDEVNl2EGiF1UPASwBFPtr/hlBsqgj2GGOS2cDcQmP85P9R
         wXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739502071; x=1740106871;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CphyPEj/nIGWcbqF531VSGV3qr1xTmbTkezkMFIl3Eo=;
        b=YEGpP258buhCU+kZ2Fovgs7gzjEROAY33vWltkCKwnHBE1q7KLyCSkVXC1UlWgEZZu
         PvU00Gmp7RfccgEAZojB+qGSMEkvo0l6YDJQgofS/qIkLrYrvssdqvuZB+5bpHgZddwf
         uC/3MvaMdWJXH8OYmW28yc1eDWWrmimUZzH19/PSUqLWjSNIpklCcpMBSrspRDNt3blL
         LGwdukFhvtIOo5xDiZXqp5fcnRq1JOD5WWS2VDmLKTW+iYFWFe9FZQiTB4PmE/LYLOpU
         z+znXC2szpC1tOlJgVO6ntwp80++yA9M+XrfjCW6dYzmoKP1DOxD0y/F7g8Hjok+U7Mi
         7PfA==
X-Forwarded-Encrypted: i=1; AJvYcCXCp6GLTRF90F5hWvjn2rWDFAcT6pM5a8AEyGThw9Le/gfJytMmr5i+5eCeZFRy+X1zLiR0WFOjS8v6uyku@vger.kernel.org
X-Gm-Message-State: AOJu0YwqRLVzxK+eCG+xln9jZXTfMYQ+rX/c8uEsookxIVHqWNiTYW4b
	KZjvK0bXRGp1UnQhCN8MB0ymuBK8kkUN56IAZiTgdJa/WJ0zfIjdKz3rZggYeTA=
X-Gm-Gg: ASbGnctybNuI5MXCeA4vGH+t/TQfLIBNOGvhI9nmE/n6flk1VEEmErw1EC19E22qPrK
	9W0+uGtoQaFs0OvTMyPbKAnWjWlObHL20DRpOPDqfEixI+kz52TFcuy15f2i0TnE6/REuuoRvaA
	pqnQ9kGZbHpfOGxCJvSjCWBmpSr9IYpJFd0og65JS/hC4UYnu6kEwrlQa6MrKN14gVNvNhK6BH9
	OvKFCUAKkAi/J0l6/41dgakHre0+eZcTr7Nap3COhV+oYZUlM8fFeSoAIjnJa65g0TerbnRhgus
	m1LyuBMcZZviE5R7P52lOBBO81ckrgZAzJ0z1uRqOQhVBpnUQTY0T3odWHBGnVZLw5beKCc=
X-Google-Smtp-Source: AGHT+IGas8108vTEmDl4sEKFFTKnVpl5R5NBfMLQH3mhDRcxgPA6rZImG+SqWw4u3LxjJ3511SnHWw==
X-Received: by 2002:a05:6512:31d3:b0:545:271d:f85 with SMTP id 2adb3069b0e04-545271d119fmr268944e87.29.1739502070997;
        Thu, 13 Feb 2025 19:01:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5451f105c9dsm361169e87.121.2025.02.13.19.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 19:01:09 -0800 (PST)
Date: Fri, 14 Feb 2025 05:01:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: aruhier@mailbox.org
Cc: Sebastian Reichel <sre@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] power: supply: qcom_battmgr: abs() on POWER_NOW
 property
Message-ID: <p5tszocxa7mcazgxsnt3gnv547m523gde2hj2yekiuoimm6rsy@pzofvxngb4ul>
References: <20250213-patch-qcomm-bat-uint-power-v1-1-16e7e2a77a02@mailbox.org>
 <yfbgbdugk4xdjpemozdzcuxczx4xd5aphykuksf3lhn22dsgkf@fcfgddu6gpyt>
 <ioiy4ixlvx5gxl3f4pqshwxz35ktrqghju2circpnd3qicgemc@oohazfsfvuag>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ioiy4ixlvx5gxl3f4pqshwxz35ktrqghju2circpnd3qicgemc@oohazfsfvuag>

On Fri, Feb 14, 2025 at 02:36:17AM +0100, aruhier@mailbox.org wrote:
> On Fri, Feb 14, 2025 at 12:24:18AM +0200, Dmitry Baryshkov wrote:
> > On Thu, Feb 13, 2025 at 05:51:38PM +0100, Anthony Ruhier via B4 Relay wrote:
> > > From: Anthony Ruhier <aruhier@mailbox.org>
> > >
> > > The value for the POWER_NOW property is by default negative when the
> > > battery is discharging, positive when charging.
> > >
> > > However on x1e laptops it breaks several userland tools that give a
> > > prediction of the battery run time (such as the acpi command, powertop
> > > or the waybar battery module), as these tools do not expect a negative
> > > value for /sys/class/power_supply/qcom-battmgr-bat/power_now. They
> > > estimate the battery run time by dividing the value of energy_full by
> > > power_now. The battery percentage is calculated by dividing energy_full
> > > by energy_now, therefore it is not impacted.
> > >
> > > While having a negative number during discharge makes sense, it is not
> > > standard with how other battery drivers expose it. Instead, it seems
> > > standard to have a positive value for power_now, and rely on the status
> > > file instead to know if the battery is charging or discharging. It is
> > > what other x86 laptops do.
> >
> > Documentation/ABI does not define ABI for the power_now. However for
> > current_now it clearly defines that it can be positive or negative.
> >
> > >
> > > Without the patch:
> > >     $ acpi
> > >     Battery 0: Discharging, 98%, discharging at zero rate - will never fully discharge.
> > >
> > > With the patch:
> > >     $ acpi
> > >     Battery 0: Discharging, 97%, 10:18:27 remaining
> > >
> > > ---
> > > Signed-off-by: Anthony Ruhier <aruhier@mailbox.org>
> > > ---
> > >  drivers/power/supply/qcom_battmgr.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > --
> > With best wishes
> > Dmitry
> 
> I see. But as it breaks existing tools when power_now is negative, should we
> change the behavior of these tools or adapt the driver?
> 
> As it does not seem common that power_now and current_now are negative in
> other drivers, tools using these values rely on the status anyway. I'm
> wondering if it provides anything to keep this behavior.

I think it is a problem of the 'acpi' tool. At least 'upower -d' uses
fabs internally since the initial commit in 2008.

-- 
With best wishes
Dmitry

