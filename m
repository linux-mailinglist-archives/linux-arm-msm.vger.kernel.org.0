Return-Path: <linux-arm-msm+bounces-44481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E68A06911
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 23:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C9717A133B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 22:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D012046A3;
	Wed,  8 Jan 2025 22:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CqhFV45r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5F1F0E35;
	Wed,  8 Jan 2025 22:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736377100; cv=none; b=qNJQw/maOdeS2U4ZeIinHJxB/LTS6wLBqwxyO/BRw1Q0s8vwr3NBz39UKH63OKHBeZzcoQTU76zUpNEUUP3fmw3vRlPkLX6Oacs7MUDEATMpPvI38ilQ4i2aEU2Ziwy2a6Jf5aqzxDZSzSy0JjmFKojo1mr3/16izkQObGLbLs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736377100; c=relaxed/simple;
	bh=wNWVT0cfQzdhEDlvQXirnQRurgd6u+2iA+4aAhzXJnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=XiPWLfaLx/IY9E8if1tbyAXio8Ueap0Y7C17vEVXHksu/oN79iUCzh3SddUhEE1pVLYoTBl8M7L0JGqQH0jxZBIxDUzhe1cRTSO/sUBJdkiW+haEWR3nO+1/MsaaaSF9332q55AWio6ncASxK49Z9hORaQ4sTCDjWXddQT4HRl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CqhFV45r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508IgkB9007921;
	Wed, 8 Jan 2025 22:58:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3TlaTznryEMgl/e51rGTSU
	L61D8KspVAr3QwF8e2fuM=; b=CqhFV45rd/2ypnsJDlRzu3KFubYgAij511p+s/
	/dMySmqLidS7qfVAFCMUG6mHSCiiC8ZV7u3Y0k9S3M9BHjvWkNHqfncwJ3awZG7w
	5o3B6Sn8Mb06J63/KEiOOcSqRpNLpUY1uPYf2u97p+f2XQ1222cwsKF8yvdl+jJ9
	nrSrDYXYTg7Evod0MZmtisYx5FKKwhYrlxzRDHTATMF2dEjZ3JEZSorWlUN4Dd5M
	VgHoVBQmsAgjRzf/VceYU+8lKyQmdldRn64CuZT4jBAPNHlhDsp/A6ZfXob5rwER
	qx2N+u7SdjrYobVuSKITx6rfWJ4P2Rsl0vQIHnkLsG+4EmAw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441xvnrgnq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 22:58:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508MwAvj020588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 22:58:10 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 14:58:09 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 8 Jan 2025 14:57:51 -0800
Subject: [PATCH] drm/msm/dpu: Force disabling commits to take non-async
 path
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-async-disable-fix-v1-1-3f93eb600a3a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAO4Cf2cC/x2MSQqAMAwAvyI5G2gEwfoV8dAlakCqNCBK8e8Wj
 zMwU0A5CyuMTYHMl6gcqQK1DYTNpZVRYmXoTNcbMgM6fVLAKOr8zrjIjSGQt45i78lC7c7MVf/
 PaX7fD7ZmrNNjAAAA
X-Change-ID: 20250108-async-disable-fix-cc1b9a1d5b19
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@chromium.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736377089; l=2231;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=wNWVT0cfQzdhEDlvQXirnQRurgd6u+2iA+4aAhzXJnA=;
 b=oVMvxd2Z58q4x6jm9Q68L98cdBRpjND8pG0J6A5KfrqkGU2B3a6/8uzScaVWZAJL9dRVIWRDq
 CoPFekIChfRB8U0rxkit9uHUI9xGLU0v3ohfsR2DBvuPIgl8d29RR4F
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7CsEzK5gyHo5gcFQUhRHTeDaxgN4_lEQ
X-Proofpoint-ORIG-GUID: 7CsEzK5gyHo5gcFQUhRHTeDaxgN4_lEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 mlxlogscore=703 priorityscore=1501 spamscore=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080188

Force commit that are disabling a plane in the async_crtc to take the
non-async commit tail path.

In cases where there are two consecutive async cursor updates (one
regular non-NULL update followed by a disabling NULL FB update), it is
possible for the second NULL update to not be queued (due to the
pending_crtc_mask check) or otherwise not be run before the cursor FB is
deallocated by drm_atomic_helper_cleanup_planes(). This would cause a
context fault since the hardware would try to fetch the old plane state
with the stale FB address.

Avoid this issue by forcing cursor updates that will disable the cursor
plane to be blocking commits. This will ensure that hardware clears and
stops fetching the FB source address before the driver deallocates the FB

Fixes: 2d99ced787e3 ("drm/msm: async commit support")
Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/msm_atomic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
index 9c45d641b5212c11078ab38c13a519663d85e10a..ddc74c68148c643d34ca631dd28d4cdc2b8c7dc0 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -142,6 +142,7 @@ static bool can_do_async(struct drm_atomic_state *state,
 	struct drm_connector_state *connector_state;
 	struct drm_connector *connector;
 	struct drm_crtc_state *crtc_state;
+	struct drm_plane_state *plane_state;
 	struct drm_crtc *crtc;
 	int i, num_crtcs = 0;
 
@@ -162,6 +163,18 @@ static bool can_do_async(struct drm_atomic_state *state,
 		*async_crtc = crtc;
 	}
 
+	/*
+	 * Force a blocking commit if the cursor is being disabled. This is to
+	 * ensure that the registers are cleared and hardware doesn't try to
+	 * fetch from a stale address.
+	 */
+	if (*async_crtc) {
+		plane_state = drm_atomic_get_new_plane_state(state,
+							     (*async_crtc)->cursor);
+		if (plane_state && !plane_state->fb)
+			return false;
+	}
+
 	return true;
 }
 

---
base-commit: 866e43b945bf98f8e807dfa45eca92f931f3a032
change-id: 20250108-async-disable-fix-cc1b9a1d5b19

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


