Return-Path: <linux-arm-msm+bounces-106107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJlAB48x+2nfXgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:18:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 806D14DA167
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 14:18:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 117AD3076A11
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 12:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C6DB449EB8;
	Wed,  6 May 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JRYNrhtX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA33E3DB9;
	Wed,  6 May 2026 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778069801; cv=none; b=OHMDchg01uHXh3QErFkodLiMDcQPqw2s8A1boB3e3ifsapAvGuaEtG9JtzUW/WyHFuEMytuerTX0eGMvKaNcvR3pPIvA3yeaSSPKKbK6SSiGq16sWEXfbdSpdkqoZCpDZYZ7zSsTtStMnx2nnr0KW9CKSIzKfkJ2d23RUlZkLFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778069801; c=relaxed/simple;
	bh=bhfUdxskTM5eHiDMoxut02UxySr7YulKIsinhbB2loU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TgKtt60W1zMkzTc6xzqPqMn9IGwlPNw0LMGniAjWvCVw5bCIAGry98OKsvjvj7Uj/EHbKRAWWbW9OfPZO7w8jSf61ryRDJaPju3iH8ZDtjuokH7ELkGkpdJW43OVKZUcKQ06kgs40VIp+w1cPFX1NG7hYKcD2XYlenPQSt5cIVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JRYNrhtX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778069798;
	bh=bhfUdxskTM5eHiDMoxut02UxySr7YulKIsinhbB2loU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=JRYNrhtXdh4SwlO/Xo8DsGy0cQBsJ7IeNhNbRySUIf+QTa5++UQyExPC4jBNuzav1
	 CUeZs6ENbRXUngd+Qj/7vFPjMGXIAXs13LwwHDWw4tlSMPZayWttzixd1h8CkN095e
	 C+80RLVsMcZDhLL8acx+G5iBLDf9lMF29yv8DV4Z1NR9SUKdRzcwBYOXSDPUXLzLJi
	 hGYz6L+Bg1bCKN9gUzrAxyPZJ+NH6XscC23rja2tmosTxxJXXKaMwl5xbRAYS08a94
	 66ZPSbwg5uXNGVFE/0KnJn0mEyH9m99h76/XIdH2C8d6buDJms1uaSq2F5VUPhwnZW
	 KWvxTI8S3Halw==
Received: from [100.64.0.11] (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9813C17E1525;
	Wed,  6 May 2026 14:16:37 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 06 May 2026 14:16:26 +0200
Subject: [PATCH 1/3] drm/panthor: Don't use the racy drm_gem_lru_remove()
 helper
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-panthor-shrinker-fixes-v1-1-e7721526de96@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778069796; l=3557;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=bhfUdxskTM5eHiDMoxut02UxySr7YulKIsinhbB2loU=;
 b=O2/ZfA/x6LWTnFgb5+Ig3AX2o7bvW0n2h3REdsGABoRpd2SI/bK9XAjjbLg4lttbiP15FDzpD
 pRq2QwZDfTHCPTIVIbSWruFOpf5ncbHlZimE/LRtWgc6Gs4dTSN/wRI
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=
X-Rspamd-Queue-Id: 806D14DA167
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-106107-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,arm.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,collabora.com:email,collabora.com:dkim,collabora.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

drm_gem_lru_remove() dereference stores drm_gem_object::lru in a local
variable that's then dereferenced to acquire the LRU lock. Because this
assignment in done without the LRU lock held, it can race with
drm_gem_lru_scan() where drm_gem_object::lru is temporarily assigned
a stack-allcated LRU that goes away when leaving the function. By
the time we dereference this local lru variable, the object might already
be gone.

It feels like drm_gem_lru_move_tail() was never meant to be used this
way, because there's no easy way we can avoid this race unless we defer
the locking to the caller. Let's add an explicit LRU for unreclaimable
BOs instead, and have all BOs added to this LRU at creation time.

Fixes: fb42964e2a76 ("drm/panthor: Add a GEM shrinker")
Reported-by: Chia-I Wu <olvaffe@gmail.com>
Closes: https://gitlab.freedesktop.org/panfrost/linux/-/work_items/86
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_device.h | 10 ++++++++++
 drivers/gpu/drm/panthor/panthor_gem.c    |  5 ++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index 4e4607bca7cc..45b71546f83c 100644
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
+		 * All BOs start in that list at creation time.
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


