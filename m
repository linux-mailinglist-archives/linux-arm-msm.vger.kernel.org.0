Return-Path: <linux-arm-msm+bounces-70686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3E3B34338
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 16:19:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA442203EE7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 14:18:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2805F2FC882;
	Mon, 25 Aug 2025 14:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AFtimOF3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67ADE2FC879
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756131455; cv=none; b=oShVEqsmZNdPXPyycjc/PalYR6HTn/Gz3CdR/yENDFn5AxugQUVVVONraZaOuRjxg+ky0HQ1KH+99dmO1UhN/E8EMai/R3xWGULB5+fefkf0teaNPNJ6/iYHEhWh2JE6q1UnggSxjgf3XhYMPdye0TyxKZeWZk3cjcSciK8Sdx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756131455; c=relaxed/simple;
	bh=xDy9ih89F5xZ4CDJXV+M2TH1QImXV64VcC6JWSBfCEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shLh+Xmy+fmRV6JzoF7OzuO46EXZDFXrVICPv1xFuL3kzRwbjdfsoejJPgk/2hDIwdAUeDnghGGLvSONkzzX3dmgzxtsyq/Y0wbOFqrx6Fb65QoauBLMAlHFt2+KedI/3dSBT7PlpjT1s3a7w3KurfdvvaVY2v6y6Shn0YaFi5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AFtimOF3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P8di5w030554
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PAyYDRJsaYxENoD1H+Eu1JmDIGkAgeAFYSQHnGRM3UY=; b=AFtimOF3rqirlD3m
	InM/Vy4yl3Eo9+uQN8Li8wURib3geERHcfgPP9k/Ls96x8/uYjHukzkeXBcGa06o
	fiKwTAgPuc6g/ccwJkG7pq3piwfZXHhtNeR7ZaZ6mPldp+7v563nvmDuPbghtj1V
	aV83HXzUhLXXRFlAACoR/ZxNZe+SQu1YLeJrPPNvUSAjCF3ANn3ln+ByyUgEZx/k
	+p9K5l7QkCcp75XoiTdxgphafjHBDBbBssk9CspRj8q1UZr5iL9lKduy1vQ+LpGV
	i6U+Vc3oiORgXSJ4U9+NjKNO2HLpjji+7iZ8htQIpgwCOZD+DR0TMOY7EdmcHZHF
	piJM6Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xfdbk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 14:17:31 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e395107e2so4233711b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 07:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756131450; x=1756736250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PAyYDRJsaYxENoD1H+Eu1JmDIGkAgeAFYSQHnGRM3UY=;
        b=DvMru4QfNae2ZYqV9y//7yELEwBwSz5Roqpuwof2mLx+ijp2mgKAzNK8AWoeFDdcDy
         /c5yW7wa6icE2qaMGMRMhp37U1S6LUzHOWq4Ee70vHEk0pTvnMk+AeJV7AGSfrbhaDLI
         Zjn3os/4WPsEL6/wsjhsBa0VXvRCEW+Dsbw0qloMvHSVNRprS54/8IjZ2H3bW2+GLHgQ
         QcuXsGJBcoogZkvv+9zaHl1Z5zHzPibKsqU8pHMdj/bz7xX2LbHSbYyaj9nFKOnsmrCA
         RIji1pkJrrFrQVyj04RZDVwvVJiZVtdw7Wb4qhLmaYx/L+pstzkUv9LnoPmSR1BAkWkF
         OWag==
X-Gm-Message-State: AOJu0YwC/e9b8jGMEXvxaRfe5+vecmW8izWk4h+Q5AGFgst2AiIjtiqt
	m+uNKQzjZnjtSJgqW4+eOu8K39Dwv4SbH5VYEBV+VrHT3b94ZAuab8BnkNecNnzTYDmYaDosCjN
	+EsLvn2AqeHCpGKrhtbU7bXLx1CerL6iV9f8YOM7W/VrR//aC6DRns2SLnAB5bzAT/vKm
X-Gm-Gg: ASbGnctMLiNy62+NUh1EVxw5EZxkXThcD4FtaksS3EwEMvOsQWfPscszQBpAlRsvvnL
	5Extjrxt2Kt8ogcOB3Gv6Z2Eg7Wg75Mt2givbdkrOY4mNsk8CeAAJeIbvF5lCz0sPICWR+2y7/8
	lRAVMeb9FL+NIO/StLOHKINSVJQNHzjOTfPgKbqgxnUVdhgyw3zVoPlnFq8Y9PNOdecBGUOKhOf
	kjC2CMXEZxsZ0Uuex+M3emuMcjKGk8Q4v6ExTNDAIZPrbeutd9/Vgew6shI29PSAgBzw7hpFdpJ
	xhcNjNzXG7sVLED/RyUVc8zCHiqgv71QHI4HPnRGM0KbZem6VzI4Md6/VnH1RdrzbS5A7Bw=
X-Received: by 2002:a05:6a21:328b:b0:240:27c:fcc6 with SMTP id adf61e73a8af0-24340d72168mr17478411637.42.1756131450088;
        Mon, 25 Aug 2025 07:17:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1nessZyA2NUMM89H1JrLWKePi/2394p08eRkWbRWq2iI3n+M5I1Y5+xYaNlVn6ePDJ2+MlQ==
X-Received: by 2002:a05:6a21:328b:b0:240:27c:fcc6 with SMTP id adf61e73a8af0-24340d72168mr17478356637.42.1756131449523;
        Mon, 25 Aug 2025 07:17:29 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770401eb20dsm7672339b3a.79.2025.08.25.07.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:17:29 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 22:15:51 +0800
Subject: [PATCH v3 05/38] drm/msm/dp: splite msm_dp_ctrl_config_ctrl() into
 link parts and stream parts
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-msm-dp-mst-v3-5-01faacfcdedd@oss.qualcomm.com>
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
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756131419; l=4323;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=xDy9ih89F5xZ4CDJXV+M2TH1QImXV64VcC6JWSBfCEE=;
 b=HW0FUIhch/TGL/hUGl5G89eaxl3x6hc0kAZXKDW69RK9I7wUSBciqoAT8LB2FZMA4r7TMO3ac
 01pCbpqhSTDDtZEvPDPzk85/8vGANoPWg6CEiUr5N+bvhqy54ACMnqy
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfXwK2vhktf8Y8j
 0MJ+mbRbB1HaZhT+f5sI7fpIr1JTRXYUXeJBc5fjOd4RgYGkhBMvnCno9IQauluj6QP38Ysl0t5
 YQ2I/pvk8ZkFUonD1QrQQlUGcU2x5q8CrUhGM1n0OP82x0FL/6EiFe3RVhBpt19Q8bkuvcmFi7b
 Sj0ferPyYfPkY0+80D6UXd53744yyq7c7YmgWTaWyjfOla/KVPaVbh400bMFlfYORW4M1csguOl
 7Bf30BY9lNRDY3f6yOP//Cgf2s+FcIIHLazIcaRW00a5PEdURKwyADRZxzw1/tNekFjuB0uhUqL
 0KpsX6ZPbuQq1EG7ebUxKWgg8tKwXeR/LkHlfY6y7qThVTDrMXYHJYKO3VAy6AIYlwkXybcVW+n
 QKficWOl
X-Proofpoint-GUID: nHpXhXWXujjK3NqXF3AGA3sMlTe8Wjq4
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ac707b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=A4lVjiY8PA1Kidclo-gA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: nHpXhXWXujjK3NqXF3AGA3sMlTe8Wjq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

The DP_CONFIGURATION_CTRL register contains both link-level and
stream-specific fields. Currently, msm_dp_ctrl_config_ctrl() configures
all of them together, which makes it harder to support MST.

This patch separates the configuration into two functions:
- msm_dp_ctrl_config_ctrl_link(): handles link-related fields
- msm_dp_ctrl_config_ctrl_streams(): handles stream-specific fields

It also moves the link-related configuration out of
msm_dp_ctrl_configure_source_params().

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 49 +++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index e1ff4c6bb4f0eed2e1ff931f12ba891cf81feffb..45d6c9a7f7ddaa049443253cbf4c6fc5feda3177 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -380,26 +380,41 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl)
 	drm_dbg_dp(ctrl->drm_dev, "mainlink off\n");
 }
 
-static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
+static void msm_dp_ctrl_config_ctrl_streams(struct msm_dp_ctrl_private *ctrl,
+					    struct msm_dp_panel *msm_dp_panel)
 {
 	u32 config = 0, tbd;
+
+	config = msm_dp_read_link(ctrl, REG_DP_CONFIGURATION_CTRL);
+
+	if (msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420)
+		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
+
+	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
+			msm_dp_panel->msm_dp_mode.bpp);
+
+	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
+
+	if (msm_dp_panel->psr_cap.version)
+		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
+
+	drm_dbg_dp(ctrl->drm_dev, "stream DP_CONFIGURATION_CTRL=0x%x\n", config);
+
+	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
+}
+
+static void msm_dp_ctrl_config_ctrl_link(struct msm_dp_ctrl_private *ctrl)
+{
+	u32 config = 0;
 	const u8 *dpcd = ctrl->panel->dpcd;
 
 	/* Default-> LSCLK DIV: 1/4 LCLK  */
 	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
 
-	if (ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420)
-		config |= DP_CONFIGURATION_CTRL_RGB_YUV; /* YUV420 */
-
 	/* Scrambler reset enable */
 	if (drm_dp_alternate_scrambler_reset_cap(dpcd))
 		config |= DP_CONFIGURATION_CTRL_ASSR;
 
-	tbd = msm_dp_link_get_test_bits_depth(ctrl->link,
-			ctrl->panel->msm_dp_mode.bpp);
-
-	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
-
 	/* Num of Lanes */
 	config |= ((ctrl->link->link_params.num_lanes - 1)
 			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
@@ -413,10 +428,7 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
 	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
 
-	if (ctrl->panel->psr_cap.version)
-		config |= DP_CONFIGURATION_CTRL_SEND_VSC;
-
-	drm_dbg_dp(ctrl->drm_dev, "DP_CONFIGURATION_CTRL=0x%x\n", config);
+	drm_dbg_dp(ctrl->drm_dev, "link DP_CONFIGURATION_CTRL=0x%x\n", config);
 
 	msm_dp_write_link(ctrl, REG_DP_CONFIGURATION_CTRL, config);
 }
@@ -439,10 +451,7 @@ static void msm_dp_ctrl_configure_source_params(struct msm_dp_ctrl_private *ctrl
 {
 	u32 colorimetry_cfg, test_bits_depth, misc_val;
 
-	msm_dp_ctrl_lane_mapping(ctrl);
-	msm_dp_setup_peripheral_flush(ctrl);
-
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_streams(ctrl, ctrl->panel);
 
 	test_bits_depth = msm_dp_link_get_test_bits_depth(ctrl->link, ctrl->panel->msm_dp_mode.bpp);
 	colorimetry_cfg = msm_dp_link_get_colorimetry_config(ctrl->link);
@@ -1614,7 +1623,7 @@ static int msm_dp_ctrl_link_train(struct msm_dp_ctrl_private *ctrl,
 	u8 assr;
 	struct msm_dp_link_info link_info = {0};
 
-	msm_dp_ctrl_config_ctrl(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
 
 	link_info.num_lanes = ctrl->link->link_params.num_lanes;
 	link_info.rate = ctrl->link->link_params.rate;
@@ -2524,6 +2533,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl)
 	 */
 	reinit_completion(&ctrl->video_comp);
 
+	msm_dp_ctrl_lane_mapping(ctrl);
+	msm_dp_setup_peripheral_flush(ctrl);
+	msm_dp_ctrl_config_ctrl_link(ctrl);
+
 	msm_dp_ctrl_configure_source_params(ctrl);
 
 	msm_dp_ctrl_config_msa(ctrl,

-- 
2.34.1


