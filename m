Return-Path: <linux-arm-msm+bounces-27429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46E941F11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 19:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B09881C2319E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jul 2024 17:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2BC1184547;
	Tue, 30 Jul 2024 17:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="klepgEJm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E36318A6B5;
	Tue, 30 Jul 2024 17:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722362192; cv=none; b=b0Ilay/ijaDsXDBwNtS1SHVJGTimsWaHR1y0jvoHt6bfaWoC7bznc++K93snbrxe79/J9IV3xcJ7vdOfBqemw0RjVCKuFh3K4CN6T+tCTiTPAADHIPp0odoJMKTlWNAHU4LgR6/EYbbiPXvfxmbaQyGH/DFeAwC/m23dG5tEp78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722362192; c=relaxed/simple;
	bh=KPcOEhklZO3FM3wBXFnTbyT4tAd+unwVmWSV5hM/i2g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bZ6XdIwTQrcVbH9wm25VSc6vfB4c7PDayrIJXclYy2RCvB7BjO49iyP2Q2S+8yRRS2bJe00jidNy0BprfCBVX1R2Rv/UgRKgT5CyE95js/bfKmADKTJ0+HKj3Ravi5FQcrBlfTtcRcPAS+trAJMR1rmJRNXt+1rImhyLdUKbpk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=klepgEJm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46UHK2xp016748;
	Tue, 30 Jul 2024 17:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=i2v8w4Z2+u7WgDhCofOnrD
	SAfFazSqBarjGO9eEcIvg=; b=klepgEJm6qiTqHFpUv2lAvjBeQ435iGMaTxjP2
	HOp2E78UJ3q/KQ2952Hs9xAVx25yjvWO5agOjGJW5JJWUXNhCYjvATlxqa0+/HqY
	pD670UQZhOlb53etF44lfkgVyDLO9Unhnli0a7LHJrFvvh/H2qtsPILdbEgKrFkC
	xR8xdpTH78BW9Ig3rR1sSJ+yp6Em4la8cuNA5J4e1Cc1qyBNPzsgHo78/O7sRz3W
	H9k4yRy9H7X72IpwdMYjJ9JKUX2F6hIQgFzCElnhu5zkTh20mZz5W71o+DoV0RNP
	z+jZVcTo1jpGgFgTNO3ifF6FOYFwGDB2UkoLWNcbArMqs9Qw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40ms438cht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:55:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UHtpU8014609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 17:55:51 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 10:55:50 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Daniel
 Vetter" <daniel@ffwll.ch>,
        Tanmay Shah <tanmay@codeaurora.org>,
        Guenter Roeck
	<groeck@chromium.org>,
        Chandan Uddaraju <chandanu@codeaurora.org>,
        "Kuogee
 Hsieh" <quic_khsieh@quicinc.com>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <swboyd@chromium.org>, <dianders@chromium.org>,
        <neil.armstrong@linaro.org>, <andersson@kernel.org>,
        <abel.vesa@linaro.org>, Vara Reddy
	<quic_varar@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] drm/msm/dp: fix the max supported bpp logic
Date: Tue, 30 Jul 2024 10:55:40 -0700
Message-ID: <20240730175541.2549592-1-quic_abhinavk@quicinc.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6xHDLTXkLDJRN9YqM9AcTaiv9bip-Ty8
X-Proofpoint-ORIG-GUID: 6xHDLTXkLDJRN9YqM9AcTaiv9bip-Ty8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_14,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300123

Fix the dp_panel_get_supported_bpp() API to return the minimum
supported bpp correctly for relevant cases and use this API
to correct the behavior of DP driver which hard-codes the max supported
bpp to 30.

This is incorrect because the number of lanes and max data rate
supported by the lanes need to be taken into account.

Replace the hardcoded limit with the appropriate math which accounts
for the accurate number of lanes and max data rate.

changes in v2:
	- Fix the dp_panel_get_supported_bpp() and use it
	- Drop the max_t usage as dp_panel_get_supported_bpp() already
	  returns the min_bpp correctly now

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/43
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index a916b5f3b317..3777b1abacad 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -90,22 +90,22 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
 static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
 		u32 mode_edid_bpp, u32 mode_pclk_khz)
 {
-	struct dp_link_info *link_info;
+	const struct dp_link_info *link_info;
 	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
-	u32 bpp = 0, data_rate_khz = 0;
+	u32 bpp, data_rate_khz;
 
 	bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);
 
 	link_info = &dp_panel->link_info;
 	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
 
-	while (bpp > min_supported_bpp) {
+	do {
 		if (mode_pclk_khz * bpp <= data_rate_khz)
-			break;
+			return bpp;
 		bpp -= 6;
-	}
+	} while (bpp > min_supported_bpp);
 
-	return bpp;
+	return min_supported_bpp;
 }
 
 int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
@@ -423,8 +423,9 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 				drm_mode->clock);
 	drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
 
-	dp_panel->dp_mode.bpp = max_t(u32, 18,
-				min_t(u32, dp_panel->dp_mode.bpp, 30));
+	dp_panel->dp_mode.bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
+						      dp_panel->dp_mode.drm_mode.clock);
+
 	drm_dbg_dp(panel->drm_dev, "updated bpp = %d\n",
 				dp_panel->dp_mode.bpp);
 
-- 
2.44.0


