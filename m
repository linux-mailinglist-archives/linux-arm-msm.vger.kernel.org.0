Return-Path: <linux-arm-msm+bounces-6095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F023820258
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 23:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1D8B1C2184F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Dec 2023 22:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FAA714F6C;
	Fri, 29 Dec 2023 22:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3Ro2+Lx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128114AA5
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 22:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50e7b51b0ceso3920731e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Dec 2023 14:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703890612; x=1704495412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zxMTS15SR0dQfgdEs5/meR4dgzk9C8ECIqIWqpIhpyk=;
        b=b3Ro2+LxaFUe47eDohXjM7cwnVxosV6a2m0T5sNagMbKe8zNEwHctJ2G+VLG+fV5Kw
         W8gxP5qO7PRKkL7dZ4rcaVIaCcfYr6WrhZm7zDKqLuM2R3HgNFRqoAl6KqDAqlpuHFt1
         Z1uqwuiwBvpACRPzOjFLG3QlBXLrFFdjpZWa71t0n7BvK/c66otShbjiD4JclxMWVyNG
         57EhlaAGflymKP9WyVoqcXt1icXSWdvDE0mdTSrpsYpkfHU1e0Hbd/bGaSm5Surigm34
         H8xA9XZGkph2YxearSQiNxPUn5mrvDqTObnia3jP3HRBpiJ80uJ7fsuCnqR8a+IHL8Jn
         WmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703890612; x=1704495412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxMTS15SR0dQfgdEs5/meR4dgzk9C8ECIqIWqpIhpyk=;
        b=aQCCIDenQ47O4ul01d5LdVnz7LJYa7Gd7bQFnwgP7R07LvNIm4+wx0/8sGQKepuHNx
         1outMycVy2+wMhEdqcPvpBQI/XRJ6hVaR8VBJSPPdHK+H0pwUR+lpVDce2GW0KmZ5saT
         jI3oe7tpsb1V+P29ohZ0Y4kCgizRHaBjTQl36RqSlfmyw/h7cppdqBxdCBhymJggD9gn
         zmVn7EJrPsagn4XXuIvJMPVka3zGA3vP49TN/VRRoSVlTaWzau3X0vnBQZfdN0WK0esW
         CWuMi8f6YYUFB4Aikycf4ZdnPZq6/K3SrjjnDXCZUrxXP6SIuYiFYDdo0Z0XR2B7df9a
         aJ5g==
X-Gm-Message-State: AOJu0YyBeH/l62I3IYMhaBQTKp4mxSqbbUvcfSV2PmkxZu5mdGRsUbfw
	S6JnxFYLqoTcOdpRET4QYoy3HUGkt6Hx3A==
X-Google-Smtp-Source: AGHT+IGw5BeAJBS84QwhxQBM7eYdZzerDzyYgYJI8+jpIWzgSwDdh59N/7wLiQIrG0OSG05Azs08+g==
X-Received: by 2002:a05:6512:b08:b0:50e:84ad:d109 with SMTP id w8-20020a0565120b0800b0050e84add109mr3286734lfu.4.1703890612318;
        Fri, 29 Dec 2023 14:56:52 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j26-20020ac2455a000000b0050e7f5794cbsm1326952lfm.309.2023.12.29.14.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 14:56:52 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 01/14] drm/msm/dp: drop unused parser definitions
Date: Sat, 30 Dec 2023 00:56:37 +0200
Message-Id: <20231229225650.912751-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop several unused and obsolete definitions from the dp_parser module.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_parser.h | 46 ------------------------------
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


