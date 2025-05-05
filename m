Return-Path: <linux-arm-msm+bounces-56757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E02BFAA8FCE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 11:43:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7E777A8653
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 09:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1EC1FBC91;
	Mon,  5 May 2025 09:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="HLgKgiHm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E241922FA;
	Mon,  5 May 2025 09:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438194; cv=none; b=E82LcY7rwpdb+vghnaN/ZvxgBPPknjQLiTW12pN0VWbg8hu9QAB1k4eZjoDZUVFn7rqMLevHdkUwY8sTKB7O1Z2uH9hSpCpZ9mbTKaDQR+HrEe3HoVBv97su7ZyZY4UujoKVU4/USjmOTCkCo9S9gIfLdPpcnQJvzgmlVMlgXaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438194; c=relaxed/simple;
	bh=NabmCJW4D+6rQEiPgQ9+DJrM4B8eKF6WeOaO76+T72w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Lgy3Ui662TFGMriTU8XkEwdfSVdR8nlbjz8kQphrdrrQ8N19+ZUY8uLBtb+rKsTaMCEb+PX8EVsi7PxuDk8ZEltrR/b8+Qb/06eGwTFFm4VwEre2OYi3WdbHW4mkbGUpxR7gXnTJcdBuortbjekXjPm/xJW3tongbea9wTAEse8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=HLgKgiHm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MPkDr005822;
	Mon, 5 May 2025 09:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u8M2UTNNJYb
	bq2yNPP9wBqPGuGRhApujM1NpOhagFZs=; b=HLgKgiHmj99HQ4dImOMBRpfy2Qv
	cGrdaQ0v4uqrc63s1PccdJyJpOW4STsjPIOS+Yceo/5lNAnFFWYhF6PC8V+VBGmb
	CjkjHbAcHIO/9ou5dS/rOUMs6jV/n9dD7rdtEJdyU0or13ui/TLs81OxJ5cW469q
	j8RsTQpL7VZdTtbrJDHvwGJY+Rm8dcInPvKFw915lZuBO62TQ+FXoKrXbUbFiJ49
	ki4JVoe0PUftyZwJvsA36wnwcZNTQO7f0pwBcRx63/gKJ8fVrBjN99XDEuPgHL+1
	3xDG9M5u2KhDjUlQ8EEEAGrDM2kgd3Jn83Ubd9H9yFwM2ai+Y2uBcay3WAw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xst5vv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:42:54 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5459gobl012643;
	Mon, 5 May 2025 09:42:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7m5ju5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:42:50 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5459gmwC012569;
	Mon, 5 May 2025 09:42:50 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5459gn5A012627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:42:49 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id C955A599; Mon,  5 May 2025 15:12:47 +0530 (+0530)
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
Subject: [PATCH v6 10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd status
Date: Mon,  5 May 2025 15:12:44 +0530
Message-Id: <20250505094245.2660750-6-quic_amakhija@quicinc.com>
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
X-Proofpoint-GUID: I7VJfiTBQnTvfq-yPGWoWRAixe3sWxP3
X-Proofpoint-ORIG-GUID: I7VJfiTBQnTvfq-yPGWoWRAixe3sWxP3
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=6818881e cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=9-1pPbMvnaAu_OxZ4bUA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA5MiBTYWx0ZWRfX8UyDI8hpMi49
 /8BlnargLsuIlqhU96eo8b0/LqIGY6KbDDfyU1OlAVWif6Fdic2W5NoXG6llfxUhWGtVpmIWbwc
 ESZUlhRVkMyJNAULEiHyBXola4AMEJuvPMdHApHsJ5Jpdir7wvEZy1rJo64dSgNn9/8CEmjfFWd
 GueVVUMAY2U5MrCcnMSnhgxSbSEdLSehPWpDyPXNKnyucWJuki84mmh6yO74gDC+hhxi8DkjgJB
 L66HQ2YSdV81Xe7wD5yKr/EjDSL2K7iW7IVrw5YBKjq54j9Drn+6MKJriB6yxvOOEvQHL3qpiIB
 N9uH/52EQR1dxys3XhKM7BwqTTd7UdE7yeHfOWx2j4/ipkAWblwquN6Ithi59Vl36Hg41mmPgIh
 q6u2qT3ktV/27rB8SvaB7L/f7W9wdFm/SSgtpgv4R3X/+BQKM++1Fp4BVlfyaSuwsDeKNHHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050092

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


