Return-Path: <linux-arm-msm+bounces-105464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6EquIwiq9GmBDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105464-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:26:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B1E4ACA97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:26:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A90D3009FB8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 13:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F120B382389;
	Fri,  1 May 2026 13:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="DS35C5Dd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E9E23C512
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777641989; cv=none; b=U+M63fC+Pm6i1BRI5/hrjfNuUSKw4HszoZisO3yYBRTN1B4vNBeBtCbkjJFNCLNkkb8UQbbI79m/CHyJXiiQq868rZE/+uqJlD+WMavFtS/cUjL2QgsOP2alE8F3EuVK1LuJZDvLZGnL2L7medoWLr5pTtowZW49+awQdOJzMgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777641989; c=relaxed/simple;
	bh=Od11Wyg0WC2H6HoBoIhB7Uvsn6Q2IEa2Ht1gTdusneQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oENk2ZYViCHFQJCkH26+/67PDcxFqhMW4Gh6GpA1g+sjX6qqHe27Xp9Gho01vIcyD60xZBKLqAG8Nj3V74bWkQonS2pyG4rxxirCGNfhzxciLQuCueUtNVJ+P0k5oQSJ1st67+15gT+ZwOPJa1FvWmKyTgIApN6tlUuk8iADL+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=DS35C5Dd; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ODId+Puv+ksLM5ZeP1J/HwczMH5qfWb0nljTGmHwaLI=; b=DS35C5DdmHZW65D0bcSw7ydoi3
	xDXhEdCgrkTBO52DTR5S5pU4o/JgvosHN4JwszsVA/L3p0fQGxIQXTtzltr836KAgxoLT9oMsXp95
	rHLjsHwuoARpFklVNuH2ismwHg8SvB90SqPak8BH9d3uEzGg4iJHX+UFIvu0ly6N8FhFuSX4HU0e0
	uBaoZuB9IxcLMwrVqPvyJ6BR7gTVyxPl5d2982+X6y36m0vKkKfDw/9tWXz48UhKlMiLDeHockRkD
	1iodfsyVkuHi/TTdI+5V8w1r5ReoYrh8qLkCMNlyyJmhdBkLioiOhseBCLgQlTUvWiPHnbDBy0FL0
	j1KAUp9Q==;
Received: from [186.208.73.228] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wInsW-004r12-PA; Fri, 01 May 2026 15:26:00 +0200
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com,
	tzimmermann@suse.de
Cc: Alex Hung <alex.hung@amd.com>,
	Simon Ser <contact@emersion.fr>,
	Uma Shankar <uma.shankar@intel.com>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>,
	amd-gfx@lists.freedesktop.org,
	kernel-dev@igalia.com,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/6] drm/atomic: don't set colorop properties of inactive color pipelines
Date: Fri,  1 May 2026 10:06:48 -0300
Message-ID: <20260501132527.522320-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501132527.522320-1-mwen@igalia.com>
References: <20260501132527.522320-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E3B1E4ACA97
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	TAGGED_FROM(0.00)[bounces-105464-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	NEURAL_HAM(-0.00)[-0.918];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email]

Reject attempts to change property values of a colorop that is not
part of an active plane color pipeline.

Suggested-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 34 ++++++++++++++++++++++++++-----
 1 file changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 5bd5bf6661df..bff8d58f8f12 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -1275,15 +1275,38 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		break;
 	}
 	case DRM_MODE_OBJECT_COLOROP: {
-		struct drm_colorop *colorop = obj_to_colorop(obj);
-		struct drm_colorop_state *colorop_state;
+		struct drm_colorop *active_colorop, *colorop = obj_to_colorop(obj);
+		struct drm_colorop_state *colorop_state = NULL;
+		struct drm_plane_state *plane_state;
 
-		colorop_state = drm_atomic_get_colorop_state(state, colorop);
-		if (IS_ERR(colorop_state)) {
-			ret = PTR_ERR(colorop_state);
+		plane_state = drm_atomic_get_plane_state(state, colorop->plane);
+		if (IS_ERR(plane_state)) {
+			ret = PTR_ERR(plane_state);
 			break;
 		}
 
+		/* Check if the colorop obj is part of an active color pipeline */
+		for (active_colorop = plane_state->color_pipeline;
+		     active_colorop;
+		     active_colorop = active_colorop->next) {
+			if (active_colorop == colorop) {
+				colorop_state = drm_atomic_get_colorop_state(state, colorop);
+				if (IS_ERR(colorop_state)) {
+					ret = PTR_ERR(colorop_state);
+					goto err;
+				}
+				break;
+			}
+		}
+
+		if (!colorop_state) {
+			drm_dbg_atomic(prop->dev,
+				       "[COLOROP:%d:%d] not part of the active pipeline\n",
+					obj->id, colorop->type);
+			ret = -EINVAL;
+			goto err;
+		}
+
 		ret = drm_atomic_colorop_set_property(colorop, colorop_state,
 						      file_priv, prop, prop_value);
 		break;
@@ -1294,6 +1317,7 @@ int drm_atomic_set_property(struct drm_atomic_state *state,
 		break;
 	}
 
+err:
 	drm_property_change_valid_put(prop, ref);
 	return ret;
 }
-- 
2.53.0


