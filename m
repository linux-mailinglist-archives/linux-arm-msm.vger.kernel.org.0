Return-Path: <linux-arm-msm+bounces-46530-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB05A2221D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 17:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5000B1637D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 16:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2218C1DF27C;
	Wed, 29 Jan 2025 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NTCbbMp3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4615F1DF744
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169412; cv=none; b=aBaWHTd0Zw7Y9F/POlrh+qXr39ankpqjleSg9WOXceeHvWuaAAUQ8yQydGdNaBnwWyQH5Vss/lUJ2zTwHWy0W78DSwFzWcNOSgR6AuFcQWgu2EqGZv1TYo9GzMb2f8/Cwi25OxuwqkuOFx/vPnddHNbMElavjC8SMspbRNnA2o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169412; c=relaxed/simple;
	bh=5zMqJQ+B3JOxkTxtuCF9/SQ9wStmbkFTRum2Fh0EcKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LiM7mke+Jbv9nYXI2ZJzvP5Mtw6fbDQKypsmzU/0xsm1xmCIwySjM/BN4f2/5Dq31eErz9uRA2PD4/Nb56G/ZShnmgurxRm9ETYYpdmTRk/NkkhCbz3cxnK6Y+Qy4di6raeyuQz3J9J6eAeyhxOOtHV8mX0xn8rEyMlnsb8nSPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NTCbbMp3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738169408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kIR36ENGU60LuFgFJsbN3iw30GtNfjYTyr8Iv66sXWE=;
	b=NTCbbMp3oOepJBa/PmEZMoNicv1mllJnD4mIwjTOPMNLpaLgupuWIAOJqVF4Tvxiw6tSqA
	vIYh0CQoIppCvGHupACiSbROL+YVd9D2slMRGaogn5SWoFkp2orlueuLOD4RAXaEhaCBZq
	6TKABdbZpBH67wqzi5RIQz67ukoaESg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-GoZR6m7QPuuOZLZE_qtD_Q-1; Wed, 29 Jan 2025 11:50:07 -0500
X-MC-Unique: GoZR6m7QPuuOZLZE_qtD_Q-1
X-Mimecast-MFC-AGG-ID: GoZR6m7QPuuOZLZE_qtD_Q
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-385fdff9db5so2499515f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 08:50:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738169406; x=1738774206;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kIR36ENGU60LuFgFJsbN3iw30GtNfjYTyr8Iv66sXWE=;
        b=aTyXQO16X4XvTnaCadYdosMyjXDRsbHc0NBGliBxOYUzCQhZykcgu9RgrFidiLK4oU
         RQpLAHl8XbcEoO49nD0tm90AOlOGFT1VkFYAq0vo3PDcKKF4XYVYcihGwRYFrFo7A2SX
         uiWBS53YaAUmQXQqj+CpA0dN01xqNBVbj47IpZOV3ikMb/fR9nXgaN/X20rEnuP0K5WE
         Vser28wtw+4tvvwjuxg5/qYuR3udNHIu5DCqeYeeTcmvnUt/liUZ71KJTb3/WHsQ6xck
         /xI7JS2wWAyh4nSMFK/3OXoe6gKuOgB89aaV0bG9zSGF25Mq84liPQ0sKcjz+qLA/Nk0
         IuWA==
X-Forwarded-Encrypted: i=1; AJvYcCW3/EzN3cBulbsSXLa+BjJWevej5bqcsZnwsiPjty3fE+ODzcXtBjxHIv/Zp6LLmt3r8ZZPqZOcsNK3HylD@vger.kernel.org
X-Gm-Message-State: AOJu0YwsqfBjHddYBICuz9U01x5gudEsSFaJfyueRKNYv06PpPRSKXft
	VWxKdHr0I42+4gQXnXEM75HL4YSYZIEK2PZVPw7/zd3xLPEfjK1Unxaa94bE0G4wBS4qFGAONXG
	XfF/injdkOCqwwvqzyd0G8L8w4Yj3uGTCO6C+6CdrK7e6Lg3rSPpjiix2EoZX06A=
X-Gm-Gg: ASbGncsdNlYv5d5ofZcZnksG4sHwdGXSlRRry+UIyPE/LsjTtSez6uq6tGdm86CewK0
	I2dDiw3iofVcBC0fup0Y+BtXwSMXh08zaOVL2Ktyh3fb07FqSMhNbQB9jPF0zp4EYRC7Qd/W0PP
	lGlZ2xOFdxXawW6hMFDG9Wr2TsGYLFVzmdKRc3WpqZGasYXSUV2kFUQ6zaZVk1V42/l40lW/zka
	dCgrlaPeTSyX4ZhZ4gFKn79X6CQTWnORQ8a6slcDeHj+YU5QQy4qJQOhqC1X4c+jmTixg==
X-Received: by 2002:a5d:4385:0:b0:38a:888c:6786 with SMTP id ffacd0b85a97d-38c520babf7mr2389818f8f.52.1738169406360;
        Wed, 29 Jan 2025 08:50:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzyZbfNeHEEqdBP/FPbqU2nUqTbUVUE0bCsa9+XfxoWf8z7EMd5vNIfqC9EBVK6faAB4GzCg==
X-Received: by 2002:a5d:4385:0:b0:38a:888c:6786 with SMTP id ffacd0b85a97d-38c520babf7mr2389769f8f.52.1738169405919;
        Wed, 29 Jan 2025 08:50:05 -0800 (PST)
Received: from pollux ([2a00:79c0:60c:5a00:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188673sm17194930f8f.46.2025.01.29.08.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:50:05 -0800 (PST)
Date: Wed, 29 Jan 2025 17:50:02 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: phasta@kernel.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
	lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z5pcOt3oiwnp4lbJ@pollux>
References: <20250128142927.103290-2-phasta@kernel.org>
 <Z5jwD0DxNrMdo-q8@pollux>
 <1a22f1bb0145996cb1159cf3cb8156aec3d5c640.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a22f1bb0145996cb1159cf3cb8156aec3d5c640.camel@mailbox.org>

On Wed, Jan 29, 2025 at 04:18:30PM +0100, Philipp Stanner wrote:
> On Tue, 2025-01-28 at 15:56 +0100, Danilo Krummrich wrote:
> > On Tue, Jan 28, 2025 at 03:29:27PM +0100, Philipp Stanner wrote:
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > index 4412f2711fb5..b5aac8eebfdd 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > > @@ -404,7 +404,15 @@ nouveau_sched_init(struct nouveau_sched
> > > *sched, struct nouveau_drm *drm,
> > >  {
> > >  	struct drm_gpu_scheduler *drm_sched = &sched->base;
> > >  	struct drm_sched_entity *entity = &sched->entity;
> > > -	const long timeout =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > > +	const struct drm_sched_init_args args = {
> > > +		.ops = &nouveau_sched_ops,
> > > +		.submit_wq = wq,
> > > +		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
> > > +		.credit_limit = credit_limit,
> > > +		.timeout =
> > > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
> > > +		.name = "nouveau_sched",
> > > +		.dev = drm->dev->dev
> > > +	};
> > >  	int ret;
> > >  
> > >  	if (!wq) {
> > > @@ -416,10 +424,7 @@ nouveau_sched_init(struct nouveau_sched
> > > *sched, struct nouveau_drm *drm,
> > >  		sched->wq = wq;
> 
> Do you want it set here 
> 
> args.submit_wq = wq;
> 
> or below, outside the if-block? Should be the same AFAICS

Yeah, shouldn't make a difference. Personally, I'd prefer to set it once after
the if-block.

> 
> 
> > 
> > This change breaks Nouveau, you need to set args.submit_wq here as
> > well.
> 
> I overlooked the allocation below.
> 
> 
> P.
> 
> > 
> > >  	}
> > >  
> > > -	ret = drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> > > -			     NOUVEAU_SCHED_PRIORITY_COUNT,
> > > -			     credit_limit, 0, timeout,
> > > -			     NULL, NULL, "nouveau_sched", drm-
> > > >dev->dev);
> > > +	ret = drm_sched_init(drm_sched, &args);
> > >  	if (ret)
> > >  		goto fail_wq;
> > >  


