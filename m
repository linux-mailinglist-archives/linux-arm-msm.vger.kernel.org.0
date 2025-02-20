Return-Path: <linux-arm-msm+bounces-48663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C14A3D80F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:16:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AC543B1B06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1DF1F2C56;
	Thu, 20 Feb 2025 11:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J844hpP7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F47A1F4613
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740050111; cv=none; b=MEk2kBinTJbwD0ySkgQnGhXu8xIkYYrm67GiPkB073PZUs8awPOcjTKxG2Yg6BLhE7kvh1SwjJpoXeI1YsGrqqCVWKCVSYKHD5LXzdRF6jdPRFY/pWK6CV5L9XUr12ovQ00kYZh+rwxmS0fkIjzVpuSWLUoAH5oxfExBDpxhg4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740050111; c=relaxed/simple;
	bh=sd81US2AbqPojIDQwuSaetI1ujs5Ko+pXwBs3VRaHGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QLltybe8PX6c+iqSotroSmspTK3QebuRoTe1isGC0ciH3hLVN5/hif+1z2sLvD4yLxGLFqDRL37DX7iOXgVHwmLUwhvrzs0HR86c7y6DUw87EiPRUlHoBmk2RB67+yarP4mb1XcaFoINktAXRyK1RZG+kmCwBpfQ8cjihbWL2ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J844hpP7; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-543d8badc30so1011381e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 03:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740050107; x=1740654907; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=atkE0DuTwytlFBGYlZ0GLoUvtN43x5D45gLKOUS3e3I=;
        b=J844hpP7zXL8UyTZOhKNL1Tgpietyg2gDlHJqpUidrSHzSXAhdjQL7WarK70KjWXvs
         8ev2jSP36nbHntm1oElu5AGQwin+RxLKm2if21z4WlVYS52qMwVRTUGu3h7k2HiL+3Lj
         n+DdV6Y/dOSByPThG4bq3kZTBKbAYXcQQmSOrSkYcxBr/N2D1vF9VhvicIKb8vYiPwaF
         UryD7CgPP8PZ3dEkZ6ywqX3HPkUUu9+7T5i/YpgD7pOuSn8alzecdpvjfD1mFDzfFwdX
         GNhmDr+ht7Q4pWgvTapjOmQeFYUMeUqwSBShBEw5tO6mwx7U+coPw5ChNl0MdidUBUCr
         M8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740050107; x=1740654907;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atkE0DuTwytlFBGYlZ0GLoUvtN43x5D45gLKOUS3e3I=;
        b=ApCKhvql3mLNzg6ca0zTTZZnduyqbsUfxM27EcT3j2aid8hQGMQFjvG941vMmXAN66
         NMg9vy64bhPDjrIEGWcL4GQdpLeJAaTAWjQIvfr6CMgwz2Tdg1tjgPlKQqWIVkp+I1dt
         2eIdKAOW/MRlQ23+/ctg/4yZJGZd5REulgUbIbooLbSMrfC0fwyPSToPQu4SwkGI9anB
         YnUyfB03paiGxyxVswd9ZrG+IwII11xPDNTa7APmO5OlKy6WBcStxqF+g8XOw3W5etHo
         d8E2iK3U97H1Jp6yKuvGbdzeXwfTuDyFFVo2eFs9oB1/3wSzriZEzxtE7KeKwzLvFd5r
         feNA==
X-Gm-Message-State: AOJu0YyQO5GZYqo9Gh0hAWPqsFuNqCOaspXXjnmw7Fdikh6MQy7q2Mx4
	8VSwBvgxvVA38jHNDbE9IjvObhzNmBdFy263dn/wnxjej1rlZ3Rtnn5dAxcdiWc=
X-Gm-Gg: ASbGnct0GzaPwKGMymlXlhUeulAzJ+HzgYGGjwKBwiP3YfH9cipumjSGtTPeBt4Lnok
	Z31aAYFpeYICY28QvIT4+eprO6O7CvHgMUPwswKhU+iPNnKmhLXZL1E52mI8UEY6x8nwQY6xQ4p
	tQyPBo2rL3tQVc4jI0Dhf5ZR+hu2dquV35K+72vvMpcNiDoeOuUwkeuiZbGW/WQDCGjNagXVpx4
	yDf09n/+b+EI8gvuUI5RncTyBcZfQ4tzWOTqkFi8ba6jdWDAPRDIAT5B9KxhxnCn0GtYxpo8b24
	ueUxJU/Yx0IMYKZcoDsxNGM=
X-Google-Smtp-Source: AGHT+IGeL3hIO5IEL/UFM93w49MRwYtCVueI+BviXB8wj/vAF/fCqwh+GCrLx80hGd4UkPc4SzjieQ==
X-Received: by 2002:a05:6512:e97:b0:545:56c:36c7 with SMTP id 2adb3069b0e04-5452fe86dddmr6819562e87.41.1740050107328;
        Thu, 20 Feb 2025 03:15:07 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545297856c6sm2056164e87.142.2025.02.20.03.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 03:15:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 20 Feb 2025 13:14:47 +0200
Subject: [PATCH v2 5/7] drm/msm/mdp4: move move_valid callback to
 lcdc_encoder
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-fd-mdp4-lvds-v2-5-15afe5578a31@linaro.org>
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4269;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=sd81US2AbqPojIDQwuSaetI1ujs5Ko+pXwBs3VRaHGk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBntw6rTPm+AqJ3Oe00AJ8yppJULkHQ9dKbM/18U
 NNC9+ZJDDaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ7cOqwAKCRCLPIo+Aiko
 1UEECACKjmUdHIogEsc92biZ7CHLmnmFDJoK5DYBGMrRoc0gq30rOLHn/DGpybnuVUOoTRhcCQ/
 srxTbAtPHYKz5GPZ6HU0nzSuZXLeXlZa/Ai98jYxQvVyvkSayLovY3UkjzoHNOyXfwc38FLIPvM
 UIMP/EawAuFJbkq5PFnq1nTdWXtjlEIS+cmao+5TlRnb4Gbgw5l6KI1unJiMLewApO8qtZaYaGI
 3Qr0lVOLugDL+admaJR4HlV1P6LFCZnMPDwaYuDVzuhgww34I9LV303cDXMY2wBVZnDFH5d14j0
 WWj6ag03DsV2nNjKI2J0brnn0vx8z7++w82J9fjQuvZwj+rQ
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

We can check the LCDC clock directly from the LCDC encoder driver, so
remove it from the LVDS connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
 3 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
index b8bdc3712c73b14f3547dce3439a895e3d10f193..e0380d3b7e0cee99c4c376bf6369887106f44ede 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
@@ -191,7 +191,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
 long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node);
 
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
index db93795916cdaa87ac8e61d3b44c2dadac10fd9e..cfcedd8a635cf0297365e845ef415a8f0d553183 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
@@ -348,19 +348,32 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
 	mdp4_lcdc_encoder->enabled = true;
 }
 
+static enum drm_mode_status
+mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
+		const struct drm_display_mode *mode)
+{
+	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
+			to_mdp4_lcdc_encoder(encoder);
+	long actual, requested;
+
+	requested = 1000 * mode->clock;
+	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
+
+	DBG("requested=%ld, actual=%ld", requested, actual);
+
+	if (actual != requested)
+		return MODE_CLOCK_RANGE;
+
+	return MODE_OK;
+}
+
 static const struct drm_encoder_helper_funcs mdp4_lcdc_encoder_helper_funcs = {
 	.mode_set = mdp4_lcdc_encoder_mode_set,
 	.disable = mdp4_lcdc_encoder_disable,
 	.enable = mdp4_lcdc_encoder_enable,
+	.mode_valid = mdp4_lcdc_encoder_mode_valid,
 };
 
-long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate)
-{
-	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
-			to_mdp4_lcdc_encoder(encoder);
-	return clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, rate);
-}
-
 /* initialize encoder */
 struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
 		struct device_node *panel_node)
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
index 52e728181b523cc3380d7718b5956e7e2dbd4cad..4755eb13ef79f313d2be088145c8cd2e615226fe 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c
@@ -56,26 +56,6 @@ static int mdp4_lvds_connector_get_modes(struct drm_connector *connector)
 	return ret;
 }
 
-static enum drm_mode_status
-mdp4_lvds_connector_mode_valid(struct drm_connector *connector,
-			       const struct drm_display_mode *mode)
-{
-	struct mdp4_lvds_connector *mdp4_lvds_connector =
-			to_mdp4_lvds_connector(connector);
-	struct drm_encoder *encoder = mdp4_lvds_connector->encoder;
-	long actual, requested;
-
-	requested = 1000 * mode->clock;
-	actual = mdp4_lcdc_round_pixclk(encoder, requested);
-
-	DBG("requested=%ld, actual=%ld", requested, actual);
-
-	if (actual != requested)
-		return MODE_CLOCK_RANGE;
-
-	return MODE_OK;
-}
-
 static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 	.detect = mdp4_lvds_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
@@ -87,7 +67,6 @@ static const struct drm_connector_funcs mdp4_lvds_connector_funcs = {
 
 static const struct drm_connector_helper_funcs mdp4_lvds_connector_helper_funcs = {
 	.get_modes = mdp4_lvds_connector_get_modes,
-	.mode_valid = mdp4_lvds_connector_mode_valid,
 };
 
 /* initialize connector */

-- 
2.39.5


