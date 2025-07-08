Return-Path: <linux-arm-msm+bounces-63996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B1559AFC5C3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 10:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 688921884EEF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 08:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BADEF2BEC3F;
	Tue,  8 Jul 2025 08:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O/8vnXKR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2663E2BEC31
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jul 2025 08:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751963560; cv=none; b=c3Q+INSzoVxp8cNEUmaJ43c9ulVgE4Xk8AsrRy6iyGbVtG85xH28liCcsGTFOuIWVAWs9+Nxh6DOAv2jqGQGORHtCpd8DBeCop5MVNyf0AFH1DIXX5Rc2X5ZXXCgbeiKC9zcEzx3chzn18LCUgOOI4Pm6jC8ui/FJR2Xic9Vecs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751963560; c=relaxed/simple;
	bh=sy7etJvp40+QN1X3+XD1Dp8MZZyvRF5vVAH/CZcE3wE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VOmEvPI8A/SqjeiSPqLMk3Af3ByohaEuqeLxQ79HGqCMEbbZdfiDJ4EK8/LFXeBqmBVmEmrEwQzKHSmJ2NnIwOopS7+mRyyUlZgSPLA7KUIbn0TkZER6NuFH9JAV+G4LBt1H0zOnQp76+o9nSv7XQqaLsPXlffZEknnQHHphSr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O/8vnXKR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5687mVlM026118
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Jul 2025 08:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gxypdv/U/yE
	GEYqfSc5KaSCh1BNkteGVz6FdJmGRaQA=; b=O/8vnXKRHSzkaQhTTBiAKiEDtRA
	GmuLHJ6kgT4U/AzJcXFzv65asaQ9qcqSwEjfPF/J6FBotDl6HQWEsH4Blt6mWtZT
	7ZN4AHZM7NI27h/V8KrPFSMBve7KpyTD66whi8j9ThGuUmbpkpbEqGcob4IDkwAV
	vBhh3rMbP1ElMyPcnXjO9VzVZXdMG1emx0RDrSr3uYvFGp6n9jVXlPf+RUNnwYFS
	VcfPECJfqgyYrM1wrIQ8S0x4Du95PH9GvB0p931OM0EUaHeWsJTRFhMgialdwGBK
	oTN3WXdxp2az9xugoyxV/P9Biad1/oHEsOpR8Jk9PNhNo9vltuZa1vs99UQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pv97kk1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 08:32:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d446ce0548so678235085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jul 2025 01:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751963555; x=1752568355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxypdv/U/yEGEYqfSc5KaSCh1BNkteGVz6FdJmGRaQA=;
        b=k/0Pp/VoegYkE/oaEHIZXbmMn3bs60Ey5EZ6nUGBdoio6xIYQw3XPAAH0LOQrt6FfM
         NC7IrW6N1zlLPuo5ME7fma357muPJPpafVE5hxTv9unDc2HfsiyvVD4BVmweE7gq487k
         2SZiHiV6l7TrKnyImoW3mFfXCPygs5zw45zE7C/K0NUzgvJzd+JQ8dBnyNE4sJlePq5F
         1Qw3DAOD1R62SQZd/AGjb7TfxHIF1KyUQIRNzjm/HE7EttcGywJudilh/C3kZdIgolkJ
         LI7Cz6PQUnlCp9uPBVUxYIOuvg65y4EWQvqFsvvWFPz8wtV9u1E+HsCk68TXNF05GSvQ
         cqOg==
X-Gm-Message-State: AOJu0YxFhTUFJmWuiL18pB0bXLQx9uqgXPt98SfAeiVN4m6FrNktVMLM
	jmIeiBsMtA7sx6ktNMUrBrz5T7dT6VYkxX39NlOl0hoMPG+1b5r72FFGBlgJ5gZ4bEDryDtbp8E
	Ntk8Ho7S3hXvtGpbm14nDSV2Uf8onIPKCUVuW5aLsHc47e8NGi2KEVpGOgjaL+riX3KM6
X-Gm-Gg: ASbGncuWcc2JC/qHTnjTAv7PZwHtHQ+Ljj6kL0HGSqA0PajW/+khu+Xh3bA8gorgYb6
	79zD7tBu5oVos4oU5ZWjR9u5HqW06G1SNnOuD2mlTZ05vX1k9oa/4PWy0Sro9iVkUy37qysmdjW
	bWvZQIhurOGfvH1HNews0i1Qq4S272WDKKuwmXoF/70PXeZvN6Jm5uLMz4a7QLSOwi1hnHYoy8V
	NEdPw5iLd2p+dxKbq365M9FFXxBiryLUWqQyHMpHBFcHzQmtxHbHmNKLTTSS1T3IhHrL8y8P7rt
	w4injJpX9BkIzg9cIZ3Ou6TkD7mGIlDqySY3byt/ZpeSVk2hrNitXAoC1w==
X-Received: by 2002:a05:620a:31aa:b0:7d4:5fc5:807c with SMTP id af79cd13be357-7d5df1031bamr2125058785a.5.1751963555017;
        Tue, 08 Jul 2025 01:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYAyWsVH7r5rlHcbI+OVZ/mFvOXASc4NeR4Xre/0WnNuIfZEfU2XXz5X/IWLi2lUGsijDOWg==
X-Received: by 2002:a05:620a:31aa:b0:7d4:5fc5:807c with SMTP id af79cd13be357-7d5df1031bamr2125054685a.5.1751963554529;
        Tue, 08 Jul 2025 01:32:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:953b:906f:73bc:cc41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0959sm12315812f8f.27.2025.07.08.01.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 01:32:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 4/6] media: qcom: camss: add support for QCM2290 camss
Date: Tue,  8 Jul 2025 10:32:20 +0200
Message-Id: <20250708083222.1020-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
References: <20250708083222.1020-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FrUF/3rq c=1 sm=1 tr=0 ts=686cd7a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=c8dJUS_lH9wIvx9YmlQA:9
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDA2OCBTYWx0ZWRfX4MD+v4jdf6Nm
 qZM5/J9hJ4Eg4FX14Ws0A1V4MnQSdC3nUwl6C3VxiSxJjhaVL5LEz1STWRSgo1B7KGWlXwsVdRa
 8I1AddHinYInLAlfjIt6yQ45pOpex7c8OrY8Dn5l5SS0qFSWy0xQt4RKLCmkY3MSHKqZmhJKZGx
 iCBBiA9fWms19X8S26Nok8CA+41mX4MFI2o6nuCSCZFbxdFbQ/FH2nvU1CsQ/jhcrX2HZqtZmP7
 DxHECX1RBZr648okpCGoF8SoERlbxU0UnhyaYnBTezHQp/YWFdIcxDY5lMHk4basWgCR7/zLSH3
 Cvv6Wb8ovqtJxGFeVA5VwY9aNCUgqgcwS/yF9w6yovDLaf+FgyWntsFhNuzNh13k+ii/TMLY5dW
 OCYAW8CtNB3zEE2Ca852P//TGJASm9D6K/gWtfdZ6lT3x/d/GTebl5KREOMMgNmGQgcFLv0c
X-Proofpoint-GUID: CCw4FKM_Pqmpl6Sbk4xk_uI5M0VqFsID
X-Proofpoint-ORIG-GUID: CCw4FKM_Pqmpl6Sbk4xk_uI5M0VqFsID
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_02,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507080068

The camera subsystem for QCM2290 which is based on Spectra 340.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 148 ++++++++++++++++++
 2 files changed, 150 insertions(+)

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
index 06f42875702f..6d5b954b08c7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -515,6 +515,140 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
 	}
 };
 
+static const struct camss_subdev_resources csiphy_res_2290[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
+		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 240000000, 341330000, 384000000 },
+				{ 100000000, 200000000, 268800000 }  },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+
+	/* CSIPHY1 */
+	{
+		.regulators = { "vdd-csiphy-1p2", "vdd-csiphy-1p8" },
+		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 240000000, 341330000, 384000000 },
+				{ 100000000, 200000000, 268800000 }  },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
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
+		.icc_bw_tbl.peak = 3000000,
+	},
+	{
+		.name = "sf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 3000000,
+	},
+};
+
 static const struct camss_subdev_resources csiphy_res_660[] = {
 	/* CSIPHY0 */
 	{
@@ -3753,6 +3887,19 @@ static const struct camss_resources msm8996_resources = {
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
@@ -3865,6 +4012,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,qcm2290-camss", .data = &qcm2290_resources },
 	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
-- 
2.34.1


