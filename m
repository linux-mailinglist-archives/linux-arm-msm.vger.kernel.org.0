Return-Path: <linux-arm-msm+bounces-12237-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 137F3860363
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 21:01:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01470B2BA66
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Feb 2024 19:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD90B6E5E4;
	Thu, 22 Feb 2024 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IBMiNump"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5206AF99
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Feb 2024 19:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708630862; cv=none; b=ryJ6w3DiX8Ccwm+f+86tC8djpQYG5RisWOBCLrnxkxCm1l/cRAFUhCtVBoFoegl/MMhjzCh2nN/5pWBSUKncmaRAMylPkHH8je3wnGM4EEYH4vTQhCA2EZuedBVMUBbC2v792Z+GdT92MgF8pmnlmrHJh+qQ5gtURvSKvHfuMwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708630862; c=relaxed/simple;
	bh=wA6GH29XWUbUwS44mGJKGhA0bHRKSDvKG/mttM6IDKg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V8kFZI4brJx4r6LgChTfd99igpxdEv5SjsvywhgAf6zghuO8u3ByfFoJnH21UdBZsXSpDVsHzKlTe+FdIzSSCZ7qW8a556XoMt2syXk2isReHINLaMi0JFyIgA0XbqKL2/KwPVMmlY35XFiI+UpIPBjSGrNqAZbBC59ksvmWo+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IBMiNump; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41MEIf1u003571;
	Thu, 22 Feb 2024 19:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=JhS/2Q5iMazHtTSq3oQIY+GaizIIIMs6ZysNKQeRAEA=; b=IB
	MiNumpsr7G5oBdHpmv+EBGB6hWbaGeawHgiaB8s0CbxSgLhIF8nSsodA8/9CE82W
	zYhPNJtDcSMSOt/tcu5Q4y0GNzyng+oJ5XvqZfviUvjvHCsxETC7txTZ31CwuWIL
	Od86ZVWemBc1GGovop5Paq8xZY9HjBhJ5J+miO5GXxn2ule9MMZBumwNTRyvLxFR
	uP3YyDib5+rvEShU/G1C0OjtWtih4tBCHz+QVnerkGCVyWjyFLauTQ3AI7WAkt1q
	s/OBM/C+wtCrjHQrNlnITTmpZVm387iIjCH0YjsnBuFwnHyvdlEPPNltWOml6PtO
	i4lrToJyWxAY1095sLoQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3we2bxa7mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41MJetmS022784
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 19:40:55 GMT
Received: from hu-parellan-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 22 Feb 2024 11:40:54 -0800
From: Paloma Arellano <quic_parellan@quicinc.com>
To: <freedreno@lists.freedesktop.org>
CC: Paloma Arellano <quic_parellan@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <robdclark@gmail.com>, <seanpaul@chromium.org>, <swboyd@chromium.org>,
        <dmitry.baryshkov@linaro.org>, <quic_abhinavk@quicinc.com>,
        <quic_jesszhan@quicinc.com>, <quic_khsieh@quicinc.com>,
        <marijn.suijten@somainline.org>, <neil.armstrong@linaro.org>
Subject: [PATCH v5 17/19] drm/msm/dpu: modify timing engine programming for YUV420 over DP
Date: Thu, 22 Feb 2024 11:40:02 -0800
Message-ID: <20240222194025.25329-18-quic_parellan@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240222194025.25329-1-quic_parellan@quicinc.com>
References: <20240222194025.25329-1-quic_parellan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: UevEQMAQk3Y1mb6vxuKkunRpz7LdvOJ1
X-Proofpoint-GUID: UevEQMAQk3Y1mb6vxuKkunRpz7LdvOJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_15,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 mlxlogscore=802 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402220154

Adjust the encoder timing engine setup programming in the case of video
mode for YUV420 over DP to accommodate CDM.

Changes in v3:
	- Move drm_display_mode's hskew division to another patch
	- Minor cleanup

Changes in v2:
	- Move timing engine programming to this patch

Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 86c57c8b7e784..5cb816ea4dcc0 100644
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


