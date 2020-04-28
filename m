Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 478DE1BC65A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2020 19:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgD1RUH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Apr 2020 13:20:07 -0400
Received: from mga04.intel.com ([192.55.52.120]:37714 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726406AbgD1RUH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Apr 2020 13:20:07 -0400
IronPort-SDR: 1ZCKXx751ZuCAm+d6oBB4G3Vegs+5IhwVpwPT9z5IgBCYmXf3PcCHno/IGqB83UlThqIwANiSW
 ERMEzusPFKfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2020 10:20:05 -0700
IronPort-SDR: Ka1XB5hXBW1DcB/aEa69JvL9ri1NN27x/pH27p4XJutnQZ9+7VJ6jPimUmYuooZ+V1v7f8n6uV
 +zmziYzOrqPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,328,1583222400"; 
   d="scan'208";a="292922406"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga002.fm.intel.com with SMTP; 28 Apr 2020 10:20:01 -0700
Received: by stinkbox (sSMTP sendmail emulation); Tue, 28 Apr 2020 20:20:00 +0300
From:   Ville Syrjala <ville.syrjala@linux.intel.com>
To:     dri-devel@lists.freedesktop.org
Cc:     intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Emil Velikov <emil.velikov@collabora.com>
Subject: [PATCH v3 04/16] drm/msm/dpu: Stop copying around mode->private_flags
Date:   Tue, 28 Apr 2020 20:19:28 +0300
Message-Id: <20200428171940.19552-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
References: <20200428171940.19552-1-ville.syrjala@linux.intel.com>
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
Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 29 +--------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 10 +++----
 2 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a1b79ee2bd9d..d22ecabebb08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -498,23 +498,6 @@ void dpu_encoder_helper_split_config(
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
 	global_state = dpu_kms_get_existing_global_state(dpu_kms);
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
@@ -621,8 +595,7 @@ static int dpu_encoder_virt_atomic_check(
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

