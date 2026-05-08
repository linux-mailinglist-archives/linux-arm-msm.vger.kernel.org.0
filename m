Return-Path: <linux-arm-msm+bounces-106642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UE0vMxK+/WkFigAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:42:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F44F52ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 12:42:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3375730598E5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 10:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1DA3D3CF0;
	Fri,  8 May 2026 10:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LS4wB9Ow"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C888F3D3324;
	Fri,  8 May 2026 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778236876; cv=none; b=Fd71SCjeu+YfIqcP2OlHS2339KU7qbpElw5JpTNogvfp65rDKHPkCO3gC/BXIih39DYF2JzC32X+8OdcHRWluPz5TGGYlfdTifceKV0Fzx4hHN2Sn0keSSj+eQjzO/6g+PHaRzDF9qcnnc5HqnjJUAsnqqv23LaSXpIzz7Bdxvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778236876; c=relaxed/simple;
	bh=CCjbAOv+AUfwV71P61bambB9KPgJkBGpAkVfSqu3IzE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hm/D6kd8WPjidNrsUMmU9dvmYbog86v9re2UntAhDphpqxF3bA+Iu/H5PMSjmKB0+uCDJcBrFAlvMNKJxmvZ+kIDVaXjYfzWd6WJjyXaitfEpV8mCvRfOb2gJ16g4DVtI99d/ZtOXS0I+4w6qo8JWZDmL8fzHuKszya0cm/ByeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LS4wB9Ow; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778236873;
	bh=CCjbAOv+AUfwV71P61bambB9KPgJkBGpAkVfSqu3IzE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LS4wB9OwTbq8MAUejBMyJj3E3GtQ9Qa9GzIbZZAv3gl5VxR5tJ5/k2BeAF+VWaLFY
	 7skauOxzS+4Vfo8bYcwjriU9GTtP/DDH0OXJ8zQ/9NOjTpkQ9B0d+YxDVGkMAqXycC
	 5nPiIKp1zWIA9XG5tulH8huQZDVTSppp2wq36r1yAcIhrO4j6DmNKWrA6/UbVC+yqz
	 BISTiKWXkiZcsMBmxLEA7BEf3ImfH/qcNDXQ5HFO0MeWgrKXqI2N8sMme9c9X0VlIY
	 /JbXlVnI7eGXAxuC7zPSatJR5Ho0ZFpE45pUewJt1h5aj+vIYMcKuyIBQmG1pY7xRP
	 X6s1DmrUqW3JA==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A3B717E138B;
	Fri,  8 May 2026 12:41:12 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Fri, 08 May 2026 12:40:47 +0200
Subject: [PATCH v2 1/4] drm/panthor: Don't use the racy
 drm_gem_lru_remove() helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-panthor-shrinker-fixes-v2-1-39cdb7d577c9@collabora.com>
References: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
In-Reply-To: <20260508-panthor-shrinker-fixes-v2-0-39cdb7d577c9@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778236871; l=3640;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=CCjbAOv+AUfwV71P61bambB9KPgJkBGpAkVfSqu3IzE=;
 b=S+kY1FBPu22WvLC7UmxPfpUmHF0PXd4jJKCwO+GBDLneBrvYhv2/fwn+tybBr1jVPdusToIko
 rYY2lkNnIDrDklIlf8CddnL8TyJks/V1TNctT6p+avkhkliKvorufOQ
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 658F44F52ED
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106642-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[boris.brezillon@collabora.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,collabora.com:email,collabora.com:mid,collabora.com:dkim,arm.com:email,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

drm_gem_lru_remove() stores drm_gem_object::lru in a local variable
that's then dereferenced to acquire the LRU lock. Because this
assignment is done without the LRU lock held, it can race with
drm_gem_lru_scan() where drm_gem_object::lru is temporarily assigned
a stack-allcated LRU that goes away when leaving the function. By
the time we dereference this local lru variable, the object might
already be gone.

It feels like drm_gem_lru_remove() was never meant to be used this
way, because there's no easy way we can avoid this race unless we defer
the locking to the caller. Let's add an explicit LRU for unreclaimable
BOs instead, and have all BOs added to this LRU at creation time.

Fixes: fb42964e2a76 ("drm/panthor: Add a GEM shrinker")
Reported-by: Chia-I Wu <olvaffe@gmail.com>
Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 10 ++++++++++
 drivers/gpu/drm/panthor/panthor_gem.c    |  5 ++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4e4607bca7cc..dcdce75b683b 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -190,6 +190,16 @@ struct panthor_device {
 		/** @reclaim.lock: Lock protecting all LRUs */
 		struct mutex lock;
 
+		/**
+		 * @reclaim.unreclaimable: unreclaimable BOs
+		 *
+		 * Either the BO is unreclaimable because it has no pages allocated,
+		 * or it's unreclaimable because pages are pinned.
+		 *
+		 * All BOs start in this list at creation time.
+		 */
+		struct drm_gem_lru unreclaimable;
+
 		/**
 		 * @reclaim.unused: BOs with unused pages
 		 *
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 13295d7a593d..8e31740126e7 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -204,7 +204,7 @@ void panthor_gem_update_reclaim_state_locked(struct panthor_gem_object *bo,
 		drm_gem_lru_move_tail(&ptdev->reclaim.gpu_mapped_shared, &bo->base);
 		break;
 	case PANTHOR_GEM_UNRECLAIMABLE:
-		drm_gem_lru_remove(&bo->base);
+		drm_gem_lru_move_tail(&ptdev->reclaim.unreclaimable, &bo->base);
 		break;
 	default:
 		drm_WARN(&ptdev->base, true, "invalid GEM reclaim state (%d)\n", new_state);
@@ -994,6 +994,7 @@ static struct panthor_gem_object *
 panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
 		   struct panthor_vm *exclusive_vm, u32 usage_flags)
 {
+	struct panthor_device *ptdev = container_of(dev, struct panthor_device, base);
 	struct panthor_gem_object *bo;
 	int ret;
 
@@ -1026,6 +1027,7 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
 	}
 
 	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
+	drm_gem_lru_move_tail(&ptdev->reclaim.unreclaimable, &bo->base);
 	return bo;
 
 err_put:
@@ -1551,6 +1553,7 @@ int panthor_gem_shrinker_init(struct panthor_device *ptdev)
 		return ret;
 
 	INIT_LIST_HEAD(&ptdev->reclaim.vms);
+	drm_gem_lru_init(&ptdev->reclaim.unreclaimable, &ptdev->reclaim.lock);
 	drm_gem_lru_init(&ptdev->reclaim.unused, &ptdev->reclaim.lock);
 	drm_gem_lru_init(&ptdev->reclaim.mmapped, &ptdev->reclaim.lock);
 	drm_gem_lru_init(&ptdev->reclaim.gpu_mapped_shared, &ptdev->reclaim.lock);

-- 
2.54.0


