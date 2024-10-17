Return-Path: <linux-arm-msm+bounces-34662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFBD9A17C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 03:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EBED286287
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 01:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 092747E101;
	Thu, 17 Oct 2024 01:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VvwMq7ug"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A822611;
	Thu, 17 Oct 2024 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128099; cv=none; b=PlX2wn9pIP84gE8WteShU8uFqPnLTEntRglpZWCnT73tWdLkZjz+83o5TBiSkO9P22SqBZKhqukCxb2Z0WM1s7bl459oBgV4VwKJQrnjea+127gMyaveto4HnOV2br3FeAIyrTocz7bGrNle9f/ECwovIl1qLIeR//6ar8WB//I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128099; c=relaxed/simple;
	bh=u1Pu54PNPCL7XNIum5pyxxJCkNJtfuelrEJnsmdK3QI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=lzOJ/u8gNFiqdd+lIFVnV63ZoivjPeo//T+03lsTKbJrEv9wv//vgImfLP12VMpmleblgcsW6Pd+wmrW6rcLallhQJaug6GcX1IutRUtDxmPIQsEYIgLGu3GoOSHig2u21BNZy3XWDvckMCtXaiMPY1Sp8xnu/dkXnx5/6nJU5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VvwMq7ug; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GDVUUC016699;
	Thu, 17 Oct 2024 01:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wlCBp7WNkEaSceMKeOgYXqObgq2ohbQi8VvgBY58bvI=; b=VvwMq7ug3bTsiOaV
	NOnKHFImi7DVate5YCxPR+3wEpCHn9MSl9TjohUGaOt9zCse8BhsXiFNE09BmjbO
	NRYK2pCh1sWLdvPvhLqLbX1zYDAcIBqNhLc6pULuTspJIcz+Dh0hBWoEnaBP3Ymy
	mLgYZPpadEHCcktvb2znnbPZqqtK6y3Ma2vEG3KI42uF5pRXmItFowLBxhnxV95y
	FKLVaqpCFBapDQ+BFWQnqe2DuAFsi6nfrXxxZDWoK0fYEBf1a1xMGX5Kz+ZrO/7x
	uG/ixYVkSvIvcmhT/J0XrUIxkt7uwZzQfqzxH3aBc1OAutOt7wUKZIc3/7cvMLyw
	e76++Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a8w6jw6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:20 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LJb1026856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:19 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:19 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:19 -0700
Subject: [PATCH v3 13/23] drm/msm/dpu: Add CWB to msm_display_topology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-13-a33cf9b93835@quicinc.com>
References: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
In-Reply-To: <20241016-concurrent-wb-v3-0-a33cf9b93835@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Simona Vetter <simona@ffwll.ch>,
        Simona Vetter <simona.vetter@ffwll.ch>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-2a633
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=3267;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=u1Pu54PNPCL7XNIum5pyxxJCkNJtfuelrEJnsmdK3QI=;
 b=9ERiP6I1Av0+sASWp9QNSJtbXb4HWlmYpe6X/v8Hub36ORnB11iv9nAiJu7y4W1tThEtZ5DgX
 Uqs5ONXwiecBmwJGJCdCD1XaLGaXHSYs2/XyvQ5xJpT456YjwXYT+t2
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y0DyBORbBBtVW2uBQtlFJZGA5IFF9ZXX
X-Proofpoint-ORIG-GUID: y0DyBORbBBtVW2uBQtlFJZGA5IFF9ZXX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170008

Add the cwb_enabled flag to msm_display topology and adjust the toplogy
to account for concurrent writeback

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 11 ++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
 drivers/gpu/drm/msm/msm_drv.h            |  2 ++
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d53e986eee5467d78aa3b4cc2bc59a954942cdea..5af506a66d5b5cce172e66bfea85b483a8fa1c70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1176,6 +1176,8 @@ static struct msm_display_topology dpu_crtc_get_topology(
 		dpu_encoder_update_topology(drm_enc, &topology, crtc_state->state,
 					    &crtc_state->adjusted_mode);
 
+	topology.cwb_enabled = drm_crtc_in_clone_mode(crtc_state);
+
 	/*
 	 * Datapath topology selection
 	 *
@@ -1187,9 +1189,16 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * 2 LM, 1 INTF (stream merge to support high resolution interfaces)
 	 *
 	 * Add dspps to the reservation requirements if ctm is requested
+	 *
+	 * Only hardcode num_lm to 2 for cases where num_intf == 2 and CWB is not
+	 * enabled. This is because in cases where CWB is enabled, num_intf will
+	 * count both the WB and real-time phys encoders.
+	 *
+	 * For non-DSC CWB usecases, have the num_lm be decided by the
+	 * (mode->hdisplay > MAX_HDISPLAY_SPLIT) check.
 	 */
 
-	if (topology.num_intf == 2)
+	if (topology.num_intf == 2 && !topology.cwb_enabled)
 		topology.num_lm = 2;
 	else if (topology.num_dsc == 2)
 		topology.num_lm = 2;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 96c80cf9f6ad60cef9fb5fda38179b8ef4f5de4a..04df3056d75a799ad4bdc87d6a9c97acdb990323 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -371,8 +371,14 @@ static int _dpu_rm_reserve_ctls(
 	int i = 0, j, num_ctls;
 	bool needs_split_display;
 
-	/* each hw_intf needs its own hw_ctrl to program its control path */
-	num_ctls = top->num_intf;
+	/*
+	 * For non-CWB mode, each hw_intf needs its own hw_ctl to program its
+	 * control path. Hardcode num_ctls to 1 if CWB is enabled
+	 */
+	if (top->cwb_enabled)
+		num_ctls = 1;
+	else
+		num_ctls = top->num_intf;
 
 	needs_split_display = _dpu_rm_needs_split_display(top);
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 2e28a13446366caae48ff6291d5f88db06de645e..34a378cecfe0eef45262592c9f9e8e4234f37a29 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -84,6 +85,7 @@ struct msm_display_topology {
 	u32 num_dspp;
 	u32 num_dsc;
 	bool needs_cdm;
+	bool cwb_enabled;
 };
 
 /* Commit/Event thread specific structure */

-- 
2.34.1


