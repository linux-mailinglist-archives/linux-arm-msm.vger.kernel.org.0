Return-Path: <linux-arm-msm+bounces-70691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FCB34356
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:19:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CFFC189F25F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:19:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BE92FE05F;
	Mon, 25 Aug 2025 14:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqX/wJcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DC52FE05B
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131475; cv=none; b=F3tDmzJ3Kgkg8d6RPpjUl3ugeBDHYmXND2j+tcmkdgnY8aIEmOUDfyGd02cU+6+80p8bSZnNEhooHeMfxIsB8EJaLGQMVtjNXkFqZxt3hTJjVJn8Rlxf4jwAZxfrfoW0akNNFYNXxVgUdBYOF5BhFq1GQcuNbQUbG2YxJBHgNNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131475; c=relaxed/simple;
	bh=Y3mBQMu8i0yptDOPl+HEAhENVyzSOBDITRS06WOJX4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D+FcUkbyJwM5ccQXAQy4PjkscmKZHimQ3KFMSlcO+WOL5bSuWIkANLgi2uiYujDUik5wZFZjipQSmVB0wsZuotamkeVuoDrKTJYt1cUTZwV66NvFFtP3vuxOqIzE4ALTgRKl13TnV8B9EFgHw+l5XzEtYKY9V6e+MqRQqbZ53Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqX/wJcT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8EIXw001167
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KugB/lBYbS+s3dqphJMlpBFe1NsSwNAbfXTjg/sGCOw=; b=dqX/wJcTvCqmS5nP
	o+QVTrtm7+HK2sdR7nbCELCVcc3FagT/NKjiW60j0TqVPFrotFEnY9V2xmf2so1l
	fIvS5kAIln9HpDfYDYF6GjbaopMeuMXOH282eSJpumKgsVDVrSL4/bw4AaH+0gd7
	rrvVNRfNHMjm3nnW4207KEmFHVJI3vegiQhXSJi4WA49pjtSiJ267kHthlGcpYnO
	gJQKTcpvE14j2dIuRt26HGa13KsBXbBkbS72hJqHzr0SpU3IBA6LVbxGFUPcsAvK
	ISC6oiULJ1huFBlEr5MUcW+n23hzj+szm+C+gRuwZjk3C6CrbGmwT1Qz8KXgHKpK
	E4ASeg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdw85c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:52 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-771e43775c8so670470b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131471; x=1756736271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KugB/lBYbS+s3dqphJMlpBFe1NsSwNAbfXTjg/sGCOw=;
        b=eDkbY9lvrQSp63ksn7YDk9vi4hKhMw8Vn+O1nQ0hbilWjuWtO6gQdMzkcARE1H7KEB
         AxEmIZb71+35Q9Wqg/HRiSVS28rRGA+pkAjyFvi/3CAJRzxhS8wtd2DK3YUtB1Vj0Hyl
         GzmZMzvVo76bX6QvGTBMBEHqGq+flRLI6wOzyTshEgtrny+xwY2XGBkXFuFO+WZ9M92v
         E//nAwYqS+vz8Z0fFPoZmpci6sgSoCB25hnsJBKK68dJeK5S+CzJRNS+WlXqSD3jppOG
         gW+dBTx2DCM0UeZqm+SV6qULW5uPQbmQ5v4cjQ1bTCzsblU4r10XKpl39kZ7d2Ytni3f
         EQeg==
X-Gm-Message-State: AOJu0YxiyijE6scNx77zxXoRQG/r9Av+WQmcnlXBs0veJonX/s2sZIEY
	JKLs+02YFx0MS+5F7NSgmdiFtKpCzIgPpBQPtO14Ln+ytiDQU+m9NhQ5g9RXMneCx8x2z8N0lzR
	yUH2aeEjQ1bka8EwoOOTpSKZk1GMcudTZItlByN9x65nDpbCFjKPyWa+BVCy8n+8Aa7/z
X-Gm-Gg: ASbGncv85bQP75jb93AzHQhilOrB/KA1NqaMiJ5TtUqOMypPFW/7rnwr6P8F3HCO9hf
	4ksPVgoDNh5YrXLyyfzVggye+Vzqbxrisu45RbaJQansGQegeDHkWDlSZmFL7VfWsYkQ6bJnX7s
	oxKhGYjmuM4tJHABBAJaO7+NU7q/qClfUVdPJ0pm/lGMDjeaZXy7Gbr8Sh29mybZIXrVT46q53V
	t0odQRnozIESTz455NXZHe8ohCtL8B8xtig8p+3eykVzWT2FgyBX8iU7EsiT9ejzG7oQsuInaNc
	DRiRDV2+ASYejpa2dhPyPFXb7vaXTGVrmsTng1AiwcPwAAAj9s3EvX1VE+SXLgAOTDhyNXE=
X-Received: by 2002:a05:6a00:4088:b0:770:4753:b984 with SMTP id d2e1a72fcca58-7704753bbf6mr10686929b3a.16.1756131470604;
        Mon, 25 Aug 2025 07:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESblHr8j5NFyLN5uWT6iFyICWQfQtyu/HKk7Hdm+TtQVYAYSZzGRYOzkrj7SkUFw6lTnEbEA==
X-Received: by 2002:a05:6a00:4088:b0:770:4753:b984 with SMTP id d2e1a72fcca58-7704753bbf6mr10686886b3a.16.1756131470070;
        Mon, 25 Aug 2025 07:17:50 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:49 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:56 +0800
Subject: [PATCH v3 10/38] drm/msm/dp: make bridge helpers use dp_display to
 allow re-use
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-10-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131420; l=9466;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=L994Yy2QrMAOiXO+x2w/GZyZBMG20Sb7wl+50OQR9Vs=;
 b=lSDFMm6CWvGhNucrPveqSxz7GjSC/0X3EOcKyFyqCimdElz3VzVR1l1Nsbp96Qt9UPY4VDTan
 nTrqaPPpkfSD7J29Dx7BKLq2RNzW5+O/rHLyOegRYKYFhex/rnlXnQm
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-GUID: 12ZCF_hZ8qngvluPKIJJjI02TWQ5c46e
X-Proofpoint-ORIG-GUID: 12ZCF_hZ8qngvluPKIJJjI02TWQ5c46e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX0ag/RQgz+iNo
 OnTa1ScG+euK4AWssdkBMFsXY8nVuKiwg1KQH5+Zi7SUH374eIDjKVy6KWE+Foy/gSE4M2JksFD
 sEWMk/AAavZtIIkcHNykA5F6aGo515K6ygfs2MYcyl3UDfmAHubyHGTbQboQ0XujiZeDYJf0AoX
 jI8PCRglEmyyDGUmdQrHs4Fxo6OTBgFTzOu5r1/MTP8ZP52kGm4O6qUnbyEAllCjN/46qLA0K0M
 0a5u9aF6mzQ2xF3gzHTahhSewPx2FqCn6FCZUZP6Ox2ADI69CsUgWE1M11m44xH1a07jbIKmAmP
 sMQpSE8BxkoQZ8EP1utX7ynmVXJfWCbjGCVU4RZuYz3D6i99F6GAGbp0d4exQeqydtNu0jboPWV
 CWVRLE9r
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ac7090 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=iEZZ7kfMCVqEHj8YyOgA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

dp_bridge helpers take drm_bridge as an input and extract the
dp_display object to be used in the dp_display module. Rather than
doing it in a roundabout way, directly pass the dp_display object
to these helpers so that the MST bridge can also re-use the same
helpers.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++-----------------
 drivers/gpu/drm/msm/dp/dp_display.h |  9 +++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 49 ++++++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/dp/dp_drm.h     | 12 ---------
 4 files changed, 67 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c5c502e51b94a6ac4b9a893b43eb88e87a0c0d46..8e95cfb98bd08088a707ffb5643a5021a288095f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -806,24 +806,21 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp)
 
 /**
  * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
- * @bridge: Pointer to drm bridge structure
+ * @dp: Pointer to dp display structure
  * @info: display info
  * @mode: Pointer to drm mode structure
  * Returns: Validity status for specified mode
  */
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode)
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode)
 {
 	const u32 num_components = 3, default_bpp = 24;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_link_info *link_info;
 	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
-	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
 
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
 	if (!dp || !mode_pclk_khz || !dp->connector) {
 		DRM_ERROR("invalid params\n");
 		return -EINVAL;
@@ -1441,11 +1438,8 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_state *state)
+void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
 	int rc = 0;
 	struct msm_dp_display_private *dp;
 
@@ -1475,11 +1469,8 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(msm_dp_display->drm_dev, "type=%d Done\n", msm_dp_display->connector_type);
 }
 
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_state *state)
+void msm_dp_display_atomic_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1496,11 +1487,8 @@ static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
 	msm_dp_display->prepared = false;
 }
 
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_state *state)
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 
 	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
@@ -1520,12 +1508,10 @@ void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 }
 
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode)
+void msm_dp_display_mode_set(struct msm_dp *dp,
+			     const struct drm_display_mode *mode,
+			     const struct drm_display_mode *adjusted_mode)
 {
-	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(drm_bridge);
-	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
 	struct msm_dp_display_private *msm_dp_display;
 	struct msm_dp_panel *msm_dp_panel;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 2fbf16f27842bb7639efaa2baecac7bdf8908432..e12496ac73f853a2bc120e68eeb84e5a2de6aabe 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -36,5 +36,14 @@ void msm_dp_display_signal_audio_start(struct msm_dp *msm_dp_display);
 void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display);
 void msm_dp_display_set_psr(struct msm_dp *dp, bool enter);
 void msm_dp_display_debugfs_init(struct msm_dp *msm_dp_display, struct dentry *dentry, bool is_edp);
+void msm_dp_display_atomic_post_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_disable(struct msm_dp *dp_display);
+void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
+void msm_dp_display_mode_set(struct msm_dp *dp,
+			     const struct drm_display_mode *mode,
+			     const struct drm_display_mode *adjusted_mode);
+enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
+					       const struct drm_display_info *info,
+					       const struct drm_display_mode *mode);
 
 #endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index f935093c4df4681770ab487916584cc76834b0d0..b6b77ee96c30ca60e31cf76569e262a237493aeb 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -81,6 +81,53 @@ static void msm_dp_bridge_debugfs_init(struct drm_bridge *bridge, struct dentry
 	msm_dp_display_debugfs_init(dp, root, false);
 }
 
+static void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
+					struct drm_atomic_state *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_enable(dp);
+}
+
+static void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
+					 struct drm_atomic_state *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_disable(dp);
+}
+
+static void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
+					      struct drm_atomic_state *state)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_atomic_post_disable(dp);
+}
+
+static void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
+				   const struct drm_display_mode *mode,
+				   const struct drm_display_mode *adjusted_mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	msm_dp_display_mode_set(dp, mode, adjusted_mode);
+}
+
+static enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *drm_bridge,
+						     const struct drm_display_info *info,
+						     const struct drm_display_mode *mode)
+{
+	struct msm_dp_bridge *dp_bridge = to_dp_bridge(drm_bridge);
+	struct msm_dp *dp = dp_bridge->msm_dp_display;
+
+	return msm_dp_display_mode_valid(dp, info, mode);
+}
+
 static const struct drm_bridge_funcs msm_dp_bridge_ops = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state   = drm_atomic_helper_bridge_destroy_state,
@@ -149,7 +196,7 @@ static void msm_edp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	msm_dp_bridge_atomic_enable(drm_bridge, state);
+	msm_dp_display_atomic_enable(dp);
 }
 
 static void msm_edp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 0d026bc9becf777aee192b9200197f477012bf8f..1066bb181a50b462203647618db6386e72a8eb32 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -26,18 +26,6 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   bool yuv_supported);
 
 enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector);
-void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
-				 struct drm_atomic_state *state);
-void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,
-				  struct drm_atomic_state *state);
-void msm_dp_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
-				       struct drm_atomic_state *state);
-enum drm_mode_status msm_dp_bridge_mode_valid(struct drm_bridge *bridge,
-					  const struct drm_display_info *info,
-					  const struct drm_display_mode *mode);
-void msm_dp_bridge_mode_set(struct drm_bridge *drm_bridge,
-			const struct drm_display_mode *mode,
-			const struct drm_display_mode *adjusted_mode);
 void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,

-- 
2.34.1


