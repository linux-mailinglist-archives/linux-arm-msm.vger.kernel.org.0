Return-Path: <linux-arm-msm+bounces-49297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1FDA43F3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:20:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C0021894677
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910ED268C67;
	Tue, 25 Feb 2025 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kDM7onh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F41E485;
	Tue, 25 Feb 2025 12:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485935; cv=none; b=exUFHivIBdVMeQD+MvlqDA3tuu8KwibS7OBgYMJeX92kR8ILkq8Hdkuqvb6sj31DFxtnTvBCaFWWnbpo/ZCLc+mHnr0+KD+Ru+4GUy4Di849j8EiTJuwWUMuOw96jzQSCgi+rBWK/xbje6GUJMz306K6g68925tRgxsvvTGS1zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485935; c=relaxed/simple;
	bh=YBHH8hkv0/TwT4NM1QAeZFWPSwbQ+K7ke0JsuNQ++84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sn29wNMvTjUm+7VBSmLeMsR4SfqembIg92Nbk691mKww0PIPMuNAdAkpqZfMF7gYyIZS1DlAA6HmMK2UTrDPHLMFS7qJgynDE3jjjpT0SSvGw4fe/ZV4QTh2Ji8GJxiuT2/5LEMCmZrq7X96SkOjUMRKf2HVVoc2KWCD9i+ktpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kDM7onh2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P89Pvc031183;
	Tue, 25 Feb 2025 12:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fDvXmzLmUt1
	n43KKS81fLyYfyX/KDzgCPEPEPE3NObg=; b=kDM7onh2tzKSZgmVyJix2m3WpLc
	eYjUKzsjHe9aFV+j8uR5BJ45DoITm1GPwT+6v3b+KTV+MXTABPljezqM5tJZNcoc
	kob9XPO4cD/kkuc9TNUMyBhwcfouykNbuOV4GTcSILgPxLiIa5T5vqs+V0j9SdPO
	CMzhNVvfHFNsIhFfTr9h7nkohvDAZwEdnY13UIvPZ9D73SIk0rpzGK/kiSwjxEBa
	QbsPjnLUra6saBt4kXfkmc1NyIUZZL82gtJlDt+8OexnVIpofhK+tcGVbtLAjYZU
	0UCVYaH7Em+7AnSO681REhDSAmvnM3eEKI+kwSV8/4iv5R6CyJflSkQCcyA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6nu0u9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:38 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCIXoY004488;
	Tue, 25 Feb 2025 12:18:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44y7nkx1yb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51PCIYQ5004510;
	Tue, 25 Feb 2025 12:18:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 51PCIYXI004505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id ACB0D58F; Tue, 25 Feb 2025 17:48:32 +0530 (+0530)
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
Subject: [PATCH 09/11] drm/bridge: anx7625: enable HPD interrupts
Date: Tue, 25 Feb 2025 17:48:22 +0530
Message-Id: <20250225121824.3869719-10-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: GK0cv4sY6BDYw7dgcRA6hoSOL1HNE4sT
X-Proofpoint-GUID: GK0cv4sY6BDYw7dgcRA6hoSOL1HNE4sT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502250086

When device enters the suspend state, it prevents
HPD interrupts from occurring. To address this,
add an additional PM runtime vote during bridge
attach for DisplayPort. This vote is removed on
bridge detach.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 4be34d5c7a3b..d2655bf46842 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -2168,6 +2168,9 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 
 	ctx->bridge_attached = 1;
 
+	if (ctx->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort)
+		pm_runtime_get_sync(dev);
+
 	return 0;
 }
 
@@ -2175,6 +2178,9 @@ static void anx7625_bridge_detach(struct drm_bridge *bridge)
 {
 	struct anx7625_data *ctx = bridge_to_anx7625(bridge);
 
+	if (ctx->pdata.panel_bridge->type == DRM_MODE_CONNECTOR_DisplayPort)
+		pm_runtime_put_sync(ctx->dev);
+
 	drm_dp_aux_unregister(&ctx->aux);
 }
 
-- 
2.34.1


