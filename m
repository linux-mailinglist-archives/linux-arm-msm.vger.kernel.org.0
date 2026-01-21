Return-Path: <linux-arm-msm+bounces-89956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDeAJn2IcGkEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89956-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:04:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF21533A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:04:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B245A506BBA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2588477E3D;
	Wed, 21 Jan 2026 08:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="myFCAyAF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E736D504
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982548; cv=none; b=XtU+fnomuYefFq+kxbLwVvTJIoem6Je51aa9SslWUKZhvmSHEWmJdpl4Gw7m8wAecWj1pSZihzMuGWq4qX9rcmvb76i1hdi9RGGsb4FM0u1CMQpdZLhGP94Gp1P/7KQS1PLBLl/WGLtBucUyNcreM6AvSxv8aFWYG9Y/K5anzZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982548; c=relaxed/simple;
	bh=sUxkfSflUjvUQUuerLM3rVhcLEqQsQK+6PsY7hltyxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBKGiBViEGnSL0OSlS5KWpxcjeYxZxmE4FAhq2EGV8E/5NdEp61STRfxr/vXw1IX3p0csv/34Z8u4fVnsXy8V3+KpvBYGyg6LouWOSLBOJV9nHT2A5j7uXUA2TOLtqkCx1n//g3Nl8OJ12JwZwtgZsAB776Gx217yucMzqkqpkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=myFCAyAF; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2a1022dda33so39289025ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768982544; x=1769587344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qHVChkDZvzveTCvrkA+LEiIGKaNQUDMs3gLCdYxj3I=;
        b=myFCAyAFlKo1X6tTo+KSxpLcNOsG6dah/LXbAV30j1AlapWdCnDIg5YzQUOCOslG0e
         idjy/jKu5MRyQVMEwJM1gfDBVYvYJU5sZZlg2OHZj2O2y/kkGw2S/Ib3gLTTm4L1NwHz
         6ATihK1biWfp19Rp9wqNgmPuBNCxlPRCAQS+VDsa1BC3fsfMrwkrm7nRmK823/Uu6WLU
         +PeAwk3jetEOZuiJeEcnrA+/qfP7KTAdt+LylAbSYV69Zyt22VJ6F4ttHcw3Ryy7sVI1
         MZOJs0+IfcGD2wS80wnDNohRxyodpvwtf8+XgvXKlrPXCpXGjiL46QeR5KHyIYL5TN7t
         1cnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768982544; x=1769587344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5qHVChkDZvzveTCvrkA+LEiIGKaNQUDMs3gLCdYxj3I=;
        b=J2YU2x8DLLmCBWakIDb4BPfUH2L1Q4qD5yP5oXnbz7oRGdOkIHOf16PN0QO1xDRKA2
         TrjNfVsj5Yi/z9QUbIJwvt6O2Uj4SJvBAPXsxTCPPcogpZy9uVcI/MeyKkSqGA/99jYd
         jwU5fT0oyIS3jNaXD78PAAwJo173E+aGNAg+r+yfeIVQG7+yjfax4HfQ8QgltjzUGNda
         EH47xTfPyWZlHXL4rWY2jkfmqckSLfJniMM87SFUg0WAsumkl7h5MB++U/GusfXcaA2s
         RZFI+PviUcxqhoXuLvscto7L8c0hzZ8RSyridjkgSygMVDUN8AB5S/ueR4w2kfWf7jYT
         GcMA==
X-Gm-Message-State: AOJu0YwwLqY1IZ/Azf5wQyRa0nVexFUxgbuj7C1j+WFuVZVTgceoMdK9
	hyIVEFtiF1TN6aARlSLfcRckGWbBiFQtFaPATdumce4QuFPxIEopY0+deeCWTMVGdRY=
X-Gm-Gg: AZuq6aJ4G3MinP5G4ingOyY8O0bNkPwL4W3XXfyt6cOKd58tJjcZ/vu9Of31LMzuxdJ
	XDnRqxWAb73noNWi3FrC7j45G7eYTbwCPQfE6wiqNHu+5AFLTdtVgK0vymlKuSfXaeIeuFDkcqC
	x7YY+lXj9q3mne2DoBw6VBnltKBiPFw11+uYxRVtBuNlfAUL1IoQpw6AER45YT5WHT/nSx75yMK
	H8DF1Co1Y2ih1s87D2XtvuFRao0YxUsvOldvdOONHzxXS+RJgnNs0gOIEXJbZiOfyrC92/zYNfJ
	WTB+CQXK59sF/wpZL8W9IMMuhaBRq0Tot1xcwV5Y7u/jZpsHgcGP7ChgVzkCChYXY65GrdcFrMD
	cLFNN+2GdNQd+DBC7UlcYOj+UE/AaIu5p1l+Kyoqo7zFZV6+kaVetTA+bhhIM
X-Received: by 2002:a17:902:e84a:b0:2a0:c942:8adf with SMTP id d9443c01a7336-2a7690523c5mr34762105ad.8.1768982544103;
        Wed, 21 Jan 2026 00:02:24 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4039])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d14cfsm146851545ad.38.2026.01.21.00.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:02:23 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 21 Jan 2026 16:01:53 +0800
Subject: [PATCH v17 4/4] drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-msm-next-quad-pipe-split-v17-4-6eb6d8675ca2@linaro.org>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
In-Reply-To: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982516; l=8588;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=sUxkfSflUjvUQUuerLM3rVhcLEqQsQK+6PsY7hltyxs=;
 b=y3ioZjedRLc3Kb02B59ZZ2Ks9gl1YJEXKqXkge5ok2884XWHnZIUqZmXickAM8lTgONIE9lEp
 pGm2MOalot8BCgwxTM/SIpByvTAp+46nyVc/SglATdzBvqbLcbcB+ys
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89956-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,patchwork.freedesktop.org:url,qualcomm.com:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,quicinc.com:email]
X-Rspamd-Queue-Id: 4BF21533A2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To support high-resolution cases that exceed the width limitation of
a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
additional pipes are necessary to enable parallel data processing
within the SSPP width constraints and MDP clock rate.

Pipe array is extended to 4. Request 4 mixers and 4 DSCs for
high-resolution cases where both DSC and dual interfaces are enabled
for virtual plane case. More use cases can be incorporated later if
quad-pipe capabilities are required.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Patchwork: https://patchwork.freedesktop.org/patch/675418/
Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-10-ff6232e3472f@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 28 +++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++----------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 87a934e3801f3..a7ca79564c523 100644
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
@@ -1328,6 +1328,7 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	struct msm_display_topology topology = {0};
 	struct drm_encoder *drm_enc;
+	u32 num_rt_intf;
 
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask)
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
@@ -1341,11 +1342,14 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * Dual display
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
+	 * If DSC is enabled, try to use 4:4:2 topology if there is enough
+	 * resource and virtual plane is enabled. Otherwise, use 2:2:2 topology.
+	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
-	 * If DSC is enabled, use 2 LMs for 2:2:1 topology
+	 * If DSC is enabled, use 2:2:1 topology
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 *
@@ -1357,14 +1361,24 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	if (topology.num_intf == 2 && !topology.cwb_enabled)
-		topology.num_lm = 2;
-	else if (topology.num_dsc == 2)
+	num_rt_intf = topology.num_intf;
+	if (topology.cwb_enabled)
+		num_rt_intf--;
+
+	if (topology.num_dsc) {
+		if (dpu_use_virtual_planes &&
+		    dpu_kms->catalog->dsc_count >= num_rt_intf * 2)
+			topology.num_dsc = num_rt_intf * 2;
+		else
+			topology.num_dsc = num_rt_intf;
+		topology.num_lm = topology.num_dsc;
+	} else if (num_rt_intf == 2) {
 		topology.num_lm = 2;
-	else if (dpu_kms->catalog->caps->has_3d_merge)
+	} else if (dpu_kms->catalog->caps->has_3d_merge) {
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
-	else
+	} else {
 		topology.num_lm = 1;
+	}
 
 	if (crtc_state->ctm)
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
index 4964e70610d1b..336757103b5af 100644
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


