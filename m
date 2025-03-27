Return-Path: <linux-arm-msm+bounces-52677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EC2A73A52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 18:25:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C14816663B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 17:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60D0320F08F;
	Thu, 27 Mar 2025 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q1t7if+6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32F1DFF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 17:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096322; cv=none; b=tAc2jmBh/HMcCf/h024JmjUhRFETvdR7U0hUeJR0s84fXudldcEKfQmS5mMgbsc6FyvI5Xk+fJpKs0g3OcHX7x1ppA0F+7HAOjVLGlN4rvmxgGsfrdWx75AgdSrpYc0jB3UcaSwoJ6vvgfLq/XnH+hVbDD3ZiQ/wMnyAdqOW45E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096322; c=relaxed/simple;
	bh=/2xRSARzKGQ4h11CgHv2bq7msP9g4VI83b030w4wYFo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=CHL1nHUUc6QmNzmIyi1gRwCU+OHbjkZWmClRrgrBbliGRHbINDLQ9fqmbDAzMgn6OnahzACappyYHpAAUhXk4y4tynDFzSLD1CBDva3JeXaefF1RjKQggH5OgXSgSPh/s3jJM/SNT9CtC7tYDit/6+I9n9fT/MAnZgLfr1HNNPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q1t7if+6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394036c0efso8914365e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 10:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743096319; x=1743701119; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFNNjaE2jorSLUU/UXYsik7tXL37/Ckqc+9BheoGsBM=;
        b=q1t7if+6O0akN1/Bfqd9MwLiDSyQCVf6q3HPWjm8oVwGIQhvSuA8E8ogkthscBjtSA
         p1jQY3BPY2cjhUaGDNYsg8LzhrYkZCJP80SfjShR/skDnIrd1unT05U/Rt4061MFfs7L
         BQQtTldVdl5Luoizibiz9MVjFLyHK4rsrysTaeGOobu1kwER7QcsuaUvpwf4tCyDZWXt
         jiswbzvxGKncDNIiTwmCbYp0KDyFECLN17KeAG0LVyPzm0tlK77fXOSbtqTt9MBwqOlm
         iFXOK8wFmtqqNIVIogcH1iYMlzOBnlOl6i9I9O9WZJu8gLMlvlQ70vigBoTjRcGPCWd/
         Pjrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743096319; x=1743701119;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFNNjaE2jorSLUU/UXYsik7tXL37/Ckqc+9BheoGsBM=;
        b=L3u2EhrZJMB4wc5vuhA6sewvfHi8ra8bfyGEH9ZKC5X+ZXiKGRZ0V3xesoOD1ws3mA
         GWY07ShYrdEbBireb9R9oBz2Z1v3wa1oqTg/xgYjojRvw8iZSWxXQvXP2Aghe5ozs1Kb
         VKklHWx598Wy0ydXtvEfMrnGEnShwYCA2FibO/OoZ8mfAzT0D7mkzQWHsxEhkz9davaQ
         xJG19JjmXaNKLMvQmQx4Q/dzH126mZnNg9DiXtHW4Xv2WaC9D3Leu3B1vrtRg2D2Zkmj
         +zIe2FkkFcoBgm4j1sKlkffcpE/67+ZHR4mDXOmdIbgxdTtPMyduoBokpicOIOx1qB6Z
         DVSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg6YknZLjVuKtqGNt9RbV8U7muJkXm0qezgn8Fz2whsp71DgSMzmol+oT3FRc4WhyOqIV5klJ5aucwS9HC@vger.kernel.org
X-Gm-Message-State: AOJu0YyyWFrtHSJciO9L2ATt8ZosqiUabo0b/TP/t/5+EVgLGXbkjnRc
	i6N6rGauawCQsijYRInwj+8eWkGtVAnlwZwVQyoGn+pQs2XkSWDFG7AZWeBYfBs=
X-Gm-Gg: ASbGnctm6+neKcSlzq8GI9hEReDg+aHnRdI+ACDcFoo5+Leen2xTDzG/7IxdzS1nx8o
	ww38uulQnV2xu7z6n43MIQl6BpEvUWu8JdfNZiFMPbr4kc406ofXF2KWWeesx/7RPIjh2ngpnMu
	Jh3I4q/rhPnUm3kaQPa4ZRwDYRdhFPqGlOysILGo8GXJDJw26x+I23QzZHm1fu0zxP4+72gOidS
	ka0AxByzszpR/GcNdySQPKQGt2Lzbiia1jlkIZeU6yYe79AaMjrZzRvLm8Letu1By+tkaz/293+
	CIrQ5n905N1DK8W0EEomZd84yj/atlrFs0kVJeuypdSw67r2HT7lvKXh
X-Google-Smtp-Source: AGHT+IG6HZVRndm/SI4MfA5kUV10tRAvIz8zy6VUE73vnCcorqncpm2q15iOxitfjTm65+tpqf32cg==
X-Received: by 2002:a05:600c:1604:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43d8522cca1mr36264425e9.7.1743096318599;
        Thu, 27 Mar 2025 10:25:18 -0700 (PDT)
Received: from localhost ([2a00:23c8:b70a:ae01:9cf7:b69:fc50:980f])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c0b79e304sm103142f8f.73.2025.03.27.10.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 10:25:18 -0700 (PDT)
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 17:25:10 +0000
Subject: [PATCH v2] drm/dp: fallback to minimum when PWM bit count is zero
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-v2-1-16dc3ee00276@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPWJ5WcC/x3NTQrCMBBA4auUWTsQx6YWryJd5GdsB2oSM0WF0
 rsbXH6b93ZQrsIKt26Hym9RyamBTh2ExaWZUWIzkCFrLnTFjxTM3rsaA75CfuJ27hXzyhGLS7y
 irzIvW2JV7A2ZcbB+sKOBViyVH/L93+7TcfwALVIRAH0AAAA=
X-Change-ID: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4303;
 i=christopher.obbard@linaro.org; h=from:subject:message-id;
 bh=/2xRSARzKGQ4h11CgHv2bq7msP9g4VI83b030w4wYFo=;
 b=owEBbQKS/ZANAwAKAWNNxPBocEb4AcsmYgBn5Yn64KspE82XCwduXNxq/mObSEjV0OktoKB7O
 CS69xjfLtmJAjMEAAEKAB0WIQTxi9yLbCX5CqI9UXRjTcTwaHBG+AUCZ+WJ+gAKCRBjTcTwaHBG
 +DvjEACDhVZKkIaryW8LiPt8FICYljuve62aItGb4wA7S4RMrXyj8uYCAg8zAUCD5tldojT7ApC
 YUoYDHVt8t/4eYjcpr6RICIB5z2lYNgczioVM0SREcxzEjrlxWFdmC1EgtShvGfk0jI0YaRXmfE
 3KeSD0a7OqKOd4Vo9+74FYphr5TSs1qexIu5FjQniCUYCcMeZ+YHvFL/JtpMZTlcTkcSDbKrmnT
 xysU/0e9Ter1sQCS2Qh9U9HSNvDwlHiAs+Cp9cF4GQktBCO6+GL1fSA0NzaS94WRbn+4BOvo4sW
 J86LEB83x0IPfxi83q2bjJil7b2u3AJ7jBo98l1rbTemcDyPEd0tksOymypOwXrpebNC59SO9Su
 1X3HZUHNomwVvSGTKcxKLiLYVlxjMKuQDNBBuXVrBc2P2f8/ADUTP7OyQtI5F6R+hHD5PkcS6vF
 rEb6PVeN59NXfGKGMNFe3I5XDZbq3lunUmB8doVTKQ+9EhYOmDdur4PS9feN+pEPCNFF1GM5AZk
 sAmhA9AcSNAamVn5yvqQX9na09Vmy1BKI3bOsQXeZafbJjzUug3J/2QzAnBFm9RmqvLlU/xY0lX
 aH9swSYFbn0wT6kZl+Lpxhr5/KKemIaa2dvd0Dwe0zqMfKYQo8H/yWraPZJOC9gFNFFONNYgIIC
 2bCk39V856Psrtg==
X-Developer-Key: i=christopher.obbard@linaro.org; a=openpgp;
 fpr=F18BDC8B6C25F90AA23D5174634DC4F0687046F8

According to the eDP specification (e.g., VESA eDP 1.4b, section 3.3.10.2),
if DP_EDP_PWMGEN_BIT_COUNT is less than DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN,
the sink is required to use the MIN value as the effective bit count.

Some eDP panels report DP_EDP_PWMGEN_BIT_COUNT as 0 while still providing
valid non-zero MIN and MAX capability values. This patch updates the logic
to use the CAP_MIN value in such cases, ensuring correct scaling of AUX-set
backlight brightness values.

This improves compatibility with panels like the Samsung ATNA40YK20 used
on the Lenovo T14s Gen6 (Snapdragon variant with OLED) which report a
bit count of 0 but declares an 11-bit PWM capability range.

Co-developed-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
---
Changes in v2:
- Split backlight brightness patch from T14s OLED enablement series.
- Use PWMGEN_CAP_MIN rather than MAX (Dmitry).
- Rework commit message to reference eDP spec.
- Rebase on drm-misc-next.
- Link to v1: https://lore.kernel.org/all/20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org/
---
 drivers/gpu/drm/display/drm_dp_helper.c | 50 ++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index dbce1c3f49691fc687fee2404b723c73d533f23d..0b843d5b634f89f144b62b30311834d118b79ba9 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -4083,7 +4083,7 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 {
 	int fxp, fxp_min, fxp_max, fxp_actual, f = 1;
 	int ret;
-	u8 pn, pn_min, pn_max;
+	u8 pn, pn_min, pn_max, bl_caps;
 
 	if (!bl->aux_set)
 		return 0;
@@ -4094,8 +4094,39 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 			    aux->name, ret);
 		return -ENODEV;
 	}
-
 	pn &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
+	if (ret != 1) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
+			    aux->name, ret);
+		return 0;
+	}
+	pn_min &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
+	if (ret != 1) {
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap max: %d\n",
+			    aux->name, ret);
+		return 0;
+	}
+	pn_max &= DP_EDP_PWMGEN_BIT_COUNT_MASK;
+
+	ret = drm_dp_dpcd_readb(aux, DP_EDP_BACKLIGHT_ADJUSTMENT_CAP, &bl_caps);
+	if (ret != 1) {
+		bl_caps = 0;
+		drm_dbg_kms(aux->drm_dev, "%s: Failed to read backlight adjustment cap: %d\n",
+			aux->name, ret);
+	}
+
+	/*
+	 * Some eDP panels report brightness byte count support, but the byte count
+	 * reading is 0 (e.g. Samsung ATNA40YK20) so use pn_min instead.
+	 */
+	if (!pn && (bl_caps & DP_EDP_BACKLIGHT_BRIGHTNESS_BYTE_COUNT)
+	    && pn_min)
+		pn = pn_min;
+
 	bl->max = (1 << pn) - 1;
 	if (!driver_pwm_freq_hz)
 		return 0;
@@ -4122,21 +4153,6 @@ drm_edp_backlight_probe_max(struct drm_dp_aux *aux, struct drm_edp_backlight_inf
 	 * - FxP is within 25% of desired value.
 	 *   Note: 25% is arbitrary value and may need some tweak.
 	 */
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MIN, &pn_min);
-	if (ret != 1) {
-		drm_dbg_kms(aux->drm_dev, "%s: Failed to read pwmgen bit count cap min: %d\n",
-			    aux->name, ret);
-		return 0;
-	}
-	ret = drm_dp_dpcd_readb(aux, DP_EDP_PWMGEN_BIT_COUNT_CAP_MAX, &pn_max);
-	if (ret != 1) {
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
base-commit: ee20c69c789b6cb2179a535cf440d72b98f4a134
change-id: 20250327-wip-obbardc-qcom-t14s-oled-panel-brightness-4020865b6580

Best regards,
-- 
Christopher Obbard <christopher.obbard@linaro.org>


