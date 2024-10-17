Return-Path: <linux-arm-msm+bounces-34650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 602E59A179E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 03:21:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16BE92877F6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 01:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C451F94D;
	Thu, 17 Oct 2024 01:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KW4gVTJt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE2814A91;
	Thu, 17 Oct 2024 01:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729128097; cv=none; b=tgQwZrnfB3+lhPu32S8PrZvqJtlu4c7x+wlQee3hbcuxdqaav99mIeFtRNbpAa8ywJjMPSQ6xVq4Psa0ByV9YAdzQC2RvA82iRqh3t69zbisGf6GuhHmhbzFShwxLW9RjKa0GeD9K3BkpH/RQd0PGdCJKAqmzxuJfm8yK5KwGqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729128097; c=relaxed/simple;
	bh=A+iEWtTZgEkwjMNne618wTQwRFV+6MYli1Q+6JG4/yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Ms8oXYcSCupojVTQl1AlPZlhQJQPfEho7mB+rDbxo3G/1B/16rBYXeTrHiMdwhA/b3CJnPYgTmgYMtLSKwMrcHB2HXFhQtoCQm7zBGXOTwSpj0bMNwMPOKY8yi/XYv/QmyxUo9StZJbhMDNbvRbs+/mHieNP+kcPN/L69nZtiqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KW4gVTJt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49GHcYgU014269;
	Thu, 17 Oct 2024 01:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z64fAtrwpjTZDyr+rO0HaTBQEbKTCGUqmnBGstJf47Q=; b=KW4gVTJtAbpUCsrO
	FHhFoG36titEEfo0zuerpnh7ccHXfgiBk0+WaDO+o8mBBOawf+Q5vEXwYg5U2mwC
	Cn5EHKYXd/XMTBUrQhT5QVAZOMkV9t4e66A8uCImHn7lN5vgSPIxpYEyRE96Cxv2
	kzv2Tq+MCxdHuZ335yiOvSHQKtn8ixW2+Iuu8hZONFI5+22Ei2YcwSEwXAoE3rN4
	UYF+a5AG+9DPrfQ/XJMcXaVDlaUdwOaJuNLQcuYorGdtzW4ZMPJCMJX6thET6B5v
	0PSxrNvXPPrZomcpLgawTTWDpTv7+u6VX1ERhNZfXSsXX0U0jboZF5O7rNH3BJmE
	xPkGUQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a79hb3mw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:21 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49H1LJXm022779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 01:21:19 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Oct 2024 18:21:19 -0700
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Wed, 16 Oct 2024 18:21:20 -0700
Subject: [PATCH v3 14/23] drm/msm/dpu: Require modeset if clone mode status
 changes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241016-concurrent-wb-v3-14-a33cf9b93835@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729128075; l=2139;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=A+iEWtTZgEkwjMNne618wTQwRFV+6MYli1Q+6JG4/yc=;
 b=Q8TwJ0Y/py/eG/OJpHFWH0Sb6AxPEQ0RWaDGcPomO+2zFDc5heJETdvzFFC3+i3sq56emS81e
 +i82Su2AL0GBbLoTN3Qqnaw8+92YiD+k397qk5wMO0LEPT2ErzUIU3A
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5xcZasuq2UpsOqb7Qi1zan1IoBIdOJVr
X-Proofpoint-ORIG-GUID: 5xcZasuq2UpsOqb7Qi1zan1IoBIdOJVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410170008

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
index 5af506a66d5b5cce172e66bfea85b483a8fa1c70..118ef6c14d0c9207329b9fdbf590e392fcb87ecd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1275,6 +1275,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 {
 	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
 									  crtc);
+	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state,
+									      crtc);
 	struct dpu_crtc *dpu_crtc = to_dpu_crtc(crtc);
 	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc_state);
 
@@ -1286,6 +1288,8 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 	int rc = 0;
 
 	bool needs_dirtyfb = dpu_crtc_needs_dirtyfb(crtc_state);
+	bool clone_mode_enabled = drm_crtc_in_clone_mode(old_crtc_state);
+	bool clone_mode_requested = drm_crtc_in_clone_mode(crtc_state);
 
 	/* there might be cases where encoder needs a modeset too */
 	drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
@@ -1293,6 +1297,10 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
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


