Return-Path: <linux-arm-msm+bounces-63803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BE3AF9F9F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 12:03:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0983E4A63E2
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 10:03:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AADEF28D8EF;
	Sat,  5 Jul 2025 10:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YGRW+fF/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66AD428C2C3
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 10:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751709766; cv=none; b=uRT+ts8A/G9paYoxauJubzPa2KaBAgXDrpcJ/b92X2AlSO6SboevXMHO1hPJeDX0OYLKLg/9NPqgoPV4aXCBgPUrEOCfVu0cya31ALwEXvcWSPt4RCw7kZvi5Y5kDONjWsQvSkXTlaRbiAIwAoVvU/5pvq9pM+M0vmLKt7njGdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751709766; c=relaxed/simple;
	bh=y5GEHKWdnesIiI7b6yReGP2RH3YEuiJU3ksnA2vEGDs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MvlYbe6kTOVNtPdessxFzdrhUM61cHFkQZeSABM1p4ehXDx2F++MesKfmnHzx+sorN9yZSKQIU8NE86ZnKIB/ALS883Ij7PfuhxqHuF0pL1GwbDkw7ZkxDqPXlGxhvYdWIPY4zyHLzhFboETZM+7ITBGim/BWxEt4AGFMXgk/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YGRW+fF/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5650LlZL019971
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 10:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E3adLLPr5/+aiXMMTLA05JccG6xtDgJ60ZWs8OV0rHg=; b=YGRW+fF/6UDCXBaM
	tPUKrBbH9jJcsaYuXiMN4leLnm15rqDliV+UsVKZ9f2nP5i4aA8gLtQJIRi+GbVZ
	l1A40SL5BHFIdxWlWL7AgwxcX2Xg2ooKcKX4IevfMUfyElz+Xi2oNTPjeAoz4/lB
	a+57dQHNm6Wr26EtFLV13agLUbTP/L8bjOwE+Hspl65/CJc1XwSfiHpsFUVaXgS9
	GFEhrV3aWIZ5EgiJP77p744k41unrzFrTpP4tBbPACoaqrHuk+ewgCFUQNVlSFE2
	a8XslO69ra5n6vT0fozgnF5COy+FwqAaePPTE5ex52AB9VopCDrWmrN8SD/rC/W+
	z+XvwA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47psdq8s1n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 10:02:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a98d1ed40aso37347661cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 03:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709762; x=1752314562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3adLLPr5/+aiXMMTLA05JccG6xtDgJ60ZWs8OV0rHg=;
        b=sJqQikVeB+L5wV+Nsylfq2olzJQJoX5OFMOcP8Ybe/tIUJ4LEcIvmvuWT8R0ZdE3y3
         UBqyPu1h3S6lB+oRy6qTuG5X8tBLKEZ94b2o4T08sGQewYbcS18+7yO9tDJa7sC1KcRS
         Y3k7fzZytPrcduJMUepz4ACueYumH38jdBS+kWP+zisMj136KWku6pm9HmIL2DMP7Yoa
         gBQN/OA8jGAjdTd93+zZVxDkCIR7LBz0S6ZLw4wVFr5pjZg8TmruaA8J17rVXW1JSL6f
         jLF0aqqpQFwMtwbDAeywUrexFQJcHO/jJ9advhbuUNkp7145jVNrb/Rd6v6m+Zt+Cblu
         UwhA==
X-Gm-Message-State: AOJu0YyGR0GEr2BvD2TkzrPkYUaPLPl0hnuU4igW6n7n9XCK0Yh/ch24
	aQR0o5W+0GGuqf6N+066ZMX5SAEWQmWvRBW0Zr9bwA5XWJAXs1k3tKtmYIdul9aHf2IpKk2WOGK
	IjqsQeGHCaos9QZ3JcElz64BOhXDzbu5NeWzEK7+fM/KycNzFndAUMfa54IbvgA2Lgs3l
X-Gm-Gg: ASbGncvV3WHarPqdh29Vwut6s/13WjGZuWHhXcE2QmgmC3QKV8irakDRTrxIixtj+AG
	LqYeLJv1ecTtedpnQL2Fr0f7edt4UOWO+vJA3CnqM450KeH5NmzdYoIBC47NYF+EkrSCB/SIvSA
	1Xs1d0bNm1whOWb+jao5CH5UAkFrvkfjvJ5lY3T1IpDPn7ZIGDSk6EK40dEMU/b5qrpj6W28hJa
	KNizU2onmxh52wJprIdAQWsrg3uDEgG3BMuTotgn/A4tpVOApEONL3yIvYnt09ouk/qItd2hFdq
	R3eJg+S2HFid0KG5RIcJ4u7iHDMxTwsUC2cD4yAyoePodZUMxmTmb8WFeRo22RM24nCHgoz3NIE
	gADufIoJCbMP2JQRwmw8ezKzHVlfKjNUfXcg=
X-Received: by 2002:a05:620a:2b46:b0:7d1:fc53:c6b2 with SMTP id af79cd13be357-7d5f1ad95fcmr249280285a.41.1751709762015;
        Sat, 05 Jul 2025 03:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IElRfBLwEgFO6T08UOJdIHJK2dBeCRnXG+B7FaRciaZH+UKp1B0MbMNZbJOteeK9hTArDNzGw==
X-Received: by 2002:a05:620a:2b46:b0:7d1:fc53:c6b2 with SMTP id af79cd13be357-7d5f1ad95fcmr249272785a.41.1751709761153;
        Sat, 05 Jul 2025 03:02:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384c0558sm526274e87.209.2025.07.05.03.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 03:02:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 13:02:30 +0300
Subject: [PATCH v4 05/10] drm/msm: move KMS driver data to msm_kms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-msm-gpu-split-v4-5-fb470c481131@oss.qualcomm.com>
References: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
In-Reply-To: <20250705-msm-gpu-split-v4-0-fb470c481131@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=15235;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y5GEHKWdnesIiI7b6yReGP2RH3YEuiJU3ksnA2vEGDs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPgz6UM0S83Ejk5lRKpzgljEsFw198ybJUeEq
 EhBbSOtgVWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj4MwAKCRCLPIo+Aiko
 1e0VB/44m4yH1bQHdV4HbENI95LIlSafiDr3NYsAycNkeHGPbwRdsSUoS8SEony5hvz2MfndKg4
 Iy/e1T7DBceUM8GhgF0LfmwS93KfTI8rBIOWLNpLWtA2v2dnfTQ7LhL5S72J5pTLQ984faS86mu
 EGe8ME2pwr+D1XuFBw33E+kDpYJIeEUSZ47yBtYbyU9qjRnre1N64q2cxGJoMtS8gJ2CqgPH6DS
 KNldSfa0HbJ4qYdjva4iNECpZiknY5+W46rywO5beciDN/gWP1jZxnrMSmrrpLrlvgFX0SD8KFY
 ieArWtrwBGH4cgJ8iKBWf2o3LFCiGecEVLXQLRQFlwJ+fveV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ffSty1QF c=1 sm=1 tr=0 ts=6868f843 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=472Qx-lKBLW_CYKAQVMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: eQyX9NbKT4aQOLCjzyeFWM_fDxcS8ghP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2NCBTYWx0ZWRfXx1zJhweD8a42
 YKkuaYgRhN2uBIBJ8D5CgyxUNCogzi7wzcCbDQSEgAaInGjA3so2tTBTGmbq7tuHiV66Pj6HuSC
 VR7XDYQ1OXeuoBNxoJf+LYBZOLZbA6a3zV7mPyVjDlT6hIU59XYE8Ccd+CZ4boZ04O1j05BEvok
 RYrrZ7HxsGguy0wnOBAdFg6zGXfpkfrWo3sGbI57ukoMJqWp1Eiq/Wx1c8jQor1STF2t9KizrLq
 qbp/ZBoSfqffVSrizAM8FZKBO2z7KNenmX7moqaiiC8714ys8TKRAVIxUfAcRs1Lu4Nx8tEeknH
 eUMwUbSoXKWQYWeBIYiQ/1SDPe8cnC7iy4k3PIlOhTdcf7bE+7Lm5UWuaGMGSEpGoDnMZJlVHoe
 MCjdUl0crG6R/up8kfblrbR+A9UHFUWb+HVvH4i4hV15coC0tX0thwDNLOSrs7uksNtw3McY
X-Proofpoint-GUID: eQyX9NbKT4aQOLCjzyeFWM_fDxcS8ghP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507050064

Data for HDMI, DSI and DP blocks only makes sense for the KMS parts of
the driver. Move corresponding data pointers from struct msm_drm_private
to struct msm_kms.

Suggested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       | 11 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 32 +++++++++++------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  8 +++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          | 13 ++++-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c | 12 ++++-----
 drivers/gpu/drm/msm/dp/dp_display.c               |  6 ++---
 drivers/gpu/drm/msm/dsi/dsi.c                     |  4 +--
 drivers/gpu/drm/msm/hdmi/hdmi.c                   |  9 ++++---
 drivers/gpu/drm/msm/msm_drv.h                     | 11 +-------
 drivers/gpu/drm/msm/msm_kms.h                     |  6 +++++
 10 files changed, 55 insertions(+), 57 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f7abe8ba73ef0899ff1985ebf26571b7c459a52f..05e5f3463e30c9a6bd5b740580720ae2bf6b3246 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -264,7 +264,7 @@ bool dpu_encoder_needs_periph_flush(struct dpu_encoder_phys *phys_enc)
 	mode = &phys_enc->cached_mode;
 
 	return phys_enc->hw_intf->cap->type == INTF_DP &&
-	       msm_dp_needs_periph_flush(priv->dp[disp_info->h_tile_instance[0]], mode);
+	       msm_dp_needs_periph_flush(priv->kms->dp[disp_info->h_tile_instance[0]], mode);
 }
 
 /**
@@ -283,9 +283,9 @@ bool dpu_encoder_is_widebus_enabled(const struct drm_encoder *drm_enc)
 	index = disp_info->h_tile_instance[0];
 
 	if (disp_info->intf_type == INTF_DP)
-		return msm_dp_wide_bus_available(priv->dp[index]);
+		return msm_dp_wide_bus_available(priv->kms->dp[index]);
 	else if (disp_info->intf_type == INTF_DSI)
-		return msm_dsi_wide_bus_enabled(priv->dsi[index]);
+		return msm_dsi_wide_bus_enabled(priv->kms->dsi[index]);
 
 	return false;
 }
@@ -647,7 +647,7 @@ struct drm_dsc_config *dpu_encoder_get_dsc_config(struct drm_encoder *drm_enc)
 	int index = dpu_enc->disp_info.h_tile_instance[0];
 
 	if (dpu_enc->disp_info.intf_type == INTF_DSI)
-		return msm_dsi_get_dsc_config(priv->dsi[index]);
+		return msm_dsi_get_dsc_config(priv->kms->dsi[index]);
 
 	return NULL;
 }
@@ -709,7 +709,8 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
 		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
 			topology->num_cdm++;
 	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
+		if (msm_dp_is_yuv_420_enabled(priv->kms->dp[disp_info->h_tile_instance[0]],
+					      adj_mode))
 			topology->num_cdm++;
 	}
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 7025f521b70e501eefa69ddcdba64d38e0ca5465..12dcb32b472497f9e59619db4e810abfbf610c7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -583,7 +583,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	struct msm_display_info info;
 	int i, rc = 0;
 
-	if (!(priv->dsi[0] || priv->dsi[1]))
+	if (!(priv->kms->dsi[0] || priv->kms->dsi[1]))
 		return rc;
 
 	/*
@@ -594,26 +594,26 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 	 *
 	 * TODO: Support swapping DSI0 and DSI1 in the bonded setup.
 	 */
-	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
+	for (i = 0; i < ARRAY_SIZE(priv->kms->dsi); i++) {
 		int other = (i + 1) % 2;
 
-		if (!priv->dsi[i])
+		if (!priv->kms->dsi[i])
 			continue;
 
-		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) &&
-		    !msm_dsi_is_master_dsi(priv->dsi[i]))
+		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]) &&
+		    !msm_dsi_is_master_dsi(priv->kms->dsi[i]))
 			continue;
 
 		memset(&info, 0, sizeof(info));
 		info.intf_type = INTF_DSI;
 
 		info.h_tile_instance[info.num_of_h_tiles++] = i;
-		if (msm_dsi_is_bonded_dsi(priv->dsi[i]))
+		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]))
 			info.h_tile_instance[info.num_of_h_tiles++] = other;
 
-		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->dsi[i]);
+		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->kms->dsi[i]);
 
-		rc = dpu_kms_dsi_set_te_source(&info, priv->dsi[i]);
+		rc = dpu_kms_dsi_set_te_source(&info, priv->kms->dsi[i]);
 		if (rc) {
 			DPU_ERROR("failed to identify TE source for dsi display\n");
 			return rc;
@@ -625,15 +625,15 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
 			return PTR_ERR(encoder);
 		}
 
-		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
+		rc = msm_dsi_modeset_init(priv->kms->dsi[i], dev, encoder);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
 				i, rc);
 			break;
 		}
 
-		if (msm_dsi_is_bonded_dsi(priv->dsi[i]) && priv->dsi[other]) {
-			rc = msm_dsi_modeset_init(priv->dsi[other], dev, encoder);
+		if (msm_dsi_is_bonded_dsi(priv->kms->dsi[i]) && priv->kms->dsi[other]) {
+			rc = msm_dsi_modeset_init(priv->kms->dsi[other], dev, encoder);
 			if (rc) {
 				DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
 					other, rc);
@@ -655,8 +655,8 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 	int rc;
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
-		if (!priv->dp[i])
+	for (i = 0; i < ARRAY_SIZE(priv->kms->dp); i++) {
+		if (!priv->kms->dp[i])
 			continue;
 
 		memset(&info, 0, sizeof(info));
@@ -671,7 +671,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
 		}
 
 		yuv_supported = !!dpu_kms->catalog->cdm;
-		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder, yuv_supported);
+		rc = msm_dp_modeset_init(priv->kms->dp[i], dev, encoder, yuv_supported);
 		if (rc) {
 			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 			return rc;
@@ -689,7 +689,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 	struct msm_display_info info;
 	int rc;
 
-	if (!priv->hdmi)
+	if (!priv->kms->hdmi)
 		return 0;
 
 	memset(&info, 0, sizeof(info));
@@ -703,7 +703,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
 		return PTR_ERR(encoder);
 	}
 
-	rc = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
+	rc = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
 	if (rc) {
 		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
 		return rc;
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 1aa7d65afbd0b4e8a231d1d4ff7a7120e8b7391e..0952c7f18abdca4a7e24e5af8a7132456bfec129 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -250,9 +250,9 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		/* DTV can be hooked to DMA_E: */
 		encoder->possible_crtcs = 1 << 1;
 
-		if (priv->hdmi) {
+		if (priv->kms->hdmi) {
 			/* Construct bridge/connector for HDMI: */
-			ret = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
+			ret = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
 			if (ret) {
 				DRM_DEV_ERROR(dev->dev, "failed to initialize HDMI: %d\n", ret);
 				return ret;
@@ -264,7 +264,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		/* only DSI1 supported for now */
 		dsi_id = 0;
 
-		if (!priv->dsi[dsi_id])
+		if (!priv->kms->dsi[dsi_id])
 			break;
 
 		encoder = mdp4_dsi_encoder_init(dev);
@@ -278,7 +278,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
 		/* TODO: Add DMA_S later? */
 		encoder->possible_crtcs = 1 << DMA_P;
 
-		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		ret = msm_dsi_modeset_init(priv->kms->dsi[dsi_id], dev, encoder);
 		if (ret) {
 			DRM_DEV_ERROR(dev->dev, "failed to initialize DSI: %d\n",
 				ret);
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 4c9e79fc00e9d8ca8de294c83559e72a2e48d1d2..5b6ca8dd929e1870b7228af93da03886524f5f20 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -312,7 +312,7 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 		DRM_DEV_INFO(dev->dev, "Skipping eDP interface %d\n", intf->num);
 		break;
 	case INTF_HDMI:
-		if (!priv->hdmi)
+		if (!priv->kms->hdmi)
 			break;
 
 		ctl = mdp5_ctlm_request(ctlm, intf->num);
@@ -327,7 +327,7 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 			break;
 		}
 
-		ret = msm_hdmi_modeset_init(priv->hdmi, dev, encoder);
+		ret = msm_hdmi_modeset_init(priv->kms->hdmi, dev, encoder);
 		break;
 	case INTF_DSI:
 	{
@@ -335,14 +335,14 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 					mdp5_cfg_get_hw_config(mdp5_kms->cfg);
 		int dsi_id = get_dsi_id_from_intf(hw_cfg, intf->num);
 
-		if ((dsi_id >= ARRAY_SIZE(priv->dsi)) || (dsi_id < 0)) {
+		if ((dsi_id >= ARRAY_SIZE(priv->kms->dsi)) || (dsi_id < 0)) {
 			DRM_DEV_ERROR(dev->dev, "failed to find dsi from intf %d\n",
 				intf->num);
 			ret = -EINVAL;
 			break;
 		}
 
-		if (!priv->dsi[dsi_id])
+		if (!priv->kms->dsi[dsi_id])
 			break;
 
 		ctl = mdp5_ctlm_request(ctlm, intf->num);
@@ -357,9 +357,10 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 			break;
 		}
 
-		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		ret = msm_dsi_modeset_init(priv->kms->dsi[dsi_id], dev, encoder);
 		if (!ret)
-			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
+			mdp5_encoder_set_intf_mode(encoder,
+						   msm_dsi_is_cmd_mode(priv->kms->dsi[dsi_id]));
 
 		break;
 	}
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index 07a2c1e872193bc96172c84142bd4ecc93a95a1c..071bcdea80f7114308e5a1e1a989ad0f064a09d2 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -127,18 +127,18 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	priv = drm_dev->dev_private;
 	kms = priv->kms;
 
-	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
-		if (!priv->dp[i])
+	for (i = 0; i < ARRAY_SIZE(kms->dp); i++) {
+		if (!kms->dp[i])
 			continue;
 
-		msm_dp_snapshot(disp_state, priv->dp[i]);
+		msm_dp_snapshot(disp_state, kms->dp[i]);
 	}
 
-	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
-		if (!priv->dsi[i])
+	for (i = 0; i < ARRAY_SIZE(kms->dsi); i++) {
+		if (!kms->dsi[i])
 			continue;
 
-		msm_dsi_snapshot(disp_state, priv->dsi[i]);
+		msm_dsi_snapshot(disp_state, kms->dsi[i]);
 	}
 
 	if (kms->funcs->snapshot)
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 2006e7fe78848531bd121c07ebb449decab66029..d87d47cc7ec3eb757ac192c411000bc50b824c59 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -292,9 +292,7 @@ static int msm_dp_display_bind(struct device *dev, struct device *master,
 	struct drm_device *drm = priv->dev;
 
 	dp->msm_dp_display.drm_dev = drm;
-	priv->dp[dp->id] = &dp->msm_dp_display;
-
-
+	priv->kms->dp[dp->id] = &dp->msm_dp_display;
 
 	dp->drm_dev = drm;
 	dp->aux->drm_dev = drm;
@@ -328,7 +326,7 @@ static void msm_dp_display_unbind(struct device *dev, struct device *master,
 	msm_dp_aux_unregister(dp->aux);
 	dp->drm_dev = NULL;
 	dp->aux->drm_dev = NULL;
-	priv->dp[dp->id] = NULL;
+	priv->kms->dp[dp->id] = NULL;
 }
 
 static const struct component_ops msm_dp_display_comp_ops = {
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 2962158776135d6e3c5b119bf4341c135c8f5248..d8bb40ef820e2b8c8ac933ca01e1dc46f087a218 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -136,7 +136,7 @@ static int dsi_bind(struct device *dev, struct device *master, void *data)
 		msm_dsi->next_bridge = ext_bridge;
 	}
 
-	priv->dsi[msm_dsi->id] = msm_dsi;
+	priv->kms->dsi[msm_dsi->id] = msm_dsi;
 
 	return 0;
 }
@@ -148,7 +148,7 @@ static void dsi_unbind(struct device *dev, struct device *master,
 	struct msm_dsi *msm_dsi = dev_get_drvdata(dev);
 
 	msm_dsi_tx_buf_free(msm_dsi->host);
-	priv->dsi[msm_dsi->id] = NULL;
+	priv->kms->dsi[msm_dsi->id] = NULL;
 }
 
 static const struct component_ops dsi_ops = {
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 2fd388b892dcb3d83cf57b4616b7a65f9ff674d1..5afac09c0d3347f85a3449207b3c876aae4dd1e2 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -15,6 +15,7 @@
 #include <drm/drm_of.h>
 #include <drm/display/drm_hdmi_state_helper.h>
 
+#include "msm_kms.h"
 #include "hdmi.h"
 
 void msm_hdmi_set_mode(struct hdmi *hdmi, bool power_on)
@@ -244,7 +245,7 @@ static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
 	err = msm_hdmi_init(hdmi);
 	if (err)
 		return err;
-	priv->hdmi = hdmi;
+	priv->kms->hdmi = hdmi;
 
 	return 0;
 }
@@ -254,9 +255,9 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 {
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
-	if (priv->hdmi) {
-		msm_hdmi_destroy(priv->hdmi);
-		priv->hdmi = NULL;
+	if (priv->kms->hdmi) {
+		msm_hdmi_destroy(priv->kms->hdmi);
+		priv->kms->hdmi = NULL;
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 88ce305792fd89f280b39bd92888a18abd0343e3..e7872b752c6c8e5869927634184733796afa1967 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -86,16 +86,6 @@ struct msm_drm_private {
 	/* subordinate devices, if present: */
 	struct platform_device *gpu_pdev;
 
-	/* possibly this should be in the kms component, but it is
-	 * shared by both mdp4 and mdp5..
-	 */
-	struct hdmi *hdmi;
-
-	/* DSI is shared by mdp4 and mdp5 */
-	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
-
-	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
-
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
 
@@ -367,6 +357,7 @@ static inline const char *msm_dsi_get_te_source(struct msm_dsi *msm_dsi)
 }
 #endif
 
+struct msm_dp;
 #ifdef CONFIG_DRM_MSM_DP
 int __init msm_dp_register(void);
 void __exit msm_dp_unregister(void);
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 7ecf420d0f16cd68f8f7fd99c52e994fe604851f..f4eb486531890f3351cf83670be801e8fd3631bb 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -131,6 +131,12 @@ struct msm_kms {
 	const struct msm_kms_funcs *funcs;
 	struct drm_device *dev;
 
+	struct hdmi *hdmi;
+
+	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
+
+	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
+
 	/* irq number to be passed on to msm_irq_install */
 	int irq;
 	bool irq_requested;

-- 
2.39.5


