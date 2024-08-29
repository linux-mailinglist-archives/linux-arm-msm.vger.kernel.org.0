Return-Path: <linux-arm-msm+bounces-30116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA2196511D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 22:49:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2CE40B228BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 20:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B8618C013;
	Thu, 29 Aug 2024 20:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XDCJws7w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D74F18C003;
	Thu, 29 Aug 2024 20:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724964557; cv=none; b=Cbwg8F5GbxEfK8z+E5H5xpjUQ2RDa3u6tMHRM1N4ic/MCe3NSQEeNCKf8g28keSg7+SfzWT+iTfeA4BzPVGrozjRCZXVeSODYiXUM2hJhi6p1fXqGGxaWQ5bH3pNXZ6IcwbBmKkudDLQL1O40xApnUfQmALCsbgDoI0QZANmcbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724964557; c=relaxed/simple;
	bh=dR2G/MD6yM3cOdkFd3LB/ulhZzh5I4UbvIhzhfe8P0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=c8lTRlqANp6XhLL5wolzg6ujgCF3R8ECpnFtIaK8oNQv9pOI3pdv0k+JoWeREAiEWsMNpEcvv3u5u4qgttqZR3VN8V+bzC+MCeHK1fVTbYo1GGVJjlL11toQFzjUOjkMbDvX52VZfQcidsTQKn5PFfTBnT1uZLrE/IzaPMBKRho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XDCJws7w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47TGYXKe020024;
	Thu, 29 Aug 2024 20:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gqb2UzyXCprwQxN+jRDsHSNUSPIyeNgE724FJcAyVKs=; b=XDCJws7w3USJKy28
	w2IAYk6TTwh4wlFe6QON69V2nAQeVF0A3T9wgwW8C6xJQs3LjM0c50bB5+lgKn25
	vSOHvlJL4So9Cr2JmHB1p5SncVpGxNIOKNsIztdSedUlOqlggsQ0Yk3/4sLcE25N
	9fhe/Po5mjk8Mh6k7KsyNuUNvSoowezj1R3B2OoAesaSMdpRZoxEsuE9WrMaJLSt
	lCKuVpKnCr7rOe93Qe/YFuxEMuG/uqsre0Dty2pLzwMP5P3uahFPVUlueC+7cBhj
	FMGPryYkxcSTEFGWP2sgAmX80cT6Gt9NKiMCqG8m+0Mf8A13Bvpu7WBa5YYAkSjc
	pHmAvQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 419putpnc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 20:49:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47TKmxDL020564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Aug 2024 20:48:59 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 29 Aug 2024 13:48:59 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 29 Aug 2024 13:48:22 -0700
Subject: [PATCH 01/21] drm: add clone mode check for CRTC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240829-concurrent-wb-v1-1-502b16ae2ebb@quicinc.com>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
In-Reply-To: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
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
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724964539; l=799;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=dR2G/MD6yM3cOdkFd3LB/ulhZzh5I4UbvIhzhfe8P0U=;
 b=TvXkjmvu+zsZtd+1ybktZpZOmh4GmSflM3w4MQVEPLPin2U542DT2Z0Q9N4VzjwrxubgbWS1y
 S+QSdH78ROiBjqLvR5xC4/Hy7u+/aKANCp5crB2VIP6Y1E6uQ0GrORB
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qjurr45G4WYarkFUrfuKuFxW1gldVwSP
X-Proofpoint-ORIG-GUID: qjurr45G4WYarkFUrfuKuFxW1gldVwSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-29_06,2024-08-29_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 mlxlogscore=988 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408290147

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


