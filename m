Return-Path: <linux-arm-msm+bounces-101660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK95OQnKz2lH0QYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101660-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:09:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A57394FA4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 16:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B7FFC31168B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 14:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9C9388389;
	Fri,  3 Apr 2026 14:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="XdWFd/yD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528BC3AB29D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 14:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224819; cv=none; b=VECfQhheWE2Kk8gABF3cHFQOWcuv4hDwjLzEPoZNYgIT/IDtUI5yaiZDv6zwEy02iU+uaqNqSxLJhxfZ1BU3Q3JWusfDhYG087BKekko5/bt4zQeq09tpGP0Mh5Uz0C5lTnWIJywwBKAVurSsWwT2NpS0Q6rYLfTHLGkBVGqhiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224819; c=relaxed/simple;
	bh=Od11Wyg0WC2H6HoBoIhB7Uvsn6Q2IEa2Ht1gTdusneQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sW0tUb8MHLeQLyevte5j97+W/syYaiwzecnfSo9t4pU+mvInLuO6d1oY2urgEMfPTtw6pjsDPmvJsxMfVhosAKruTE4tlTaho2GLH5qBjDJ6lKe08nrXeg8RPT4Cvp7uSM5xbcv/hka59b97O1Qx/3VmWQS/rFaa3ymHY4gh7mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=XdWFd/yD; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ODId+Puv+ksLM5ZeP1J/HwczMH5qfWb0nljTGmHwaLI=; b=XdWFd/yDH8cU9Pc2byD4w/uQgM
	iGsieMtniiulbTDzCwlgQ/tGJz7c4+jh3C2EODwGDFTajMTL8I5EMjeXeH993xux0JKyMeUmWCYUQ
	lE0iYY6pUVk/1Il6nKvJRW0VoY4TP8nKgwNwgaH1yRNYveO4Weraucsrgn3G/5CLQm60V90Uar94L
	LRn4a3pXp1vPyNC90Z0kX0p+Y0w/v1pbw8EI8lusJ6vGrVdXS1OIeAMAmu95yWfh0nPdHnorPjdu+
	MmpcZkCHqOs0tN5SYxC3P36jaE01HsCh6KbvUB2259DkC/5O7v7DH2rTeEuZC7S/BHT4PlLpgWxMn
	U2lucc6Q==;
Received: from [189.89.58.26] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1w8f3i-00AtJL-TE; Fri, 03 Apr 2026 15:59:39 +0200
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
	Xaver Hugl <xaver.hugl@kde.org>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
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
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/6] drm/atomic: don't set colorop properties of inactive color pipelines
Date: Fri,  3 Apr 2026 10:58:26 -0300
Message-ID: <20260403135909.214378-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260403135909.214378-1-mwen@igalia.com>
References: <20260403135909.214378-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.14 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101660-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 76A57394FA4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


