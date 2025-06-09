Return-Path: <linux-arm-msm+bounces-60631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE85CAD1DC9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7BD16C349
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CD726561E;
	Mon,  9 Jun 2025 12:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mK9sq1tU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A029265CB0;
	Mon,  9 Jun 2025 12:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471921; cv=none; b=HErq1Y09RjL4HQBpfm85ekg//S3A9SOcZ+Hg9ADX6UkuZYjLa4TTSMoidkd6b8fwrte/aPxDirDcA4mwVbK3+T86kOu0m3ud2exj6U2QwC4oW4IHTVhoVcGp4mwiBuEvtbDz5Q+VRPyJOrSaj5rTWsqaI4FRfsm5yDzRDLg8mKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471921; c=relaxed/simple;
	bh=rbSV+hfKgM+ukvtLz9DSZu6erWwhqTS9IPf9pLTVv/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HncaXsGjimCqgIiZkh7URcK+hggMUFmDvNDC5JsONQd3NP0xL01LLnfFY/7n4Ep92eoNp5NAkLghfM/YyhC/GqaVEscV/T0KWW1HM90QSFd8kct1MTrjAqGmaIuf74MQZquM/sf8Ws7xk4rBwfoAgywIZCjk9S+6Hl6w3tF43Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mK9sq1tU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55993tbr031949;
	Mon, 9 Jun 2025 12:25:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQ71zv9jCS0TWcWUY/H0R5XbyWd/8+bMso1HQ+rPgT8=; b=mK9sq1tUuGHKA44K
	JYm8g4byfwRGKP8kStM09vXutbtBP6C7cDtVvFl1vKj5f7zrMAeJRRcqUOMWnjV2
	HtS5mXqb3rsr220p9aUY6+Snv0kjDxR0o6NCT0JQW8v/KmXpXexdplKmrYMrzsaG
	+Ij282kOSprpsh1izc9+vG5gn8CzEtvWVy7JoItTvjTnZxjJCz5VJ0W+oFH/zDMo
	VxEv3iR+CeDu7ZOKv7m501ectdUVSmHsUldbAlszJ/9Zzmc8r21rOXppjFmeNemK
	dtV1TbB0vgRGzOCRg1lhPsaxHfx2mZtxTiRSkVkZ57EkAMxYbqjmvjeEgJTrzJa1
	UM+3kg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcdrwr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 12:25:09 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CP908015548
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 12:25:09 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:25:05 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:56 +0800
Subject: [PATCH v2 37/38] drm/msm/dp: fix the intf_type of MST interfaces
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-37-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471765; l=2270;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=czN3tKP2g3B6sQiB2GyYLKLKpxjnmyxyu8SV+4QUmCE=;
 b=rGgbJJnIKa0ynyYPN+nOdiWggayIz2pFRENatXAEAq1rvlkM76gA3uWtdyFPvFdZKQ5tXVfPl
 ake60EcFj9wDg4Kzif0yUtX2mtjuMyZarvmTi1IjdzUu9e/trvGzd+S
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfXyx3TkO6jzxmn
 WmnftGnJpk3AeUe3HxVCD9pjKKwHzlT9Q8lA+QJMwp2ZpYhfQQ/5ddnwxj0AHaFZyjo6POrwWqb
 dMqfpW5d6OIm0jEEnh+8hJz1naQdUvrcxA+lp5qGOAJy9a6RBvLsPKm2PVHlS6NrozvZWLPDiKv
 uQS/56gCCimo6iSfhVN+RQU5brykkcppE3MQuBAWnx2PRgQmjgomGwWZ0uEjO/7iHTG/zcYGrZx
 4F/csOmkPxqLwaFwoGwbOlNQNIiZ5wl4bGa3PZN6Wt7dTt56dlzSQP824FRLuYxcVlcpX4CZAAH
 d8toc3Y22Aa3kxeU9wvDInm5Oi/bPMMVNv7SqeBLdPqhgXu36PhldXsuJBKqF9pxQ/vnv9ZL/Xt
 1I8Rvv5potU+sOLgvDbvOpCBB2qnFdrs3ILlCG3ATiD2836e0raoOnSFoZ7pqGvrbVBOpuj8
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6846d2a6 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=JLsRSS4yfGEVyrXzCTgA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 3nZuIoEN7IM_4ByFzYyBePs5GzZuSGVT
X-Proofpoint-ORIG-GUID: 3nZuIoEN7IM_4ByFzYyBePs5GzZuSGVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=838
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Interface type of MST interfaces is currently INTF_NONE.
Fix this to INTF_DP.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index c248b3b55c410d8e374b8b659eeddbb657bbe854..b81bf54388557c380df0018921c6c1dbb7839d08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -374,7 +374,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 		.name = "intf_3", .id = INTF_3,
 		.base = 0x37000, .len = 0x280,
 		.features = INTF_SC7280_MASK,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 30),
@@ -392,7 +392,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 		.name = "intf_6", .id = INTF_6,
 		.base = 0x3A000, .len = 0x280,
 		.features = INTF_SC7280_MASK,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
@@ -401,7 +401,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 		.name = "intf_7", .id = INTF_7,
 		.base = 0x3b000, .len = 0x280,
 		.features = INTF_SC7280_MASK,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 18),
@@ -410,7 +410,7 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
 		.name = "intf_8", .id = INTF_8,
 		.base = 0x3c000, .len = 0x280,
 		.features = INTF_SC7280_MASK,
-		.type = INTF_NONE,
+		.type = INTF_DP,
 		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
 		.prog_fetch_lines_worst_case = 24,
 		.intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),

-- 
2.34.1


