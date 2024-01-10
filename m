Return-Path: <linux-arm-msm+bounces-6980-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF382A219
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 21:20:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6960FB2611A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jan 2024 20:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D654A4F8AC;
	Wed, 10 Jan 2024 20:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="U+RFZJhg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657AC4F8A6;
	Wed, 10 Jan 2024 20:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40AE7q6b023231;
	Wed, 10 Jan 2024 20:19:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=9d90W4iJWF7jqcBZ4FKEQANwVRt3HQPhs2xgEDbD1y8=; b=U+
	RFZJhgLwImXzLAjBH7Usng05ZRt44yg91qs7cKKvxB0Rsuai79siRTsjJN1GiGF1
	BHgbfLWHwsrMyuqDpOnAiZkW3g+F6e4wSdrrubI8lwzRU3YUy3DPN0b3HOaPlirr
	IC9lPnLeqXgL/4ATc6Ev0izswCR39X6yJ3c//qPI0wJCiLapxBCP6w/47S7OYMnI
	xWdj5sJJGw5ypXP4Cy892tnwjJAbDX4yLh1JBCsUqvCTwD23iDV9BmxzQoFIpXM5
	t/yzL1jZceP+MMgTL0AOn2fOFVpT8Ol965LLMuEN2PARKb1TZCjJAdA8ud04Q/61
	akAcOblTYJvkeVFGLIJg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhvqw0ved-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 20:19:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40AKJ1kb003610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jan 2024 20:19:01 GMT
Received: from khsieh-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 12:19:01 -0800
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
To: <dri-devel@lists.freedesktop.org>, <robdclark@gmail.com>,
        <sean@poorly.run>, <swboyd@chromium.org>, <dianders@chromium.org>,
        <vkoul@kernel.org>, <daniel@ffwll.ch>, <airlied@gmail.com>,
        <agross@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <andersson@kernel.org>
CC: Kuogee Hsieh <quic_khsieh@quicinc.com>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_sbillaka@quicinc.com>,
        <marijn.suijten@somainline.org>, <freedreno@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] drm/msms/dp: fixed link clock divider bits be over written in BPC unknown case
Date: Wed, 10 Jan 2024 12:18:51 -0800
Message-ID: <1704917931-30133-1-git-send-email-quic_khsieh@quicinc.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uKZ18sJxBgQjss57yMUqgS4tHL3X3cq3
X-Proofpoint-ORIG-GUID: uKZ18sJxBgQjss57yMUqgS4tHL3X3cq3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401100161

Since the value of DP_TEST_BIT_DEPTH_8 is already left shifted, in the
BPC unknown case, the additional shift causes spill over to the other
bits of the [DP_CONFIGURATION_CTRL] register.
Fix this by changing the return value of dp_link_get_test_bits_depth()
in the BPC unknown case to (DP_TEST_BIT_DEPTH_8 >> DP_TEST_BIT_DEPTH_SHIFT).

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c |  5 -----
 drivers/gpu/drm/msm/dp/dp_link.c | 10 +++++++---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 77a8d93..fb588fd 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -135,11 +135,6 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	tbd = dp_link_get_test_bits_depth(ctrl->link,
 			ctrl->panel->dp_mode.bpp);
 
-	if (tbd == DP_TEST_BIT_DEPTH_UNKNOWN) {
-		pr_debug("BIT_DEPTH not set. Configure default\n");
-		tbd = DP_TEST_BIT_DEPTH_8;
-	}
-
 	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
 
 	/* Num of Lanes */
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 98427d4..b8caa5b 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1179,6 +1179,9 @@ void dp_link_reset_phy_params_vx_px(struct dp_link *dp_link)
 u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp)
 {
 	u32 tbd;
+	struct dp_link_private *link;
+
+	link = container_of(dp_link, struct dp_link_private, dp_link);
 
 	/*
 	 * Few simplistic rules and assumptions made here:
@@ -1196,12 +1199,13 @@ u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp)
 		tbd = DP_TEST_BIT_DEPTH_10;
 		break;
 	default:
-		tbd = DP_TEST_BIT_DEPTH_UNKNOWN;
+		drm_dbg_dp(link->drm_dev, "bpp=%d not supported, use bpc=8\n",
+			  bpp);
+		tbd = DP_TEST_BIT_DEPTH_8;
 		break;
 	}
 
-	if (tbd != DP_TEST_BIT_DEPTH_UNKNOWN)
-		tbd = (tbd >> DP_TEST_BIT_DEPTH_SHIFT);
+	tbd = (tbd >> DP_TEST_BIT_DEPTH_SHIFT);
 
 	return tbd;
 }
-- 
2.7.4


