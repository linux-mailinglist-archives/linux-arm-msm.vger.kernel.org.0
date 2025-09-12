Return-Path: <linux-arm-msm+bounces-73254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96DB5457E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 10:33:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 487A4AA2854
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 08:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C81D26F293;
	Fri, 12 Sep 2025 08:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HveAS/BL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1B727055E
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757665964; cv=none; b=WM+OGcs1B+Yeah7mH9torw6kWpbqVrrkc3DflUPgqxyiK1fnVK/84Z+yLjWeaHxkOHiTzv7EURigmtgNp8Eh5Fm9GJYYiF/rb0bghExqbhkf4EHclMnS3NrVvypfM2MZ7HlkqbRbytXF4lpO1y/GzcqG1jkNHtSNi9mpP4GLBt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757665964; c=relaxed/simple;
	bh=t66MAn3Nwvg/BgkzEKFhUiREcUiVPhCJxUavfb35i20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jSzTXmkgMgPG+O6chmR43hbeLRRZQK/+WxCC6knsq6M2UZKxjYp+WZF2/9oMYPRdUu1ze39gnSfBrDTpYI+D4kO6B+RWQURbBl0EsbrOis8QArf2Lw3Jzeytga3uxq1Ez6doN8Yb/KpVWF1NRSZA/mswfomBx/m+HMJOSd9j8Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HveAS/BL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BNCThj002450
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tE9A84HrisC
	i01MLhVRRDnJjMb3SqJek9fgYZmAL/Is=; b=HveAS/BL1UxPgA3ZICkYhLY6gMS
	QZ8j0J6+BwIKOnKehm0FmeyfJcgSONFGrj/yzAyczZ3OLVBlFM4M7VMbOQPCqPN6
	uZJKZvmtztE9rp797meVPMi2eKJaWVJN7lDpG/oHUm7yM7GlQcfDpSFVgw18g8Ik
	733ZRK5aqGafvx/Bqj4pDsj7tJQe7ETrBVAyNn8QLhgPv1LwXkBoubGD1aT1X6SQ
	2T5uxaZ5avl3pvHDiSJwr5lE1G+TYAosdPd/KoznGhIOBidiTCT4t4y9wBvL0Q2Z
	fGutjmT7rFwWD2CSZmkXFJX0/bGrgxwEEHxUChGMSKn95hsVf2U2zYKrWvQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493ydv30qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 08:32:41 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-7585b6deccaso29794496d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 01:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757665960; x=1758270760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE9A84HrisCi01MLhVRRDnJjMb3SqJek9fgYZmAL/Is=;
        b=Hbcm+URRJRUxJwNkG1R7rWl8GpQmJXP+MzH/4H0dFTUu+VmyelboW9GGJCd/tMjJzV
         v8Bs0aYBGNdycEazANV9S+/NFveE4AjRnMtE/un/9CdKlMeTtJU7OyAy2gBLKnNLmE3R
         QFvpB/Sjc+wY+UkCqomE25f7Fz8HnATsPZHwTZrxSSZNzwas7YlGXpK/Jgyt6/Wyfiux
         R6A3jq6OyN4nxd//uIT2I3LrCuqQpf1lBS0hvPNQuoFb3c/L1olGyW5cGZTjAeGo85Er
         23xoBVoPCMaMh5NXPHTVLeCtGBplc31a2JV5vOqjUz1DGKv278KAIGtxtwxj1T+88Plt
         uDKg==
X-Forwarded-Encrypted: i=1; AJvYcCWEA3x66JJDX734LU21o/SIMNLTy2JvKA+x5MyMK+8URv6tpnlbgYIvdPggRiZ2h6QKR8aDopSMPmylGNq6@vger.kernel.org
X-Gm-Message-State: AOJu0YzERJqTHkweojDVyiOyIM6AcvRMY4loblVSozOd7tQSbHNLj9qq
	Ish2Tjisi2xiT1WPcJJSdEhDGVDjiONd6+/7ST8lqEjUKakYh2GQiSY2ftERag8Yuf+CZuqTI8t
	E7Uyo4Z8AhajEBpBxsWOcytZVJXiLCmCyNUXeuNxk63XYpVOkNj5jL0oAygoh0uaZ49MP
X-Gm-Gg: ASbGncs8hwORdkYYnL0O1UpmHjEa81LNITgC0lrYQ5X/jrP7OdarJoj853Ti4aFol98
	IfDfeGasM02pe8M+sqqbEZygp93evEd/a/dKrY4uaX8UzcPg86Dx2Gb+xdzsFNyorJoAXgkp/5F
	wlMBCR4EYnVzB8ItHJzCQKnBuLMvZgRwGCXQytUVRcGmHkWHZxr2hzhibx6BT7rLSpz0WvF6gNZ
	2esiYZS3k8n6qJEPyH6pF1yCtPCbSOwC9b0JVLUCaPWwPJxc4dw7yh/V6G1r1CVTrgn+CerEizP
	Cs0KpvBQ7tIy5M1OtABjYulQ9L3hvIK71zIUbwNGJWrXPLEGFc8qvw==
X-Received: by 2002:a05:6214:4102:b0:730:df1e:a99d with SMTP id 6a1803df08f44-767bcfa78e3mr24804036d6.17.1757665960298;
        Fri, 12 Sep 2025 01:32:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhdT74E29k2br0fqsuCFK/2Qpd+RB91i3IK7DqDnADWFd8rcV8unpUlG3DNZckWdx7yuUN5w==
X-Received: by 2002:a05:6214:4102:b0:730:df1e:a99d with SMTP id 6a1803df08f44-767bcfa78e3mr24803856d6.17.1757665959871;
        Fri, 12 Sep 2025 01:32:39 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017c1dd3sm31247265e9.2.2025.09.12.01.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 01:32:39 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 7/7] soundwire: qcom: adding support for v3.1.0
Date: Fri, 12 Sep 2025 09:32:25 +0100
Message-ID: <20250912083225.228778-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDEyMCBTYWx0ZWRfX/birGUMG3hKz
 Ic+dnCHYUmgLqbYxGG0X7l2Iwuf2MVXLXbCAo4KEBMXg1Dro3iNXRh8DiMlNr4sAm+oo+/yF9o5
 YFE3AIil411nEUGR8Dm4I/PQ7lXhvKZqRm4ZVUTeQoS30JZui0zhXveC517mLvxheQEvu0czKP5
 woME6YQkyB/LYHnv1+yVI3za21QFmpehryEvfOsqGUE6K+IV/4ybYxkWhlAhihg9IMytCtFeuE/
 TRrRnyHF2hqX1GwPHEHS5lI5BiV4i4Yee8w01WHO4VD+/jn3ul9PLmUBM27obx/vIg5qQCuRiUF
 9eS5cPdUoH+R/FLBMo2zBxJtm63o/HcV7LNW649BL3lkkDqtJPEFr9bTgz2kAujV61VSG9R14f9
 O8Ht9Q53
X-Proofpoint-GUID: 4WYp5lODcsTYs-wc9sCOUj9hTugbjDW6
X-Proofpoint-ORIG-GUID: 4WYp5lODcsTYs-wc9sCOUj9hTugbjDW6
X-Authority-Analysis: v=2.4 cv=LoaSymdc c=1 sm=1 tr=0 ts=68c3daa9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2e052FzMMQUWBbw-z-wA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509110120

Add support for controller version v3.1.0, which has changes in
register layout and some register fields compared to v2.0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 5baf831f49ab..17afc5aa8b44 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -31,6 +31,7 @@
 #define SWRM_VERSION_1_5_1					0x01050001
 #define SWRM_VERSION_1_7_0					0x01070000
 #define SWRM_VERSION_2_0_0					0x02000000
+#define SWRM_VERSION_3_1_0					0x03010000
 #define SWRM_COMP_HW_VERSION					0x00
 #define SWRM_COMP_CFG_ADDR					0x04
 #define SWRM_COMP_CFG_IRQ_LEVEL_OR_PULSE_MSK			BIT(1)
@@ -40,6 +41,9 @@
 #define SWRM_COMP_PARAMS_RD_FIFO_DEPTH				GENMASK(19, 15)
 #define SWRM_COMP_PARAMS_DOUT_PORTS_MASK			GENMASK(4, 0)
 #define SWRM_COMP_PARAMS_DIN_PORTS_MASK				GENMASK(9, 5)
+#define SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH			GENMASK(17, 10)
+#define SWRM_V3_COMP_PARAMS_RD_FIFO_DEPTH			GENMASK(23, 18)
+
 #define SWRM_COMP_MASTER_ID					0x104
 #define SWRM_V1_3_INTERRUPT_STATUS				0x200
 #define SWRM_V2_0_INTERRUPT_STATUS				0x5000
@@ -296,6 +300,32 @@ static const struct qcom_swrm_data swrm_v2_0_data = {
 	.reg_layout = swrm_v2_0_reg_layout,
 };
 
+static const unsigned int swrm_v3_0_reg_layout[] = {
+	[SWRM_REG_FRAME_GEN_ENABLED] = SWRM_V2_0_LINK_STATUS,
+	[SWRM_REG_INTERRUPT_STATUS] = SWRM_V2_0_INTERRUPT_STATUS,
+	[SWRM_REG_INTERRUPT_MASK_ADDR] = 0, /* Not present */
+	[SWRM_REG_INTERRUPT_CLEAR] = SWRM_V2_0_INTERRUPT_CLEAR,
+	[SWRM_REG_INTERRUPT_CPU_EN] = SWRM_V2_0_INTERRUPT_CPU_EN,
+	[SWRM_REG_CMD_FIFO_WR_CMD] = SWRM_V2_0_CMD_FIFO_WR_CMD,
+	[SWRM_REG_CMD_FIFO_RD_CMD] = SWRM_V2_0_CMD_FIFO_RD_CMD,
+	[SWRM_REG_CMD_FIFO_STATUS] = SWRM_V2_0_CMD_FIFO_STATUS,
+	[SWRM_REG_CMD_FIFO_RD_FIFO_ADDR] = SWRM_V2_0_CMD_FIFO_RD_FIFO_ADDR,
+	[SWRM_OFFSET_DP_PORT_CTRL_BANK]		= 0x1224,
+	[SWRM_OFFSET_DP_PORT_CTRL_2_BANK]	= 0x1228,
+	[SWRM_OFFSET_DP_BLOCK_CTRL_1]		= 0x122c,
+	[SWRM_OFFSET_DP_BLOCK_CTRL2_BANK]	= 0x1230,
+	[SWRM_OFFSET_DP_PORT_HCTRL_BANK]	= 0x1234,
+	[SWRM_OFFSET_DP_BLOCK_CTRL3_BANK]	= 0x1238,
+	[SWRM_OFFSET_DP_SAMPLECTRL2_BANK]	= 0x123c,
+};
+
+static const struct qcom_swrm_data swrm_v3_0_data = {
+	.default_rows = 50,
+	.default_cols = 16,
+	.sw_clk_gate_required = true,
+	.max_reg = SWR_V2_0_MSTR_MAX_REG_ADDR,
+	.reg_layout = swrm_v3_0_reg_layout,
+};
 #define to_qcom_sdw(b)	container_of(b, struct qcom_swrm_ctrl, bus)
 
 static int qcom_swrm_ahb_reg_read(struct qcom_swrm_ctrl *ctrl, int reg,
@@ -919,7 +949,11 @@ static int qcom_swrm_init(struct qcom_swrm_ctrl *ctrl)
 	swrm_wait_for_frame_gen_enabled(ctrl);
 	ctrl->slave_status = 0;
 	ctrl->reg_read(ctrl, SWRM_COMP_PARAMS, &val);
-	ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
+
+	if (ctrl->version >= SWRM_VERSION_3_1_0)
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_V3_COMP_PARAMS_WR_FIFO_DEPTH, val);
+	else
+		ctrl->wr_fifo_depth = FIELD_GET(SWRM_COMP_PARAMS_WR_FIFO_DEPTH, val);
 
 	return 0;
 }
@@ -1785,6 +1819,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
 	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
 	{ .compatible = "qcom,soundwire-v2.0.0", .data = &swrm_v2_0_data },
+	{ .compatible = "qcom,soundwire-v3.1.0", .data = &swrm_v3_0_data },
 	{/* sentinel */},
 };
 
-- 
2.50.0


