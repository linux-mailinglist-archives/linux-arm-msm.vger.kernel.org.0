Return-Path: <linux-arm-msm+bounces-42678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAAB9F65EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 13:30:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA89C168B17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1D61A23B6;
	Wed, 18 Dec 2024 12:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zDktpP0G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7A219995D
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 12:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734525028; cv=none; b=UGCbxBphcPyCeR2Sbp5WatI8k/sPpHTnvvsKVo5x4wdSXywEF3SoJkx/DmvmGrhKF1aBM/XtX8p0MZlJ+/tfIj4wFzzr91ffYs04xvCIyV0MeY6O+MI5ki/bG1kI2+OMBZzBMmaJ2W+H+v3p4qP0vC3UKovX5pRNKV4rhorKvGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734525028; c=relaxed/simple;
	bh=sIokGkGvk5wEoau7cfzmPpCeUIVZzmYqS6W9pDT1pms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b3BOwAB5Hzwj534fVd3+YNGJoSVTfgtXTqqc4SeMYO30yFx1n7B+CIJPmh8xV+5/aT/pueWk+1BagPQuGdPFcDcTyedmeRHU+HhBcD0sSlS2440L7dDChsJ4n/zJGbh3/9eNuxFU36GlHTE5zuhzPzJMFQaVZmDshAbGm4zakZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zDktpP0G; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-728ea1573c0so5576807b3a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 04:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734525026; x=1735129826; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6F5mcTldZa7iY872IZQ2vfT0jCbEuXcj2mSPu9gsXzc=;
        b=zDktpP0Go5OVh4src2sJrpL5ub+hg6myILqxFYWCRCVRXH9QIIvuyHMUKearGGjuke
         Ynj25rhN8dp0yR9eDkcFX8w7DlohUBsjGFnZJLC3ie4xfAmCkJtr2+JQOBZj04vKNC0+
         P7vAPGpHHfBhsAlC0vfx37i4P17dZAbHum6LADDljKbjx2LpsYVC7EwTWPXVgvg43xBZ
         vMPPCaxy+V/9F6b3ju10SLKWeYFoRmVthOpcm+JJkd2IHp/FOYr7jAWZF9qUgynuxAun
         gE6i8xWkR6YNrm6arMNWJQQ1SlmvifRaDGsBM5jbKMmp0GAs3OIwHnAvwBP88nfFaXuP
         t5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734525026; x=1735129826;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6F5mcTldZa7iY872IZQ2vfT0jCbEuXcj2mSPu9gsXzc=;
        b=ZZOeBnZTr6+enip+kyPNCHqxaqMD9T6ttmoLlYHx/+2yfqiqupADI4RQPlzRWfCFBE
         nFlckfkKJ3TtH/1MfYFUscnIzI9AbLIOUgh0eQ1BLKmnTTmh5EWL1Cx65NNDrQ7KyioG
         pUBTsABXHjoAX0JcH7Q7lGEZF5S32rqO6A63AmGFHPMfsWPEmTfWKYmpJ72Ax2aoirpq
         YxcSW9noCOtxC7ZdX2hQCQbRqKFD0NZ+njdQsBjtYDbXnB4tPS/IeMAN6lpaSVEMTQkb
         d3paq++IUn41VlmyAESXCLCR6rseyh6T/qhb0xL9imlRvr+3B7eueXIZbKekkun7YxWB
         5LhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWux7acv8oHHbxX6DBN5hhJe372TLHDc8SJ2fN0jCMgvxdEOk4pVQaTVs2Fp7DaebIS3xj9kmpKfXEvJeG7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8t2etElrSw5vSmisSXIgqeZbsIxe04npnjLd2ZS+kTWpDBFk8
	P0GH/3PzVCQkBdbuql76fa/tOjWfci72sAhU2iWyTRgq9h9sKs6RbgiiCsGtrQ==
X-Gm-Gg: ASbGncspop1EtCOJ+Xvt1JkT3RHu86k2wIIHqLs579IHX1luSkEsh03zq2I0dIEsU5k
	qIITCWhaCokYDOzwZSjCUuMwVdN4e4kLJIEOh99bEyUv6d97+fr61Vzyme/VdRAzV/c7o8kDuDC
	ESUrNrhWBHi86jgWYlmAvQJrl27Y5+sl33bjv3zLN5YFHJ71PZlpaBFcExE6jtBijJZtIPmi8IW
	vluMS9fPGgi916HlzxMMqmI2+OldKn3UKt5WGC5WECBsAphkQdF8KyYx8VzMqRyjRHG
X-Google-Smtp-Source: AGHT+IEVCTF8u4ejkks/VblnJMBrY/RN2wVeVg8W2IFUErI8HUe0PMrVjMwp1C2jnmKDGR2tk1cBMA==
X-Received: by 2002:a05:6a00:180b:b0:728:e27c:a9bc with SMTP id d2e1a72fcca58-72a8d237723mr3199997b3a.7.1734525026308;
        Wed, 18 Dec 2024 04:30:26 -0800 (PST)
Received: from thinkpad ([117.213.97.217])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-801d5ae9fe6sm7377693a12.49.2024.12.18.04.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 04:30:25 -0800 (PST)
Date: Wed, 18 Dec 2024 18:00:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20241218123019.py57s4r3takm2fs6@thinkpad>
References: <Z1me8iaK7cwgjL92@hovoldconsulting.com>
 <20241211145315.vaf7gbapieywcvau@thinkpad>
 <Z1mp3_ArzL-GLr3D@hovoldconsulting.com>
 <20241216074021.kwoid2747o7piquv@thinkpad>
 <Z2ApCU3DAxKS7Y9k@hovoldconsulting.com>
 <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2K53-As8w4IH06U@hovoldconsulting.com>

On Wed, Dec 18, 2024 at 01:02:39PM +0100, Johan Hovold wrote:
> On Wed, Dec 18, 2024 at 05:08:30PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 18, 2024 at 09:40:45AM +0100, Johan Hovold wrote:
> 
> > > I've tracked down the hang to a deadlock on the parent device lock.
> > > 
> > > Driver core takes the parent device lock before calling shutdown(), and
> > > then mhi_pci_shutdown() waits indefinitely for the recovery thread to
> > > finish.
> 
> > Thanks for tracking the deadlock. I think we should use pci_try_reset_function()
> > instead of pci_reset_function() in mhi_pci_recovery_work().
> > 
> > If the pci_dev_lock() is already taken, it will return with -EAGAIN and we do
> > not need to worry in that case since the host is going to be powered off anyway
> > (and so the device).
> 
> That may work. But note that I've now also seen this deadlock during
> suspend (i.e. when the device is not going away). The
> pci_try_reset_function() should avoid the deadlock here too, but we'll
> end up in funny state.
> 

Hopefully, recovery_work() started by mhi_pci_runtime_resume() would be able to
reset the device.

> Now I'd also like to know why I'm suddenly seeing these runtime PM
> resume errors of this modem. Haven't seen them before 6.13-rc, and I'm
> not sure that it's really the firmware that is crashing left and right
> all of a sudden.
> 

Yeah, that's worth the effort. I'll go ahead with the patch since the issue is
present anyway.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

