Return-Path: <linux-arm-msm+bounces-30440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA519691E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 05:23:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0121C22AAD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 03:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16417433BC;
	Tue,  3 Sep 2024 03:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jdLqwAui"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1007A1CDFB3
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 03:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725333780; cv=none; b=Rf5q9SAjx7uOtu/B322KOszPnJeoANBLkSwXkL028gx8ZQkWNnbyDt8tDnEmC+UlpIn2wqafnvpYgeMVxaSOYVQwvI8oX0MCWyjLd4D576KYfmCrzhG0YcpljYn6ftB+nwP46cJkvjKdGK0qJEOIsYqwQm0awjMpN1CCo3+89Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725333780; c=relaxed/simple;
	bh=2vCXlDjK3FXsP1DkPggf0crfd1rUXHBaU/gngKtPFWo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gnJd75XM/ve9ipbbFuRXoAhlQ4ogzxF2D31W7MXQ+WHdSq8TU8kpv/fOQPXx/GtGtJs9EsgWNMt1Hh+IUYdyr/dAKgxFLkturgI+IEvDutNysD6a1fZotOu99t/kfRFqymOnTVpgFlec6dp2vayxRq5LDscY8L7us4Et6rH/DwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jdLqwAui; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2f3f0bdbcd9so56435821fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2024 20:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725333776; x=1725938576; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DLPumKfNMzy40ki1pODOGiA/OM1zrRJ9SLI3z8CxSzQ=;
        b=jdLqwAuiwwCHs5XcYBnFL2bu7qCiG2cjj2b1iG5871bFAJFwH85Iug/jHp72l4zv+M
         ulNppZ/bJ64WlOmCF3l8joWVZQrJmPIvbvNQiga87ORzjldkF8LDZJOuvQdspcHgbH2q
         ra67GTxIyEgCXlfdCwMyXmTCdjiOgtI4fO6fdbHcQkDN7qbMclT9de71pxUXrXYBPxFV
         zOaB//+CWWLZkJjxqeKElUhHRmylPkv5U1mRxocb5kOEUfi7e1IdoDr6bv6aAC/0tJ79
         Zm6YTZOQUzGUQZIlE64AIyTujvcMK0PZdOYAGAxITPiTlMeIs/0hkClIfvCjzkIE7/2l
         sZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725333776; x=1725938576;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DLPumKfNMzy40ki1pODOGiA/OM1zrRJ9SLI3z8CxSzQ=;
        b=nSxy1CZ7NMLkXJZ7m1aYrhE6YY9TwpOXQYi5O3/POd38k6v5n9EES8deZ+iwUb9REF
         zXyyMfhsrzV+QLS8H3CA3jn9DE5QAFHZMo0Z2a6ssc4og/EveEK9NFgTjOMm0j4iLE78
         29/OGFHvYydKBmTFWNsUyQsRh9RgX0Cmz4wuX8t6QFt0AFSezZA80e3oLjevDeOmDEJU
         YjYVHiOtUbrQiK9ezcIoSNL0CZmkvTE8eQK2zu/3IVcgofr70MiuBWBBlfDyQc0PZ2+A
         t7zRW7fyKLpvHfVOq83SgWW0uD4gF2lRF1Qaq/HUef2Nmh6sgbZINNI+NG6LS6wy6N84
         B/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXREvhsuHIdSIhKMqyxZOUBIk+cpAZmJzuwfp2VDxByPqJgFbUMr1dRnpkASfiL6l1J6uGt9EeUj8Li+zM7@vger.kernel.org
X-Gm-Message-State: AOJu0YyvF1KHGOVOyUkuk9ICQjzCyw27RJOIVEafzplFsbkfVRxAKuJK
	OF29aUwzLQ1Th9+JFhQyr7vbDMblLaNfmzYjbaKC624ITNmJV8tp3cHrsE3JANs=
X-Google-Smtp-Source: AGHT+IG0sKGN/OowENUG6XG9IvnoEeQCptU+0hN5SsynWKdu9pKOtRwcENXe/ilSFBmpExoHI+KlaA==
X-Received: by 2002:a05:651c:1507:b0:2f5:150e:6016 with SMTP id 38308e7fff4ca-2f636a131a7mr33251531fa.15.1725333775113;
        Mon, 02 Sep 2024 20:22:55 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f614ed15a5sm21003961fa.8.2024.09.02.20.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 20:22:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 03 Sep 2024 06:22:45 +0300
Subject: [PATCH v6 02/15] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240903-dpu-mode-config-width-v6-2-617e1ecc4b7a@linaro.org>
References: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
In-Reply-To: <20240903-dpu-mode-config-width-v6-0-617e1ecc4b7a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5688;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=2vCXlDjK3FXsP1DkPggf0crfd1rUXHBaU/gngKtPFWo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBm1oEKiq6BciEjU4950Ou6QaW31DAtla76BdMPK
 rE3+NPcZNqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZtaBCgAKCRCLPIo+Aiko
 1fc/CACkTLf1bxkklqBWZ1gejOd5ylWR2hAYKjVI1qdg6KHI3mjnhg56E4XWgbQzJiWm9+SyzLG
 UPcRZV1ri6tuTc8kA9gEKYzYvdiOrBM085ktHFVWv1L5qEG03bHn+OPXAVE7KoVH8rB6txDjrC7
 gABq1JATOZVs+B3j7C6AkHz9ITG4/EFFlm/bC2soXwVoc/HJnNbtoX8zHSTjYIv5+I3hqP7mecC
 YcL4kImo7ZulAvVr/fsb62pQbUMEQHYLSY402u6ZqvU8gh84emX7wOu2VeWM8Tao6Mn9Rsr7/Nt
 b4UhEOoTMuYA4uayEBlShzHifDEfjr14A0n/znbtMcd0d9VZ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Historically CRTC resources (LMs and CTLs) were assigned in
dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
resource tracking to crtc state") simply moved resources to
struct dpu_crtc_state, without changing the code sequence. Later on the
commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
modeset") rearanged the code, but still kept the cstate->num_mixers
assignment to happen during commit phase. This makes dpu_crtc_state
inconsistent between consequent atomic_check() calls.

Move CRTC resource assignment to happen at the end of
dpu_encoder_virt_atomic_check().

Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 59 +++++++++++++++++++----------
 2 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 4c1be2f0555f..e81feb0d67f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1091,9 +1091,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 
 	dpu_core_perf_crtc_update(crtc, 0);
 
-	memset(cstate->mixers, 0, sizeof(cstate->mixers));
-	cstate->num_mixers = 0;
-
 	/* disable clk & bw control until clk & bw properties are set */
 	cstate->bw_control = false;
 	cstate->bw_split_vote = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 949ebda2fa82..bd3698bf0cf7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -624,6 +624,40 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	return topology;
 }
 
+static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
+					      struct drm_encoder *drm_enc,
+					      struct dpu_global_state *global_state,
+					      struct drm_crtc_state *crtc_state)
+{
+	struct dpu_crtc_state *cstate;
+	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_dspp, i;
+
+	cstate = to_dpu_crtc_state(crtc_state);
+
+	memset(cstate->mixers, 0, sizeof(cstate->mixers));
+
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
+		ARRAY_SIZE(hw_dspp));
+
+	for (i = 0; i < num_lm; i++) {
+		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+
+		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
+		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
+		cstate->mixers[i].hw_dspp = i < num_dspp ? to_dpu_hw_dspp(hw_dspp[i]) : NULL;
+	}
+
+	cstate->num_mixers = num_lm;
+}
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
@@ -692,6 +726,9 @@ static int dpu_encoder_virt_atomic_check(
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
 					drm_enc, crtc_state, topology);
+		if (!ret)
+			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
+							  global_state, crtc_state);
 	}
 
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
@@ -1093,14 +1130,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1129,11 +1163,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		ARRAY_SIZE(hw_pp));
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
-	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -1159,18 +1188,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
-	cstate = to_dpu_crtc_state(crtc_state);
-
-	for (i = 0; i < num_lm; i++) {
-		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
-
-		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
-		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
-	}
-
-	cstate->num_mixers = num_lm;
-
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 

-- 
2.39.2


