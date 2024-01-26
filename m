Return-Path: <linux-arm-msm+bounces-8462-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B55A683E13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 19:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C9402838D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jan 2024 18:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B69520B30;
	Fri, 26 Jan 2024 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NCxy3G/8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CF920326
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706293591; cv=none; b=Sdffyru+/96zZGJUoE6j2wM5bNQZfps20p0dsXIBLYY9aLrJje/UMc+F6g5Fm3KNmhWWnARN3EGl0jsUecgxI6wJ3e7LGrrcsF6/TaQXzpkoEBKMeVJalX4Xfz22HFDezHEJlosuV3zgt/UybHYORHyxqiysm6mpLJkavEDZPI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706293591; c=relaxed/simple;
	bh=yVyRmmNda9mfXwPWksVdLkO9SsjdUAzlZBACGcKQbRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7zrum8WjKO15Corc+UuVGj7Y5ivHGKlJ5oaFfzlL5NSJ9+neA5PpRjruCuJUqbwkysE58E/btoNtLFeuNjc/BOTy0Qj4yXmnI1Cv00RfgoDtF1s00P1lsvKUQNKgokFm/v2yiYrdeBTCf72gUJlGR6rdbDaNOYMqOUxeDUDcfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NCxy3G/8; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf4a845a76so8034851fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jan 2024 10:26:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706293587; x=1706898387; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
        b=NCxy3G/8wJ0VMMqL23cB8+w0OPCmPnRHAPGTp3lXQa65z5FKY7YpQDA9gtCD2dYO2g
         kXgiELxjeNoVbOkN6KA6y0R0FCjGrrTctgih9mpSJp4tjX2eT4Sga+UsXth2C1h3bpMb
         OZ3QRbeQD1rIHjiPdt96E/1bmcgyWN5z8R+9iA0qg/X8KI0t3FPcy485WHFHuf91cD1G
         oDW4+WUOl5XiJ6IwxY39bnFflYZWP94nkqf+I1mnBPYGxLH5Jveui8xySqtYczdGQoXn
         IJCiTrfJgK8uf9oXsKRM8Z8EkqcHNoc5LlH2EqRarso4blwvCBy3xMoDcd/ApA4B+h5K
         81Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706293587; x=1706898387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3oS3e08i9+4napyM4Cx2ITHLfZ0NtaHlzp9IZJ5e4DI=;
        b=nYMqlXTPfvdERoZG+VCN0WIeT4e8tgj9OH98wQ829UQHsCGiJ9ZapNNtRdnHUVL3G/
         DCgXcoJ9jh5yvxfT9FvgccSce0QZiFnQ5BlWoifK2tRez/ygU4kiKzuOdxNjbNOmXigv
         TBoi/XRmJzWvWmzlqHaTKgHewCsrKS/NXnsPulVMNawKy3PJAPg6f3w5LfmcqrXOrVtt
         MTrT2bEj9H/62X8GHuvTS3LEWWGqFTHFwcgoszfl1VwDXNDgN2HxhJ29DFYqfpNEJ/jn
         mINmh/4Mb+Zw2nD9nBbhsgpa3IJRNeBOkRdBuR3Zdd5/Kg4y+IEAoy04mbsinkH5rSaW
         H+jA==
X-Gm-Message-State: AOJu0Yz/q+4zWIEckt1v1wB+7hDV0PO4ZQscci+oQfMzAHhjyOE9D6UR
	plmnGAJnpEEFHQJPplMYAs7wf+Njd+MctpMTpqRVbNzfXNtwZmStBecv6HWThrc=
X-Google-Smtp-Source: AGHT+IEjwBaqC2fPBa/bAz9/T5mw/biJlp2Hq5zrXGrLEabCZhlsIh0GbkHRacokvUrtT0eWuzdmxQ==
X-Received: by 2002:a2e:7801:0:b0:2cf:1c74:9bcb with SMTP id t1-20020a2e7801000000b002cf1c749bcbmr112743ljc.106.1706293587342;
        Fri, 26 Jan 2024 10:26:27 -0800 (PST)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l25-20020a2e8699000000b002cf30f27698sm232218lji.91.2024.01.26.10.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:26:27 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Jan 2024 20:26:20 +0200
Subject: [PATCH RESEND v3 01/15] drm/msm/dp: drop unused parser definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240126-dp-power-parser-cleanup-v3-1-098d5f581dd3@linaro.org>
References: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
In-Reply-To: <20240126-dp-power-parser-cleanup-v3-0-098d5f581dd3@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBls/lPOJbzNIqeApQ8DbgE/UP/idD/MUc3Ag/NF
 99jdcF4k52JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZbP5TwAKCRCLPIo+Aiko
 1d/eB/9FpFX864Yjm80sEUWwzzg25jC/nJ5LbwAhFLUf2BNJlzCilUSxv2x/hVpOO2muGkgqHWA
 T/OFelIcZL2xD1sJPBJESu1REdVZ/Zlw7FDUQiQMk1ZbZ/4RtZq8W4wW5TmikDrft9WkqOntPHo
 vy105O9vosbmNLYpALFUfYfZ1fol8HUMSqTuUDJUZarjOLuvCgHhNN8O4IjH6raya3uzyig7Tp/
 mm5ftptfZGFpClbNkJ+tPLi1qQZUJ6GD+JPwxb28VZslj6p/4ljxCr3kSOfCYm692RJWiv59vI0
 d7wx6GjlUoTwrwmB9CkjVHPIRpjDyVqRGC3vZ9xqEkZf1kJU
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


