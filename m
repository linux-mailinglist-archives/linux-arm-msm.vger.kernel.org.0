Return-Path: <linux-arm-msm+bounces-49301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04998A43F33
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:19:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 322E93B076C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38B3C268FF4;
	Tue, 25 Feb 2025 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GEGVWtT3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47F6267731;
	Tue, 25 Feb 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485936; cv=none; b=FrQq2YO/AsJNLSxrpWukYBSR7tACEf9KKU5K9y1ChDnF5Z6/UwtVvMsrCLQ9blK+fGnf/DYakzhUOOXxangxPY9m+g5a1UJ/zJegjwnhLpm2zjxEHlRd0xVquql2sGjdr+MnFrX+U9ASGPtKjbUUTHOmiY6UNLU7njZUv0qQdhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485936; c=relaxed/simple;
	bh=0vXsx2hCx8zazZ29Vhoe7p5yuiSCl6dHsyDK3VZ54YY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KHb0DGnSPUZDkXROBKgvLDoqaGyHUDu7GCUXuaM6kt5RBUHHJ1pFlDyiFUDvT72H5I468n3Z3rQMK4q5AR17G5hmid1RbEv0HtgTp3CtWjSVteHiQqkOE0DWW7ELkrAN1HLkk9gaikUWzMfm1sgpROZDoWY7c3i7+P+L7iELbpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GEGVWtT3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8JkDD009201;
	Tue, 25 Feb 2025 12:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IfzISr8K6Us
	XEGe5sMBjBTugozgeTpx/4r4CZFzts9M=; b=GEGVWtT3uBUfC/tStv6ECeKginj
	dQ7eqWFs6YfqzRQdHsmzSseeJK5DRMALG8lYQy7BC+y6g8nWQGs8mF0f8JEZkL4E
	M6nL9NjyoLUIDJt0RpHPaCmvBpY/TBQqonx3ZkwNVW8xaIo3uENea6wNsJmQlHQC
	TZpsqEbCT8njKWH/65nCExTzCiHVV/QP+RF7Zks/m+uilnkM+q1HY439yDxxr73W
	F2u55Z0FMFd4DrzARipTA10gU1UlVI3MwluWUrwjhkn/ZHpwnC1zxBflVKSpcOnU
	/1v7LvXkQrZB0C2d3RlumWWhbbdYjWfRD2tRoRCQKtYHg70IyH7/UMhn+pQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6y6rt37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCIX8s004487;
	Tue, 25 Feb 2025 12:18:35 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44y7nkx1y9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51PCIXVD004460;
	Tue, 25 Feb 2025 12:18:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 51PCIYP5004503
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id B16DE590; Tue, 25 Feb 2025 17:48:32 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: [PATCH 10/11] drm/bridge: anx7625: update bridge_ops and sink detect logic
Date: Tue, 25 Feb 2025 17:48:23 +0530
Message-Id: <20250225121824.3869719-11-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: a79Ctre3nMEc0WZyqt6lqSJu5fwJzXsj
X-Proofpoint-GUID: a79Ctre3nMEc0WZyqt6lqSJu5fwJzXsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250086

The anx7625_link_bridge() checks if a device is a not a panel
bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
the bridge operations. However, on port 1 of the anx7625
bridge, any device added is always treated as a panel
bridge, preventing connector_detect function from being
called. To resolve this, instead of just checking if it is a
panel bridge, we should verify the type of panel bridge
whether it is a DisplayPort or eDP panel. If the panel
bridge is of the DisplayPort type, we should add
DRM_BRIDGE_OP_HPD or DRM_BRIDGE_OP_DETECT to the bridge
operations.

In the anx7625_sink_detect(), the device is checked to see
if it is a panel bridge, and it always sends a "connected"
status to the connector. When adding the DP port on port 1 of the
anx7625, it incorrectly treats it as a panel bridge and sends an
always "connected" status. Instead of checking the status on the
panel bridge, it's better to check the hpd_status for connectors
like DisplayPort. This way, it verifies the hpd_status variable
before sending the status to the connector.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index d2655bf46842..9b6303267924 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1814,9 +1814,6 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 
 	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
 
-	if (ctx->pdata.panel_bridge)
-		return connector_status_connected;
-
 	return ctx->hpd_status ? connector_status_connected :
 				     connector_status_disconnected;
 }
@@ -2596,9 +2593,10 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
 	platform->bridge.of_node = dev->of_node;
 	if (!anx7625_of_panel_on_aux_bus(dev))
 		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
-	if (!platform->pdata.panel_bridge)
-		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
-					DRM_BRIDGE_OP_DETECT;
+	if (!platform->pdata.panel_bridge ||
+	    platform->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort) {
+		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
+	}
 	platform->bridge.type = platform->pdata.panel_bridge ?
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
-- 
2.34.1


