Return-Path: <linux-arm-msm+bounces-57024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9851AAD2D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 03:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09D4917D671
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 01:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4B9282F5;
	Wed,  7 May 2025 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mD0bk4J6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A924129CEB
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 May 2025 01:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746581943; cv=none; b=Jnj8M9ASbuTQMFmPlnrwM4jyy34mEzvEyiWPmieTiCFPoOJR1ezAcp1DEU6FufTQz2wugcmCjdjoH4l8g3/Ay7UA3g2UlRN0qRJ5HPZmk7ipsGd5DT14fI1RyySYF3FK5L9z102bug3ymzrR+7f7vuxTtF3ITX9lXHyt4obdh8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746581943; c=relaxed/simple;
	bh=i/ku+CPf0IQ7tP94Th2ABAub87lMFc774SfyOIKlD04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jT12/rCSsDkgWnd8RFWq/tuCNxuiGOxd0lnDpt0p8HGnI4EiTkqYP717R/ZKS91hsR9Ljy2CSWc/VsKHlUzauJ4fdVgBtHAogsNVO6c3JWnFK4omxxQLduHtRxSRcfauD4RcKf5pM2mL7EbYGnHWh/U54p0Zizt4pu8CkPsNjH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mD0bk4J6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471HhTv023100
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 May 2025 01:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xJb4l81gLxVtbnO33WMQZY
	0Ply/PgwMVRCSnIJyQAk0=; b=mD0bk4J6M3fBthNER+0vsgQ7yeERnBPITKpnxc
	LX8BD792olZcRMpkLlChCNVe0oS3qNrb4gjSlFp22wexk4ow4R3RWZ7EZC2Jr1ln
	+WV5Qd77pte7Sm2h4i+8uNM5RK/Im+xjVxJmfUbtZG5Ld/jgXRI5kuiPHG5AXF2Y
	RU4G44+VLqVbnCzI99xhV9mCsp9m5jvXk/nA3EouabXawHZBA1h5top/TtnUCFmZ
	8cve+S0SYSDDw/lNAx57nSM66iFMbhQpLsZDumU1meWztNgn2AApaBdfAsWRLdfS
	vtsrI4W9OQtTO6bZdj4AuK+7uIyPWQyfvOpAGHlEY/YyHtUg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuv3gm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 May 2025 01:39:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-30870e7e4fcso360384a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 18:39:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746581939; x=1747186739;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJb4l81gLxVtbnO33WMQZY0Ply/PgwMVRCSnIJyQAk0=;
        b=j0Ru0HVVt6lMW3QQ7ubHiDiThbid7pXZM7xKHVAUiQsyc/DJWKzegS7i95P8UfvyBY
         FTRlCnKtnMcEzy9/n9IVp9JH+Fr6f7p9Yu3+YIdsA86rjfFiXEZMciaEyequ91/Vu+dB
         nIutyKPJZMnGoR0+LE3dai5GRP7pJDiZcSBWrpzJP3QkLmWZJI3Y/jJfF/TayWTxdZ3j
         k5R6PDGPaHE/tOl5TiplBJ8iJ7b2f5KEZi1g8y1cOPSBz3bCi0gkkZnJc1/2y45q57h8
         q1/3kOgDkfQBugoWq5Podglyjq4iz5F29mxnAfvcOxTX6AKbiicQXe3O3Su5iPt5ZPdf
         bS+g==
X-Forwarded-Encrypted: i=1; AJvYcCXW17K6bg2giGafa7iGIM3YlTteIs5PGptrXlU8peQjtlS7yjlyNuVGHtwKqGnGesefwr57EdpNVtpmZHhe@vger.kernel.org
X-Gm-Message-State: AOJu0YzlaPuGi2HiFvr2dks8+YN18/RBMNgUym+nToy1kZr0pnL39SIR
	SK0VcyWC36SbVKGA3V3ekxN68cQKVb7F2OlLX308pNf5D8+yEjiRS3nlyjHs8oJYAE7u9tUQ6hQ
	ZcImy1CoqjBsemPa845m1YuHS1p/ZfSLl1Vs+g/ocDXFIG5x5uuoCVg54lq+1Fw2h
X-Gm-Gg: ASbGncuLCcq9kWw7aArspkAyzS9TyJLFMC5CcTZI10oklGSQXKIAyVy6HlwK8dmYPVL
	lVO6AorqCZEV7fzLbX58wcd/sqDOrtEVEbJ5pp8+vWOrOL0Zfb1/edcjwJNbPF75zRQP6Hdld3A
	B2mwqrA6U5Cnc3zyGDf2WMbMWviiGfjADz5tpbRVZB2OqJz/Buwk18uviofSPLsqf+gWSw2EJOL
	HWn6/a6/+pChBTqi4o5eB4W2v1I2PRhUThOU9pHk1aoYJQOz0QuE5Nlyhg9ttIc97wLiySpYs0Z
	KR7TSnleOz6ns/95VDIwPMndBSr/m0yAiaHBiQjpv/gbxIc0azppnTqDVFW0st6ubPIeVWVg
X-Received: by 2002:a17:90b:3882:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-30aa8829f58mr2741419a91.17.1746581938794;
        Tue, 06 May 2025 18:38:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERRWBCq/3Fv/iADq8toXTnhp9BQEp/zTraf2or0O+po9BaMVmPLO7tXKsIt+rjdY0Vv6vB1w==
X-Received: by 2002:a17:90b:3882:b0:2fa:1d9f:c80 with SMTP id 98e67ed59e1d1-30aa8829f58mr2741387a91.17.1746581938310;
        Tue, 06 May 2025 18:38:58 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30aaec0599asm591417a91.25.2025.05.06.18.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 18:38:57 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Tue, 06 May 2025 18:38:39 -0700
Subject: [PATCH v2] drm/msm/dpu: Filter modes based on adjusted mode clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-filter-modes-v2-1-c20a0b7aa241@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJ65GmgC/x3MTQ5AMBBA4avIrDVpigpXEQs/UyZBZUaESO+uL
 L/Few8IMqFAnTzAeJKQ3yJMmsAwd9uEisZoMNoUutBWOVoOZLX6EUUNVvd5lpnSVg5isjM6uv5
 d00bPJIfn+7uHEF70eMc+bQAAAA==
X-Change-ID: 20250506-filter-modes-c60b4332769f
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746581937; l=5037;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=i/ku+CPf0IQ7tP94Th2ABAub87lMFc774SfyOIKlD04=;
 b=wIuGhfFQ2fzfVwV1xLYq/D2FFPES8xC9/NhLPw75hk05s/dCDokiQPz/QodpvpoMIeWjsjzTv
 ruLBZwL8CfWANLUzmagYEerbwwMK3nnOAVcCFwo+irtuEuR5Sp+i6SL
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681ab9b4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=cJ-axxLsUDFOzgZI02IA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 0C3VhwhUf3C-e1r_tdf_7m7ul82BeWRm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDAxMiBTYWx0ZWRfX8qaiOg0dPy1+
 axcxhGgFzJhkPBu4K+ODJXTDsMI16Q9S7zTzfndirHTh0M8qKEjqc/fcbsJMD5ntKckkkkfqP67
 spI4fy51h2FpU3Z6Gve2lUe23Ll0i1WcjptrQnll4KXprJc4zknCfNZq8QnPbejNqG1hQFvBf5J
 TDzaG+h6UdQA5yq2yMvK3K2KQkxSUlzBsYQAKHHFU8Z0PzFkBlc2ldO3TAaz7x/p3/fHcYFMsji
 P+qSaRI9TuZ/oaO2d/1pwPJDtYb+BRAPoKWIJb2F6Kmc8fs8l9tqD93ETlLkoO+Ag/8CMgpJ/vU
 FDmgvVKA778GA+epJpmFfVSftb2gv8L2Jfm+wFMeSQyt2DF0o0xQkiYJcoOia1fYcT4sfKCLsrq
 tfnZByaiVIJtykuQjGMrhEoqXlpgmJ0xssMUwW9CAbxMdC4igPICMGvy3KDUrlgwD7v5x5wo
X-Proofpoint-ORIG-GUID: 0C3VhwhUf3C-e1r_tdf_7m7ul82BeWRm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_01,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1011 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505070012

Filter out modes that have a clock rate greater than the max core clock
rate when adjusted for the perf clock factor

This is especially important for chipsets such as QCS615 that have lower
limits for the MDP max core clock.

Since the core CRTC clock is at least the mode clock (adjusted for the
perf clock factor) [1], the modes supported by the driver should be less
than the max core clock rate.

[1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
Changes in v2:
- *crtc_clock -> *mode_clock (Dmitry)
- Changed adjusted_mode_clk check to use multiplication (Dmitry)
- Switch from quic_* email to OSS email
- Link to v1: https://lore.kernel.org/lkml/20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com/
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 35 ++++++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++
 3 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 0fb5789c60d0..13cc658065c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -31,6 +31,26 @@ enum dpu_perf_mode {
 	DPU_PERF_MODE_MAX
 };
 
+/**
+ * dpu_core_perf_adjusted_mode_clk - Adjust given mode clock rate according to
+ *   the perf clock factor.
+ * @crtc_clk_rate - Unadjusted mode clock rate
+ * @perf_cfg: performance configuration
+ */
+u64 dpu_core_perf_adjusted_mode_clk(u64 mode_clk_rate,
+				    const struct dpu_perf_cfg *perf_cfg)
+{
+	u32 clk_factor;
+
+	clk_factor = perf_cfg->clk_inefficiency_factor;
+	if (clk_factor) {
+		mode_clk_rate *= clk_factor;
+		do_div(mode_clk_rate, 100);
+	}
+
+	return mode_clk_rate;
+}
+
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
  * @perf_cfg: performance configuration
@@ -75,28 +95,21 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 	struct drm_plane *plane;
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
-	u64 crtc_clk;
-	u32 clk_factor;
+	u64 mode_clk;
 
 	mode = &state->adjusted_mode;
 
-	crtc_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
+	mode_clk = (u64)mode->vtotal * mode->hdisplay * drm_mode_vrefresh(mode);
 
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		pstate = to_dpu_plane_state(plane->state);
 		if (!pstate)
 			continue;
 
-		crtc_clk = max(pstate->plane_clk, crtc_clk);
-	}
-
-	clk_factor = perf_cfg->clk_inefficiency_factor;
-	if (clk_factor) {
-		crtc_clk *= clk_factor;
-		do_div(crtc_clk, 100);
+		mode_clk = max(pstate->plane_clk, mode_clk);
 	}
 
-	return crtc_clk;
+	return dpu_core_perf_adjusted_mode_clk(mode_clk, perf_cfg);
 }
 
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index d2f21d34e501..3740bc97422c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -54,6 +54,9 @@ struct dpu_core_perf {
 	u32 fix_core_ab_vote;
 };
 
+u64 dpu_core_perf_adjusted_mode_clk(u64 clk_rate,
+				    const struct dpu_perf_cfg *perf_cfg);
+
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0714936d8835..5e3c34fed63b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1501,6 +1501,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 						const struct drm_display_mode *mode)
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	u64 adjusted_mode_clk;
 
 	/* if there is no 3d_mux block we cannot merge LMs so we cannot
 	 * split the large layer into 2 LMs, filter out such modes
@@ -1508,6 +1509,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
 	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
 		return MODE_BAD_HVALUE;
+
+	adjusted_mode_clk = dpu_core_perf_adjusted_mode_clk(mode->clock,
+							    dpu_kms->perf.perf_cfg);
+
+	/*
+	 * The given mode, adjusted for the perf clock factor, should not exceed
+	 * the max core clock rate
+	 */
+	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
+		return MODE_CLOCK_HIGH;
+
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */

---
base-commit: db76003ade5953d4a83c2bdc6e15c2d1c33e7350
change-id: 20250506-filter-modes-c60b4332769f

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>


