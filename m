Return-Path: <linux-arm-msm+bounces-46793-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 499C1A25EF5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 16:38:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EDCB1881669
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2025 15:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD15E209F5C;
	Mon,  3 Feb 2025 15:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TpiY7HNG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6D620A5CA
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Feb 2025 15:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597054; cv=none; b=gvb9P/NCdzrrCp++95R6vsAzeDGE7vyfiA23t6G+txjakjpzgZVx7GxtOnMoN9m4nmAy2iI1uU753OvRjxZOt+8HjnXVeztmB+4qTnDRFuP3OoaKdDrfV8r+tuCaukAEWc6jq67xDBdsgBUX04+y13Ft8M/Y/NF/8JMjd+nZgUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597054; c=relaxed/simple;
	bh=fXSwyb6kluFm+mPLGWZ4iJ5T4rAna3D85/lI9eoXJ/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEpuv9AZvVu2mK+fmjR1EEMuzOFgeL1f8MOd208b2YSZ/BL+DKbmiwJvgf7FFWdjqqn728B3FyiDvl/OTxDtgQCHptwha90dKDofrLqD20ChuxwcG39OlyGhzEppgW06HFGor2uY1X8W7Bph+Rm1O9l1WT3A0gfKqQnhM5oQMjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TpiY7HNG; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54024aa9febso4568461e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2025 07:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738597051; x=1739201851; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UHRIhzqvNH1bzn0adefvZWos6ZS5C0TEuaPKGujIOQI=;
        b=TpiY7HNGSkPhFMjPF96dMgtKofwLOuWS4oXrZAhxjPtpf+OmGsadqTiOhlQGKx7ymm
         Qxu2fQ+50v91dRjkoot8X7DxphsKitpL3+QIsyXB+RKoWkxCkvyKyKgdm7OlmugmJ0d6
         SRPiwp8kWRgLQgHU6Zwfibwx2xKgYcHGRKclx8Dzkqiu5LXQ/+HyPQGX6c1TBQedNDqr
         8XLwpw35Azd3iDbzM+QT1ZkfawbAWX+toqxc9h1n4Hmyn87ixrjOtIDN+c3nWsJApWuT
         ILbCqB6/g/u5eHSxfORLQJgCk+64Y1s1teflNmSNS+UeAw9xDHTT0jUKIp2WE6lo/iP/
         cWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738597051; x=1739201851;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UHRIhzqvNH1bzn0adefvZWos6ZS5C0TEuaPKGujIOQI=;
        b=ax/+qU/olzJzH5+cJSXd8dg4Le+6T0aNY9tHRyuxZP43VJ7mIdYI/by5QzGTyrIeUY
         fcwl58MVT0HwmDIl2f2GI9x3y9i1ijTP+n2vCPo+yyIfYg9CSIqjzg0kN7PAHqA+9Gyz
         Tg4f+40Z7TCr3aX+fTtCRYEz/zG71wpILCp01GI2qv5lCFxh3YbrfEXitSrUoBZ6/+ad
         PiY2ho674IL4XXFdz/dpxqauSn4+J1W72B7Aow4CWdPG77yZD1eTc+LSL6Jnu6x/ufw9
         eJK+G4GukDMAAOWeZlT0ugX/bAtBz1U0buunLXc/WGOrTgBVpada9Y+8tBUlbAvhp1Pp
         /uHw==
X-Forwarded-Encrypted: i=1; AJvYcCXX9ZhF26NT1zW+g6lsix7kPCw11bTJfnOJULixGz9nxpnRh+LDzHkXFTOrAXcizXmUaAt8eTCTgxMoVJ7z@vger.kernel.org
X-Gm-Message-State: AOJu0YzoyltbBceRZSxqQRmOpJoowstPGd6pSKsyBkpvpHovVCCjsrv+
	FVwa6ALfyY5i89mXJHM/yamH2m8ZvrzZrw0I6zL4oL4/AL8QbFT/c48d++idEMs=
X-Gm-Gg: ASbGnctUMIm5yHXhji1F5MNWdfUtR7rBGTmYhPDXs42zF4FGRgNoat3rFuzeTGj3IyD
	AQIBsewn9yyGVrSjkI4KMzOtx0m5SQXgDPQWEK0VovZupMNxzL6vblbb+UNJoWhC0qKy9sYr3VJ
	qNkvbbyUTfpJlwbTTKdL/tPRl4AkkEodZxjsyKFJXdUJ8ASBLFwjW55WbD5Pn2ydZb1tCEMuc7U
	TCAujvbWw+Dr4emfi50vaaRRlS3HJ+dl/T8R6ZxGXf9hUVfQf7m8HwzOJeU6ejM/3KcDHIB/stZ
	VkjO0ZTazls2OKlLB3k7jDhzzNST+i9P0vtGT1PWAz9BL2S3Qwzyjx9FTXNqQQaXxqVpPAQ=
X-Google-Smtp-Source: AGHT+IGh+KF+0uAYGcEmgM7tPX/mz+NrDdDUP0TAAcJzdf4B7LZrgSe3h4Ylxvx3xmOG8C7EsGJV7w==
X-Received: by 2002:a05:6512:3c8f:b0:543:bbe1:b0fe with SMTP id 2adb3069b0e04-543e4c03049mr7131057e87.24.1738597050676;
        Mon, 03 Feb 2025 07:37:30 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb0993sm1308210e87.132.2025.02.03.07.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:37:30 -0800 (PST)
Date: Mon, 3 Feb 2025 17:37:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Vikash Garodia <quic_vgarodia@quicinc.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <fhqlt5xsz7yyrbnvhnovt66gzldjjbitpeznlvxztobdxmjnuw@d4avd5fq3muh>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
 <Z6CApNuSlPGvVL2k@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6CApNuSlPGvVL2k@hovoldconsulting.com>

On Mon, Feb 03, 2025 at 09:39:00AM +0100, Johan Hovold wrote:
> On Fri, Jan 10, 2025 at 08:01:21PM +0200, Dmitry Baryshkov wrote:
> > On 10 January 2025 19:30:30 EET, Dikshita Agarwal <quic_dikshita@quicinc.com> wrote:
> > >
> > >
> > >On 1/10/2025 7:58 PM, Johan Hovold wrote:
> > >> On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
> > >>> On 1/9/2025 8:41 PM, Johan Hovold wrote:
> > >>>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
> > >>>>> Initialize the platform data and enable video driver probe of SM8250
> > >>>>> SoC. Add a kernel param to select between venus and iris drivers for
> > >>>>> platforms supported by both drivers, for ex: SM8250.
> > >>>>
> > >>>> Why do you want to use a module parameter for this? What would be the
> > >>>> default configuration? (Module parameters should generally be avoided.)
> > >> 
> > >>> This was discussed during v4 [1] and implemented as per suggestion
> > >>>
> > >>> [1]
> > >>> https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/
> > >> 
> > >> First, the background and motivation for this still needs to go in the
> > >> commit message (and be mentioned in the cover letter).
> > >> 
> > >> Second, what you implemented here is not even equivalent to what was
> > >> done in the mdm drm driver since that module parameter is honoured by
> > >> both drivers so that at most one driver tries to bind to the platform
> > >> device.
> > >> 
> > >> With this patch as it stands, which driver ends up binding depends on
> > >> things like link order and what driver has been built a module, etc. (as
> > >> I pointed out below).
> > >> 
> > >>>> Why not simply switch to the new driver (and make sure that the new
> > >>>> driver is selected if the old one was enabled in the kernel config)?
> > >> 
> > >>> Its about the platform in migration i.e sm8250. Since new driver is not yet
> > >>> feature parity with old driver, choice is provided to client if it wants to use
> > >>> the new driver (default being old driver for sm8250)
> > >> 
> > >> This should be described in the commit message, along with details on
> > >> what the delta is so that the reasoning can be evaluated.
> > >> 
> > >> And I'm still not sure using a module parameter for this is the right
> > >> thing to do as it is generally something that should be avoided.
> > >> 
> > >I understand your concern of using module params.
> > >I will modify it to rely on Kconfig to select the driver (suggested by
> > >Hans) instead of module param.
> > 
> > Please don't. This makes it impossible to perform side-by-side
> > comparison.
> 
> Why? You can have two kernel builds and run the same tests. And you
> obviously cannot run iris and venus on the same hardware at once anyway.

At once not. But unbindng and rebinding another driver works perfectly.

> > Also as venus and iris drivers are not completely
> > equivalent wrt supported platforms, distributions will have to select
> > whether to disable support for older platforms or for new platforms:
> > Kconfig dependency will make it impossible to enable support for both
> > kinds.
> 
> You shouldn't have both enabled. The only reason for keeping support
> for the same hardware in both drivers is that the iris support is
> incomplete and considered experimental. No one should enable that except
> for development and evaluation purposes until the driver is up to par.
> And then you drop support from the old driver along with the config
> option.

That's the plan. This modparam is a temporal thing for transition
period. And yes, as a developers / platform enablers we want to be able
to have a quick turnaround between drivers.

Please stop forcing your decisions on other people. The Linux kernel and
its development process has always been about providing a possibility,
not a policy.

> 
> Johan

-- 
With best wishes
Dmitry

