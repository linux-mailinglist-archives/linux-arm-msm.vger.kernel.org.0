Return-Path: <linux-arm-msm+bounces-60628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97ABDAD1DC2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:31:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09ABF16C1F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94036264A74;
	Mon,  9 Jun 2025 12:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="n82Ab8uu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02814264A77;
	Mon,  9 Jun 2025 12:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471908; cv=none; b=Mq2vYZN0R+O0DBMHKzOtWAwy69n9Ujh+Va7oMa352vvypFury1Ok+qOPJFP3HgU2aWOYF3WzCHgIdAFhvp/ue9WgzZ6DTc2Y4UY8Bq++Gqe6mCO7UnUrqJFG6u4/4mSrJMLklMNrVBs4GMpopNS6jPjB8v9+3d6zhB/kaUh46xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471908; c=relaxed/simple;
	bh=LYdj4eL8+Xu+RSOTnyrHCBeuZjL7BT3FF9h8riyLLVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Wu4z2tQWw72qksfDacyDP2qsWEvFQGkl39hlWfH6tef6uPG9Q9yKqH8dEDt2mclQAGIjyfJvasaV2FuFifmzxYyBkgta4+22bd/RRpZucY5NlzYEIW/bhxBkg26By928JjhW/+15MTa3S311pZai2aZKK2myL5GzVc/oGF2ZE9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=n82Ab8uu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599bqBq008107;
	Mon, 9 Jun 2025 12:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rbyq8wExAs4+OYFGWU1ZyqqNC8UFUuPjTVsGuNoozhs=; b=n82Ab8uuqOlEbn6/
	Icyhj19TU7C2a0ZCWbBT1zzj8HVJk5T6SvFyuhJcfwdMpYlzeqFR1zBWVztiD4e7
	T/qDi3g4eahbeFGqvyA3G4C6RWSo3G6NRvUIKX1IW9prkEp5QuihyKZ1EqitEoxg
	F2mcuVrTQXP+FhDwFzSwVuIn/8GAOFuzzvRTOyEPfQdP/B6YPEx2+NlC4dBzLYET
	vu2Hruqvs2gOQW1syUUYug4LLydjW3C7AtZGNvHyIi+YXbvjbqqbdaX0Vtq33Otc
	j2ajTLGwBKDef+ZsgUZBF1FJwH7TB4Csu2oCLkaNT/EU5IfjIjeKxJS7h93OeDIN
	fviaOg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474d11x5rh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 12:24:58 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COvEE002166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 12:24:57 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:54 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:53 +0800
Subject: [PATCH v2 34/38] drm/msm/dp: initialize dp_mst module for each DP
 MST controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-34-a54d8902a23d@quicinc.com>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
In-Reply-To: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
	<lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang
	<jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Yongxing
 Mou" <quic_yongmou@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471764; l=3029;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=6ewQrmtOKs8iIHs7bZsctY60NqXWUfE7ZyxPAo/r+CM=;
 b=JHUODc1buPe0P1A/449L2jJmbcaP1DlJeVSEPPajKzcjyHBdHw7/qd12zeS7xSG3D1cQpsioD
 hg4rDCUBPL/CMUlpohWXz8g2Vp9no/j5mdrKvn2pEk27fLOW8DgHcnF
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xUcERYlK-SdoKUZKSBY6nFcN_UWQVki5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX0b3NZgA5hv37
 FbAuxBjeFjJXIKzth30CXcbixqK64gWYvwoRghKLv3aiiJKdJu6UUWN3J6HoYpWi5prow3KMcVf
 EqtjVfBP97dy2jHeOF0va7UsSZpJQFYg2Bbtt2libxM5bba4ejrW6Qig43zybM616WHFHfOCvzn
 EfocjgkcHt3PYZZtbmI6lcBykvqxMGjPA/xM+I4/svod+jbyQcrixIqADgDF6lKybOU0zvKS0eV
 FoCguQOyWlLOJwb5Sl7NxN1XxNf+86+QfsRI3BNhQpXd+xpQGcLTqHhCFE8l6rBXdlqn5eT9pMP
 XaxgcRPpmhxpqHYc4QVn0x3iQR5qNjrsBrvbN2upaoNh2EYq+iv5h0qwtoQ8QDR9jeCAT8rGcll
 +2b6zy8Kw4Pjy4Oh17aT5qctM1uQztbhulkAIQ4AWgtdVv/ALFt1auaoSpFSh2Z7QXX6ZyYj
X-Authority-Analysis: v=2.4 cv=GYkXnRXL c=1 sm=1 tr=0 ts=6846d29b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=inlxAMiYC_RhtNwIp_0A:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: xUcERYlK-SdoKUZKSBY6nFcN_UWQVki5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

For each MST capable DP controller, initialize a dp_mst module to
manage its DP MST operations. The DP MST module for each controller
is the central entity to manage its topology related operations as
well as interfacing with the rest of the DP driver.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 6 ++++++
 drivers/gpu/drm/msm/dp/dp_display.c     | 9 +++++++++
 drivers/gpu/drm/msm/msm_drv.h           | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 45fedf7e74e9c6dfed4bde57eb675e3dd1762fc7..e030476dc4c69448886c29bcfe8ff3105949b129 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -680,6 +680,12 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		stream_cnt = msm_dp_get_mst_max_stream(priv->dp[i]);
 
 		if (stream_cnt > 1) {
+			rc = msm_dp_mst_register(priv->dp[i]);
+			if (rc) {
+				DPU_ERROR("dp_mst_init failed for DP, rc = %d\n", rc);
+				return rc;
+			}
+
 			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
 				info.stream_id = stream_id;
 				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index ab1ad0cb6427eb4f86ee8ac6c76788b1a78892a8..526389c718edccbac9b5a91e8dabf0d84ed1a8b0 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1667,6 +1667,15 @@ int msm_dp_modeset_init(struct msm_dp *msm_dp_display, struct drm_device *dev,
 	return 0;
 }
 
+int msm_dp_mst_register(struct msm_dp *dp)
+{
+	struct msm_dp_display_private *dp_display;
+
+	dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
+
+	return msm_dp_mst_init(dp, dp_display->max_stream, dp_display->aux);
+}
+
 void msm_dp_display_atomic_prepare(struct msm_dp *dp)
 {
 	int rc = 0;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index dd403107b640ee5ef333d2773b52e38e3869155f..1496700c38ad73d6edcf56fbb0ebf66505c608bf 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -374,6 +374,7 @@ bool msm_dp_wide_bus_available(const struct msm_dp *dp_display);
 
 int msm_dp_get_mst_max_stream(struct msm_dp *dp_display);
 int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_encoder *encoder);
+int msm_dp_mst_register(struct msm_dp *dp_display);
 
 #else
 static inline int __init msm_dp_register(void)
@@ -401,6 +402,11 @@ static inline int msm_dp_mst_bridge_init(struct msm_dp *dp_display, struct drm_e
 	return -EINVAL;
 }
 
+static inline int msm_dp_mst_register(struct msm_dp *dp_display)
+{
+	return -EINVAL;
+}
+
 static inline void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp *dp_display)
 {
 }

-- 
2.34.1


