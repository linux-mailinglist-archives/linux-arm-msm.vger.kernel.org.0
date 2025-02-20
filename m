Return-Path: <linux-arm-msm+bounces-48637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1FA3D61F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B9993AF54A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 10:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE9D31F130E;
	Thu, 20 Feb 2025 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lNFnMr0F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD501F03EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046139; cv=none; b=tTYYENrZwldiEuHd4/XWD1cQ3lnqtI/UV8Of0uHnCFRrMOtuE2m1Y3PaF1r5P3ZqqMnx5DpPMfs5vt77jia4thzrYBqxMWNSDbKkCdr4pxgLW6COk6wFUoui1a0GO/iAAll/SQsGA44RqwiSROLTDbBbxtXP8sRoiWXXc31jJzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046139; c=relaxed/simple;
	bh=UmAueoCoAiEP6+F0V8D3CfDL3EJR/catd+q6wTXt9m8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kzpCktV+0nCpD0yYeDWWwUN+vR0WLALKgUpSJJ//dn8QvZ4Psgo0G4Y9QXSNY/sBMx7Unos7qRGQtyyr13g3SIWQBLhkpaOSyBG6jQNhzSAgT6xXakrznGLciAL2zb5GkTuCg1eebdjeKpRSZwS+br3E+Dy8jmgi/phggoaQYY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lNFnMr0F; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2fbfc9ff0b9so1145553a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 02:08:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740046137; x=1740650937; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8+OUzS6eo8FVNCvAvfNYtKkGJynjAEILZy6jM+oJy/s=;
        b=lNFnMr0F2M62GSC4XD45jQ9U2KuWZG2AxE4qhmN4/MNQxPK3Z1UC2wL0VlBx2rhrjU
         05bJyf1B4ZBCKZQjQ9mUcBJ2yYgtXxc5CwaNMsxnqdq61g9egM7dlvd9QWT4qx3J+x5V
         qNPRedkuOqpBWDTQKh93nGaXhFWDGn4ovvuqO8HXX52OWcBiohBXRETnss+pTzgR5U0K
         qhwaIH/vZftioLt4vYDdEya/shOkVw20ufAN8UwB4+K2u2ehLT+HA6tm5khWrTVPKU85
         CmsqIOeufGE8K+B/YikTzQeIRTdrcOZcyVcS3hjujmz4cHNrFwyOs5Im9RK1BWev4b2S
         QJ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046137; x=1740650937;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+OUzS6eo8FVNCvAvfNYtKkGJynjAEILZy6jM+oJy/s=;
        b=lhru01yu9jrD51jFFcDbDKqWYJbTcSn13JRKwEe4og5kCIYxYDRUnrc2imvhePkVI0
         n5rZPi0Qx/4hXmu+xoi9y1L3stHrKH3bn6sJRtNwksXUWmcCxDprAwar7XwI6ZLePzAD
         0yh48s8uidiGDCvDCpWJp2faT4Px9b691ZEftoNWHOp00AoUrkzQ7HmoFqU23Y/nmjlW
         ef0l7mBR92jzTLxfSiG7s0CHqhWsIMXpw2ESCoI8ylJMYYpGsTmu2NFz0+vryMfTC3Bg
         fs4Cfse0CtkS+JsDPDJajf8dk/8j3mDCa2t3lFE4EVIk0MOov7BJNIgSPIz+qL5KEyWk
         e1sQ==
X-Gm-Message-State: AOJu0YzK+0QxVYBCytZiXDXapZ4zr+Q8w2ZuopypYY0yxnjDTqjNOO/6
	AfFNGNVBrI8sUnHQpijsirXbS0JCoBRmb4aMmMii0ARk6tkp29lY+IpVZVs09bs=
X-Gm-Gg: ASbGncvOousCN7lhcphvv8GbZKhSlsGX6ymYrQN2/DM2z/QHptxaLvcalM0+9L8s0uf
	IqT3D7BmECVmPIwn9ND4Gf5yXN+teGGy/dgNjW82/4CjPd9JQ8hmJCUFatn2zE7Pp/ZG2e9++5e
	uAIqysHWXSKn0HiFI4JSUVgk+nAh+30BuoDKdYlGCBroTv8qZ717zxR6OT6mpF9FPuCThQsKdYA
	wE7+Sbm4KdzXinNLl5cTNbA2kp7UvpEhGUs5Fu/JgIBY+RrPK+lyTeVR4k6n/5Dv2iUX9MaSEaH
	vDEkKktlqnmt
X-Google-Smtp-Source: AGHT+IHDtFghikb0IsdCfqFtYMffpKN5+PJogSYWwgbB8ovOAObhOmSVEFhYr1RpSHSfSypZl/GVTw==
X-Received: by 2002:a17:90b:3d86:b0:2f4:4500:bb4d with SMTP id 98e67ed59e1d1-2fc40f233f9mr32996102a91.20.1740046137364;
        Thu, 20 Feb 2025 02:08:57 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98b3305sm15304645a91.6.2025.02.20.02.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 02:08:57 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 20 Feb 2025 18:07:56 +0800
Subject: [PATCH v2 5/5] drm/msm/dsi: Support DSC for dual panel case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-dual-dsi-v2-5-6c0038d5a2ef@linaro.org>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
In-Reply-To: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740046076; l=5455;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=UmAueoCoAiEP6+F0V8D3CfDL3EJR/catd+q6wTXt9m8=;
 b=6BwqEYg6DasxH9/TNbFINX8D5ATykKXwrq7MbDqfVfVuPFJ845uD3DPApUtH07rTfNUFTW/dz
 GczxnFvXZZ+AWEfDhMOKDN5XUwWsjxgrouT47tVNv40LQ4kUUbFO0uQ
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

There is dual DSI case that every DSI link is connected to an independent
panel. In this dual panel case, the frame width for DSC on each link should
be halved to support the usage case.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
 drivers/gpu/drm/msm/dsi/dsi_host.c    | 13 +++++++++----
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 ++++++++--
 3 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
index 35b90c462f637111159b204269ce908614a21586..5a8978bed9f4ca897b418ced60194042d9dd8d05 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.h
+++ b/drivers/gpu/drm/msm/dsi/dsi.h
@@ -74,7 +74,8 @@ void msm_dsi_host_enable_irq(struct mipi_dsi_host *host);
 void msm_dsi_host_disable_irq(struct mipi_dsi_host *host);
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
-			bool is_bonded_dsi, struct msm_dsi_phy *phy);
+			bool is_bonded_dsi, bool is_dual_panel,
+			struct msm_dsi_phy *phy);
 int msm_dsi_host_power_off(struct mipi_dsi_host *host);
 int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
 				  const struct drm_display_mode *mode);
diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 976c5d82a2efa0fc51657b8534675890be7c33a6..752a97f7181c30dade0a7745492bf16649b3197b 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -902,7 +902,8 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
 	}
 }
 
-static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
+static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi,
+			     bool is_dual_panel)
 {
 	struct drm_display_mode *mode = msm_host->mode;
 	u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
@@ -947,7 +948,10 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
 			return;
 		}
 
-		dsc->pic_width = mode->hdisplay;
+		if (is_dual_panel)
+			dsc->pic_width = hdisplay;
+		else
+			dsc->pic_width = mode->hdisplay;
 		dsc->pic_height = mode->vdisplay;
 		DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
 
@@ -2369,7 +2373,8 @@ static void msm_dsi_sfpb_config(struct msm_dsi_host *msm_host, bool enable)
 
 int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 			struct msm_dsi_phy_shared_timings *phy_shared_timings,
-			bool is_bonded_dsi, struct msm_dsi_phy *phy)
+			bool is_bonded_dsi, bool is_dual_panel,
+			struct msm_dsi_phy *phy)
 {
 	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
 	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
@@ -2412,7 +2417,7 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
 		goto fail_disable_clk;
 	}
 
-	dsi_timing_setup(msm_host, is_bonded_dsi);
+	dsi_timing_setup(msm_host, is_bonded_dsi, is_dual_panel);
 	dsi_sw_reset(msm_host);
 	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
 
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index be13bf682a9601484c9c14e8419563f37c2281ee..158b6cc907cb39cc3b182d3088b793d322a3527c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -24,6 +24,7 @@ struct msm_dsi_manager {
 	struct msm_dsi *dsi[DSI_MAX];
 
 	bool is_bonded_dsi;
+	bool is_dual_panel;
 	bool is_sync_needed;
 	int master_dsi_link_id;
 };
@@ -31,6 +32,7 @@ struct msm_dsi_manager {
 static struct msm_dsi_manager msm_dsim_glb;
 
 #define IS_BONDED_DSI()		(msm_dsim_glb.is_bonded_dsi)
+#define IS_DUAL_PANEL()		(msm_dsim_glb.is_dual_panel)
 #define IS_SYNC_NEEDED()	(msm_dsim_glb.is_sync_needed)
 #define IS_MASTER_DSI_LINK(id)	(msm_dsim_glb.master_dsi_link_id == id)
 
@@ -55,6 +57,7 @@ static int dsi_mgr_parse_of(struct device_node *np, int id)
 		msm_dsim->is_bonded_dsi = of_property_read_bool(np, "qcom,dual-dsi-mode");
 
 	if (msm_dsim->is_bonded_dsi) {
+		msm_dsim->is_dual_panel = of_property_read_bool(np, "qcom,dual-panel");
 		if (of_property_read_bool(np, "qcom,master-dsi"))
 			msm_dsim->master_dsi_link_id = id;
 		if (!msm_dsim->is_sync_needed)
@@ -214,6 +217,7 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	struct mipi_dsi_host *host = msm_dsi->host;
 	struct msm_dsi_phy_shared_timings phy_shared_timings[DSI_MAX];
 	bool is_bonded_dsi = IS_BONDED_DSI();
+	bool is_dual_panel = IS_DUAL_PANEL();
 	int ret;
 
 	DBG("id=%d", id);
@@ -222,7 +226,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 	if (ret)
 		goto phy_en_fail;
 
-	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id], is_bonded_dsi, msm_dsi->phy);
+	ret = msm_dsi_host_power_on(host, &phy_shared_timings[id],
+				    is_bonded_dsi, is_dual_panel, msm_dsi->phy);
 	if (ret) {
 		pr_err("%s: power on host %d failed, %d\n", __func__, id, ret);
 		goto host_on_fail;
@@ -230,7 +235,8 @@ static int dsi_mgr_bridge_power_on(struct drm_bridge *bridge)
 
 	if (is_bonded_dsi && msm_dsi1) {
 		ret = msm_dsi_host_power_on(msm_dsi1->host,
-				&phy_shared_timings[DSI_1], is_bonded_dsi, msm_dsi1->phy);
+				&phy_shared_timings[DSI_1], is_bonded_dsi,
+				is_dual_panel, msm_dsi1->phy);
 		if (ret) {
 			pr_err("%s: power on host1 failed, %d\n",
 							__func__, ret);

-- 
2.34.1


