Return-Path: <linux-arm-msm+bounces-8309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8B983CCB2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 20:41:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51F861C22EE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89778137C23;
	Thu, 25 Jan 2024 19:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e7jhNSAf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158B213666B
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 19:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211560; cv=none; b=JK3rRRkdgsgQAjfCGLjmWWUvj1VbNa4L7lZP6tNglBOl73S9wLCN7MBuRiV6wvw/QPgT8ejsSEa8iYvqHHesNdwle5EtZ/aO+R+IMV79yjT/Q8T/DjJgmvoLh+rGW+MBFBsPsk50oXSvMQexzvI4k0qXRvaYgQy0Tbz47XDd5YY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211560; c=relaxed/simple;
	bh=ACqLWxHS9vTQlpAsgUrVDoJQowq4afXSP5k5Ggtg/Rg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hqh2gmIVlGC46K9mv5ri9RIHzUPJDbpwt1nqL0ZD4ziTGQORn1m/0XZCHwpbSSXkSBIDe7sw13k3pGlK3GQL3oq6y7F6mchHNlYY4WJpfABjxbFxME6K9xJj5IFpAAbv/Ex7/Gybl9ahDS/dquPWMy/XItiydNHzrJg08HH973U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e7jhNSAf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PDxcj9007267;
	Thu, 25 Jan 2024 19:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=RNT9pg6jIeWU29Ifh0GlkQfkjtzYGOLCtviY2xL8NUw=; b=e7
	jhNSAfBXPh6n12HS8hY/DnM+VMyVfhhSuS7mVDxofs7MUFSRajmXv+erdHtQtAli
	lRcuAXsuGGcafj8ZByD/D3N683XZdJnNSYA7D9Tr3Ip1/tfVS04KEmqf+LqfUTpY
	RSPdbheGX0rZXtEEtET4r3wEBtPHGH4FoH2Wsj39x2Cr2kyKDjuL6iGkkiA2/muV
	87OT/kMkLuzjI9nXBry71QK/PgEnqKOq7cpQ6RWG8O+P8kcZCUTjBDjr33e2r3bO
	AxuZm/+5pgF95G/uC/0N4a09cJHvyW2LbbWuSa5KP2jzgq84kz0uv7F9Nr8fBGaF
	PfhEIQ3xE9rVBNzD7nzg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vun6w1nct-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJdCbY025004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:12 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:12 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH 17/17] drm/msm/dp: allow YUV420 mode for DP connector when VSC SDP supported
Date: Thu, 25 Jan 2024 11:38:26 -0800
Message-ID: <20240125193834.7065-18-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E-LgGlCdRlARs3pC8nGZxDipdxMR_pxA
X-Proofpoint-ORIG-GUID: E-LgGlCdRlARs3pC8nGZxDipdxMR_pxA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=818
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401250141

All the components of YUV420 over DP are added. Therefore, let's mark the
connector property as true for DP connector when the DP type is not eDP
and when VSC SDP is supported.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4329435518351..97edd607400b8 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -370,11 +370,14 @@ static int dp_display_process_hpd_high(struct dp_display_private *dp)
 
 	dp_link_process_request(dp->link);
 
-	if (!dp->dp_display.is_edp)
+	if (!dp->dp_display.is_edp) {
+		if (dp_panel_vsc_sdp_supported(dp->panel))
+			dp->dp_display.connector->ycbcr_420_allowed = true;
 		drm_dp_set_subconnector_property(dp->dp_display.connector,
 						 connector_status_connected,
 						 dp->panel->dpcd,
 						 dp->panel->downstream_ports);
+	}
 
 	edid = dp->panel->edid;
 
-- 
2.39.2


