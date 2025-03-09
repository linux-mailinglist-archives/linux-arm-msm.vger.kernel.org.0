Return-Path: <linux-arm-msm+bounces-50735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 006A1A58189
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 09:14:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B19318900B7
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Mar 2025 08:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ED418CC15;
	Sun,  9 Mar 2025 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jx0IBP/o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6C328DD0;
	Sun,  9 Mar 2025 08:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741508052; cv=none; b=sW44dbeKGYJ/K8m0q+yDE0nvR9k0KvdygzaeU7l2GxgzNPRNUWg6MZ9RnKH8akLTAszX33enlmS5pkpg+FOhFkrIkQ2o9Zw5nuvKePhamon4jOD64hvGlHWHEj8WRX1d5g5mqdxRseoycVDOrZFadjSxd3puDzu0Yv/1Rt7mskg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741508052; c=relaxed/simple;
	bh=Y7PNf56Wiy8usWt0XJSSy9g4zzDjcdLVUFxc4qN+JSU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rs6y4l8+jfYRxonsfjfGb4c7sOz+2kjnYz/ZYpmC+Q/Lk83D2Upybr+z0grgu3PQBNKW+pfTQ9o5ZplcUJ5MIECAtBgXaDZpLYpGQatGY95C8G80lUhIK9JIzcQIQW2MEn533AhTiy8OEP+71N5R8xvTvsHvNl2TKk2vbwNTv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jx0IBP/o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3783EC4CEEE;
	Sun,  9 Mar 2025 08:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741508052;
	bh=Y7PNf56Wiy8usWt0XJSSy9g4zzDjcdLVUFxc4qN+JSU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jx0IBP/oLb7j+4Pn2k702XiOEeIxxIkiOkhmF6hrNGshZ1CCzdB+mJJMmM8GHF5QV
	 AAlNYMkMNTlw3jtsMT19Xmg8q5yrKZMwAyW9Op0/a6CIaPeSz9Wg2h+/eW1F0QcY2m
	 vjnhZjE8AcsfitipuUfmSRYmGx3mZ0v5oVT2uBJegkToN4bALx5J5w4i2OfR6/7O8z
	 jgkFUr5ME17CJLDA7TDVxsfpkaDxlq6hYINbZvWTnhSGZg8dY3zAqvBIb3lUu2xpDI
	 EQtjArTGyvFHsHrP/EIk3sGhSPtlxI3cI0iV+fTvQnI3t++NOD3C+cDApbflx4BUIX
	 +AuI3bWG6IXDQ==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sun, 09 Mar 2025 10:13:57 +0200
Subject: [PATCH 2/4] drm/msm/hdmi: use new helper for ACR tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-drm-hdmi-acr-v1-2-bb9c242f4d4b@linaro.org>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
In-Reply-To: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6537;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=SUlsWfvGe/u7v0SEKetOa0wew4AKOLnsgQAjWExJs1E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnzU3GIi/9QsNJXAvJTF/mNboznHA/d6Om/BFNg
 9I8g7XtO62JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ81NxgAKCRCLPIo+Aiko
 1bqnB/0SSbQnnMMCctc1vMJmtC8diGqPdcWflP9xr5wWzn185Q+Wi2Y6AMOSJEv6pvOKXG8XzEz
 t3lmrUqbwV+251wy53ziUjKH5IuHmDhaFSvSR5Am75Zmw4g7FoZzabklG8G8cpVO6jJ1a2Cxqz7
 ay18HdHfrg4URTiQaqFeYOF9ZdVTIyp1ayfwKFqTDXjPRMBpXNpRsI6fjATU+p28FqPPTvIvYRy
 IQrIfK82OIcOwchVR0P+q8SE3MvBdhbAiX06OBPY3tDirYzTldimQa2thCJyq7vp3CZc1FRVKxV
 1GxhwAl1K6xpYOoZ/T7w0cC6MfApd+MegNz65RrWrgihQUiy
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Use new drm_hdmi_acr_get_n_cts() helper instead of hand-coding the
tables. Instead of storing the rate 'index', store the audio sample rate
in hdmi->audio.rate, removing the need for even more defines.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c | 107 +++-------------------------------
 1 file changed, 9 insertions(+), 98 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
index 8bb975e82c17c1d77217128e9ddbd6a0575bb33d..b9ec14ef2c20ebfa03c30994eb2395f21b9502bb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_audio.c
@@ -4,6 +4,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
 #include <linux/hdmi.h>
@@ -12,71 +13,9 @@
 
 #include "hdmi.h"
 
-/* Supported HDMI Audio sample rates */
-#define MSM_HDMI_SAMPLE_RATE_32KHZ		0
-#define MSM_HDMI_SAMPLE_RATE_44_1KHZ		1
-#define MSM_HDMI_SAMPLE_RATE_48KHZ		2
-#define MSM_HDMI_SAMPLE_RATE_88_2KHZ		3
-#define MSM_HDMI_SAMPLE_RATE_96KHZ		4
-#define MSM_HDMI_SAMPLE_RATE_176_4KHZ		5
-#define MSM_HDMI_SAMPLE_RATE_192KHZ		6
-#define MSM_HDMI_SAMPLE_RATE_MAX		7
-
-
-struct hdmi_msm_audio_acr {
-	uint32_t n;	/* N parameter for clock regeneration */
-	uint32_t cts;	/* CTS parameter for clock regeneration */
-};
-
-struct hdmi_msm_audio_arcs {
-	unsigned long int pixclock;
-	struct hdmi_msm_audio_acr lut[MSM_HDMI_SAMPLE_RATE_MAX];
-};
-
-#define HDMI_MSM_AUDIO_ARCS(pclk, ...) { (1000 * (pclk)), __VA_ARGS__ }
-
-/* Audio constants lookup table for hdmi_msm_audio_acr_setup */
-/* Valid Pixel-Clock rates: 25.2MHz, 27MHz, 27.03MHz, 74.25MHz, 148.5MHz */
-static const struct hdmi_msm_audio_arcs acr_lut[] = {
-	/*  25.200MHz  */
-	HDMI_MSM_AUDIO_ARCS(25200, {
-		{4096, 25200}, {6272, 28000}, {6144, 25200}, {12544, 28000},
-		{12288, 25200}, {25088, 28000}, {24576, 25200} }),
-	/*  27.000MHz  */
-	HDMI_MSM_AUDIO_ARCS(27000, {
-		{4096, 27000}, {6272, 30000}, {6144, 27000}, {12544, 30000},
-		{12288, 27000}, {25088, 30000}, {24576, 27000} }),
-	/*  27.027MHz */
-	HDMI_MSM_AUDIO_ARCS(27030, {
-		{4096, 27027}, {6272, 30030}, {6144, 27027}, {12544, 30030},
-		{12288, 27027}, {25088, 30030}, {24576, 27027} }),
-	/*  74.250MHz */
-	HDMI_MSM_AUDIO_ARCS(74250, {
-		{4096, 74250}, {6272, 82500}, {6144, 74250}, {12544, 82500},
-		{12288, 74250}, {25088, 82500}, {24576, 74250} }),
-	/* 148.500MHz */
-	HDMI_MSM_AUDIO_ARCS(148500, {
-		{4096, 148500}, {6272, 165000}, {6144, 148500}, {12544, 165000},
-		{12288, 148500}, {25088, 165000}, {24576, 148500} }),
-};
-
-static const struct hdmi_msm_audio_arcs *get_arcs(unsigned long int pixclock)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(acr_lut); i++) {
-		const struct hdmi_msm_audio_arcs *arcs = &acr_lut[i];
-		if (arcs->pixclock == pixclock)
-			return arcs;
-	}
-
-	return NULL;
-}
-
 int msm_hdmi_audio_update(struct hdmi *hdmi)
 {
 	struct hdmi_audio *audio = &hdmi->audio;
-	const struct hdmi_msm_audio_arcs *arcs = NULL;
 	bool enabled = audio->enabled;
 	uint32_t acr_pkt_ctrl, vbi_pkt_ctrl, aud_pkt_ctrl;
 	uint32_t audio_config;
@@ -94,15 +33,6 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		enabled = false;
 	}
 
-	if (enabled) {
-		arcs = get_arcs(hdmi->pixclock);
-		if (!arcs) {
-			DBG("disabling audio: unsupported pixclock: %lu",
-					hdmi->pixclock);
-			enabled = false;
-		}
-	}
-
 	/* Read first before writing */
 	acr_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_ACR_PKT_CTRL);
 	vbi_pkt_ctrl = hdmi_read(hdmi, REG_HDMI_VBI_PKT_CTRL);
@@ -116,15 +46,12 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		uint32_t n, cts, multiplier;
 		enum hdmi_acr_cts select;
 
-		n   = arcs->lut[audio->rate].n;
-		cts = arcs->lut[audio->rate].cts;
+		drm_hdmi_acr_get_n_cts(hdmi->pixclock, audio->rate, &n, &cts);
 
-		if ((MSM_HDMI_SAMPLE_RATE_192KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_176_4KHZ == audio->rate)) {
+		if (audio->rate == 192000 || audio->rate == 176400) {
 			multiplier = 4;
 			n >>= 2; /* divide N by 4 and use multiplier */
-		} else if ((MSM_HDMI_SAMPLE_RATE_96KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_88_2KHZ == audio->rate)) {
+		} else if (audio->rate == 96000 || audio->rate == 88200) {
 			multiplier = 2;
 			n >>= 1; /* divide N by 2 and use multiplier */
 		} else {
@@ -137,13 +64,11 @@ int msm_hdmi_audio_update(struct hdmi *hdmi)
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_AUDIO_PRIORITY;
 		acr_pkt_ctrl |= HDMI_ACR_PKT_CTRL_N_MULTIPLIER(multiplier);
 
-		if ((MSM_HDMI_SAMPLE_RATE_48KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_96KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_192KHZ == audio->rate))
+		if (audio->rate == 48000 || audio->rate == 96000 ||
+		    audio->rate == 192000)
 			select = ACR_48;
-		else if ((MSM_HDMI_SAMPLE_RATE_44_1KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_88_2KHZ == audio->rate) ||
-				(MSM_HDMI_SAMPLE_RATE_176_4KHZ == audio->rate))
+		else if (audio->rate == 44100 || audio->rate == 88200 ||
+			 audio->rate == 176400)
 			select = ACR_44;
 		else /* default to 32k */
 			select = ACR_32;
@@ -204,7 +129,6 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
-	unsigned int rate;
 	int ret;
 
 	drm_dbg_driver(bridge->dev, "%u Hz, %d bit, %d channels\n",
@@ -214,25 +138,12 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 
 	switch (params->sample_rate) {
 	case 32000:
-		rate = MSM_HDMI_SAMPLE_RATE_32KHZ;
-		break;
 	case 44100:
-		rate = MSM_HDMI_SAMPLE_RATE_44_1KHZ;
-		break;
 	case 48000:
-		rate = MSM_HDMI_SAMPLE_RATE_48KHZ;
-		break;
 	case 88200:
-		rate = MSM_HDMI_SAMPLE_RATE_88_2KHZ;
-		break;
 	case 96000:
-		rate = MSM_HDMI_SAMPLE_RATE_96KHZ;
-		break;
 	case 176400:
-		rate = MSM_HDMI_SAMPLE_RATE_176_4KHZ;
-		break;
 	case 192000:
-		rate = MSM_HDMI_SAMPLE_RATE_192KHZ;
 		break;
 	default:
 		drm_err(bridge->dev, "rate[%d] not supported!\n",
@@ -245,7 +156,7 @@ int msm_hdmi_bridge_audio_prepare(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	hdmi->audio.rate = rate;
+	hdmi->audio.rate = params->sample_rate;
 	hdmi->audio.channels = params->cea.channels;
 	hdmi->audio.enabled = true;
 

-- 
2.39.5


