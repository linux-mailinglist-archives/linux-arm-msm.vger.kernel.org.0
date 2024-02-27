Return-Path: <linux-arm-msm+bounces-12677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A2D868F0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 12:39:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 05F5AB2746F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Feb 2024 11:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB5C813A279;
	Tue, 27 Feb 2024 11:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QBOHVnZ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eX7MLuBN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="QBOHVnZ+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="eX7MLuBN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E873B13A865
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Feb 2024 11:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709033943; cv=none; b=P/tHCsIbmUBsH8KYe9eJsp9QvCZ/OWnxQQNdZLHTqnA3h2efp2EBeN1zC1y1oPYcYY6In32ZI373QJvB19ZTa//c8qTeZBxIL8tmHUsbrMydOIuQhxm1A7txhKVpLX1c5ie6XysFtLZvxp8I71BoGk3NUqk/A8HRpHf3qIX4c2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709033943; c=relaxed/simple;
	bh=1SAolYNcfzl+UUTg7+mSHG9saaVLsAY7Ec2teywoU+8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMSCCeizCAI/VPPSm/SQMC/roNI1r+6ARp8Bx6wuSiMo8psUxhC0HPZmCX3NlxEFTSNF/31WQm/2p9JvAYvXpKJrrqpfND/S3pGmsG6vV2vk0nBSn23Mw/ACmpOaUcBuxjU/BdM1WZgA/gIfkVAFFtQlSd8izM+trVYgw1IZ+Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QBOHVnZ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eX7MLuBN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=QBOHVnZ+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=eX7MLuBN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3DA8422750;
	Tue, 27 Feb 2024 11:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIO+e4DHsZFwA0wzqd0HvRaOvqTe0C0mDqZ0CKb/J3o=;
	b=QBOHVnZ+RrkbKXomSZ1lThUHL8gXbAZIV1Zw2ythYqPwn31W09M8rthmroUTmJgvnv7uG7
	Qm61bxrpBiKZF/Ds1QnkXC4c1ukk5Nkt0QLpixNltU2nC4KDDPcIxRkuFocJydlUeEdwlI
	VDrxbuZFTDcnSgCZs0N5LFqdYIXiHcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIO+e4DHsZFwA0wzqd0HvRaOvqTe0C0mDqZ0CKb/J3o=;
	b=eX7MLuBNXl8uZLjiXl4e1GunYe5EBaQvU01lL/icN21GiwZH0x5Ec4u9CBi/GUgax+6Jxy
	lvQ1FOjSIM7SIQCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709033940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIO+e4DHsZFwA0wzqd0HvRaOvqTe0C0mDqZ0CKb/J3o=;
	b=QBOHVnZ+RrkbKXomSZ1lThUHL8gXbAZIV1Zw2ythYqPwn31W09M8rthmroUTmJgvnv7uG7
	Qm61bxrpBiKZF/Ds1QnkXC4c1ukk5Nkt0QLpixNltU2nC4KDDPcIxRkuFocJydlUeEdwlI
	VDrxbuZFTDcnSgCZs0N5LFqdYIXiHcM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709033940;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GIO+e4DHsZFwA0wzqd0HvRaOvqTe0C0mDqZ0CKb/J3o=;
	b=eX7MLuBNXl8uZLjiXl4e1GunYe5EBaQvU01lL/icN21GiwZH0x5Ec4u9CBi/GUgax+6Jxy
	lvQ1FOjSIM7SIQCA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 71C7F13216;
	Tue, 27 Feb 2024 11:38:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id cCJxGtPJ3WVMUQAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Tue, 27 Feb 2024 11:38:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	christian.koenig@amd.com,
	sumit.semwal@linaro.org,
	dmitry.osipenko@collabora.com,
	robdclark@gmail.com,
	quic_abhinavk@quicinc.com,
	dmitry.baryshkov@linaro.org,
	sean@poorly.run,
	marijn.suijten@somainline.org,
	suijingfeng@loongson.cn,
	kherbst@redhat.com,
	lyude@redhat.com,
	dakr@redhat.com,
	airlied@redhat.com,
	kraxel@redhat.com,
	alexander.deucher@amd.com,
	Xinhui.Pan@amd.com,
	zack.rusin@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/13] drm/nouveau: Provide nouveau_bo_{pin,unpin}_locked()
Date: Tue, 27 Feb 2024 11:14:52 +0100
Message-ID: <20240227113853.8464-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240227113853.8464-1-tzimmermann@suse.de>
References: <20240227113853.8464-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: ***
X-Spam-Score: 3.70
X-Spamd-Result: default: False [3.70 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 R_MISSING_CHARSET(2.50)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 NEURAL_HAM_LONG(-1.00)[-1.000];
	 R_RATELIMIT(0.00)[to_ip_from(RLqs7qcp4g99ribr8z1n9xsc8a)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 NEURAL_HAM_SHORT(-0.20)[-0.997];
	 RCPT_COUNT_TWELVE(0.00)[30];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,amd.com,linaro.org,collabora.com,quicinc.com,poorly.run,somainline.org,loongson.cn,redhat.com,broadcom.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.00)[24.18%]
X-Spam-Flag: NO

Implement pinning without locking in nouveau_bo_pin_locked(). Keep
nouveau_bo_pin() for acquiring the buffer object's reservation lock.
The new helper will be useful for implementing the GEM pin callback
with correct semantics. Same for unpin.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 43 +++++++++++++++++++---------
 drivers/gpu/drm/nouveau/nouveau_bo.h |  2 ++
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 56dcd25db1ce2..4a7c002a325a4 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -467,17 +467,14 @@ nouveau_bo_placement_set(struct nouveau_bo *nvbo, uint32_t domain,
 	set_placement_range(nvbo, domain);
 }
 
-int
-nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
+int nouveau_bo_pin_locked(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_buffer_object *bo = &nvbo->bo;
 	bool force = false, evict = false;
-	int ret;
+	int ret = 0;
 
-	ret = ttm_bo_reserve(bo, false, false, NULL);
-	if (ret)
-		return ret;
+	dma_resv_assert_held(bo->base.resv);
 
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA &&
 	    domain == NOUVEAU_GEM_DOMAIN_VRAM && contig) {
@@ -540,20 +537,15 @@ nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
 out:
 	if (force && ret)
 		nvbo->contig = false;
-	ttm_bo_unreserve(bo);
 	return ret;
 }
 
-int
-nouveau_bo_unpin(struct nouveau_bo *nvbo)
+void nouveau_bo_unpin_locked(struct nouveau_bo *nvbo)
 {
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct ttm_buffer_object *bo = &nvbo->bo;
-	int ret;
 
-	ret = ttm_bo_reserve(bo, false, false, NULL);
-	if (ret)
-		return ret;
+	dma_resv_assert_held(bo->base.resv);
 
 	ttm_bo_unpin(&nvbo->bo);
 	if (!nvbo->bo.pin_count) {
@@ -568,8 +560,33 @@ nouveau_bo_unpin(struct nouveau_bo *nvbo)
 			break;
 		}
 	}
+}
+
+int nouveau_bo_pin(struct nouveau_bo *nvbo, uint32_t domain, bool contig)
+{
+	struct ttm_buffer_object *bo = &nvbo->bo;
+	int ret;
 
+	ret = ttm_bo_reserve(bo, false, false, NULL);
+	if (ret)
+		return ret;
+	ret = nouveau_bo_pin_locked(nvbo, domain, contig);
+	ttm_bo_unreserve(bo);
+
+	return ret;
+}
+
+int nouveau_bo_unpin(struct nouveau_bo *nvbo)
+{
+	struct ttm_buffer_object *bo = &nvbo->bo;
+	int ret;
+
+	ret = ttm_bo_reserve(bo, false, false, NULL);
+	if (ret)
+		return ret;
+	nouveau_bo_unpin_locked(nvbo);
 	ttm_bo_unreserve(bo);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index e9dfab6a81560..4e891752c2551 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -85,6 +85,8 @@ int  nouveau_bo_new(struct nouveau_cli *, u64 size, int align, u32 domain,
 		    u32 tile_mode, u32 tile_flags, struct sg_table *sg,
 		    struct dma_resv *robj,
 		    struct nouveau_bo **);
+int  nouveau_bo_pin_locked(struct nouveau_bo *nvbo, uint32_t domain, bool contig);
+void nouveau_bo_unpin_locked(struct nouveau_bo *nvbo);
 int  nouveau_bo_pin(struct nouveau_bo *, u32 flags, bool contig);
 int  nouveau_bo_unpin(struct nouveau_bo *);
 int  nouveau_bo_map(struct nouveau_bo *);
-- 
2.43.2


