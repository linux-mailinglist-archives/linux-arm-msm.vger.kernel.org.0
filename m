Return-Path: <linux-arm-msm+bounces-44428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D57AA06104
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 17:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 736131678AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 16:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE94B15B99E;
	Wed,  8 Jan 2025 16:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I++6xX9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C2C199E88
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jan 2025 16:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736352142; cv=none; b=BGNsIlHnvilN2L0SvDm2+wMAMCOlMELqGo03TvV/g09UK9OsB6RjyQeQCSc1Q7i8sDOqvtnLE51VuzTurG/F3S8pFGAtvBFUJOnbjBb8sFo7lZBWes2Ds5Nf6cuUHFG1uAUGzm1Vd7644z2gpRCiRyQGEstMhJXd1PU5R68zeko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736352142; c=relaxed/simple;
	bh=q2pod2nUbwMJD0bdVvi2G9EzGICOQ3Pcv9WM6ocnZY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YgiIlwJr6bppqp1puF3BEiUrzbixwuri4A2lSPfvy3QoGJi1PQ/5oJI9WSuCh65Gz0aQ2NxpNfgrddRiEBcJuQ30pm3tWO7UBJ+mWkCds4GV6WPu+rp/1sld87SMPMLWjajMpREl7K+cRhLOTu5B/1hkCjk/Gli+FspMJvaD/eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I++6xX9b; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21644aca3a0so81667375ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jan 2025 08:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736352140; x=1736956940; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gDnmmr+BPzeGSONCgPZRDtmO65LxOmvvSiVUiu5r1WI=;
        b=I++6xX9b8Y6I8yvtjQp3yw5PiNR/inwXfxk/igpwBv0lZpW3sgfdr5NDe5ZFwMMlA9
         CDxsIKTVla18Xsfb5Q2Cq6Axo8ixdNeYtQparZ5W09B48NsRXjvNfkadu8iIeO23O9FD
         A4oy9fsOF3KPSuU/C03WGqMOtBAKDosx2G0E6LE5MrUWxgV3iEcU8gOFcyQ6Q7XgJInm
         73Gbd+JIyQCWPGqstZ58nv8dh7MHrGidBZd0Cig5xlnPvQ9RSOBOuU5BRQFgy1Yo3Up5
         IXiqJvSce7sV967fdT0cBHOiyb86EOq5zmuZyOmvSYOA16dpBfycCyiqe/b3RkvCHtbn
         roFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352140; x=1736956940;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDnmmr+BPzeGSONCgPZRDtmO65LxOmvvSiVUiu5r1WI=;
        b=MhQ8PEQCNGnCo2oUYer+1kjcNYaNi6X8a9EWlFeJdd70fXL9vvfbqsw6qbIxyct5kx
         Al8b1ZoY96fNZzjDvwyxjFZQzZX/foiaY2lYOSErDBMGfYTjP7Gq2tFDhIGmp4Hq48gb
         gz23oPpObaR31O/KoNA30HCbIkyPaKs9kViMKeNG3OY5ZDZ+KOOdYQVcBQGXqMFKaYzJ
         xSnl/2pwXWYa5lqPXdfzNEikvewGgWnOyGfiyTagP6e3+j239Qwb3Uo5w7hdqQaeiTWO
         573u+J41L60vmdUPsJSrqBsUBwO1EnFl+wwOX5msI2NVKNMvuzhukIE+e6yqz7sQqV3E
         5TZA==
X-Forwarded-Encrypted: i=1; AJvYcCWiHmrcD4z4Li12h87hUW56CC4orW20lSEMb1D/xT2SFYXIEB72nrLfuPCOpll6g2hW2zBtb64atX0frLDX@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZJuntuueNdKdWpD1F0zg8qPuACxdD+24y+8qfoPNgWBdV0Uy
	3Ze3kENfEJ9aKjcDboTuzOE+rehsdHja5PsRaP4pftOad6s1tfHUBR4q61NAdA==
X-Gm-Gg: ASbGncuHnLz6jtbyGjqPFzosB2nNYu5OeJDUfHBCroOD+XmBBX7ajTggoihMviA9z9u
	pPEOKGUD6C8HSdnHTHhTUqj59XtOP/ywMaLgcQc2wwLcNDgrGrNFIvspk6EIsufH3R141/BkBBA
	Yf3l2kZnLrHsTR1dBb+eTaQjaXFZtqru6aqjGGSfVa6C9gNKZwy6reJhigVf1q3ZLrEhaT4kfx3
	TiUiKpLmhCixO94w1qY7TDyMrUdf+GwEIsvTToVKEc9h1xFOh3Qdu/k6eNrJvGJ5J2D
X-Google-Smtp-Source: AGHT+IGnIOJxVu4wkWjov5XG3BAJjb4T++JDP8RJTAnpDKLkqISVD6wPeoA7et1loROcLPRxCQ2RcA==
X-Received: by 2002:a17:902:c941:b0:215:7fad:49ab with SMTP id d9443c01a7336-21a83f46a12mr51005925ad.10.1736352138709;
        Wed, 08 Jan 2025 08:02:18 -0800 (PST)
Received: from thinkpad ([117.213.97.234])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc970cbbsm329441405ad.103.2025.01.08.08.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:02:18 -0800 (PST)
Date: Wed, 8 Jan 2025 21:32:11 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Loic Poulain <loic.poulain@linaro.org>
Cc: mhi@lists.linux.dev, Johan Hovold <johan@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] bus: mhi: host: pci_generic: Recover the device
 synchronously from mhi_pci_runtime_resume()
Message-ID: <20250108160211.6dok3zcn2qaoj3lp@thinkpad>
References: <20250108-mhi_recovery_fix-v1-0-a0a00a17da46@linaro.org>
 <20250108-mhi_recovery_fix-v1-2-a0a00a17da46@linaro.org>
 <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMZdPi9KiLczjETLwJG_9krn_z=Og0uZhYuajPeZYoBHanxMiw@mail.gmail.com>

On Wed, Jan 08, 2025 at 04:19:06PM +0100, Loic Poulain wrote:
> On Wed, 8 Jan 2025 at 14:39, Manivannan Sadhasivam via B4 Relay
> <devnull+manivannan.sadhasivam.linaro.org@kernel.org> wrote:
> >
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> >
> > Currently, in mhi_pci_runtime_resume(), if the resume fails, recovery_work
> > is started asynchronously and success is returned. But this doesn't align
> > with what PM core expects as documented in
> > Documentation/power/runtime_pm.rst:
> >
> > "Once the subsystem-level resume callback (or the driver resume callback,
> > if invoked directly) has completed successfully, the PM core regards the
> > device as fully operational, which means that the device _must_ be able to
> > complete I/O operations as needed.  The runtime PM status of the device is
> > then 'active'."
> >
> > So the PM core ends up marking the runtime PM status of the device as
> > 'active', even though the device is not able to handle the I/O operations.
> > This same condition more or less applies to system resume as well.
> >
> > So to avoid this ambiguity, try to recover the device synchronously from
> > mhi_pci_runtime_resume() and return the actual error code in the case of
> > recovery failure.
> >
> > For doing so, move the recovery code to __mhi_pci_recovery_work() helper
> > and call that from both mhi_pci_recovery_work() and
> > mhi_pci_runtime_resume(). Former still ignores the return value, while the
> > latter passes it to PM core.
> >
> > Cc: stable@vger.kernel.org # 5.13
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/mhi/Z2PbEPYpqFfrLSJi@hovoldconsulting.com
> > Fixes: d3800c1dce24 ("bus: mhi: pci_generic: Add support for runtime PM")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Note that it will noticeably impact the user experience on system-wide
> resume (mhi_pci_resume), because MHI devices usually take a while (a
> few seconds) to cold boot and reach a ready state (or time out in the
> worst case). So we may have people complaining about delayed resume
> regression on their laptop even if they are not using the MHI
> device/modem function. Are we ok with that?
> 

Are you saying that the modem will enter D3Cold all the time during system
suspend? I think you are referring to x86 host machines here.

If that is the case, we should not be using mhi_pci_runtime_*() calls in
mhi_pci_suspend/resume(). Rather the MHI stack should be powered down during
suspend and powered ON during resume.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

