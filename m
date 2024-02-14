Return-Path: <linux-arm-msm+bounces-11066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C56855238
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 19:35:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B55AB2EADF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 18:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AFC12D150;
	Wed, 14 Feb 2024 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jZaWenaW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DDC12CD9E
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 18:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707933865; cv=none; b=c2mL8wkOq8tN1bqChNiJAoL3CZLrbwcgCHWeSktoAp4N/TaiIBzsfc4j4NyLkpUxe0Y/sByUg5SVX2w1dha5qbM+6+chYkPad821aqpQxvIPmtB7V3eairUlw6p0UeaQuOpqNg/9RkTRT1Bf9t3Wxme1fcEnb6pSxIo6Z6TFsAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707933865; c=relaxed/simple;
	bh=n7Avq4LXJMUNs9JFCs89YYj+GTxcIN8LoQrSffGZ/64=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pEJo+Mc89yGE4nhJ0s+yqHKJxv41IA21NNwbtjCwk26qLRTxAX6GGUhS18cUFr7OqM4khQ5pgrLmv0UiVxucwEoHT4/HkzJCgbmtiwqymCo3+WLdpalCSw4vbLTWw1AvF/pa+zYhXpTonhfX85R89R/QNFDK5c41FZavDoLhnXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jZaWenaW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41EHD0fV020852;
	Wed, 14 Feb 2024 18:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=iqWUUDBDIzlwCCeHaDKR4thzTxTFVXuuSkvLb7Qi8pU=; b=jZ
	aWenaWG0yfBpAZgz+CSViYXhLbQO+VPQ6g3Fx7JLNEXnCVede6reOUeJfWOpsAXk
	P9lQMND1XusZbTVjaF7QmsUKypa8oQdv/ArAA1UiD3D1IbxSlu9APMzqRJwL7jQn
	s0PTZJPTkKjr+0faPJsMn0ibiQTOibSKTRaLftv3d5AnweV6xpuyCmCSO+pfldMB
	rO+V5nGfokb7i8LwNMT0ApXupP5jB01MUUdCGZvHXvp4Oc1k8hfkkvomPuyEw5ye
	rS9LbUaNwra7Yaz/1K2ce3CDHR8levl7RB/g5QPD7H3gcGIySSa4R3Qh8G9QMADN
	ixKxoMgSExpSbkGY1/1A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w8jn9hwbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41EI4Gih011767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 18:04:16 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 14 Feb 2024 10:04:16 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v3 17/19] drm/msm/dpu: modify timing engine programming for YUV420 over DP
Date: Wed, 14 Feb 2024 10:03:39 -0800
Message-ID: <20240214180347.1399-18-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240214180347.1399-1-quic_parellan@quicinc.com>
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S5Ls2Rh0pi-odxMgJm7fRsqO3BPe-tez
X-Proofpoint-ORIG-GUID: S5Ls2Rh0pi-odxMgJm7fRsqO3BPe-tez
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_10,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=659 bulkscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402140141

Adjust the encoder timing engine setup programming in the case of video
mode for YUV420 over DP to accommodate CDM.

Changes in v3:
	- Move drm_display_mode's hskew division to another patch
	- Minor cleanup

Changes in v2:
	- Move timing engine programming to this patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index e29bc4bd39208..04df501d23bfa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -236,7 +236,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	struct drm_display_mode mode;
 	struct dpu_hw_intf_timing_params timing_params = { 0 };
 	const struct dpu_format *fmt = NULL;
-	u32 fmt_fourcc = DRM_FORMAT_RGB888;
+	u32 fmt_fourcc;
 	unsigned long lock_flags;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
 
@@ -255,7 +255,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
 	drm_mode_debug_printmodeline(&mode);
 
-	if (phys_enc->split_role != ENC_ROLE_SOLO) {
+	fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
+
+	if (phys_enc->split_role != ENC_ROLE_SOLO || fmt_fourcc == DRM_FORMAT_YUV420) {
 		mode.hdisplay >>= 1;
 		mode.htotal >>= 1;
 		mode.hsync_start >>= 1;
@@ -275,6 +277,8 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	fmt = dpu_get_dpu_format(fmt_fourcc);
 	DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
 
+	if (phys_enc->hw_cdm)
+		intf_cfg.cdm = phys_enc->hw_cdm->idx;
 	intf_cfg.intf = phys_enc->hw_intf->idx;
 	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
 	intf_cfg.stream_sel = 0; /* Don't care value for video mode */
-- 
2.39.2


