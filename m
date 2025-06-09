Return-Path: <linux-arm-msm+bounces-60632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F1BAD1DD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:34:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 758173AEA93
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8595E266573;
	Mon,  9 Jun 2025 12:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="j7E3WAVA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21090265CDE;
	Mon,  9 Jun 2025 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471924; cv=none; b=Rea0fs4pHRE3GflFZ5IKIQAwhZRxP67dJGw/CY/kjw2+7AnItRVkVSyjatrtrLuYMDMk+XICoToqLULLU6Ljp1knCVsTxqaWouuP+B1QTv3qPwi1BW7+OM0Cp/j1rRM33gp6UdXccc6+TNNM6lfAC06Ah08w3DZ52XGKkIcIVcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471924; c=relaxed/simple;
	bh=Q1WNKF0a8xaJ38B3avtHB3P2sjCax+Cgv0PQTqcGPds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MOSiZxof/i38baDt9v67jHjuCH3E+vH79fNwnuQbVRf65F2Uw286h80+7Fb9lvDZJPmt69zPtmpPDQgFOjMsgIomrod3SX/0JeR2J4ur+njKAhLO3Cm1PDAC29TMTj2a1FhuPNLGW2aGnApRC0RqzziuIYR7Eehm+kRmgCnJ1RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=j7E3WAVA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55993tbs031949;
	Mon, 9 Jun 2025 12:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vXeFn+D102T3ulUO61dxyo0RH4duqBu7n593qCJenQY=; b=j7E3WAVAxDiJJXfl
	BYMu28osSeEwDwESnUlDf8kI8xmmGTDgAe4wjBN2TS72MmIJpfFPSXY85/9pM7kg
	FZj8IFSrwV08sj0+gL3P0rcMj3axN4OC4bV3q5aTPyUm1jOd57/otl//0njGKV24
	BmsUkLeLps9rleZUUK8XgD/wvoPEYLNlbYYy9o1VVr8uptt65wGW03oTWZdBi47G
	riwxZpfBUnMd9lZtBsqH8IYK4R0VG3G2ElGkF3ADRhZl4uAH2MbAVtWaZxwmAovj
	/MoeW5gWxZvVOxdhZcE9pAvz2UUx0+ypm/6IHDk6NrjpPSzMZkERGvOFDdXmKctK
	QIceDg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcdrx1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 12:25:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559CPCV1015627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 12:25:12 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:25:09 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:57 +0800
Subject: [PATCH v2 38/38] drm/msm/dp: Add MST stream support for SA8775P DP
 controller 0 and 1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
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
 Mou" <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471766; l=1356;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=Q1WNKF0a8xaJ38B3avtHB3P2sjCax+Cgv0PQTqcGPds=;
 b=L2fWxjBVk8HhImBlhhEaU7oOR40NV8zennU2pmSzsN5lc5IiXgT2mr3IdlW8O2yUgmpDY1fWC
 Mr0T8+4AKBqCTYaqBpjF/El8cBVYpNdBdUR1CnrvbesaAFbQwilL04q
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfXyyJA9zc0LIMM
 8JV38O308nZJ55901LBbNQQBoKERAqFJ+XiMYEQ53I7Q/9JsVg/7HK9f3e4AJrrzawslrJQ7M4J
 LAmcKfz9Laf+7i2syB2C5W7Z9OOcjRPkBYKjLXuSoyXsA8YOmZP57An20zWoZJ37HeYHnjVIvP3
 e+0zidj+6mBWopfTfE84mJI5KTMkNjjZRbDeV4ZIwNIflETBnRZAvCs04Heu/2ntRPaiQ5T66dy
 h3EEFnHL/b2PS+2UG3WSnnx531ZrCmsIo2nbNwXizshu/kSE1eZA6hhaJg3cbNTuchDr02JLevi
 CVFi+Y7RCocJ5fKZVjLW85yb/s5Xe0ZEr3+Jm9NhsQtaaZec4F1rfqij6Mk6ktJ5kt1fipAWoqi
 38mdHWG0AZC+oGS306mted0y6udivODbVg6Ot5Jw5MZ34E9Ury1RW/LWu7FRyu3b6WyDmZRf
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6846d2a9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=qZBeK32WA6mflFYdqoAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Q3M8DP2xG_LiEcNNFmCNy46YybZereCC
X-Proofpoint-ORIG-GUID: Q3M8DP2xG_LiEcNNFmCNy46YybZereCC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093

This change enables support for Multi-Stream Transport (MST), allowing
each controller to handle up to two DisplayPort streams. As all
necessary code for MST support was already implemented in the previous
series of patches.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 75f2fd7c75eae81e5c843f8ae2d1ce12ad0cad7e..16196dcc9ff4ac6a35b6bcd8d433b08f7d18fe5b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -127,8 +127,10 @@ struct msm_dp_desc {
 };
 
 static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
-	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
-	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
+	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
+	  .mst_streams = 2},
+	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
+	  .mst_streams = 2},
 	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
 	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
 	{}

-- 
2.34.1


