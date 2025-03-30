Return-Path: <linux-arm-msm+bounces-52847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16892A75BEC
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 21:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DEC4188AF5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 19:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC3B12BF24;
	Sun, 30 Mar 2025 19:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vm5MM3kR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7246378F51
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 19:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743363077; cv=none; b=CGBM+1V+KKaGFvCXAzYwhS+/432M1T3l7rNQCmHRG7uuJ758uN4Xs/LTZ87aoxBJ4XcXdqq2ng6GQdtznx1tN60PYO+A0+ifauNu78lKK4DsjUFwB83xr1vtZM/Fin2rE7laq2AWQe1Uctt0/GRstfrRxgOgwFQyyDYcnekulXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743363077; c=relaxed/simple;
	bh=y9ZXPnZNCRtYwGG7/6ABbS9xCKqc+s/sSflTPA+Th+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qp8JbEH170qQuL3VzpY4Q3RPcoPhprsxvCT9f7PzMb5LZXPDm3JBLIaqo7bnmj83wr9Lllpjy5TJpVcwLTXgPXsJVTiIwwlnXEU2J2CkouPh5J5gqFhqePzagRSiEPbqefs1O+88NA/Xc28iLjJtnw4u/9D3mqMFMNBnojTUOcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vm5MM3kR; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3997205e43eso3259280f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 12:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743363074; x=1743967874; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SDqK019yeshO+8g7PhIq3wTEpbXJRza7Dz3IGb5loNQ=;
        b=vm5MM3kRkcyqdNB9mGwt/EqL6mbwVcVnSbkL8qKJVbVb0ubJhf8oRUKcm4pctFlqzS
         oKAvDMxqIgABrVXx1APmQv4LdKk4bXvlOsH8JAlq28+jHYJHy8RCJPVyOGO89eRIMsRb
         t/4eaDCqDV//wyLVBhx4mExOo5swd4cuY3FVInwlR9Zoyo1e3dqI4y1Hy5UZZ40bNPVi
         M5Ta8cV+ZNZq7n9IkT2Smdm4HXQb//BOtbS+tQE+9dMyFC83PQREHOn+F9gUBd1J70Vc
         xHXt7d1WOoJAAZonZT5qC7zKm/FocgoEMjFrXNmIlQjMrHxJ5Feo+lAdJyeelwxCJozG
         kkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743363074; x=1743967874;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDqK019yeshO+8g7PhIq3wTEpbXJRza7Dz3IGb5loNQ=;
        b=XjUVlnk6XfxZ7eRQtru4MGhh3EuofVGO0+oc2ES0pZg5vEBkJWN/5vxh5+NRS+i6I+
         RfA1RgWyYWTt//Q2N22ZrTARjw9zrm9LUc5zlBgUoOsBtpGa2aymEwijLKuvGQQ4DucX
         8Ta7JEEdqbW8qUPcBfC2uD/wzWkLdjyJYwh2SZ4w84pTw/LKSN2ET+O7+tYUilFyzju6
         aWOJvLokw9HTN7Pd098TKELbvFOjxu/sSF1PDApOojLtgM0lAWCfM4Lo170qk1Juvduh
         vV/7/6TI0PcvEilWTFLAQ3UXNnu6xrMEEkUAM8KXTcjYislCKZLeyRnORhgFxig7myk4
         QmUg==
X-Forwarded-Encrypted: i=1; AJvYcCWiaJaQlmRyC1ehz8tXvCsMUN/3OVqNYkP2SfoZxVI8Zjzficy24hrM86/cK86wUOdadPryAEmAEY4ljbeM@vger.kernel.org
X-Gm-Message-State: AOJu0YwE4hqvVRi+kyCQLrEBn0lt4G2eYe592/5jdDkvHacXLm2kB8A/
	7Ap1+uhzuzh9S1cS9ZNy4Ww9PTSC9LtotxNgkbQuGbIET1R+fVzXalHCKpOV1lY=
X-Gm-Gg: ASbGnctw0tGy2cJyjFj5WY2/f8V4sUD9OsuvI2dMtliR91WmZWCUxpvqCQ+Fmx+7j30
	jVRstgKxGXHiUjXFbVYFBZv31QUJfNsnN4VLGda+BNUAymVZ33gZh7QhNDhD3Cwph2PGsRP1HZm
	KaJLJoMC9gfVZ5laC4kGxBMdX9TyX/zKEuAwLsPLzXYmtShOd26re4xr+pwgAnl5od0qQ6F6fx/
	8OZSaz4xI/WYlstlUn5ACuRC0vJlDEtmgJPmfJRSuICNcjidlqPrB+HgQ9o0Lq2o3IPM898FTkL
	QWNXNwJo1/Do7R311vlqXNmBka9FRAGvEldTiYQMC08ac/IojqLHz9O3
X-Google-Smtp-Source: AGHT+IEFCAqGYO03jhjz7bazgYv3ZrmHLvxsn+N8ZhYEwcdY3fyeGZHkmjQ/AqQTGIDhm5Ps9g+yYw==
X-Received: by 2002:a5d:47ca:0:b0:391:158f:3d59 with SMTP id ffacd0b85a97d-39c120de81dmr3921619f8f.15.1743363073700;
        Sun, 30 Mar 2025 12:31:13 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e37bsm9390988f8f.61.2025.03.30.12.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 12:31:13 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 20:31:07 +0100
Subject: [PATCH v6] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPqb6WcC/6XOTW7DIBCG4atErDvVAAbjrnqPKgt+xjaSa1ywn
 FaR716cVaus2iy/kXherqxQjlTYy+nKMm2xxDTXoZ9OzI92HghiqJsJFAqlaOESF0jO2Rw8fPj
 0DitvCqSJAix2pglcjsO4zlQKNCjQaOW0MsiquGTq4+et9naue4xlTfnrFt/Ecf1fZxPAgevgJ
 RGiaPXrFGeb03PKAztCm/yBS/wbLg9caYM8dK019g5vHsCbihtFPXYdd6E3d7h6AFcVr++MrB+
 Xove/8H3fvwFwRMqx/gEAAA==
X-Change-ID: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5745;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=y9ZXPnZNCRtYwGG7/6ABbS9xCKqc+s/sSflTPA+Th+k=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn6Zv9FhSpe7gB2hlAOaUeSB1159NZxRInsmKev
 cHFg9qAMqGJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+mb/QAKCRBjTcTwaHBG
 +L0xEACQlxoKHyeZCqq+REXM1r6N0hjgfYATr4AZ6ns43FB01Y5PhPRAP3FI5QcwD1PtfR0NHO9
 L03+vCM8mAb+7rL4VqFY4J1YOzOeCmJc/ZbmxF0OIQo5X3tZiinq9cT723LTjGdiMHNe21bnJMO
 Nv//c7anS7BJ/pMeq+ZJQyc59HEfSurCQ+UV3PPmpGY3b4q0FKQpk+pfabSY5puVtB+pftGKsFg
 biYjQVGx9xQt8QUB866AAjWLQ4hEt/0PmVEv0Rto0JPavk+J2FDODBAUytBLULFwuNnEPt4Ehkh
 x5wi1drjBPM45cHxy5z0VagJLJP37Wrd6nbVzJCYcTgEMIq0nIZ6PdPa85BemDvYWdR+SLiJ970
 vr031UsuwvbO/ylCVcX1OtoklN29v6Mu6Bdumk0TEOWA5/JzqLgyOSw68on49IHUY1/vsJb4bJ1
 43VaMlkb5iwiV23ETjO8OgFWbsOyCSbijEdAW5y/2/DMqMdui1JBhx+L/jU0Izg7isQESylPR2Q
 wZZPNnpTOUkNrIx731r8FXNeF0UqF8qOMWR8JMg8zGRB3x7HmTo8855IjmIUMBMSCSkjzByWwJl
 Bf0h76zMQaLUTCrvAsSLjGH2eSmh+ZyTyIAg2K1P+9RCA5ZYaLC5YA8DZyLoPPFYP1EzuM6ZtAg
 4IB3Y3zpTA/xSjA==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

According to the eDP specification (VESA Embedded DisplayPort Standard
v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
the MIN value as the effective PWM bit count.

This commit updates the logic to clamp the reported
DP_EDP_PWMGEN_BIT_COUNT to the range defined by _CAP_MIN and _CAP_MAX.

As part of this change, the behavior is modified such that reading both
_CAP_MIN and _CAP_MAX registers is now required to succeed, otherwise
bl->max value could end up being not set although
drm_edp_backlight_probe_max() returned success.

This ensures correct handling of eDP panels that report a zero PWM
bit count but still provide valid non-zero MIN and MAX capability
values. Without this clamping, brightness values may be interpreted
incorrectly, leading to a dim or non-functional backlight.

For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
supports AUX backlight control and declares a valid 11-bit range.
Clamping ensures brightness scaling works as intended on such panels.

Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v6:
- Update commit message around chaning reading PWMGEN_BIT_COUNT_CAP_MIN
  and _CAP_MAX to be required.
- Link to v5: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v5-1-25083d9732fc@linaro.org

Changes in v5:
- Correctly check return value when reading PWMGEN_BIT_COUNT_CAP_MIN
  and _CAP_MAX.
- Link to v4: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v4-1-85ef0991bdf8@linaro.org

Changes in v4:
- Remove unrelated whitespace changes.
- Remove unrelated commit change.
- Add note to commit message about changing read of PWMGEN_BIT_COUNT_CAP_MIN
  and _CAP__MAX from optional to required.
- Link to v3: https://lore.kernel.org/r/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org

Changes in v3:
- Properly rebase patch on top of latest version of drm-misc-next.
- Make patch more generic by clamping PWM bit count to advertised MIN
  and MAX capabilities (suggested by Dmitry).
- Link to v2: https://lore.kernel.org/r/20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org

Changes in v2:
- Split backlight brightness patch from T14s OLED enablement series.
- Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
- Rework commit message to reference eDP spec.
- Rebase on drm-misc-next.
- Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
---
 drivers/gpu/drm/display/drm_dp_helper.c | 42 +++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e2439c8a7fefe116b04aaa689b557e2387b05540..5550c40310c55ee275b3ebec08a7500cab38ae78 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -28,6 +28,7 @@
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
@@ -4035,6 +4036,32 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	}
 
 	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
+	if (ret < 0) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
+			    aux->name, ret);
+		return -ENODEV;
+	}
+	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret < 0) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
+			    aux->name, ret);
+		return -ENODEV;
+	}
+	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	/*
+	 * Per VESA eDP Spec v1.4b, section 3.3.10.2:
+	 * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
+	 * the sink must use the MIN value as the effective PWM bit count.
+	 * Clamp the reported value to the [MIN, MAX] capability range to ensure
+	 * correct brightness scaling on compliant eDP panels.
+	 */
+	pn = clamp(pn, pn_min, pn_max);
+
 	bl->max = (1 << pn) - 1;
 	if (!driver_pwm_freq_hz)
 		return 0;
@@ -4061,21 +4088,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	 * - FxP is within 25% of desired value.
 	 *   Note: 25% is arbitrary value and may need some tweak.
 	 */
-	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
-	if (ret < 0) {
-		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
-			    aux->name, ret);
-		return 0;
-	}
-	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
-	if (ret < 0) {
-		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
-			    aux->name, ret);
-		return 0;
-	}
-	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
-	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
-
 	/* Ensure frequency is within 25% of desired value */
 	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
 	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);

---
base-commit: 4c4d9b7b6c6e676eca22585139aba5f03de74b90
change-id: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


