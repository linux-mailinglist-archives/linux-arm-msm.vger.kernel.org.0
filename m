Return-Path: <linux-arm-msm+bounces-55261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 794A7A9A207
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 08:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E9AF79211C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 06:27:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36051F4163;
	Thu, 24 Apr 2025 06:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bH9gpwQx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AA41DFDBB;
	Thu, 24 Apr 2025 06:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475899; cv=none; b=cDD1A+pxwpzXl03Tag5AM/wHMtiTX/SXnU/euRbOiN9mebzsN6IpfKe1047flMSVEv/634R77MT3yTyMAxSFwdv+ePQKUAvvEfUCgvel2X4eZx5FwzcVC5mbY8v914BqscwtzjZBknUmgVYzcj9sNX40YnLAQIH/WX8cvEWlwrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475899; c=relaxed/simple;
	bh=NabmCJW4D+6rQEiPgQ9+DJrM4B8eKF6WeOaO76+T72w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qEJ3aixmqnSnHkKDI3NoUvh2DNx9bB4DiHB/+c2HRrEhp0NVwXlMCxzdvjACz4oSgxzHaNtQLg6ZzCERFJVfq8UgJwk7vtwQcDEX9jHMRPS3JjDKAKGkIVDBl/g1qYDnA6IAf5awZLp7PkXYaHufiz9AqhQUdAVrYy8VHwAEl2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bH9gpwQx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F72T028374;
	Thu, 24 Apr 2025 06:24:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u8M2UTNNJYb
	bq2yNPP9wBqPGuGRhApujM1NpOhagFZs=; b=bH9gpwQx0oqjkCO1Fp6VMkcXLqo
	jygJUSXhZrfji98hfoaV6ktAZjglh077t5UOk0BquJCEjffoUzv5gXS98AjxxHV3
	ZO8I5O469xwo3bdB49BE+DgOm3JnhZznt+lXbHWokvmTbnM+t5K1I6m8+2jeHoKJ
	gWmAMcVodZrK3GVBvinEFEDsDU2/wm1pnLFBVNX4q7QaGhlrr+8zE3Z6XzLkcWIk
	6V9N8k3+LsBzi4YDaTaIjpYoOQnC2hYVS2RBpQTFZ9MWdOICuaPce58HuoatD4pr
	9FkytLojMxmtIY8wYwIwqgxyvTTv/qtwlRzhtUMj0PzXF7AE10jbugfs//A==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy4epu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 06:24:39 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53O6Oa12004007;
	Thu, 24 Apr 2025 06:24:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4644wn010c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 06:24:36 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53O6Oaa3003957;
	Thu, 24 Apr 2025 06:24:36 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 53O6OZH7003944
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 06:24:36 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id D618859F; Thu, 24 Apr 2025 11:54:33 +0530 (+0530)
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
Subject: [PATCH v5 10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd status
Date: Thu, 24 Apr 2025 11:54:30 +0530
Message-Id: <20250424062431.2040692-11-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA0MCBTYWx0ZWRfX5eRPfmYuC0nB fA6H2NEb4MUECwdk8xkzLfjaD9hmbTtQrxogd2uQSw1MJ38tf4gUaWt8DJ9kcI/jV35/wsLYSkI OnF45FtYjesooo3fomPrPByLItFf37qQwF/azAGkvOElvyMi9c3qAAXbPAvacaX3hr2j4zysgiU
 GtWiSsgIlser3Ku49NO5CvpC02HLuKIQBPumsG+Ga/DSBJoz9G3WjAvIuPHtwJY6GaLNZrxt+kj f/B22t/SYWu1e5lG6i1uR+isukscwnoMf+Lbw+KUBlCXx4odh4tEqsiCqDvt+B6fAKV+NkFvGAv /iJPj31r3lvQIBISfHcfXbIvcM6cvq7odCsmEgLDQiKmnku7OFUt3F8K+76KrciwzyLG+Tmv4G2
 P2BhR+gwtT5sPlIZj/2oWjDLS1slByyidzA9j/3R+yU4oQ/SgWTSz4ZpK5Nr/2MBaTDeUhTH
X-Proofpoint-GUID: LvTVjJHAIm3iuLteua8bO_UD8sFVghoU
X-Proofpoint-ORIG-GUID: LvTVjJHAIm3iuLteua8bO_UD8sFVghoU
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6809d927 cx=c_pps a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9-1pPbMvnaAu_OxZ4bUA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_02,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240040

In the anx7625_sink_detect(), the device is checked to see
if it is a panel bridge, and it always sends a "connected"
status to the connector. When adding the DP port on port 1 of the
anx7625, it incorrectly treats it as a panel bridge and sends an
always "connected" status. Instead of checking the status on the
panel bridge, it's better to check the hpd_status for connectors
that supports hot-plugging. This way, it verifies the hpd_status
variable before sending the status to the connector.

In case of eDP, anx7625_bridge_detect() will not get called because
the bridge->ops condition in anx7625_link_bridge() will not be
satisfied. Since anx7625_sink_detect() is called from
anx7625_bridge_detect(), this results in the sink_detect logic not
being executed for eDP.

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


