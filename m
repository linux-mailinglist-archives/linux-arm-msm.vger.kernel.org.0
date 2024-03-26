Return-Path: <linux-arm-msm+bounces-15223-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8667B88C65C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 16:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AE00307150
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 15:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D159413C9CE;
	Tue, 26 Mar 2024 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xicm2wkG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A8713C9C9;
	Tue, 26 Mar 2024 15:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711465608; cv=none; b=Fv+eGdYC6rRAMJrGcr1WdILVJCpinQoMheGBJqx03dsMcM0QlSmmCO41vBNeeW0zyh8UcDBxzJRJcMz4e9SBMpFg6Ym+xHXZqhLIK/hmrEqpB4qi1V1lp2aa1mLlcFXpCtPVljHt5dOiLzRTZu0hZtynpTw4sG8jUVqL4fgJshs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711465608; c=relaxed/simple;
	bh=VZkbxJstwSPISSjebtghTsFMzbcGY1Gg49TU66g37Zo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APA2VaYEK3PaovSsU5ije9kuAmbBTbblQfXbt0qZntN4QdYELopvWOKYn7n8bnI+czTbFDpUsdmCWI1tOIB+RYZ5rwB/UPj1EF23kpEZfJxxEWuic1gyZhC6JXJDnD6ni/dW7vEZ5Z8RiW5hSHrjjGvT1BZZD0oc7O+dZlyNFio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xicm2wkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC6EC4166B;
	Tue, 26 Mar 2024 15:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711465608;
	bh=VZkbxJstwSPISSjebtghTsFMzbcGY1Gg49TU66g37Zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Xicm2wkGcgKxv40fIqLn5ecM0mu273FOSfH+JEzZk54ips0Slq3E1+wHk1LeqGman
	 i94Pe+1fHoaPB8937WLJMsCwl6oACoMSXaJEAFqqdwQTwVnNBZz4bM8LRl05Z3NWxv
	 QTbxCTtDpCtkz36ZraLHNE56X6r1koaB+PQKLL3J+JSR+XcOkgoufrUs8BL9eJcsfk
	 Y7ut7mu9cJ++VyKWbEJtt048cRfPpMfR7Lvq/lcY5lgKSEnsVO7zJxJ0GIDOTSgzWY
	 YT7GK44loq95Non81dEoHboBK2FDuaM5Pv2iXUGXGwlaLhGijjdyRqDjQvDA5OQ86W
	 bAnkE0g+9JsAg==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 26 Mar 2024 08:11:34 -0700
Subject: [PATCH 6/6] drm/msm/dp: Use function arguments for audio
 operations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240326-msm-dp-cleanup-v1-6-e775556ecec0@quicinc.com>
References: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
In-Reply-To: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=8282;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=BcOYwhP7HynBIuV3UQKuBFCsaFgtfuW2v5qo9WikuOU=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmAuWigAT7Voi3Pa6Z9JYLj6PQspagIJviNa3KL
 zO5hD5FK42JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgLlohUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUmCg/+OBS1X4s/HW/NVbz79/qB0NxNG4p43zMPeDwd/L6
 nv7j6zBJ4JDsaW5MEunohTC2WCHrNkFlAk3gjf4eUVEJMBtwNkL7CHMjSutFXc5wJ11oWV6lxso
 6QN9A93EjoJMrEvWEW2ldlHjaCOGqq67aFZ/qwK6yA/bda0L1ZeuwGQkAlAMpQfOQfqj+iLmlZs
 XDmQMgyQ9cN/38/iSYn9oBwi2L9GlowtdorLvN/VPqlwYfvPiYPQpaXJSGZ283BizMqMLYuoqSN
 l+Mhm1hVkSEAI2rC0N7JYK3x/tTg79KKVwqbp8Z3Z2kTakyrht2DumATzjgKpIX8gMtYTthvHvO
 ZceDSUbIsYZ07MbpAfMkHCWoj4oUzpnISg32FgdUhlW0Xcz6kAzaFc2ji0vCNcV9FKMV6iEEMMz
 fz7/QFJmxcEnHSRPsI9osststIcjBwrpvSosX1bbuEePkLJEvywB0OlQXJG8ex+l+t0pQBTrmi9
 HfcaOfsZte4D0tcVV+mfXXX1wXc/+GzPxlwog0Gr6G2zTXuQQeiDLlqwICOqX5fmgMkqMP2iqr1
 H7qK9bENb7soJ1120f8UImjlIRu6wXFMzzkzYfDnwpTXoYHuyoco7sVHbe7PNAcBBRADjWNnSyD
 iGQS0FifTT6cD8/y/vVAEopPZitDOmW+1lYV8a2tBVDI=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

The dp_audio read and write operations uses members in struct dp_catalog
for passing arguments and return values. This adds unnecessary
complexity to the implementation, as it turns out after detangling the
logic that no state is actually held in these variables.

Clean this up by using function arguments and return values for passing
the data.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_audio.c   | 20 +++++--------------
 drivers/gpu/drm/msm/dp/dp_catalog.c | 39 +++++++++++++------------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 18 +++++++++--------
 3 files changed, 28 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
index 7fd0c1793ba3..a599fc5d63c5 100644
--- a/drivers/gpu/drm/msm/dp/dp_audio.c
+++ b/drivers/gpu/drm/msm/dp/dp_audio.c
@@ -32,11 +32,7 @@ static u32 dp_audio_get_header(struct dp_catalog *catalog,
 		enum dp_catalog_audio_sdp_type sdp,
 		enum dp_catalog_audio_header_type header)
 {
-	catalog->sdp_type = sdp;
-	catalog->sdp_header = header;
-	dp_catalog_audio_get_header(catalog);
-
-	return catalog->audio_data;
+	return dp_catalog_audio_get_header(catalog, sdp, header);
 }
 
 static void dp_audio_set_header(struct dp_catalog *catalog,
@@ -44,10 +40,7 @@ static void dp_audio_set_header(struct dp_catalog *catalog,
 		enum dp_catalog_audio_sdp_type sdp,
 		enum dp_catalog_audio_header_type header)
 {
-	catalog->sdp_type = sdp;
-	catalog->sdp_header = header;
-	catalog->audio_data = data;
-	dp_catalog_audio_set_header(catalog);
+	dp_catalog_audio_set_header(catalog, sdp, header, data);
 }
 
 static void dp_audio_stream_sdp(struct dp_audio_private *audio)
@@ -317,8 +310,7 @@ static void dp_audio_setup_acr(struct dp_audio_private *audio)
 		break;
 	}
 
-	catalog->audio_data = select;
-	dp_catalog_audio_config_acr(catalog);
+	dp_catalog_audio_config_acr(catalog, select);
 }
 
 static void dp_audio_safe_to_exit_level(struct dp_audio_private *audio)
@@ -344,16 +336,14 @@ static void dp_audio_safe_to_exit_level(struct dp_audio_private *audio)
 		break;
 	}
 
-	catalog->audio_data = safe_to_exit_level;
-	dp_catalog_audio_sfe_level(catalog);
+	dp_catalog_audio_sfe_level(catalog, safe_to_exit_level);
 }
 
 static void dp_audio_enable(struct dp_audio_private *audio, bool enable)
 {
 	struct dp_catalog *catalog = audio->catalog;
 
-	catalog->audio_data = enable;
-	dp_catalog_audio_enable(catalog);
+	dp_catalog_audio_enable(catalog, enable);
 }
 
 static struct dp_audio_private *dp_audio_get_data(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 00ad3ebaa5a1..970d62e1610c 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1159,34 +1159,28 @@ struct dp_catalog *dp_catalog_get(struct device *dev)
 	return &catalog->dp_catalog;
 }
 
-void dp_catalog_audio_get_header(struct dp_catalog *dp_catalog)
+u32 dp_catalog_audio_get_header(struct dp_catalog *dp_catalog,
+				enum dp_catalog_audio_sdp_type sdp,
+				enum dp_catalog_audio_header_type header)
 {
 	struct dp_catalog_private *catalog;
 	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
-	enum dp_catalog_audio_sdp_type sdp;
-	enum dp_catalog_audio_header_type header;
-
-	if (!dp_catalog)
-		return;
 
 	catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
 
 	sdp_map = catalog->audio_map;
-	sdp     = dp_catalog->sdp_type;
-	header  = dp_catalog->sdp_header;
 
-	dp_catalog->audio_data = dp_read_link(catalog,
-			sdp_map[sdp][header]);
+	return dp_read_link(catalog, sdp_map[sdp][header]);
 }
 
-void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog)
+void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog,
+				 enum dp_catalog_audio_sdp_type sdp,
+				 enum dp_catalog_audio_header_type header,
+				 u32 data)
 {
 	struct dp_catalog_private *catalog;
 	u32 (*sdp_map)[DP_AUDIO_SDP_HEADER_MAX];
-	enum dp_catalog_audio_sdp_type sdp;
-	enum dp_catalog_audio_header_type header;
-	u32 data;
 
 	if (!dp_catalog)
 		return;
@@ -1195,17 +1189,14 @@ void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog)
 		struct dp_catalog_private, dp_catalog);
 
 	sdp_map = catalog->audio_map;
-	sdp     = dp_catalog->sdp_type;
-	header  = dp_catalog->sdp_header;
-	data    = dp_catalog->audio_data;
 
 	dp_write_link(catalog, sdp_map[sdp][header], data);
 }
 
-void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
+void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog, u32 select)
 {
 	struct dp_catalog_private *catalog;
-	u32 acr_ctrl, select;
+	u32 acr_ctrl;
 
 	if (!dp_catalog)
 		return;
@@ -1213,7 +1204,6 @@ void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
 	catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
 
-	select = dp_catalog->audio_data;
 	acr_ctrl = select << 4 | BIT(31) | BIT(8) | BIT(14);
 
 	drm_dbg_dp(catalog->drm_dev, "select: %#x, acr_ctrl: %#x\n",
@@ -1222,10 +1212,9 @@ void dp_catalog_audio_config_acr(struct dp_catalog *dp_catalog)
 	dp_write_link(catalog, MMSS_DP_AUDIO_ACR_CTRL, acr_ctrl);
 }
 
-void dp_catalog_audio_enable(struct dp_catalog *dp_catalog)
+void dp_catalog_audio_enable(struct dp_catalog *dp_catalog, bool enable)
 {
 	struct dp_catalog_private *catalog;
-	bool enable;
 	u32 audio_ctrl;
 
 	if (!dp_catalog)
@@ -1234,7 +1223,6 @@ void dp_catalog_audio_enable(struct dp_catalog *dp_catalog)
 	catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
 
-	enable = !!dp_catalog->audio_data;
 	audio_ctrl = dp_read_link(catalog, MMSS_DP_AUDIO_CFG);
 
 	if (enable)
@@ -1329,10 +1317,10 @@ void dp_catalog_audio_init(struct dp_catalog *dp_catalog)
 	catalog->audio_map = sdp_map;
 }
 
-void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
+void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog, u32 safe_to_exit_level)
 {
 	struct dp_catalog_private *catalog;
-	u32 mainlink_levels, safe_to_exit_level;
+	u32 mainlink_levels;
 
 	if (!dp_catalog)
 		return;
@@ -1340,7 +1328,6 @@ void dp_catalog_audio_sfe_level(struct dp_catalog *dp_catalog)
 	catalog = container_of(dp_catalog,
 		struct dp_catalog_private, dp_catalog);
 
-	safe_to_exit_level = dp_catalog->audio_data;
 	mainlink_levels = dp_read_link(catalog, REG_DP_MAINLINK_LEVELS);
 	mainlink_levels &= 0xFE0;
 	mainlink_levels |= safe_to_exit_level;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index a82ab4856b50..cd1ad046a953 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -48,9 +48,6 @@ enum dp_catalog_audio_header_type {
 };
 
 struct dp_catalog {
-	enum dp_catalog_audio_sdp_type sdp_type;
-	enum dp_catalog_audio_header_type sdp_header;
-	u32 audio_data;
 	bool wide_bus_en;
 };
 
@@ -114,12 +111,17 @@ void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog);
 struct dp_catalog *dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
-void dp_catalog_audio_get_header(struct dp_catalog *catalog);
-void dp_catalog_audio_set_header(struct dp_catalog *catalog);
-void dp_catalog_audio_config_acr(struct dp_catalog *catalog);
-void dp_catalog_audio_enable(struct dp_catalog *catalog);
+u32 dp_catalog_audio_get_header(struct dp_catalog *dp_catalog,
+				enum dp_catalog_audio_sdp_type sdp,
+				enum dp_catalog_audio_header_type header);
+void dp_catalog_audio_set_header(struct dp_catalog *dp_catalog,
+				 enum dp_catalog_audio_sdp_type sdp,
+				 enum dp_catalog_audio_header_type header,
+				 u32 data);
+void dp_catalog_audio_config_acr(struct dp_catalog *catalog, u32 select);
+void dp_catalog_audio_enable(struct dp_catalog *catalog, bool enable);
 void dp_catalog_audio_config_sdp(struct dp_catalog *catalog);
 void dp_catalog_audio_init(struct dp_catalog *catalog);
-void dp_catalog_audio_sfe_level(struct dp_catalog *catalog);
+void dp_catalog_audio_sfe_level(struct dp_catalog *catalog, u32 safe_to_exit_level);
 
 #endif /* _DP_CATALOG_H_ */

-- 
2.43.0


