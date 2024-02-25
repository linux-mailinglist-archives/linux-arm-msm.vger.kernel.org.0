Return-Path: <linux-arm-msm+bounces-12471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D54862AA2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 15:13:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8666DB20F77
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 14:13:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E2414294;
	Sun, 25 Feb 2024 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T5U7+mwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E840B134B2
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 14:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708870375; cv=none; b=vAeKHZr9NCChoXZXp6l3mZ8xigqceejKjxCZO1nsaFc0f6nHmjPbJVx5q5D9L/oF+Z0u145jA5IXjOy4MqxCxH2GZxNJI9uFpCjbdLOMHZfq4l+2lJ6Pvjk7h9mvImuW6N2LSsYgAAgexC8pw0FOUaBTOUC/ttzWCFQSn7tN+80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708870375; c=relaxed/simple;
	bh=4+p20gFGBfsm1TzLgabMIRSGbsT/TwxhyM1Y0Pi2MaI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lJ1vvBfWj4piCIzJZ1B/lxb/+tjzqvSmJKjzIX3pn6lueRKqGixvvFoDBYOHkctrBvdIjDXCEjqQ6/SVW5hHfas3zR128moZeAyR/kx1NW4iYcgC9J0ki8eOHn5ASrR+fqA8NEZk/tcWHGBdguHa85cyhQ+DCJkj2G2Nnpp79Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T5U7+mwT; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5101cd91017so3432111e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 06:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708870371; x=1709475171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tjno7HMc44jNAwGe0pRLX3fSYJzYBO6KHE8KOaNyqJk=;
        b=T5U7+mwTeKlT3Ylcu3PUWxjf+OVU47mvGGhAiZUsBvF0q3PTMVLOuoeyd5TvSP9qM9
         ayh6wXxrLncaTDccO3/JN5VJqUE9iHdmqwOn1gIYeZuXTnhXiGU5YNw4UgeY91dx62Dk
         PjvjTGvFn7bEgPrdBK0uE0Tn5Sk2Zw5Om53vskAy/aNI6B3Q6ggOHkcZxPG/F5PE2YCA
         U9k9+WBPDA819C/JvX1bm0Y+u2N6Z/UeAG5T++W8z+amfNyCAixTiqvFxCWKNNn3G1/8
         icgaO8DbTNd80HqboeRqbq83k/doKdHDJsKtqUKnoXu5CVksKBUdGAK0VIjctWjD5be0
         EjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708870371; x=1709475171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tjno7HMc44jNAwGe0pRLX3fSYJzYBO6KHE8KOaNyqJk=;
        b=XWBGRcEhuy7slngojS3bvPubT/t9jv1l9ihzyYaEMaSIsqyTPlZgR8g0VeT8tm8Lxd
         mMgep8lLVPHS0nbb62gGk7SG4Ge2SzS2DAIPIUN6Hb3Gl/Q122bfrAXWZ0/aXg8oSGQ8
         B0q/4o6aIuOm/9dZFWORzCzWJ2TPccHuHlfNcOO+hyr4cOvfQvl6YFGDpdEpSj9LzLOT
         7ULzR+T4V3/YfMoGQhuZftqIPqhWRfSyq9o1Q0GP2cXnzwYGEWas2iPQcIEWsR+5Zu/s
         xOt2KSFc/92eEL86GcP621bO7fYLRHA/IEST0j+f+5tRRaFviB7mySHbctlws7m9fURP
         hmgg==
X-Forwarded-Encrypted: i=1; AJvYcCVqnrAoBl16IwzOsD++7aDpthS2SDWHRrT/uJ9NiKq/JGEqH/Xk6sL/tQC6b63UCcPqBNt0tufno4Ek8fNDWy0uKCjJbxNfB9GRv0V7hA==
X-Gm-Message-State: AOJu0YxMQGRM2nXs2xkxdWAcidhVm6F6rSjskzjd/mP58Oxr/bhLjc3T
	1DMNc6wfDnAazv0G3FYttfgtfJcaIaApd+KGI/IUOB1Lgmtx8xwPw9HRu/M0qvU=
X-Google-Smtp-Source: AGHT+IHCgtepImcNKJtX+cxhzdabpC0oFc/g1ZX06TiPwdYPloR5Ihby9OoUN6SMIY24COyKtqfIaA==
X-Received: by 2002:a05:6512:239b:b0:512:fe25:5226 with SMTP id c27-20020a056512239b00b00512fe255226mr29094lfv.55.1708870370964;
        Sun, 25 Feb 2024 06:12:50 -0800 (PST)
Received: from umbar.lan (dzyjmhybhls-s--zn36gy-3.rev.dnainternet.fi. [2001:14ba:a00e:a300:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id w13-20020ac254ad000000b00512e5bd2296sm522931lfk.217.2024.02.25.06.12.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 06:12:50 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 16:12:47 +0200
Subject: [PATCH v3 2/3] drm/msm/dpu: split dpu_encoder_wait_for_event into
 two functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240225-fd-dpu-debug-timeout-v3-2-252f2b21cdcc@linaro.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
In-Reply-To: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=7184;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=4+p20gFGBfsm1TzLgabMIRSGbsT/TwxhyM1Y0Pi2MaI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl20rfd/iXDzs195du3nz9bP1NLN9duQ0Qez0KO
 JnVDsV6tFuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZdtK3wAKCRCLPIo+Aiko
 1ZlUCACygLLCskenyxtIgNoFEiLgSKaidvYAPKV0C5zXnMpV03QW/cKdBmpyTxoIPWEpozUS+Cy
 FAqxNIB/KB1cloNaY/hLsGwtWXxFnoDvZRaNOWzGORHHJl50v+5nd2nLskdUX9JTI3xjOabXlpy
 /UhjDuY8bfO1A/4v1PC1UawcPDF41Ue/AsM4iJy2RU5oy8n2T7rkOcKR60lgk70hFK8Vi1QIfDN
 5Dj0Bikx+EcZhNwUF0vA8IWGX/zU5itt2KlxJE38hhk/W/abzkL2Of2Ul9XkfC8EPQH+LpKiWfz
 sq81X87CZUiiW7Na4fduVdnM32DrmlDlJ6GnhY25AS+FnLUk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Stop multiplexing several events via the dpu_encoder_wait_for_event()
function. Split it into two distinct functions two allow separate
handling of those events.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 74 +++++++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h | 22 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  2 +-
 drivers/gpu/drm/msm/msm_drv.h               | 10 ----
 4 files changed, 59 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 194dbb08331d..30f349c8a1e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1282,7 +1282,7 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
 	/* wait for idle */
-	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
+	dpu_encoder_wait_for_tx_complete(drm_enc);
 
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_PRE_STOP);
 
@@ -2402,10 +2402,23 @@ struct drm_encoder *dpu_encoder_init(struct drm_device *dev,
 	return &dpu_enc->base;
 }
 
-int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
-	enum msm_event_wait event)
+/**
+ * dpu_encoder_wait_for_commit_done() - Wait for encoder to flush pending state
+ * @drm_enc:	encoder pointer
+ *
+ * Wait for hardware to have flushed the current pending frames to hardware at
+ * a vblank or ctl_start Encoders will map this differently depending on the
+ * panel type.
+ *
+ * MSM_ENC_TX_COMPLETE -  Wait for the hardware to transfer all the pixels to
+ *                        the panel. Encoders will map this differently
+ *                        depending on the panel type.
+ *                        vid mode -> vsync_irq
+ *                        cmd mode -> pp_done
+ * Return: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
+ */
+int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_enc)
 {
-	int (*fn_wait)(struct dpu_encoder_phys *phys_enc) = NULL;
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int i, ret = 0;
 
@@ -2419,23 +2432,46 @@ int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		switch (event) {
-		case MSM_ENC_COMMIT_DONE:
-			fn_wait = phys->ops.wait_for_commit_done;
-			break;
-		case MSM_ENC_TX_COMPLETE:
-			fn_wait = phys->ops.wait_for_tx_complete;
-			break;
-		default:
-			DPU_ERROR_ENC(dpu_enc, "unknown wait event %d\n",
-					event);
-			return -EINVAL;
+		if (phys->ops.wait_for_commit_done) {
+			DPU_ATRACE_BEGIN("wait_for_commit_done");
+			ret = phys->ops.wait_for_commit_done(phys);
+			DPU_ATRACE_END("wait_for_commit_done");
+			if (ret)
+				return ret;
 		}
+	}
+
+	return ret;
+}
+
+/**
+ * dpu_encoder_wait_for_tx_complete() - Wait for encoder to transfer pixels to panel
+ * @drm_enc:	encoder pointer
+ *
+ * Wait for the hardware to transfer all the pixels to the panel. Encoders will
+ * map this differently depending on the panel type.
+ *
+ * Return: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
+ */
+int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc = NULL;
+	int i, ret = 0;
+
+	if (!drm_enc) {
+		DPU_ERROR("invalid encoder\n");
+		return -EINVAL;
+	}
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	DPU_DEBUG_ENC(dpu_enc, "\n");
+
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (fn_wait) {
-			DPU_ATRACE_BEGIN("wait_for_completion_event");
-			ret = fn_wait(phys);
-			DPU_ATRACE_END("wait_for_completion_event");
+		if (phys->ops.wait_for_tx_complete) {
+			DPU_ATRACE_BEGIN("wait_for_tx_complete");
+			ret = phys->ops.wait_for_tx_complete(phys);
+			DPU_ATRACE_END("wait_for_tx_complete");
 			if (ret)
 				return ret;
 		}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
index fe6b1d312a74..0c928d1876e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
@@ -93,25 +93,9 @@ void dpu_encoder_kickoff(struct drm_encoder *encoder);
  */
 int dpu_encoder_vsync_time(struct drm_encoder *drm_enc, ktime_t *wakeup_time);
 
-/**
- * dpu_encoder_wait_for_event - Waits for encoder events
- * @encoder:	encoder pointer
- * @event:      event to wait for
- * MSM_ENC_COMMIT_DONE -  Wait for hardware to have flushed the current pending
- *                        frames to hardware at a vblank or ctl_start
- *                        Encoders will map this differently depending on the
- *                        panel type.
- *	                  vid mode -> vsync_irq
- *                        cmd mode -> ctl_start
- * MSM_ENC_TX_COMPLETE -  Wait for the hardware to transfer all the pixels to
- *                        the panel. Encoders will map this differently
- *                        depending on the panel type.
- *                        vid mode -> vsync_irq
- *                        cmd mode -> pp_done
- * Returns: 0 on success, -EWOULDBLOCK if already signaled, error otherwise
- */
-int dpu_encoder_wait_for_event(struct drm_encoder *drm_encoder,
-						enum msm_event_wait event);
+int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_encoder);
+
+int dpu_encoder_wait_for_tx_complete(struct drm_encoder *drm_encoder);
 
 /*
  * dpu_encoder_get_intf_mode - get interface mode of the given encoder
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index d6412395bacc..26b5e54031d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -476,7 +476,7 @@ static void dpu_kms_wait_for_commit_done(struct msm_kms *kms,
 		 * mode panels. This may be a no-op for command mode panels.
 		 */
 		trace_dpu_kms_wait_for_commit_done(DRMID(crtc));
-		ret = dpu_encoder_wait_for_event(encoder, MSM_ENC_COMMIT_DONE);
+		ret = dpu_encoder_wait_for_commit_done(encoder);
 		if (ret && ret != -EWOULDBLOCK) {
 			DPU_ERROR("wait for commit done returned %d\n", ret);
 			break;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 762e13e2df74..91cf57f72321 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -74,16 +74,6 @@ enum msm_dsi_controller {
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
-/**
- * enum msm_event_wait - type of HW events to wait for
- * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
- * @MSM_ENC_TX_COMPLETE - wait for the HW to transfer the frame to panel
- */
-enum msm_event_wait {
-	MSM_ENC_COMMIT_DONE = 0,
-	MSM_ENC_TX_COMPLETE,
-};
-
 /**
  * struct msm_display_topology - defines a display topology pipeline
  * @num_lm:       number of layer mixers used

-- 
2.39.2


