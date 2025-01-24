Return-Path: <linux-arm-msm+bounces-46077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F74A1B48C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 12:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54848165527
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 11:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3DCE21C9E1;
	Fri, 24 Jan 2025 11:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fjAcbiaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38BF21C183
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737717284; cv=none; b=s+aVvAYWF4Ef5J0rGOys6WmS1lP+svF2RH2XJO5rrcWoEZXDqZSbk/sElxfklC1nFqi1RCnWw/6s3P/wWekiBihZ2I8vAjMneWDWryLWGHa/LTPdf7mZjA/0znB02M5oAZjuM8La0a+x//E7v0Rax4DMXtALWZpQCAYjY7fv4F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737717284; c=relaxed/simple;
	bh=RJbY2Rc5XWEYm7DVDGShoSdkiZEDKvsZ6ViiD3b/p6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vElmn2DjFQO1F5WTCo8IXPpcs5lezjfI28iKVSNe9jxwCImqGkK5cM4Dtnx2/qXgjDm4eo2ELs6f/e6YovWr/naWUpufbzY3C/KdcJCOOiV1u0s9F4ckpCSPZFjllzh0c0GyPzCCf9ols/BdZnaCxC2GrwTMXDl6TSSlAqOU9Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fjAcbiaL; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-304d757a9c1so22062351fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2025 03:14:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737717281; x=1738322081; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/oxMMFfQ3I3pEj54pjtnXmmwf3LThN/3TdVC/t7tnw=;
        b=fjAcbiaLNhdXnt9XbkKh5ErFmjH+ozVF2+XEK9zMGQBCNXKkU5Zs2ntkrDBQo6VgvW
         HvnDl6aXEGLpuu3j01o29Yq8znG7C61DokMT9Vwn473fXunslJ9ANGiiX1QG0g/FMim5
         uNnD8g/jXiDqcbqx2U5UP131jC1hvHIwwI/mhjwutHiSvYB4CZhFCcyzL3QOQq3JksX0
         aB7eyhEotXAaCH6IXTwuJb+8oUi99lg0S443AZK+ZKZVP9Okz5HL3adZZIdN8CeWWVH6
         9xiZvgddv2J5g7BjagDzKxnGFvwSUgzHndCYGnn5s7mxd1n4t+eZ2HDG0nBnhOgBiX17
         20EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737717281; x=1738322081;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/oxMMFfQ3I3pEj54pjtnXmmwf3LThN/3TdVC/t7tnw=;
        b=BylrVMDKAJXGtUt9CqJwnK/n9gdGgkDTHb7zHPr0CUjcFPo3LSgfd3rYnWGx5eJxRW
         1Mo6ZefABGxFWrVGshZtDuNlSF07cXk/mYh2NlyIcDP/Ka2XMGqBzCIvQvG6wRPPNMGj
         yJ3uC7eU1ioPPIMv3mFMVhot2XqHTgY71dIsoa+ONNzMfinQlXyGj333e3FiFPANzCMw
         6VrxYQzfPlh/EPNeLpXi7QC+ZSyov0UXIImArwza18Ghks8gustCbl7Oh44hKr+OhoCs
         U7aYK3w7U8QdHAh78fdgZnoQqU/YWhmNcQvbu6FE+GfDhpazg/zMTZapzDP1/r3/fZpM
         zTFw==
X-Forwarded-Encrypted: i=1; AJvYcCVofybJnREjqarCKbxEvpJR99ZNS850kIHve4zTRpNbjSmMEKCZuUfpJJTQr/B+xtCCE16g/rMhw89QCQy7@vger.kernel.org
X-Gm-Message-State: AOJu0YzgRl/v3dTnteYPW4kt9G8yJcRgoIKqAfXPFcUydMucwJ3L11Z8
	wUspPI0X9pI7gZF5G6wZVuD+FNgw37RPiRJHnSB2O3ge+uV/rBjIEvcXYTzM6Y8=
X-Gm-Gg: ASbGncuffJlpfQXSXisHSIRgutzyL6l7delCWaRv6OpGQvl2EGA8lPtlRipmXXzJpdS
	GWUei4xWXIkIAKJsDiR1/nppd8pN28c9uTezOW2k4AX+mCj0gwzBcOjaMyQpk6kQcdtmKaRQMKz
	bZr6t3GfcM1Etj23HDb3SEo/iK6cgZ9yyNkJuYca2gINWYdagSAQg1JMPLIlguD/FwoD5h/VNSQ
	SQnZFBFzfrcQB/uImzkbO4Z7FtfcT1gACIv7AOJfUrV4vJXR/0er2DS3h2j1TEt98ODgt0rcbyR
	SVEm44ObnOMl
X-Google-Smtp-Source: AGHT+IHVMKQAcRvAe8Ru8jqcnZYt30PR8+TeSYcOpinNZ1wtFZ71833jO2mo4HCWThadfs6F2ffqfw==
X-Received: by 2002:a2e:bcc5:0:b0:306:5c3:b4d0 with SMTP id 38308e7fff4ca-30761b8ba44mr32377961fa.2.1737717280986;
        Fri, 24 Jan 2025 03:14:40 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bacba5esm3289701fa.36.2025.01.24.03.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 03:14:39 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 24 Jan 2025 13:14:23 +0200
Subject: [PATCH 5/6] drm/msm/dpu: use atomic_needs_modeset for CDM check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-atomic-needs-modeset-v1-5-b0c05c9eda0f@linaro.org>
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
In-Reply-To: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Kalyan Thota <quic_kalyant@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5402;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=RJbY2Rc5XWEYm7DVDGShoSdkiZEDKvsZ6ViiD3b/p6s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnk3YVhnfHs7IeTGIT9ZCw63TSM0or1W73RRqCO
 jM4PlE72l+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5N2FQAKCRCLPIo+Aiko
 1SfjB/4pjKjgrLihmXFuc8/lEhY++xtfarlvxvtlPF7NNTAt8TD2ODkbq65HkGUq3BJhjyWFTg3
 7jjR6lN0Qurx1jhFXRgAaLmwbwhmP1bsNPcdmhkqENq5DwRwoll/5z/6wrfExcbvmypMWhOs4mq
 F1fDmj8fZXSExioEAARKLBBzNzIpFvE9ne8GpThEhuJ/lHuWSlqqbh7u0eSYi9j6PHumwwYVK76
 Z16KvZ6td5a/UJG0JV3k+NUHGtokspzUvmh8h844NmsjDB1soVBgHcvWiCFCNJ8lHof6IFX1muy
 aZ4qXkbEy9LoU7Es/aKBoJ4QF6nQFwyM5M6gd5LygTSMm3F/
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Rework the CDM check into using the new atomic_needs_modeset()
callbacks. This removes a need for the dpu-specific check_mode_changed()
callback in the msm_kms_funcs structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 35 +++++++++++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 ---------------------
 3 files changed, 21 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 84313bc1f9888452914612fab559b390cf38c705..d09a5c682031b840d486cf48871964e395226d33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -753,32 +753,38 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
 	cstate->num_mixers = num_lm;
 }
 
-/**
- * dpu_encoder_virt_check_mode_changed: check if full modeset is required
- * @drm_enc:    Pointer to drm encoder structure
- * @crtc_state:	Corresponding CRTC state to be checked
- * @conn_state: Corresponding Connector's state to be checked
- *
- * Check if the changes in the object properties demand full mode set.
- */
-int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state)
+static bool dpu_encoder_virt_atomic_needs_modeset(struct drm_encoder *drm_enc,
+						  struct drm_atomic_state *state)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct drm_connector *connector;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
 	struct msm_display_topology topology;
 
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
+	connector = drm_atomic_get_new_connector_for_encoder(state, drm_enc);
+	if (!connector)
+		return false;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (!conn_state || !conn_state->crtc)
+		return false;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (!crtc_state)
+		return false;
+
 	/* Using mode instead of adjusted_mode as it wasn't computed yet */
 	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
+		return true;
 	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
+		return true;
 
-	return 0;
+	return false;
 }
 
 static int dpu_encoder_virt_atomic_check(
@@ -2658,6 +2664,7 @@ static const struct drm_encoder_helper_funcs dpu_encoder_helper_funcs = {
 	.atomic_mode_set = dpu_encoder_virt_atomic_mode_set,
 	.atomic_disable = dpu_encoder_virt_atomic_disable,
 	.atomic_enable = dpu_encoder_virt_atomic_enable,
+	.atomic_needs_modeset = dpu_encoder_virt_atomic_needs_modeset,
 	.atomic_check = dpu_encoder_virt_atomic_check,
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index da133ee4701a329f566f6f9a7255f2f6d050f891..92b5ee390788d16e85e195a664417896a2bf1cae 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -88,8 +88,4 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
-int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
-					struct drm_crtc_state *crtc_state,
-					struct drm_connector_state *conn_state);
-
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 9748d24b3ffde45992d28b697a88db5992b00c69..97e9cb8c2b099f4757169cadf7e941148d2bfb16 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -446,31 +446,6 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
-static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
-{
-	struct drm_crtc_state *new_crtc_state;
-	struct drm_connector *connector;
-	struct drm_connector_state *new_conn_state;
-	int i;
-
-	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
-		struct drm_encoder *encoder;
-
-		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
-
-		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
-			continue;
-
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
-
-		encoder = new_conn_state->best_encoder;
-
-		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
-	}
-
-	return 0;
-}
-
 static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -1087,7 +1062,6 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq             = dpu_core_irq,
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
-	.check_mode_changed = dpu_kms_check_mode_changed,
 	.flush_commit    = dpu_kms_flush_commit,
 	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,

-- 
2.39.5


