Return-Path: <linux-arm-msm+bounces-70699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 556A1B34378
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0F552A1369
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62D103002A9;
	Mon, 25 Aug 2025 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCwYx+Mf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8C2FF653
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131509; cv=none; b=JDDX+oHjBVTWfLWYaqPh6CFiSKOUlQZhZWN7WhC8Gu8VIJmA5yFYg887D3sVqwmz1SbKD5+UgVlldpbB5ULkG6/S7j86eycDpp2ql8kQtaRbdyE3B8Svqzohuu9u5DsRrVp7inRwiTLeqEOBRahbj7LWJrYFwlMnuoxlt2Bc8mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131509; c=relaxed/simple;
	bh=m1LT4yPghysgF4yyvcfiMHGoUN/wWXK8CjUAlph2br8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h7fKkN+6WOoZYc1th9wEXRcZDBLsM6jbY/Tebb3VDHODVerp1gLmNlAxQFrv0B4WJuGgHeiTNTl6jmT4ZJjuCe5rsj3ObitP6Z3T4sqOG2sUSbO9OkO5I0VbY4TzAwHiJQAV1nrzToEsckovI/5T+dDnWnX2drAoSeGJtMWb1wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCwYx+Mf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P83WNF010555
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kuhCuvceT3eBUZZRoUj1Cw3I8qp6BdzHVaKzZZmWw2k=; b=BCwYx+MfjzN5j5XD
	UIx9+Rt8excXpF9pD7VrdHI5rvk5QXkgTN5XDRxlOgC9KBcIJewNtb3ewhjomSJX
	qGI0cTUEVBCfMElG4onIMoUEceD8jlbs1KiXDNqIjrobxy6jl6GoSjcw/OuhVUCT
	rxf8KrC0eRJHeU6VWsx+StfTFjQaDrnL2968NbMHA8ZICEf35KH5ZzS+cUltWLlb
	/ZR1uwVTX/hbQm2/i6GuqaWnkfyX/Gge57+y2FbTNtqkFM6OunU6TV9uSEF6hW4b
	X5LUG3KEwOUiRx9pODqlKNzP9tlHP3qvco3NYEAHFR/mY2QQj6G/BjdXj7CURFV4
	1dv6Gw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfdbqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:18:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2eb6d2baso8844008b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131505; x=1756736305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuhCuvceT3eBUZZRoUj1Cw3I8qp6BdzHVaKzZZmWw2k=;
        b=UMCKS1EZjXA4kRFZYIArvlYzEQyNNAZFXN8OgDz7zl99fN13ZP9MIrdEJQ5m611HdE
         Udo7y8eD4rSOrH5ZE44gQLp3HUudcv5FWR9/r++ucnsyHr2iK9MoljxtdW07L8IvLj68
         X/VacxYvljR9YIRcdU/Nc5IgomNj3BwiY49ujG5RWvnLMyyN+o2S81Zh5M8krch5XNW0
         hq/u/v4/aHPojarpZ4jOsEkvI96dLIA78w5tKugVVU00sYy1cqmRCeyIbqDWlI8JaF2y
         XRi9iVsjL2dY/RQfQYLs/owowFThhSlTiaEpELX/dOzVriG2kvKECGS/VoPwWrrNV0tL
         PbrA==
X-Gm-Message-State: AOJu0YwppdQI/TPOhOROcsNdwVYjxx8xUBnaqrNLFi+jeQFalkFKeBd2
	EnutQynLU7OOO3rmqx3krmASnbRtjcNuSuApfLngA/q+38VdIcv9YGU6P4q6a0//VF/+cSEAo94
	ncWqezlqjx6W8NC9t42JyhNyOosYNGDlhSkCUmd0C8PD+HHWrwXYb8r0EaLKNA7In80isOyetdb
	H7
X-Gm-Gg: ASbGncse5uxDt4d7UD1AhNNWroMFiXxJf+u88S8kBfItVrJZoaIgNcPV+wlT4uV6hNz
	qcXBgiQxXhjEnbPoCUu2ufr0NfG3uHQQN2etEir7QMvniiDVWKIuBOoDol17vRmTuE9+fvh3KQ2
	RhCs4GvNwJrVs2ZRZ/ZYA6FeQdHELw4wg6S0bTc2TATbbyy3LPR6+S+fXG0OCN5LZTtrh3DuwMM
	dq1Mx2WwqKs8PkjI6rDvDkNPnbkX/Mh11fwgN5fo9jfMf2F5YBrP6MwHXQ0kA4AL88NfcW4vLFm
	RxHAnE5egUKnqX2UB09NSzWNiodJmn/rOkd2bmQplIvsa6hWjA1bfzGdAjKzE0kyIhsz71w=
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id d2e1a72fcca58-7702fa09144mr15469474b3a.3.1756131504701;
        Mon, 25 Aug 2025 07:18:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuyDMxEaj9hDf69kGJI/QXSxzc8wFRyqVUbHdT3W2rALNv1ZU3Zrh52CK35M7QFmouPkuDEg==
X-Received: by 2002:a05:6a00:4601:b0:749:b41:2976 with SMTP id d2e1a72fcca58-7702fa09144mr15469449b3a.3.1756131504198;
        Mon, 25 Aug 2025 07:18:24 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:18:23 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:16:04 +0800
Subject: [PATCH v3 18/38] drm/msm/dp: Add support to enable MST in mainlink
 control
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-18-01faacfcdedd@oss.qualcomm.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
In-Reply-To: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131421; l=2479;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=UgwUqVKQaiarblhKv5Vuldkk6W6tuFzzpm5QCSz9nNY=;
 b=8DFs8ZRIVpVv1RtAu9MVTMPn/Da8N8A3WndZ6AS5sI3ksGWJ6VP1jcWx8ja0GYtxcomfrqCUh
 tE3btu75o5UCx9G2f58LThPebkL58kLIDlLOrpqeb031npkDVpEMGiH
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX1Gd4Cl2TWLQ1
 jY2kec6ClZ48YkJIpcaZKMhWbvCLRUg3ROocoRl7ofSmRHAjg/LLuH7K+Bjd43MqBmS79vpr+Q3
 rJDW2WDCt2ZkfwwFccOdh6XvDLZzskt7Q46X4SnNXAGqki4IrpPBFbQhRgJmkF4bhiLJ+O9/Oyr
 PhM1UmdAS2Q7CIWLtMRGdcuoz+Qtj+Bm1XVorLdF6NiuD9lbKKsFiApZujWzEBGEQmN1bOSrqjh
 14EcpBni9pWC2tWIbvmSJnF34bQ5k/zWtWqalDoj7lYlLV+X54d1MeOORuJNrujnaRj9PGOJ/L9
 Ai29rGUEdCbbtTv+Z4DYEPrMGiP/UILBz3sAOQytnIVTGYZKNrNs4XXQ4CpyCsJcu5lzTBg7y0j
 zaxHJlMW
X-Proofpoint-GUID: t_5IvP-jAvy4nN1rL5sAfuCQKqi5DLjm
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac70b2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GJT6Fafo9oTAj6z5dyEA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: t_5IvP-jAvy4nN1rL5sAfuCQKqi5DLjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_07,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add support to program the MST enable bit in the mainlink control
register when an MST session is active or being disabled.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 17 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_reg.h  |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 16e5ed58e791971d5dca3077cbb77bfcc186505a..d562377a8d2846099bf0f8757128978a162745c3 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -254,6 +254,19 @@ void msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
 	return;
 }
 
+static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable)
+{
+	u32 mainlink_ctrl;
+
+	mainlink_ctrl = msm_dp_read_link(ctrl, REG_DP_MAINLINK_CTRL);
+	if (enable)
+		mainlink_ctrl |= DP_MAINLINK_CTRL_MST_EN;
+	else
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_MST_EN;
+
+	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+}
+
 /*
  * NOTE: resetting DP controller will also clear any pending HPD related interrupts
  */
@@ -2656,6 +2669,9 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
 	msm_dp_ctrl_lane_mapping(ctrl);
 	msm_dp_setup_peripheral_flush(ctrl);
 
+	if (ctrl->mst_active)
+		msm_dp_ctrl_mst_config(ctrl, true);
+
 	if (msm_dp_panel->stream_id == DP_STREAM_0)
 		msm_dp_ctrl_config_ctrl_link(ctrl);
 
@@ -2711,6 +2727,7 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl)
 	phy = ctrl->phy;
 
 	msm_dp_ctrl_mainlink_disable(ctrl);
+	msm_dp_ctrl_mst_config(ctrl, false);
 
 	msm_dp_ctrl_reset(&ctrl->msm_dp_ctrl);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
index de3d0b8b52c269fd7575edf3f4096a4284ad0b8d..fda847b33f8d0d6ec4d2589586b5a3d6c9b1ccf3 100644
--- a/drivers/gpu/drm/msm/dp/dp_reg.h
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -128,6 +128,7 @@
 #define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 1)
 #define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE	FIELD_PREP(DP_MAINLINK_CTRL_FLUSH_MODE_MASK, 3)
 #define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+#define DP_MAINLINK_CTRL_MST_EN			(0x04000100)
 
 #define REG_DP_STATE_CTRL			(0x00000004)
 #define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)

-- 
2.34.1


