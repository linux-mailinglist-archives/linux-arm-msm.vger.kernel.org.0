Return-Path: <linux-arm-msm+bounces-72033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594B2B43961
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 12:57:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62FBE7C3480
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Sep 2025 10:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B652FB968;
	Thu,  4 Sep 2025 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdRkPVSa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6362FCBE5
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Sep 2025 10:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756983415; cv=none; b=s+yBb8CGCyWiP7zi10c24c1zKdi2q9bpgOa0bcb26sGA1jZNj3Pf83l+rE75UHzD8hDcVpbaWOQpbOsQiH8Hd/b/zWwCzQE9bRHRU6onvsA9mzR9TRIcwfWwQmloIs9/e2nLcjGTIBkxPnh4lvdonUZdUT0M+7Bt+C/4yx0t5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756983415; c=relaxed/simple;
	bh=cDbUjx0sul7Ld8NAml0P9RB4bTXO2/6aIeTTun2M03c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQpP+zd5AoYmfyYNjSqutWZUZc2LFyKWWM1P/Fi6ZW0ghFaB1QD+PSRf1Wcf3puq7mfzOsm6TSjWfp6QYWAuSJN5uPGLvDFg/zGuh1rXE5rThZbmXEMA0s7fVn+xUIUQ0rOE4Jn7oKfQFWerL8Q4nyYI3kVBKZrRJ5wF+RZ5Sp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdRkPVSa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849XFRR032336
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Sep 2025 10:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p6zH1ji2py6
	p7TMrlf20HqiWhyTErSKTHz4p6GLgtuE=; b=YdRkPVSaX1EPD11Un3N1a0v8BzV
	zzuBOvQZwMYFbyalMbATPBGxiIfA0z0v/4CBNPhT22ASHrKNJ+fw2e1Tdkdoqewa
	oqaX7rRpFJ+aFx5lyWw3SaRX6hdKGtGC/tOYFlxwP3D40GzUEfOu2HrXJ5SKEP5l
	xmIw3OZM0Jxz0C1GxtRWn5BaEh8OmPJ4k24JI7DieqYrGLAWlgK3vB2idpydqhbt
	EwG31Px0aBIBAHWT67JCITfHIZsIiCYHWTJZo3T/WqdnS0A8vyJnc9c0ubZ317s/
	c6Paynbr7y4LjRnz747xqbT3K6yHEklqKyA3BzzuWOzGxEttbQ5Lvy0g3Hg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpfbss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 10:56:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5d5cc0f25so13829521cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Sep 2025 03:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756983412; x=1757588212;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p6zH1ji2py6p7TMrlf20HqiWhyTErSKTHz4p6GLgtuE=;
        b=PfE2xSCz1BN8OpsvX46ZXdIvMYs1hOYbBCKFG/0Z1gaiXplDEv9v+6zjgbsWw5nJ9L
         Uo2c77f3py0NPMmS69dKevdX8ItJB5cafqwT0sEccAk07Grs36VSs4PthlFSQ/18GS3b
         rRbwaxVJ+SJdrbNzZsfR7nl9Q7DYcetrYWFhkxtju7nneMHRmtnodcUXm3F2DZ5ZFDLW
         hajynyOf3v+UIdwVcsklB5H4ZJbAUWasY/vx9jmrhqa8VJZxEXdS995wUQtmsukrMB+g
         9o2QuCCIMpRPWWeFwfO5HYsDlpHYtDQ4ny+mktWeqz5C/GrI3CPeeH40Oz8eaH0qyf+w
         rTeg==
X-Forwarded-Encrypted: i=1; AJvYcCWrzJRa8XAAsBg8Azz3z6MXpy86ba34vtqgXOgv7i53ctA4hsWXKcZW9cGWZTcEJ44v7iwGovkjzB7dcAQZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyeQvglezzcY83c2G/pqoox79Wx2BYqswk8kRhQU82axInQAi9v
	nifLHowm0tEKGcWh4afQkyVcvZdxDqGIUTCF2Wt6lWUzk81W0voZ0SvrgyddBv4ytFsKLUx5YJk
	q8ZbHYmHDO4X1W/F8cZoxOLIPmA57eEKHef/PmDrNULveg8t5oQA9XAsVm5FQl5g1TSB620fWsW
	Hc
X-Gm-Gg: ASbGnct6Hu1cCpinlG0pGs6YQxSN5gHL1tAC2oatJ30YUK9vzqxL7AttxEqjZcZgFAv
	OrYiOe+GGrGeZcH7W92S5ZkKiw7OclY5JRzZ9oIwNAfyZ9ze0rrHIWQbtNlovnORWNZ4fgKiuHb
	+MEg2AQuRZDMDz5Vj+ABXN7x/ORe+uBBj575mfED/qzklwl8kvEyKsUSY5+BpSXXqO5y2lzZLvq
	3sJlC2AsINY8ZzXr1c6r6L/H6zu9wrmX+ft22pEz3CTQ8GP6xc61mqkVH6SbQ2WmN+R3DIdVFBU
	InuQu5i4qSYmva5F46hnrkjh0D4hreIeB1HOrjUHivXkaLySGD9Atg==
X-Received: by 2002:ac8:5786:0:b0:4b4:56b2:5c79 with SMTP id d75a77b69052e-4b456b25f12mr77527411cf.55.1756983412425;
        Thu, 04 Sep 2025 03:56:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVAmaOkeqxxSS+c44mWKZuQbv7AlFSAQvl4Q6yYrKh7XwoOYj94b3r96hztV8VrBImkHgytw==
X-Received: by 2002:ac8:5786:0:b0:4b4:56b2:5c79 with SMTP id d75a77b69052e-4b456b25f12mr77527251cf.55.1756983411972;
        Thu, 04 Sep 2025 03:56:51 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d0a1f807f9sm26462334f8f.38.2025.09.04.03.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 03:56:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: robh@kernel.org, krzk+dt@kernel.org, vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 7/7] soundwire: qcom: adding support for v3.1.0
Date: Thu,  4 Sep 2025 11:56:16 +0100
Message-ID: <20250904105616.39178-8-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250904105616.39178-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9wvunVi1s0mpIU0Rr17OFKmG-eumHRD0
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68b97075 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=2e052FzMMQUWBbw-z-wA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: 9wvunVi1s0mpIU0Rr17OFKmG-eumHRD0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX5jToQySKF8FT
 edrexf974DTY3Aqgn2kP5d0IRiciq6h2dqGdJtvxkqDCCHUsx34vBdwxOFC2Rlmv2ZxRwB8lv0S
 /Qjf2Hk9Lttnl9EMyX2mIrWHZ6xVmxHRp0XUVGL5rhd/sbsdagVDigoY+2mbqyghnTq3mCXruy4
 69XY8wPcBEerBMqrU1VoMQTsALf9tGQjG5dmEChTwf1gIguNdyPSRlqnDJaoM9ah7oiPojDJEzN
 5XCOME/cH65IDQNlrR9sNg3CkU5ChnjPd9TFb2x+6aoBLx/B+7SmrexOWN5QNdsbHnZAmGnTo7t
 /+6lt3c+oz99ORsvu2Bt8PMYndyQhJtfVtLr7mp6kUDoueoY4c3DRWLpPD+xITCvPVNI/9IXu64
 yawcN75h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

Add support for controller version v3.1.0, which has changes in
register layout and some register fields compared to v2.0.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/soundwire/qcom.c | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 3d4d0c443977..a7b6d9ecc3ba 100644
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
@@ -1765,6 +1799,7 @@ static const struct of_device_id qcom_swrm_of_match[] = {
 	{ .compatible = "qcom,soundwire-v1.6.0", .data = &swrm_v1_6_data },
 	{ .compatible = "qcom,soundwire-v1.7.0", .data = &swrm_v1_5_data },
 	{ .compatible = "qcom,soundwire-v2.0.0", .data = &swrm_v2_0_data },
+	{ .compatible = "qcom,soundwire-v3.1.0", .data = &swrm_v3_0_data },
 	{/* sentinel */},
 };
 
-- 
2.50.0


