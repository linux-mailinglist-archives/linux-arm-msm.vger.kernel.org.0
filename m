Return-Path: <linux-arm-msm+bounces-106108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFi/IGkx+2lxXQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106108-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:17:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8896B4DA141
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:17:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2372D3027FC3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 12:16:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F0A44CAFA;
	Wed,  6 May 2026 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HwIiRzUq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165C84418DB;
	Wed,  6 May 2026 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069802; cv=none; b=iyrCIqZ9znOPk6BqavZt9Nx/Dg6LgGCF1G3ukvRK5TxDAvn/fyXWaTKAlVrd1PwvqdIo0/ItS2diFZLU8qRXT/tWg9GYBxMG6HI57P3tBoGDg4To9Cwce54TaQLe9jU4tO4CoRYeMYJHLoK52V9H+5ZizSyC11qkV24WSPQ1TTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069802; c=relaxed/simple;
	bh=u1rbbnIoyFZA7O2vs7QHol/yHibz7ircmGOOnRxEjGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bY+7txzvb0AfiaQhBb6/fwa7D7YJlU3NssdMoeD7qZ0R8GlRwNYIsKeXBlNqAK81qpjULr0ZcOeDuNP1NBzxaK3li2Arf4tKGOUcJGbggJncPgpaieVv0XKg2kny8gGUTmk1fgpU+sWTwJ0mWHT1AqIvI0yEn4pvEGmBB21+dtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HwIiRzUq; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778069799;
	bh=u1rbbnIoyFZA7O2vs7QHol/yHibz7ircmGOOnRxEjGA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HwIiRzUqisePGYSP+oQv8nut2BrQ2Y8Yz8rFZyvpXSXIu7PXyeQTv249ZYry8t5FR
	 fFHvXPH6osctGucWoC4Py5gh+56RV9cb2cKqXg+xZxMlxkr1BU1nMaLmEF0dY/9bom
	 8U6gtSxzpKQD4MJedEhlwrdzVZ9xguxercMdIKl5K/scxHlpTCCqd7FaDDtQBgib3s
	 vrDk7euO9rvVmNaF3F94HWrpkFy9aQLBdySDTuFadoQ9f5BoQkUx07lfZBLQNclaNM
	 bKNNVU/J5Dug5BJUUW8lL+kKmty/lAwn86wPo/uyg5ZwUoFWMMniXkivncb7UWOAzh
	 uQPcjpPDJ4r0w==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 94F7917E1537;
	Wed,  6 May 2026 14:16:38 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 06 May 2026 14:16:27 +0200
Subject: [PATCH 2/3] drm/gem: Fix a race between drm_gem_lru_scan() and
 drm_gem_object_release()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-panthor-shrinker-fixes-v1-2-e7721526de96@collabora.com>
References: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
In-Reply-To: <20260506-panthor-shrinker-fixes-v1-0-e7721526de96@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778069796; l=2777;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=u1rbbnIoyFZA7O2vs7QHol/yHibz7ircmGOOnRxEjGA=;
 b=0Vn0g7A6fEq54VBM8lGGCLNX9mHH+iAkL1OkGKe/jCH9w71OWroJV8R46OeF5EN1tdfdBhZwI
 cmjDTvLf01KDnH2rNOTeUgKqGCKEDTXPmK0yMv53DqAjtz8gkdpAlyR
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 8896B4DA141
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106108-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gitlab.freedesktop.org:url]

The following race can currently happen:

| Thread 0 in `drm_gem_lru_scan`               | Thread 1 in `drm_gem_object_release` |
| -                                            | -                                    |
| move obj1 with refcount==0 to `still_in_lru` |                                      |
| move obj2 with refcount!=0 to `still_in_lru` |                                      |
| mutex_unlock                                 |                                      |
| shrink obj2                                  |                                      |
|                                              | lru = obj1->lru; // `still_in_lru`   |
| mutex_lock                                   |                                      |
| move obj1 back to the original lru           |                                      |
| mutex_unlock                                 |                                      |
| return                                       |                                      |
|                                              | dereference `still_in_lru`           |

Move the drm_gem_lru_move_tail_locked() after the
kref_get_unless_zero() check so that we don't end up with a
vanishing LRU when we hit drm_gem_object_release(). We also need to
remove the skipped object from its LRU, otherwise we'll keep hitting
it on subsequent loop iterations until it's actually removed from the
list in the drm_gem_release().

Fixes: e7c2af13f811 ("drm/gem: Add LRU/shrinker helper")
Reported-by: Chia-I Wu <olvaffe@gmail.com>
Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/drm_gem.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index fca42949eb2b..97cf63de0112 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1660,15 +1660,19 @@ drm_gem_lru_scan(struct drm_gem_lru *lru,
 		if (!obj)
 			break;
 
-		drm_gem_lru_move_tail_locked(&still_in_lru, obj);
-
 		/*
 		 * If it's in the process of being freed, gem_object->free()
-		 * may be blocked on lock waiting to remove it.  So just
-		 * skip it.
+		 * may be blocked on lock waiting to remove it.  So just remove
+		 * it from its current LRU and skip it.
 		 */
-		if (!kref_get_unless_zero(&obj->refcount))
+		if (!kref_get_unless_zero(&obj->refcount)) {
+			if (obj->lru)
+				drm_gem_lru_remove_locked(obj);
+
 			continue;
+		}
+
+		drm_gem_lru_move_tail_locked(&still_in_lru, obj);
 
 		/*
 		 * Now that we own a reference, we can drop the lock for the

-- 
2.54.0


