Return-Path: <linux-arm-msm+bounces-47548-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC77CA308CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 11:40:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F21816556F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489A11F4716;
	Tue, 11 Feb 2025 10:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="V/gXoQMx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF081F4720;
	Tue, 11 Feb 2025 10:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739270400; cv=none; b=vAHup7pzEIemTvc3CFxm19liAX3BtxLFCcDFZhNAkuZWAZ7+pCxwy+wbxsJB8yLC+wL9+UOc+FkEhupas8xd4yNPfPQXBZWyNw7kRds7ZkAr6zPoFEND4Ud/Dz4LJehO7EmW7zURh0uyNuCxVEEJcB2i38NyDvRX8ZOjll0yxiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739270400; c=relaxed/simple;
	bh=t3SGcUgUn3/fIExKnXCklakPIAZR+0Rk4JPEh8gbtcA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=A2H18rYT6rmChMLi0Zw+7Z+f55MCl8JklWVyUC/GHggEB8g2iWsmCn8O2+86C4ZdkxReCcI+pp7DW+2ito1lRokOajaD28eZW3FP2Rxz+5FO8eFw/+BPBowM9pp5AyfWcWCGdHvTsAUrLHz/Yb0okViRwZbwErD1uCgDVanM30c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=V/gXoQMx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B7U3od001431;
	Tue, 11 Feb 2025 10:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AsbYPY6w2GX2BNFqz/5nbs
	5EuGdQJnJQ1j0OQUY2bv4=; b=V/gXoQMxAsUkIQa4sbet/wyPzu/m+uHD33ZYIH
	DmOM9QvCeMvVc8+l5kWhAFU+jXzbETQEpqpwob/uQmaouLzHL+Hk3i2Hh5hC8+jx
	4Va2o7DCNJnjJ7nx/mJOUYwa7LZs1mhQz6uPLBrnI0CEdiYxQyJSLbKIJnWsjTsm
	3dXDdVZ3QkLVw5WKS9RaFMlJwIWjbzGv9S/d3qlzGlu5lU22Fo2cDh3mF0zK3jGp
	GWNc846RHd0R/plp5FPp5QC4SXoxqvqaWJvl9suvypipri18XhR6S513Dh+14pF4
	TRKvM34CQNvNTq1jZCZErYpRVkuVwPL95thPKD+y2tI1SiXg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxkmra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:39:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BAdocW013041
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 10:39:50 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 11 Feb 2025 02:39:46 -0800
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Tue, 11 Feb 2025 18:37:43 +0800
Subject: [PATCH] drm/msm/dpu: Allocate the number of LMs based on
 max_mixer_width to support 4 streams MST case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250211-dp_lm-v1-1-deeca9ac9bd9@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAIAoq2cC/yXM4QqDIBSG4VuJ83uCWketWxkxTI+bMKtpG4Po3
 ifr5/Px8e5QKEcqMDQ7ZPrEEpe5QlwacA8734lFXw2SS+RSCObX2zMxEwwFgQF7RKjfNVOI33/
 nOp7O9HrX3HaOMNlCzC0pxW1ofECvhOFC9Za4spKsQ01tO3GtrVdBSZRdx2E8jh+RbzvzowAAA
 A==
X-Change-ID: 20250211-dp_lm-8f8ef15f5955
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Yongxing
 Mou" <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739270386; l=1224;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=t3SGcUgUn3/fIExKnXCklakPIAZR+0Rk4JPEh8gbtcA=;
 b=+m+TG7JMCHW09MiRsbSbDZVRrQF0fqBdyFDG244X/i0Sy2fiEei/E7x09Ykd04nDmNdeF2sVx
 3rfKTGF4mFoDKy2nOyo3uJ46ByPUoAjvoNnu7j4Qzoi4srSDMzx6zDp
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nPDHW2kq_5vEdyldeyTO6Pz7eGkOGPK-
X-Proofpoint-ORIG-GUID: nPDHW2kq_5vEdyldeyTO6Pz7eGkOGPK-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=872 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110067

In 2x2 mst case, each 2k monitor will use 2 lms, but dpu_8_4 only have
6 lms, so let 2k only use one lm to support such case.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5172ab4dea995a154cd88d05c3842d7425fc34ce..e8846bf8edc5f9b2b3b7f093e4d5aad75de53da1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -677,7 +677,8 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	else if (!dpu_kms->catalog->caps->has_3d_merge)
 		topology.num_lm = 1;
 	else
-		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
+		topology.num_lm = (mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width) ?
+				   2 : 1;
 
 	if (crtc_state->ctm)
 		topology.num_dspp = topology.num_lm;

---
base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
change-id: 20250211-dp_lm-8f8ef15f5955

Best regards,
-- 
Yongxing Mou <quic_yongmou@quicinc.com>


