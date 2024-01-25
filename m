Return-Path: <linux-arm-msm+bounces-8300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E44DD83CCA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 20:41:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9451229E195
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jan 2024 19:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B71A13664C;
	Thu, 25 Jan 2024 19:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="b8cvsXrt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD332135A5F
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jan 2024 19:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706211552; cv=none; b=bAUmVziEvdhqj/1tB+M3bgm/jwcqBjw7fhl0sfGTDq1L1+ZrgWgXEyEOEqPOF+aXCnYTsNceitMTy+4PLSaebc0u/O+Vbj38jLrdpY/EZr9mrignlXWYH1srJRusWhCuqZtx/byITr9Yg1k4FFLuJn4rFspuB2I6bdwDtoq7mcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706211552; c=relaxed/simple;
	bh=HY1hYKuDnpUDhpiEu0qqVUEvT1Hgm6gGJeFilqIZPjw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mXOobuwPHtqjiGALw3ONv1RFUNa8F0iK6+2owq9Zd5fbX5Emu35/RdAN3hazWJcXkiVPfs9e7Yzdpv2F/tD2TjRcUiDYAoJ+wpuyBzCt3antJQzT8dHLV7BWpVwcyBHJ18I/5LZomlPFMfpHIwk8nmw1eLVnAHRLWDh9bZOS3Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=b8cvsXrt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40PDsrES013851;
	Thu, 25 Jan 2024 19:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=Af1G9+Lg2llBPcZSy9JrEoQ9Z2yUL8AN5U0ZMs0BmRw=; b=b8
	cvsXrtoVAXYjbT01damJkbzmhZBO2OXLnebbLGQGcFPfqZJkz+EIBk5nCclIxzsx
	rC85t0YraHdZNRpdfgaKpbS+TeKCZEq2D8pDDNJiFqIziusrPVtDf974B05iOY1H
	pgO9QNaEIzoJe5YKJOq82CT7yMfoCWHL8zIvl+D80QfiLFQvsAkGq00e0WdWtH28
	RNqksHJQe2AW1CbMSdPjwi5YWRfiuSyMch7xV6FHDqpohK8FAWAq9OxT4Sdk3XMd
	c75K317i1Jldl1QFpLG7RdgKiOylidE+586O0vhJs6K5KrOhMvsfBHQL5EcCPqdO
	kyuV5dhLjh1inWhd2EgA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vup2thfxa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40PJd3ZM023706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 19:39:03 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 25 Jan 2024 11:39:03 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH 08/17] drm/msm/dp: change YUV420 related programming for DP
Date: Thu, 25 Jan 2024 11:38:17 -0800
Message-ID: <20240125193834.7065-9-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240125193834.7065-1-quic_parellan@quicinc.com>
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qPAstPBiDIDo9dMb8SbhDhDT0t1Y7o0W
X-Proofpoint-ORIG-GUID: qPAstPBiDIDo9dMb8SbhDhDT0t1Y7o0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_12,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401250142

Change all relevant DP controller related programming for YUV420 cases.
Namely, change the pixel clock math to consider YUV420, program the
configuration control to indicate YUV420, as well as modify the MVID
programming to consider YUV420.

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c |  5 ++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h |  2 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 +++++++++---
 drivers/gpu/drm/msm/dp/dp_display.c |  8 +++++++-
 drivers/gpu/drm/msm/msm_kms.h       |  3 +++
 5 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 5142aeb705a44..5d84c089e520a 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -442,7 +442,7 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
 
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 					u32 rate, u32 stream_rate_khz,
-					bool fixed_nvid)
+					bool fixed_nvid, bool is_ycbcr_420)
 {
 	u32 pixel_m, pixel_n;
 	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
@@ -485,6 +485,9 @@ void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
 		nvid = temp;
 	}
 
+	if (is_ycbcr_420)
+		mvid /= 2;
+
 	if (link_rate_hbr2 == rate)
 		nvid *= 2;
 
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 38786e855b51a..6cb5e2a243de2 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -96,7 +96,7 @@ void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
 void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
 void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
-				u32 stream_rate_khz, bool fixed_nvid);
+				u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
 int dp_catalog_ctrl_set_pattern_state_bit(struct dp_catalog *dp_catalog, u32 pattern);
 u32 dp_catalog_hw_revision(const struct dp_catalog *dp_catalog);
 void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 77a8d9366ed7b..209cf2a35642f 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -128,6 +128,9 @@ static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
+	if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
+		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
+
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
@@ -957,7 +960,7 @@ static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
 	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
 	in.nlanes = ctrl->link->link_params.num_lanes;
 	in.bpp = ctrl->panel->dp_mode.bpp;
-	in.pixel_enc = 444;
+	in.pixel_enc = ctrl->panel->dp_mode.out_fmt_is_yuv_420 ? 420 : 444;
 	in.dsc_en = 0;
 	in.async_en = 0;
 	in.fec_en = 0;
@@ -1763,6 +1766,8 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
 		ctrl->link->link_params.rate = rate;
 		ctrl->link->link_params.num_lanes =
 			ctrl->panel->link_info.num_lanes;
+		if (ctrl->panel->dp_mode.out_fmt_is_yuv_420)
+			pixel_rate >>= 1;
 	}
 
 	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
@@ -1878,7 +1883,7 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 
 	pixel_rate = pixel_rate_orig = ctrl->panel->dp_mode.drm_mode.clock;
 
-	if (dp_ctrl->wide_bus_en)
+	if (dp_ctrl->wide_bus_en || ctrl->panel->dp_mode.out_fmt_is_yuv_420)
 		pixel_rate >>= 1;
 
 	drm_dbg_dp(ctrl->drm_dev, "rate=%d, num_lanes=%d, pixel_rate=%lu\n",
@@ -1917,7 +1922,8 @@ int dp_ctrl_on_stream(struct dp_ctrl *dp_ctrl, bool force_link_train)
 
 	dp_catalog_ctrl_config_msa(ctrl->catalog,
 		ctrl->link->link_params.rate,
-		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl));
+		pixel_rate_orig, dp_ctrl_use_fixed_nvid(ctrl),
+		ctrl->panel->dp_mode.out_fmt_is_yuv_420);
 
 	dp_ctrl_setup_tr_unit(ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f6b3b6ca242f8..6d764f5b08727 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -916,9 +916,10 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 	const u32 num_components = 3, default_bpp = 24;
 	struct dp_display_private *dp_display;
 	struct dp_link_info *link_info;
-	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
 	struct msm_dp *dp;
 	int mode_pclk_khz = mode->clock;
+	int rate_ratio = RGB_24BPP_TMDS_CHAR_RATE_RATIO;
+	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
 
 	dp = to_dp_bridge(bridge)->dp_display;
 
@@ -933,6 +934,11 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
 	dp_display = container_of(dp, struct dp_display_private, dp_display);
 	link_info = &dp_display->panel->link_info;
 
+	if (drm_mode_is_420_only(&dp->connector->display_info, mode))
+		rate_ratio = YUV420_24BPP_TMDS_CHAR_RATE_RATIO;
+
+	mode_pclk_khz /= rate_ratio;
+
 	mode_bpp = dp->connector->display_info.bpc * num_components;
 	if (!mode_bpp)
 		mode_bpp = default_bpp;
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 44aa435d68ce2..66e8151951807 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -15,6 +15,9 @@
 
 #define MAX_PLANE	4
 
+#define RGB_24BPP_TMDS_CHAR_RATE_RATIO		1
+#define YUV420_24BPP_TMDS_CHAR_RATE_RATIO	2
+
 /* As there are different display controller blocks depending on the
  * snapdragon version, the kms support is split out and the appropriate
  * implementation is loaded at runtime.  The kms module is responsible
-- 
2.39.2


