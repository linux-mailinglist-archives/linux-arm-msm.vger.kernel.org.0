Return-Path: <linux-arm-msm+bounces-6150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99373820939
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 01:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7A221C2155A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 31 Dec 2023 00:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE3AE819;
	Sun, 31 Dec 2023 00:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J4tFG5hD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAE4659
	for <linux-arm-msm@vger.kernel.org>; Sun, 31 Dec 2023 00:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50e7e55c0f6so4730417e87.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Dec 2023 16:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703983437; x=1704588237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
        b=J4tFG5hDkIIgMRqed0eieItsrFCluczCXS5hXla+8gHCEdK301Ll6fPlym58lXL65m
         3HQSzUWIgKT1X6Uj+xvj95zviGSd07Ymz4sfPtEx+wPb6KsxsJEoIKmdka90YXPhefme
         pUQR5y9IqS6mIletEkL0yBt1dw7ElbM5TfrxiX4KBHtd9jsVyHffRs3zphBCHHMiT+5u
         j6tJvROXTwsVMHm6zmomngiWQnQXG54sRDx0AvtNWWvTvNPot6XoVrCIDcoHAE5cGwpL
         nSsZKh4iu9OBajcBlgEhaWiiMKNkbcngsS5sjX1cIvUSU0ANtwBu/wHpjJBiZ9h7xwwi
         xqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703983437; x=1704588237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
        b=ObLnbQZntQ91+o06CwQwmf7rct7JMOpcP2UBh88rhTvxR6fhM4dj4VILK0vCMdv4UA
         w8IxQAzQISocdMuNAtqRpfZKZrH3yATQTWZY+37mS+sNbsD1tRtoJnSJZZplVTIc+pvf
         Ey1dDpJCSQoWfRaJ/vk6cmFEsGlzfT3zD3F5by0Hf7ZAQ3Z8UhEyIiAtUYKs3SEmTKK3
         +E1tva6crpHdW4KYV5qYDVKuWqkTg8ZXS+nQuqe5orFWs+IZyar788WeerLfzPA/rW2J
         j4WYBCk7r5v3gmevxY2HDPGeusrl2hHitiNchIx+bGpdYKgaGia8IGOswMo29LK0EjMB
         gpjA==
X-Gm-Message-State: AOJu0Yxhn2V0BQc/AgDtmBFJF2FklQu0jPiCIFNlgw2k1FQvb6cif6yK
	L3qRZbpo1hukXGe5fcrmygpRa0jRF+FOwA==
X-Google-Smtp-Source: AGHT+IG/BQ6GApy4H/SeCJffIMC1S1kURQGtN4k5+GaCdaX81KwQ4RajZwmthCVAOZU1lksWe59Oag==
X-Received: by 2002:ac2:4245:0:b0:50e:7e38:6e09 with SMTP id m5-20020ac24245000000b0050e7e386e09mr1639786lfl.192.1703983437145;
        Sat, 30 Dec 2023 16:43:57 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n13-20020a05651203ed00b0050e84be8127sm1295995lfq.101.2023.12.30.16.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 16:43:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 31 Dec 2023 02:43:48 +0200
Subject: [PATCH v2 01/15] drm/msm/dp: drop unused parser definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231231-dp-power-parser-cleanup-v2-1-fc3e902a6f5b@linaro.org>
References: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
In-Reply-To: <20231231-dp-power-parser-cleanup-v2-0-fc3e902a6f5b@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlkLlJxDusX/Mwxoi5Za1T0xN6tZBtKSS46fvKj
 rES0TQ+n66JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZZC5SQAKCRCLPIo+Aiko
 1eZ3B/wPO1Rh++PAEXQawRFR2VwvctoM9Rzvn8dCISWUeFJz1zWbzPN/xFw3qtzU4v+syJ+ZZjK
 GLjFkyYfL1j2TrBpYuu6UywJJmAqy1TXzY1d6osF9ioPaRNW43UHcAvMMm/KfmDDAvfnlmiSif5
 qHdFbNcbL9gQd71SnrA6uy1QBI2deU8TBfW4Z9YJveUBH1AeXOFqAPPD2YxiiF+Lb020lRdvE6p
 lohRtzNcD+QBHk3rIxFfGEo405nZAfCDoNUKw/Roec/DWv3FtmngQl3n9CnWrUO36w4X8EOUHgv
 XCjLDS3RNZdTTFGzTKHpBoJ/k4cjTriRR3ZbJN6s8YwmgoYM
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


