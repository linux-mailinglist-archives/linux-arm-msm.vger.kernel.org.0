Return-Path: <linux-arm-msm+bounces-63670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7D0AF8B6F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 10:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EBA6C4A1569
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jul 2025 08:27:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C7342FD872;
	Fri,  4 Jul 2025 08:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aETx4hfp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759EB2FD5AE
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Jul 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616954; cv=none; b=esK/GqdkvotGJx+uLNRPj2+MIfbRatum9WCiFyjJiLyBfTa3YGnUlQ0R1ED9uUJK8blCNbd9ARW0znhDW0TwtXABn0jRX28cZOPOKfJIYoa6W7yLjzVInMJvAqwZuDzzmmIkIMetiUgS5Oaiq4MU7t1Mu8FPzyfYhMWA6OMdgGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616954; c=relaxed/simple;
	bh=sy7etJvp40+QN1X3+XD1Dp8MZZyvRF5vVAH/CZcE3wE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OvqMsbvqDwwB4IsVEFeTTc5cqtHbup2YnQPTBtT3lF2ujE82Dhuh9f2uVocTt8tJ+LApVMEaqU+ORc0Qdp1oGojEK18/kPpVy6EzPUpEBR6uRENSmRdXyA1Uwl9rVXsyNSbeE6j9IXcIsaGKSJawJmkqPgsYj+uayA4Zmmwiu58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aETx4hfp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5647xBVR029572
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Jul 2025 08:15:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Gxypdv/U/yE
	GEYqfSc5KaSCh1BNkteGVz6FdJmGRaQA=; b=aETx4hfpVL0ZNrTEYpB7RgT53hp
	q1z3tHXZ4enibFR6oAtQrvteQSE3RXSzVA3s2e+yPzzC9umodbFeODEvaM+nw1WF
	FVfxhIN0v1TbwdKsTgb6YSZgCm7P+6iV6NKszi+hqh9pydleNHW+NxVqndaI8C0Z
	LdeVbHeBYlKIbNV+YLeHX7nbkqtmXFqiDWnBslnsrRZ8fRUOPWnW+CeRONt9ai3o
	93WQQeLgbmoBDWtjeSyqofVzXNC9TEsNRg3R92Ik5p9I1jBkvyR/PWUVX+X7PunM
	9LpTy4FQ8BCHTIYteRn/ct0eXrHjsERKMVRpZ9acADboK0Mb729U7cx/NgA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47nh9s4fe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 08:15:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d399065d55so83497485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Jul 2025 01:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616950; x=1752221750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxypdv/U/yEGEYqfSc5KaSCh1BNkteGVz6FdJmGRaQA=;
        b=HN89k0QWNEGWSlu+zgzMc54Q5dXh3VtrtGhAz6qgcTzuA2uzxEDBjlv4uxkxi1Fx1y
         2EcC8WW7oEbpMBOH0VTy03SLtBo5aECvTZTcTEPvmnAfpBELW+GJQ+p8YgYfiRHh0uSM
         i1ILhx8B9UKnQL4aGa+RQ5W761vnKUu+GjNjmky0H64oSrQZlfvrPQtpXdp2wTRMzn4p
         0sIIZRIYrbGIiYkFpxxwbXkBrXUZcoybgFUJh8sYBrAU670A4NyIEiIGamc4/+fUF+bU
         OHZyPMM4Xvfq/TzjyOYX4SQYMUYo11NNEjAAoCe0yVhDYxqb9YbhChxKRW+H2x3hnQJ+
         6ZUA==
X-Gm-Message-State: AOJu0Yxfs6zV8v57HwQduUTgHQ1hLWW0475tV85yE9Eq7aRzXzdY8HrM
	tjzxDhg+o57C7lbypLJo+7OcnqomK7VvxgR5bI2JDM77f0wFHp9VaAV7oWygPhyLhnTsI4kX4g8
	8jPNRRa52FylIQ6kZQ9fYxHxcwIFVYNEPQs9GXu+HINhSnuN2r9rp7KT0nJf1O4xbjT+w
X-Gm-Gg: ASbGncv/Z7cnCW98eqsDT5dIyt2OWcf08u8VKDr839z7keekAK+9oVo82TUg+dka9Ry
	lIXEum2R+hv/vIjBcHc8E44p5g9UHHUevIYk3ozBafiXPljQEPIxZ3Uzi3AtWlpEvyPPGWj94lM
	+cCAzctHym6aBUWrICw6h2b2HJ6ZgoNYn1uyWdJtUO7fO/Lt9W2uZIxiMuMoDBUOba7oKFB9zbL
	eqEu1+vx3IrCyqOe7BXXT98sk7jVe/VamswVZ+JJpDkoMzhhBEiQFBFy0SxK8++j8qKBsAVyN2h
	pg08mzFVdoTdTpzD29laF4BtyhELBAzwAq43wBE6PnaxdElpmLXV9gD/rw==
X-Received: by 2002:a05:620a:24d6:b0:7d3:ed4d:44ca with SMTP id af79cd13be357-7d5ddb1cda4mr228638785a.2.1751616949639;
        Fri, 04 Jul 2025 01:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHME8Y9iUvRS5npKty8GDF56gtVMuYr31YaHnLQQ6F1/9c4y7rEu6QkQa64xj6uqVmhGIt1A==
X-Received: by 2002:a05:620a:24d6:b0:7d3:ed4d:44ca with SMTP id af79cd13be357-7d5ddb1cda4mr228635285a.2.1751616949127;
        Fri, 04 Jul 2025 01:15:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:e0ed:c3b0:c674:7c4b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9989fcesm47991835e9.16.2025.07.04.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 01:15:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org, rfoss@kernel.org, konradybcio@kernel.org,
        krzk+dt@kernel.org, robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v5 4/6] media: qcom: camss: add support for QCM2290 camss
Date: Fri,  4 Jul 2025 10:15:35 +0200
Message-Id: <20250704081537.1716613-5-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
References: <20250704081537.1716613-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=frrcZE4f c=1 sm=1 tr=0 ts=68678db7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=c8dJUS_lH9wIvx9YmlQA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NCBTYWx0ZWRfX47HtNbGri0eq
 MDNFwVzKXrwnjuErNskRu2GTvmo582H/VF5oRkaDhy1aZiQGU6yNtAKCB2EWrEPQWRUgJhYaNmw
 gckQy/DXdK86R+Bc5lAjeklx7lisJaWW8hE2c07sikX+M4EAI4peuuIG7bWEVPUHnmu3G6gfUpe
 dABMvE2SyMnKW/Tqw1lW8MoiKjyg26OJnETxGCrHGedmm69bwhnvAlaMdKLwtqLCGkMy9mky+Up
 Srh39RYu6gkonu9qxn6oPysdJumMgCDtA4ZJJAqcGfC8NDbF51CqTGp1iP7/bRViU/lvsI4YkZn
 qwGKjRoe0MUJnGNN8VGC9CGNTW3Tbt5zO2f9ALSevudTI/oxjnjfqQQUiVEVPX6Gsa/iZxF7al+
 WOC6ZfnBfcjhPWLrHKCFNX0jZxAJZZijDuRRztIotPZycU8yGOcv3jgJU9OEYp/m60fWfoLq
X-Proofpoint-GUID: YgK9cdtiw18l4E1BuWnYfX97_jdxtBg7
X-Proofpoint-ORIG-GUID: YgK9cdtiw18l4E1BuWnYfX97_jdxtBg7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040064

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


