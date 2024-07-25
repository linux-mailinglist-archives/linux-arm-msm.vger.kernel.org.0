Return-Path: <linux-arm-msm+bounces-27057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E668793CA91
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jul 2024 00:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 448811C21C40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 22:04:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2EEA13AA2A;
	Thu, 25 Jul 2024 22:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dcSTU7ZV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61501F17B;
	Thu, 25 Jul 2024 22:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721945080; cv=none; b=XMsiYkFMtK6JcaIomCQxKUBtkw6BCoagK3U+V4Gzh/wk98icpJZ8/oUazxVhXynwf4O4JdBsQV7daNHyMdL9MWJQ6MdwFCw1boXhTFeCDVxQ8Ckemit7SBq+OtrZmPdikGNRmGjlrQuE/I2psfznhE1XPrWCgtiJ+wk+FxMx4jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721945080; c=relaxed/simple;
	bh=uuroARgVnFJ0rHpxVbnK78XB3KFDXuwJbRPhEOuTF5E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U2xtiz0cUREfSV/FUEtq2JizNrUDWssmTiqgVL+TDxNP+0jI4y7xdsB8RlD9c4Vyu2XlqaAq4WWo+ptTAuq/XrvCUH61Ow5AXHmvEp/folbGge+SVOUxLGGka6alTthptsm+460yehwPqjMqHRCDgnwmi84vqGR2gRUAsLM9T3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dcSTU7ZV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PJbVra009144;
	Thu, 25 Jul 2024 22:03:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=N6UbJAMi1bU7nIh+XutsN6
	bZa8Is03DzQ1MqeidxQVU=; b=dcSTU7ZV3wtNGUlgKRqMR4/kMp7oSjcnxounf/
	cIUzENz7kDQjWTH0iXiR/Ey9JNk+a3WCGe5grM0e5/Tm0H9+ypOkPLt566vg5A2Y
	eEakexNIfOhAZCFdLlzBLvzOwE7yReQAYhL2mcZBY5QC3ISprp06HiujwypMfCQX
	MQ1VP4Nzb4XO77yp6FF295mbTYlg4/8/Mhqj4Bd1zTG8PvNKHmJY4ELzxKJO9lgP
	ICfQPGKfkeiNcmZbcQVREL+ivSCLHxFvdbfqRK947YP9omk4BuUNGWOkUc64L+nA
	3KCVksikn8+ptCiCVhdIz9oQIiEYF25XV+iuEmEs2Iz8vkfQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g487pbem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 22:03:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PM3rHH013267
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 22:03:53 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 15:03:52 -0700
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
        Guenter Roeck <groeck@chromium.org>,
        Tanmay Shah
	<tanmay@codeaurora.org>,
        Vara Reddy <quic_varar@quicinc.com>,
        Stephen Boyd
	<swboyd@chromium.org>
CC: <dri-devel@lists.freedesktop.org>, <quic_jesszhan@quicinc.com>,
        <neil.armstrong@linaro.org>, <abel.vesa@linaro.org>,
        <quic_khsieh@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dp: fix the max supported bpp logic
Date: Thu, 25 Jul 2024 15:03:19 -0700
Message-ID: <20240725220320.130916-1-quic_abhinavk@quicinc.com>
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
X-Proofpoint-ORIG-GUID: ziitW6v3wi2a0z_fAkYGICI3PhFNMyt5
X-Proofpoint-GUID: ziitW6v3wi2a0z_fAkYGICI3PhFNMyt5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_22,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407250151

Currently the DP driver hard-codes the max supported bpp to 30.
This is incorrect because the number of lanes and max data rate
supported by the lanes need to be taken into account.

Replace the hardcoded limit with the appropriate math which accounts
for the accurate number of lanes and max data rate.

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_panel.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index a916b5f3b317..56ce5e4008f8 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -397,6 +397,7 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 {
 	struct drm_display_mode *drm_mode;
 	struct dp_panel_private *panel;
+	u32 max_supported_bpp;
 
 	drm_mode = &dp_panel->dp_mode.drm_mode;
 
@@ -423,8 +424,10 @@ int dp_panel_init_panel_info(struct dp_panel *dp_panel)
 				drm_mode->clock);
 	drm_dbg_dp(panel->drm_dev, "bpp = %d\n", dp_panel->dp_mode.bpp);
 
-	dp_panel->dp_mode.bpp = max_t(u32, 18,
-				min_t(u32, dp_panel->dp_mode.bpp, 30));
+	max_supported_bpp = dp_panel_get_mode_bpp(dp_panel, dp_panel->dp_mode.bpp,
+						  dp_panel->dp_mode.drm_mode.clock);
+	dp_panel->dp_mode.bpp = max_t(u32, 18, max_supported_bpp);
+
 	drm_dbg_dp(panel->drm_dev, "updated bpp = %d\n",
 				dp_panel->dp_mode.bpp);
 
-- 
2.44.0


