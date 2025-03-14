Return-Path: <linux-arm-msm+bounces-51395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3DAA60D76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 10:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A9957A6545
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531161F1908;
	Fri, 14 Mar 2025 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l6wt+O/6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAAB1F1300
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945026; cv=none; b=VO8rslBnsCp+flRs+CqSA0niRBLT/oDIa0PcJhd66Uy9qYreIxn3YvebzKyFHnLKDHTyjVKV9CinCnOkmW9QaPKeiqZm9ieLAFNZY4W+OP7rO6pk2RG+86mDyoRBpW+QUKDVfZQATGOxYh9Sne+xvsKQkVqzmIYO0hdLZxcpfw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945026; c=relaxed/simple;
	bh=sPGFPs8Z9BJzKH3T0QhgjGfhe3qB0nROPdLNLb450jk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UniiqtZd7dH32YcIlrHjvDeuVHr1+yesHZFE71L9uQZwhB284R/u1K7uvJXCigSd3bTCJu+lLCWavC0dviiplShZVjEpfK5Syg3+V+y8ymfb3Mlyb/UT8Rcr90BVhmzWCon2T7xFggNvZFHhoVrQnYrgCT5cCkF34VWVk+NVBdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l6wt+O/6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E1wT71007713
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfnAPAp+R1qao5Wl5xlx5FtRla2ujtMfiADZ2nfdBAQ=; b=l6wt+O/6JjKNXJv6
	qTfaNcP0eRbf10CjgKQAzzap1lDQ5nUqQBwNRIqKm0kVu/muT9H2+VhjcfXdCR3u
	Jh/IZtx91b5WbKwYAxvY9y7ctYXjsloC/wnqUd0+KtFyyI7uUp6YBKIhNE0BBIw3
	JytDXWbOshqZ+n5bxAzMJUo7Xh2G5x7cXwIJr58bv8lUPQXkRffKCoCUzuHjZMWQ
	p/EOtWmL3nN2XkQLKNWdZHofZlUz9Ly0XNh3yhyv/o/D77/jDyObxeOGV4ledJ9r
	uN1JNwdqTcTtrLoMg7bFYK4iWCBL6FzY/eJcZffc5UjQjEEcd7pDvA0WPEtsmVXi
	iGAaJg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8cfvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:37:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8f9450b19so42078766d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 02:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945022; x=1742549822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfnAPAp+R1qao5Wl5xlx5FtRla2ujtMfiADZ2nfdBAQ=;
        b=jiprBNos4BIuUtN4wx+VPeXMQK9XzNwhYgqo6O64VSNMUA4lSCxGzvPxSeX2TaXHpt
         scoHf59y31/XQ6U/yg7KNfaQa0OXr+pYvmbDMBVZ0Fi4FIII/ZKK885r2lDuGzpuTql+
         BNe740tksc+Xypp0NlnablXfZPJTbzTeBJOZ9eX92SubRPRCrjUdlxHmyz3WoUms984H
         u/yuXtkGPW+xQCpATghX+wR5eNQwQuOytjWKjKEux3XErP9grzeV5s3iN7h+AxGRxO7C
         VhOLyaaYXfQPsmnk0zwdV1MNy8T9obYHscpcE9M/N4rh0LZJtbKtS1oP/v4EmsEmX2Oo
         MCvw==
X-Forwarded-Encrypted: i=1; AJvYcCXNWFcrNG41VWTqUi+FkPfXKItFIqZZloBuJ0qXaSHcd2B+fbaniz/vgtDcGeNjmjZ1kUC4OBnza2VVPupk@vger.kernel.org
X-Gm-Message-State: AOJu0YyL0OyEeB1YjND5ZL8aphPteL3cWBHUMeJnej0R8oFYgoGWrr/Q
	2lWoSXl9ISgBwrO4bOufcECekuIGlXYYaSnPm0iGDhl/FCigk/GCME5nbPePIPKp5BreU337p+i
	J8my82XPbFLFXR1UX+cSErGUqonBQqRYUYpJcAm1LC81iS2xAwyMDo+zD1n5lu9ds
X-Gm-Gg: ASbGncsA297WpABFM/YneAAcvXJpAKwH4SlCLfMsW17W6+Fv2J4SQnaNnFUpuzjih1c
	lxGGtY65NK9YToeQer4M0mvrwBlAxh46pHsHF8IYxjEvXI6EMhBD6yr/fVrCwIt9SqWxQRlGvcK
	MqOuhdUqHUUdREtYUrboa6zKVG+LK8anzOiPN+Q2WD3cVyJsL9YzWz/G+Pg8H5XItMk483+xGGx
	yhH2FPMpGOIMV+8gdUBvSMOcEB3M6PtEsndfEsvuFrpatV+AW2ttBq3he4wSablus6ZLNsL3yve
	6I10wV86dSSZv+HPDXbqk9L/2dI17bAB58ZBx0QwIVjBC/V+FeUmIBXEBLkiW6gZql74iWeBKKZ
	X7GiCjo1sgR5LOTwdurpB3+sVVPuM
X-Received: by 2002:a05:6214:4606:b0:6e6:9b86:85d0 with SMTP id 6a1803df08f44-6eaddf047edmr86518896d6.8.1741945021765;
        Fri, 14 Mar 2025 02:37:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9R6JN0FXci6PacWxLW3IijDjh+4/mh8D4VFIDD4anPJXV7iyWYisApZ+3rhQVxcDkVem3Xg==
X-Received: by 2002:a05:6214:4606:b0:6e6:9b86:85d0 with SMTP id 6a1803df08f44-6eaddf047edmr86518726d6.8.1741945021360;
        Fri, 14 Mar 2025 02:37:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:36:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:36:49 +0200
Subject: [PATCH v6 2/4] drm/bridge: add function interface for DisplayPort
 audio implementation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-dp-hdmi-audio-v6-2-dbd228fa73d7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4882;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sPGFPs8Z9BJzKH3T0QhgjGfhe3qB0nROPdLNLb450jk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixcF0KVuK5O3qMfR6zk8CJZvUE1rfBf7MgP
 pa+lkcaIDiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1VicCACT3fkLWM99BgjcdDqMoVZ2qL5iU7A4kGDlUS1EZSsdCxqcqblOHmzmqUNwzLd9RdUp/3h
 lo59QNm+mnNht9pNC4D67dPwm/pcRPGYQhoaiT4BuXb3LYm6GcJ+hF2Zu/IopztZUn0PIVq6bDL
 wwBV4yjwOsyWjXW2eeQYBuZSckBS9VxsI8WWvo4IVE987p+00C1Rzrb5mPG/WeuXtRd+axXAt7e
 0itOGCNXFS96Q+xXEE+7KGP+zt1swUhg9f+oj8xDv+W9MoBrtjY1vXU4ecwMxWj+ln3mUrfwwNM
 50DU1B51imC85WLt7ZfFfpHR/Wg01cv58amOmkvZGODGisPp
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d3f8bf cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=4Yht-t6EeviOxvws5vEA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: CF1U-CFNaUTiCVYkE_78KFMxG2pCz6Rb
X-Proofpoint-ORIG-GUID: CF1U-CFNaUTiCVYkE_78KFMxG2pCz6Rb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075

It is common for the DisplayPort bridges to implement audio support. In
preparation to providing a generic framework for DP audio, add
corresponding interface to struct drm_bridge. As suggested by Maxime
for now this is mostly c&p of the corresponding HDMI audio API.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/drm/drm_bridge.h | 88 ++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 82 insertions(+), 6 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index c6b66f733fffa77afc875e52f9d1500fcb66400f..e8d0e56bcc91c1f4c689e4e6fbd2aceaf4fc5cf1 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -737,6 +737,65 @@ struct drm_bridge_funcs {
 				      struct drm_bridge *bridge,
 				      bool enable, int direction);
 
+	/**
+	 * @dp_audio_startup:
+	 *
+	 * Called when ASoC starts a DisplayPort audio stream setup.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_startup)(struct drm_connector *connector,
+				  struct drm_bridge *bridge);
+
+	/**
+	 * @dp_audio_prepare:
+	 * Configures DisplayPort audio stream. Can be called multiple
+	 * times for each setup.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_prepare)(struct drm_connector *connector,
+				  struct drm_bridge *bridge,
+				  struct hdmi_codec_daifmt *fmt,
+				  struct hdmi_codec_params *hparms);
+
+	/**
+	 * @dp_audio_shutdown:
+	 *
+	 * Shut down the DisplayPort audio stream.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	void (*dp_audio_shutdown)(struct drm_connector *connector,
+				    struct drm_bridge *bridge);
+
+	/**
+	 * @dp_audio_mute_stream:
+	 *
+	 * Mute/unmute DisplayPort audio stream.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_DP_AUDIO flag in their &drm_bridge->ops.
+	 *
+	 * Returns:
+	 * 0 on success, a negative error code otherwise
+	 */
+	int (*dp_audio_mute_stream)(struct drm_connector *connector,
+				      struct drm_bridge *bridge,
+				      bool enable, int direction);
+
 	/**
 	 * @debugfs_init:
 	 *
@@ -830,9 +889,24 @@ enum drm_bridge_ops {
 	 *
 	 * Note: currently there can be at most one bridge in a chain that sets
 	 * this bit. This is to simplify corresponding glue code in connector
-	 * drivers.
+	 * drivers. Also it is not possible to have a bridge in the chain that
+	 * sets @DRM_BRIDGE_OP_DP_AUDIO if there is a bridge that sets this
+	 * flag.
 	 */
 	DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
+	/**
+	 * @DRM_BRIDGE_OP_DP_AUDIO: The bridge provides DisplayPort audio operations.
+	 * Bridges that set this flag must implement the
+	 * &drm_bridge_funcs->dp_audio_prepare and
+	 * &drm_bridge_funcs->dp_audio_shutdown callbacks.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers. Also it is not possible to have a bridge in the chain that
+	 * sets @DRM_BRIDGE_OP_HDMI_AUDIO if there is a bridge that sets this
+	 * flag.
+	 */
+	DRM_BRIDGE_OP_DP_AUDIO = BIT(6),
 };
 
 /**
@@ -934,25 +1008,27 @@ struct drm_bridge {
 
 	/**
 	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec if
-	 * @DRM_BRIDGE_OP_HDMI_AUDIO is set.
+	 * either of @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO is set.
 	 */
 	struct device *hdmi_audio_dev;
 
 	/**
 	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
-	 * I2S channels for the bridge that sets @DRM_BRIDGE_OP_HDMI_AUDIO.
+	 * I2S channels for the @DRM_BRIDGE_OP_HDMI_AUDIO or
+	 * @DRM_BRIDGE_OP_DP_AUDIO.
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
 	/**
 	 * @hdmi_audio_spdif_playback: set if this bridge has S/PDIF playback
-	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO
+	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO or @DRM_BRIDGE_OP_DP_AUDIO.
 	 */
 	unsigned int hdmi_audio_spdif_playback : 1;
 
 	/**
-	 * @hdmi_audio_dai_port: sound DAI port for @DRM_BRIDGE_OP_HDMI_AUDIO,
-	 * -1 if it is not used.
+	 * @hdmi_audio_dai_port: sound DAI port for either of
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO and @DRM_BRIDGE_OP_DP_AUDIO, -1 if it is
+	 * not used.
 	 */
 	int hdmi_audio_dai_port;
 };

-- 
2.39.5


