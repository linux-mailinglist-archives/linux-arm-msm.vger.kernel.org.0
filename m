Return-Path: <linux-arm-msm+bounces-45381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E79B5A14B93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 09:57:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4918F3A78FB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 08:56:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F331F9A8C;
	Fri, 17 Jan 2025 08:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wuHbyQQ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E21AE1F91E8
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737104207; cv=none; b=gDg8M7yRXfPKwybu+skR/+GgteHHLk2S0a73e8pCESGEefgy6MFoezZBGtRiYm45BdToOzBSDOxCEX26uUmk9zv94MZAH/Mz0B2bpuXIsqpH9ZQ46NbXF9Rr9NaG2r69+gST2dsLyUIzkYbBQTzSl9mb1F7v5shEnHocAUg5zKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737104207; c=relaxed/simple;
	bh=ozBueI3BM9vEKFl7dBLTAY6qFYKCUTl49qCghNM3Sh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrrNZ6pzEQBCc4PI94rPhxEjO4zAm//JX9EOgMtzCdiyzNoZe16nghH/dmZvpXACcIdaJrzDFKiNEKFc5cuLBvhyJL6wo93V7YhJxmEwkvx3NA20uNce0aVp4lLm0x7nvEIgCyCp1yMo+x8l83cWELBY6qv/+1z/XXHsJfpgYeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wuHbyQQ3; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-304d760f0dfso15871671fa.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 00:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737104203; x=1737709003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qU8230/ZjgdwGUT6DyI0pwq3VTU/dwcpTjuzDvMxMB4=;
        b=wuHbyQQ3yvQo+SysDlSjIjkqHfIJBcVcrpGY7LOPxXPfvS5s4JvylGjQRg2wOeGIQo
         bl2gyTO5x5sgmbWrhoPsEoOHqN2KPfiFuH/ReWxBVrneZ5l77V0wUc+0JqHmFBHxpeS8
         SNcAezu3IF2o2e82jxiQHKIMGqXARYU21nDsOeWS2uDa3gBKd3y9ffnCHGfvymoQdYiK
         C4FqCCTBjRv0wI3XofXvfhxgxVZGRq/uZUcFFAMp9hjRG/2i15YnKCP0b8Aa/Zhn5jhq
         HLFUHczi/QaPYkgxB3Yu1d/OMClPMwYWtRcA7DdeUJeE0fvkVAnkLZpHwoxMkQRAgSXJ
         O28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737104203; x=1737709003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qU8230/ZjgdwGUT6DyI0pwq3VTU/dwcpTjuzDvMxMB4=;
        b=h41MjqBcLn6U6UVYejq0iWm+LIi4RGVuNBzp8ew3Gah2hPKuM3bYTr9sQYcFv205q0
         RP/T9mqGR7/U65CvnvACKs+evRVdtSjo+8pvui4CPe3ACe8gXXAwgasVnDn962DXI6OP
         j6AsRtkeSEKF99XKdWTnW0FlTud2XL+0SvIJJyrnQLxco3smebhpvtsaCLcJPiP+vBp3
         VMsAOlKbJ534u9naqdKECGg0l7TxTIHDJugwdWHW39H+HxqYMdji06c+zji8Ekbm+Uo/
         LjBA/fHm2Lj9j/Ta4/DJchYq7FbMILylP1YHjTO9YL9O3hE1Ja+fwXKD5DQeUgpzvllG
         Bp5A==
X-Forwarded-Encrypted: i=1; AJvYcCWz+OufA+Pk41sFOe9bsn/krlC3XDAnZFt8LrbfWEL2LIXz/2kQOhHgcr2U7PxWUTV04jb71cQ3JY6Ry7LF@vger.kernel.org
X-Gm-Message-State: AOJu0YycV3y+qD1EkKlnzQsrTGjTi6ZmvRgMWrJijax5gaOzyn/qQK2U
	9pM7GDqbUsTuDBcsnVPfM7SwWlpVKXOBI/iWWx08VYJy5xByMA0JVK03Rol+IAg=
X-Gm-Gg: ASbGncu9Mj3Xt6n7G4vSbb+hshTpKWKZFL6jHFnZFADKHfo8Ow4pxj2nRyyUKFJkp+9
	XYgMGoh6SymAYIMK4vKX2PnpaEns6d9qoKyqCRX9qxzO+zKF38zWwyhNDvfWBrbdvGlqL00dY5g
	3yNspUBKpW6DR2dvfxJFCSbOa+WhGEo7/0ChdFLPNfpYHPcgBOI3CYk/QgBs8JYd8WNVlmnV9uY
	yjjEJ0+Jqb0kc//g99JUZQ6AYfIqCvuuGgvl45jVkPGwWpFrHxsgC6mh/2rjGOF
X-Google-Smtp-Source: AGHT+IHGAXJy603DxK6zThF85N9QGM4x+a7NYOEkGBzpisAMqMGB+KgwWYbrNjj3TCf2TZ7YbWkVhQ==
X-Received: by 2002:a2e:a4c9:0:b0:302:1c90:58d9 with SMTP id 38308e7fff4ca-3072ca7fa0bmr4671971fa.16.1737104203024;
        Fri, 17 Jan 2025 00:56:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3072a330764sm3402101fa.3.2025.01.17.00.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 00:56:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jan 2025 10:56:36 +0200
Subject: [PATCH RFC 1/7] drm/display: dp: change
 drm_dp_dpcd_read_link_status() return
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-drm-rework-dpcd-access-v1-1-7fc020e04dbc@linaro.org>
References: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
In-Reply-To: <20250117-drm-rework-dpcd-access-v1-0-7fc020e04dbc@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6333;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=ozBueI3BM9vEKFl7dBLTAY6qFYKCUTl49qCghNM3Sh4=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3qXtGui6gGpb/Nm6ZuUfklesYshKnChmpBDQOjL6+5K0
 wu0uG91MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAiimIcDJtkMp8cCuVT4heb
 tXaDikLoY/1DIYXSu5Q/5e1wknZdGpuYlmG7xOqVykuTx5abtv9YKjhrxYPtkQGKCYcesCfN7Hq
 hrfG5aR1nPQ+P31vLR0WbPBmXy5TxzF8gzOGjvnt5kf7k99wpTbr7ZE75936Y1srhL/u5QaZNtP
 xLeax1SfoqGd9zfBdWJsznvS+uvYvxWuiPlQ3vXY/aWE5R3acie/bkqYXczGfEK/lYpk16lGte+
 0wq8erXtJllHlyus8I8a4rZPafWRzHXT3F9/pOFc/2LBwvm7TXVz7W9US/25muayyIrobwPD/QL
 vLwfCle+CFzDf0U98++ppqCDYqfzz6gUbeA3vD/f01YaAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

drm_dp_dpcd_read_link_status() follows the "return error code or number
of bytes read" protocol, with the code returning less bytes than
requested in case of some errors. However most of the drivers (except
the drm/msm one) interpreted that as "return error code in case of any
error". Move return len check to drm_dp_dpcd_read_link_status() and make
drm/msm/dp follow that protocol too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 16 +++++++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c        | 45 ++++++++++++++++++---------------
 drivers/gpu/drm/msm/dp/dp_link.c        | 17 ++++++-------
 3 files changed, 44 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index da3c8521a7fa7d3c9761377363cdd4b44ab1106e..809c65dcb58983693fb335b88759a66919410114 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -716,14 +716,22 @@ EXPORT_SYMBOL(drm_dp_dpcd_write);
  * @aux: DisplayPort AUX channel
  * @status: buffer to store the link status in (must be at least 6 bytes)
  *
- * Returns the number of bytes transferred on success or a negative error
- * code on failure.
+ * Returns the zero on success or a negative error code on failure.
  */
 int drm_dp_dpcd_read_link_status(struct drm_dp_aux *aux,
 				 u8 status[DP_LINK_STATUS_SIZE])
 {
-	return drm_dp_dpcd_read(aux, DP_LANE0_1_STATUS, status,
-				DP_LINK_STATUS_SIZE);
+	int ret;
+
+	ret = drm_dp_dpcd_read(aux, DP_LANE0_1_STATUS, status,
+			       DP_LINK_STATUS_SIZE);
+	if (ret < 0)
+		return ret;
+
+	if (ret < DP_LINK_STATUS_SIZE)
+		return -EPROTO;
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_dp_dpcd_read_link_status);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index bc2ca8133b790fc049e18ab3b37a629558664dd4..8e4fdc0eae7ce218bdcb1aa03bded2f2a61c4b92 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -1100,20 +1100,6 @@ static bool msm_dp_ctrl_train_pattern_set(struct msm_dp_ctrl_private *ctrl,
 	return ret == 1;
 }
 
-static int msm_dp_ctrl_read_link_status(struct msm_dp_ctrl_private *ctrl,
-				    u8 *link_status)
-{
-	int ret = 0, len;
-
-	len = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
-	if (len != DP_LINK_STATUS_SIZE) {
-		DRM_ERROR("DP link status read failed, err: %d\n", len);
-		ret = -EINVAL;
-	}
-
-	return ret;
-}
-
 static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 			int *training_step)
 {
@@ -1140,9 +1126,11 @@ static int msm_dp_ctrl_link_train_1(struct msm_dp_ctrl_private *ctrl,
 	for (tries = 0; tries < maximum_retries; tries++) {
 		drm_dp_link_train_clock_recovery_delay(ctrl->aux, ctrl->panel->dpcd);
 
-		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
-		if (ret)
+		ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+		if (ret < 0) {
+			DRM_ERROR("DP link status read failed, err: %d\n", ret);
 			return ret;
+		}
 
 		if (drm_dp_clock_recovery_ok(link_status,
 			ctrl->link->link_params.num_lanes)) {
@@ -1252,9 +1240,11 @@ static int msm_dp_ctrl_link_train_2(struct msm_dp_ctrl_private *ctrl,
 	for (tries = 0; tries <= maximum_retries; tries++) {
 		drm_dp_link_train_channel_eq_delay(ctrl->aux, ctrl->panel->dpcd);
 
-		ret = msm_dp_ctrl_read_link_status(ctrl, link_status);
-		if (ret)
+		ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+		if (ret) {
+			DRM_ERROR("DP link status read failed, err: %d\n", ret);
 			return ret;
+		}
 
 		if (drm_dp_channel_eq_ok(link_status,
 			ctrl->link->link_params.num_lanes)) {
@@ -1804,8 +1794,13 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
 {
 	u8 link_status[DP_LINK_STATUS_SIZE];
 	int num_lanes = ctrl->link->link_params.num_lanes;
+	int ret;
 
-	msm_dp_ctrl_read_link_status(ctrl, link_status);
+	ret = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+	if (ret < 0) {
+		DRM_ERROR("DP link status read failed, err: %d\n", ret);
+		return false;
+	}
 
 	return drm_dp_channel_eq_ok(link_status, num_lanes);
 }
@@ -1863,7 +1858,11 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
 				break;
 
-			msm_dp_ctrl_read_link_status(ctrl, link_status);
+			rc = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+			if (rc < 0) {
+				DRM_ERROR("DP link status read failed, err: %d\n", rc);
+				break;
+			}
 
 			rc = msm_dp_ctrl_link_rate_down_shift(ctrl);
 			if (rc < 0) { /* already in RBR = 1.6G */
@@ -1888,7 +1887,11 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl)
 			if (!msm_dp_catalog_link_is_connected(ctrl->catalog))
 				break;
 
-			msm_dp_ctrl_read_link_status(ctrl, link_status);
+			rc = drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
+			if (rc < 0) {
+				DRM_ERROR("DP link status read failed, err: %d\n", rc);
+				break;
+			}
 
 			if (!drm_dp_clock_recovery_ok(link_status,
 					ctrl->link->link_params.num_lanes))
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 1a1fbb2d7d4f2afcaace85d97b744d03017d37ce..431ee86a939343f9c7f2de51703f8f76f5580934 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -714,21 +714,20 @@ static int msm_dp_link_parse_request(struct msm_dp_link_private *link)
 
 static int msm_dp_link_parse_sink_status_field(struct msm_dp_link_private *link)
 {
-	int len;
+	int ret;
 
 	link->prev_sink_count = link->msm_dp_link.sink_count;
-	len = drm_dp_read_sink_count(link->aux);
-	if (len < 0) {
+	ret = drm_dp_read_sink_count(link->aux);
+	if (ret < 0) {
 		DRM_ERROR("DP parse sink count failed\n");
-		return len;
+		return ret;
 	}
-	link->msm_dp_link.sink_count = len;
+	link->msm_dp_link.sink_count = ret;
 
-	len = drm_dp_dpcd_read_link_status(link->aux,
-		link->link_status);
-	if (len < DP_LINK_STATUS_SIZE) {
+	ret = drm_dp_dpcd_read_link_status(link->aux, link->link_status);
+	if (ret < 0) {
 		DRM_ERROR("DP link status read failed\n");
-		return len;
+		return ret;
 	}
 
 	return msm_dp_link_parse_request(link);

-- 
2.39.5


