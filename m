Return-Path: <linux-arm-msm+bounces-108490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FAdO8tPDGrwegUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:55:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BD257E20A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 13:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD791300BDBC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 11:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F7C1352014;
	Tue, 19 May 2026 11:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XNSXDvzm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD9C533688F;
	Tue, 19 May 2026 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191520; cv=none; b=gVdPOHMMiPTr9HxTOIqbF6X/Pr+8zKQi6a24J9cjL284tcwaKIlFge8de3qTHo4skkP3qLtzQ3KvbGXnWbOh9l9X/kmJn1ZbBkmGta8e0dlszvSYX8Vfi+1n3t7yt/6dAk0N3zLbevqpLIP+1VuR53cKdmficSp3s8f+P3Cl+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191520; c=relaxed/simple;
	bh=jbSzG0VtOj+D5yiSmtQrt4/n6aP0jMaP1sW019EHN2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bGbmQrGBXW6XLkosbOi8sSK5yaKZ/+Ioa/dHS0H+qS0K7kNur2RKLlkLBmU/P8KUJfulg01LHZG0Z2XNbFNXxIDFHoaYox7fW6aHGoaW6LckyOE2g9G5HdZ4o7smy9cLbZE+rD7QJROoMIlMSZySdD6r06Qbq7x9vr9Y4b7B/HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XNSXDvzm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779191517;
	bh=jbSzG0VtOj+D5yiSmtQrt4/n6aP0jMaP1sW019EHN2Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XNSXDvzmZDxB4QwZBHIeI8DvfDu/jGjXBYWoi9SvzDGquBb+aLlPq7+pBUe28++LG
	 8lV2PtzjO7a9LHYpj9WiWBKfXKw4dl88CXJegMU4HdnYKYmPTfuyasXvIhsIEItXDP
	 gv6U3wbQbSjZLt9RyETQSfP7ueK+9Oxpz0T5q6ceDnRWAKcS4m6fsbA7BJcPiC48yT
	 fpMiGnJ1ezyJNh6NLlJ+RopDlqJg2y3+BioLf3F3rQdcxLhGGgC/psWo5ixYFWWG8i
	 0Beo6NhQLnVI9PhsSpEnojfbxR0qXQEYRJAArntKWZXKAEDeJvthsu9EqXsrWhnZvS
	 /oE3WmYBUfuAw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5512417E0B69;
	Tue, 19 May 2026 13:51:56 +0200 (CEST)
Date: Tue, 19 May 2026 13:51:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Akash Goel <akash.goel@arm.com>, Chia-I Wu
 <olvaffe@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry
 Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <rob.clark@oss.qualcomm.com>
Subject: Re: [PATCH v4] drm/gem: Make the GEM LRU lock part of drm_device
Message-ID: <20260519135153.42c3f4a0@fedora>
In-Reply-To: <a1920a93-ac61-4246-a57c-b10bada3d70c@sirena.org.uk>
References: <20260518-panthor-shrinker-fixes-v4-1-1920234470d5@collabora.com>
	<20260518165225.145175b1@fedora>
	<a1920a93-ac61-4246-a57c-b10bada3d70c@sirena.org.uk>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108490-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[arm.com,collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 56BD257E20A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 19 May 2026 12:37:16 +0100
Mark Brown <broonie@kernel.org> wrote:

> On Mon, May 18, 2026 at 04:52:25PM +0200, Boris Brezillon wrote:
> > +Mark for the silent conflict resolution needed to reconcile
> > drm-misc-fixes and drm-next/drm-misc-next.  
> 
> This doesn't appear to be a drm-misc thing, I was seeing issues on the
> DRM tree.  The patch does seem to ahve resolved things though.  Please
> consider topic branches!

I'm just following the dim guide for resolution of conflicts between
drm trees[1], so that's probably something to discuss with the
DRM/DRM-misc maintainers. As for the suggestion to use topic branches,
I've never heard of it being used for -fixes vs -next conflict
resolution, every time I've gone through this process it was for
xxx-next vs yyy-next conflict (xxx and yyy being different subsystem
trees).

Maxime, Thomas, Maarteen, Sima and/or Dave, any suggestion/opinion?

[1]https://drm.pages.freedesktop.org/maintainer-tools/committer/conflict-resolution.html

