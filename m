Return-Path: <linux-arm-msm+bounces-51396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F22E4A60D77
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 10:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 92A327A71DC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:36:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7921F2C5F;
	Fri, 14 Mar 2025 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtEtNHWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804E61F1934
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945028; cv=none; b=VINEp+994alXlKqN7024BwGG37hMjLhpGubUXvaUKGP0Hcy6Sb40zoJZNxCOf3vV544eX/hcf0UZZu4FUjbUy3K17CoE+V2bP+RexgOYQGgkvqYIoLay6Jyga0YCFNmiLHbeGKJaHIsiSqb7KtrlpCXAl0Cnbl5IUl9J7jXEhyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945028; c=relaxed/simple;
	bh=YybX5qyC/YrcFA/7ajmvv9eeRrlrBxymwT3fPWppcb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbWoEH4JEXaYIxgqQ6ujq1oWh4lZqp1+RSBouPbekRmbavdHvQGqWrG/wCYp0Obb/risq2m+JCYE5ig9Ta+3XCzGYEMUHlnnoLVYowoI9geTcKHC5ZQ4YIA+Y8QLCnJiMo8Xr3T+2OGHVaz7d9XhCkZRucaNB7aC+e6sR5+cc5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtEtNHWu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNEb6m031304
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rxg6WTy5b8i3vo4PyN3jqKTFwuTSk7Yvh0ES6fNN2UI=; b=XtEtNHWugQ3AYEg3
	wjWzZogbkkZmwVdE2KNA20IfuAsU36tXa/1dt3lM7njr4LoO9XFYpEMz6em2M+9y
	d5NMit+t9E+D5H4bcLE67uhsAT6fUr8QY8b/Egzo0H/sVsj152QVRbiO7OTmkYEz
	PPD0deuf+aRf7iK/StY+w4mZUYMJ5OEgDAVahytjKQc4Yj7isdmSOy4SQi+Btu2e
	TBrmXCmtw7hdRWEqmuQY5rNmr/we7z8RPykKeezOOI6iFxQm3pEh+6h1aOlJYlQo
	kcVx5ei40tS36AKl6PX4BgCxmDUA/XbpwVcsjMbmdzHyzZXAYSIfKwlnHfFQrz5f
	PFcmUQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qrr9q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:37:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e91ee078aaso39879746d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 02:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945024; x=1742549824;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rxg6WTy5b8i3vo4PyN3jqKTFwuTSk7Yvh0ES6fNN2UI=;
        b=IaDBNA5e/pi0c3HhVV2czXQluSY4o5Xrh9O64wV4POCKUcjSYeFKs9ht7ukTxRGEms
         9LejmwUg3b6ShdMfBS1kHpAuSb90GfsVZqwVmelfZvmLIuja7Q6oP80kiUG5G3+mZ2nA
         BfDsWCnbg1tL2lIFicFsGp6xUtSPCS7hwQpyvejO8/xv/llNrasOUSb0uIhRvXbEQ6Nq
         NuFqb32YRzXSfv6393XohLarYwypoNruItzIPecbgTYvCbPghFH+LU8y4ec/7pZQqRWv
         nYILPjsdZYkx84ODhHqmSRQnTyrg62dyiZWoHvrqPoykIWOWk71mL4ZMvbWdqeCfsDCr
         N/6w==
X-Forwarded-Encrypted: i=1; AJvYcCX7vc0GqeKhZ82lAbR8ErezNMBMsnbgAT9oZUaMC+VXAfauVFCu2gycow7fXPgRYtzSASnVW+OK2V2T03HY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/wgkeL2sKpp4rzzct/Vrl622HeJHqK5CB2xn7ql2SfdvKFbIE
	iP8Arq0AXUo9DQxPj0Um0uYGSPUkLUv5ZzB0hnROFBzRE5W7QxzpEG6GPb3rjcNtmIAqZDkr1Sy
	i42w5hxOVEtZgkcoULXrDN00Ko+Z/eY5Vj89VCoEgYPrMcDZ57/K98uHnOAmer82W
X-Gm-Gg: ASbGnctKRh7ZIWN8GyFLoXm+8NkTtxSAd13P5gSGjCNd31sCnFN2QEe/WMUL2I5JsWs
	Kw0pIK7t/M5CdltZBrMpg6ypVu1BaJu1ZcpuThazl95TnzpnUcD0fkK2RqfqQAyC9+mj/5sIsPy
	5gAapij1tdcDCwyarOMwxuo9BHO1TD7pPAKu9Peiaqut1GlYGFWSnT1HOR3UYxry1JRcyI2igK6
	qt7zI6S5jXrPk0Fdrwfm6IJ+3EwkeivkEIBDnAAZJKFRgs0o76UzjHnft3PW2IpXkJyTOIMcrnk
	qqNn0WRjvu76Zkev77AotaeBUzSp9lfKG/OEB+SeX/I2AUwctRJINNz/A4MNw3Hufk6EXqQpUCG
	ZOJpqtDhzczXc1LK5dPp2jM3dHlLj
X-Received: by 2002:ad4:51ca:0:b0:6e8:9a55:8259 with SMTP id 6a1803df08f44-6eaea9961efmr20179236d6.9.1741945024319;
        Fri, 14 Mar 2025 02:37:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE7M0uXsq5VLmnMusm+b4PPWNokUY8N7huijszRLAgCWSqkBVnma70tsFEMI4SVLCklGwRong==
X-Received: by 2002:ad4:51ca:0:b0:6e8:9a55:8259 with SMTP id 6a1803df08f44-6eaea9961efmr20178956d6.9.1741945023978;
        Fri, 14 Mar 2025 02:37:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:37:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:36:50 +0200
Subject: [PATCH v6 3/4] drm/bridge-connector: hook DisplayPort audio
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-dp-hdmi-audio-v6-3-dbd228fa73d7@oss.qualcomm.com>
References: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
In-Reply-To: <20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6670;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=YybX5qyC/YrcFA/7ajmvv9eeRrlrBxymwT3fPWppcb8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixi7kVXfa/jwnTZ4fv8x50RB/nD4bUrHN8i
 hxuJjPE21eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1cclB/wKwPk152dsnu70W8RKywmVujiApcE8B5driQB8QQcmFe/+Bc1/oyfnrs1x1z6sHZxEsEl
 4R2OznLQsTGfvWkudWsrQPP8crg3JP3YqLuGAd9ZXeHIxnOtqw2xwTxcZ4zLKIcRp88hEqMz/LP
 5QupCCL5bGEeA0pilHSpsqRr0dZXitFPux1AHI0DHL3AB7szZxKjCPHO6NGYb2koURYkUXbG7fW
 e4qIzjIN0r/sc/iuzzPTJkflX3JD0Q3JJU8IWPI6E19/bkwryKnGC3tKdCMpahFWQq6NYlJg2Hj
 pMXI2vgKUFGbCfIAhQHNyOIkJJ3Nqn6aJdvf2k826YbEjiQk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: JMFVNqSHpQY1nJz7m8paUTWphiJFM9yf
X-Proofpoint-GUID: JMFVNqSHpQY1nJz7m8paUTWphiJFM9yf
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d3f8c1 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=ZVFr_3E1Ng6cMAc5vHkA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075

Reuse existing code plumbing HDMI audio support and the existing HDMI
audio helpers that register HDMI codec device and plumb in the
DisplayPort audio interfaces to be handled by the drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 117 ++++++++++++++++++++-----
 1 file changed, 93 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 030f98d454608a63154827c65d4822d378df3b4c..7d2e499ea5dec2f710c1c67323bf9e6b177d3c9e 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -105,6 +105,14 @@ struct drm_bridge_connector {
 	 * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
 	 */
 	struct drm_bridge *bridge_hdmi_audio;
+	/**
+	 * @bridge_dp_audio:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * DisplayPort Audio infrastructure, if any (see
+	 * &DRM_BRIDGE_OP_DP_AUDIO).
+	 */
+	struct drm_bridge *bridge_dp_audio;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -440,14 +448,25 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi_audio;
-	if (!bridge)
-		return -EINVAL;
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
 
-	if (!bridge->funcs->hdmi_audio_startup)
-		return 0;
+		if (!bridge->funcs->hdmi_audio_startup)
+			return 0;
 
-	return bridge->funcs->hdmi_audio_startup(connector, bridge);
+		return bridge->funcs->hdmi_audio_startup(connector, bridge);
+	}
+
+	if (bridge_connector->bridge_dp_audio) {
+		bridge = bridge_connector->bridge_dp_audio;
+
+		if (!bridge->funcs->dp_audio_startup)
+			return 0;
+
+		return bridge->funcs->dp_audio_startup(connector, bridge);
+	}
+
+	return -EINVAL;
 }
 
 static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
@@ -458,11 +477,19 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi_audio;
-	if (!bridge)
-		return -EINVAL;
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
+
+		return bridge->funcs->hdmi_audio_prepare(connector, bridge, fmt, hparms);
+	}
+
+	if (bridge_connector->bridge_dp_audio) {
+		bridge = bridge_connector->bridge_dp_audio;
+
+		return bridge->funcs->dp_audio_prepare(connector, bridge, fmt, hparms);
+	}
 
-	return bridge->funcs->hdmi_audio_prepare(connector, bridge, fmt, hparms);
+	return -EINVAL;
 }
 
 static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
@@ -471,11 +498,15 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi_audio;
-	if (!bridge)
-		return;
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
+		bridge->funcs->hdmi_audio_shutdown(connector, bridge);
+	}
 
-	bridge->funcs->hdmi_audio_shutdown(connector, bridge);
+	if (bridge_connector->bridge_dp_audio) {
+		bridge = bridge_connector->bridge_dp_audio;
+		bridge->funcs->dp_audio_shutdown(connector, bridge);
+	}
 }
 
 static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connector,
@@ -485,15 +516,27 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi_audio;
-	if (!bridge)
-		return -EINVAL;
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
+
+		if (!bridge->funcs->hdmi_audio_mute_stream)
+			return -ENOTSUPP;
 
-	if (bridge->funcs->hdmi_audio_mute_stream)
 		return bridge->funcs->hdmi_audio_mute_stream(connector, bridge,
 							     enable, direction);
-	else
-		return -ENOTSUPP;
+	}
+
+	if (bridge_connector->bridge_dp_audio) {
+		bridge = bridge_connector->bridge_dp_audio;
+
+		if (!bridge->funcs->dp_audio_mute_stream)
+			return -ENOTSUPP;
+
+		return bridge->funcs->dp_audio_mute_stream(connector, bridge,
+							   enable, direction);
+	}
+
+	return -EINVAL;
 }
 
 static const struct drm_connector_hdmi_audio_funcs drm_bridge_connector_hdmi_audio_funcs = {
@@ -587,6 +630,9 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			if (bridge_connector->bridge_hdmi_audio)
 				return ERR_PTR(-EBUSY);
 
+			if (bridge_connector->bridge_dp_audio)
+				return ERR_PTR(-EBUSY);
+
 			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
 			    !bridge->hdmi_audio_spdif_playback)
 				return ERR_PTR(-EINVAL);
@@ -598,6 +644,24 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			bridge_connector->bridge_hdmi_audio = bridge;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_DP_AUDIO) {
+			if (bridge_connector->bridge_dp_audio)
+				return ERR_PTR(-EBUSY);
+
+			if (bridge_connector->bridge_hdmi_audio)
+				return ERR_PTR(-EBUSY);
+
+			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
+			    !bridge->hdmi_audio_spdif_playback)
+				return ERR_PTR(-EINVAL);
+
+			if (!bridge->funcs->dp_audio_prepare ||
+			    !bridge->funcs->dp_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_dp_audio = bridge;
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -641,11 +705,16 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
-	if (bridge_connector->bridge_hdmi_audio) {
-		bridge = bridge_connector->bridge_hdmi_audio;
+	if (bridge_connector->bridge_hdmi_audio ||
+	    bridge_connector->bridge_dp_audio) {
+		struct device *dev;
+
+		if (bridge_connector->bridge_hdmi_audio)
+			dev = bridge_connector->bridge_hdmi_audio->hdmi_audio_dev;
+		else
+			dev = bridge_connector->bridge_dp_audio->hdmi_audio_dev;
 
-		ret = drm_connector_hdmi_audio_init(connector,
-						    bridge->hdmi_audio_dev,
+		ret = drm_connector_hdmi_audio_init(connector, dev,
 						    &drm_bridge_connector_hdmi_audio_funcs,
 						    bridge->hdmi_audio_max_i2s_playback_channels,
 						    bridge->hdmi_audio_spdif_playback,

-- 
2.39.5


