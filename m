Return-Path: <linux-arm-msm+bounces-56759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5B6AA8FD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B74687A76D8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBD81FCCEB;
	Mon,  5 May 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MKFui8mQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064641F8723;
	Mon,  5 May 2025 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438194; cv=none; b=UN7z5vZGzFRoTzgNqW+Jd3MHogAq0Gsw7wUXPcE2JSInS1cYPAFq19ypy9QlujN9VoRzWuaH6mPkfkdhdzuySdlqnkoK/DfEtbkY7sIYwMLCXbQiqQ2/I4MRTP1/2XEUg8804X4sz/Oj1LO5d0j3OLodvbn4tdVCOBK7M0hPoss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438194; c=relaxed/simple;
	bh=vEqzcRu9m5qvff9QwwVv02gneCqRAe5hs49ok24uYks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ub0wdHMOk1LkjcYganFa3lpUq4Oin8V7z7RgZytELO0uRD2XypR5YolWRGPTFANyOwT+sPrIjnSJcfbBag4CtRWsJfy+1jMVLz+fxLEXxhsYMTEff0WL3Z5zXBOdzU/BP+LmnKm6Y/WjCrgWCGAGUz3ccnBbVE6V6zODKEoD4Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MKFui8mQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MqKoQ019583;
	Mon, 5 May 2025 09:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iFHSC3ADFpg
	QSR1BRPKVYViSqg10EkYFgqiZUGXGuu8=; b=MKFui8mQBw7TVKi/3gEGOLQijCz
	s+Q3RBy9PkrmlTTwrGTkDaRl2uv+FCIpmouRHh4SPSI/AhpVb392QLJ6vTH6i1md
	kP8217DKW2Bwiz5w+qaWm5WKCb5bzpe2bFEp7GQ9uWpTwGi6YMuEQk/npivsbm07
	tGEGxMaguOzyJMkC35nS9nmgXip+Qi7a4m1FJtPAAaEFUaaszzSE77ytkbSzwpsm
	F84k0aGLolksg48MwwgGjHNtljcuY8e9HBRvVzTkw9BlhVLwtK+zZkJET/K93XKn
	ykMJOanR7u1hEz3gB9D/atbd2SQdKkYuckGVYfn4FNN8gc/CypbNRpUQ/5w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xst5vr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:42:52 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5459gnRs012604;
	Mon, 5 May 2025 09:42:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7m5jtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:42:49 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5459gmXd012566;
	Mon, 5 May 2025 09:42:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5459gmnL012564
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:42:48 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id C3FFA598; Mon,  5 May 2025 15:12:47 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: [PATCH v6 09/11] drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
Date: Mon,  5 May 2025 15:12:43 +0530
Message-Id: <20250505094245.2660750-5-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-GUID: 2J5QOqdQUripADfWwv2ITMwDjJDHYdb_
X-Proofpoint-ORIG-GUID: 2J5QOqdQUripADfWwv2ITMwDjJDHYdb_
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=6818881c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=IFNFO8iCMOh0I8FUMx0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MiBTYWx0ZWRfXzS15y6s+DUQm
 //MOfGbZGn/lGmJiXfPha0dh4ad2BuYWgigcSljNrc72y6Om/DpNTAwvwWdjoB4D5dKjUwVfC81
 /4gdsvlQaUdtRICcyiBHaOUuW1UFMjTun3BuNuQo6DoUVKKFmAlosbvcu1cVWRKvcIvE4Shv33/
 Fsq/+HncU8t81VTAvjs6HwtSGUcEryHsFMZqsSFG+7L08gezkWmVV5p7jzaQXONRZ8rUlhp08dP
 QCPhU0KyFHiNXaP/IJ82TTPRof/P5caI5Azi13AqYwSIwGi0qTnJ+4vaTXnQg4bInFd+GQcZU9+
 SjWIVjyY2wPAx6pvd7ohwGPSNulcH2e5OvtdazyzsbxzQ8991OWWpv4i7QpnlMk8LWd41TSdIoz
 8Zbkeeo5twYZBwFGsuhOclXoPCJPsPvngyuH7Ejx4J91An3guwdIAuNNz9nwvl3ZeGONIy1K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050092

The anx7625_link_bridge() checks if a device is not a panel
bridge and add DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT
flags to the drm_bridge->ops. However, on port 1 of the anx7625
bridge, any device added is always treated as a panel bridge,
preventing connector_detect() from being called. To resolve
this, instead of just checking if it is a panel bridge, verify
the type of device based on aux whether it is a DisplayPort or
eDP panel. If the device is not of the eDP type, add
DRM_BRIDGE_OP_HPD and DRM_BRIDGE_OP_DETECT flags to the to
the drm_bridge->ops.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 99ef3f27ae42..a32ebe1fa0cd 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2608,9 +2608,8 @@ static int anx7625_link_bridge(struct drm_dp_aux *aux)
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


