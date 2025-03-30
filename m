Return-Path: <linux-arm-msm+bounces-52835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D31A75AE8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 18:31:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FCEA3A6924
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Mar 2025 16:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6CFB5D477;
	Sun, 30 Mar 2025 16:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SeC7hCIc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D721CF8B
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 16:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743352288; cv=none; b=AqBGKL5f+YMczpFGrhYKtAlMkdn4Jkw/2/NrefX1/AneWz9hhGPrZj/FDMH7zR/dEmCf0zUZDcfe/S36cyFcGR9BPLCiuRrqQpEvBGVxbNQqyDnxZGS/ZRf/sm6kkVxAjf16VVU1aNF8f6Tirdeh1aFImjNd6N5OnwizzrHnLkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743352288; c=relaxed/simple;
	bh=ZptMS2YNiNc/3WQkVupNrI8hPTUmk2GcuQjiBuJrXuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FT+jKlQJOXoVgHmwUlrYubO1J4YxUAtTE9voyBp5LCAbSMLbLEl10yZnc8jQNgvUwE4UIDku26fxqsX8N1/1MaGhwnvfiZB094a0zxuKjqi4ltBAhwbl21wYUxkEzFJUOBrLCclp93S+rScpkwqOlVGZnb7jVHgQ79b2+8KeRzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SeC7hCIc; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso2110396f8f.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Mar 2025 09:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743352285; x=1743957085; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GPrHRvALzcklAe1SO2j1NA7D4uOT5LWEqFteqcGDcOQ=;
        b=SeC7hCIczNNj3oDssCLiguiBnoLqEeriIgCz+r9vhVfV3ybl0BKKaS1szoXR+Dl570
         5xVQqRivshJstO/XiFUTA8uGZ0bKeXyTGnE5n/QMPvfTQweYGcxhcGUNTppU0iRUU0jH
         cxKeppArrswPHSa1aXwVjmyB3VewAZbZmV4PMsG1UGa5/zsOvCu6zkAojznV5ys6uqLC
         XaPWuc9RXI3fH/7Vfxs2rp2tqhy8MWJHpySzY4Hn5GQLH1MCqu9v6EHWgOT1hPdaglaO
         RAEL+gg2DKvjJ1Di97o5yI8KffIC/ghf9Di/ZBdDARFg3+iZ9NRz9KE1HCpZGD2kEk95
         geGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743352285; x=1743957085;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GPrHRvALzcklAe1SO2j1NA7D4uOT5LWEqFteqcGDcOQ=;
        b=Jt9pVFyIbXpEGJSRYsT1RowzHhhjPQvYRRGTsx/mIUkyOpLNvAjNZPWE/WGeY8bOOA
         qnVRW/3IXmEsNvJEmeRBZTF9jKs62zs+K3j/vOK9NRb17qfLLJ82/ytm3EKYUYblcBLu
         8ri4lEyP0dGw7fNRXr8jCm2/ZPUW9msjEQ5Cfp17AtqBv76J1weSywMJ0K9Mak7RYS/b
         5xnLV3B5vKrgMVBuzZG3bd5NYTCXRC5UqD1Kkg4z573TJrnVnOIw3SdBRN+FNtzYKMDP
         XlanryNd+6DHg/US9+lGjqTk1lyu7AzHc2kg/3WRupc72YmGOhBVrCZDbooMQlf0uH0R
         837A==
X-Forwarded-Encrypted: i=1; AJvYcCXwpIureDClB9WHE3EM6YpFA4YUFi+4lyhbLhRf2JQHEsj3BoiRtfz0iniqXJlKe/ahK1APCkYrbc74iE/S@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb8KzWRzZ1FLOpxMU8m1EhHtzNTHmJcIs8W1uuQZZNp/ZFXmLT
	z6KIbALuUnAC3R6MnqEVzhxT9HmqBSb/a1K1rS+cIQ9YZsQek9BEe/8GaQh2HYY=
X-Gm-Gg: ASbGncsCWl8bvsAodlAV0uAtwlDtLbZjC3bgd+xv3ZeHdHUxhTxWTI58UlEp41jnn1R
	+hnZvBhzZBfnR80HMPRfLSSsrjD6jRNR/jEKAXNDZIlnC16tAJWdUM0iVsleRfqACavsOYK7EeA
	pdRgKj3E4ti+NTM6CSSrTua+LsWMU7JMS8VXenqzOxrZlFD7BVY0sE606XN7b+VUjU3gZB5dHVa
	jtKwPksGCs4YizyKn++ekWVeThz1I2fTJDKx+IvGCk5NEt0q1gOzXpA72UK4SPoW/CvvU4OcqUw
	BkgmbTVV5VGju4nFjAcPUKOsbcAACTTXCpzhkNHL9/N9Jr3U9mAXgmf2
X-Google-Smtp-Source: AGHT+IE+aqXoAXGrqH9nHVoq6TOPYkRBhIZkBrvSID1GaGZZhnTAVX8Melg3PXUUZkGfoua+IYkIhQ==
X-Received: by 2002:a05:6000:2913:b0:391:4674:b136 with SMTP id ffacd0b85a97d-39c120e21famr5115503f8f.29.1743352285029;
        Sun, 30 Mar 2025 09:31:25 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b662736sm8782789f8f.22.2025.03.30.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 09:31:24 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Sun, 30 Mar 2025 17:31:20 +0100
Subject: [PATCH v3] drm/dp: clamp PWM bit count to advertised MIN and MAX
 capabilities
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250330-wip-obbardc-qcom-t14s-oled-panel-brightness-v3-1-156801d97a8a@linaro.org>
X-B4-Tracking: v=1; b=H4sIANdx6WcC/53NTQ6CMBCG4auQrh1TChTiynsYFv0ZYRJscUpQQ
 7i7lSO4fL/F92wiIRMmcSk2wbhSohhyVKdCuNGEAYF8bqGkamSlWnjRDNFaw97B08UHLGWdIE7
 oYTYBJ7BMw7gETAlqqWSnG6ubTor8ODPe6X1otz73SGmJ/DnwVf3W/5xVQQml9q5ClFK1+jpRM
 BzPkQfR7/v+BVwnGTrnAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5287;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=ZptMS2YNiNc/3WQkVupNrI8hPTUmk2GcuQjiBuJrXuw=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn6XHYV/kWi78zjq7hEIUXXbz2H/Bp3P5/qaM//
 ysPk0W9IwqJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+lx2AAKCRBjTcTwaHBG
 +AQfD/0ZEu0c1BS/4jKKv+rAhpGxtHtFtL/7CDK4c90Dde0BI+T5VH3ulxDg3a8HMTgCM8eQ+C3
 0sax5n7KG9ub2O/9YzbKAWIDcTQGVDUvqwRK4LmPgXcJS6yUYNsz3JxxwS6tzoi3QPs2uzAuoi8
 XD6OY2EeOeGk2iqYdeaB4Cs1m5g9tN7/xZMVaxzTrgJ5yuyPeVHzOeIwt1QP4/13SIqIN19/fwQ
 ffY4R7ExpSAMNqBu+mQYIPRXEInf+HW8FbGESc+rfBxC/qxW+6RbjQakEvwhUxNYZKE1lv5oHXO
 4ISa6DASl/OxKBPCPoNZZVmTp/rmX6IM97mT3IBn920nn8o0HdjzUSA7FfNpC2mmSdYCDOHAeu6
 v3NaJBX6V7bQ9VYiPy0spfEv+nL6jNLOpBEOnIMwLFfQH/A/vNQtetl7H5Y3YBy9fX2ZtWstkmW
 9I7wDZMZ0/5Z6I/F3I1EZH46DdHYcBM1TDq4kGdJUmzT7w4S1lKv46BTAX9BQ9CpJNW4lXPa2mj
 AVqNbsU2Au1YbbciWvQ5tD16fG/HnixiQBCqPvEN9hkile/m+v7/bjjFbzRdBe6hw+p81/PgcCl
 kEB05rPGwhDFHylZmA2VOd76xapMr28o4spjJNQqS1wqSG/kni1I7F3INMjAj6quhsruReVNeGL
 Bd9BhCryrBrLoOQ==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

According to the eDP specification (VESA Embedded DisplayPort Standard
v1.4b, Section 3.3.10.2), if the value of DP_EDP_PWMGEN_BIT_COUNT is
less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, the sink is required to use
the MIN value as the effective PWM bit count.

This commit updates the logic to clamp the reported
DP_EDP_PWMGEN_BIT_COUNT to the range defined by
DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN and _CAP_MAX. This ensures correct
handling of eDP panels that report a zero PWM bit count but still
provide valid non-zero MIN and MAX capability values. Without this
clamping, brightness values may be interpreted incorrectly, leading
to a dim or non-functional backlight.

For example, the Samsung ATNA40YK20 OLED panel used in the Lenovo
ThinkPad T14s Gen6 (Snapdragon) reports a PWM bit count of 0, but
supports AUX backlight control and declares a valid 11-bit range.
Clamping ensures brightness scaling works as intended on such panels.

Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
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
 drivers/gpu/drm/display/drm_dp_helper.c | 48 ++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e2439c8a7fefe116b04aaa689b557e2387b05540..fcc26cb96a51066a503433b2dc660126155d179c 100644
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
@@ -4033,8 +4034,33 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 			    aux->name, ret);
 		return -ENODEV;
 	}
-
 	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
+	if (ret != 1) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
+			    aux->name, ret);
+		return -ENODEV;
+	}
+	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_read_byte(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret != 1) {
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
@@ -4054,29 +4080,15 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	 */
 	fxp = DIV_ROUND_CLOSEST(1000 * DP_EDP_BACKLIGHT_FREQ_BASE_KHZ, driver_pwm_freq_hz);
 
-	/* Use highest possible value of Pn for more granularity of brightness adjustment while
+	/*
+	 * Ensure frequency is within 25% of desired value.
+	 * Use highest possible value of Pn for more granularity of brightness adjustment while
 	 * satisfying the conditions below.
 	 * - Pn is in the range of Pn_min and Pn_max
 	 * - F is in the range of 1 and 255
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
-	/* Ensure frequency is within 25% of desired value */
 	fxp_min = DIV_ROUND_CLOSEST(fxp * 3, 4);
 	fxp_max = DIV_ROUND_CLOSEST(fxp * 5, 4);
 	if (fxp_min < (1 << pn_min) || (255 << pn_max) < fxp_max) {

---
base-commit: 4c4d9b7b6c6e676eca22585139aba5f03de74b90
change-id: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


