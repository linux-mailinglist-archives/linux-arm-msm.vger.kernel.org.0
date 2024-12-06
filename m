Return-Path: <linux-arm-msm+bounces-40693-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9F29E662E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 803EE16A056
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C35200B81;
	Fri,  6 Dec 2024 04:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S48B7wxx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F62F1FCFCD;
	Fri,  6 Dec 2024 04:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459604; cv=none; b=GBaa29s5W4Wfhn+4H6qyr9kR5rek20w218F/63H7iON7uqaVE7IW306WhWU2qolBA4Rpi8hJgdg/4Z/I1RIH2S1TCLILk49v6Z4es7/kv7QnejlUuTTDTezUcv7jJl3en8uVQ9etv2Jhh11YQxwcdzyrWopqZ+cFnPLuMD6/FIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459604; c=relaxed/simple;
	bh=pEXAbcb/XbrlPBHidnmD1zE5VNW/+sEQEjvDXd+pRRs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=f1+1SUNHw3mgxXOVj3OMNo3iMvezod8psJkZYXB3XL04u4ejW0v7GLy0mXpOaCAbW2+R8MFzPBzJU4CEZy+8DWeSd/wtN2uA3Yf3y3qkEA0GxiWMQ+jw2bBKJ7zQha9WmWjcr/O/Z5JVQkJpqFX+SFjVFT+DOauJgVqcdW638IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S48B7wxx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B63jhgU006176;
	Fri, 6 Dec 2024 04:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+t3YWbRqp2EhX/4PCwO/Gx2y+QOrMibU5cD3BnnCNEg=; b=S48B7wxxuZ5f6Lw+
	XYlgh3Ihlx43bvbIj3xi3Dy3k8CEoDtRfomv3hpG18fv0SoVb5B5bmdjuqQQ9j2I
	75S3kDPBUFmJzEubDkcDO6WsSuhmWdcbL9Bv3qYB2R38FQa5+OIowNteX+ERKcLj
	+L9xRT3tV832pAJX7u0grr/HCHWqr/kxE29cDdEuqsp6G1bC/LNGOw/wEd7mfDBA
	qwS+oErxH3Rjpi/1pPxaPWhjAQxEf0+9WYhPZSmcB+ebLr/mGaUEIuJU/zlqp89X
	cLhre6wizasLYHsudbeLV0Nc3cxVlvu7ytc4WhOXnWxBUsGOPsLDa0C9O8uW5wKH
	+sSQsg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bsn6r38m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wj78006128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:45 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:44 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:07 -0800
Subject: [PATCH 36/45] drm/msm/dp: propagate hpd state changes to dp mst
 module
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-36-f8618d42a99a@quicinc.com>
References: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
In-Reply-To: <20241205-dp_mst-v1-0-f8618d42a99a@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        "Chandan
 Uddaraju" <chandanu@codeaurora.org>,
        Guenter Roeck <groeck@chromium.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Vara Reddy <quic_varar@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        Tanmay Shah <tanmay@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Jessica Zhang
	<quic_jesszhan@quicinc.com>,
        Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=3833;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=25pnk1B4If/6NzuJB7z+hEFzehH0D+VdIKyoqK3RzkI=;
 b=Iaqs/0YMH7/s3P1s6aKktM4fkOaWb9t6E+/1/FyMyGiJRvUoukRz5mPZ4o1g6MrVWNyY1588k
 oIdaXnDap8BB4lK6fzmSPfqv4zMfD4SXdjRJPkBBwc+QaUWJKUEeSAZ
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QD2e65C3TEdrOVQypf6utEh-s9WjKQ1e
X-Proofpoint-ORIG-GUID: QD2e65C3TEdrOVQypf6utEh-s9WjKQ1e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030

From: Yongxing Mou <quic_yongmou@quicinc.com>

Propagate the hpd state changes to dp mst module so that it
can be synchronized with the cable connect/disconnect.

Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 3 files changed, 39 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 97f8228042773f51f23a9d39fc009de0798059d7..80df79a7c2077d49184cdeb7b801bf0699ff4ece 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -26,6 +26,7 @@
 #include "dp_drm.h"
 #include "dp_audio.h"
 #include "dp_debug.h"
+#include "dp_mst_drm.h"
 
 static bool psr_enabled = false;
 module_param(psr_enabled, bool, 0);
@@ -409,6 +410,17 @@ static void msm_dp_display_mst_init(struct msm_dp_display_private *dp)
 	msm_dp->mst_active = true;
 }
 
+static void msm_dp_display_set_mst_mgr_state(struct msm_dp_display_private *dp,
+					     bool state)
+{
+	if (!dp->msm_dp_display.mst_active)
+		return;
+
+	msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, state);
+
+	drm_dbg_dp(dp->drm_dev, "mst_mgr_state: %d\n", state);
+}
+
 static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 {
 	struct drm_connector *connector = dp->msm_dp_display.connector;
@@ -455,6 +467,8 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 		goto end;
 	}
 
+	msm_dp_display_set_mst_mgr_state(dp, true);
+
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
 end:
@@ -521,6 +535,12 @@ static int msm_dp_display_usbpd_configure_cb(struct device *dev)
 static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
+	struct msm_dp *dp_display = &dp->msm_dp_display;
+
+	if (dp_display->mst_active) {
+		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);
+		dp_display->mst_active = false;
+	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 313eb63b9a35cbbb36db2d7d8f0a85e4441f2998..1149af71d01f99ba5326870fa69e30ae081d6101 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -1043,6 +1043,24 @@ msm_dp_mst_add_connector(struct drm_dp_mst_topology_mgr *mgr,
 	return &mst_connector->connector;
 }
 
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state)
+{
+	int rc;
+	struct msm_dp_mst *mst = dp_display->msm_dp_mst;
+
+	if (state)
+		mst->mst_session_hpd_state = state;
+
+	rc = drm_dp_mst_topology_mgr_set_mst(&mst->mst_mgr, state);
+	if (rc < 0) {
+		DRM_ERROR("failed to set topology mgr state to %d. rc %d\n",
+			  state, rc);
+	}
+
+	drm_dbg_dp(dp_display->drm_dev, "dp_mst_display_set_mgr_state state:%d\n", state);
+	return rc;
+}
+
 static const struct drm_dp_mst_topology_cbs msm_dp_mst_drm_cbs = {
 	.add_connector = msm_dp_mst_add_connector,
 };
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index b1adb8a61115d4809107553809206bb2ed3c6c3d..b89913ef7b343d449e0003f56b96df049fa36e89 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -105,5 +105,6 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams,
 		    u32 max_dpcd_transaction_bytes, struct drm_dp_aux *drm_aux);
 
 void msm_dp_mst_display_hpd_irq(struct msm_dp *dp_display);
+int msm_dp_mst_display_set_mgr_state(struct msm_dp *dp_display, bool state);
 
 #endif /* _DP_MST_DRM_H_ */

-- 
2.34.1


