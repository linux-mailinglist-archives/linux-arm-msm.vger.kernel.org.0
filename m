Return-Path: <linux-arm-msm+bounces-54588-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3229AA912C5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 07:39:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9467D5A1779
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 05:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D547F1E32C6;
	Thu, 17 Apr 2025 05:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GVDymccb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7F11DB148;
	Thu, 17 Apr 2025 05:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744868382; cv=none; b=GNxBS9kajzcsYydE+W87pKtwS4A7IRwxdvctjiJ5qObmhO9QaPYfmFyNvs6uFNGw5+InC4QXYVIoE4MxLNAaaFsrvOV5hlaAwFSt8Hc97L4eld/dh/njmMfzSWnMjr75cdUefSJAePpdLTUal2n30YC+qw8fRgF3eVnQAhDxC10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744868382; c=relaxed/simple;
	bh=MuPKrP8Q3HMD65WcbNph+PAVgTWXrCUvyyFklHIFMi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Qg2rVeUebDQ/ecGOxQPv0dKWvRTZoOUOiF8D4Eyh3HrGfDJZShGE6KBaUSm+ZOoo1ttaclf4naDT6W9OGuN9/cKOpffaaWkUPIGiwR5i8SG6xdByU+6C/Xn81Fx5bThszx81uezjE8Lf8kbsMcbC1U2ZENtLIcCuGwTzKKx55cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GVDymccb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GKtFGq000411;
	Thu, 17 Apr 2025 05:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dug18dOLhbm
	Yef2wdrxBiNME2HbXaxZFMXR986D7jlg=; b=GVDymccbC/r/b3EI+KwmyYUd6Ig
	+w/b7AS6BcFvNnkqWwrxlER26btRg19ZUoxOg31F/HiNKBPmYitgjkGrEbKGdOWK
	K5gOj6AvcUjXybR4DUITLTb/kWuFVh2poJhPdftpkyShPWfSMPFsLwE/uFuMYPxg
	QfEMk+Xr8aWn495zfjx4dFyP/xgOzF5KR8uQehO/rcsRCj1Sq/9p4yH0rVLBb0jx
	9kDEkgABk1Fb9dXWHX7KPmpCA85rbwlUAUVICfIb//uJshwLmhObEBuqR0W3pHfI
	8dghq4CL1hbWqBpqRHbAk1sVHh+ukb6/FvkmIXIGRVqcS3D5WUbA/VqGfNg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vnvxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 05:39:20 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5dGwO024046;
	Thu, 17 Apr 2025 05:39:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 462f5dnuh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 05:39:16 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53H5cW57023608;
	Thu, 17 Apr 2025 05:39:16 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53H5dFqG023992
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 05:39:16 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id CC53959F; Thu, 17 Apr 2025 11:09:13 +0530 (+0530)
From: Ayushi Makhija <amakhija@qti.qualcomm.com>
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
Subject: [PATCH v4 10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd status
Date: Thu, 17 Apr 2025 11:09:08 +0530
Message-Id: <20250417053909.1051416-11-amakhija@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
References: <20250417053909.1051416-1-amakhija@qti.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: l9jomwqsAmr_y6eIPV0Vgu0bpv82-ln1
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=68009408 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9-1pPbMvnaAu_OxZ4bUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: l9jomwqsAmr_y6eIPV0Vgu0bpv82-ln1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1011 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170042

From: Ayushi Makhija <quic_amakhija@quicinc.com>

In the anx7625_sink_detect(), the device is checked to see
if it is a panel bridge, and it always sends a "connected"
status to the connector. When adding the DP port on port 1 of the
anx7625, it incorrectly treats it as a panel bridge and sends an
always "connected" status. Instead of checking the status on the
panel bridge, it's better to check the hpd_status for connectors
that supports hot-plugging. This way, it verifies the hpd_status
variable before sending the status to the connector.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a32ebe1fa0cd..365d1c871028 100644
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
-- 
2.34.1


