Return-Path: <linux-arm-msm+bounces-105466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGLDFAmq9GmBDQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:26:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4D64ACAAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 15:26:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 53436301A71C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 13:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86EC439B493;
	Fri,  1 May 2026 13:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="lNu+TP1X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBE11C84AB
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777641990; cv=none; b=ctabALKB+oA1tV3SJ8RDU5F2mKkHnAbYqsA3bJ/7ippRzF4x6Lro46gPBt7W8fiYbtjObedtXhHj4iMDyN0JacEVqTAqd7rVc48BOlHdw7+wZNVmRdwQgRkHfnp/CImFQRX1YS9ene6wQMjHxsbuIdUOP055T3csiAK/TF2ON64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777641990; c=relaxed/simple;
	bh=RhWFVFqoGqEm7vDghdp2v0Y7zyKNZSYKEbeP1iU2drs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jT85qe7F+mwgavyNRBGnzBtsl2wy8FPOMMMQRkj36uMPcvINBPyQ6U4LYWoxbUmycqyj1HVqsj7RjBbhqt7gvzuwuIZScmmgTGyD57Df16O9LdV0luybRrY0SruTDvnGhYpWCNuHdRi/9HhKZzj3AVU7HOnOWW4Ufw2p2Xb7UHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=lNu+TP1X; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VbgEchOVaqBxrlCPwp/HyFKk17e+TTOwtcGIFa/C03Q=; b=lNu+TP1XEjeFSoIH6jO8vHOoB1
	uSgyYY/rki57PWa9uksEs1aFsCNr3wNPNGUPvRaTjV23v/d78ULGdDD/n8ZQdaheY7rWCBmUSM+Uj
	utDpAUpIHaNNMcNF/2dvUHrIF2k8mDS3n0mZoKa7XMcp3O77Ft8DCMwzT3w1c3rNSkX8D8A3bcP3f
	gqv1UE93RDR9Pqf1oP4nWg7b/zlY+STs3FkUqoUFojauh08KSYQAWIfw49MzUKN9SLib89mxsqUCW
	HF/giWSCf3z44fp7GkQdI2PAKlZ69ucxjx49ngnjlAEfKmbCiXzSjSXGNWdFix+4Os823TJd2hXkw
	1sCo2A0Q==;
Received: from [186.208.73.228] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wInsP-004r12-GR; Fri, 01 May 2026 15:25:53 +0200
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
Subject: [PATCH v4 1/6] drm/atomic: only add colorop state from active color pipeline
Date: Fri,  1 May 2026 10:06:47 -0300
Message-ID: <20260501132527.522320-2-mwen@igalia.com>
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
X-Rspamd-Queue-Id: EE4D64ACAAE
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
	TAGGED_FROM(0.00)[bounces-105466-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,emersion.fr,intel.com,kde.org,collabora.com,bootlin.com,linux.dev,lists.freedesktop.org,igalia.com,oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,vger.kernel.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mwen@igalia.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.902];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]

Instead of adding colorop state of all colorops of a given plane, only
get those from an active color pipeline of this plane.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_atomic.c        | 39 ++++++++++++++---------------
 drivers/gpu/drm/drm_atomic_helper.c |  9 +++----
 include/drm/drm_atomic.h            |  2 +-
 3 files changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 54bab7e9f935..825522df9c12 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -1591,26 +1591,25 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 		if (IS_ERR(plane_state))
 			return PTR_ERR(plane_state);
 
-		if (plane_state->color_pipeline) {
-			ret = drm_atomic_add_affected_colorops(state, plane);
-			if (ret)
-				return ret;
-		}
+		ret = drm_atomic_add_affected_colorops(plane_state, plane);
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_add_affected_planes);
 
 /**
- * drm_atomic_add_affected_colorops - add colorops for plane
- * @state: atomic state
+ * drm_atomic_add_affected_colorops - add active colorops for plane
+ * @state: DRM plane state
  * @plane: DRM plane
  *
  * This function walks the current configuration and adds all colorops
- * currently used by @plane to the atomic configuration @state. This is useful
- * when an atomic commit also needs to check all currently enabled colorop on
- * @plane, e.g. when changing the mode. It's also useful when re-enabling a plane
- * to avoid special code to force-enable all colorops.
+ * currently used by an active color pipeline set for a @plane to the atomic
+ * configuration @state. This is useful when an atomic commit also needs to
+ * check all currently enabled colorop on @plane, e.g. when changing the mode.
+ * It's also useful when re-enabling a plane to avoid special code to
+ * force-enable all colorops.
  *
  * Since acquiring a colorop state will always also acquire the w/w mutex of the
  * current plane for that colorop (if there is any) adding all the colorop states for
@@ -1622,23 +1621,23 @@ EXPORT_SYMBOL(drm_atomic_add_affected_planes);
  * sequence must be restarted. All other errors are fatal.
  */
 int
-drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+drm_atomic_add_affected_colorops(struct drm_plane_state *plane_state,
 				 struct drm_plane *plane)
 {
 	struct drm_colorop *colorop;
 	struct drm_colorop_state *colorop_state;
 
-	WARN_ON(!drm_atomic_get_new_plane_state(state, plane));
+	if (!plane_state || !plane_state->color_pipeline)
+		return 0;
 
 	drm_dbg_atomic(plane->dev,
-		       "Adding all current colorops for [PLANE:%d:%s] to %p\n",
-		       plane->base.id, plane->name, state);
+		       "Adding all current active colorops for [PLANE:%d:%s] to %p\n",
+		       plane->base.id, plane->name, plane_state->state);
 
-	drm_for_each_colorop(colorop, plane->dev) {
-		if (colorop->plane != plane)
-			continue;
-
-		colorop_state = drm_atomic_get_colorop_state(state, colorop);
+	for (colorop = plane_state->color_pipeline;
+	     colorop;
+	     colorop = colorop->next) {
+		colorop_state = drm_atomic_get_colorop_state(plane_state->state, colorop);
 		if (IS_ERR(colorop_state))
 			return PTR_ERR(colorop_state);
 	}
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index a768398a1884..c8dadbf5c319 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3752,12 +3752,9 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
 			goto free;
 		}
 
-		if (plane_state->color_pipeline) {
-			err = drm_atomic_add_affected_colorops(state, plane);
-			if (err)
-				goto free;
-		}
-
+		err = drm_atomic_add_affected_colorops(plane_state, plane);
+		if (err)
+			goto free;
 	}
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 8883290cd014..8916923f32b8 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -919,7 +919,7 @@ int __must_check
 drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 			       struct drm_crtc *crtc);
 int __must_check
-drm_atomic_add_affected_colorops(struct drm_atomic_state *state,
+drm_atomic_add_affected_colorops(struct drm_plane_state *state,
 				 struct drm_plane *plane);
 
 int __must_check drm_atomic_check_only(struct drm_atomic_state *state);
-- 
2.53.0


