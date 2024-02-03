Return-Path: <linux-arm-msm+bounces-9705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE40848694
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 14:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C11C286484
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Feb 2024 13:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A1C5D8FB;
	Sat,  3 Feb 2024 13:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MHhDhSAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72775D733
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Feb 2024 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706968051; cv=none; b=ZWIloXRJI6J1wSXmEXVroCmhLGtBFeYRQU8posQCX5Bpj8BBYfQX0xi3EJZtfUXxZvSqAc0geL3Gm4NOo7UOn0Jt7fz1SiAswLRiiQgA/y5B94gsBs8IR4Xbwb6cC76F9U/VxU5I/IOUpij0z2a3ALX08qoSxTAYkgzZXVAV1T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706968051; c=relaxed/simple;
	bh=uYr58wgFc5nItKc5X4u2aBvF0R7wzlYmYT4bOMAqMYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LBlgpu0g7BG2/bHyxpi2xuGDSZ4TyN7r3cY3su9KMuXitiG06hUekAp8+Zwb/EbDzLaVDinpkViO6MOn74NaJvB0g2kJG+Q++ogqgWEXnRD+5m6jQHKesZ35wi0cQLat9tUCHuP1wptfEInKBt2jecH4QmeKzya13CS1PlOS9P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MHhDhSAh; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5113a97a565so1645274e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Feb 2024 05:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706968048; x=1707572848; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pw5pFN7i641hIu8JSJl2aLirgM2QU5HnN7Q1+QEDosg=;
        b=MHhDhSAhcObp+I3HZtMgyor66Djro97AtnbRAWz93Y7NYVaZ3a1CPgEXltGonvJHga
         hEUFcMOFE4hFEEr7DikUMGwSPFQp6Pl183frbu/a5P+PcdZGyCxLEtE4j2++pX/bnoFj
         z7JdHp5wSjiO4W9OQ6Mj2gDWd7nKjkGfBFwYYhtbAqzkdW0p0pV1eGa1syQlPEviEIbG
         wvlAxR9OkRgbh7nTFA9lNyQDFgtkpF7BkfYsNKnIkeq439gorMd8IWXOPWeNmZ3pOWGW
         pTsefsnQhBbyhKsXMGo5Rcngszt9UdVvLa6Il/8AkBb72IE9dan7x9jmDfiUxqLMzDqH
         lgqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706968048; x=1707572848;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pw5pFN7i641hIu8JSJl2aLirgM2QU5HnN7Q1+QEDosg=;
        b=Yk+YBOjGbfO/TsWgGz028UnsQ34OFjbR8SUaBGmf5PtckqVg8OJTOuEWED3D54Zeoq
         F6tZDUgUNPVFf+aLzPuihYLlb2VzjQjOi7l+SjkqlpA/6c4jeg0YsZfcUqvjA2vJi/rA
         PksUozCG1j1BoXAnZwgBBnrEOEKY5m7DsgNUXiq30EoJ+p7ZJPeTJ3WkDvXiTCUlFs0W
         zr/S0Wm+N/kv8NhA1SZ3I6MUU1rTwGpmHxFC7xdsAiN9YqWv6hj1qLq6hu55BrsMux9e
         3FjEWs7W8fxNT64AsKX6PkVXrsmnwJKCEXI2sy1nOfb21ES5KrZnc7y1lDIB0+SRFKyM
         I5/A==
X-Gm-Message-State: AOJu0YyyjWS1+fabme6dQhX+Ak/JoU5iXdlh7CsOFqn/eE/Q5fx7iiYH
	isZ80vNTjZJwIwxV0N2KGTeIZwqxdEjjazqWvkHugcNchuz1YDhO4PqFF3cMaFU=
X-Google-Smtp-Source: AGHT+IEszdnDIn/Y5wPJVYvshohWKpTy3aZ8P4gLhxlbyuJBsxd7yMonStPFPg6uvroOanJh5C/Dow==
X-Received: by 2002:ac2:43c8:0:b0:511:4860:425f with SMTP id u8-20020ac243c8000000b005114860425fmr609160lfl.17.1706968047668;
        Sat, 03 Feb 2024 05:47:27 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXTzGT4XGIU5jd7krQi2gTAInO1eTDD20AYIXqfFy5sHfnr6wXKfYdHPN2DPwLX8xEXUzhmHZNIYZ+Vg62dEa14fxmr9sEJl1LTznOnCiBJCHXEJsdsNdES3Lb6HHTPgY27viWNJAeZ9SXs8yma1ut+TOccUiXWmUKM76iEVWXpFIcFbj/M3SXt9J20Xgvjw8VZrsPh6l0tAZ4QWGbt4PJRY1GaEZueieb3+ktbgSW4Rs+SApKjrW81U92cfzhScJMcK4XAl46J2chKvNecuU/io6tlW2suMWxGwGwKv7vt3Hl5aBNu/UJM1g6aTXm4ONMG+lgDLTcW4q9OTTYQSvS68YD+FT6U2tQmVKKEh9kDbfYIjVZ4tgKL7LvUMUjWROiaaGSiPMU1Y3sP4CgRnM2RLOkJLKRfqf4G41NbMIc1c26j9yVAvu8=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c29-20020a19655d000000b00511480138f6sm130173lfj.8.2024.02.03.05.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 05:47:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 03 Feb 2024 15:47:25 +0200
Subject: [PATCH] drm/msm/dp: allow voltage swing / pre emphasis of 3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240203-dp-swing-3-v1-1-6545e1706196@linaro.org>
X-B4-Tracking: v=1; b=H4sIAOxDvmUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDIwNj3ZQC3eLyzLx0XWPdJDOTtLTkVBND0xRLJaCGgqLUtMwKsGHRsbW
 1AIEJIy5cAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4768;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=uYr58wgFc5nItKc5X4u2aBvF0R7wzlYmYT4bOMAqMYs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlvkPuKfIwae5yOn0QbddgFmxk+UYA5FqHO4DUU
 Diw2DiIa9mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZb5D7gAKCRCLPIo+Aiko
 1eEzCACD7jF8Vz2stVzLH7NleE0wqUGkLFPAg5AdLNQHQKk1CxAE/eWIZ3Hz3D00IrDNcesJNI1
 Rk+//3ghboGBEKE/fu67fo/Shj+HoV6uvmMCjq3/Gd0iBr/SLQF1/ux8QDWJv0V0DxBgCY69OuC
 4ufMn80d/zsBP0td/ZQKgs18nKO7E28Rm2Qzag5NZCP52YmfNXdy8tBlFxL/VZLxpATnG8v1P6q
 tLk14UcCVkPXyXqVUQF2Gc1qQwz0qHhksAqOCF1xg4r/BvyYu1VAjMYsYh+nGnpsXO9dJwjhm9e
 7juD87ThD/cZ4VAlyC1FKXlsljqBkzDLFBlvkeEEJZj33v2s
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Both dp_link_adjust_levels() and dp_ctrl_update_vx_px() limit swing and
pre-emphasis to 2, while the real maximum value for the sum of the
voltage swing and pre-emphasis is 3. Fix the DP code to remove this
limitation.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c |  6 +++---
 drivers/gpu/drm/msm/dp/dp_link.c | 22 +++++++++++-----------
 drivers/gpu/drm/msm/dp/dp_link.h | 14 +-------------
 3 files changed, 15 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 77a8d9366ed7..26241970019f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1024,14 +1024,14 @@ static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
 	if (ret)
 		return ret;
 
-	if (voltage_swing_level >= DP_TRAIN_VOLTAGE_SWING_MAX) {
+	if (voltage_swing_level >= DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(ctrl->drm_dev,
 				"max. voltage swing level reached %d\n",
 				voltage_swing_level);
 		max_level_reached |= DP_TRAIN_MAX_SWING_REACHED;
 	}
 
-	if (pre_emphasis_level >= DP_TRAIN_PRE_EMPHASIS_MAX) {
+	if (pre_emphasis_level >= DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(ctrl->drm_dev,
 				"max. pre-emphasis level reached %d\n",
 				pre_emphasis_level);
@@ -1122,7 +1122,7 @@ static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl,
 		}
 
 		if (ctrl->link->phy_params.v_level >=
-			DP_TRAIN_VOLTAGE_SWING_MAX) {
+			DP_TRAIN_LEVEL_MAX) {
 			DRM_ERROR_RATELIMITED("max v_level reached\n");
 			return -EAGAIN;
 		}
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 98427d45e9a7..e7da0571ecff 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1107,6 +1107,7 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
 int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
 {
 	int i;
+	u8 max_p_level;
 	int v_max = 0, p_max = 0;
 	struct dp_link_private *link;
 
@@ -1138,30 +1139,29 @@ int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
 	 * Adjust the voltage swing and pre-emphasis level combination to within
 	 * the allowable range.
 	 */
-	if (dp_link->phy_params.v_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
+	if (dp_link->phy_params.v_level > DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested vSwingLevel=%d, change to %d\n",
 			dp_link->phy_params.v_level,
-			DP_TRAIN_VOLTAGE_SWING_MAX);
-		dp_link->phy_params.v_level = DP_TRAIN_VOLTAGE_SWING_MAX;
+			DP_TRAIN_LEVEL_MAX);
+		dp_link->phy_params.v_level = DP_TRAIN_LEVEL_MAX;
 	}
 
-	if (dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_MAX) {
+	if (dp_link->phy_params.p_level > DP_TRAIN_LEVEL_MAX) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested preEmphasisLevel=%d, change to %d\n",
 			dp_link->phy_params.p_level,
-			DP_TRAIN_PRE_EMPHASIS_MAX);
-		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_MAX;
+			DP_TRAIN_LEVEL_MAX);
+		dp_link->phy_params.p_level = DP_TRAIN_LEVEL_MAX;
 	}
 
-	if ((dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_LVL_1)
-		&& (dp_link->phy_params.v_level ==
-			DP_TRAIN_VOLTAGE_SWING_LVL_2)) {
+	max_p_level = DP_TRAIN_LEVEL_MAX - dp_link->phy_params.v_level;
+	if (dp_link->phy_params.p_level > max_p_level) {
 		drm_dbg_dp(link->drm_dev,
 			"Requested preEmphasisLevel=%d, change to %d\n",
 			dp_link->phy_params.p_level,
-			DP_TRAIN_PRE_EMPHASIS_LVL_1);
-		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_LVL_1;
+			max_p_level);
+		dp_link->phy_params.p_level = max_p_level;
 	}
 
 	drm_dbg_dp(link->drm_dev, "adjusted: v_level=%d, p_level=%d\n",
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 9dd4dd926530..79c3a02b8dac 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -19,19 +19,7 @@ struct dp_link_info {
 	unsigned long capabilities;
 };
 
-enum dp_link_voltage_level {
-	DP_TRAIN_VOLTAGE_SWING_LVL_0	= 0,
-	DP_TRAIN_VOLTAGE_SWING_LVL_1	= 1,
-	DP_TRAIN_VOLTAGE_SWING_LVL_2	= 2,
-	DP_TRAIN_VOLTAGE_SWING_MAX	= DP_TRAIN_VOLTAGE_SWING_LVL_2,
-};
-
-enum dp_link_preemaphasis_level {
-	DP_TRAIN_PRE_EMPHASIS_LVL_0	= 0,
-	DP_TRAIN_PRE_EMPHASIS_LVL_1	= 1,
-	DP_TRAIN_PRE_EMPHASIS_LVL_2	= 2,
-	DP_TRAIN_PRE_EMPHASIS_MAX	= DP_TRAIN_PRE_EMPHASIS_LVL_2,
-};
+#define DP_TRAIN_LEVEL_MAX	3
 
 struct dp_link_test_video {
 	u32 test_video_pattern;

---
base-commit: 41d66f96d0f15a0a2ad6fa2208f6bac1a66cbd52
change-id: 20240203-dp-swing-3-b64ffce415d9

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


