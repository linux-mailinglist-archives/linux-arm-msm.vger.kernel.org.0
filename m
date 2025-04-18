Return-Path: <linux-arm-msm+bounces-54755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F1FA93861
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 16:12:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C552A7B3BAF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 14:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F161A15A856;
	Fri, 18 Apr 2025 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkbPlOxc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6FE15624B
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 14:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744985526; cv=none; b=K015psuAkCSzlf4Gzy30XHh2APgd2kHGZZPOBJ0UIAHUOp5Y0/lsjBjAh+6yITJ2u3v4oddS0AFIlrWC7weeiV2w3A7PVU35YGGnyQHAs8S7JVQnzfNnj0UBikXBSWiWghOti7f9/RKxLDQntiCsdJji/znoMHlPTtKQPwXLVLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744985526; c=relaxed/simple;
	bh=X+alFMRpOfesOk/IJi5wo30ja91IZAsoaus9JZDGqQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WOH7YJFfP3kg63JsfqBP5Wey+5kCmqY9unUotLkqLhGVETJbObAXoICyb1D8Nxfl5bLbjFcWOx4QOWpBhAeEsu79lZv1iCivBIjU5fnnQNb6LaoOjBs4smnx2SrJ44ENp55NQiBh0qOXAjcC7tnjlBgyrFZGK4qw85FBMIsgTCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkbPlOxc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53I22Qn3014927
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 14:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LKuqsPzAXCz
	FWePIoEgomsLN2CbaF43dCIi9kkExK8E=; b=YkbPlOxcxQNcghtPXz+rRbLO5fE
	KOYQXbdMCIEkMGfdZswULtSuWtSJyZCLxXP39zw4SiWZl9qtPvpbA5ZD+mM2Hw7k
	3kcWCvZLyIs45A5bU/c8Es8l6YTWFYuuxxDopCPPhxpuoOSAcDjBD5g+BQl+oD4d
	BwcBzTl7P97leYSO1tEU8ySvz9VzR0FWYFVl/WgGG2lz1uzLfEGxDUhoXOnIrVFD
	hUVfSwrkstt6K5VXM5BKwPifoJ/NuZ7oT4j0XvxG0wZV2kK3snEkzBicUJ3i8txx
	ahi20brVkQ/mJQCCZqP+xGchIIS5UNnGH8sMJekGT/e53i/qAnp+B3IBPDw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6t7e7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 14:12:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c0a3ff7e81so326651985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 07:12:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744985523; x=1745590323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKuqsPzAXCzFWePIoEgomsLN2CbaF43dCIi9kkExK8E=;
        b=ApMcUKsroHBOrYUyj371wumuvvJHbzwbsclRoH+DVdY9CVh5AhkG4BsQihjN3DP7Uh
         rA/xi3J5/caSI2vWfwhmpUlFk0i4qIwHVcjrYcC+VzO4w9CadCiNFhmKRmY5gY+jHF8o
         DPPWdfD6E4gtZ19dCEOCi3azD+6Rb5mPgvGp66auUYp6JcFlahPOwlKlv1OeHQRJgJER
         AmNmZhdt/BZu+yQriPGo12JhRUp2BRQCVw2E+2o17j3GhewsFe63ayf31Fs8erGhHsS3
         9kyLdSWwa8ZnRPEZmnTgibwN8YTb5K8flozGT+OuHEO+WLA4L6BmZV/igSVsDPUXfkD4
         E9KQ==
X-Gm-Message-State: AOJu0YxJb7zryu3nMapAAmr5/Sqe4US3reCDp2LGnmwfqvhQxiVFOvxK
	KZBha6+MZxq7UiTioZLleC5d9GFjzRd5x0uJWgPTrSDMInvIb8AMIdf5BJliWJMDKTvYTaGuBvu
	EztlOuT2TPSKRDxR8lRzVW/T6z5ZqtufL1mYdCJBDvT/nXn6ggvIx4mintt/MAKQ3
X-Gm-Gg: ASbGnct3Wt4LlQ0aaOeiYCTPmZR0XcjX1HGcCn+XWYwb8+PNR3UE0JtECvCNX5JOTlS
	xIHcuXrTzoUiig67z44OW5Zoq+6rxW117js72CU1YhaDFw0m53WWXEJ8FQztDqQGd0rArYoWllg
	v8/Q6kFyuuEbS2p+WmAsoVNkJStfUXYy0esHx2eQeLJgAu4DVjfem11vIJw0dPKDpir8K0sQCEq
	PCSQNLIcG5LkHUYSjPgNZE+Hg0PUNRP1d9U8oFczBNn1cqGO53mVIB9Gj7GGO+4CrwUCz68m0rV
	c48xGG/8rOCcFrlZH3nLpq9RjleqAkhfeL7smq6cV9CGlUU=
X-Received: by 2002:a05:620a:2993:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c92806051dmr456158885a.52.1744985523054;
        Fri, 18 Apr 2025 07:12:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG80oWMvmHwZG1LN+V1tDoiKUaXIOH0BlEMmKvvTCdpBWTLcvyreJDH4ep21FMxJd7WadSWDQ==
X-Received: by 2002:a05:620a:2993:b0:7c5:5a51:d2c0 with SMTP id af79cd13be357-7c92806051dmr456155685a.52.1744985522686;
        Fri, 18 Apr 2025 07:12:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:2dd5:219d:5008:1bec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm81172835e9.1.2025.04.18.07.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:12:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        andersson@kernel.org, krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 4/6] media: qcom: camss: add support for QCM2290 camss
Date: Fri, 18 Apr 2025 16:11:45 +0200
Message-Id: <20250418141147.205179-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
References: <20250418141147.205179-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: otrDFjjywjGYSHRMlH3ELCCFmkcw85uq
X-Proofpoint-GUID: otrDFjjywjGYSHRMlH3ELCCFmkcw85uq
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=68025db4 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10 a=QcRrIoSkKhIA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=c8dJUS_lH9wIvx9YmlQA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_05,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180105

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
index 06f42875702f..64f263b8065c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -515,6 +515,140 @@ static const struct camss_subdev_resources vfe_res_8x96[] = {
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
+			.id = 0,
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


