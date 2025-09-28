Return-Path: <linux-arm-msm+bounces-75411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB4FBA6B52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 10:26:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B080A3A28B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 08:26:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 864FA2C0F81;
	Sun, 28 Sep 2025 08:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CQwlpWSP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C512C0290
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759047924; cv=none; b=HZYQBh9KIxVKjJTWVocULz5Pl3Uycp+05Av1sDbmb8AOGcp6J4kOImY9SIpTozM5394Y9E8mRMRt/zjduuTb1LbEX2Bt7FSOVtFw9LdGbSBs5jsTHLsFtDtQWuskLPjWovh0X41CvM3JeXMEhFaB7LGtIm9QCG4AzjWUhJcSHsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759047924; c=relaxed/simple;
	bh=L5F+9hmws1ws8sHBg3j3OZgk+hUi3reLwHH9RQ7UEnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QP0zKwJ6ptLS6QWltrXmgHv4BbRANfNncvHqv7nprsxsHRcyahy2rkBZcioSKBcD/q4/qz9kpy8dwAQYQGcmFpmuJU2b7/wvKsCWA8u4t0Gt+aVJUVwZYSBKA3gP1D3AOV3pMW/uTTLn5TOvcmo3VEcxqnmKgpGNPOSOIYBzbjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CQwlpWSP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58S5EgLT022836
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pDGCMgEwnjTnK4X9AKh+cUPiYlJXGC7VErq2j1leXiI=; b=CQwlpWSPQTUYPWV9
	T++W2n23NdFXAGo1Oz5z8OuzR4V3TeLUenpqXGIpk6WYUxPrjn49tZT0hSwqL55g
	J5Xt+JQu5RonBzt814SibeYMkhy+zbJZZjccY4PQJ594iadgVRvoihEd+7fZNr7r
	jaqGQqHzycvMp1fdvVD3NTjQXQHTPU7+KhjxYZSKu5yOctkUnqfRvpMI1gY9t3/I
	/kzRaY/Rr/vhFjLdw8XekRdt6WOqYUc0aV5TRNu5KmkaEF4+OFrUsAAYq02hvrKj
	Zrp/WG2XXIb8D5RIo9Mw0GlfIN0a/GOto/OqkHMWqsE9piZYG1kBl8Me8sGetgjn
	XX6KrA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5tcrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 08:25:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e002f413e4so5278571cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Sep 2025 01:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759047921; x=1759652721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pDGCMgEwnjTnK4X9AKh+cUPiYlJXGC7VErq2j1leXiI=;
        b=LjOu/yYzneZuU4A0s9mdexg3svif3AIScxq4dtpf+rcUfGM2RU7GW4FlGQy980ZaG8
         fK5oSpxE+wblgomcxrJlPzrVF+DtJ4I+tsldwe2A/3g7bfXvdI5aBHViSVrxxxQKyY8O
         r51kGB/ArWEeFMEVvs1BCQHEkUz/jzs22STWlk+OkpQ9Vf2tJZhM91TRVjM4OWrcvIPN
         id5W6cEG7IgGSzFwsdrI6anHUr1D+aT4+eN92HTWPMgurigU3Yq7sEVwgv0ZtbrY2KD0
         gGxozzBcKY1OSpcKiXHadJdFS09Tl95LA4T9elrn1Wn/AFQWnufcQ+mcf6sRYCKoX8lN
         3ewg==
X-Forwarded-Encrypted: i=1; AJvYcCUm54t3rvuriZcNzrOTPcPdvZpuhwvK3jjLZwL+slgVLC+v+zKXriRMFKUTt0fqoEacoPX9w0oiUpsATwuQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzpCSHpyW3wU9prDX7OKNd/4AZevRYQbKBM9tZnEPgMsHbL274a
	8U2a8NmUI5/IDXooRK47Y+b2T+gyJJk4t1flzYfyOv3GG9Fhsr6gnalrTuvNCEYMrFIuyAVkFeJ
	uqhWfeLFmvhRf/fsZGyajLo41mDZgK2q1AjeFT/q0wIwJ9dztG3tABoX6YgiIfPqn9i4b
X-Gm-Gg: ASbGncsxzQLQExp+BC6KgbErTMDMi86qTeAoio7PQ5fSwWCVar1wo+gDPkSuFALgveX
	1tumcBryxNl2cJHUOCX8nH2a75khKIZIgH23N/pFQVfdyzbnJ1ePClOVemUNromOQEhPKc8TrRB
	FWYnyfH6qS9cE+RKftm6ABeWGiUg2oVcWWOTGoN2MymLeEYyp3P5HCkMKTKCokboYZK7T3f7AYy
	if/DqYo6F4GKzKo077bFvIZJQ5VAyHkBS7DiTT1QNnXmgZE/k2o/K9HG0JPQT/8L8uaTMFcptbI
	h415wLR6K1dX6CYbtWbSg5v6r1pveeR4N6AP3tQGLVM6w0z4m3sqgZA/u7ZthHKMWEyt6vFC/PJ
	lIi9wULYjvxLmOBdG/OYL0CrD80emMjWN6jiWFOSunUKJcPOejIO9
X-Received: by 2002:ac8:7d8e:0:b0:4cf:6b60:8814 with SMTP id d75a77b69052e-4da4c39d551mr157223631cf.70.1759047920655;
        Sun, 28 Sep 2025 01:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEs63wvjlOp3xMxlD61SlugRb128ix3vSdkzbHU2oqtBagfbingC8Ut4nFepJQEg0y1xF3nfQ==
X-Received: by 2002:ac8:7d8e:0:b0:4cf:6b60:8814 with SMTP id d75a77b69052e-4da4c39d551mr157223271cf.70.1759047920172;
        Sun, 28 Sep 2025 01:25:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-583166561c0sm3244298e87.81.2025.09.28.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 01:25:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Sep 2025 11:24:53 +0300
Subject: [PATCH v2 8/9] drm/rockchip: inno-hdmi: handle unsupported
 InfoFrames
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-limit-infoframes-2-v2-8-6f8f5fd04214@oss.qualcomm.com>
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
In-Reply-To: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L5F+9hmws1ws8sHBg3j3OZgk+hUi3reLwHH9RQ7UEnU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBo2PDU9uR0Y3DH7A3+x8geiLghZLN7tPC7B3SOj
 e6zCefBhf6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaNjw1AAKCRCLPIo+Aiko
 1Ru6B/9PE+eUbg3q9YXlFXZd6EPBBkP5lZgICQEKOE0FuYIcvp6aqj8KRAYaSBf3nOEsYkh6Cmv
 izDSG7gqnOYbJtZa1DBmYqSXwcIYU9x3PqJtOca9yASpRyYkvVH8b9c8vz/LfL2SFkM0iWK3/HE
 oPq0/r5tSjjrJ9u5/+s1evNujBe86ROuzIpMMbVVTj5U9sJ0LQhBHpdBVmwkbN9cfVxuaUmhUo4
 +hHRrX+QqJ0qvxolviQQVzyaLLE7VuP4ZbG/H5NauVJRDGd6YUABlNx7xw9adhsUxwugFv2UAs5
 CL2oRovfS/3sNkx1Xb25MSdesvX4wPFuG9Dy5chHmg0qOIxr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68d8f0f1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=Uj443JZPoyhSIAxeSSAA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: qUet6rpvfy5SLW3fGFvX9EVz3gRHNk6Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX1qEyAYUQvbbE
 MHAFHnxSY5GexuOOCqMzq+IH/B1XIUnpUBXGLvEk3eEuRGVLrfNP8Ml7tIn9XVbDlh5LvLU1YSf
 EAkUmboj4QMkeopwX721LuVstgAzSkZg2aLzjD2fWGp+fgUNY3/GCW0ex50pBht1ovGitzDXWKO
 z5K3fd6INbnWNnh/sRRb9tppCo6J3YV0Do0tuZxJeBVzjDJvOMHTqNk1/3lhWpBA3KEzL/pTTXN
 fWfHUNoP67IxjiC2fHOhKQqq6sieAJYUb240jR0OxCvf9JVVG2zBeNHD0DCJ7QBZGhKB+OfySHT
 hHo2pM/7xtSfhKzSHUYJav5JccjxTJ8uZUmJq4MXN0/bmiDk4/7h8xs2R0Aw2xvPvQvFFxuzfLJ
 KgerBT+oLzLY2AFy0hHzmk0Slln//A==
X-Proofpoint-ORIG-GUID: qUet6rpvfy5SLW3fGFvX9EVz3gRHNk6Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-28_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033

Make write_hdmi_infoframe() and clear_infoframe() callbacks
return -EOPNOTSUPP for unsupported InfoFrames and make sure that
atomic_check() callback doesn't allow unsupported InfoFrames to be
enabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/rockchip/inno_hdmi.c | 47 +++++++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f24827dc1421cf5e0c1be63a80da23d645cf3f24..733294c6807da4663285ebd482181589c37f960a 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -641,13 +641,11 @@ static int inno_hdmi_disable_frame(struct drm_connector *connector,
 {
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	hdmi_writeb(hdmi, HDMI_CONTROL_PACKET_BUF_INDEX, INFOFRAME_AVI);
+	// XXX: this doesn't seem to actually disable the infoframe.
 
 	return 0;
 }
@@ -659,11 +657,8 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	struct inno_hdmi *hdmi = connector_to_inno_hdmi(connector);
 	ssize_t i;
 
-	if (type != HDMI_INFOFRAME_TYPE_AVI) {
-		drm_err(connector->dev,
-			"Unsupported infoframe type: %u\n", type);
-		return 0;
-	}
+	if (type != HDMI_INFOFRAME_TYPE_AVI)
+		return -EOPNOTSUPP;
 
 	inno_hdmi_disable_frame(connector, type);
 
@@ -673,6 +668,36 @@ static int inno_hdmi_upload_frame(struct drm_connector *connector,
 	return 0;
 }
 
+static int inno_hdmi_connector_atomic_check(struct drm_connector *connector,
+					    struct drm_atomic_state *state)
+{
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	int ret;
+
+	ret = drm_atomic_helper_connector_hdmi_check(connector, state);
+	if (ret)
+		return ret;
+
+	/* not supported by the driver */
+	conn_state->hdmi.infoframes.spd.set = false;
+
+	/* FIXME: not supported by the driver */
+	conn_state->hdmi.infoframes.hdmi.set = false;
+
+	/* should not happen, audio support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     connector->hdmi.infoframes.audio.set))
+		return -EOPNOTSUPP;
+
+	/* should not happen, HDR support not enabled */
+	if (drm_WARN_ON_ONCE(connector->dev,
+			     conn_state->hdmi.infoframes.hdr_drm.set))
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
 static const struct drm_connector_hdmi_funcs inno_hdmi_hdmi_connector_funcs = {
 	.clear_infoframe	= inno_hdmi_disable_frame,
 	.write_infoframe	= inno_hdmi_upload_frame,
@@ -1029,7 +1054,7 @@ static const struct drm_connector_funcs inno_hdmi_connector_funcs = {
 };
 
 static struct drm_connector_helper_funcs inno_hdmi_connector_helper_funcs = {
-	.atomic_check = drm_atomic_helper_connector_hdmi_check,
+	.atomic_check = inno_hdmi_connector_atomic_check,
 	.get_modes = inno_hdmi_connector_get_modes,
 	.mode_valid = inno_hdmi_connector_mode_valid,
 };

-- 
2.47.3


