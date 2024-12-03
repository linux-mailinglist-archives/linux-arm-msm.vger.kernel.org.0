Return-Path: <linux-arm-msm+bounces-39975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AED69E107E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 01:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02CA5165925
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 00:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33FB2500BD;
	Tue,  3 Dec 2024 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iVj+t04v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB102E400
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 00:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733186374; cv=none; b=tEt2Z6BlUZJU/wty2G8UTBqe4S86d1Uw2OGIPuDunYncxlHPyMTwm5BmdQabLMT+yfld2RYOkvo4LHEPdJ7Vzku4sdsL/F8P2Q4EW89Bvg85B7ghA8OtHqlcq/qwOiZ8jtulsRRHCVPNZ+18trpXMTLCbOZHc5KAYFnzLbmMh5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733186374; c=relaxed/simple;
	bh=Lo+jEu6NU9rKNs+Uk5OmK6M5JhK/oIZ9xIDOah2jISc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=dYjIHkYo9t19oljf66josLLSPVArTD84SDMF+QPTa9dcomA3iRmuvTY/PnAC/lcTA9uI53+RabBLuPneEmYbauLn14WV23sBhuYXhTqSQf5l3DernRURb5ZrgHHzlCZ8EgZ4PB9ZoRvmPfD3hK4U93yXUPqiP2VyQrlP0807/+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iVj+t04v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2JEGYe013776;
	Tue, 3 Dec 2024 00:39:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	emBE/dXkUbQ+cYxv1OOkpqDM3k/VkdW+f7SjxZ0FhbI=; b=iVj+t04vzllhUvSy
	dai/Sh5970E6dG2ntNW/Y5MKRpciJ0TEJhB0IN0T5vVG13+MZlEq0Kjl/TUeEYfl
	d1rzSLTEclqmiNykiK7sgK7jFlzOl6BD/i63XgGCuuf3cuGYdhkLrctddjkkXvtz
	plmhdHoiGiOPcocS33uR5yFc8qgB+Hcuw530A8KhZIcGtiRu7Zp2SG29EDYC/xiv
	/bb57v3lbP9KBP6MoW8nCP4gGCHAGXlF+uQNbcf/DAgOOGWF5UWlFuQuulZY8pm3
	B/cF4HxhrrygXULZAB3w2/Bu7i+v35ccDMboH3uXDaeAq41qtKiQ5+V9MLh7w0cQ
	O2O4og==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ta2xb2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 00:39:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B30dLte012048
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 00:39:21 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 16:39:21 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 16:39:01 -0800
Subject: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks in
 msm_dp_bridge_atomic_enable()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
In-Reply-To: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, Stephen Boyd <swboyd@chromium.org>,
        "Doug
 Anderson" <dianders@chromium.org>,
        Johan Hovold <johan@kernel.org>,
        "Bjorn
 Andersson" <quic_bjorande@quicinc.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733186360; l=1315;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=Lo+jEu6NU9rKNs+Uk5OmK6M5JhK/oIZ9xIDOah2jISc=;
 b=cP3XY3IFnRQrDA0sgS+gkSQ0ipJkyloChlhbfx1AJhr9SVCpDt25B+kRFqZvpsAzmk38jR6Se
 Ah1Xo4PpQn4AfytiUf+kwxYiNnRtVNUcsHL7CnH5Z79DNEiJSo52joK
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UnQ3Ihbn1eGL4UaK8NYdAmc7XIQgpCbu
X-Proofpoint-GUID: UnQ3Ihbn1eGL4UaK8NYdAmc7XIQgpCbu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=960
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030002

The checks in msm_dp_display_prepare() for making sure that we are in
ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.

DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.

For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
there is an atomic_enable() without a prior atomic_disable() which once again
should not really happen.

To simplify the code, get rid of these checks.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 992184cc17e4..614fff09e5f2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
-	state = msm_dp_display->hpd_state;
-	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
-		mutex_unlock(&msm_dp_display->event_mutex);
-		return;
-	}
-
 	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
 	if (rc) {
 		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);

-- 
2.34.1


