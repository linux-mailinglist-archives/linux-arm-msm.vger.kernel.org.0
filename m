Return-Path: <linux-arm-msm+bounces-39979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1607C9E1080
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 01:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FD32165D98
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 00:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB0D1553AA;
	Tue,  3 Dec 2024 00:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CaZfIE4n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6524C60B
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733186375; cv=none; b=cBr82Ml+o4HK6+lYTKlIXFrEsk7Negv13h9dYKsDo6sjNWIkMEV+eWbBOk2cYm1lF5Sw9C8OcIIFcBhOEHO2zcldT4i5pmUI7Qgoup5NTJ97sjUYaXDIOAcmj5j79gs185We8z/LuQY4rzKz5Xf3N0r4ha1+XUN7AfAdn5aJ/eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733186375; c=relaxed/simple;
	bh=k6S3Lu59R/9ciU62ibkq8v6vGFAAGJ1GQLJwhNWGZfY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OrO4qKjbiHBhmXthBbjxvTMgO1/EnOOlBIWMfNJA0nnp3OnuChU7EqxaYOYkkaKC/PkspfjlrfslEl87tvbpyLopQPZy1M3mKBOFaIMFLSAeo8fEg2uVxmcoRMSve3yOJvzq3YLRJ55TRjsrOul1WlTGt7xDBO/hVZ/jHYc/vwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CaZfIE4n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B2JPsRV014902;
	Tue, 3 Dec 2024 00:39:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T99r+fggIaiJDv4ZZEfajlyRMvGy1uBjJpJWNGUiOGo=; b=CaZfIE4naZqj+Ki5
	jHTa2iHVnJ3ZBQPYcnmoTXTcF7EnnGRDvSuhMmeAA07D81ncXJFUfn/TVAd0NI+4
	jP5ttOsHRUc8NsMJjUzfzGxHZyT9/dUsXXoQ8yTVFnHkTDQFO8fYnarvbG/GYgRX
	tMDXSZQCISdiu7hguyukOrkyZ20ZzhwCpuMJ1Bwl8b//i85vjJbty0V2mQ/o24JT
	aTeDsWo4isHWhbqiS0oB9jQbqU0/xz8yI14qh785n3zDzGeiHkyB7mhboAlUV8Mn
	E0wyuQjVnpi0VceWvjPiIF18G48Ap2LYzJL/vWeIB84zHmaXSE+wfms1tx9NaUKW
	v8ny8w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe687t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 00:39:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B30dLZ8020547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 00:39:21 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Dec 2024 16:39:20 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 2 Dec 2024 16:39:00 -0800
Subject: [PATCH 1/4] drm/msm/dp: remove redundant checks related to
 ST_DISPLAY_OFF in plug/irq_ipd handlers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241202-hpd_display_off-v1-1-8d0551847753@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733186360; l=2183;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=k6S3Lu59R/9ciU62ibkq8v6vGFAAGJ1GQLJwhNWGZfY=;
 b=HRIUS08QeGieuPsk8SUbQeMZRovX3EJvs5R4Br5Dq16Txx4lC8iY+/Cj7VIP+lwlF7P/qBovs
 HPleih41xC8CfGWeY9eqMMviWJDB5LhzQCzzyY54aZxeO4wmAwuqGNq
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: wGCrok6LtKIQRxwFqoKeG7xcBgSeOM5Y
X-Proofpoint-GUID: wGCrok6LtKIQRxwFqoKeG7xcBgSeOM5Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030002

In commit 8ede2ecc3e5ee ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets"),
checks were introduced to avoid handling any plug or irq hpd events in
ST_DISPLAY_OFF state.

Even if we do get hpd events, after the bridge was disabled,
it should get handled. Moreover, its unclear under what circumstances
these events will fire because ST_DISPLAY_OFF means that the link was
still connected but only the bridge was disabled. If the link was untouched,
then interrupts shouldn't fire.

Even in the case of the DP compliance equipment, it should be raising these
interrupts during the start of the test which is usually accompanied with either
a HPD pulse or a IRQ HPD but after the bridge is disabled it should be fine
to handle these anyway. In the absence of a better reason to keep these checks,
drop these and if any other issues do arise, it should be handled in a different
way.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index aba925aab7ad..992184cc17e4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -562,11 +562,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_CONNECTED) {
 		mutex_unlock(&dp->event_mutex);
 		return 0;
@@ -689,11 +684,6 @@ static int msm_dp_irq_hpd_handle(struct msm_dp_display_private *dp, u32 data)
 	drm_dbg_dp(dp->drm_dev, "Before, type=%d hpd_state=%d\n",
 			dp->msm_dp_display.connector_type, state);
 
-	if (state == ST_DISPLAY_OFF) {
-		mutex_unlock(&dp->event_mutex);
-		return 0;
-	}
-
 	if (state == ST_MAINLINK_READY || state == ST_DISCONNECT_PENDING) {
 		/* wait until ST_CONNECTED */
 		msm_dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */

-- 
2.34.1


