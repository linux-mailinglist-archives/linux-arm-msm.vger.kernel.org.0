Return-Path: <linux-arm-msm+bounces-51394-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C7A60D73
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 10:37:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3896A19C5234
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Mar 2025 09:37:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E5B21F0E5A;
	Fri, 14 Mar 2025 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aIpaRfn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861B1EF0B9
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741945022; cv=none; b=DZg2QiAf0Ox6cd0+/TWvTeE4jQKFZv/9gaFLKcqyH7e8SBOxyKu5/4kIEmVHI/K6EsZFIYES8O0+VPmpt7HCcrTTnFyWvNTCLYCQqNbCTZ6UJyexnvf7ntIB9/6omhRNGinDqB8SOZz7f9qdlkLJK1FvM0Y2xAywRL7kD68GyUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741945022; c=relaxed/simple;
	bh=ec6nIsXxQrNgBPc/99nU3pCpdBGB+1zLuStr8IfxXPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ervnm2YW585VGP1D23cM5gG9F9QZQ5DWF3icWsf24Jyi6mxjxz88D96ch1FQBpbpIGWnd6/pfirr5xIoEOV+cqDKX07fNo8xLftcMlFt+TCjeW6WEMPXNNa9KN6GaM0+OFd6/paeVRhCwF1l652QMS2vJ8iTtkp0wFGRf42xUjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aIpaRfn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DMEqlY030364
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3BE6ik3JEHMZ1NgKof9i60DVCCDulBUMrxm358Ld44=; b=aIpaRfn3YqtSlHpj
	BEiCfp54SaXdYgBa4UqQ/GFhhMYhQrfOHBIc4Xq0f+q+AOaXrnCjTrI31rSDatxa
	hxlFjkxGFtfXQGbkJICISYiNsbSPQG5MHz1caALwHe9LRNQ4eg7NEnguVxtN+Wdu
	KOnQq/FgAid9krKXv0K/258cwYs7vyYx3b5F1IdeOXu32JXiFcpyaOcWQuvu/Y3E
	LbFJwQsP3gWepxZ2p5iU/cmjnRSJZyiY/swcdEWP35VnIMEje7Hj6yo4cKZSGcxT
	jn/u9uPRDPCI1+AyYtI6bsmBl1we5TvjwsIQQU36Ec9LFV8UI0DVTfVXUzjplin0
	63AA1A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qrr92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 09:36:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8ed78717eso35705006d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Mar 2025 02:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741945018; x=1742549818;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3BE6ik3JEHMZ1NgKof9i60DVCCDulBUMrxm358Ld44=;
        b=VsnX/pVfs+4XHaobp/OsnMPtIHOWW81RJ8gSgxx5I+PkehR+IGVJmbzUUWuh6rYdVH
         ocXIPAaS6GR1F4AMEXOKhotHJFJmLAVIfjrIfpuKy6hvvL37cIWc3VZpRfUB9+VlKyXx
         jVSY076lRlAspRihQMU/rYwktB5sJQBI4WytriY0zLqPk+yJmv0IzfWpkvZYHkiyeQq5
         Dyxwk7LbSwy7SWvy9WNegalgBJSRhQ+ZixooJ1E70HRoEAqvhrtZS83bcBWb9hnntPdp
         5rdy91rBByup1YI04d9deppc0wf3GaVXDZba+b2g8jW5ZwAQF+PVDQWbaVA5BOu65Mqs
         BJhw==
X-Forwarded-Encrypted: i=1; AJvYcCXdjcTHsplPJCBAEVSyx8ei9Twaf+Shm97CfOAF4iBW4IY3CvjjxJ0PZYN2i3hU0e2TsowfUe+OLASGxqcA@vger.kernel.org
X-Gm-Message-State: AOJu0YyKarF/sxISEl5DZ0XFRPqsJmyJ3QcouiwEx4VHg0ZHwZrWFNId
	uMTzL9VkFlhLazp8j9ucWvKa5Yk/ja4KpcFM8Vu/ihev+p5hu2qShwqksg+af2ijwICT8e7MsNU
	k4obEc+GomWXY4BYRG8Ni45Tx1iIt42mBqWd/bck+wiHDgMshTU/piVBvKoMu6NCl
X-Gm-Gg: ASbGncu2izQNCBOFePsjcV039l71hkpGwv8OVnF7oSXhHhr9CNIesdn/9dCfXf7I5D9
	UmlXkxa9qu+xpVKhYxOj2xlB7SJ44WJrJPpZdDJAYSrPcmDcdqYS6jon4AEmTn46lF4/JgPPRhT
	drEt1+bJhMVf8gU9PH22wGnClqr4UiwcBlwzGGO8rEYGdp3GHm4XvXntpdMAC4jD6O6JXpIj62D
	KjqO0mR8T9ayl7wjZeoKJ7D6kG8TLhpSdTqi9r4j2p+A88+QTVffHrAvVSQhB04DSgKS9AUpvWm
	YiyOke3EBDGsZn2n8v9OTcgBMMbF7z/XCDTFgRqY0xL21edTa4XKoDiQlfZxT8H9kb1iOR+Vkzg
	+nePRW/rPyQl1tALd0aXLjrB+8gLK
X-Received: by 2002:a05:6214:da3:b0:6e8:9797:f94e with SMTP id 6a1803df08f44-6eaeaaf7178mr19512906d6.35.1741945017922;
        Fri, 14 Mar 2025 02:36:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSNEaS2HhQ5e8HPlGtZT6eyjJim/p5gmh4hT0gHHUjVecBEl5EiQdprLPXcE1EJsy+ySRxgw==
X-Received: by 2002:a05:6214:da3:b0:6e8:9797:f94e with SMTP id 6a1803df08f44-6eaeaaf7178mr19512646d6.35.1741945017527;
        Fri, 14 Mar 2025 02:36:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7a8368sm478585e87.32.2025.03.14.02.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 02:36:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Mar 2025 11:36:48 +0200
Subject: [PATCH v6 1/4] drm/bridge: split HDMI Audio from
 DRM_BRIDGE_OP_HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-dp-hdmi-audio-v6-1-dbd228fa73d7@oss.qualcomm.com>
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
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10520;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ftPgm7yawXwdGOb7vf34ICo5af7jf0Sj9BanH4F+8/0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn0/ixq4SknkMu/WtIOJp3nymsxU+XB4omcfz+1
 1NMSRw2xTCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9P4sQAKCRCLPIo+Aiko
 1RmEB/43wfmVTdQOuXcMNe1f1o5xskST9a9GNFKibkBx2k1St0z3qVQcJ56f3Pz+vkEZq4L8e9d
 ZpadDpw7Kxt8R6+yqG7BIUp6bm/JyPswx+UtYEFaRwVHC3NrMdqdc7AF4ZHJS+DS0Amenb4nlCO
 x1/CqEUaHoesJ96N0EO9XahFxFVN0+AeS+wSlk0mxVjQh2EQ2JIggnoAdrmBExQxFYFcQ6OABoG
 klaaH2PilP0KdgtTPcHzHoakgjURM8I6ih/Pp8MCs5uJHZjn5Bsb3OdnMu9yO59P2DwmhlG57+D
 4NLufjgpVAaJ/R48U09bGoSR5x2VmV3HN+/z5EAHXHE+8nH0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: mIbf21De3YH0a5bzK-mPTbv4LZSTs4bS
X-Proofpoint-GUID: mIbf21De3YH0a5bzK-mPTbv4LZSTs4bS
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d3f8ba cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=h2q6pj4Fa84FeHWKbVkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_04,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140075

From: Dmitry Baryshkov <lumag@kernel.org>

As pointed out by Laurent, OP bits are supposed to describe operations.
Split DRM_BRIDGE_OP_HDMI_AUDIO from DRM_BRIDGE_OP_HDMI instead of
overloading DRM_BRIDGE_OP_HDMI.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c        |  2 +-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   |  1 +
 drivers/gpu/drm/display/drm_bridge_connector.c | 59 +++++++++++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c         |  1 +
 include/drm/drm_bridge.h                       | 46 ++++++++++++++------
 5 files changed, 76 insertions(+), 33 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 026803034231f78c17f619dc04119bdd9b2b6679..3b93c17e25c18ae0d13e9bb74553cf21dcc39f9d 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -1130,7 +1130,7 @@ static int lt9611_probe(struct i2c_client *client)
 	lt9611->bridge.of_node = client->dev.of_node;
 	lt9611->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_MODES |
-			     DRM_BRIDGE_OP_HDMI;
+			     DRM_BRIDGE_OP_HDMI | DRM_BRIDGE_OP_HDMI_AUDIO;
 	lt9611->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
 	lt9611->bridge.vendor = "Lontium";
 	lt9611->bridge.product = "LT9611";
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index 6166f197e37b552cb8a52b7b0d23ffc632f54557..5e5f8c2f95be1f5c4633f1093b17a00f9425bb37 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1077,6 +1077,7 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT |
 			   DRM_BRIDGE_OP_EDID |
 			   DRM_BRIDGE_OP_HDMI |
+			   DRM_BRIDGE_OP_HDMI_AUDIO |
 			   DRM_BRIDGE_OP_HPD;
 	hdmi->bridge.of_node = pdev->dev.of_node;
 	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 30c736fc0067e31a97db242e5b16ea8a5b4cf359..030f98d454608a63154827c65d4822d378df3b4c 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -98,6 +98,13 @@ struct drm_bridge_connector {
 	 * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
 	 */
 	struct drm_bridge *bridge_hdmi;
+	/**
+	 * @bridge_hdmi_audio:
+	 *
+	 * The bridge in the chain that implements necessary support for the
+	 * HDMI Audio infrastructure, if any (see &DRM_BRIDGE_OP_HDMI_AUDIO).
+	 */
+	struct drm_bridge *bridge_hdmi_audio;
 };
 
 #define to_drm_bridge_connector(x) \
@@ -433,7 +440,7 @@ static int drm_bridge_connector_audio_startup(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi;
+	bridge = bridge_connector->bridge_hdmi_audio;
 	if (!bridge)
 		return -EINVAL;
 
@@ -451,7 +458,7 @@ static int drm_bridge_connector_audio_prepare(struct drm_connector *connector,
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi;
+	bridge = bridge_connector->bridge_hdmi_audio;
 	if (!bridge)
 		return -EINVAL;
 
@@ -464,7 +471,7 @@ static void drm_bridge_connector_audio_shutdown(struct drm_connector *connector)
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi;
+	bridge = bridge_connector->bridge_hdmi_audio;
 	if (!bridge)
 		return;
 
@@ -478,7 +485,7 @@ static int drm_bridge_connector_audio_mute_stream(struct drm_connector *connecto
 		to_drm_bridge_connector(connector);
 	struct drm_bridge *bridge;
 
-	bridge = bridge_connector->bridge_hdmi;
+	bridge = bridge_connector->bridge_hdmi_audio;
 	if (!bridge)
 		return -EINVAL;
 
@@ -576,6 +583,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 				max_bpc = bridge->max_bpc;
 		}
 
+		if (bridge->ops & DRM_BRIDGE_OP_HDMI_AUDIO) {
+			if (bridge_connector->bridge_hdmi_audio)
+				return ERR_PTR(-EBUSY);
+
+			if (!bridge->hdmi_audio_max_i2s_playback_channels &&
+			    !bridge->hdmi_audio_spdif_playback)
+				return ERR_PTR(-EINVAL);
+
+			if (!bridge->funcs->hdmi_audio_prepare ||
+			    !bridge->funcs->hdmi_audio_shutdown)
+				return ERR_PTR(-EINVAL);
+
+			bridge_connector->bridge_hdmi_audio = bridge;
+		}
+
 		if (!drm_bridge_get_next_bridge(bridge))
 			connector_type = bridge->type;
 
@@ -611,22 +633,6 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 					       max_bpc);
 		if (ret)
 			return ERR_PTR(ret);
-
-		if (bridge->hdmi_audio_max_i2s_playback_channels ||
-		    bridge->hdmi_audio_spdif_playback) {
-			if (!bridge->funcs->hdmi_audio_prepare ||
-			    !bridge->funcs->hdmi_audio_shutdown)
-				return ERR_PTR(-EINVAL);
-
-			ret = drm_connector_hdmi_audio_init(connector,
-							    bridge->hdmi_audio_dev,
-							    &drm_bridge_connector_hdmi_audio_funcs,
-							    bridge->hdmi_audio_max_i2s_playback_channels,
-							    bridge->hdmi_audio_spdif_playback,
-							    bridge->hdmi_audio_dai_port);
-			if (ret)
-				return ERR_PTR(ret);
-		}
 	} else {
 		ret = drmm_connector_init(drm, connector,
 					  &drm_bridge_connector_funcs,
@@ -635,6 +641,19 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
 			return ERR_PTR(ret);
 	}
 
+	if (bridge_connector->bridge_hdmi_audio) {
+		bridge = bridge_connector->bridge_hdmi_audio;
+
+		ret = drm_connector_hdmi_audio_init(connector,
+						    bridge->hdmi_audio_dev,
+						    &drm_bridge_connector_hdmi_audio_funcs,
+						    bridge->hdmi_audio_max_i2s_playback_channels,
+						    bridge->hdmi_audio_spdif_playback,
+						    bridge->hdmi_audio_dai_port);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	drm_connector_helper_add(connector, &drm_bridge_connector_helper_funcs);
 
 	if (bridge_connector->bridge_hpd)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 1456354c8af4bc7f655e8a47e958e9e0b99b7d29..ab6c8bc4a30b681f7de8ca7031f833795d1f7d94 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -515,6 +515,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
 	bridge->ops = DRM_BRIDGE_OP_HPD |
 		DRM_BRIDGE_OP_DETECT |
 		DRM_BRIDGE_OP_HDMI |
+		DRM_BRIDGE_OP_HDMI_AUDIO |
 		DRM_BRIDGE_OP_EDID;
 	bridge->hdmi_audio_max_i2s_playback_channels = 8;
 	bridge->hdmi_audio_dev = &hdmi->pdev->dev;
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d4c75d59fa12be1bd7375ce3ea56415235781b28..c6b66f733fffa77afc875e52f9d1500fcb66400f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -681,8 +681,10 @@ struct drm_bridge_funcs {
 	/**
 	 * @hdmi_audio_startup:
 	 *
-	 * Called when ASoC starts an audio stream setup. The
-	 * @hdmi_audio_startup() is optional.
+	 * Called when ASoC starts an audio stream setup.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
@@ -693,8 +695,10 @@ struct drm_bridge_funcs {
 	/**
 	 * @hdmi_audio_prepare:
 	 * Configures HDMI-encoder for audio stream. Can be called multiple
-	 * times for each setup. Mandatory if HDMI audio is enabled in the
-	 * bridge's configuration.
+	 * times for each setup.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
@@ -707,8 +711,10 @@ struct drm_bridge_funcs {
 	/**
 	 * @hdmi_audio_shutdown:
 	 *
-	 * Shut down the audio stream. Mandatory if HDMI audio is enabled in
-	 * the bridge's configuration.
+	 * Shut down the audio stream.
+	 *
+	 * This callback is optional but it must be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
@@ -719,8 +725,10 @@ struct drm_bridge_funcs {
 	/**
 	 * @hdmi_audio_mute_stream:
 	 *
-	 * Mute/unmute HDMI audio stream. The @hdmi_audio_mute_stream callback
-	 * is optional.
+	 * Mute/unmute HDMI audio stream.
+	 *
+	 * This callback is optional, it can be implemented by bridges that
+	 * set the @DRM_BRIDGE_OP_HDMI_AUDIO flag in their &drm_bridge->ops.
 	 *
 	 * Returns:
 	 * 0 on success, a negative error code otherwise
@@ -814,6 +822,17 @@ enum drm_bridge_ops {
 	 * drivers.
 	 */
 	DRM_BRIDGE_OP_HDMI = BIT(4),
+	/**
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO: The bridge provides HDMI audio operations.
+	 * Bridges that set this flag must implement the
+	 * &drm_bridge_funcs->hdmi_audio_prepare and
+	 * &drm_bridge_funcs->hdmi_audio_shutdown callbacks.
+	 *
+	 * Note: currently there can be at most one bridge in a chain that sets
+	 * this bit. This is to simplify corresponding glue code in connector
+	 * drivers.
+	 */
+	DRM_BRIDGE_OP_HDMI_AUDIO = BIT(5),
 };
 
 /**
@@ -914,23 +933,26 @@ struct drm_bridge {
 	unsigned int max_bpc;
 
 	/**
-	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec
+	 * @hdmi_audio_dev: device to be used as a parent for the HDMI Codec if
+	 * @DRM_BRIDGE_OP_HDMI_AUDIO is set.
 	 */
 	struct device *hdmi_audio_dev;
 
 	/**
 	 * @hdmi_audio_max_i2s_playback_channels: maximum number of playback
-	 * I2S channels for the HDMI codec
+	 * I2S channels for the bridge that sets @DRM_BRIDGE_OP_HDMI_AUDIO.
 	 */
 	int hdmi_audio_max_i2s_playback_channels;
 
 	/**
-	 * @hdmi_audio_spdif_playback: set if HDMI codec has S/PDIF playback port
+	 * @hdmi_audio_spdif_playback: set if this bridge has S/PDIF playback
+	 * port for @DRM_BRIDGE_OP_HDMI_AUDIO
 	 */
 	unsigned int hdmi_audio_spdif_playback : 1;
 
 	/**
-	 * @hdmi_audio_dai_port: sound DAI port, -1 if it is not enabled
+	 * @hdmi_audio_dai_port: sound DAI port for @DRM_BRIDGE_OP_HDMI_AUDIO,
+	 * -1 if it is not used.
 	 */
 	int hdmi_audio_dai_port;
 };

-- 
2.39.5


