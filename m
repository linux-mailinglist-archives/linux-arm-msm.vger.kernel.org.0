Return-Path: <linux-arm-msm+bounces-53231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D730FA7BBED
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 13:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B8BF17AD55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Apr 2025 11:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04CF31EE7AA;
	Fri,  4 Apr 2025 11:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q2W0gomY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3419B1DE2BB;
	Fri,  4 Apr 2025 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743767775; cv=none; b=VYdej/lTSJh3W/CvmgIKAo3NvhUPEt0RW3lb5yFoX9oEN52NghcOWMw6sHY+v0geugWpxlE17gR+JKneDO+DBxb/8vLarPirZXT+u/CSAZ0iW6m7tMKO/OzLzndZvnbycOFJWz9/VbJ6I6I8cXh3IWNFO3TcxCR4XLOaylceJgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743767775; c=relaxed/simple;
	bh=521hByyU3xCjBrqg+Vdrxo0m1i/+0sLUGFQ9jpUfbco=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LZbJaE5BMth8dio6LVPeoMjzRbZeXirpiuWq7xVKWfNnVpMgrelH0uoiemGZ2c+2DnbvR7T6Ad8A7/iicMskmMmVfT8ggxkt71oi7KVIuR4cSdjsHBqqpaERhNI9j1/2BUdpBFqXT++68e0ixOhOKGQF3JsfAj1xmFjx5aa+crA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q2W0gomY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53433pQC016632;
	Fri, 4 Apr 2025 11:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=stoQeFnCRJJ
	P+5hN4xdHhEe5hTFaoED8fOY39ugX+To=; b=Q2W0gomYd+Um9fcycCKgn8TO+Uq
	1eW7RQlkdDR/1+urhJV3VLRL866LC0idjcpU6/gdtzuP+oWnceNGAwunrbxSuelv
	VTYQOmCfRLkt13rCIrxkrAB51fgsl/t5sLppegdYY1u0pWCS7qUMLQhzMZe8zpx4
	AUJ4Ny9zKkJz3KP7nbIGsvwFGbMjtQLj1AAHkk4PbbVhicFPJzLzZ1EQr0k5ci25
	AiURx94ze26tojLdv2S2Y3WqXMmfMPvtHca8WnmOM81UVhrheooYGlUWaZRkm0Rb
	V3CVbq/aLpZYztQHVh85sngApssCdBe83ezZb12ohLDMf6Yzpos9jv8V/KQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45t2d99nuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 11:55:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 534BtkC2016588;
	Fri, 4 Apr 2025 11:55:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 45p9xmaeju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 11:55:46 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 534BtjHM016496;
	Fri, 4 Apr 2025 11:55:46 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 534BtkZ2016542
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Apr 2025 11:55:46 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 5364B59E; Fri,  4 Apr 2025 17:25:44 +0530 (+0530)
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
        quic_jesszhan@quicinc.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 09/10] drm/bridge: anx7625: update bridge_ops and sink detect logic
Date: Fri,  4 Apr 2025 17:25:38 +0530
Message-Id: <20250404115539.1151201-10-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
References: <20250404115539.1151201-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: xzIhmoNqT1dCw95Ns85gF-jek0uv-XJi
X-Authority-Analysis: v=2.4 cv=cpybk04i c=1 sm=1 tr=0 ts=67efc8c6 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KzNNLWg-im-pYHkXERoA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xzIhmoNqT1dCw95Ns85gF-jek0uv-XJi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_05,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504040082

The anx7625_link_bridge() checks if a device is not a panel
bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT to
the bridge operations. However, on port 1 of the anx7625
bridge, any device added is always treated as a panel
bridge, preventing connector_detect function from being
called. To resolve this, instead of just checking if it is a
panel bridge, verify the type of panel bridge
whether it is a DisplayPort or eDP panel. If the panel
bridge is not of the eDP type, add DRM_BRIDGE_OP_HPD and
DRM_BRIDGE_OP_DETECT to the bridge operations.

In the anx7625_sink_detect(), the device is checked to see
if it is a panel bridge, and it always sends a "connected"
status to the connector. When adding the DP port on port 1 of the
anx7625, it incorrectly treats it as a panel bridge and sends an
always "connected" status. Instead of checking the status on the
panel bridge, it's better to check the hpd_status for connectors
like DisplayPort. This way, it verifies the hpd_status variable
before sending the status to the connector.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 99ef3f27ae42..365d1c871028 100644
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
@@ -2608,9 +2605,8 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
 	platform->bridge.of_node = dev->of_node;
 	if (!anx7625_of_panel_on_aux_bus(dev))
 		platform->bridge.ops |= DRM_BRIDGE_OP_EDID;
-	if (!platform->pdata.panel_bridge)
-		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
-					DRM_BRIDGE_OP_DETECT;
+	if (!platform->pdata.panel_bridge || !anx7625_of_panel_on_aux_bus(dev))
+		platform->bridge.ops |= DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_DETECT;
 	platform->bridge.type = platform->pdata.panel_bridge ?
 				    DRM_MODE_CONNECTOR_eDP :
 				    DRM_MODE_CONNECTOR_DisplayPort;
-- 
2.34.1


