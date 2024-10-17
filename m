Return-Path: <linux-arm-msm+bounces-34654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B639A17BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 03:22:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 780B1B22989
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 01:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC353CF6A;
	Thu, 17 Oct 2024 01:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bKjgSR8V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEBF1CD15;
	Thu, 17 Oct 2024 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128098; cv=none; b=eNZRmmx2SL8l3d391hLu9Qm0mSsX24LwN/j7UBdoBnE4nkqo4Qg3Fe5o7ZRcBIvqUiYDBZKwRGYUJJ8Sgpb7fP1x16QKrz4yerbhkSG8vZwOPbbJ96FZkWbm2vOrhNJUN8sYcZuzl1Q0/4od0XXUmCzTikVv/il0LjbD9Zajqno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128098; c=relaxed/simple;
	bh=kk/aNH6h0SrIeW7khzIck6nV3YxohoAAM6O3S3PqBF8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sDyS/qNYXk6fH3P6+xkI+KmOnGLWi26DIA2bKdnwW5HMqqaG3J4WLOFQOiERRmzIdmQckvRKGzyZemxgfbJS/WNIN6ItAiW425MH6ur2nZqY4vhnGf8PrjV7NUQbdaxq78JOZVyIoRd1bmq/2G3SdIA4MJhnySOsWWCgrD+NgYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bKjgSR8V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GFhIll000567;
	Thu, 17 Oct 2024 01:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWlNjiR3d49N+JeZj1nmqmbAAMvTQssU1U0PanHsQ9U=; b=bKjgSR8VcWKzkKm8
	h4pHtNuPohD0mNI0+Oau9KQeZCRW9g6PAeeoMD30mWdbxPwkFKdQj6DzZMHOt6sT
	gleWe/MiiFz/I1kvEPRdBBCBys8Qc0v6gaPwM/DAeR2UzLl2AY52OjuFVR9XZq6Z
	SHF92mUFO2/9x8QlB9p6BcKKq59lFRGMicbqju1vea0NtFZJIYya9N6btcMr0UiI
	i1RSq/Hkxt75xtoNhwHxqaNLTe6pkkNcwG+pJnctg/Wx3HACQdUZnBBLQWsOne+u
	aEDgsmOGEpGRtW/sYBIc8x1LRyrqYogi126LzeL5ZmQ0gpnF0XZad+Y6XVjDHCLl
	4xlalw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8nq2x84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:17 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LG4a001370
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:16 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:16 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:07 -0700
Subject: [PATCH v3 01/23] drm: add clone mode check for CRTC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-1-a33cf9b93835@quicinc.com>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
In-Reply-To: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=1915;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=kk/aNH6h0SrIeW7khzIck6nV3YxohoAAM6O3S3PqBF8=;
 b=/VnXMRSFefljtng0mSwBnP9+NbAiYyeTQsL7k84pzW45zmbSlFEzDzLc682KPOAOXbVqXRBpK
 l/RvISazKWpAUDuQ07WM1wkVf7SHPuqSdUJoRlT8jxSucWIDSt7h66X
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NzZWn1_lWkjahxa7jQSvNDIiypwDQcr3
X-Proofpoint-GUID: NzZWn1_lWkjahxa7jQSvNDIiypwDQcr3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=999 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170008

Add a common helper to check if the given CRTC state is in clone mode.
This can be used by drivers to help detect if a CRTC is being shared by
multiple encoders

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---

NOTE: The appropriate KUnit tests will be added in a separate series
---
 drivers/gpu/drm/drm_crtc.c | 20 ++++++++++++++++++++
 include/drm/drm_crtc.h     |  2 +-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 3488ff067c69bb820b36177c97bc9fe5d5cbfea1..46655339003db2a1b43441434839e26f61d79b4e 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -939,3 +939,23 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 	return 0;
 }
 EXPORT_SYMBOL(drm_crtc_create_scaling_filter_property);
+
+/**
+ * drm_crtc_in_clone_mode - check if the given CRTC state is in clone mode
+ *
+ * @crtc_state: CRTC state to check
+ *
+ * This function determines if the given CRTC state is being cloned by multiple
+ * encoders.
+ *
+ * RETURNS:
+ * True if the CRTC state is in clone mode. False otherwise
+ */
+bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
+{
+	if (!crtc_state)
+		return false;
+
+	return hweight32(crtc_state->encoder_mask) > 1;
+}
+EXPORT_SYMBOL(drm_crtc_in_clone_mode);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3143c7de176e6fe3e01da9c8fc9d8..caa56e039da2a748cf40ebf45b37158acda439d9 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1323,5 +1323,5 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
-
+bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state);
 #endif /* __DRM_CRTC_H__ */

-- 
2.34.1


