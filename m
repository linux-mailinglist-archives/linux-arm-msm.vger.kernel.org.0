Return-Path: <linux-arm-msm+bounces-35057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ED69A493D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 23:50:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 645CB1C2229B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 21:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 466521922ED;
	Fri, 18 Oct 2024 21:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kemSWovo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCD0191F86
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 21:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729288173; cv=none; b=Sukav7554Q9ZAivxH5yDOV8QBLvMwspHgotmQvM0p0C42ON7NAB9qJQkVuakymr7JSRP3XaiZh6vpNmsdUZUCxz8OtohBG0MxqtmyzAMUrCRPUGP/zS1CboMQYz8eSie+4phFoP1JToBFpeBG5f1isF/HoIIZT2Bz/bZZT2MnEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729288173; c=relaxed/simple;
	bh=ugTosUslB7wYiUqpHQuS1lhI0s68LhvrkUMBV1pOZG0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qFTSW1B96jB9d8VeY4gGnt3acM0DpAZ0CCQZg+IkNgLCIKeMKOvKJkNPlvYelfAyk6WEkL8n0UZaMsLpKfaQgLk4vOTYupWIdcH82PH+g4nJ0mOcRjHmM/loRwF8wHVkAeityJpg71V8nypVJs2TXTMy8ncIqNpMJCqcWE5+fns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kemSWovo; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb5638dd57so29824901fa.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Oct 2024 14:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729288169; x=1729892969; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7DkvTcvtzrj+vI5w26rcakY7Zkomm18gg55vGgQd3cg=;
        b=kemSWovoxGx6UMT3WhsSxWD5YdpmmmfDATNJwMyjWkIvCg5M4vaLZRVuBRKn3xXt2/
         kYhGx/GIxU21lX4LI7pbsIkndBI9THzI04L6ELOSm/nwmp9ciXDypP6H7bNMTLG0tzk5
         maalTOXLjSZqSQcDLUXOU0jSpSxB9EvgpAjYnGLNrHBsj9eKGkdVOaOqAvG7OyXQCybS
         s9sbBQNzkbRi1LnYCjfHoNaXnY6hNNRpuPJEXejYPI7HHMwhpSdQmpc1TCNa+SjkF03N
         gqOKRNUcVCCRGnbHrhW+EAZ7jv3m15jh1SQAXKg51q5JrcgBfI3UuDv5thDvm/Goe6Y4
         YRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729288169; x=1729892969;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7DkvTcvtzrj+vI5w26rcakY7Zkomm18gg55vGgQd3cg=;
        b=CKEMeAr0ZMK9uNpFpZ5g3LnWDiHAXUpCkoMDGez8idUj6Sd4JsfTG3C/ZBWQrw8WfW
         jNvNQZbiatDGGXcYz3sowLjLajjW1Atn6cSQzZvApZ/2RdNZovJcLn0jqf6qDDr4r6xP
         klVUyZ/0Jaqj3wO1Ds+pjdOU12rnr5/H9bofW8XX40xP0tcuJDqvVi92BmhAksK2gdJn
         VrJw/atiIpkD1h9AvNS3Ilt101QGI8IgwtTPdzNaDVwJzuxLz3yMgu/dtCwZCb3KOICU
         yagj4Lmj06KQ4nOV5Y+YNKCFbfJab8QWHeYeRfiDVMfBfxGQ5ues5wm8rU1t0KNnG9Ap
         mWfg==
X-Forwarded-Encrypted: i=1; AJvYcCWh5nOSp6tVUQmXfrN9AfEBLfK2t0bN9cV0UZSbB/MeCwgY2FPQ5lRMOSJMpje6gsimbqDD9y9dc9Ogo2aa@vger.kernel.org
X-Gm-Message-State: AOJu0YyABdiOd8kUloBRUfpO7FQahiuAp00022znvrlLgj16O4C+fmrd
	RFJqX7/LfM8fXU8LHV8XvWEk145hy0rEK1FOETNF7BxVe3AFy0B1Mt3iPjIhOKc=
X-Google-Smtp-Source: AGHT+IEdC8loWBskIO3ec47CgiS3ugrBsDjwPbv5xYeMyu2Akw/gZ0odKdi14u5bdzJYJeWuO3Cw1Q==
X-Received: by 2002:a05:6512:2396:b0:536:54df:bffa with SMTP id 2adb3069b0e04-53a1544c1e8mr2768234e87.45.1729288168661;
        Fri, 18 Oct 2024 14:49:28 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0ce5sm332088e87.181.2024.10.18.14.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 14:49:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 19 Oct 2024 00:49:16 +0300
Subject: [PATCH 5/6] drm/msm/dp: migrate the ycbcr_420_allowed to
 drm_bridge
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241019-bridge-yuv420-v1-5-d74efac9e4e6@linaro.org>
References: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
In-Reply-To: <20241019-bridge-yuv420-v1-0-d74efac9e4e6@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3851;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ugTosUslB7wYiUqpHQuS1lhI0s68LhvrkUMBV1pOZG0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEtfdCMWS3IEeYl04oBE5MQmiiYn7fcPZlBXfM
 P3seFVF/PuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLX3QAKCRCLPIo+Aiko
 1YMjB/wMXVy2Q15F0LL8KfsS+vI2vd9tB7X/2igt44qCY9V/YD7aYTGLdxLWdbcDrxQN5u9Mcwh
 zw1Jv6DFYlV1pFvCsNZUscq3eBivP0SSQWq5ASyu5y3KpXIEb4LIrWQdCuo34zNSNp1O2VqZUXc
 aYJwBkRlnW3GxmOtYp9V2o4IjKVWglBgHxctzLV0EQQshkTvWjUwSb2YjpNllMgZrQy2BU3cARG
 2dxcJfnRCBNhorNeFbjps9ZBZo8NZXiehcXpL/MdalVwzWtwjA9OJjrheMeOKcDpuhRwk2hc/fC
 YODvL7pzINueMvI4JEybtw/B2labB9J/5nnSUiYnYiJ89NYl
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Instead of forcing the ycbcr_420_allowed flag to be set on the created
drm_connector, set it on the drm_bridge instance and allow
drm_bridge_connecgtor to propagate it to the drm_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  4 ++--
 drivers/gpu/drm/msm/dp/dp_drm.c     | 10 ++++------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  7 ++++---
 3 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index e1228fb093ee..0ddd8abca499 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1467,14 +1467,14 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
 
 	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
 
-	ret = dp_bridge_init(dp_display, dev, encoder);
+	ret = dp_bridge_init(dp_display, dev, encoder, yuv_supported);
 	if (ret) {
 		DRM_DEV_ERROR(dev->dev,
 			"failed to create dp bridge: %d\n", ret);
 		return ret;
 	}
 
-	dp_display->connector = dp_drm_connector_init(dp_display, encoder, yuv_supported);
+	dp_display->connector = dp_drm_connector_init(dp_display, encoder);
 	if (IS_ERR(dp_display->connector)) {
 		ret = PTR_ERR(dp_display->connector);
 		DRM_DEV_ERROR(dev->dev,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 1b9be5bd97f1..7eb1621f9e7f 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -289,7 +289,7 @@ static const struct drm_bridge_funcs edp_bridge_ops = {
 };
 
 int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
-			struct drm_encoder *encoder)
+		   struct drm_encoder *encoder, bool yuv_supported)
 {
 	int rc;
 	struct msm_dp_bridge *dp_bridge;
@@ -304,6 +304,7 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 	bridge = &dp_bridge->bridge;
 	bridge->funcs = dp_display->is_edp ? &edp_bridge_ops : &dp_bridge_ops;
 	bridge->type = dp_display->connector_type;
+	bridge->ycbcr_420_allowed = yuv_supported;
 
 	/*
 	 * Many ops only make sense for DP. Why?
@@ -351,8 +352,8 @@ int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
 }
 
 /* connector initialization */
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
-					    bool yuv_supported)
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display,
+					    struct drm_encoder *encoder)
 {
 	struct drm_connector *connector = NULL;
 
@@ -363,9 +364,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct dr
 	if (!dp_display->is_edp)
 		drm_connector_attach_dp_subconnector_property(connector);
 
-	if (yuv_supported)
-		connector->ycbcr_420_allowed = true;
-
 	drm_connector_attach_encoder(connector, encoder);
 
 	return connector;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 45e57ac25a4d..ae632fcc407c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -19,10 +19,11 @@ struct msm_dp_bridge {
 
 #define to_dp_bridge(x)     container_of((x), struct msm_dp_bridge, bridge)
 
-struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display, struct drm_encoder *encoder,
-					    bool yuv_supported);
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display,
+					    struct drm_encoder *encoder);
 int dp_bridge_init(struct msm_dp *dp_display, struct drm_device *dev,
-			struct drm_encoder *encoder);
+		   struct drm_encoder *encoder,
+		   bool yuv_supported);
 
 void dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 			     struct drm_bridge_state *old_bridge_state);

-- 
2.39.5


