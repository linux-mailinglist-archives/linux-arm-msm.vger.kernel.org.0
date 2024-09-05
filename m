Return-Path: <linux-arm-msm+bounces-31027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752A96E5B0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Sep 2024 00:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98EBD284ECA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Sep 2024 22:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BB201991D9;
	Thu,  5 Sep 2024 22:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gOB6O3HR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836278F54;
	Thu,  5 Sep 2024 22:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725574308; cv=none; b=KlpWipZ7acVDIhsetv1pCuc4X+rOHIdfh/BrOkZMU755nY/QaXJrjlImwTXK6plmPdxpXce5my78XJcQwWwUUwtWKx74F3reirKH2pOoFXo5oBfn5vbXPpjj4Tpfon8VoQng68Hw9AoT9logp4Mmb0PRCa/W8l3O7cZMQOt7VdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725574308; c=relaxed/simple;
	bh=hc8QsJI0fp7OH3Vr4PxRn9wS0WhnMTxv9+T+8Hcn9+4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=A3s+Uk+Y/YduzyeQVh1qpSC0k6vi7DN9zUeJYUPXrxbvbyWJy7JFh/jCZ8dLMBe1IaU0aoAdjHcVYZ+fjWos0a2gn85R37ctgdpcqu8bsLcOeff2GITcs+52E+eYf8wnCDAqQzEC4X5v4LZaI8wUB+KpqS5vIJV1LS+aTu9MGcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gOB6O3HR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 485IQ4tE021829;
	Thu, 5 Sep 2024 22:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=uICJMqyMR9W+E3c9itZUvA
	6mXI7wrkEBgAc0kuDayVk=; b=gOB6O3HRPNsmvvFF5aAPh8+fO2ixKdHakSU6cn
	HcmhohiTtxvRS7PE9KhO3lbBT21A0mqivUg6tQH3pEb37rxBMTHfQTfuhwjATRPi
	kcFvelXdQozHc1Ik/VVVm6M8m8ITIDl/456PbWFP5bMGc5iSZ5G1xnxd5SIlb1mb
	vFqrHzw1raeVtpBa9Ba/I8Ndyv+js7th+zKYN29LX+gWYnkxcb4Sl1/sofELxQus
	cr6jWUt0/nR03s1v7f53a1/g+8ZLLU9LdM8jAgoTHWjInlo7X5GSRuJEFzlwAMOJ
	Y94VHXl0PYyD4MQN0uUhX4yt4Vm5QgYgA6bTbSsIhNnrib8w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41fhws0des-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 05 Sep 2024 22:11:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 485MBZP9023114
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 5 Sep 2024 22:11:35 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 15:11:35 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>, <robdclark@gmail.com>,
        <dmitry.baryshkov@linaro.org>, <quic_jesszhan@quicinc.com>,
        <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH] drm: allow encoder mode_set even when connectors change for crtc
Date: Thu, 5 Sep 2024 15:11:24 -0700
Message-ID: <20240905221124.2587271-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Hvr95TcNMYKnzGZA-s50aOaSpSO56NQC
X-Proofpoint-GUID: Hvr95TcNMYKnzGZA-s50aOaSpSO56NQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-05_17,2024-09-05_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 bulkscore=0 clxscore=1011
 suspectscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409050165

In certain use-cases, a CRTC could switch between two encoders
and because the mode being programmed on the CRTC remains
the same during this switch, the CRTC's mode_changed remains false.
In such cases, the encoder's mode_set also gets skipped.

Skipping mode_set on the encoder for such cases could cause an issue
because even though the same CRTC mode was being used, the encoder
type could have changed like the CRTC could have switched from a
real time encoder to a writeback encoder OR vice-versa.

Allow encoder's mode_set to happen even when connectors changed on a
CRTC and not just when the mode changed.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index fb97b51b38f1..8dc50dd2481d 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1376,7 +1376,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_atomic_state *old_state)
 		mode = &new_crtc_state->mode;
 		adjusted_mode = &new_crtc_state->adjusted_mode;
 
-		if (!new_crtc_state->mode_changed)
+		if (!new_crtc_state->mode_changed && !new_crtc_state->connectors_changed)
 			continue;
 
 		drm_dbg_atomic(dev, "modeset on [ENCODER:%d:%s]\n",
-- 
2.44.0


