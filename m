Return-Path: <linux-arm-msm+bounces-44167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1260DA0454D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:59:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3F71621D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA6991F37B6;
	Tue,  7 Jan 2025 15:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xd7tIbag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000C61EE003
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 15:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736265584; cv=none; b=KN7q/8xK/48PuOdn7vkxDgdTLlQts6lO9XvAFFNxdG5nwSZ0cN+s0NGpvO7KDCxaECtYwY3sGg/oN0alzTHmKhSw6FbdGLznLsazI79kl0fSgsHK8m1WkwI0REag4LO9GFaeTyf3chgxI+f4zYQkxx9gOQjjbkFh8yOeSh0LMnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736265584; c=relaxed/simple;
	bh=l+Qrsw0fVCXtAQkM7h7C+anVR3mchFyzhSwGDio+GBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKjnwjVK4oPCJJ1q73tiNLB4quoH5zMb9vUiQnCgltTW48QiX8le4pdC9FK2vottDgAC5SdCWPE5F7F0To9i44167tDh4466xF7EW6oONxtMYVX+KP+rxaEGQVhKBshDvn2yaCnHvhAc+psKfbLSotvs4MJeL92A2M30wLD0gjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xd7tIbag; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso108564825e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 07:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736265578; x=1736870378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+ADADWhOmPqLF2wl2yVt0du6NuOaHurQK2JRxbZmU4=;
        b=Xd7tIbagBPTQIsbpJquxZLQsCUBXde7Gvj6lJ/s7YNb2g58Yrd2ShXMK7wKi6Bn/tE
         N39xxrOTToiVCyTPu1pV0fipIbot+hrzHmnwespedpG1bcj4OYpwIHYneHa/RwONfwkV
         OXqMayc52QOmYFoYie0PociqH9S3ZeG1iW/31a9Wi2gnOGyQV3A9bS/egPlU5D458BzJ
         ehGwU5y3OXQmn1gm2kMQ0XxYKVzGIhaNgQX4+UnvIxlFscyv0o/9T8YMS9/gJWIBfp2m
         Go2twDbJ0BQUXpdGxHb6mfs9DMPNib5PBncAdWT9N6jeTapI3Gc4EY8vJVCLDauL+eb7
         MZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736265578; x=1736870378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+ADADWhOmPqLF2wl2yVt0du6NuOaHurQK2JRxbZmU4=;
        b=myAq+werJ0lI5q4wxyA4YoyxFq1cLlIotrvISgpfsBaloXdQw5Jd4ahjiMmUyg0QKl
         ZL1Z1XDxcJdKKjtlt45JZKIJF5BdRPnc+HGf0oW98Op1tRyYGPG2s1Wgi5DdcOoCDqN4
         bZsGlKFt9sduK5fB1o1smeQItuAgka1p3BD8RKxV40OuCSbrGLpYpvIwFB46aoNDjOBq
         dRxkupqfX0NqWh43iSwc4r+383ulRPCIVa+hyiTpNMbbDKvQuV/03rOzntv49RNwkkMm
         KrGEKZPoLZIH4G+6RzOijSNz89q7Bf5jVh+tw5z/nU1zqQ0XbStmPyH2PvFzRY4c67+1
         cnBg==
X-Forwarded-Encrypted: i=1; AJvYcCXeXyrTgPvX7o+Wb1Tl8Jjb3DOAZfFgdSSoB6ZMD4Eny44NiiP1R4fyS2L6xVqSQrRga6rzmtNvmDGIsVhT@vger.kernel.org
X-Gm-Message-State: AOJu0YzqIcuDeo02Ss9VQTI2h8vbBN2ixrAxKw7Kf8mSMWsx5hhBCiB6
	XdZnEX52t7dsnluvUw+L1ZGpHYEz5FtUeiQj+1i2WUpOKuf+YmAyzXW9gv/4RCc=
X-Gm-Gg: ASbGncv1H0A8MoSGmBBJJjjW+xH/DhbwmjSu0uC+3Fb/bDdSs3NVoFoqulnWLXxGv73
	Lt2r+IuRHmrUBbAm25BCoBqqJdpLDGrmiH09U+tAoo22U0X60AWJYKq013Ez7Hc01RA6TPOw+s5
	kTOakSNE6zZV6jnO4Zsx5peOpg9p040AmCbiY/K2r43ssMJt4umqjClXDpCMbSb/EhJdgG3vBbl
	4KV17yoHOK2FTUBwv0JHX/3+1T2qz/r6/wcxn+seiDFOYhVrQE0TV8=
X-Google-Smtp-Source: AGHT+IHnKv0kLLNL0GG1YXgdtnDBlDk632FVanPGB41cQBbp9am5uqBkiza9lwphaCUvyiU4W9JsTA==
X-Received: by 2002:a05:600c:3516:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-436686464e7mr535176005e9.19.1736265578320;
        Tue, 07 Jan 2025 07:59:38 -0800 (PST)
Received: from linaro.org ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436611ea47asm601467345e9.4.2025.01.07.07.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 07:59:37 -0800 (PST)
Date: Tue, 7 Jan 2025 17:59:36 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e78100-t14s: Enable fingerprint
 reader
Message-ID: <Z31PaEckuGQEZxyh@linaro.org>
References: <20250107-x1e80100-t14-enable-fingerprint-sensor-v1-1-8fd911d39ad1@linaro.org>
 <Z308ZCrnsaLReaIX@linaro.org>
 <Z31F_sZahYrCSVlr@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z31F_sZahYrCSVlr@hovoldconsulting.com>

On 25-01-07 16:19:26, Johan Hovold wrote:
> On Tue, Jan 07, 2025 at 04:38:28PM +0200, Abel Vesa wrote:
> > On 25-01-07 15:35:07, Abel Vesa wrote:
> > > On Lenovo ThinkPad T14s, the fingerprint reader placed in the power
> > > button is connected via the usb_2 controller. The controller has only
> > > a USB 2.0 PHY which is then connected via a NXP PTN3222 eUSB2 repeater,
> > > which in turn is connected to the Goodix fingerprint reader.
> > > 
> > > So enable all the usb_2 controller and PHY nodes, set dual-role mode to
> > > host and describe the eUSB2 repeater in order to get the fingerprint
> > > reader discovered.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > 
> > Turns out that on resume a couple of things are broken w.r.t. to the usb_2 controller:
> > 
> > [   41.104913] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xe2010600, fsynr=0x110001, cbfrsynra=0x14e0, cb
> > [   41.104936] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x14e0
> > [   41.104950] arm-smmu 15000000.iommu: FSYNR0 = 00110001 [S1CBNDX=17 PLVL=1]
> > [   51.420689] xhci-hcd xhci-hcd.6.auto: xHCI host not responding to stop endpoint command
> > [   51.420702] xhci-hcd xhci-hcd.6.auto: xHCI host controller not responding, assume dead
> > [   51.420720] xhci-hcd xhci-hcd.6.auto: HC died; cleaning up
> > [   51.420836] usb 5-1: PM: dpm_run_callback(): usb_dev_resume returns -22
> > [   51.420864] usb 5-1: PM: failed to resume async: error -22
> > 
> > So do not apply this yet.
> > 
> > Sorry for not testing this properly before sending.
> 
> Heh, thanks for the heads up.
> 
> I was just about to reply with my:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> 
> after comparing with the schematics and verifying that the fingerprint
> reader enumerates.

Thanks for reviewing.

> 
> But I do indeed see something similar here on resume:
> 
> [ 1891.737726] arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0xe3f6ddbec0, fsynr=0x510000, cbfrsynra=0x14e0, cb=3
> [ 1891.737738] arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x14e0
> [ 1891.737746] arm-smmu 15000000.iommu: FSYNR0 = 00510000 [S1CBNDX=81 PLVL=0]
> [ 1891.804342] r8152 7-1:1.0 eth0: carrier on
> [ 1902.039158] xhci-hcd xhci-hcd.1.auto: xHCI host not responding to stop endpoint command
> [ 1902.039191] xhci-hcd xhci-hcd.1.auto: xHCI host controller not responding, assume dead
> [ 1902.039795] xhci-hcd xhci-hcd.1.auto: HC died; cleaning up
> [ 1902.040050] usb 1-1: PM: dpm_run_callback(): usb_dev_resume returns -5
> [ 1902.040272] usb 1-1: PM: failed to resume async: error -5
> [ 1902.581479] OOM killer enabled.
> [ 1902.586673] Restarting tasks ...
> [ 1902.587565] usb 1-1: USB disconnect, device number 2

Turns out it is the GDSC that has power status flags PWRSTS_OFF_ON when it
should've had PWRSTS_RET_ON. Sent a fix here:

https://lore.kernel.org/all/20250107-x1e80100-clk-gcc-fix-usb2-gdsc-pwrsts-v1-1-e15d1a5e7d80@linaro.org/

With this patch, the above resume issue goes away entirely.

> 
> Johan

Abel

