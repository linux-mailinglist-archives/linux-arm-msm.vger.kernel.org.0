Return-Path: <linux-arm-msm+bounces-67587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D9AB193EA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C7B73B63F3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:54:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 563A42222CA;
	Sun,  3 Aug 2025 11:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BfVw/9to"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71451C2334
	for <linux-arm-msm@vger.kernel.org>; Sun,  3 Aug 2025 11:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754222048; cv=none; b=WzIP8JfUQHPIYMs1VegYYFoRSCWo5dMzFT4MfxlKQrwCYZwebUmoZHcVl12/CeSMlowAYqnqLNAZMxxrMcEW5I+jJpTj87QMUA68+7Wip1J12ousdbTvwzQfI7QXgSg7WywR0f3ijban6ifj6lmBYkt+g4n/YnfVuUscnXrCvqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754222048; c=relaxed/simple;
	bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rO5Sk6PIevGR8R1qczTorl7qYQxt0GxuyOpGmBY4jNmt2r7RXs3UXwbHbJJ7h7RqDc5FeeAvJuyon7aNawCGD+lc0sG5k1T9q/yzOudHRjrRxWYF/bYWnh8+pvJ4FgeUSNzODl159jhH7JzrnM+pNuV1PzDodAgyWCPZL8Mr7CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BfVw/9to; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5739wg1x032171
	for <linux-arm-msm@vger.kernel.org>; Sun, 3 Aug 2025 11:54:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=BfVw/9to//LrIK8s
	VXJEXmVCiEgN+jwiLXUa3IP/qCazSwoZtY70Xrf3yuj98LPBQk74JI/K4rccamH8
	fjRfoSpT0qochLZPvtOcknVP7vFVn1OZ2BcSJM1IPDvs5bPb/2BmOIHlYR1PtHmH
	H5LZPked8kVU9kUEEpf05MiOctYkAT9dCd3K58ueTYKKlSdEifLYfQ9qGowHJ+bg
	TryaGyR58PBWa1/7YLv1bnd9OInRSvBH1azQZ+eWjIbqWfNBPaPhfMritNCtgFIS
	RkAEJ33RKnb+WlV0Y37gz7uoWi+7nlWtece6CWzaxxTHlPhmXiwA5/hrP5rNSWS7
	yrOBpA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4899paaag4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 11:54:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e65340b626so603318285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Aug 2025 04:54:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754222044; x=1754826844;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=;
        b=Q0duXfSb1zBC2jJJfBl3FZVb62Idqm/TCpUBoIcGIaw6etHSrXfHqk/ux8QHjpedb2
         Jj+fy/ZwyJeCjy3aRNUbxdMshsrhJPbGxjJnDMjZyuOoeuHiZDtsb/JxeNzJAoJVq63o
         VEzEbhfx+5fYqtYMS2GV7VxgJGKmoGbKT6XgnJhD2t1zkCpHGKizqVCFmmtrmbRUzUfd
         qZ56kFSuVM2WR1TeaKh9jJsj67gORE4/uigF7UOuUMJ6DxlQwHPiFmdOJqa7KIczV/lq
         GN/KMVGj6Lx1LU72qcX4A7BBj+zjT00fMfiVC4UGzo/rdllxVzsshDshJP6Mys2XDXqd
         vccQ==
X-Forwarded-Encrypted: i=1; AJvYcCV63s4aFpPVQAgjs1XeQ6ZnJfrNwp8MM03A2fklORcNFmrFUZ1hOH3SEGHVF6xBTxPVsbUvoC/ikA0QhHLc@vger.kernel.org
X-Gm-Message-State: AOJu0YwoCmJA2Plu0YB8kUMrm4xcgBjl+3j/Ui4D+HZUNArkn+3EVOpf
	wQXa/hlpKplAujJ8qD0tRNWqlGdlzlqON06A/wZqaL/nZ/lqI/kuuuF4ITYBk3ziIAli90xG9R3
	rhClMw/NrQSf7IAMs0zg5eocdYngHBxEXwTkkvq2+IjISz+WPnEkZe9auBP62iWRtmLSF
X-Gm-Gg: ASbGncs8sSpsKGcHmlW8SgSc0gAnYqvsgQJYo110yWiRI2oz3JR8/rmx5yLvmpcGwlF
	KkEt/JNrgpU9eb2KeI7VaSE0ybtqINsk96iMs+j6w2PJbiVKNotlHA9vtXLoe+2jJtdVDRTEnjF
	4J/2h6n9KTI5+pBSo38Yw7J9HREl1U+/7esUNXTLEAm/c6g6hTnu/ipvkQEO8qYjdpDVW0s2Pic
	ANrfcKJrYjYjiv8lWpGyoMBIgNvktGJ404z6Lchok4NvcfVY8qtHgpMhwm+ckrHjOgXNv29SX6C
	AXbBxruPTAraKctWf88/NiEV3HhTwQvheN1PJVkeG7ONqlmWXR29xE9MtsehsEMU9GqLxQntgGe
	yiQTbo1HzVaW9m7b3D62GxZB+qF7qNdFfs+9O3dB/LmQzNVhcw3AG
X-Received: by 2002:a05:620a:a512:b0:7e3:4413:e492 with SMTP id af79cd13be357-7e6963b6948mr669907085a.62.1754222044438;
        Sun, 03 Aug 2025 04:54:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi7Z0g+HyOmwylpAHIiombJAZTJQt2apb7Na+ugRVHriOOOlyXxwTa0sV5vkEVVpsO/Em1Bg==
X-Received: by 2002:a05:620a:a512:b0:7e3:4413:e492 with SMTP id af79cd13be357-7e6963b6948mr669902785a.62.1754222043929;
        Sun, 03 Aug 2025 04:54:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-332382a6f74sm13281731fa.20.2025.08.03.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Aug 2025 04:53:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 03 Aug 2025 14:53:51 +0300
Subject: [PATCH RESEND 1/2] drm/bridge: add connector argument to
 .hpd_notify callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250803-lt9611uxc-hdmi-v1-1-cb9ce1793acf@oss.qualcomm.com>
References: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
In-Reply-To: <20250803-lt9611uxc-hdmi-v1-0-cb9ce1793acf@oss.qualcomm.com>
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
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoj03TORatWDOhTPjdc70eBEsioKoAJxcth/ivq
 6H3TOAa2NaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaI9N0wAKCRCLPIo+Aiko
 1QxoB/4i8bbQq2ZRNNqvbwxjSBbSZKHD3rqd1LvOlKVXxTCw9xRz7M59eO61jbwviaJTjcUWHtr
 nat0Tkw4bP4fyurXtBFoiOk5cjelwMu530WZgg72N7d4pTcMgIaNVqiOVnXdSybVb57migXZRtW
 ahHeSSx7JKf534W/gUtiNJ5HZV1UEIDs8AVUPdLYZ34oZ3rcwTPS0PnFafnn9n0/GDPT5WUE2JR
 1aPLLB5OixRNVZW19DBu7pO7f6V8vgUkBVwmVlApeKGve4pHDLA9H4ASGTTie+Mf/kPC+y3YDFu
 r8DUxHju5Qzz75JBY5gJEUuBL4zPUX+E/EF/F/p89lW3t9qW
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3OCBTYWx0ZWRfX0iaUVSahBaL5
 FYIOe+RKfrRReirrxI/0ctbTw+Ma3yAiwwtcsqe27ZJlGYsL14I8wmyBNpXYvVmxGyfDWtSFhaS
 ITf/CU8BS9FtUR4dZjrHym33aot+aJFgLnXf6MFT5+dUlp5o6F+np5e9pTLgKKrZwy127H3IVf7
 8yVZKO5BXE4UxxVXVqRSiybASxeqfMSELrldCl/rwF49WHR4hIwnxszZwt/Iauz+qKlPyp2u/06
 +G1PomBORqmjEhyBBtr8CVxXvrzE/hBEauEY4F0XXAu/gwdnK9RqjqThaMTN28U0oGWx0coiZND
 +aP0eKOwj5Y6IL0NEQN6usB4oUx2URnZhroU01cddabyO5Dql7F4bmN9XFMehl9Za+TaysNZFyx
 u6nd7xyDz05X4AKQsP0w4lJ0z5DWAcXueGaXka0xtr+IZAyIj1orF2SeCPp2WG9JrsH2hmn5
X-Proofpoint-GUID: 8EJbZtDs32ci-fjHGyEtuQ9FTPVPPUpz
X-Authority-Analysis: v=2.4 cv=N88pF39B c=1 sm=1 tr=0 ts=688f4ddd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=H7fCCF_eaumybVcuHoAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 8EJbZtDs32ci-fjHGyEtuQ9FTPVPPUpz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030078

Drivers might need to update DRM connector in the
drm_bridge_funcs.hpd_notify callback (e.g. it might be necessary to
update EDID before setting ELD). Add corresponding argument to the
callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 1 +
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 1 +
 include/drm/drm_bridge.h                       | 1 +
 6 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 5eb7e9bfe36116c9618cd3773f1c01e7ebb573be..f2fd277d694b8c959f913517ff5861b777d8a9dd 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -141,7 +141,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, status);
+			bridge->funcs->hpd_notify(bridge, connector, status);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 8205ee56a691ee7d166b16cfce6932d0308fe6c4..a665c9036878c1e879b7bd88df1d523658fe8849 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,6 +323,7 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 }
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
+					  struct drm_connector *connector,
 					  enum drm_connector_status status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..0676b3423abcb31ac3ea6e6269473764786133ed 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1774,7 +1774,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 }
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status)
+			      struct drm_connector *connector,
+			      enum drm_connector_status status)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index d8c9b905f8bfb5abe47c1cb26d17bc605e3e1ba6..9eb3431dd93adf096f45b6d981967734bc8a2b0c 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -40,6 +40,7 @@ void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
-			  enum drm_connector_status status);
+			      struct drm_connector *connector,
+			      enum drm_connector_status status);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 3cd612af24498b057c33eaecb3d43c8df76cd23e..29b2dfb90b5fa3b137d05725d65a1cccb9cd1345 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -428,6 +428,7 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 }
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
+				    struct drm_connector *connector,
 				    enum drm_connector_status status)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8ed80cad77ec4b40d0aa6159e802a2839d5b8792..1e73d72c55426ec21905070a13b44aa36b02e023 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -730,6 +730,7 @@ struct drm_bridge_funcs {
 	 * controllers for HDMI bridges.
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
+			   struct drm_connector *connector,
 			   enum drm_connector_status status);
 
 	/**

-- 
2.39.5


