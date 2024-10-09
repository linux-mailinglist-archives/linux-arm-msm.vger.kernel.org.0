Return-Path: <linux-arm-msm+bounces-33653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2467899642B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 10:56:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D967B28919B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 08:56:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2D0197A7E;
	Wed,  9 Oct 2024 08:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EM7C+/yg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB071957E1
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Oct 2024 08:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728463903; cv=none; b=OyT41WaXc7nvu9dTpM9u3uNydUmgCLxm7NQFKuAtVZxv2XcCmU57du9GUohnm75STaRyZ4Jfw18DAyV/LKvvssezhEDhACyBB8OjEQo+4fXAN1uRhISuoB8UWSC/asn91ioLvnvy37KN7FKdZcVZ2GiuB5H56IDZ+uUPFof/+Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728463903; c=relaxed/simple;
	bh=7+ZvIkQm3+KbgF5bXG62KdNVBcWEMmn0s/slfuucy/Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jJDwKqylqrMpZgDeuu0glA0CC5LX9t5UwgdYOvGwHRhc0h1lJ83Y5DY/f3rsW8TPkD0FT6kMGzOBfspmHV6nfpBTk07s1+6GUl/7iwKLVAJ4ZLTneI/Z2gmYRCkJt3+1Vi1vp0Mo6H+c8zKJk4xjzSYJ5jacnr5+iQwlpSTAQoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EM7C+/yg; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-6bce380eb96so3927470a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 01:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728463901; x=1729068701; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pwqv1rhTGFasLdg0WvU6AXjOOGyCaNS4WyGtK80xkko=;
        b=EM7C+/ygglU+FX/7YSg5XYJ7NmgTudyHN2Uwdc8JLfdeLv9B+DG1k1pskWef6CJ1ER
         gJF1lT3+4Fv46C/U6I2dp7/1m3B9dbvmZrH1YotZZXZDBBxWjkaZhmCUmMXdizL9vdD0
         7bw22Ri8sNmOtuKaK8Ggy2Nm3ZTixb155ThsYwp3PYxg8GoGM6pECoEHWwDyAI9/nPje
         dJCzcVhEDjXgr9ogN0VinKFnpdghPZZbOMZxz0URTYu0+s597SaNfy9qkDLDkMryqTU8
         Vh7wejprLgRyCAVv8z3w6w1dO5p+3hzPNw+swArXX9J60PvDkJbEnzmD1AJIyF/aWAuV
         44eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728463901; x=1729068701;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pwqv1rhTGFasLdg0WvU6AXjOOGyCaNS4WyGtK80xkko=;
        b=TVtfqDYkkA6Wcx6IHPPANV0TbTp2iKS3UX2eqdT733u6j1Fgzfn6oLGNW3UgbEaJCu
         32PVsA/DmU5y3RmGr554/OBK/yVkmrEjuPDNQqB0O12t9LuJnL0PNV61yoSpF+Mg9RA2
         dqeWAld/RcP59dyf6OMd89vQa0sva91y2KuuiPG8N0CnmYEmovuc4ARCX/x/0a/gojMV
         KapTTvRUB4T6p6GLvLmj+kyjjfuXLiD0l7L8gHf3sviKHEzsRqsS/2hy6qlBYMwKo1Ya
         yfoNdLDY3Bbhc1d9Fc3N6A8ZmsXnrOdBBFxTjUaftrM6czry8gnlebtoSMTF/Ni34xAa
         Bdog==
X-Gm-Message-State: AOJu0Yz8PgFJCFupXOQoW8plczumdMh9oJcKtAo6rr6zc6Y+xXc9OKtK
	lc8o4p0FNjhGt/GtK/r2QLtFNFggY3UEmsHCv80RnNuYsBUjCxK2aJNN+qemLf8=
X-Google-Smtp-Source: AGHT+IH/OP3QTgGjxIuKJ0oyytzwGzO6tFYp3oV193Ebfd756Hp2A4o+GBtu5EabM4fWhmuN+lSVgA==
X-Received: by 2002:a17:90a:744a:b0:2dd:92e5:6f7d with SMTP id 98e67ed59e1d1-2e2a2471e84mr2313793a91.20.1728463900699;
        Wed, 09 Oct 2024 01:51:40 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 01:51:40 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:27 +0800
Subject: [PATCH v2 14/14] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-14-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=6009;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=7+ZvIkQm3+KbgF5bXG62KdNVBcWEMmn0s/slfuucy/Q=;
 b=rgEs/g/vWs4Vpc3qv0Yve1dY4lYYjjpml8TIJBgX0vKvSOeV5royXLdUYsPS6UFPTrxwJBslz
 J2BLnZXAbGsBNs2tGlsVrNZkPkX5KG0DZyxhksp051co0lyg7Gn5H4C
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Request 4 mixers and 4 DSC for the case that both dual-DSI and DSC are
enabled. We prefer to use 4 pipes for dual DSI case for it is power optimal
for DSC.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 29 ++++++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
 6 files changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d2aca0a9493d5..dbdfff1c7792a 100644
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
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index ee7cf71f89fc7..f8276afd99192 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -211,7 +211,7 @@ struct dpu_crtc_state {
 
 	bool bw_control;
 	bool bw_split_vote;
-	struct drm_rect lm_bounds[CRTC_DUAL_MIXERS];
+	struct drm_rect lm_bounds[CRTC_QUAD_MIXERS];
 
 	uint64_t input_fence_timeout_ns;
 
@@ -219,10 +219,10 @@ struct dpu_crtc_state {
 
 	/* HW Resources reserved for the crtc */
 	u32 num_mixers;
-	struct dpu_crtc_mixer mixers[CRTC_DUAL_MIXERS];
+	struct dpu_crtc_mixer mixers[CRTC_QUAD_MIXERS];
 
 	u32 num_ctls;
-	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+	struct dpu_hw_ctl *hw_ctls[CRTC_QUAD_MIXERS];
 
 	u32 num_dscs;
 	enum dpu_crtc_crc_source crc_source;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 68655c8817bf8..ed220ac691e8a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -54,7 +54,7 @@
 #define MAX_PHYS_ENCODERS_PER_VIRTUAL \
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
-#define MAX_CHANNELS_PER_ENC 2
+#define MAX_CHANNELS_PER_ENC 4
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -588,15 +588,19 @@ static struct msm_display_topology dpu_encoder_get_topology(
 
 	/* Datapath topology selection
 	 *
-	 * Dual display
+	 * Dual display without DSC
 	 * 2 LM, 2 INTF ( Split display using 2 interfaces)
 	 *
+	 * Dual display with DSC
+	 * 4 LM, 2 INTF ( Split display using 2 interfaces)
+	 *
 	 * Single display
 	 * 1 LM, 1 INTF
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
 	 */
+
 	if (intf_count == 2)
 		topology.num_lm = 2;
 	else if (!dpu_kms->catalog->caps->has_3d_merge)
@@ -615,10 +619,21 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		 * 2 DSC encoders, 2 layer mixers and 1 interface
 		 * this is power optimal and can drive up to (including) 4k
 		 * screens
+		 * But for dual display case, we prefer 4 layer mixers. Because
+		 * the resolution is always high in the case and 4 DSCs are more
+		 * power optimal. While a single SSPP can only co-work with one
+		 * mixer pair. So 4 mixers are needed in this case.
 		 */
-		topology.num_dsc = 2;
-		topology.num_lm = 2;
-		topology.num_intf = 1;
+
+		if (intf_count == 2) {
+			topology.num_dsc = 4;
+			topology.num_lm = 4;
+			topology.num_intf = 2;
+		} else {
+			topology.num_dsc = 2;
+			topology.num_lm = 2;
+			topology.num_intf = 1;
+		}
 	}
 
 	return topology;
@@ -2031,8 +2046,8 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_mixer_cfg mixer;
 	int i, num_lm;
 	struct dpu_global_state *global_state;
-	struct dpu_hw_blk *hw_lm[2];
-	struct dpu_hw_mixer *hw_mixer[2];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_mixer *hw_mixer[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_ctl *ctl = phys_enc->hw_ctl;
 
 	memset(&mixer, 0, sizeof(mixer));
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index e77ebe3a68da9..c877ee45535ac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -324,7 +324,8 @@ static inline enum dpu_3d_blend_mode dpu_encoder_helper_get_3d_blend_mode(
 
 	/* Use merge_3d unless DSC MERGE topology is used */
 	if (phys_enc->split_role == ENC_ROLE_SOLO &&
-	    dpu_cstate->num_mixers == CRTC_DUAL_MIXERS &&
+	    (dpu_cstate->num_mixers == CRTC_DUAL_MIXERS ||
+		dpu_cstate->num_mixers == CRTC_QUAD_MIXERS) &&
 	    !dpu_encoder_use_dsc_merge(phys_enc->parent))
 		return BLEND_3D_H_ROW_INT;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index bf86d643887dd..f79ecd409a830 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -25,6 +25,7 @@
 #define MAX_IMG_HEIGHT 0x3fff
 
 #define CRTC_DUAL_MIXERS	2
+#define CRTC_QUAD_MIXERS	4
 
 #define MAX_XIN_COUNT 16
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index d8f5cffa60ea6..671e03406df74 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -32,9 +32,9 @@
 #define DPU_MAX_PLANES			4
 #endif
 
-#define PIPES_PER_PLANE			2
 #define PIPES_PER_LM_PAIR		2
 #define LM_PAIRS_PER_PLANE		2
+#define PIPES_PER_PLANE			(PIPES_PER_LM_PAIR * LM_PAIRS_PER_PLANE)
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
 #endif

-- 
2.34.1


