Return-Path: <linux-arm-msm+bounces-10197-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CB784E3EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 16:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B9BE1C22124
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 15:20:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBBD27B3DB;
	Thu,  8 Feb 2024 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EiyW5cYP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39AC7B3D0
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 15:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707405648; cv=none; b=uN1y8WJJHzVBCF7T+d2HcIZ9za95VWDpR6Ws/B8TPN4NJPoBUQXbTUjnatj21N3/ZeBSlotUIS9hU/+NAZVLSEpXorsDCfzHgRIwCN34PUuTOSHBaPfeqTEuq2EFpD8zUtXGHbWf4ClYTlyGAGRCSfC5F/0bMyAJZbLd7ADxMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707405648; c=relaxed/simple;
	bh=ey70PS2IywH7SltvOaCab3mg9Qug1QvbmTNCPf4cOKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PwP8/RUXEO+ipMLb3k3vG3H7Nz7xqHU8mw+LkqI79CXuoS4BoP91M7fuxbfgJuNLzFXYrPd622NW+iG3KuCUxUVKqN7+Hi7badl7/7zoVOJiWBG0+LXSarco+7Ywjx9R6ImcLuoyZDdQEaf/WXiwabi+PSBZtoHn/vPquVRCqak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EiyW5cYP; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d0a96bad85so28587731fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 07:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707405644; x=1708010444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVHRDsBozSVTDTIQzvI/7tHP/PvUiOd2kmn81YfiwrA=;
        b=EiyW5cYPy0tYs2e0Tnky6/CpDxPaonstnZGPGor0qsxyfXiBmQ1fipmXPZHlWDhfKx
         95jUpxXLlfJhZU0gOCh4DhfN+uPjAW6sa3wHTQ4bu3YYC7RByxD13fevDzzeEK+sDonM
         h//zohZhPKES/Fa5UsQl4Q/R8dwhCrDdqF4OEi9wSmy5wYiesQSnoNv5NLgmzsLIpIhv
         dQw81nx9v5Wqpjud6gGy4879ssBmYU5+vQY7yCMirWjaSF3kafXWzhRBTi39Y5eFl/et
         g8K0cIVuCudgbgavC6+PUdnE0zoGizPYjXLzM2S8r1wH6ADBMl3/0QzuS3URZiUhcyKB
         c20g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405644; x=1708010444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVHRDsBozSVTDTIQzvI/7tHP/PvUiOd2kmn81YfiwrA=;
        b=VJ0qlnKgkCWL9CTAWZXJYJ9qLcJUVgxPIWepYU+PjBpECKQ1I2c66M2egm65QyHI2J
         AnPTRP6r8igGbeapgTbYWipRvgaHJ8TW3ykb64qQvfQDTBL1MbBU3C+9y4FL/SlrhCAx
         zXiKZKPbFbEs0YybsGeRCjOOgZAPgtO+f+E8r//GTWe/MeVlFVZj1oG0W6nCryeHvWd2
         FI5c/k7f+vpZ5XCSa6qVGhkT/3b9XGlMsOboGY6GtJFjeM8pPRJ2D8le+xWM1AZUS2YJ
         ZRYvXE1pgsDBWAyDIQUppvbtDNUmrdhfPIArXBfaWRur1g67SfCK3NqkkDXTTYC2Ymtt
         59qg==
X-Gm-Message-State: AOJu0YwVOoRtUsi9fNgaO/UyUwBwSJn7WtQJwvns9TC/v7aROQlnklMG
	ImFhB0EF7VtHFTCaj/1iFTnbfzctJcNu0PxCn7Op/C7pIwCv8E01/dpAMowiB0Y=
X-Google-Smtp-Source: AGHT+IHFafh+DPG2IxBdLtB2pMPPnP/rSbL48QhFM9jqbs6aiq6VuW9Gs0cj4SxHbNYOz6dquaXeWQ==
X-Received: by 2002:a2e:a374:0:b0:2d0:c7a3:e97b with SMTP id i20-20020a2ea374000000b002d0c7a3e97bmr3306943ljn.0.1707405644341;
        Thu, 08 Feb 2024 07:20:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7T9j0KB0JK9YT2YafcATnMNHQ1u9nvl1ZsILXRMhTLGX5lhzIDmIv97Rec/tWn1HJkvK1Q3P0ytwurDZmkglKHcFRilwZo+KVb1NaD238zRftUuOKvLP0qTMKq9hX/+iGId/Wicl3S48IkYam9J5sYbcDw+WNjaRZcM4SJuHqmgkuoTQHOof9IK0FOdYZkSIdwCwIZTqZBK7F4gNGqTYjBHieR1Sw0ekzMjL4zmpCS5HoBaCP8GSC/O1c+4CBdmkkhk+R8GipyRAAzhx6oggAA69IYcpVrB4o/2PfKiuyQXJg3BixZtYpuLiB+SSa9m6kgn8Wkgq+lpRO3C8=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 07:20:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:20:42 +0200
Subject: [PATCH v4 2/5] drm/msm/dpu: split
 _dpu_encoder_resource_control_helper()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-2-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4718;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ey70PS2IywH7SltvOaCab3mg9Qug1QvbmTNCPf4cOKQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFJ/My0m+kRQpTinj3tLqK6kKjh7tGc/Cy1D
 9SJLPHjGyeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSQAKCRCLPIo+Aiko
 1WfACACOli8tarITcazT3a4/DjJW1yWEvnFGPXGr0pgFxKbaPU8KBZ3c1ml1g13Yf8Fdd2fpfAR
 Fy3B1Ns6YKrYdp3yWll66MpQlm0io6slhMwLwln4knKShlbrkQw43EyQgxd/ZrYzOMtls4OsRXF
 onv5gZwHhgWS84mG/XIwh3JwBU+vvJce3+lEWmPGzd3kgc2jvglWttMAMeZlJZ5iCGZgGILPmB6
 x7b5Yewb3q7i7lTK4V2mxEd6HuTYiyaM81gvxSNHEfJbJDlVrHAaZ3Q7pnEIwfLi9XyyZxvo1o2
 N9B5R2VVbtj6nSi7mrL5y/CHzHAGuNxI2d0utsNeMdzyLAtt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Follow the _dpu_encoder_irq_control() change and split the
_dpu_encoder_resource_control_helper() into enable and disable parts.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 45 +++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h   | 12 +++++---
 2 files changed, 37 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index e0ff7d8aa199..6cf2e186a350 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -754,8 +754,7 @@ static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
 	}
 }
 
-static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
-		bool enable)
+static void _dpu_encoder_resource_enable(struct drm_encoder *drm_enc)
 {
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
@@ -765,28 +764,42 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
 
-	trace_dpu_enc_rc_helper(DRMID(drm_enc), enable);
+	trace_dpu_enc_rc_enable(DRMID(drm_enc));
 
 	if (!dpu_enc->cur_master) {
 		DPU_ERROR("encoder master not set\n");
 		return;
 	}
 
-	if (enable) {
-		/* enable DPU core clks */
-		pm_runtime_get_sync(&dpu_kms->pdev->dev);
+	/* enable DPU core clks */
+	pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
-		/* enable all the irq */
-		_dpu_encoder_irq_enable(drm_enc);
+	/* enable all the irq */
+	_dpu_encoder_irq_enable(drm_enc);
+}
 
-	} else {
-		/* disable all the irq */
-		_dpu_encoder_irq_disable(drm_enc);
+static void _dpu_encoder_resource_disable(struct drm_encoder *drm_enc)
+{
+	struct msm_drm_private *priv;
+	struct dpu_kms *dpu_kms;
+	struct dpu_encoder_virt *dpu_enc;
 
-		/* disable DPU core clks */
-		pm_runtime_put_sync(&dpu_kms->pdev->dev);
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+	priv = drm_enc->dev->dev_private;
+	dpu_kms = to_dpu_kms(priv->kms);
+
+	trace_dpu_enc_rc_disable(DRMID(drm_enc));
+
+	if (!dpu_enc->cur_master) {
+		DPU_ERROR("encoder master not set\n");
+		return;
 	}
 
+	/* disable all the irq */
+	_dpu_encoder_irq_disable(drm_enc);
+
+	/* disable DPU core clks */
+	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
 
 static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
@@ -844,7 +857,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
 			_dpu_encoder_irq_enable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, true);
+			_dpu_encoder_resource_enable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_ON;
 
@@ -939,7 +952,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		 * and in IDLE state the resources are already disabled
 		 */
 		if (dpu_enc->rc_state == DPU_ENC_RC_STATE_PRE_OFF)
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_OFF;
 
@@ -974,7 +987,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		if (is_vid_mode)
 			_dpu_encoder_irq_disable(drm_enc);
 		else
-			_dpu_encoder_resource_control_helper(drm_enc, false);
+			_dpu_encoder_resource_disable(drm_enc);
 
 		dpu_enc->rc_state = DPU_ENC_RC_STATE_IDLE;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 95ce7647ff76..bd92fb2979aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -273,6 +273,14 @@ DEFINE_EVENT(dpu_drm_obj_template, dpu_crtc_runtime_resume,
 	TP_PROTO(uint32_t drm_id),
 	TP_ARGS(drm_id)
 );
+DEFINE_EVENT(dpu_drm_obj_template, dpu_enc_rc_enable,
+	TP_PROTO(uint32_t drm_id),
+	TP_ARGS(drm_id)
+);
+DEFINE_EVENT(dpu_drm_obj_template, dpu_enc_rc_disable,
+	TP_PROTO(uint32_t drm_id),
+	TP_ARGS(drm_id)
+);
 
 TRACE_EVENT(dpu_enc_enable,
 	TP_PROTO(uint32_t drm_id, int hdisplay, int vdisplay),
@@ -342,10 +350,6 @@ DECLARE_EVENT_CLASS(dpu_enc_id_enable_template,
 	TP_printk("id=%u, enable=%s",
 		  __entry->drm_id, __entry->enable ? "true" : "false")
 );
-DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_rc_helper,
-	TP_PROTO(uint32_t drm_id, bool enable),
-	TP_ARGS(drm_id, enable)
-);
 DEFINE_EVENT(dpu_enc_id_enable_template, dpu_enc_vblank_cb,
 	TP_PROTO(uint32_t drm_id, bool enable),
 	TP_ARGS(drm_id, enable)

-- 
2.39.2


