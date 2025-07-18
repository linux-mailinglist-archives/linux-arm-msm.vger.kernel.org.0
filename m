Return-Path: <linux-arm-msm+bounces-65674-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99185B0A7AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 17:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 388A73A045A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 15:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61A12DECA1;
	Fri, 18 Jul 2025 15:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VrDSLmWS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20096770FE
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752852573; cv=none; b=SsBlHObtZVFVoC1l9XQ6zRzWAU6YzhMiFv/fdbkAhbf6e2JpFzfaIQQkiwOcldKJKAoe98T/3oH1bLaRL9hBzvWVOn6TjjP2OTJPCodWkojSBcaRtekmey41c6DaNPckhclASWukfyfINfQrGJvPYDTsSELe0dHEYv7SDq8uBZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752852573; c=relaxed/simple;
	bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JP4rYIJS3klgDYZ4vW5RCvNrQnio0s0IicaORjEBHle/867iMphzNFhYTUGpfb7++SoC1l8sdmqS6MBdDddUgqm7FxWfl4EKbj0vx53ifVvl9W4DSZJ4qu/UYhxqm0ZLxDAuR7NqapkAS6zhuvH9KZKCogYO7VyBeV746dhU8bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrDSLmWS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8tPwV007424
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=; b=VrDSLmWS/fBuwTcb
	05J7LPH6Cz+belbs7qtt/Lx0NORZ1V/C/d6EAFXc1vIrQRBz0uFlwCeytXmlnP9x
	nxPjxBa/heOJFz4DAnvUC1JNx2OX7A9qoDlcg1RO1fnmfc/dFmBmSCfbN71NI/Gc
	Qc4LEolwTW/yIXHvha4V5MQO8v1TIDvYVq7qmN+1FLSWyj7aYAzfSEMfCsBBYePx
	reP3dV3zMwrn0cXXa2JI1W6JCcZcNQehVsf7HxqExk31n3MQLq0fkkqas/efJ1so
	IAZQ3O8LftQAJaHeYqbocS1/nW+ceBO579IkjZ/F+yezBxXdff5lbC8pNdETnyFr
	7gqXQA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47wfcad886-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 15:29:31 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fad8b4c92cso53858406d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 08:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752852570; x=1753457370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/oORSppSKRqpXAIbhDBrPILKMZmvRllnTYhAy76NbA=;
        b=d3x7K04m0/VXd6KKSnWx3UVznBrkUp17Xn1j941T5RPrEssTutAbZWzGK1ax7dSDY6
         xTcEc1Uy44HMerx+qXelOUlN0NLetew8Y4/E09jMpukEazovaSCbJUQ4sO+3SR8PlJdX
         zbIPO3ssTInwnGN0dNxLE56N5cMkOW9UTlAcQUdSZVo9KSUxfbAui5CJzvH3CzXHrEyJ
         Yo7ae5+2/uYg3D4ymYUeuRnpIJQ3tmAhF54xOxsd37G1Ni7k+38MEJdv6VYUMmEBjTjH
         +qBW005tFhcf2xyWHek3G+NtNPVLorrxjGjK4ICd+Aj+kaGUYGO+Jl68wV/hepBROk16
         U9Gg==
X-Forwarded-Encrypted: i=1; AJvYcCUR1B+vHBRgEACMl1YS9MVltAGdbPdGQUyVCIVM9PsnkscWCsPuETvZZDCb7SOYUPSDbZu0p1/pbEQYweDk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe91RagWWAXlAmSbmCraLFJ11giceauVlMsDC0ffPa5U29KjeC
	1HiCEue6TEK7ZrSzf39q23/rU+HlDhRYq/UXzGu0sICWzc5VbBmIVukaj/0747mZgYEDXnSJ/rw
	CXmeNjvSmArjke5xD8Zrbtmxq5i+wiNt8zp0rv6bLHWstrEjscvHIfmV9CPBx7nT7N3mLBsB0ff
	OR
X-Gm-Gg: ASbGnctVFIr5+r8NKRRtR3Whx+JGijCgNoH6MCZTsTwwJs1UrIGhOHq9TSEYRCmtv6Z
	0Dj8lyJwGyhttPqerorKEsk1uqOwqTWiVxGxTcDEpKkIHBubHDKAtSeh5Qu1itKPD819xiqZ2X+
	6/xY430meMnbvSe1/TS9BcYMe/JCsXWAGwTwvN7v09YXwtg7p9zPH8m8pdG1Tq+RcixK7hA5iMK
	k8nRgllb6KPouFk3OPx4a7hkTst0sL322cSBor/Uu+4pltAI8yhhyj8GU1Xtt7xhCCxxsXsGbgc
	6RbAXOc/HYDD5nUAXNgJ5xOhtckAKDRCg7b7ZhBbMcKA3gCPA0le0Q3Y8da7Y6OvkiFOnWdVAMQ
	PJBhnuVr2aRfCsRL+b7PpcIR71iC8ZWVIR7n6XlSosbrLxqYALpTu
X-Received: by 2002:a05:6102:3f43:b0:4e4:5ed0:19b2 with SMTP id ada2fe7eead31-4f9ab2c1238mr1838420137.9.1752852100747;
        Fri, 18 Jul 2025 08:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXlyUsMs9U0U+O1wbUBh1xpkP1sDmfvcZCUKPqD7lL2WBQwooK09f3VjD66V4Apt17hOmKBw==
X-Received: by 2002:a05:6122:2982:b0:531:2afc:463e with SMTP id 71dfb90a1353d-5376473b9c8mr1645131e0c.5.1752852073027;
        Fri, 18 Jul 2025 08:21:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 18:21:08 +0300
Subject: [PATCH 1/2] drm/bridge: add connector argument to .hpd_notify
 callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-lt9611uxc-hdmi-v1-1-0aa8dd26a57a@oss.qualcomm.com>
References: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
In-Reply-To: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DqScOxpZEjas1EiNHxjLEq5FN9iLRQvzJiWpGwrXHf0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmjN+Omvftf4kFa7jkLpiochHZs/3UCyjEQ
 KJocwTiOuOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1WMYCACXfUOHlzufAnv7BolBNMuOWQAeu8OseKQIIQ3KxLuNSMdFlg+PMVybvtBqqW6SAy/QCIM
 lCj8zp7+vQG7lcPnFFiHw3Lfou9u2k/+h5nFwZov6t0LG/8WCRGN2SVHr2eh3mMZPLlRB5NVPRL
 TnrsG/OQab8Jy2JDPyOaCFZu8+GjdYU5lDOJQ82IdRVZ0kGD3wKHiANCYz9UUJouAvEkp8igRyN
 b5GhFmELHKA9+Jlqw3HruviFWFQCo0IefgOAeq64gHFK0MJYaIAKduKw6tSd6U4xHoW+95qydOK
 MiOzZn+V5ZV3n3MBx3uYUNVRbpcaek2Y83IJJGVa2xJpB5+9
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfXzg6wUD/0+MTa
 4jjQC062XMS3rjTT0efNq8IQVLSz2D4aIaGidkIbc0KA1a5h9yTG1jl6Iw6yOdyGuuIqQoYtJBc
 a1GSvBeuaNZnXGMVZa202bcjRjmqZSNBvPOAFBGaRGPrQo97xshHEXy//J9fdPKJeaMECUSc4Z3
 UavJ+5W1oyzfIfNy+cWVEk0foA4Oh6/v46eDyZWTnbBdGoQAmfQehfvAbVid6C0jjoXRgwrxrGD
 CcKhi16lyv9aFjenI2JKCiUiLbzjPMZz8krnK00dbPj6CPM3pMELVtPsYfPSP9sIe+qd/OW1F8C
 3swzdY+7SysOvKkjLizfNOiix60CWk2W+ekBBpaOyUt/WNSjL/eGOJ9VhADJ1f0vLDc4JioVTGf
 RErlzQDBhMvbdm3BiR5/3dHnPfyXw7c0MM1RaJ7wHV+ISIxPfPc7R3ln7e+Cz54FuNfipXMh
X-Proofpoint-GUID: vkL1DLRvJn6HV2IPEShgF0GWtkoRCebb
X-Authority-Analysis: v=2.4 cv=SeX3duRu c=1 sm=1 tr=0 ts=687a685b cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=H7fCCF_eaumybVcuHoAA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: vkL1DLRvJn6HV2IPEShgF0GWtkoRCebb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180119

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


