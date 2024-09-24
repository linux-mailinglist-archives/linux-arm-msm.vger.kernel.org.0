Return-Path: <linux-arm-msm+bounces-32361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B974984E8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Sep 2024 01:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 09F2B281D17
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 23:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C94B18785C;
	Tue, 24 Sep 2024 23:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lMMI+Zmf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60096187350;
	Tue, 24 Sep 2024 23:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727218819; cv=none; b=gsDVdMr/QEFTkPJu52qxiDppvTJw37K7dMcvfeCS6szHKmNRkJGPeJNF/053+MeRJsRntE8pJ0R6CmCx8nZfaSsR7Rs2wvM2p/SQyShTTSsqqoAtR+pU/3YSj4fu8/yTxfiwhoyM4Kk/+lqhvdrbmsiKBwHkKnR3yCTrui/3FsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727218819; c=relaxed/simple;
	bh=5EDvWviU4lGmDlkZJdPYKBAJs6GqlAM58iPTSGoB36Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=H0wu56I6VwUIklFL1XEh5v/whr4Zmh8fp0IpxFWlKtLXExoNlfYVK9UgwzRC1QOqVYAHpzXQ8XWzSxMkZA3DnJeNkULKKjWDtXI+OHZafb/9je4xe54BOY4rRO85gD2ebNGoBiMpFM+8621Z1bqWfk52/DZs6GdO6wXgqmRQvxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lMMI+Zmf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48OIa53T021857;
	Tue, 24 Sep 2024 22:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XWHra3sz4iUtN7WKR36sA+wtDKTYmG3IoLsBbT9syMc=; b=lMMI+ZmfHXaswKN8
	ZAGeAJUKHGwFOMj5juZVZNSJkZaEKwwpNlDDW2MVZUaMRkbtf72UdTLKJd/+yR8d
	3cCXytZziWIM+/iis8qZr7uqt2vTPi92QoypbGnNQ4M5OGrLvczbV3JYwTO4L9Pt
	fmJ6zYjEdLlpb2WrL2uXM/DJapZXx0R3+V/PFl6rt4CiMGnXFTYTxqiMPXeNEASY
	WyXHdRGPbb3gZ0xlz99cZPddBnWKt0vzuJrXhydWPbZfQlGq81kkAgRyPpoMNdtg
	63OYf7jw8+P1R5uPAAAUExciRF4Ek9F6CLcjGSgHe6Y3KRF/LKuNGfNOnYAGZuY7
	vxFC2w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqyj9e3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48OMxvN2007773
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Sep 2024 22:59:57 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 24 Sep 2024 15:59:57 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Tue, 24 Sep 2024 15:59:29 -0700
Subject: [PATCH v2 13/22] drm/msm/dpu: Add CWB to msm_display_topology
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240924-concurrent-wb-v2-13-7849f900e863@quicinc.com>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
In-Reply-To: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        <quic_abhinavk@quicinc.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
CC: <quic_ebharadw@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@chromium.org>,
        =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727218793; l=2859;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=5EDvWviU4lGmDlkZJdPYKBAJs6GqlAM58iPTSGoB36Y=;
 b=t1wLaNKFZIeo8Fb+SSKY9xAhhtX+XK9RD5GoCQLexF2znNxlNoi1dEGU1ngFUsTZxA7jxhgvh
 TJc71sQR1l3Alk+pSUyigZpp2rrIuMgHyMviY8EL9Mli/ppm5GVFy9D
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fEmR-oEqG9Nbb1ND9s2d4iGigJ5kkJmQ
X-Proofpoint-ORIG-GUID: fEmR-oEqG9Nbb1ND9s2d4iGigJ5kkJmQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409240160

Add the cwb_enabled flag to msm_display topology and adjust the toplogy
to account for concurrent writeback

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c |  6 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c   | 10 ++++++++--
 drivers/gpu/drm/msm/msm_drv.h            |  2 ++
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d53e986eee54..a7850bf844db 100644
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
@@ -1189,9 +1191,9 @@ static struct msm_display_topology dpu_crtc_get_topology(
 	 * Add dspps to the reservation requirements if ctm is requested
 	 */
 
-	if (topology.num_intf == 2)
+	if (topology.num_intf == 2 && !topology.cwb_enabled)
 		topology.num_lm = 2;
-	else if (topology.num_dsc == 2)
+	else if (topology.num_dsc == 2 && !topology.cwb_enabled)
 		topology.num_lm = 2;
 	else if (dpu_kms->catalog->caps->has_3d_merge)
 		topology.num_lm = (mode->hdisplay > MAX_HDISPLAY_SPLIT) ? 2 : 1;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 96c80cf9f6ad..04df3056d75a 100644
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
index 0d3adf398bc1..8a2a3705f117 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
  * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
@@ -88,6 +89,7 @@ struct msm_display_topology {
 	u32 num_dspp;
 	u32 num_dsc;
 	bool needs_cdm;
+	bool cwb_enabled;
 };
 
 /* Commit/Event thread specific structure */

-- 
2.34.1


