Return-Path: <linux-arm-msm+bounces-43061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EF79FA3F4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCA55167330
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF3618132F;
	Sun, 22 Dec 2024 05:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bPwXlRJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417DD17BB25
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Dec 2024 05:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843664; cv=none; b=dD/ZcGk8Ek8UvORbzVS/W43Bo6RE/NPGPnMihf62vozNmB2+NHsJBg1ejvq0deQ01EEa6BGU6uJg4RZtOboQbc8CTfTZO3t+XEz9RIWwezJg4PQIjP7cULIeXMxvTTLX5cu91b93OQW4SvCHpV1rtdNddOaWGlKQGEzT6AVS2/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843664; c=relaxed/simple;
	bh=DYgtDJQPVbedGxDbDp9oOhz2z6FzJGN9bVgSpfs5T1A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUQK9SbvWQm21SkMgKQdNKqo4eARm7/8R861At/eYft/kcsaxaVhv0Ebb1UJs780yymCMqZY2aAvBqqO3/QIBpGTdyImsTV4ac1vc9ufBCo/hP/9m+QOpHOXddDXHlUttBFTEWuzlOtNvtluyiywHW+IIk/O3hd1vg2PMKrV/WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bPwXlRJ3; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-540215984f0so3311558e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Dec 2024 21:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734843660; x=1735448460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Z+rBahjAbnRzsWwhl3RN6A6WwHfHM88b39CtT7CZn0=;
        b=bPwXlRJ3XEd8H+3mQxuZEdrb8fZuERNmVROQzSXVVn6aV21HK3GXN5j8QXJ9mSWaqX
         5TkT8eQssHeTjPB6T9pK2Ume2jVv9LyrUxR3K5elA3KJUBXVmSMGnZPRYtOd2aynzN5L
         XRuYQYTTDs7D1bTHDXA6Pk7DTtDxEs8fSjrqeCv4+I8FDLfmGydzuQbJzkskfO1mQ48T
         VaTfq9FSF8xPrwxcmoBbHWs5L/UeKSwnYxmrM9ezJoRXFnPxQq61ZskKqVZW0VrJOD7M
         H588oc39/VIxCHPOPVYPA5P0wO5D2w4Lbf7oSYe5CKQ5N/LytHJa4UbPuaCCBm7k5wUi
         WM/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734843660; x=1735448460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Z+rBahjAbnRzsWwhl3RN6A6WwHfHM88b39CtT7CZn0=;
        b=v5OkzEmkh2pjt6fSErmDqzFq+6vCsdJno353qcmePBKN/HXJkHt3obPr67//FESbMM
         tCRe6QsatEOmPFRRJALuCvkeUtoiJ329ymhNLhhAPBDEeQlfh8YxO8+0DhuBKpOoMv/c
         gKZPf8wmx82ShA313WeYt/xjDlWktU411dvqTFFPbDHz6ohdG+N8dRLz/kE8dNAqJyZI
         v9lpx1Pxco/NgOd0f7FsggeChgjeZtsywMjzQjWyxMKdLhWZZwTO/1fxKphP+OWKeABi
         MnK37hhPU0oJbtwZ10E7Bm+ZH8yl7gTiewYHm2Qyn/ebuAcvUaMWh1APqD1B4WGWAevC
         ml8Q==
X-Forwarded-Encrypted: i=1; AJvYcCW53L9e3KyD5mEbYmzk0c8r0xKK0sip9iagvZC6+ZeOQm9XnLFX9V+dRMgHNeGvkxxifKU4Oj2nrJQRZEk8@vger.kernel.org
X-Gm-Message-State: AOJu0YxD4e2X3V+YdLuoXrwPKLMxepYOY9BomC5oA7FXZm9u8xmy7b2z
	q4QNfU/sZJ6tN2lZ85UFfinRkEcpvO0W+F/n/8iJGvaolv0q1Bnkup8hlfwS8Zw=
X-Gm-Gg: ASbGncuy6fID0h00IpUZfa1PxzvPY2yKezEVvOm4lL+hDGVFSBVlABODSJgGbk+7tBs
	KrNT7PXwBdH1Mu2Sgr5iL9SAHqbnbJEro0ppORwV7TYyDYokbXpa0tdKp50342EwaLltW/rWVki
	JvwsV1CxJVIvK/RgqVNYDffTnRY26sxg0rBzcUSiXf6wOkQu8fXJQQW40PJ4+HZD0ht9of9aJ0L
	O7p1uzmhZGK+uwU3WG22hrhXfd7dhQk6QzDz8FyiM6yqy5eejSqFWMc9JfiviZg
X-Google-Smtp-Source: AGHT+IG9PLc2TgcP5V5DNr8mxT3YMz7GDwhcZ2v5XDciS5lADg8+jcgwoscaaLV0JLE5hmtyxk69hg==
X-Received: by 2002:a05:6512:1055:b0:542:232a:7b2c with SMTP id 2adb3069b0e04-54229548e22mr2561331e87.29.1734843660430;
        Sat, 21 Dec 2024 21:01:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223832c05sm887145e87.276.2024.12.21.21.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2024 21:00:59 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 22 Dec 2024 07:00:46 +0200
Subject: [PATCH 6/6] drm/msm/dpu: don't set crtc_state->mode_changed from
 atomic_check()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241222-drm-dirty-modeset-v1-6-0e76a53eceb9@linaro.org>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
In-Reply-To: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7162;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=DYgtDJQPVbedGxDbDp9oOhz2z6FzJGN9bVgSpfs5T1A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZ5z8q5ZLE91hpI9bKURtnooCKOkRd5GgQ1zBl
 zIpLTUQ90aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2ec/AAKCRCLPIo+Aiko
 1YdFB/9Tz+IdZGx7nLZX9BeA60xx2fLspau9frJKY4ko3gNUUbQU/cwT136wnAD1ttr9w1J2Qr5
 JjbKLIeY7wZMujTDAZEGbftU/AxzoO4wv/RLT19oZjTUfaHEY6CputmywtH75xjAh2J1GozOxwL
 cczIqw7M/abx+wncedvtjA9yao+zXq46ZJaIui07sbmn17EQ4oMx7DUuAuMweOq9auMCMhTY2Gl
 A6zs1jORwpjWrBJOoGRsXwSkLNBFgad2oUtwqdoWOecRlT7XIoT12p16dRxwS3YfoJHRixmFMkN
 6PNecUwIQSZ3xPz51fnT7xA4C2oi6yq3ve+Eelxerl7s2QCk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The MSM driver uses drm_atomic_helper_check() which mandates that none
of the atomic_check() callbacks toggles crtc_state->mode_changed.
Perform corresponding check before calling the drm_atomic_helper_check()
function.

Fixes: 8b45a26f2ba9 ("drm/msm/dpu: reserve cdm blocks for writeback in case of YUV output")
Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
Closes: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 32 +++++++++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_atomic.c            | 13 +++++++++++-
 drivers/gpu/drm/msm/msm_kms.h               |  7 +++++++
 5 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 209e6fb605b2d8724935b62001032e7d39540366..b7c3aa8d0e2ca58091deacdeaccb0819d2bf045c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -753,6 +753,34 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
 	cstate->num_mixers = num_lm;
 }
 
+/**
+ * dpu_encoder_virt_check_mode_changed: check if full modeset is required
+ * @drm_enc:    Pointer to drm encoder structure
+ * @crtc_state:	Corresponding CRTC state to be checked
+ * @conn_state: Corresponding Connector's state to be checked
+ *
+ * Check if the changes in the object properties demand full mode set.
+ */
+int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state)
+{
+	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
+	struct msm_display_topology topology;
+
+	DPU_DEBUG_ENC(dpu_enc, "\n");
+
+	/* Using mode instead of adjusted_mode as it wasn't computed yet */
+	topology = dpu_encoder_get_topology(dpu_enc, &crtc_state->mode, crtc_state, conn_state);
+
+	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
+		crtc_state->mode_changed = true;
+	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
+		crtc_state->mode_changed = true;
+
+	return 0;
+}
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
@@ -786,10 +814,6 @@ static int dpu_encoder_virt_atomic_check(
 
 	topology = dpu_encoder_get_topology(dpu_enc, adj_mode, crtc_state, conn_state);
 
-	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
-	else if (!topology.needs_cdm && dpu_enc->cur_master->hw_cdm)
-		crtc_state->mode_changed = true;
 	/*
 	 * Release and Allocate resources on every modeset
 	 */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index 92b5ee390788d16e85e195a664417896a2bf1cae..da133ee4701a329f566f6f9a7255f2f6d050f891 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -88,4 +88,8 @@ void dpu_encoder_cleanup_wb_job(struct drm_encoder *drm_enc,
 
 bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc);
 
+int dpu_encoder_virt_check_mode_changed(struct drm_encoder *drm_enc,
+					struct drm_crtc_state *crtc_state,
+					struct drm_connector_state *conn_state);
+
 #endif /* __DPU_ENCODER_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index dae8a94d3366abfb8937d5f44d8968f1d0691c2d..e2d822f7d785dc0debcb28595029a3e2050b0cf4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -446,6 +446,31 @@ static void dpu_kms_disable_commit(struct msm_kms *kms)
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
+static int dpu_kms_check_mode_changed(struct msm_kms *kms, struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *new_crtc_state;
+	struct drm_connector *connector;
+	struct drm_connector_state *new_conn_state;
+	int i;
+
+	for_each_new_connector_in_state(state, connector, new_conn_state, i) {
+		struct drm_encoder *encoder;
+
+		WARN_ON(!!new_conn_state->best_encoder != !!new_conn_state->crtc);
+
+		if (!new_conn_state->crtc || !new_conn_state->best_encoder)
+			continue;
+
+		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
+
+		encoder = new_conn_state->best_encoder;
+
+		dpu_encoder_virt_check_mode_changed(encoder, new_crtc_state, new_conn_state);
+	}
+
+	return 0;
+}
+
 static void dpu_kms_flush_commit(struct msm_kms *kms, unsigned crtc_mask)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
@@ -1049,6 +1074,7 @@ static const struct msm_kms_funcs kms_funcs = {
 	.irq             = dpu_core_irq,
 	.enable_commit   = dpu_kms_enable_commit,
 	.disable_commit  = dpu_kms_disable_commit,
+	.check_mode_changed = dpu_kms_check_mode_changed,
 	.flush_commit    = dpu_kms_flush_commit,
 	.wait_flush      = dpu_kms_wait_flush,
 	.complete_commit = dpu_kms_complete_commit,
diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index a7a2384044ffdb13579cc9a10f56f8de9beca761..364df245e3a209094782ca1b47b752a729b32a5b 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -183,10 +183,16 @@ static unsigned get_crtc_mask(struct drm_atomic_state *state)
 
 int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 {
+	struct msm_drm_private *priv = dev->dev_private;
+	struct msm_kms *kms = priv->kms;
 	struct drm_crtc_state *old_crtc_state, *new_crtc_state;
 	struct drm_crtc *crtc;
-	int i;
+	int i, ret = 0;
 
+	/*
+	 * FIXME: stop setting allow_modeset and move this check to the DPU
+	 * driver.
+	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state,
 				      new_crtc_state, i) {
 		if ((old_crtc_state->ctm && !new_crtc_state->ctm) ||
@@ -196,6 +202,11 @@ int msm_atomic_check(struct drm_device *dev, struct drm_atomic_state *state)
 		}
 	}
 
+	if (kms && kms->funcs && kms->funcs->check_mode_changed)
+		ret = kms->funcs->check_mode_changed(kms, state);
+	if (ret)
+		return ret;
+
 	return drm_atomic_helper_check(dev, state);
 }
 
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index e60162744c669773b6e5aef824a173647626ab4e..ec2a75af89b09754faef1a07adc9338f7d78161e 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -59,6 +59,13 @@ struct msm_kms_funcs {
 	void (*enable_commit)(struct msm_kms *kms);
 	void (*disable_commit)(struct msm_kms *kms);
 
+	/**
+	 * @check_mode_changed:
+	 *
+	 * Verify if the commit requires a full modeset on one of CRTCs.
+	 */
+	int (*check_mode_changed)(struct msm_kms *kms, struct drm_atomic_state *state);
+
 	/**
 	 * Prepare for atomic commit.  This is called after any previous
 	 * (async or otherwise) commit has completed.

-- 
2.39.5


