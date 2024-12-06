Return-Path: <linux-arm-msm+bounces-40690-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1E69E6627
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 05:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA0ED162F4F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 04:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BC461FF605;
	Fri,  6 Dec 2024 04:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mNseAsFw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF11FC0F5;
	Fri,  6 Dec 2024 04:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733459603; cv=none; b=q+wHrGuAgtAqjT+Kfo1b4p43azor4qSYMm9a8ZyzaGBeQEiYDJQJNr+nnZOVrzkVC8KVQfuvkdwQtgQ/7Ggxm6t258u621+Qlne2GPe6ZHSjLOOPZoJ9SI0obxNjdyOiiyQOYcZqAgYd7rgeUuaqT1QD9chON7mBLR0zYhEAujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733459603; c=relaxed/simple;
	bh=adeQ4SwxCOFiCjE+4swzHVNrUwZUwTYnsaIrhteH3KY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=JvFsx9fFAv3MypCUbtyaXhZCffP6EeG99vC2+GaFyH4eeabNhjKYv06ledeR+eJCEtMcw0OYtIwRUrGHtqcgaHTOyNtqjZStVlzpyZoYCI11m/b69PR1l5WA1x6XdKprBsW/nYAJ4XtoUmYjP1oswrgYGvzCirLkxm4OtOh/tPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mNseAsFw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HaH6o005904;
	Fri, 6 Dec 2024 04:32:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vN9IFPaUGvkqqMhPZUfXVUlj7an0MMvhv3OZ8d/Hzis=; b=mNseAsFwmPD7fwp3
	eCRnGYPWkuTOsJbJ+pgtCmJCo0RTesaloreMiqzc0/8iKyrgjH1/47B0VT9IAH+l
	ABEEeQR1weTTEu938W8VmQjdpuTYqHzIMw6fNzzirkb9UdHt7yKDeoR5UKN8YPi2
	kPlTEGp3C9SR0jZnPDK9Cjv8Kugz7/lfa7hCJvsHTGTsLa4d5bdTLbu1f52zPqkx
	NXB6jMQyw/eO3V2redw1zDfAQlGlrrk2p6axuSYKVMFb718StdEF83lpipjbX49d
	/A1xIyno2mmud/xfHPCJAqRy6hOFAKnTOhB/+AD6i3QBKOwOuoWJpUacW5jFH/Jd
	o1ArMw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ayemc65m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 04:32:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B64Wi3e007206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 04:32:44 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 5 Dec 2024 20:32:43 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 5 Dec 2024 20:32:06 -0800
Subject: [PATCH 35/45] drm/msm/dp: add a mst session mutex to protect
 bridge ops
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241205-dp_mst-v1-35-f8618d42a99a@quicinc.com>
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
	<quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733459543; l=4600;
 i=quic_abhinavk@quicinc.com; s=20240509; h=from:subject:message-id;
 bh=adeQ4SwxCOFiCjE+4swzHVNrUwZUwTYnsaIrhteH3KY=;
 b=l5Ts5OnJk2r2mZmca7fF6KlBgWw74jGZRcCodBcCqI00kjv8vzCqnHmEnKZF0wxGT+/8BVg8G
 /nkJw4uPNDhAGzLSgYlXN8CHFLkoJN2PW47bqXuID45IkooJK5mjOMZ
X-Developer-Key: i=quic_abhinavk@quicinc.com; a=ed25519;
 pk=SD3D8dOKDDh6BoX3jEYjsHrTFwuIK8+o0cLPgQok9ys=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rJh0VMpNW6Y2FPSTNgeb01ceKN2UkhB4
X-Proofpoint-ORIG-GUID: rJh0VMpNW6Y2FPSTNgeb01ceKN2UkhB4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxlogscore=997 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060030

To protect against concurrent access of the dp mst bridges
introduce a session mutex.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_mst_drm.c | 20 ++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_mst_drm.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.c b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
index 15c61fd37c418889074222c0f576778adadf51c9..313eb63b9a35cbbb36db2d7d8f0a85e4441f2998 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.c
@@ -344,6 +344,7 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
 	struct msm_dp_mst_bridge *bridge;
 	struct msm_dp *dp;
 	struct msm_dp_mst_bridge_state *msm_dp_bridge_state;
+	struct msm_dp_mst *dp_mst;
 
 	if (!drm_bridge) {
 		DRM_ERROR("Invalid params\n");
@@ -353,6 +354,7 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
 	bridge = to_msm_dp_mst_bridge(drm_bridge);
 	msm_dp_bridge_state = to_msm_dp_mst_bridge_state(bridge);
 	dp = bridge->display;
+	dp_mst = dp->msm_dp_mst;
 
 	/* to cover cases of bridge_disable/bridge_enable without modeset */
 	bridge->connector = msm_dp_bridge_state->connector;
@@ -363,12 +365,14 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
 		return;
 	}
 
+	mutex_lock(&dp_mst->mst_lock);
 	msm_dp_display_atomic_prepare(dp);
 
 	rc = _msm_dp_mst_bridge_pre_enable_part1(bridge, old_bridge_state);
 	if (rc) {
 		DRM_ERROR("[%d] DP display pre-enable failed, rc=%d\n", bridge->id, rc);
 		msm_dp_display_unprepare(dp);
+		mutex_unlock(&dp_mst->mst_lock);
 		return;
 	}
 
@@ -381,6 +385,8 @@ static void msm_dp_mst_bridge_atomic_pre_enable(struct drm_bridge *drm_bridge,
 		   drm_mode_vrefresh(&bridge->drm_mode),
 		   bridge->vcpi, bridge->start_slot,
 		   bridge->start_slot + bridge->num_slots);
+
+	mutex_unlock(&dp_mst->mst_lock);
 }
 
 static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
@@ -388,6 +394,7 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 {
 	struct msm_dp_mst_bridge *bridge;
 	struct msm_dp *dp;
+	struct msm_dp_mst *mst;
 
 	if (!drm_bridge) {
 		DRM_ERROR("Invalid params\n");
@@ -401,6 +408,9 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 	}
 
 	dp = bridge->display;
+	mst = dp->msm_dp_mst;
+
+	mutex_lock(&mst->mst_lock);
 
 	_msm_dp_mst_bridge_pre_disable_part1(bridge, old_bridge_state);
 
@@ -410,6 +420,8 @@ static void msm_dp_mst_bridge_atomic_disable(struct drm_bridge *drm_bridge,
 
 	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d disable complete\n", bridge->id,
 		   DP_MST_CONN_ID(bridge));
+
+	mutex_unlock(&mst->mst_lock);
 }
 
 static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
@@ -418,6 +430,7 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	int conn = 0;
 	struct msm_dp_mst_bridge *bridge;
 	struct msm_dp *dp;
+	struct msm_dp_mst *mst;
 
 	if (!drm_bridge) {
 		DRM_ERROR("Invalid params\n");
@@ -433,6 +446,9 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 	conn = DP_MST_CONN_ID(bridge);
 
 	dp = bridge->display;
+	mst = dp->msm_dp_mst;
+
+	mutex_lock(&mst->mst_lock);
 
 	msm_dp_display_atomic_post_disable_helper(dp, bridge->msm_dp_panel);
 
@@ -444,6 +460,8 @@ static void msm_dp_mst_bridge_atomic_post_disable(struct drm_bridge *drm_bridge,
 
 	drm_dbg_dp(dp->drm_dev, "mst bridge:%d conn:%d post disable complete\n",
 		   bridge->id, conn);
+
+	mutex_unlock(&mst->mst_lock);
 }
 
 static void msm_dp_mst_bridge_mode_set(struct drm_bridge *drm_bridge,
@@ -1072,6 +1090,8 @@ int msm_dp_mst_init(struct msm_dp *dp_display, u32 max_streams, u32 max_dpcd_tra
 
 	dp_display->msm_dp_mst = msm_dp_mst;
 
+	mutex_init(&msm_dp_mst->mst_lock);
+
 	msm_dp_mst->mst_initialized = true;
 
 	drm_dbg_dp(dp_display->drm_dev, "dp drm mst topology manager init completed\n");
diff --git a/drivers/gpu/drm/msm/dp/dp_mst_drm.h b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
index 5fe5dc7596086467e9a3b3d7d04a665853fbb3d7..b1adb8a61115d4809107553809206bb2ed3c6c3d 100644
--- a/drivers/gpu/drm/msm/dp/dp_mst_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_mst_drm.h
@@ -80,6 +80,7 @@ struct msm_dp_mst {
 	struct drm_dp_aux *dp_aux;
 	bool mst_session_hpd_state;
 	u32 max_streams;
+	struct mutex mst_lock;
 };
 
 struct msm_dp_mst_connector {

-- 
2.34.1


