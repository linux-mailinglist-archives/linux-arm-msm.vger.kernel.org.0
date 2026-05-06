Return-Path: <linux-arm-msm+bounces-106106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDLIIGMy+2nfXgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:21:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD334DA217
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:21:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C5DE3096491
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 12:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D32E3426D36;
	Wed,  6 May 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VWrzPbJ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497DA14B977;
	Wed,  6 May 2026 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069800; cv=none; b=WX/UTiZMf+MDr/7SWSAC5Tx0HjnoSyaq7YWUdgzjIkFJwpuIlQ5oVTGxMPOLTuCleZDaoa0szLILPA4LKwA07TfotvblKSjIb5qeZ2kGhF++wf2WIirwXxv/RW1FN5s+PyZFhMh6cTs5d5eYJDxvOoWQGtyRzTSd/LSHguQKDk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069800; c=relaxed/simple;
	bh=s2rz6WBCQQLTAnI5a+CDvnoj5qWr+M9TUVuy622jV7E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZBSyvaaVElpy/Gd+nlBxn2+oWBzY5mJmSHQZ9nTkaYz+8PqMcE6AkyxrQnSoxMfV9hg3OlZzOD7GQokmofdigv+OJFMZzzBfLDg24hq//iMhfojICCchFQoK4PD3qay8a2iTQYYMTIDelFiqfUplmP1cobQ3b6qB1gCz/v31zfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VWrzPbJ6; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778069797;
	bh=s2rz6WBCQQLTAnI5a+CDvnoj5qWr+M9TUVuy622jV7E=;
	h=From:Subject:Date:To:Cc:From;
	b=VWrzPbJ6FcOZqnKVy9C3qqbzO/UWw1WydKijlVKnVjyqm9u1MBDBJ2Nkd0q+oKHCH
	 yYwveoHyNmwYAwEMc8t+XI3eQesPyBSOb0SvwmJiFyUEvZBYmpm0BedDIy42Im/wCz
	 +ohF0utsPg7ChM/qk6vrX8vGf61OwIgD/lemsBYylEpAYcJQc2/7321ZvR11c0cwlq
	 dVvAE6HpgXxHrv4uCOdYOpqfk/FGElwyctgXzaWqwDb20C/AkgHTv2VdQ4MTGZ38BW
	 1sgJDgtxT/W8gVvB+C8B128MVbV2hZCU/nskg4w+f2pfwWCSi9eocFQqYzfc49/2OS
	 NmSPzDvMKic0g==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91D3017E1502;
	Wed,  6 May 2026 14:16:36 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 0/3] drm/panthor: Fix a race in the shrinker logic
Date: Wed, 06 May 2026 14:16:25 +0200
Message-Id: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3LQQqAIBBA0avErBvQSImuEi3CxhwCjZmIILp70
 vLx+Q8oCZPC2DwgdLFyyRW2bSCkJW+EvFZDZzpvnPF4LPlMRVCTcN5JMPJNim4INvYuxNBbqPM
 h9If6TvP7fp9wy89oAAAA
X-Change-ID: 20260506-panthor-shrinker-fixes-58c1f45cfc41
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Akash Goel <akash.goel@arm.com>, Chia-I Wu <olvaffe@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778069796; l=1376;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=s2rz6WBCQQLTAnI5a+CDvnoj5qWr+M9TUVuy622jV7E=;
 b=THEVnc4x1Mq4RI7yePdlKafi+stM406BVAhLHlcFjn6UsvLD2Eypts6czFRA3bjzlawp9M/xm
 EuezyTmr5S/CiWGj5okBy6X1+9FnjKHz0kQAvjitxXZfCY8pUBv9Rgh
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: DBD334DA217
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106106-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

As reported by Chia-I [1], a race exists between drm_gem_lru_remove()
and drm_gem_lru_scan(), causing a UAF on a stack-allocated object.

This first patch fixes the problem at the panthor level by making
sure we never use drm_gem_lru_remove(). The second one fixes an
undetected race between drm_gem_lru_scan() and
drm_gem_object_release(), and the last one kills drm_gem_lru_remove()
so no one else relying on the drm_gem_lru infra gets bitten by this
race again.

Adding the MSM maintainers to the loop, since it's the only other
driver relying on drm_gem_lru.

[1]https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86

---
Boris Brezillon (3):
      drm/panthor: Don't use the racy drm_gem_lru_remove() helper
      drm/gem: Fix a race between drm_gem_lru_scan() and drm_gem_object_release()
      drm/gem: Stop exposing the racy/unsafe drm_gem_lru_remove() helper

 drivers/gpu/drm/drm_gem.c                | 63 ++++++++++++++------------------
 drivers/gpu/drm/panthor/panthor_device.h | 10 +++++
 drivers/gpu/drm/panthor/panthor_gem.c    |  5 ++-
 include/drm/drm_gem.h                    |  1 -
 4 files changed, 41 insertions(+), 38 deletions(-)
---
base-commit: 57f68ed1f08cd10f51a9091645fd5dfcc369a885
change-id: 20260506-panthor-shrinker-fixes-58c1f45cfc41

Best regards,
-- 
Boris Brezillon <boris.brezillon@collabora.com>


