Return-Path: <linux-arm-msm+bounces-54499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 618DBA8B89F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 14:14:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB1893A4A2D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 12:11:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DAA92472AF;
	Wed, 16 Apr 2025 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lSoVWQWM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6508724C068
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805364; cv=none; b=Y5eIN1nD3flwm5D8B3HNxEiEzhSJngvETCsR01hfUhPgBSZOtrQN7uQlA78n3CvAxnYCnaF1OV9vX5LsVEV7rP4cd5+Jaz60pdxENA0cmR2Rp3hrr9Qao3wfVljGdQCaqMLdvc6ERSUqJb/FUkpI5XXcmEgHqLidzRVQXKh7Dr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805364; c=relaxed/simple;
	bh=NPVt5Eh4Sxu8Ws6J9AGsZ3lKsahEbFRxLpruWStJmUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dtSP1g4W3YjPDntonJGsbZ6Z9C6+2sNRMhepCKEkIXgAO/bekPZeNQDiGF/L3D5ltJ0mbK4ZViibajuZhclF2TRIBZWjUj9LRSu/lv3xmb3atC33b+j42O6GRQlEjMM0cUTIqqeN1vIdDhQijT8ucTsIL8WeLrBV69dvJny9V0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lSoVWQWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mGIW007041
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bWGiRxcgZ25
	rVa8O+VrLYX4RCWMiG+80+yHZX4iCUnY=; b=lSoVWQWMD5mqTlwdR96uxcMAHpl
	ZUKOXKNHUBcK4feyLUhOzMCyOTz5XHFahl/Bq5yZ8G2lE3xtaqfUF8j6XDNTvdCh
	QV4z4l9hRzRnDwIg5fEQpJp1anZfrORGfI05bUQeJTe7Win0g2laBp1R7C7aFMVy
	F9lrQTVuNOMEcIe+EEplkWrwXKb92q5taTBzt0u+nVvlGm7xPcC3Dk0krX+2H0l2
	1Hwj0K1qHWmo5gHO1wJHDq/7lCZ6dIRNdDt4LyipzqYJC6PI2c2kHJS2WB+NsBHq
	+HK9bIeEwc2D5sHfW0M+jS915sYDlBnPqLCU97WiBaIt2jVs7t5kdh1U0tA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjkchw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 12:09:21 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3f684f66583so1943832b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 05:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744805360; x=1745410160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bWGiRxcgZ25rVa8O+VrLYX4RCWMiG+80+yHZX4iCUnY=;
        b=A/A26lsTuOzKvYU2jMK1sczKaSWIIJP0YdCo6vKHwNOwXq0HJO/kMlx/in/I82mZUg
         ulFb3iRvp+EH55BjbaGvatY4CWRMCHD8dbvM0WhLCSQBCWzDLWgrlBm0XZCOqAgxSQpo
         RWtYJM2Si2P3fjPLnBUlVj2XTjlHqHsjDJbF92LQbYYXxD/UKCSI9Xs1wUWzij96Bmpd
         xzB2TBDJ51WjyQ0xfshTJTbJvG9KT2hSBLpWRZO6z36CfumxoFG/YWo6+/BX8D+s560X
         z52aXjIgDV1EwdQ6KQNSH++ul8aB/WXO19FUqghRjVhMPxMljGUi11GsL8xI9LTi90bt
         cNqg==
X-Gm-Message-State: AOJu0YzjGeyGbhKWtQelxr66SrDTm6vCjV+aDUhhPtjA4c3NmQ7YG9ur
	WBgAQGzOywt12ILEgFdge/mbkFiobqtecmNRDLyuhSzyMHH0b3vyHWNemmMFLf4ijmE/NAPAx+b
	oVAZ7B1IiEurIraYHtFI3FgRpNgs4FIII8vL6bxvHoOhYy3D6AnUFBn3+kq1lOCM8tdQbySsx
X-Gm-Gg: ASbGnculZfvpaJ5PAN674gR+V7mAYOeZ/R6XomYaWJ6KRppw2JWwcnuvGGUasBs4ISb
	A+lmYdTs3+rxTV3T9zrUU2UlW5rkK6/n3ggXaldkXbs5OtS7ks8Y48CSH4hko1AW5ycBHt95tpw
	nE1T8U60hgyv4NzK7llIahZa0KZEoVXfYwhsCQKgTTrbWQDHqFm010wwSINNswf3pombn80E0L1
	JZ3Bxs2/2Zkr7K+j6lF+xOtW1dZbLh9YxWD2uO5HNBhXustHhf261PFlBpITQxZgawqKvG0K6iD
	KQgqeZTgzU3DFljj8CWIVQHHFoIK8i/cAtgtZ3kbsJ3lsd4=
X-Received: by 2002:a05:6808:220f:b0:3f6:e059:40b2 with SMTP id 5614622812f47-400b0217609mr963748b6e.27.1744805360189;
        Wed, 16 Apr 2025 05:09:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERkhJLDuDjh221NQaFSFVJW/EglXsgM8zuZ1aXTPm3pwFvSY22ltbiULU+wSVMldsT2p30UQ==
X-Received: by 2002:a05:6808:220f:b0:3f6:e059:40b2 with SMTP id 5614622812f47-400b0217609mr963724b6e.27.1744805359864;
        Wed, 16 Apr 2025 05:09:19 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:15e4:d866:eb53:4185])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36f068968sm8328669a12.35.2025.04.16.05.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 05:09:19 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 4/6] media: qcom: camss: add support for QCM2290 camss
Date: Wed, 16 Apr 2025 14:09:06 +0200
Message-Id: <20250416120908.206873-4-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
References: <20250416120908.206873-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8K1QCKNbGZ_bYJ4VwBglYPEhPf79b7yN
X-Proofpoint-ORIG-GUID: 8K1QCKNbGZ_bYJ4VwBglYPEhPf79b7yN
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67ff9df1 cx=c_pps a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=c8dJUS_lH9wIvx9YmlQA:9 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160099

The camera subsystem for QCM2290 which is based on Spectra 340.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 146 ++++++++++++++++++
 2 files changed, 148 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 4bca6c3abaff..c575c9767492 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -340,6 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		}
 		break;
 	case CAMSS_660:
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
@@ -1969,6 +1970,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 06f42875702f..1e0eb2a650a3 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -515,6 +515,138 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_2290[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 240000000, 341330000, 384000000 },
+				{ 100000000, 200000000, 268800000 }  },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 240000000, 341330000, 384000000 },
+				{ 100000000, 200000000, 268800000 }  },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	}
+};
+
+static const struct camss_subdev_resources csid_res_2290[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 192000000, 240000000, 384000000, 426400000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.hw_ops = &csid_ops_340,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 192000000, 240000000, 384000000, 426400000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.hw_ops = &csid_ops_340,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	}
+};
+
+static const struct camss_subdev_resources vfe_res_2290[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+				{ 0 },
+				{ 0 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 4,
+			.hw_ops = &vfe_ops_340,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 0 },
+				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+				{ 0 },
+				{ 0 }, },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 4,
+			.hw_ops = &vfe_ops_340,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_2290[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_660[] = {
 	/* CSIPHY0 */
 	{
@@ -3753,6 +3885,19 @@ static const struct camss_resources msm8996_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources qcm2290_resources = {
+	.version = CAMSS_2290,
+	.csiphy_res = csiphy_res_2290,
+	.csid_res = csid_res_2290,
+	.vfe_res = vfe_res_2290,
+	.icc_res = icc_res_2290,
+	.icc_path_num = ARRAY_SIZE(icc_res_2290),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_2290),
+	.csid_num = ARRAY_SIZE(csid_res_2290),
+	.vfe_num = ARRAY_SIZE(vfe_res_2290),
+	.link_entities = camss_link_entities
+};
+
 static const struct camss_resources sdm660_resources = {
 	.version = CAMSS_660,
 	.csiphy_res = csiphy_res_660,
@@ -3865,6 +4010,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,qcm2290-camss", .data = &qcm2290_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
-- 
2.34.1


