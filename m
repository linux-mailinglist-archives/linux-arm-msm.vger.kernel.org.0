Return-Path: <linux-arm-msm+bounces-45036-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC80A110FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 20:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09C911880A07
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 19:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFB61FA14A;
	Tue, 14 Jan 2025 19:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eY8tG1ML"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362131C2DB2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 19:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736882251; cv=none; b=HcuzTW+j/9XqFnfbviMi8mta9GB4xA7awPRLsX0uNm8RAXBXbSWYrf1+EOrtvwn9EQS1d2hWRU3gm+0Yy8cgfUo9ovA9vHt7ArNn/51X71DJymKYX5uf3up/rpgnJfe8YnTQ0Mo6QEb+Z2OmbTYP1UwKDdbvssBW/Q+dGs8g/xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736882251; c=relaxed/simple;
	bh=WXcKX3hyiCbFpF9dstj8z/jaicZ9JRFr7RTEYEj2UDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j/E8Hvuv1ZDLdmhcnaYqZcQwsWfWlCJ2cN/ScsZEerrF4sB2C6B3etJJBNlmc4nGNsemO29n0YtUkYvx8Lj8pjMLqVvwxRekJx3oFkWG/n8plMqRX+HgTjUnVyBCkVVSpIT+NoRQmC/6cOywf4PMrQExzs8ChxnUF9tyq0i2O6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eY8tG1ML; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385d851e7c3so273651f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jan 2025 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736882247; x=1737487047; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V06lBlmBxfsjJKJMHVQIInwZH2ivoya6DqMfzagHCMc=;
        b=eY8tG1MLbXAjH/laJe8bMgOfvGQfM9KI6kr3auIACLO2evX3Kx4Ac8JehtSSscwpLp
         wOwJMTinzUykeYs/h4RfRfXjnI8mvpoD3HVWJJ37Y0b5I+uOeEU3J+NrT/ovI3nAPBQH
         +zhcBeB9GSUJqlv5HXKWUWEzqN4XS7tPT4uo1RbX/vo+8jDjUBqZRj3W36n0hamgrf/K
         p3FnR5wGqlHzI6b+JJ7tZ0wQWzGLwmxqobSNZQo1TubTOqLn8jVtNXheDL/4fRGB+KQu
         mS01L9fEfIv1TdgqPwoMjm58uLIs6/GGH0JZ76eOBHrBsKrtsVTydzdbX0eef/9Gkiuy
         Dndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736882247; x=1737487047;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V06lBlmBxfsjJKJMHVQIInwZH2ivoya6DqMfzagHCMc=;
        b=wtmD1MTHU+Mk7WWV2APn5BPTqmAgHKAnGPY4/6p7DfofpgCf7pyzh5E2xUKPAMmMa9
         vVwfWamjWguOd+Fi+Dyv8VnEhkRm4zYiKEqhrtaFS8i2RiPid2JUN9KLy7DTUfZ4ogXf
         de1VPRko8xXVQulfw0A4F7tFDGm0X4mH5WQ9Kr3pTamowCX7Cxk0uCXCW5Kpl6vaCB1P
         MdC6MeLvRWdGAG4iSlX4KHYfr8PqSy3ncFQYf1MXjw24QGS6ncMkGrDWKKyNNNtr3ysP
         yf23f6jRAkBrwbn1IhdLj7nYSDTNVXkBYDRFmbIKuB5UXevXLvTXmO+x/0s8fB1YcmoR
         ONuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnCvcR7B/Z9kO1XsH+zVrttmUuzlsQ8ecSSDtmqQVkDvKCsL1NrBm1ARm4wL5si7HM0yOxwwX1XDruKJqm@vger.kernel.org
X-Gm-Message-State: AOJu0YxSSZOKqszExzys2UhGKjiH6k0Ie6jpO2OAeAlIikpLLNMLr+mh
	r+NaqOgQx4IJWPoGQ1xTrxl/mKhFqlrQX+StOZ2gTuDQ4aYQD3G1O2lPjqZNs/s=
X-Gm-Gg: ASbGncsjFf7h6VJyTngLK8hFvc1EXLruxpBW4lJLiPpZYo9PTJE+nLFfzHG4Kyo1a1B
	bc738owgH32fi6P8znEHl7/oK34lxXWT7NTFvPv3HJddg4xu0BU9lVN9MCxhdlvHPkamiCO04KG
	B5OE4vH24SyFZ/640rbrULKTqgjyET0rW4v8OaV8NTlF5Ps8x4l3JG0w6DpBPSG7MKgtttqIcDw
	WkdXScacsZBvLtQmhbKJvZAQwR1M/LDuClOTIMe/Ftf+JAYPlgnRI+btMYfZgSog0k2kKg=
X-Google-Smtp-Source: AGHT+IGUuvJd37PBNvk/Af4zVCTFBkmKr2VZr39NQdU1icUhyecsGR7h9tETuRGt6OlfcQkAdHOQXg==
X-Received: by 2002:a5d:6c69:0:b0:38a:9ed4:9ffc with SMTP id ffacd0b85a97d-38a9ed4b06fmr5620244f8f.10.1736882247587;
        Tue, 14 Jan 2025 11:17:27 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b82a4sm15814423f8f.72.2025.01.14.11.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:17:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] drm/msm: Use str_enable_disable-like helpers
Date: Tue, 14 Jan 2025 20:17:24 +0100
Message-ID: <20250114191724.861601-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace ternary (condition ? "enable" : "disable") syntax with helpers
from string_choices.h because:
1. Simple function call with one argument is easier to read.  Ternary
   operator has three arguments and with wrapping might lead to quite
   long code.
2. Is slightly shorter thus also easier to read.
3. It brings uniformity in the text - same string.
4. Allows deduping by the linker, which results in a smaller binary
   file.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  5 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c      |  3 ++-
 drivers/gpu/drm/msm/dp/dp_ctrl.c              | 25 ++++++++++---------
 drivers/gpu/drm/msm/dp/dp_display.c           |  4 +--
 drivers/gpu/drm/msm/dp/dp_drm.c               |  5 ++--
 5 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index e9bbccc44dad..da9994a79ca2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -5,6 +5,7 @@
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include "dpu_encoder_phys.h"
 #include "dpu_hw_interrupts.h"
 #include "dpu_hw_pingpong.h"
@@ -261,7 +262,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 
 	DRM_DEBUG_KMS("id:%u pp:%d enable=%s/%d\n", DRMID(phys_enc->parent),
 		      phys_enc->hw_pp->idx - PINGPONG_0,
-		      enable ? "true" : "false", refcount);
+		      str_true_false(enable), refcount);
 
 	if (enable) {
 		if (phys_enc->vblank_refcount == 0)
@@ -285,7 +286,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 		DRM_ERROR("vblank irq err id:%u pp:%d ret:%d, enable %s/%d\n",
 			  DRMID(phys_enc->parent),
 			  phys_enc->hw_pp->idx - PINGPONG_0, ret,
-			  enable ? "true" : "false", refcount);
+			  str_true_false(enable), refcount);
 	}
 
 	return ret;
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
index 666de99a46a5..fc183fe37f56 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2014-2015 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/string_choices.h>
 #include "mdp5_kms.h"
 #include "mdp5_ctl.h"
 
@@ -233,7 +234,7 @@ int mdp5_ctl_set_encoder_state(struct mdp5_ctl *ctl,
 		return -EINVAL;
 
 	ctl->encoder_enabled = enabled;
-	DBG("intf_%d: %s", intf->num, enabled ? "on" : "off");
+	DBG("intf_%d: %s", intf->num, str_on_off(enabled));
 
 	if (start_signal_needed(ctl, pipeline)) {
 		send_start_signal(ctl);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 9c463ae2f8fa..d8633a596f8d 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -11,6 +11,7 @@
 #include <linux/phy/phy.h>
 #include <linux/phy/phy-dp.h>
 #include <linux/pm_opp.h>
+#include <linux/string_choices.h>
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_fixed.h>
@@ -1366,9 +1367,9 @@ int msm_dp_ctrl_core_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "enable core clocks \n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   ctrl->stream_clks_on ? "on" : "off",
-		   ctrl->link_clks_on ? "on" : "off",
-		   ctrl->core_clks_on ? "on" : "off");
+		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->link_clks_on),
+		   str_on_off(ctrl->core_clks_on));
 
 	return 0;
 }
@@ -1385,9 +1386,9 @@ void msm_dp_ctrl_core_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "disable core clocks \n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   ctrl->stream_clks_on ? "on" : "off",
-		   ctrl->link_clks_on ? "on" : "off",
-		   ctrl->core_clks_on ? "on" : "off");
+		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->link_clks_on),
+		   str_on_off(ctrl->core_clks_on));
 }
 
 static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
@@ -1416,9 +1417,9 @@ static int msm_dp_ctrl_link_clk_enable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "enable link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   ctrl->stream_clks_on ? "on" : "off",
-		   ctrl->link_clks_on ? "on" : "off",
-		   ctrl->core_clks_on ? "on" : "off");
+		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->link_clks_on),
+		   str_on_off(ctrl->core_clks_on));
 
 	return 0;
 }
@@ -1435,9 +1436,9 @@ static void msm_dp_ctrl_link_clk_disable(struct msm_dp_ctrl *msm_dp_ctrl)
 
 	drm_dbg_dp(ctrl->drm_dev, "disabled link clocks\n");
 	drm_dbg_dp(ctrl->drm_dev, "stream_clks:%s link_clks:%s core_clks:%s\n",
-		   ctrl->stream_clks_on ? "on" : "off",
-		   ctrl->link_clks_on ? "on" : "off",
-		   ctrl->core_clks_on ? "on" : "off");
+		   str_on_off(ctrl->stream_clks_on),
+		   str_on_off(ctrl->link_clks_on),
+		   str_on_off(ctrl->core_clks_on));
 }
 
 static int msm_dp_ctrl_enable_mainlink_clocks(struct msm_dp_ctrl_private *ctrl)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 24dd37f1682b..b200efd97947 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -11,6 +11,7 @@
 #include <linux/of_irq.h>
 #include <linux/phy/phy.h>
 #include <linux/delay.h>
+#include <linux/string_choices.h>
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/drm_edid.h>
 
@@ -343,8 +344,7 @@ static int msm_dp_display_send_hpd_notification(struct msm_dp_display_private *d
 {
 	if ((hpd && dp->msm_dp_display.link_ready) ||
 			(!hpd && !dp->msm_dp_display.link_ready)) {
-		drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
-				(hpd ? "on" : "off"));
+		drm_dbg_dp(dp->drm_dev, "HPD already %s\n", str_on_off(hpd));
 		return 0;
 	}
 
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index d3e241ea6941..8364f3834531 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/string_choices.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_bridge.h>
@@ -25,7 +26,7 @@ static enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge)
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		(dp->link_ready) ? "true" : "false");
+		str_true_false(dp->link_ready));
 
 	return (dp->link_ready) ? connector_status_connected :
 					connector_status_disconnected;
@@ -41,7 +42,7 @@ static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	dp = to_dp_bridge(bridge)->msm_dp_display;
 
 	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		(dp->link_ready) ? "true" : "false");
+		str_true_false(dp->link_ready));
 
 	/*
 	 * There is no protection in the DRM framework to check if the display
-- 
2.43.0


