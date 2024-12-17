Return-Path: <linux-arm-msm+bounces-42438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C34ED9F3F63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 01:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8558188C6D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 00:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4B616F271;
	Tue, 17 Dec 2024 00:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bUTLUZxD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E306D8528E;
	Tue, 17 Dec 2024 00:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734396227; cv=none; b=NtOrHTPutXX02zV+DclnaXMZ5zXaZUgUr8Yl03GJUSOSqm/JYuRx4ICyr35Nq9k8d21pyz5hIXoOaEKkWt09XSmSIyGgCIy3zALwuqrKcCaiMNmV8pk+ArVB1m4Gcx1+ZPtX/xxllO3/jJyPw5eszNFc409tzMbLQVeOJg+EOHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734396227; c=relaxed/simple;
	bh=qGOxkbI1KFjhsiTNoBy2QHmkbooufA5M9daR7iTHxN4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=t3KQZQfh991l7ztk0KFPkD77ekeqCHcxSTaS+gxv5X+XYvSVycuYyhGxEgWwEhI4ZV1+skCIR6Mhfcmg0VHUlXoZXuBrJXdu/hLuMqZloWmoKUsBd2q4aO31Q1ckX4ODozMA/zTS8PAMNRlsJrx4WnXeM0/CFWwempF4dh7k0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bUTLUZxD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGIbZtS009488;
	Tue, 17 Dec 2024 00:43:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pnZdxsV/h1uj/OuruuCdmDnsiT0SYCxifJzGLR+w4ao=; b=bUTLUZxDKzoDSHep
	kxuPWnlV6e/LihtcIF30gXYVpbbX7TxjaKVa3iEEwUb2UTtnWyxGH5+Z8bH5ZWCb
	MQQl3ki6blXn+C70MeHO45HhXJshpLbKExjgsx6Ts683F9O/anZYlKZ/xh9DIwdF
	Ovi3gJ8Kd4NLLrjeyO3kF28p7AF77HBjgfpvw6+J7XkvLQ7IcLiOAd+o9WcCtPVm
	Dv9ureDE+R51ApcuU5oor889e9PtasiVWYUvxUFHW+NKqQCspughFE4yA7diIHas
	bS01tC4jm3btDARedrKLgmDag1x0OeZVFg1zeaaLzBEzKSG40mLb9al3ucal0Ufl
	RJk0lQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jsn9gph9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH0hUUu026915
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 00:43:30 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 16:43:29 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Mon, 16 Dec 2024 16:43:27 -0800
Subject: [PATCH v4 16/25] drm/msm/dpu: Require modeset if clone mode status
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241216-concurrent-wb-v4-16-fe220297a7f0@quicinc.com>
References: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
In-Reply-To: <20241216-concurrent-wb-v4-0-fe220297a7f0@quicinc.com>
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
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734396205; l=2139;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=qGOxkbI1KFjhsiTNoBy2QHmkbooufA5M9daR7iTHxN4=;
 b=GU3ZJXOXFU7dgHUIapBnhmAbleZuz0AR/Wxm+HhtCjwYliGP944W3mCe1woVm75r0HHcrZyXk
 97LBAiy2uw6DYf5PXO2szMzfIJoUnjDJJB12Ub7FcHlvYrGcB90J9t1
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HSy3YGWPfXzLn_mMBS4wjcEIIb7QXzUY
X-Proofpoint-ORIG-GUID: HSy3YGWPfXzLn_mMBS4wjcEIIb7QXzUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170004

If the clone mode enabled status is changing, a modeset needs to happen
so that the resources can be reassigned

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---

NOTE: As noted by Sima in the v1 [1], the DPU driver doesn't handle
crtc_state->mode_changed correctly. However, fixing this is out of the
scope of this series.

We will post a separate series addressing these issues across the driver

[1] https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index b063c8fe4c0594772d84401fa56c9c21afc0ad18..9bb920d28bae2706b3892c167fe2bec3fd8857f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1297,6 +1297,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
+	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
+									      crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
 
@@ -1308,6 +1310,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	int rc = 0;
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
+	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
+	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc_state);
 
 	/* there might be cases where encoder needs a modeset too */
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
@@ -1315,6 +1319,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			crtc_state->mode_changed = true;
 	}
 
+	if ((clone_mode_requested && !clone_mode_enabled) ||
+	    (!clone_mode_requested && clone_mode_enabled))
+		crtc_state->mode_changed = true;
+
 	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
 		rc = dpu_crtc_assign_resources(crtc, crtc_state);
 		if (rc < 0)

-- 
2.34.1


