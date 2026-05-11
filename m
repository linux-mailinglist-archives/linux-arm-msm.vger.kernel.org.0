Return-Path: <linux-arm-msm+bounces-106972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGAnC/YKAmqknQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:59:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D97512DAE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 18:59:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 245503090754
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 16:27:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3EBD426ECF;
	Mon, 11 May 2026 16:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XugNropA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80352407562
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 16:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778516853; cv=none; b=rUB8rV1oKSwYaC/F2gjO0RdbIGd1E8M5OEy0KFfNOECPPXLlYz8lUuK/dQvyRD3Al23DS0ApHiyS5ZfrzmdUb0tTF+0grsrB4ktdj0TelxoetQgSouJ/+ikf6rh2vhsJaYwq4B81vDAqGjzIh3VGLTIphTh9OfXDhhiC9XbPNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778516853; c=relaxed/simple;
	bh=YonN8VL2BLEr4Q2OyxUKcgv3XivnvGDz2zoMI7+3kf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N+5q04OkhmpClflWPKaIj3PsblnCdisfXuZIvl6loka8YOjUdyVQE59Z0nxSPSWM1x+8VeHbjDa5w6MdqTGjDnq8K2uXKyhbnZaMSviGomUGONu17+6Fk8YuIK0nPJ76ma8HKvC2zuqcRv/OspjVDnaccL5D4jzvZkQ64PuSmSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=XugNropA; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85A5516F2
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:27:26 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 83D003F85F
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778516851; bh=YonN8VL2BLEr4Q2OyxUKcgv3XivnvGDz2zoMI7+3kf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XugNropA7jzUFum6bLhlgSbM3I22IBjetzpO/DArm5cw5XNIpay3/ws/QMLxRB1JH
	 9X7H1EP/ormLrjfpDSWQB85VfW0fDi/5wLr5FTKJh8ZR+YrJQDj8iTmsnqgItVmytT
	 Tfz6GClcatTTqSMBt+gtMpsO4EXmxU4HZBPvJpZ0=
Date: Mon, 11 May 2026 17:27:13 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rob Clark <rob.clark@oss.qualcomm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/gem: Make the GEM LRU lock part of drm_device
Message-ID: <agIDYZlOpZB5eZke@e142607>
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
 <20260508-panthor-shrinker-fixes-v2-4-39cdb7d577c9@collabora.com>
 <CACSVV00NdUKe6-05U3g0q5X3tw4zmqO_s2gk-KZxQVykpydvAA@mail.gmail.com>
 <20260511174429.35afcdee@fedora>
 <CACSVV02HQ-ci8mHg4os7e-yaf51hdHyQ6cFa9tGOpc9=keL28Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACSVV02HQ-ci8mHg4os7e-yaf51hdHyQ6cFa9tGOpc9=keL28Q@mail.gmail.com>
X-Rspamd-Queue-Id: B4D97512DAE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106972-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,arm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	DKIM_TRACE(0.00)[arm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[liviu.dudau@arm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,collabora.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,arm.com:dkim]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 09:16:49AM -0700, Rob Clark wrote:
> On Mon, May 11, 2026 at 8:44 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Mon, 11 May 2026 06:18:44 -0700
> > Rob Clark <rob.clark@oss.qualcomm.com> wrote:
> >
> > > On Fri, May 8, 2026 at 3:41 AM Boris Brezillon
> > > <boris.brezillon@collabora.com> wrote:
> > > >
> > > > Recently, a few races have been discovered in the GEM LRU logic, all
> > > > of them caused by the fact the LRU lock is accessed through
> > > > gem->lru->lock, and that lock itself also protects changes to
> > > > gem->lru, leading to situations where gem->lru needs to first be
> > > > accessed without the lock held, to then get the lru to access the lock
> > > > through and finally take the lock and do the expected operation.
> > > >
> > > > Currently, the two drivers making use of this API declare device-wide
> > > > locks, and there's no clue that we will ever have a driver that wants
> > > > different pools of LRUs protected by different locks under the same
> > > > drm_device. So we're better off moving this lock to drm_device and
> > > > always locking it through obj->dev->gem_lru_mutex, or directly through
> > > > dev->gem_lru_mutex.
> > > >
> > > > If anyone ever needs more fine-grained locking, this can be revisited
> > > > to pass some drm_gem_lru_pool object represent the pool of LRUs under
> > > > a specific lock, but for now, the per-device lock seems to be enough.
> > > >
> > > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > >
> > > Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>
> >
> > If every one is happy with patch 4, I'm tempted to drop patch 1 and 3,
> > since they are irrelevant if the locking is fixed the way it is in this
> > patch. Question is, do we care about patch 2 being backported to stable
> > kernels then?
> 
> Or backport patch 4?  It's a bit bigger, but mostly mechanical.. with
> only issue being backporting across addition of panthor shrinker, I
> guess?

I'm agreeing with Rob here, but it makes a mess of the backport. Maybe split
patch 4 into the drm_gem.c and msm changes and make another one for panthor,
as that is still in linux-next?

Best regards,
Liviu

> 
> BR,
> -R

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

