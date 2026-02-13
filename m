Return-Path: <linux-arm-msm+bounces-92803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFixI3c7j2nHNAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:55:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F31CE13753D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:55:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2CDB730248D4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:55:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88749361DB0;
	Fri, 13 Feb 2026 14:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o0Khi7qH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9A83559C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994521; cv=none; b=p2iDwykepCFKx5+up7aEUD36uC56CKKXcS506ElVYix6IaeR+hSxtPVB0MbUi3u7JR3rSj9fJczt0lkdlLzWEtQz4TJQbBcurQIt2c97qYGO10bZMoqtLoWIn7WEr9qaWBV8WDxdofw645uZTSAATRRIW4xrELOe1PDN6EH6VZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994521; c=relaxed/simple;
	bh=70PbSNDu9x4Wj/tEPz62OV1hX90As7ZyNvi4Eury5NM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nqDWAgp2VPOhPBL/n0EkrZSAep9bM+LnIXZBuWW3CWSoTmT7Fc7NIRxMfFYQiOyNKEAz7H7GsnE/StxRrmvEjf44UbEJRWPAQWJuDypsFcRl5pYkagrPSCZbCJM5l1pCdXRB0uxB0N0NEYJdHAg1hQvRsbI8JN4tIw1DXqP7zy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o0Khi7qH; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c626bd75628so376086a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:55:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770994518; x=1771599318; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hpDizy5onqELapjXINQoOaormzlF0uuJ9Y7c/63rKWs=;
        b=o0Khi7qHxkQ7V6nTYNKJnKdZ9OPP3UDdyMOCwlAXsB/rmFdLKwdeP3U5QVC79+Vm8u
         hYwwMkC3UgunHJSuIG5DzsL8lQXF8XFpZWCMzSLas5zd6TdOapsGEeEPVkSkhFP5QCYt
         Hs5FbZF/awTB7H10ZXNLNUT/shCEeHi+3s9dkkaR+NgOuFcMgwVieMcZlp9GyFr4AQoJ
         gAHaMOYngDTVUtTedvWMBWtiDPLVpICl0WTYcYQTJ41ZsJvd0zA3CYCqNdoCF7M3RCU9
         muIPKorxj/1Kk7JwTmdKGqQ0i6JKjXghAUGlc5afmrfuF00cohr/nR6YVFiGfDyS9GFs
         oj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770994518; x=1771599318;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hpDizy5onqELapjXINQoOaormzlF0uuJ9Y7c/63rKWs=;
        b=kQhEI+KurOFcPxTKG6aq2HhbjqnO9M7gcDvZweIlfIlb6vBukDklKpMhui2Ax7+U1X
         toqGr5+pBuQFubauXoNbxoaLOKyQwZfAIhPXwX8oFYC/9ttR7Bbn4vgNEx3QN+48+RT7
         WA9cMyfjbVUhWyjVc+9aVe2xc3yGunhctoLXLA9mzefrYke3rMyLGZwhmvHuRsfmr024
         vXw5qqfA/71BVsSALi59BEgicJIGxtM8LUWvP1Tl7FNHx/w/i8LVjxLuH7oUMviQET27
         QKRvct18S3yKAyZNJ/ccNJUjJfN4MMHHM0vDSldpEAzfpA2oe4hsCnkf/R6xQo9DKofl
         PFVg==
X-Gm-Message-State: AOJu0YxzYeF3erSzPoCv6UzD/8KqL8js4vfmGFpXKPSmsttGbPTrumS/
	wJXQYXJv/DHHMdTuDSb4JOJWns8MZUE1GiSszi+IfvINAvKWeKXafvTyGy/v7C3kyAs=
X-Gm-Gg: AZuq6aJItASCIZTPnidzu0ooAFVeEeFGZV0y+KA195a2ZvYZprQTiTjecDkicmhbyZw
	9UyfPx8z5Wp96wgAt71YExoUqKFRFk++Y8oDH4ojYpRgi1T2Z8QNpequoHlM8xFjbvLmsaTKfjf
	xdM+sVVio7Eh4+rvgPW1XKE1Kz4DXEZLGY91D8JZPXHAewMPOvpXICMbZwANq+5/hqRA0Bc3rh3
	+iOExdwHGFOdvOO0+TJLemb0kgS8wK/tZdF+rHvN+T3x8h9fNwe+sO0dCGPIvlcjqNBwG+0Q5K9
	ENxq0eNEPT3Pes1TBCP1AduA+kKZcJzzwMVdG7PuK9hkpFOARJ4LHgJ2QsguhqV17L9S1d9gBAE
	GjMYb+0W8RGlSbOCqx8XJEGMAdxtShamVjCCFZxu0TU6gWmEdBoDUO08FRknGacDSNGaQv/e9At
	iWZABKyQ3zq028JSzdQT1Bw0Xqgam+EAwTh10/kH41pyck5lvnrh4jZDF/
X-Received: by 2002:a17:90b:3e48:b0:354:c51e:f011 with SMTP id 98e67ed59e1d1-356aad7039bmr1988856a91.19.1770994517881;
        Fri, 13 Feb 2026 06:55:17 -0800 (PST)
Received: from [127.0.1.1] (210-61-187-172.hinet-ip.hinet.net. [210.61.187.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567eba9b2esm8814759a91.9.2026.02.13.06.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:55:17 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 13 Feb 2026 22:54:28 +0800
Subject: [PATCH v18 4/4] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-msm-next-quad-pipe-split-v18-4-5815158d3635@linaro.org>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770994473; l=9265;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=70PbSNDu9x4Wj/tEPz62OV1hX90As7ZyNvi4Eury5NM=;
 b=4zyh7DkjPUbbGpw8FZEfqQe29yptwSjlWuLyOFUYMgTpfMz0Gu121XNASW+eRkw6Z9lfDhYep
 W0VSnJQv0Z1BoO8NrjyZ8HJWVK1MB9hGIbDf6INg5GPrG2ReI0/3MHw
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92803-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[104.64.211.4:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,209.85.215.173:received,210.61.187.172:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,quicinc.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,qualcomm.com:email]
X-Rspamd-Queue-Id: F31CE13753D
X-Rspamd-Action: no action

To support high-resolution cases that exceed the width constrain
or scenarios that surpass the maximum MDP clock rate, additional
pipes are necessary to enable parallel data processing within
the width constraints and MDP clock rate.

Expand pipe array size to 4. Request 4 mixers and 4 DSCs for
high-resolution cases where dual interfaces are enabled for virtual
plane case. More use cases can be incorporated later if quad-pipe
capabilities are required.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/675418/
Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 48 ++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 +++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 47 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0bbe6c38b771a..92a182d69edd0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -200,7 +200,7 @@ static int dpu_crtc_get_lm_crc(struct drm_crtc *crtc,
 		struct dpu_crtc_state *crtc_state)
 {
 	struct dpu_crtc_mixer *m;
-	u32 crcs[CRTC_DUAL_MIXERS];
+	u32 crcs[CRTC_QUAD_MIXERS];
 
 	int rc = 0;
 	int i;
@@ -1377,6 +1377,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	struct msm_drm_private *priv = crtc->dev->dev_private;
+	struct dpu_kms *kms = to_dpu_kms(priv->kms);
+	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
@@ -1389,31 +1392,44 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 *
 	 * Dual display
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces and stream merge
+			  to support high resolution interfaces if virtual
+			  plane is enabled)
+	 * If DSC is enabled, use 2:2:2 for 2 LMs case, and 4:4:2 for 4 LMs
+	 * case.
 	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
+	 * If DSC is enabled, use 2 LMs for 2:2:1 topology for single display
+	 * to support legacy devices that use this topology.
 	 *
 	 * Add dspps to the reservation requirements if ctm or gamma_lut are requested
-	 *
-	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
-	 * enabled. This is because in cases where CWB is enabled, num_intf will
-	 * count both the WB and real-time phys encoders.
-	 *
-	 * For non-DSC CWB usecases, have the num_lm be decided by the
-	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	if (topology.num_intf == 2 && !topology.cwb_enabled)
-		topology.num_lm = 2;
-	else if (topology.num_dsc == 2)
-		topology.num_lm = 2;
-	else if (dpu_kms->catalog->caps->has_3d_merge)
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+	num_rt_intf = topology.num_intf;
+	if (topology.cwb_enabled)
+		num_rt_intf--;
+
+	if ((mode->hdisplay > (MAX_HDISPLAY_SPLIT * num_rt_intf)) ||
+	    ((u64)mode->hdisplay * mode->vtotal * drm_mode_vrefresh(mode) >
+	     kms->perf.max_core_clk_rate))
+		topology.num_lm = num_rt_intf * 2;
 	else
-		topology.num_lm = 1;
+		topology.num_lm = num_rt_intf;
+
+	if (!dpu_use_virtual_planes)
+		topology.num_lm = min(2, topology.num_lm);
+
+	if (!dpu_kms->catalog->caps->has_3d_merge)
+		topology.num_lm = min(num_rt_intf, topology.num_lm);
+
+	if (topology.num_dsc) {
+		if (num_rt_intf == 1)
+			topology.num_lm = 2;
+		topology.num_dsc = topology.num_lm;
+	}
 
 	if (crtc_state->ctm || crtc_state->gamma_lut)
 		topology.num_dspp = topology.num_lm;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 6eaba5696e8e6..455073c7025b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -210,7 +210,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
+	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -218,10 +218,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
 
 	enum dpu_crtc_crc_source crc_source;
 	int crc_frame_skip_count;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index eba1d52211f68..058a7c8727f7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -55,7 +55,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 #define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
@@ -661,7 +661,6 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
 	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
 	struct msm_display_info *disp_info = &dpu_enc->disp_info;
-	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_framebuffer *fb;
@@ -675,22 +674,12 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	/* We only support 2 DSC mode (with 2 LM and 1 INTF) */
-	if (dsc) {
-		/*
-		 * Use 2 DSC encoders, 2 layer mixers and 1 or 2 interfaces
-		 * when Display Stream Compression (DSC) is enabled,
-		 * and when enough DSC blocks are available.
-		 * This is power-optimal and can drive up to (including) 4k
-		 * screens.
-		 */
-		WARN(topology->num_intf > 2,
-		     "DSC topology cannot support more than 2 interfaces\n");
-		if (topology->num_intf >= 2 || dpu_kms->catalog->dsc_count >= 2)
-			topology->num_dsc = 2;
-		else
-			topology->num_dsc = 1;
-	}
+	/*
+	 * Set DSC number as 1 to mark the enabled status, will be adjusted
+	 * in dpu_crtc_get_topology()
+	 */
+	if (dsc)
+		topology->num_dsc = 1;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
 	if (!connector)
@@ -2180,8 +2169,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 {
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[2];
-	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	/* reset all mixers for this encoder */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 61b22d9494546..09395d7910ac8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -302,7 +302,7 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    (dpu_cstate->num_mixers != 1) &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 70d5ed4732f2e..b93442f75c2eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -24,7 +24,7 @@
 #define DPU_MAX_IMG_WIDTH 0x3fff
 #define DPU_MAX_IMG_HEIGHT 0x3fff
 
-#define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 046b683d4c66d..31451241f0839 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,7 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define STAGES_PER_PLANE		1
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_STAGE			2
 #define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES

-- 
2.43.0


