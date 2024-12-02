Return-Path: <linux-arm-msm+bounces-39953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DB69E0D8E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 22:11:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F125B3C2AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 20:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9C4C1DF243;
	Mon,  2 Dec 2024 20:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XEuFWHkS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A59A1DEFC5;
	Mon,  2 Dec 2024 20:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733172166; cv=none; b=rmPQJJCKzkF2uETQ5OsVJUDlATtI1xsN9RCkvoCrE+HrhwgVDjYvAeVbWIOYXdmjmJleIUl6cxPq1eg4ehAmVQeZ+X7EKd5LYu7uQCKU8Pkh3DRuEHTZoi7UwdIzQ+LnZBmktvNp1HvEf8xZQBYUzo/VipNFm5TpsebWDKosabo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733172166; c=relaxed/simple;
	bh=dIijZwoRaA6rxyvoqR4huEu7nEMw44IUyghyh0WYPc8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=XfudkMFzPN4K+NdlJLkyl4TbD9jRP+qWQdj8N1mZJ2phX29adJLUPwXu0XoLPKhV1XqBjPwvvBhX2eOYkvA3nMWpE8MSe96hqFWHxc2vQ7YLKtQ+7BD5BXTF5+eZvqAGThREKIr5eD5Q1U/k9NU8HFQCv12oIpB+ylHuUACbcYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XEuFWHkS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B29XNBl026469;
	Mon, 2 Dec 2024 20:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6BGp4ismpDEOyFPSZ2otVrrI661Oz81+8eHZ9x8VmKU=; b=XEuFWHkSWZXVTfCZ
	nSAkCYK+NgIwhzP87sLRyuhisuEHNDO2YWp9i70stx2J/lyp0lZ8jHpJUtpz7jK6
	56Tsm+Kr2KdYRYvbXybY6m5Idr+KixnGMDsEP/bumBBErjsDnEd8DCZRMqb35TWH
	vviP9NyCPhkv51fSeLvhr2e8V+c3tkgUutd3god7n1lPyXRXBDEeI83W7NNmx1q8
	NbOFyzo672ZMNf0bOmEcYKerWdLtSmXsFjFXJVTw4FN9ibp95iwo8vMB2wy7PtrZ
	FGglAmcn//qfvGZz8GfjDTMGltwAgWXfaZJdSj/aOUn3VETV239Y5dcvppHTPvCK
	EvNvnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe5u6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 02 Dec 2024 20:42:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B2KgZhk028654
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 2 Dec 2024 20:42:35 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 12:42:35 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 12:41:59 -0800
Subject: [PATCH 2/3] drm/msm/dp: do not touch the MMSS_DP_INTF_CONFIG for
 tpg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-tpg-v1-2-0fd6b518b914@quicinc.com>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
In-Reply-To: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733172154; l=1252;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=dIijZwoRaA6rxyvoqR4huEu7nEMw44IUyghyh0WYPc8=;
 b=4B7z7IF5pWVXkf23L/XprZeUT8sv4/9yuOhEZynQnUI085ig+bwm74lAgavAJnFmEgph/dlIx
 DYCsqg6D+cYClY+HIPBjOXcnTPdLsOe2tNjaBoqxZn8xRBlumWecxga
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rkYBwRkElpsSTBXFBLVK7fUpvzg3hGDH
X-Proofpoint-GUID: rkYBwRkElpsSTBXFBLVK7fUpvzg3hGDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=962 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412020174

MMSS_DP_INTF_CONFIG has already been setup by the main datapath
for DP to account for widebus to be used/unused etc.

In current implementation, TPG only switches the DP controller
to use the main datapath stream OR use the test pattern but expects
the rest of the controller to be already setup.

Keeping the same behavior intact, drop the clearing of MMSS_DP_INTF_CONFIG
from the msm_dp_catalog_panel_tpg_enable() API.

Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 05c8e1996f60..36d3f3d248ca 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -1048,7 +1048,6 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 	display_hctl = (hsync_end_x << 16) | hsync_start_x;
 
 
-	msm_dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0x0);
 	msm_dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
 	msm_dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
 			hsync_period);

-- 
2.34.1


