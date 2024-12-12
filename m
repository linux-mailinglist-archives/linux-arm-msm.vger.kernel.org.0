Return-Path: <linux-arm-msm+bounces-41842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE0A9EFC19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 20:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E1EB818845A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 19:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B2B193084;
	Thu, 12 Dec 2024 19:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SPODvFpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51C618FDC9;
	Thu, 12 Dec 2024 19:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734030739; cv=none; b=G2qecStrtyVXAy9GED7g9bwyTA1vT+e1W0yWSEnzIIHTALsJVN9bgOU4DJ0ve0ADctoZDi5gQAb9juSH2s14VDjOBlfU+4Uw/+BuCAwNXDXyigD3X3vAtqKc/rXpCEUFtaYdiu5ezD9hEXc8cncIDcEzKs8WCw+bvu1Wf3K3aek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734030739; c=relaxed/simple;
	bh=EcbOV0s5NkPGBlJ6bf2+qtaCaWHaRvTPaID4wWfUs38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=IELFQbKp67GcS+6/skIAikeKriXeKydwbCw93EnVrT3nMl2alsrrJkTiJwAzWTI4+OGd/2OKOt0Ja6WAnvn4agPSZODWFstZD6jZcYofS21tDMPp17jNbtGoiW5sDvBIacF8hMzZP/0+Kh2zCorVubUPkJpGE39cH6OPpTFVWR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SPODvFpf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCH1Cde032195;
	Thu, 12 Dec 2024 19:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IZJGZji0n5Hg7/QDH3Jah+
	hYEpDhXrfXmcIulQaQNJk=; b=SPODvFpflXm8BisM8oIA9kNmLOzp7rYt90D/Be
	4ZoD1pTlBKlvNeVtH7npKu+d0LZKBOafAW4+rndnJ/OSjzeRugnIiEkyLu3xNrTR
	H8pS9M8r2gQuO1fGj9Jd7IO2mo/MVBapXS1GF54Iv8Pf6knFbmCJIlcQPqENNxOv
	qn58gCJEWsB39kk3CTvrY5QRNYJS3GT4v6ZUnzcNcT7bBsNcIyDQWK1rEvKR3WCE
	BPcPaVZBxBsvVlYKW/ZoqqN/4xIXDJSGSDeSgTUe+b4rcN1wDj2kiTuV8CqoUsTt
	L6cbXYLyKpZmEnLMBE8x5rttnW10x6NPoth/3BvKdC9YkW0A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f6tfd8d2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 19:12:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCJC9xR006023
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 19:12:09 GMT
Received: from jesszhan-linux.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 11:12:09 -0800
From: Jessica Zhang <quic_jesszhan@quicinc.com>
Date: Thu, 12 Dec 2024 11:11:54 -0800
Subject: [PATCH] drm/msm/dpu: Filter modes based on adjusted mode clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAHk1W2cC/x3MSQqAMAxA0atI1gZscL6KuNCaanCotCKC9O4Wl
 2/x/wuenbCHNnnB8S1e7BGh0gT0Mhwzo0zRQBnlihShke1ih7udGPVm9Yq1HomrsjFZMULsTsd
 Gnv/Z9SF8MxBgNmMAAAA=
X-Change-ID: 20241212-filter-mode-clock-8cb2e769f05b
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
CC: <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734030729; l=4582;
 i=quic_jesszhan@quicinc.com; s=20230329; h=from:subject:message-id;
 bh=EcbOV0s5NkPGBlJ6bf2+qtaCaWHaRvTPaID4wWfUs38=;
 b=//CeavGe+5m8ZKtTTkXsuYJvlFaPm3n08epl96aLYEXOZPXyRgKSmQpSv8XTyhKdYgsofqedk
 n8JLvF2F0mMDq0yMMIXPPnw2RogzA7CCuslkkv2aTiGEyjz4AxpG//3
X-Developer-Key: i=quic_jesszhan@quicinc.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AEHBiz-qRpy-DjdKVNYTUd9uVfxcgvLW
X-Proofpoint-ORIG-GUID: AEHBiz-qRpy-DjdKVNYTUd9uVfxcgvLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120139

Filter out modes that have a clock rate greater than the max core clock
rate when adjusted for the perf clock factor

This is especially important for chipsets such as QCS615 that have lower
limits for the MDP max core clock.

Since the core CRTC clock is at least the mode clock (adjusted for the
perf clock factor) [1], the modes supported by the driver should be less
than the max core clock rate.

[1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 +++++++++++++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..0afd7c81981c722a1a9176062250c418255fe6d0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -31,6 +31,26 @@ enum dpu_perf_mode {
 	DPU_PERF_MODE_MAX
 };
 
+/**
+ * dpu_core_perf_adjusted_crtc_clk - Adjust given crtc clock rate according to
+ *   the perf clock factor.
+ * @crtc_clk_rate - Unadjusted crtc clock rate
+ * @perf_cfg: performance configuration
+ */
+u64 dpu_core_perf_adjusted_crtc_clk(u64 crtc_clk_rate,
+				    const struct dpu_perf_cfg *perf_cfg)
+{
+	u32 clk_factor;
+
+	clk_factor = perf_cfg->clk_inefficiency_factor;
+	if (clk_factor) {
+		crtc_clk_rate *= clk_factor;
+		do_div(crtc_clk_rate, 100);
+	}
+
+	return crtc_clk_rate;
+}
+
 /**
  * _dpu_core_perf_calc_bw() - to calculate BW per crtc
  * @perf_cfg: performance configuration
@@ -76,7 +96,6 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 	struct dpu_plane_state *pstate;
 	struct drm_display_mode *mode;
 	u64 crtc_clk;
-	u32 clk_factor;
 
 	mode = &state->adjusted_mode;
 
@@ -90,13 +109,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
 		crtc_clk = max(pstate->plane_clk, crtc_clk);
 	}
 
-	clk_factor = perf_cfg->clk_inefficiency_factor;
-	if (clk_factor) {
-		crtc_clk *= clk_factor;
-		do_div(crtc_clk, 100);
-	}
-
-	return crtc_clk;
+	return dpu_core_perf_adjusted_crtc_clk(crtc_clk, perf_cfg);
 }
 
 static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..c3bcd567cdfb66647c83682d1feedd69e33f0680 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -54,6 +54,9 @@ struct dpu_core_perf {
 	u64 fix_core_ab_vote;
 };
 
+u64 dpu_core_perf_adjusted_crtc_clk(u64 clk_rate,
+				    const struct dpu_perf_cfg *perf_cfg);
+
 int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 		struct drm_crtc_state *state);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index ad3462476a143ec01a3b8817a2c85b0f50435a9e..cd7b84ab57a7526948c2beb7c5cefdddcbe4f6d9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1257,6 +1257,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 						const struct drm_display_mode *mode)
 {
 	struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
+	u64 adjusted_mode_clk;
 
 	/* if there is no 3d_mux block we cannot merge LMs so we cannot
 	 * split the large layer into 2 LMs, filter out such modes
@@ -1264,6 +1265,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
 	if (!dpu_kms->catalog->caps->has_3d_merge &&
 	    mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
 		return MODE_BAD_HVALUE;
+
+	adjusted_mode_clk = dpu_core_perf_adjusted_crtc_clk(mode->clock,
+							    dpu_kms->perf.perf_cfg);
+
+	/*
+	 * The given mode, adjusted for the perf clock factor, should not exceed
+	 * the max core clock rate
+	 */
+	if (adjusted_mode_clk > dpu_kms->perf.max_core_clk_rate / 1000)
+		return MODE_CLOCK_HIGH;
+
 	/*
 	 * max crtc width is equal to the max mixer width * 2 and max height is 4K
 	 */

---
base-commit: 423c1c96d6b2d3bb35072e33a5fdd8db6d2c0a74
change-id: 20241212-filter-mode-clock-8cb2e769f05b

Best regards,
-- 
Jessica Zhang <quic_jesszhan@quicinc.com>


