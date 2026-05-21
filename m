Return-Path: <linux-arm-msm+bounces-108982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qF9HECXMDmovCQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:11:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2965A1F87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:11:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A992D30623ED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 09:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC52371072;
	Thu, 21 May 2026 09:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="J5vUKeP4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A52E36CDF2
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 09:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354459; cv=none; b=huYXSo5OhvnKUnrlpcaYtLCpZ7lg2ZNI+vjj/KrCVpr8jESsIebttmcg1A4FLL3uLEHZPtkgc36hN56D7bfP6WeVTveGFaAjXRsKUHZd+jXKcp74OO2KY3Emt+jO4DDr3l+5RC/YlHGHfb0YArBCQpc7J+jfnjVdcbncR1YeneA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354459; c=relaxed/simple;
	bh=jd9af6vclJSjfFDvUK/7zA3hzswpcoD89VKA8WUB/2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lKd6/ewpQL1EPdZc5EgO6Dd+GlXkh9lr3XmaBqZQjG1QDFcvL9gdzJAisL5Fms+GrFXFoWhwG7J26mDVnmM4knPrjIka2g/WZFZdw5fAhTkjl7qH0ymJE/mlykJ9H/s3LpAIS3FosNQlBdJdNDK6u4vPPkgP6KBCySrbyVOafQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=J5vUKeP4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso47431705e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1779354456; x=1779959256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EWcZf8xQyNgHL46GgzNOnTpRTb6xpQnkpgYkPgYwfTU=;
        b=J5vUKeP4ijXrLCMUnfemHYGp1cLhX+jWtV+2/C4FODe80/cw3bd918uR/CoWNrpolu
         EKeHPYI1VFxWn/kZHFgCeSkYy8q7OXNa5a3ttHM0R11g+vcuagygLmftoO+wgWPTi+E/
         FGfBjWiuaO265jBHNNsZr14/2UbXoFpV0lCV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354456; x=1779959256;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWcZf8xQyNgHL46GgzNOnTpRTb6xpQnkpgYkPgYwfTU=;
        b=miUCeo4aHBr21mWViycOZMMzGVlEMqmK1hIMrY81yzr9SHRiNnWfyKCDNJgsSenL/9
         f+cX2Jk64w1+STwTvwxt9v3qG0ItgX4eg8gWrkRdroRsxdDCiLIv1gMFCdja5JdZOEJ2
         Wr1w9TVGALgUVRHSg0BoN9i03CdvldH0dv/NPDtTmVPDN43255RMrBZTSqCfmeuRBvNZ
         JtQrA3U9dtwDN0lOBiQX2Jx7lxn124e4IyFHxqJGmb19+e5dk349ybSu3/3M75zsutvS
         suxfVTioWyMCpUaPPxW4e3zTonY3jeZRj73hhSV/mSyGAIagiteI/oWc2GVfBjRVVRQo
         yiJA==
X-Forwarded-Encrypted: i=1; AFNElJ+yI/rtdex2YtOp+mIo73j/aPZeoXJGIaI6ERQCmZ+ne2VKkxgXjszSCnqIk5TSJKafseJ6ee4j9YROukuF@vger.kernel.org
X-Gm-Message-State: AOJu0YzBO3SQcvKMgYCDNb+RpLTuvvINQx1EHW+eXYCTnDy3bA7LeNfs
	PRDXf8t5RVTwW7/LDCXZczMIPnwTnW/HEJbZvidjkuo5MQxbHWbM3oXp7i7yNUFHXY8=
X-Gm-Gg: Acq92OFKOuavPlW0OWRSP1Pw2/Lo0jGNamT1R9HGKrMm2GLoLaV+rR7lrmYb2/wPjit
	6L6XIUGAvNG471TDBFXSgVo8FdwhOfnvIrtDT5RqaESKRqzKNdLEpyg82du1khqnhFIS+z0lwDh
	Ql5DImNV/ybDVFiXlWbaHGQ8u7EYgZpP5vStntgy++Cgv2HLjw/8RLfyllmvx/47H2bRX8kR03y
	c5DHLN02ee+G8InGkkTOEUjfj0zJyv4wDc4hD7qfRzNMvWr/Teo/4gGMHFy7M3RKF2XvdqvhHxI
	920GvAsr+5v4Z9HN9uzmAZVwTwznezOEhuFpaEW8KGdmNICU/3e+V6PFLx+ZljZOXzCB2FTqACc
	ca/NBJrTmM3//46E/AAJdjvWMIrdjistY/ALeyY0KuW21UVPnblo5M/7tHhrgtjcbZ7fEmMjpGz
	LOETlw8Ackep/aZLczq/nrWtDsHSsSULF3z+ug9ECcNNqVOQ==
X-Received: by 2002:a05:600c:3b9d:b0:490:3b8b:6ba2 with SMTP id 5b1f17b1804b1-4903b8b6e29mr19074285e9.8.1779354455523;
        Thu, 21 May 2026 02:07:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d9daasm1532388f8f.11.2026.05.21.02.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:07:34 -0700 (PDT)
Date: Thu, 21 May 2026 11:07:32 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH v4] drm/gem: Make the GEM LRU lock part of drm_device
Message-ID: <ag7LVI2mia92Oa8L@phenom.ffwll.local>
Mail-Followup-To: Boris Brezillon <boris.brezillon@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Rob Clark <rob.clark@oss.qualcomm.com>
References: <20260518-panthor-shrinker-fixes-v4-1-1920234470d5@collabora.com>
 <20260518165225.145175b1@fedora>
 <a1920a93-ac61-4246-a57c-b10bada3d70c@sirena.org.uk>
 <20260519135153.42c3f4a0@fedora>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519135153.42c3f4a0@fedora>
X-Operating-System: Linux phenom 6.19.10+deb14-amd64 
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[ffwll.ch:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,collabora.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	TAGGED_FROM(0.00)[bounces-108982-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[ffwll.ch];
	DKIM_TRACE(0.00)[ffwll.ch:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[23];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simona.vetter@ffwll.ch,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: CE2965A1F87
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 19, 2026 at 01:51:53PM +0200, Boris Brezillon wrote:
> On Tue, 19 May 2026 12:37:16 +0100
> Mark Brown <broonie@kernel.org> wrote:
> 
> > On Mon, May 18, 2026 at 04:52:25PM +0200, Boris Brezillon wrote:
> > > +Mark for the silent conflict resolution needed to reconcile
> > > drm-misc-fixes and drm-next/drm-misc-next.  
> > 
> > This doesn't appear to be a drm-misc thing, I was seeing issues on the
> > DRM tree.  The patch does seem to ahve resolved things though.  Please
> > consider topic branches!
> 
> I'm just following the dim guide for resolution of conflicts between
> drm trees[1], so that's probably something to discuss with the
> DRM/DRM-misc maintainers. As for the suggestion to use topic branches,
> I've never heard of it being used for -fixes vs -next conflict
> resolution, every time I've gone through this process it was for
> xxx-next vs yyy-next conflict (xxx and yyy being different subsystem
> trees).
> 
> Maxime, Thomas, Maarteen, Sima and/or Dave, any suggestion/opinion?

Yeah, in general we do substantially fewer topic branches than other
subsystems. That's fallout from the committer model, which just want a
branch to push their patches and be done with it all - they're not full
maintainers, we don't magically have more of those. And sometimes that
results in more of a mess than necessary.

We try to keep the mess in check by doing backmerges as needed, ideally
before applying a patch. It's not super well documented since when/how to
backmerge is part of the section for maintainers:

https://drm.pages.freedesktop.org/maintainer-tools/maintainer/maintainer-drm-misc.html

The assumption is that committers will ask maintainers for help if they're
trying to push a patch that results in tons of conflicts when applying
(since development should happen on top of linux-next or drm-tip). Could
probably improve that a bit. But also, often it's only clear after
applying that a fixup is needed, and then it's pushed already. And with
committers there's no undoing pushed patches. So it's just part of the
deal with having lots of committers imo that history is a bit more a mess
at times.

Cheers, Sima

> [1]https://drm.pages.freedesktop.org/maintainer-tools/committer/conflict-resolution.html

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

