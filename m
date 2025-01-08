Return-Path: <linux-arm-msm+bounces-44370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E836BA05BF7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:49:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D873D164181
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 12:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FFFD1F940C;
	Wed,  8 Jan 2025 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ej627YMr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FAFE1F7589
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 12:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736340562; cv=none; b=rG0avC1IGhZVOOTFdM30Es3ssyttGKmPY6GZTWrUAMBVqSEQSsBW6S5H0I+IfM6bens2xAX355QB7uT9Qv0lqzMqOx8aJkhnwqR1OKtRKYEk7cXLV3wcEWMic1eiZmIHsV0mJLWMGLzv6xbkKwtpgsHtaf3Kok8fp6OilJEg0eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736340562; c=relaxed/simple;
	bh=poSpoPWVxMjpM5jM3gPzh6LWSF45p7xg5JasQjs/93c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VqnriZHIr2ExDuigCAFn9pnCdpQroTqvgp6QxAwOOjRlIevcOwQa1nNzHH0C84oyCvQ8JPII1Szt63edhNjSoR4IbyM96kM0erwrI4GxgfLjekTwIlnv4HZmUQkSpMGJsYitiChW3zgs+PT5zoXO6d/IK+muHrPTIUcevjLyT6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ej627YMr; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21631789fcdso10237745ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 04:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736340560; x=1736945360; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6NNrevyaBXsAg2aeCPAAcVTXNgTwcz58dYMHb1uQ+vA=;
        b=ej627YMrRDjn1dW9fOErLTSbPLT4NmU4oBKtG806nYP6MsVTbghXqXpg6tJSNtrqvb
         rek8K4VTqXf1WIFBNMf4Jm8MHUAk0RHuq6Xshapo1wUBHiQhl8XZvSNQLDByWpqejJtC
         snINgXj34FMQOeoaSBy+2JLqeRqmN7FAzqAYZekNW8YnU2UjekvCjSo4X1bA8Tle8bof
         aLCu7LRksWG3fKqYXmaFkJ5FiJ6++1/q3alb7OH4PYi6ffXFh/JZ22dOqkv8Sphzjz1a
         72qiT9TlEIxicheZe3n1ThbqUYvE5U74wFKF6c30AmaEtJ2UdE9fccnGxaG3MHAxkRmm
         9BHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736340560; x=1736945360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6NNrevyaBXsAg2aeCPAAcVTXNgTwcz58dYMHb1uQ+vA=;
        b=HhX1mZUV88zJkqkVclQaOgtyLDFFh8U0RZ3891jms7UQp3Jteq3Gs4bMJ+DEgXTuUJ
         0ZmZ0EsKvYxxAof87D6I7bIryY5AijHD2KjfZrIx1Iessw1EaUHAII1O9Q8z3dVJfsKA
         Nnwwn9RSiBH3CM2yDozazH3IPLEydtISnL45/fzOun7w59ru7E/PIFbOb40Gd9YEHSmc
         iZxZj8XsNeOU+TMOrslt73biVzbtWjQlHjBF2bD4oDjXOJSWJka3OV74H6VNmezlrnnD
         RQW8I4NfJgOVoJRYN0cLUuAA0GYmfBFcSjS4E/ZBjEoOQngPTHR4xJc2wTtWh941C0KD
         blrw==
X-Forwarded-Encrypted: i=1; AJvYcCVsdPBPtKlbWWUOhBdfzI3fbc96fgs1s+cI61QitaNJcuj0S0wmerqvwdY30Sh9e8DrKY2OvMvGd3Pu2ClL@vger.kernel.org
X-Gm-Message-State: AOJu0YyWyam8CI7rqyvZ97wQ3kMCqLtjAROjfVtOfHZBhtnZlv19zQfY
	go2vcdK+qOHQOoN65E8vRU/r1fKVewNViSbRc60Q+yWhJh2DGJHxW+x6ttA/KDXmdsHJT8pXBlo
	=
X-Gm-Gg: ASbGncsgVKi95vVqXuiu5aSfsKZp1tr3kuXx4QHQWjYDgZgC6HiDb5etXnRsAqYb4XH
	NhhFGAi2tStXSArwGh92zxp/H0oFR6zLS25GrInmYH6O1zOtRLRjCVvQdIp8HqQy4QiXRUqJ9Hf
	oB2axNJd783QY4EiluMF4WP7YwNv/NLkZCxJQwE3xoyCMvXeZYs+UrMXdweFhdxFVR/6niKAQrM
	wBEl0etBSNLM9HBspT0TpcbUsOp87fktWj+mUG2mD+8NoEttaq9NcR+Sk1I7fdAqz65
X-Google-Smtp-Source: AGHT+IFWK/PR3S3nvHRSyBgo3gPIRzY+MUOAKiqkmj3Dqt+w+3OVvcssxaGIgcq2ILGKfpdUQoFVZg==
X-Received: by 2002:a05:6a00:4296:b0:725:4301:ed5a with SMTP id d2e1a72fcca58-72d2167241bmr4305126b3a.2.1736340559634;
        Wed, 08 Jan 2025 04:49:19 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8309acsm35014695b3a.45.2025.01.08.04.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:49:19 -0800 (PST)
Date: Wed, 8 Jan 2025 18:19:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Loic Poulain <loic.poulain@linaro.org>
Subject: Re: mhi resume failure on reboot with 6.13-rc2
Message-ID: <20250108124913.k2p6h4pja2k5vazf@thinkpad>
References: <20241216141303.2zr5klbgua55agkx@thinkpad>
 <Z2KKjWY2mPen6GPL@hovoldconsulting.com>
 <20241218113830.efflnkxz7qu24xux@thinkpad>
 <Z2K53-As8w4IH06U@hovoldconsulting.com>
 <20241218123019.py57s4r3takm2fs6@thinkpad>
 <Z2LUNo--8YpLO6kD@hovoldconsulting.com>
 <20241218140910.ysovysnvns26vbmd@thinkpad>
 <Z2LbnoSplfVNmNaa@hovoldconsulting.com>
 <20241218183555.qste4gve7vnvdml2@thinkpad>
 <Z2PbEPYpqFfrLSJi@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z2PbEPYpqFfrLSJi@hovoldconsulting.com>

On Thu, Dec 19, 2024 at 09:36:32AM +0100, Johan Hovold wrote:
> On Thu, Dec 19, 2024 at 12:05:55AM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Dec 18, 2024 at 03:26:38PM +0100, Johan Hovold wrote:
> > > On Wed, Dec 18, 2024 at 07:39:10PM +0530, Manivannan Sadhasivam wrote:
> > > > On Wed, Dec 18, 2024 at 02:55:02PM +0100, Johan Hovold wrote:
> 
> > > > > But that's not going to happen as that reset is what is currently
> > > > > causing the deadlock and which would simply be skipped if you switch to
> > > > > pci_try_reset_function().
> > > > > 
> > > > 
> > > > mhi_pci_runtime_resume() will queue the recovery_work() and return. So I was
> > > > hoping that by the time pci_try_reset_function() is called, the lock would be
> > > > available.
> > > 
> > > We can't rely on luck with timings, and this is the very reason for the
> > > deadlock I'm currently seeing (i.e. the recovery thread is still running
> > > when another thread grabs the lock and waits for the recovery thread to
> > > finish).
> > > 
> > > Perhaps the recovery work should be done synchronously in the resume
> > > handler to avoid such issues.
> > 
> > Synchronously? How can that help when the recovery_work() cannot acquire the
> > lock?
> 
> During system suspend, pm core waits for any on-going runtime resume
> operations to complete before taking the device lock and suspending the
> device.
> 

Right, but mhi_pci_runtime_resume() is also called from mhi_pci_resume(). So we
cannot safely carry out the recovery_work() synchronously without the
pci_try_reset_function() change.

> Unfortunately, that's currently not the case during shutdown() where
> those operations are reversed, so that would indeed need to be addressed
> first.
> 
> But what the driver is currently doing looks highly questionable as it
> returns success when it failed to resume the device (after scheduling
> the asynchronous recovery work).
> 

I completely agree and this goes against what PM core expects. IMO we need
two fixes, one uses pci_try_reset_function() and another recovers the device
synchronously from mhi_pci_runtime_resume() and passes the return value to PM
core.

Will post the patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

