Return-Path: <linux-arm-msm+bounces-8355-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE0683D028
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 00:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E613428CEEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 23:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331B5125CD;
	Thu, 25 Jan 2024 23:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V91ltL4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBA5125BC
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 23:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706223759; cv=none; b=shiJdROjQHLT5ZjV35DRQ4W4K3EQqlle7wQtBsWkOd2V5b24jnQzCSpb3kTTCq53XpXVR5UutPT1Jkc9VThAhpRevyaUM6mt+wdWTJsEfOcZzNn6HvtENoFm0GDTwdSrCCK3VIZXW/qZKn1OgeMIQknSw5IMUcNdTS0dbUyuak8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706223759; c=relaxed/simple;
	bh=yVyRmmNda9mfXwPWksVdLkO9SsjdUAzlZBACGcKQbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FBijoOdp3gUIsTFGRnGmcooDCjmcQncm2GslRLgakbKb0Rskh6vxLpqc3/rGqEjuehK+1Fsx+7fiRqOxOOs5ZOJBsCaR+phaapy5UrCchsxEFOjQ9+Q++ykmmn0M3XkZoeI7JZRfyxZagDOykq3r6/nRkwzDdeBew+358nHq9co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V91ltL4/; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cdeb954640so91382931fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 15:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706223755; x=1706828555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
        b=V91ltL4/21cbSDOJyUKNhXe7NFdX0iQA13/aAhLk1lRGfqR9e1lQJiCWBodykCR4Qx
         +ZPuOQvsJmG+Xet6FKYe9iCoywYzdTyG+MVR3rLhN+fMk5T1QVvs7Lf8xSjeq6esFBba
         h25Sxx89ItCxGChI7EGbPjNoIuDR1FmFENfYhxI07JtaXRPxtqB+ksCIbYO4/5xUojj/
         Tkq3AkEmXqDalmTU4UUGXBgbcA44cj7fBXNQCOia0Ab+4uevOfGahpwTGo62K9mzzuio
         umh64Yn1KpFnz58odkEFf/Xk0GtGmXFqoxRkNn48tT0h+2t2Qcyr/uYuwXoVAx9/GjhI
         7pHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706223755; x=1706828555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
        b=sWM6iQArFtXKexaXMoGwTRyfXlNwUkxypMd+og0jQG1QzF8yZstk87id+ZR+wGW2tZ
         L5E/eWiC8qFLMlBVihXrSdM2+oKC5HKW8db99Y7ADocDHf5uf5ulvBUjwuZ7X4z277Ho
         x65/d9hKgV9Desin0juso91wLuVOJO52RyELK4zLccX+wXY03Mqxbxg9/uSPpn6rA4+L
         7SzSuZ0x7BIDu6DLgI75fHGyMAtZZynOcXuKKuy4cp87PP9Mt5SIKQI94lPnsXmHL8yf
         19ZSi861GShBEkr6S+58u5aXRV52lPC1MRTrL8lRGCPYrn87T2ql1V9fvqBlG7rlpI/K
         VVQA==
X-Gm-Message-State: AOJu0YwABYI9E6NBBLKdQYfFJ392+aRdSvegIscC9A25XhMmwRD/oMJJ
	8hAXiytPF5eWw47S+4ZnMWYJW+s4FDhnldQCcxV1HQ6/RBuj/r79MzwTB5PsmW137oMkewSWdUw
	r
X-Google-Smtp-Source: AGHT+IGSPB8nJPFKwB4TbiQzcc+eLmvCB3m7LW7+0Hir4MYc5gEZOJyeud9KXrgGzn4nvRG+ISp0FA==
X-Received: by 2002:a2e:7a16:0:b0:2cf:3144:3a4b with SMTP id v22-20020a2e7a16000000b002cf31443a4bmr194281ljc.37.1706223755300;
        Thu, 25 Jan 2024 15:02:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x19-20020a2e8813000000b002cdfc29b46dsm405872ljh.88.2024.01.25.15.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 15:02:34 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 01:02:30 +0200
Subject: [PATCH v3 01/15] drm/msm/dp: drop unused parser definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-1-e2e46f4d390c@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-e2e46f4d390c@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=yVyRmmNda9mfXwPWksVdLkO9SsjdUAzlZBACGcKQbRg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlsuiGYEavyaGfF/CAioPyUcxvN+cLN32AAS7wm
 cOjfDER+M2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbLohgAKCRCLPIo+Aiko
 1dJbB/4rFyOynpwtn4Zr+cn5sslHLwkW4VCsC9N+pjY0MLGw/rVZo7hjU59pWMXDQxZEvSZVBD9
 yfamhNXIgzJ8b/huF7eDriTAzij0bI+SWCU6sNYgNHAi1pQjOUXhoml7LEznLOMQog0OFsKe1L0
 2t2C3hEGbXMHPY5Om7fYIWYixyDrFQt2Dr6mCVzQvfhSuXtVs3+UmHmXZgSrcHoxHFFAzXH8G0R
 kJyi1bFZnhFPmFxF2z10KE7FUNWyPaeS+ljPbn+n3rJm5VFZYwBA6oRsLR3VKqv6im+qVqSMt3m
 e1J0sRNLJvsW4OlTo67dLKtwIGvq98CZ3rdSX48ZTkHW/xzx
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Drop several unused and obsolete definitions from the dp_parser module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.h | 46 --------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
index 1f068626d445..90a2cdbbe344 100644
--- a/drivers/gpu/drm/msm/dp/dp_parser.h
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -12,7 +12,6 @@
 
 #include "msm_drv.h"
 
-#define DP_LABEL "MDSS DP DISPLAY"
 #define DP_MAX_PIXEL_CLK_KHZ	675000
 #define DP_MAX_NUM_DP_LANES	4
 #define DP_LINK_RATE_HBR2	540000 /* kbytes */
@@ -21,7 +20,6 @@ enum dp_pm_type {
 	DP_CORE_PM,
 	DP_CTRL_PM,
 	DP_STREAM_PM,
-	DP_PHY_PM,
 	DP_MAX_PM
 };
 
@@ -43,28 +41,10 @@ static inline const char *dp_parser_pm_name(enum dp_pm_type module)
 	case DP_CORE_PM:	return "DP_CORE_PM";
 	case DP_CTRL_PM:	return "DP_CTRL_PM";
 	case DP_STREAM_PM:	return "DP_STREAM_PM";
-	case DP_PHY_PM:		return "DP_PHY_PM";
 	default:		return "???";
 	}
 }
 
-/**
- * struct dp_display_data  - display related device tree data.
- *
- * @ctrl_node: referece to controller device
- * @phy_node:  reference to phy device
- * @is_active: is the controller currently active
- * @name: name of the display
- * @display_type: type of the display
- */
-struct dp_display_data {
-	struct device_node *ctrl_node;
-	struct device_node *phy_node;
-	bool is_active;
-	const char *name;
-	const char *display_type;
-};
-
 /**
  * struct dp_ctrl_resource - controller's IO related data
  *
@@ -77,28 +57,6 @@ struct dp_io {
 	union phy_configure_opts phy_opts;
 };
 
-/**
- * struct dp_pinctrl - DP's pin control
- *
- * @pin: pin-controller's instance
- * @state_active: active state pin control
- * @state_hpd_active: hpd active state pin control
- * @state_suspend: suspend state pin control
- */
-struct dp_pinctrl {
-	struct pinctrl *pin;
-	struct pinctrl_state *state_active;
-	struct pinctrl_state *state_hpd_active;
-	struct pinctrl_state *state_suspend;
-};
-
-/* Regulators for DP devices */
-struct dp_reg_entry {
-	char name[32];
-	int enable_load;
-	int disable_load;
-};
-
 struct dss_module_power {
 	unsigned int num_clk;
 	struct clk_bulk_data *clocks;
@@ -109,16 +67,12 @@ struct dss_module_power {
  *
  * @pdev: platform data of the client
  * @mp: gpio, regulator and clock related data
- * @pinctrl: pin-control related data
- * @disp_data: controller's display related data
  * @parse: function to be called by client to parse device tree.
  */
 struct dp_parser {
 	struct platform_device *pdev;
 	struct dss_module_power mp[DP_MAX_PM];
-	struct dp_pinctrl pinctrl;
 	struct dp_io io;
-	struct dp_display_data disp_data;
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 	struct drm_bridge *next_bridge;

-- 
2.39.2


