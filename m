Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAAF2165007
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2020 21:36:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726760AbgBSUgL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Feb 2020 15:36:11 -0500
Received: from mga11.intel.com ([192.55.52.93]:34612 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726734AbgBSUgK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Feb 2020 15:36:10 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 19 Feb 2020 12:36:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,461,1574150400"; 
   d="scan'208";a="228709281"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga007.fm.intel.com with SMTP; 19 Feb 2020 12:36:07 -0800
Received: by stinkbox (sSMTP sendmail emulation); Wed, 19 Feb 2020 22:36:06 +0200
From:   Ville Syrjala <ville.syrjala@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 05/12] drm/msm/dpu: Stop copying around mode->private_flags
Date:   Wed, 19 Feb 2020 22:35:37 +0200
Message-Id: <20200219203544.31013-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
References: <20200219203544.31013-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The driver never sets mode->private_flags so copying
it back and forth is entirely pointless. Stop doing it.

Also drop private_flags from the tracepoint.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 29 +--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 10 +++----
 2 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 58d3400668f5..4511e2ba3680 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -500,23 +500,6 @@ void dpu_encoder_helper_split_config(
 	}
 }
 
-static void _dpu_encoder_adjust_mode(struct drm_connector *connector,
-		struct drm_display_mode *adj_mode)
-{
-	struct drm_display_mode *cur_mode;
-
-	if (!connector || !adj_mode)
-		return;
-
-	list_for_each_entry(cur_mode, &connector->modes, head) {
-		if (cur_mode->vdisplay == adj_mode->vdisplay &&
-		    cur_mode->hdisplay == adj_mode->hdisplay &&
-		    drm_mode_vrefresh(cur_mode) == drm_mode_vrefresh(adj_mode)) {
-			adj_mode->private_flags |= cur_mode->private_flags;
-		}
-	}
-}
-
 static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_encoder_virt *dpu_enc,
 			struct dpu_kms *dpu_kms,
@@ -580,15 +563,6 @@ static int dpu_encoder_virt_atomic_check(
 	adj_mode = &crtc_state->adjusted_mode;
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	/*
-	 * display drivers may populate private fields of the drm display mode
-	 * structure while registering possible modes of a connector with DRM.
-	 * These private fields are not populated back while DRM invokes
-	 * the mode_set callbacks. This module retrieves and populates the
-	 * private fields of the given mode.
-	 */
-	_dpu_encoder_adjust_mode(conn_state->connector, adj_mode);
-
 	/* perform atomic check on the first physical encoder (master) */
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
@@ -623,8 +597,7 @@ static int dpu_encoder_virt_atomic_check(
 		}
 	}
 
-	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags,
-			adj_mode->private_flags);
+	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index eecfe9b3199e..6714b088970f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -327,20 +327,18 @@ DEFINE_EVENT(dpu_enc_keyval_template, dpu_enc_trigger_start,
 );
 
 TRACE_EVENT(dpu_enc_atomic_check_flags,
-	TP_PROTO(uint32_t drm_id, unsigned int flags, int private_flags),
-	TP_ARGS(drm_id, flags, private_flags),
+	TP_PROTO(uint32_t drm_id, unsigned int flags),
+	TP_ARGS(drm_id, flags),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		drm_id		)
 		__field(	unsigned int,		flags		)
-		__field(	int,			private_flags	)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->flags = flags;
-		__entry->private_flags = private_flags;
 	),
-	TP_printk("id=%u, flags=%u, private_flags=%d",
-		  __entry->drm_id, __entry->flags, __entry->private_flags)
+	TP_printk("id=%u, flags=%u",
+		  __entry->drm_id, __entry->flags)
 );
 
 DECLARE_EVENT_CLASS(dpu_enc_id_enable_template,
-- 
2.24.1

