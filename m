Return-Path: <linux-arm-msm+bounces-89144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F9BD22DF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 08:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27BF430E6CC2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7372C329E62;
	Thu, 15 Jan 2026 07:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QChqDDhQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WwOS89AQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89C4335099
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768462162; cv=none; b=aUPKN7qMHgWRu/U8Fob+5LCVA/cwgQy3T58a8BN/HcXV5DEgwG2Yka1RcAi9LItBifhirc13oCrh2+XDz/UTEf1+/5xy090+DbNuJIjtzYPpEj4AeVLOxwgj6AgU+r/Xu7qKjXBxBrfGldoKS/HtF0AgwsABXesiNE/Okd4xKH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768462162; c=relaxed/simple;
	bh=OWRdOQlqAgZDHEFjFECShBR1RF+bUr9ZLUwiZwlLTKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T1xsn9JXH/hUwmtLk47PifHMV2KlXHuV4S4VghTvULBf4muH1/3Ytdf+91+b9T+NsB87F+X0stGTcMmftNvKEwh7rFpVJUIk64nH44ioQ49/ewRuVZHXTGlK/b+/2Q9kGnpjP/jQLAOc9NEnQmFlZH10kSTQ0hpKtL8v/RlzeGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QChqDDhQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WwOS89AQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6fnEl606482
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=; b=QChqDDhQ+ZNKSQ2t
	6udelvrDHnhlqimBU5vWWtvyf3amZGORYl/j2Q/q4I8DPn6QV2BvR+c0QJ8f+xl+
	V+tqumiqLbzUF0EuYX2c9v/0+V75JXOvILK7PrHfIryNgNNJxylejL+WIxNK3c8c
	eIUTJEAvKgRPF8PRrBRKijr779OtcnvK1aEGho//BLHJpy9h5U/PIb+AgpR4rrsj
	v/k2N23VVMu0iEzdZVpNo0/N3QCdxiCpS9Q0sp+1uWrgLZhOay6X2kXaXGfVQsGb
	ye7jh9hTHvBeTpAlAKC4cT46SlsY66U1ZjoUt84N303/t58ymB5eOzwV2gUyPGGD
	VG0zKQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna06sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 07:29:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c52c921886so81678285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 23:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768462158; x=1769066958; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
        b=WwOS89AQWd/fXTQQTrJWVgsOnaYaIag55nKPjT99q7EKus1qGA1RK+6CtipzhCgnYW
         ACP9yFamJngOi42cE2RaciEuBz51fJXM80aq+pts1H0a7lMoS/0NVHGZnbw5qqhir/Ub
         9ddhRw7NMMaKp5//tuTx6Yvf9Gk2L2zReWQ69XWeqL1cfaQ7GzrXqj9lKHaxsh0uRzf4
         dA/nrYNFmFpYxKBWPtOay8sl53P6hD4wlk3gYXrfa1Q/jMQgDpOjwvWc3WFSBcfHust8
         cePng9wybv3YhcTHLxnpOTlEm6yf3oqNZgx6AsZX2Tc3kO6qi2FM+Z2Y1ruJzz5Khb9a
         n5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768462158; x=1769066958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SKcwhb+xWTwW8lIkUoC+RbFacXz+V1PCsboLX21gXQg=;
        b=tvgQvzAGkRZZYhVjFpjf+Qi/4PAkGDg0KV6tt9uG1mnxtO51o847parmPYMOBcNX03
         etXnHO532spZ4xhKD6nauk8kwIn0uEpYOyK1Nsr0NyIhkRnGDWWSXnU/u/eF4mv6Ljc+
         RC8yQrPGnHKGaA77sHZgzgygbwTH5qJa8BXQLZIfU++IQCikpPOVmapB9oHta50f1a0U
         cQva9QXLnfjls0sb2NS4/Qe+wALwZ/812u8cPtT2iIcLM95FWtDqr6DZmuAy+iTRtu2A
         rdtLQ2yEMrO4L2BGr4mbquZrV0kjHTzVgpI+rOc1JpUNlGt7EFpB9iLD44sdV/ApXg2Y
         tsLw==
X-Gm-Message-State: AOJu0YyjPJ7/BkpEXaZeVeu02ZaKARCOnG/y6R5lA6RiUvvNd9BgBWaq
	oZR5EkEi2aM6B82MN9+30YennspyA5V2AApQPr2QNkOLVphZlsAmktY6PyM1Pu2lT+15FokxR1G
	DJqJFy6ILUg608Hj4N34Dq6b5FYnmdYv6dZQ/yJt+jLvzYpgs+fp0fM/XV1ybV4cjWykY
X-Gm-Gg: AY/fxX5rNTqzvhFzA3ZfbJAOCoSCCElSEFprtM55fJsEivIJz2JfTc25xLz3ApGEmDP
	saUVdztpGY2xTXGUWwZ7eXaY16w5MoxDRtmEnnyYqA38IV7YPkAkJKVaADEkU6dw79CP61kM8kD
	qAYDNxC3y9HGgrAkBUkMB2TWGu7lDFdJx3nCBadKWULlPd7Kqn5qLDKr1lpJMmB9KrPHeBFG/lM
	OgkbhNkDFSU8f8WKk/rzvG3WRtfMVBzoK7yMGGIkMzPhYZc7Be/SdHGZ5bNJTnWKif/jFV1mj/M
	uutwegM+Zud8TymqyZvNSb9WTTyHOrkzRIq1v5879pC+MjWwdicKRwIMzNccOJ5f76E1XBypz72
	5KIE578qFX6AJQfSC76vHK9SPGU+FijfKvT7pEE+TwODL3S1tFn5WOh3eBOXQzLa3DSNgGxktXU
	ADDBZPKaLLkPGEtkqwqJ4fz4A=
X-Received: by 2002:a05:620a:1aa0:b0:8c5:391f:1dc8 with SMTP id af79cd13be357-8c5391f20c9mr360109785a.8.1768462157956;
        Wed, 14 Jan 2026 23:29:17 -0800 (PST)
X-Received: by 2002:a05:620a:1aa0:b0:8c5:391f:1dc8 with SMTP id af79cd13be357-8c5391f20c9mr360107185a.8.1768462157456;
        Wed, 14 Jan 2026 23:29:17 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 23:29:16 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 09:29:08 +0200
Subject: [PATCH v3 3/8] drm/msm/dp: Read DPCD and sink count in bridge
 detect()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-hpd-refactor-v3-3-08e2f3bcd2e0@oss.qualcomm.com>
References: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
In-Reply-To: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4422;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Fflo70A3oSMP6LkHXNPuDEYg6XV8ot0GBkcmgzq2Sd4=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGlol0OivLl6on31pVXR7v4POr3PP4wwtB7kPm4JaLlWM899d
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJpaJdDAAoJEIs8ij4CKSjVAv8H/RxK
 4vcM55F3t2HfQGy/N9jSrzxJoUl2O/G09gBg5g/vA77U5dkM30CVBMwMdMrDhVJ4XE7Lrm4nHm1
 WOS6FAL+uJ9sgIIGruel9b2rVZAFd5xP4Pu0obH9qT4r7bBVIIwaZPeC2H4If3AQjvk1tuibe3i
 qA80BEyM2GpVKZlEjH5lboDiXVADopIFcJXmSJSmcwdOFCHto2CdoATvmNwsGe/YhyAMrdSGh/5
 zGFuSE31wBa/3MiMbjLO/QEpOWrvassaGnhYYPciDu3hNz7B9LL1PStJpvapQacW7TO6FCTd5Fm
 1S3hZzUL5iTkrNOMfaygYTc5ykwuwrRJAO7nPQQ=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: HPJ0s0nYN4csEVajE1UieNls6Wo6d50z
X-Proofpoint-ORIG-GUID: HPJ0s0nYN4csEVajE1UieNls6Wo6d50z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfX8JL13slMnl47
 vwv4aHkAG2sAKiRK2HfPQ3NZXmxwnXOu3iQfKzQ8uNqtGitcwQuCndJ+cfF70xBjUvrxjRIl9mL
 CTLNZoqFsXFkS0m1ynkCPbAFCiw4iYrBDlV5mvWLYLPQlgaTl53+QCE/wJN31qT6dK5ZLuYb3tp
 HMxRSyMObCgfyfUXUw1Jx21kvkWv51NVT9+6xhce5M5VLP8VeVuYK3i7B+6jD6pkJP9NhEJF2QC
 DRQKM9bxwEATbQdivxVdQM0KDO5p85u685y6duTQ8pTQ1JzrftjwRlsyWDULuvPo7I+EwuaqSGB
 daK2BWZIaMi8v3P/ILoxAK9U8A62lAODozSzAXLpvMiY3QRZOB5d+i0NWHi5xj0Mxr4wsRPFkvC
 DwjgYju7bXhMif+XuL7W/f5ERq5MvVu7NVN62LUYqnn4i5WQeRqgpyeKef2+4hXMXmROuuYSupo
 5BkxLKjnD53zHSGG9+Q==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=6968974e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jcEwYMPARZwhhGfK5pwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150049

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Instead of relying on the link_ready flag to specify if DP is connected,
read the DPCD bits and get the sink count to accurately detect if DP is
connected.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 60 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_drm.c     | 20 -------------
 drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
 3 files changed, 62 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 5997cd28ba11..a05144de3b93 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1151,6 +1151,66 @@ static int msm_dp_hpd_event_thread_start(struct msm_dp_display_private *msm_dp_p
 	return 0;
 }
 
+/**
+ * msm_dp_bridge_detect - callback to determine if connector is connected
+ * @bridge: Pointer to drm bridge structure
+ * @connector: Pointer to drm connector structure
+ * Returns: Bridge's 'is connected' status
+ */
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector)
+{
+	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
+	struct msm_dp *dp = msm_dp_bridge->msm_dp_display;
+	struct msm_dp_display_private *priv;
+	int ret = 0;
+	int status = connector_status_disconnected;
+	u8 dpcd[DP_RECEIVER_CAP_SIZE];
+	struct drm_dp_desc desc;
+
+	dp = to_dp_bridge(bridge)->msm_dp_display;
+
+	priv = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	if (!dp->link_ready)
+		return status;
+
+	msm_dp_aux_enable_xfers(priv->aux, true);
+
+	ret = pm_runtime_resume_and_get(&dp->pdev->dev);
+	if (ret) {
+		DRM_ERROR("failed to pm_runtime_resume\n");
+		msm_dp_aux_enable_xfers(priv->aux, false);
+		return status;
+	}
+
+	ret = msm_dp_aux_is_link_connected(priv->aux);
+	if (dp->internal_hpd && !ret)
+		goto end;
+
+	ret = drm_dp_read_dpcd_caps(priv->aux, dpcd);
+	if (ret)
+		goto end;
+
+	ret = drm_dp_read_desc(priv->aux, &desc, drm_dp_is_branch(dpcd));
+	if (ret)
+		goto end;
+
+	status = connector_status_connected;
+	if (drm_dp_read_sink_count_cap(connector, dpcd, &desc)) {
+		int sink_count = drm_dp_read_sink_count(priv->aux);
+
+		drm_dbg_dp(dp->drm_dev, "sink_count = %d\n", sink_count);
+
+		if (sink_count <= 0)
+			status = connector_status_disconnected;
+	}
+
+end:
+	pm_runtime_put_sync(&dp->pdev->dev);
+	return status;
+}
+
 static irqreturn_t msm_dp_display_irq_handler(int irq, void *dev_id)
 {
 	struct msm_dp_display_private *dp = dev_id;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index fd6443d2b6ce..e4622c85fb66 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -15,26 +15,6 @@
 #include "dp_audio.h"
 #include "dp_drm.h"
 
-/**
- * msm_dp_bridge_detect - callback to determine if connector is connected
- * @bridge: Pointer to drm bridge structure
- * @connector: Pointer to drm connector structure
- * Returns: Bridge's 'is connected' status
- */
-static enum drm_connector_status
-msm_dp_bridge_detect(struct drm_bridge *bridge, struct drm_connector *connector)
-{
-	struct msm_dp *dp;
-
-	dp = to_dp_bridge(bridge)->msm_dp_display;
-
-	drm_dbg_dp(dp->drm_dev, "link_ready = %s\n",
-		str_true_false(dp->link_ready));
-
-	return (dp->link_ready) ? connector_status_connected :
-					connector_status_disconnected;
-}
-
 static int msm_dp_bridge_atomic_check(struct drm_bridge *bridge,
 			    struct drm_bridge_state *bridge_state,
 			    struct drm_crtc_state *crtc_state,
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index 9eb3431dd93a..6c0426803d78 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -25,6 +25,8 @@ int msm_dp_bridge_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 		   struct drm_encoder *encoder,
 		   bool yuv_supported);
 
+enum drm_connector_status msm_dp_bridge_detect(struct drm_bridge *bridge,
+					       struct drm_connector *connector);
 void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 				 struct drm_atomic_state *state);
 void msm_dp_bridge_atomic_disable(struct drm_bridge *drm_bridge,

-- 
2.47.3


