Return-Path: <linux-arm-msm+bounces-44862-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79BF7A0B1B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 09:51:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CD4118862A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2025 08:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF8A4233D69;
	Mon, 13 Jan 2025 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uSCk0ViU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6ED2343B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 08:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736758276; cv=none; b=V6ozUYHVIg7F1HIkNLUIUxCqBqdFBNuVOhMh+UNDurONZVZIhQ6AT5OvQy6xk3C7++GUEAWSDFNXin8DY8OXD3xu7R7WL6mLBUzYMJXpnz+t9l+zOMhe9Op01H+yDB0RCVc4lmoqoTSK/fHnJ+QhLvO1//qjZ+R/8vhNe5vjwBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736758276; c=relaxed/simple;
	bh=+Z5prmTCb+oDs07079cuNL2SGjlnIAeMhBOQqymQnA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7cpn6ss3FFvUUIlS6k+TLRFfjmnE3D5XI2FI7/flsbf3IlIUGc6WrCUpZx1LdzEb/qCjQSDSQbeyJzIy9SHvnf93YJ6vRNDJibm2f9Uc1O32dsUOZSepiIsOuRu2fN+7VpsmSvXQBDUEHD+BZCqwKi2BFElhE5teE6S/bSAvGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uSCk0ViU; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54024ecc33dso4224229e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2025 00:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736758272; x=1737363072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=048DNHsUr5Lyejn6F8rF+CJuBLOrQRkkM5wh163rrhE=;
        b=uSCk0ViUFJFnpgaVeyHe6YRFsJ/kF/ZtR/D80/FCzireUucEJcTkMVVDeNENPt/dcE
         pUSbzzuhR4qdyESr5W5qPVIbdb5WbjM1FkC98qhhUGcHiyeqmDPmndkBaByaFBWYGSJc
         CRN6u5xehW4f7PnnP7dp3F4zCXOhpo2tTIUJ5HwJRKrzOI7VSpS2um7q4Fhg4T0WXiLX
         2SjKWtJRdURXCWRoIeyTb//aQqIWsOQnU78FgvF+Q46ciVUqNuLx0T+OALID69ajc3rE
         uSk6AyTfUiFKYu/PGosY/UOCdsxwdmqSPVKJgG184OhJQYf49XqkDkyslO4Hj8msvCwZ
         jUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736758272; x=1737363072;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=048DNHsUr5Lyejn6F8rF+CJuBLOrQRkkM5wh163rrhE=;
        b=ISpQE6oeXY9LqbcTQ9I4KGG3zEus7Oyywyw12Du/9OiaUdEKcq99OyvWRj+Xffkyh0
         L9enmCSGbWZH+pUXbDWHU9xTHTFEMpr1nBkaxIpMikwvuQpGUsyRW+4eP4fyhCxPLNY3
         aMgZLgB40G+dNtlULdb0zqA+965Zho83FOP6yCYBpUZrsyio6J/q8L73oNBBWGQWDWon
         EBzesFJIKVCAUSYHYgPH39+HPJKCs/J5DDKpY3kbiEK06jgv3vqGlPwlaicJmV29z+K6
         KN7MeZWZp5Aod5sgxGplfg36xm64nfvd8qbPcvhpcSq5Fl0Vg9GhAC4chmIng9RHO89a
         yeEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsnkgmGcIihLytYLZcDlr9P+zjtaBGukFrA/niQFoioBSUtlUdnK9Gwnbik1DyZxhItdFj3uB1CeD8sM1u@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv66BMzUhBtpG53r1fswOx7A9pGQps+sp6Rfm5XpZe192mlWeD
	iTpj3BDueSxTSApn1+bf2CYcW+3WlaMKFJ2ml8Z2ReYUd/2wtoekpbMVa/X4Q5s=
X-Gm-Gg: ASbGnct9vdoAv+eTXPbL9lSkuK8TE/dP6ldnhEVhiOxy9M/+QeURn8cT/vbZfbEeaI5
	ffGaSXSUrCJvOtUUsV2E5d7HBg+AF7n8SeqoX75GmnVQGgqf3k8lYm2XMPpD03yMKgW0MK9vc9u
	rDYaptrS/MjglUKFomxIm6EnDTvpEmony2p4Gsgg5wEPjP6TfDereN2eS85CfurlF0WGag4Yh61
	yhz/6S86XxfhA0WNvzSJ1gmxvE8tDFVs7f7+5JPr01a/SsRt9CEgEeUEruPBkZePN+64o+NfTLF
	cIVsWS81ks9JjyFK09wvlF3gKT1iCbLGoAsB
X-Google-Smtp-Source: AGHT+IESNETyoON7XhG6iG8wMZhTF+SNpf8b4JzA6aVM6NNTM9TmEdslkQdtSrWJsx7D2pIHOF33hg==
X-Received: by 2002:a05:6512:282a:b0:540:1d0a:581d with SMTP id 2adb3069b0e04-54284546aa9mr6041929e87.24.1736758271950;
        Mon, 13 Jan 2025 00:51:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be4994esm1271981e87.40.2025.01.13.00.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 00:51:10 -0800 (PST)
Date: Mon, 13 Jan 2025 10:51:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	Johan Hovold <johan@kernel.org>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Jianhua Lu <lujianhua000@gmail.com>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v9 27/28] media: iris: enable video driver probe of
 SM8250 SoC
Message-ID: <hk3u56pboanfwwai5r6qzbzhrtwgvpvzpzhdcq2hzsqjl6coql@z7xxbnmtjtlu>
References: <20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com>
 <20241212-qcom-video-iris-v9-27-e8c2c6bd4041@quicinc.com>
 <Z3_nCPk_g8znto4A@hovoldconsulting.com>
 <64f8bebd-35e1-c743-b212-e1a3292bade2@quicinc.com>
 <Z4EuiPEw8mvDQ2gv@hovoldconsulting.com>
 <24334fb8-4d83-eb06-aee3-dfe1f8e4937b@quicinc.com>
 <552972B8-1ACA-4243-A8E3-8F48DAF39C5C@linaro.org>
 <7e75deb6-6c0e-4bf8-b4c5-d76b1abe2d5b@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e75deb6-6c0e-4bf8-b4c5-d76b1abe2d5b@xs4all.nl>

On Sat, Jan 11, 2025 at 11:45:02AM +0100, Hans Verkuil wrote:
> On 10/01/2025 19:01, Dmitry Baryshkov wrote:
> > On 10 January 2025 19:30:30 EET, Dikshita Agarwal <quic_dikshita@quicinc.com> wrote:
> >>
> >>
> >> On 1/10/2025 7:58 PM, Johan Hovold wrote:
> >>> On Thu, Jan 09, 2025 at 11:18:29PM +0530, Vikash Garodia wrote:
> >>>> On 1/9/2025 8:41 PM, Johan Hovold wrote:
> >>>>> On Thu, Dec 12, 2024 at 05:21:49PM +0530, Dikshita Agarwal wrote:
> >>>>>> Initialize the platform data and enable video driver probe of SM8250
> >>>>>> SoC. Add a kernel param to select between venus and iris drivers for
> >>>>>> platforms supported by both drivers, for ex: SM8250.
> >>>>>
> >>>>> Why do you want to use a module parameter for this? What would be the
> >>>>> default configuration? (Module parameters should generally be avoided.)
> >>>
> >>>> This was discussed during v4 [1] and implemented as per suggestion
> >>>>
> >>>> [1]
> >>>> https://lore.kernel.org/linux-media/eea14133-2152-37bb-e2ff-fcc7ed4c47f5@quicinc.com/
> >>>
> >>> First, the background and motivation for this still needs to go in the
> >>> commit message (and be mentioned in the cover letter).
> >>>
> >>> Second, what you implemented here is not even equivalent to what was
> >>> done in the mdm drm driver since that module parameter is honoured by
> >>> both drivers so that at most one driver tries to bind to the platform
> >>> device.
> >>>
> >>> With this patch as it stands, which driver ends up binding depends on
> >>> things like link order and what driver has been built a module, etc. (as
> >>> I pointed out below).
> >>>
> >>>>> Why not simply switch to the new driver (and make sure that the new
> >>>>> driver is selected if the old one was enabled in the kernel config)?
> >>>
> >>>> Its about the platform in migration i.e sm8250. Since new driver is not yet
> >>>> feature parity with old driver, choice is provided to client if it wants to use
> >>>> the new driver (default being old driver for sm8250)
> >>>
> >>> This should be described in the commit message, along with details on
> >>> what the delta is so that the reasoning can be evaluated.
> >>>
> >>> And I'm still not sure using a module parameter for this is the right
> >>> thing to do as it is generally something that should be avoided.
> >>>
> >> I understand your concern of using module params.
> >> I will modify it to rely on Kconfig to select the driver (suggested by
> >> Hans) instead of module param.
> > 
> > Please don't. This makes it impossible to perform side-by-side comparison. Also as venus and iris drivers are not completely equivalent wrt supported platforms, distributions will have to select whether to disable support for older platforms or for new platforms: Kconfig dependency will make it impossible to enable support for both kinds.
> 
> An alternative is that the module option is placed under
> 
> #if defined(CONFIG_VIDEO_QCOM_IRIS) && defined(CONFIG_VIDEO_QCOM_VENUS)
> 
> So it only activates if both drivers are compiled.

s/defined()/IS_REACHABLE()/, but otherwise you are correct.

> 
> But the fact that both drivers can work for the same hardware is something that
> must be clearly documented. Probably in a comment block before this module option.
> Possibly also in the Kconfigs for the IRIS and VENUS drivers.
> 
> Things that are unusual require explanation, so in this case I'd like to see:
> 
> 1) Why are there two drivers?
> 2) Why allow runtime-selection of which driver to use? (E.g. side-by-side comparison)
> 3) Which hardware supports only venus, only iris, or both?
> 4) What is the road forward? (I assume that venus is removed once feature parity is reached?)
> 
> Regards,
> 
> 	Hans
> 
> > 
> >> something like:
> >> config VIDEO_QCOM_IRIS
> >>        tristate "Qualcomm iris V4L2 decoder driver"
> >>       ...
> >>        depends on VIDEO_QCOM_VENUS=n || COMPILE_TEST
> >>
> >> Thanks,
> >> Dikshita
> >>>>>>  static int iris_probe(struct platform_device *pdev)
> >>>>>>  {
> >>>>>>  	struct device *dev = &pdev->dev;
> >>>>>> @@ -196,6 +224,9 @@ static int iris_probe(struct platform_device *pdev)
> >>>>>>  	u64 dma_mask;
> >>>>>>  	int ret;
> >>>>>>  
> >>>>>> +	if (!video_drv_should_bind(&pdev->dev, true))
> >>>>>> +		return -ENODEV;
> >>>>>
> >>>>> AFAICT nothing is preventing venus from binding even when 'prefer_venus'
> >>>>> is false.
> >>>>>
> >>>>>> +
> >>>>>>  	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
> >>>>>>  	if (!core)
> >>>>>>  		return -ENOMEM;
> >>>
> >>> Johan
> > 
> 

-- 
With best wishes
Dmitry

