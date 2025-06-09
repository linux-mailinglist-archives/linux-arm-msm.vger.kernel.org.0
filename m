Return-Path: <linux-arm-msm+bounces-60620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D68E2AD1DB1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:30:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86292188E8F1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00FA22571B6;
	Mon,  9 Jun 2025 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Emiwv9ed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B0425A2C6;
	Mon,  9 Jun 2025 12:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749471882; cv=none; b=bYclzc1DjzarycXGND9k4y1uAxCtZ/b6whp6N42vJnWdf3Vtw7p1OsCbQ3CH4iySWUHnOeUWWbvWx4aeGWP2PNydkaIxGXqi1T3VgSC3v0Pb+0rCpYQyA6+u1UDWb29XmQ3+xbuMVgjX6sETcDCmF9SpBX8Wp62tqVxDPjf2o7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749471882; c=relaxed/simple;
	bh=AWE/YRBpSGo0cFwPu587uowKZsB70d4Jf8wPZPNQ+eU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ufxg8qII9v2D2X+s/ftsPZUF+u+9WF17ktdBPoW6hoBrLsh4oNixxCmqmakJUGK1fTnoboofcXQi4yjdbKz7eTGQXPfjWxt6IyJL9auB7PaZBGWMRNlrHVNxbQePZj59MDc2aNnmkeR87P5h0OnV6V8bsZ0zCdAa5vpIlQ+d7q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Emiwv9ed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55995bsI024025;
	Mon, 9 Jun 2025 12:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n8VOXrDrr1VAwwjkjnqvZc8Gu0JH7TUn/G7BFdeAHmU=; b=Emiwv9edwEwIWZsm
	ZP4QHAWeNwsMQeh7pOBj4Z+/WVGquvzs9QW/RqNewEw9h+XQsOeSGsX4CzDbo+33
	rvA4Rm25SFR1+YqZa7xLoVGdH1blmyG6pmgJcZ7fizivzKFmAqdXNzgX06ti5PJK
	fDPBdr67/XCrxzU8iSlgEqqy1N0FdqadJJtdSWPPYWpo5Y3Av2l2klUHkjU4YDnw
	4EEKKG3kJS82ixlkrse1qE/SakBpL42nXcog/0tyB/S5METW9zTG5R6kbRyYmHqs
	IwR/Nvccc9TdXOaaYnX0WGzGHcqBsc3DEp3lvDISd28lC2YbEox9oekO2whIIVsl
	x1qRbQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn65vvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 12:24:32 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 559COVGX018166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Jun 2025 12:24:31 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Jun 2025 05:24:28 -0700
From: Yongxing Mou <quic_yongmou@quicinc.com>
Date: Mon, 9 Jun 2025 20:21:46 +0800
Subject: [PATCH v2 27/38] drm/msm/dp: add dp_display_get_panel() to
 initialize DP panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250609-msm-dp-mst-v2-27-a54d8902a23d@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749471760; l=2168;
 i=quic_yongmou@quicinc.com; s=20241121; h=from:subject:message-id;
 bh=7in3x1acFoBtly9Xd1hUdHnrm7BxLdCPCJo+2zgk9bM=;
 b=CBRYvuLb2iSxajo5lSEKSCSBZrylIMY52kCmo9AnsrbM74zjK1sPNt8HdhFtH/SJnKbwlXJL0
 JZ88fBjU+P3CskuBAxbTh3Tkir7hDeMvOiJssV80SgjtgTpL+/hBLod
X-Developer-Key: i=quic_yongmou@quicinc.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA5MyBTYWx0ZWRfX6JpwxZHgTbju
 9xiVIJdHIr71WP/X9qOWosSLUYunzk8viLKdAhuOJL03MryriyY5RlXjA6b6iQoc68fyUKM/xbe
 7Ghd6lOxdX64uWAzQnypB1g+CQxzFd1PjFrgsRUZR2DlkzrUpVCXVSGyZqCRp6BQGmPu43iqSGC
 908mUuOgqYnaT4DuVuZZJ1nzpAOsOD+4oIIfwfw6qD0IKynlZKZn5QmswOQ9Y77OWfzZ7Swiq5l
 BVr6xcof2LZAEZO68Kc/I8ATEJsJGMcqc4ZXs6H8kEokCPYfRGHJtdk1igcJD91zrl3vY5iKgty
 jeUMPw8Jrx1dpoTb37MNLsdPwni0Q1mkvU+GnuiIOUI74/oHkgTGi4yB2ZVIP5gx3UsuP8y+5Ce
 R146jUqORpJBbB+68WxIk1/HyJs4J/C4plxXL1pB1XwDYOaUvBiCPuEy23bxbc3B29WmmTwS
X-Proofpoint-GUID: 3PripCGyw-mNL1Z13W0YALCaU3Ez-c4c
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=6846d280 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=6cFZRJIsygQ8aEszaMkA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3PripCGyw-mNL1Z13W0YALCaU3Ez-c4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=877 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090093

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add an API dp_display_get_panel() to initialize and return a DP
panel to be used by DP MST module. Since some of the fields of
DP panel are private, dp_display module needs to initialize these
parts and return the panel back.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 21 +++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_display.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index b1b025d1d356046f8f9e3d243fc774185df24318..8ac1215d8a635bc5477e79e08264c344ed1b27ac 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -771,6 +771,27 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	return 0;
 }
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *dp_display)
+{
+	struct msm_dp_display_private *dp;
+	struct msm_dp_panel *dp_panel;
+
+	dp = container_of(dp_display, struct msm_dp_display_private, msm_dp_display);
+
+	dp_panel = msm_dp_panel_get(&dp_display->pdev->dev, dp->aux, dp->link, dp->catalog);
+
+	if (IS_ERR(dp->panel)) {
+		DRM_ERROR("failed to initialize panel\n");
+		return NULL;
+	}
+
+	memcpy(dp_panel->dpcd, dp->panel->dpcd, DP_RECEIVER_CAP_SIZE);
+	memcpy(&dp_panel->link_info, &dp->panel->link_info,
+	       sizeof(dp->panel->link_info));
+
+	return dp_panel;
+}
+
 static void msm_dp_display_deinit_sub_modules(struct msm_dp_display_private *dp)
 {
 	msm_dp_audio_put(dp->audio);
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
index 7b0efa342aaf878f3ae7315cb55902bf8bdcb6b9..85eaa55fdcb7d9d8713849ec64a2cc9b08924425 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.h
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -61,4 +61,6 @@ void msm_dp_display_unprepare(struct msm_dp *dp);
 
 int msm_dp_display_get_active_stream_cnt(struct msm_dp *msm_dp);
 
+struct msm_dp_panel *msm_dp_display_get_panel(struct msm_dp *dp_display);
+
 #endif /* _DP_DISPLAY_H_ */

-- 
2.34.1


