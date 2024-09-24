Return-Path: <linux-arm-msm+bounces-32351-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 294D5984E79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:00:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D45131F244B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8F3185B79;
	Tue, 24 Sep 2024 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ckOz36Tk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D169184540;
	Tue, 24 Sep 2024 23:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218813; cv=none; b=d5IJVLIxtDzey91yfJC9mkzBkmvGMACYMenhMVSap5l+a+WEVw6BVAF5tt+TCcFRyyl9/IwtTXTPEFEpo3MaFoc02dNJ9xTZsswKvhe/NeeNC6ATFZa5D8PKA3+Fmpy2Dam8NfWh/qgz8Tn11G4F4rkeueDZqPA2pFI2J5h+ROI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218813; c=relaxed/simple;
	bh=dR2G/MD6yM3cOdkFd3LB/ulhZzh5I4UbvIhzhfe8P0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TM/3GSdPGSAbgPq1rfh+evd0sJNdclfJjR0dO2/5TW1HY3tD0J9frVK8dIOJP7klPKSsVUyDp2XPkLfn+hWhexT3EoUPE90kDOT9zIfq5347wGdtxIwCuA15ObbWq03A8qQV/IrzELjt1iDeIZgSqnxWHI7GS4I4kKDHa/TJQMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ckOz36Tk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OGs4ZM017527;
	Tue, 24 Sep 2024 22:59:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gqb2UzyXCprwQxN+jRDsHSNUSPIyeNgE724FJcAyVKs=; b=ckOz36TkIgDoVj8w
	GJm+GQBwXeXzHboTc8y+6NCe1nIgoXtqH1LOSHpwxpxvqlHCJCJ0nia1I8rtponS
	l2chpZB3vDRoav6S8ArEgj+XDTmTWvSPNcWcCNlDyXUkghXFA2UJB4W+/P3zwo94
	Lvs1puEnW1S0bamYhNB7IquiCa5EkTqAcCtDUp7YFVtnaiR5Cot2B6FIGsaGfrzv
	LWWO4F9q4s0n6YZQI9fVoRLHb8c3YIgFlGfbrPbZuNv/mp1z2KLq0Zky48jh8jnV
	0jrOGBcscpImdod4gVgh6+f20WCG5WLKBibz1NC9akgGo/GQxi/2rR1yYyPfsyaq
	hQjyIQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41spc2t1r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxsc0007682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:54 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:54 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:17 -0700
Subject: [PATCH v2 01/22] drm: add clone mode check for CRTC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-1-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=799;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=dR2G/MD6yM3cOdkFd3LB/ulhZzh5I4UbvIhzhfe8P0U=;
 b=5Hh0jjHAX7FgZHlQU94V0GDdPDYZCHk6ySHV9II6czki8faPxtJfJphHd9fNcGVOon+7oSG4+
 rMzA8zrRekDBwuiLQJhx/eMP+xoDhb9UUhiEkIQtMrTFg0TxT4l/QED
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jfLwNgytS3wqqgwhRHEt-k5DJJik7nmL
X-Proofpoint-ORIG-GUID: jfLwNgytS3wqqgwhRHEt-k5DJJik7nmL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160

Add helper to check if the given CRTC state is in clone mode

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 include/drm/drm_crtc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3..ecb93e2c4afc 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1323,5 +1323,12 @@ static inline struct drm_crtc *drm_crtc_find(struct drm_device *dev,
 
 int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters);
+static inline bool drm_crtc_in_clone_mode(struct drm_crtc_state *crtc_state)
+{
+	if (!crtc_state)
+		return false;
+
+	return hweight32(crtc_state->encoder_mask) > 1;
+}
 
 #endif /* __DRM_CRTC_H__ */

-- 
2.34.1


