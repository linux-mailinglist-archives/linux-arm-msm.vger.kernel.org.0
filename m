Return-Path: <linux-arm-msm+bounces-106185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKqlBCmW+2ladAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 21:27:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCBF4DFBD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 21:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5EDFF301BA7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 19:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E018C3191BB;
	Wed,  6 May 2026 19:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="H8/W6XLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FE23161AB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 19:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778095653; cv=none; b=pk7Ith/Qv5MJh7P9qg+543op8fC51ejX+y2wXoEG2PkDVFNl03UBF0FkhvgTitIjqHQm2GptE++iWRI5mN48Eb6myNf3synFpTZwqb9CjcnCLv+8Pjrhj74u+wyCt+EHjArYuMCYFEMq1qZdQHvHKcPF/UyALhfg3JJStSzfmHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778095653; c=relaxed/simple;
	bh=Od11Wyg0WC2H6HoBoIhB7Uvsn6Q2IEa2Ht1gTdusneQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qasaa2VTUwTVwikVzVftExEtPChGAutmLe2bcKoe7VxFPHX6sG9RIrCZpOGa6bUZzV23sr6zeqO4VM7oiFpdg652cbgXeifKMx5gG+RlCEVS+4VZ986htb+D6g9/u2LjsQN3f7PYsbh3y6ioSS6Q4KTX1V+nshRaZ5NJxQ7Blzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=H8/W6XLa; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=ODId+Puv+ksLM5ZeP1J/HwczMH5qfWb0nljTGmHwaLI=; b=H8/W6XLa41JzkcGaEfRluJFnjb
	OIkSAtQy7cmTFwEbiLtuTmgvnto79gBBmF2Pb9kX6tkwtvNUdVgKccWC5DPV9yHpvpHpQEamDHavI
	r5b3e3PeoAMq+Abi4dPLYTePnpF4eSj4WWdL3BquLavdIk9pxIEXO5ylNr6kZQ+GELxIuh/QN9PkX
	YYFqn/evZSZmHnq0lfFKiq4k5AfRSnlx7/uvYPQM8qeH2mUxmwktEK5eH6LDfUxDHJigDugQKTd1L
	/3QQfT6xB3MOOjAEB1epeFcO/U5yf4906pxgbYNaS+caKcq8GS428qbCOCrRguQeoJwWV+lpLk6sx
	yhZnqexA==;
Received: from [186.208.73.228] (helo=killbill.home)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wKhtg-0072dZ-Ho; Wed, 06 May 2026 21:27:04 +0200
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
Subject: [PATCH v5 2/6] drm/atomic: don't set colorop properties of inactive color pipelines
Date: Wed,  6 May 2026 16:23:48 -0300
Message-ID: <20260506192633.16066-3-mwen@igalia.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260506192633.16066-1-mwen@igalia.com>
References: <20260506192633.16066-1-mwen@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 7BCBF4DFBD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,amd.com,linux.intel.com,kernel.org,ffwll.ch,igalia.com,suse.de];
	TAGGED_FROM(0.00)[bounces-106185-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.847];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]

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


