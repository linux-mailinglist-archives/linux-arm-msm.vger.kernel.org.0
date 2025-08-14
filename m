Return-Path: <linux-arm-msm+bounces-69250-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B12B26949
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 16:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F24AA5E7C60
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 14:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9874321447;
	Thu, 14 Aug 2025 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k68aH6P+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C7321444
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 14:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755180980; cv=none; b=F4f+BZdcXfn+CuQiS4dgiQTNKK/pKDbeyxxQOQfG+Y5MHKASzXxYMe0iR7UjH0iuxi3HORSKEDBOaOtrjX3TeAzgirciL+RNjGU75igU962tGtf82tR/zSrwWvUuvYwYTjmqlymppFZqGzqtYRxKFcCqlXB/7/lZAvd+MyGH+PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755180980; c=relaxed/simple;
	bh=5fbh7GksX9+VkA7DgoTm2bLoqwAqwBIrSt7D1yUJMhc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=bfaI9FtFBgfCsQWW32IhBCOXef/PGlMcTStBFtzKSrew99LE1X29oto6KeJR75Fcsajbgs6w/I5pfwcGJsRJY4TaRITzRFkuJ9xgIW773llFGsqxArS9j0r6HBB9pEIHp7tPJfUXVOP2+OA+rWRuFfePeJOMRBR2M9B9y3xvaHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k68aH6P+; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso5235135e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Aug 2025 07:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755180976; x=1755785776; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=enTAHeWTRo9eQLT5sL3CB9Qx1tAhO3uPSW9JWsk0jtU=;
        b=k68aH6P+aLfDLqqYQKZORwiICVIyx7Iju5j4nQw4XMM0ORCUjaiYyo4b5Tt4di56b9
         6qn95BjLInhOVE5OYSVSbx5SBdWl73TLfI+4ov8jzkKFaK5kokV3u0GVc/qbEsJs1YYU
         Q+iGYvCvVAY5cG6KfwilFo7Fa2l2kqKIiqfN92nNmda2Az1KWQNGKwLiMJVqYhraB/p5
         nztFkuZmDrfKruCu5hMmD2z3JzwI782tkofSJqjjz3BPGlXdzwlViDE48pe6UonvTacm
         IK+PKpkSWtBnlwcCxu0QKZUrd4/k63uf4leAIEB0430Y9iVpddfcYxAMCEdB94grnQZw
         j/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755180976; x=1755785776;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enTAHeWTRo9eQLT5sL3CB9Qx1tAhO3uPSW9JWsk0jtU=;
        b=Hei+j670zgDGT2ESVArlMwfMT6hFw/MHiU2eO3pdYlx8c0tCJlxQMCVKcOjTh/JMXD
         UCSv1DRl4jYrxkt7VNV0qAF+hDGd4t9aI0LCMgZmu0dcDhZbFQ0UBd1yFY8X3R6o9uMT
         v32v0bzCypIcenQl1g9U64PZJlp/TkPDlMXxZGgdj+8wgAl1OjLJRba7vnb5V6RgjK78
         pwz02Uw6Hu1JAdmG4/HCn9caitOH2yxn+8WyMByB5J92XmWqM9llTq4IJwoCydrBHVJ5
         LbTU0UcprcOzSDY4j/K6i4I53yMUJRXTcxr3kVjPrb5ttEx7YGrjShuYvcDZdKPn9Ew4
         9qvw==
X-Forwarded-Encrypted: i=1; AJvYcCUc5FAfFcYnBWb6QQZrR2W6W8HIBmUBQODOdIIY+4FwWVKJUW00PL0+VPKIjPN4SXrAvQj7e6ZSI9n1NXBy@vger.kernel.org
X-Gm-Message-State: AOJu0Yyca12PTMZP7Y4MlGeVyjyHk0eZmvYwSzVwkGXS614JLKkquPhW
	mdP98W6xIN60hy80lzYy21m32o1OeBmnJ73RYMuDA8yZyjYnfh36/NS3bcbJmPMtL28=
X-Gm-Gg: ASbGncsKBDRGMFnbSfYJQChjC0JJLvZmqKQrqZ8pFCSaHXuPPtNywixNYxnARp3KYkM
	uiuJ3mL/tQUTIQYnDVt1sfrm1IC7loYzn5mVHj2oto4al3EWOVV+jBtKz3m+FEVV9dLkObUlsOc
	fVIZdfSR7IYWHnyf3V733/UAvM7u1sJEHU7dg6A6U8Zy0RRpQHZkHW4q4f0Hu+RcgDFqsiVGRgd
	jUf2RN8PTVsyeIiolGSyinakUcWPZdYx7QgXygHYdprR2pJrkVRbz5SSTY8cMcbTXmGbN4NP7sl
	HOxDD3iXLFjLiZNYR+rbXidgmN3I4Cdr2kTJ1CBC1a27n0eVJZzeAO4jpkw75iaf/l73oVFoZ2f
	sNhrzgUjonptHuzL5PqZGRJDeJUazCbDrfCJNhgoezZc=
X-Google-Smtp-Source: AGHT+IHhUfl5yldyfcKxnZmAYd7Ox6/qSLrIXnCMXweR55b0I87rPZkXJK9dQDcnHeRcbasbHGUBNw==
X-Received: by 2002:a05:600c:8b5b:b0:458:bf7c:f744 with SMTP id 5b1f17b1804b1-45a1b6754d2mr24461125e9.32.1755180975528;
        Thu, 14 Aug 2025 07:16:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6fcd32sm24940215e9.22.2025.08.14.07.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:16:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 14 Aug 2025 16:16:09 +0200
Subject: [PATCH v7] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-topic-x1e80100-t14s-oled-dp-brightness-v7-1-b3d7b4dfe8c5@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKjvnWgC/x3NwQqDMAyA4VeRnBdIguK2Vxk7bDbTwGhLU0QQ3
 93i8bv8/w6uxdTh2e1QdDW3FBvGWwfT8omzooVmEJKBRumxpmwTbqx3YiKs3DumvwYMGb/F5qV
 GdUfiB+kgxIEEWiwX/dl2jV7v4zgBaxTuiHgAAAA=
X-Change-ID: 20250724-topic-x1e80100-t14s-oled-dp-brightness-0190e5201d02
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 linux-arm-msm@vger.kernel.org, 
 Christopher Obbard <christopher.obbard@linaro.org>, 
 Rui Miguel Silva <rui.silva@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7537;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=U0Z/PWROvEXhparbnVTWNTM2+mbhR9/F3cuOnvJBvy0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBone+uazZdfMQp4hW8OQZODTPFYqq9odT3Yt5GxFcU
 ndLivxSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaJ3vrgAKCRB33NvayMhJ0bT1D/
 4zoNrLGJLmkriHbhULPlj6ywvY2vjfutGE5T8hT2b0VU9+XzsZmBnev7eDGJq8CZGhfgTFZFlhHeSU
 jY5K+w4LHR0ygWANTk/Go+vEzhfk9CwdgU3G57DFR5OBFlyC6YS9g2+gw76+JCLBLG5FQWoud+78lf
 4TiVOAVC9uCerPxfTXkB85Qlr+ZVLYAk1bhsdElXG/MzBOOjN7itMD06Mu3kC2hkcjDrAJh7tc388x
 WDDQI5g/UZpBA++ABxqRNh/KnrsNiYBhZP/6m12c8cIZp9iiRC+jq01T1EhKYHFUWXUyNbhrr2toRO
 ygxHAp55Vb+acTUnjHd+HvNqazoEoDhHQ3gM0clxnkkMLnqDMKRwHZUA8pPC86NkfCyThV5bixE77j
 /LKiHnna7pWaQ6geSKh1cILHNsw4WR80ucjpmM453Q5XVbpulM3wiS1eG/Safiz0Yqwx7WCJkVTCu5
 8DoIJmnHkVoIkXZFTJAaWs2eBAQaQbkt5rRWCgdJ8uHVU/PBEZIl1muhYxnQPZGyRBE1vuOrSVQ4e6
 x2cMnh1NXN0+pWWRF7AvK82PMns2QJYv0cMyg1jMRI8jHFAWJAbrloQXLPJDMXqT8wpBtsFOPCy0h6
 wNGi5NYxwj41HHrBjaMiCsusi/P8PwT2SuNC5Q4YqHmuIbeVk1DmmD255Ecg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

From: Christopher Obbard <christopher.obbard@linaro.org>

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
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v7:
- Take in account invalid bit_count
- Write bit_count back if clamped within BIT_COUNT_CAP_MIN & BIT_COUNT_CAP_MAX 
- Link to v6: https://lore.kernel.org/all/20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v6-1-84ad1cd1078a@linaro.org 

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
 drivers/gpu/drm/display/drm_dp_helper.c | 68 ++++++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 1ecc3df7e3167d13636e194c4aab44ee8979aa11..011a493f06d4871074832ec954a05697103466b2 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -29,6 +29,7 @@
 #include <linux/init.h>
 #include <linux/iopoll.h>
 #include <linux/kernel.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/seq_file.h>
@@ -4126,22 +4127,61 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 {
 	int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
 	int ret;
-	u8 pn, pn_min, pn_max;
+	u8 pn, pn_min, pn_max, bit_count;
 
 	if (!bl->aux_set)
 		return 0;
 
-	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, &pn);
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, &bit_count);
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap: %d\n",
 			    aux->name, ret);
 		return -ENODEV;
 	}
 
-	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+	bit_count &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
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
+	if (unlikely(pn_min > pn_max)) {
+		drm_dbg_kms(aux->drm_dev, "%s: Invalid pwmgen bit count cap min/max returned: %d %d\n",
+			    aux->name, pn_min, pn_max);
+		return -EINVAL;
+	}
+
+	/*
+	 * Per VESA eDP Spec v1.4b, section 3.3.10.2:
+	 * If DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
+	 * the sink must use the MIN value as the effective PWM bit count.
+	 * Clamp the reported value to the [MIN, MAX] capability range to ensure
+	 * correct brightness scaling on compliant eDP panels.
+	 * Only enable this logic if the [MIN, MAX] range is valid in regard to Spec.
+	 */
+	pn = bit_count;
+	if (bit_count < pn_min)
+		pn = clamp(bit_count, pn_min, pn_max);
+
 	bl->max = (1 << pn) - 1;
-	if (!driver_pwm_freq_hz)
+	if (!driver_pwm_freq_hz) {
+		if (pn != bit_count)
+			goto bit_count_write_back;
+
 		return 0;
+	}
 
 	/*
 	 * Set PWM Frequency divider to match desired frequency provided by the driver.
@@ -4165,21 +4205,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
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
@@ -4197,12 +4222,17 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 			break;
 	}
 
+bit_count_write_back:
 	ret = drm_dp_dpcd_write_byte(aux, DP_EDP_PWMGEN_BIT_COUNT, pn);
 	if (ret < 0) {
 		drm_dbg_kms(aux->drm_dev, "%s: Failed to write aux pwmgen bit count: %d\n",
 			    aux->name, ret);
 		return 0;
 	}
+
+	if (!driver_pwm_freq_hz)
+		return 0;
+
 	bl->pwmgen_bit_count = pn;
 	bl->max = (1 << pn) - 1;
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250724-topic-x1e80100-t14s-oled-dp-brightness-0190e5201d02

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


