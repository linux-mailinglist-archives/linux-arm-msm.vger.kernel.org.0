Return-Path: <linux-arm-msm+bounces-72817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD94B5004D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 16:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7969A7B3225
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Sep 2025 14:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5C635A280;
	Tue,  9 Sep 2025 14:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZw9Owat"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F7C3570BF
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Sep 2025 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429560; cv=none; b=XnttIuZJYjVfc6Dv/8C1cuw5KMrfYBLzNTsF5WwSNBoEUBSTZ5qHRYx14G4rOsbx2pU05lyVpDb8vRnuouyXvaA+W8fyPbEZrFNEXDbGLbY69eSHw8JodYPhcmXDNoxwFCyFJZJyFEqO3FyWynO7SAAVcQu5vq73tqrQp3X5Bqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429560; c=relaxed/simple;
	bh=WvduT1qbRYo9sMATdr0cfogagyWfZym9JAGpyIFdd7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9sVUAGqQPzKcdBPRL2hkCoaRgJ1yuPQ+6lyoOCFKxWeeRKi5G/O+tU2j1s8k72vpVW94nDxSo23I5i/I5tArY/DAUPYI/8XMQeffklCZtpRKIxOV8A8OF9gVIBlnmiPZ767WZ5E9boIGmPtONT/j73EArcu2FCLk10MQ1zW/oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZw9Owat; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5899M129002266
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Sep 2025 14:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l9Z5uObkfX17ytwtS/hkOYbgTcwQucmA5+CIhqYDVSI=; b=SZw9Owat7M+hPDde
	VLW9jWV25LxsHJnfoY0WWEIgpl/+7gBglGj6T5phhPYTcfVZwEPc/IiBBzNeVnx8
	csnr5Bb18zMPGvmsnGRvV1vnFb49dzTsm04WcUvDxnDmHwoUB8OEdWLNqL19hvtf
	6MXOzwVHtnlyniNHCJWc6gNHXlnYtF1gbMXb8IsaZ2J4lwHDMdti12ekoSkw2DJI
	gVF82yZFmarm4vR5Y6iHgbikS3sNa17WPnLnsk8B3odF09EDzEjWXjfHNxNrQnSn
	O6X5x6KJOV/PIJHC80pZOfwoe6EFvufRqQktUI1DRaFDHmmqsFkqukgYLQ83ocib
	Ab2elA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg0e18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 14:52:38 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70de0bdb600so108446446d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Sep 2025 07:52:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757429557; x=1758034357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l9Z5uObkfX17ytwtS/hkOYbgTcwQucmA5+CIhqYDVSI=;
        b=SZh6yj1eGw5I/xUH5dizrzcKaAI9GKh10bnrw9VuQ4Qt3QrrgoaE2fpziBpZP1rMoU
         6VP5KSz7klXIm/x3I6hJD+vcC+epDtIY7PR0PWa68DxogUudMEs8hS3seo2IgngOBcEX
         a+LuK1mOnQrEbyarecCkUfrcpHEAgz1sRvm7rtVm4U2IFnyck7ro5xCJmyM346oYOlH1
         uG9PK8C5o1J9Yrkb/oXzFQ6mICdBNKUiTdKeofhPBT7NxOlDzrdw45nDI5ppbUsf588s
         WUD8lRfq9VZkdRkYW01q1vk8ROiqlWqjhSXlriK0TFVdvhz2kUVmTQLKwORTl4Ru4/Y4
         127g==
X-Forwarded-Encrypted: i=1; AJvYcCV1rm7LTkd5AIW+bvjdmOgkeDnBQAd/oEpqKQEPXDJFUYKD8w9qUH5mjOhaezmCAPRgh62tzAxu9hzKerQf@vger.kernel.org
X-Gm-Message-State: AOJu0YxBb/0jFngUzSj9bVQ2t5sRrFQ93TzGD4zK7BeNX338b20wXaQd
	2dy/DHn83dBWxpoCh0gobDBg3BVrMAhixOovxB7SCFFh/tO8wPDgS1Np+eqRw6t0yq8lLwUSphZ
	cIAXztN26cBRNtFVcR1fR2uvaNzuX2KhiL5wGTh5kPSmc1i7etCPglaw2sdqa29Bev2Vl
X-Gm-Gg: ASbGnct3kuEWCNGmDRxbGSCaavCNOWwNSv5ZRxinmrIHIqhgNYDNSfxqjf+p51jei+w
	6/k4PTx4IejuR8uFQIi4IbHDbvEiF0cHqYjdd4QXgQ9f0SCoAmQYy6ekD2anIOlSL8uHc80RJ1f
	zVxIDDHRcVIvvMr7xwzi1rw4ee58g6jWxjM/E/POLmyMtNBqo08lohB6z5TXYBiviB8QNsOqF9H
	0OJrA92ybCL7t97ZasYpeRYnHrWDqyZAuxBsVhSzQ8lK5CSy6IqsUxY2xt4r5/eFjjEefpCrIXq
	ssyn0LnmszjTe7Zlm2bGVO4yPrKHNFs52SHVGtAgYV+gFPefBvUMarNP/571HpgQ0RI32ELQQex
	c0OD0EwfE205rXxrvOvlh/mQj/YX8YTGSqs7okryzyuMISocFqdKv
X-Received: by 2002:a05:6214:4009:b0:720:4a66:d3ca with SMTP id 6a1803df08f44-73933639a08mr113606416d6.24.1757429556888;
        Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPHL4NfJJ/zE5chnvOJ1HeidR9Kl8e6gYNpoM3SLwwaEavBYImkLXu+5zH8Ed3CkO98L4A0w==
X-Received: by 2002:a05:6214:4009:b0:720:4a66:d3ca with SMTP id 6a1803df08f44-73933639a08mr113606016d6.24.1757429556265;
        Tue, 09 Sep 2025 07:52:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c90eb9sm38735781fa.22.2025.09.09.07.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 07:52:35 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 17:52:08 +0300
Subject: [PATCH v4 10/10] drm/display: hdmi-audio: warn if HDMI connector
 doesn't support Audio IF
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-drm-limit-infoframes-v4-10-53fd0a65a4a2@oss.qualcomm.com>
References: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
In-Reply-To: <20250909-drm-limit-infoframes-v4-0-53fd0a65a4a2@oss.qualcomm.com>
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
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Liu Ying <victor.liu@nxp.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Daniel Stone <daniels@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=WvduT1qbRYo9sMATdr0cfogagyWfZym9JAGpyIFdd7M=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBowD8b4ByVcFhNzN6vL9g+i6Xr5Ru20ekBbEAdJ
 +90fSIYze6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaMA/GwAKCRCLPIo+Aiko
 1WdkB/42MgipULdDGBHhJLj9Rn2m9Z+xg8n2+dwVvzMmGYgpA+PltLj7B5uOaXeKjVbIhMn7eYy
 Tzms6FQKTMnjfCE/3nJUZbGUl9kN8NBaJn9uXq14HKdFTcm7/m9nN2XW/f50ds9jrb83lrS+WzG
 1d9IvcNI2kh9ls+VF2uX750NKeykqE9uqnwxU88frDB1V/0wW632N6YQOrfX47F59xl3Xx5H9Mn
 nLXDnZAAIRGfTxDehtuvZo4ncNgOzGciZR6MuZQi0E/gquRXdMuCez2EHR03zdWeJWONeOAx8KL
 XZfA2cwtxgOTNy+164ThuwnMGvRhfMoUF7t/uJwK4H8+Gh+O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZKcvTO4rVhC1X0kOSXxZTVYKu7PLtYLO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfXzYbaH93V6AUd
 ILtjxjQ3jVnh5w1/XFd4GVBfBxipa3dSb0u98DLZKAy9vGfJDF7oPNkj5hIkqVLwWM4Awuxjk20
 x5l9PdRbNngF/XW9yww7WY96aNKQEqt0s4O1yjpus3GpsaOcle1fQhuDmM2iTTQX9yng4g5vDSI
 BhNfQ5Bfc6zD9udasCJcZa3C5duf2PHZCnY5wjKTv3YuS9JmReE3lQ0sUtrAYGh5xD10iRDqwMA
 osiCyGYElGwLl9WVwoup30TcVVRCh8l+PshISiKlsxcN30RPusvPlU11ffj3Ui47Mm0ThkkNR3v
 oviscUBqRJchMpuE9ZsBORrS5XzWIwp/QcpYqdG1+tEMHZE3OkzkA7AB7I5UexBzjmPdFhkKKYn
 H2mSk7YI
X-Proofpoint-GUID: ZKcvTO4rVhC1X0kOSXxZTVYKu7PLtYLO
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c03f36 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8
 a=Yc4j0DFJudTMt519TXkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_02,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035

Sending Audio InfoFrames is mandatory for getting audio to work over the
HDMI link. Warn if the driver requests HDMI audio support for the HDMI
connector, but there is no support for Audio InfoFrames.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_hdmi_audio_helper.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
index 7d78b02c144621de528b40b1425f25e465edd1ae..35e0e79cb683a68af813344aa86c154c3a5531fe 100644
--- a/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_audio_helper.c
@@ -10,6 +10,7 @@
 
 #include <drm/drm_connector.h>
 #include <drm/drm_device.h>
+#include <drm/drm_print.h>
 #include <drm/display/drm_hdmi_audio_helper.h>
 
 #include <sound/hdmi-codec.h>
@@ -178,6 +179,17 @@ int drm_connector_hdmi_audio_init(struct drm_connector *connector,
 	    !funcs->shutdown)
 		return -EINVAL;
 
+	if (connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
+	    connector->connector_type == DRM_MODE_CONNECTOR_HDMIB) {
+		unsigned long supported_infoframes =
+			connector->hdmi.supported_infoframes;
+
+		if (supported_infoframes &&
+		    !(supported_infoframes & DRM_CONNECTOR_INFOFRAME_AUDIO))
+			drm_warn(connector->dev, "HDMI Audio with no support for Audio InfoFrames\n");
+	}
+
+
 	connector->hdmi_audio.funcs = funcs;
 	connector->hdmi_audio.dai_port = dai_port;
 

-- 
2.47.3


