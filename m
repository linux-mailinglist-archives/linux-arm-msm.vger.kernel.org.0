Return-Path: <linux-arm-msm+bounces-34112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E2C99A5F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 16:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06D50B25F68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 14:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B94621BAEF;
	Fri, 11 Oct 2024 14:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hcx4ElHx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4480521BAE2;
	Fri, 11 Oct 2024 14:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728655844; cv=none; b=rPrluH2/dsxslrBFAVWs7kbs9a7bq1CvnpuNIQmpvixtcEGIOTsZeAmFmy32kMC8VqnmOYnnjQH4sjJ4ygW4Ghbg1hLaY9mnH1iTALLj24hTO7cVDTjhetxDf5VgMn+VlIfXK4ula1m1AVWKd/1L9cHJZm2dgmYe7/kWN0gP6bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728655844; c=relaxed/simple;
	bh=idlpYR6OsfrhEm2KlVebNQDbi8T93mOwk+NzOlv0+3o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UKcTA24XVuAAKcsHUdWyqM0GX2GZLnzyg7rQ3pe13te+m6jLQEeUC1kPTtxXL3zAcAhKkUYO3btwxgIiqVCDlSGIWTmfSm3dzyCE54dfKCN6F6rfEh+Qtp+rmWIGBa/YidvnXeGvzVNEa+PAdrQBiwRLZB1NoGT5igEfmP6chqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hcx4ElHx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49BA6hdl020023;
	Fri, 11 Oct 2024 14:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5yEPVgEcR3ZOQtoxW5okgeRh/GrHBsfeiJ20GRvIYYY=; b=hcx4ElHx6kBYbifj
	MSeZ0HhEWfLDrVLQuX6xl7q+0si5D5nrLfHoU/STtumtWVAJJbaArLGyzjErc5WK
	R93m/32VH822QOcv5letJCkVZ8+wqANWVlU58Ugi+U+nVhDkJgbPvJTsjCwKLYT6
	AhWwwv5I736RZ/YHYCtjEeAAJM0Em3kNVAar2DYTxAEk0Hd+UJCO2DcDCkq+HgrR
	JFnUTr3RNM9CJrgmFKcAH2fZ8CpjuC5R94ALjVL5AeGgGeGJElXeuUfkfSsEx50+
	RiGFVk8ecqupVrnV28zHEA8FTH1wXG1QOwR+fLkeZoohaZUxS/x9y2Gz3mFmJVcx
	urHIAQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426db7m11m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BEASmP008689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:10:28 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Oct 2024 07:10:19 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v3 5/8] media: qcom: camss: Add support for camss driver on SC7280
Date: Fri, 11 Oct 2024 19:39:29 +0530
Message-ID: <20241011140932.1744124-6-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
References: <20241011140932.1744124-1-quic_vikramsa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rd6SQbabXh8a1Imk7H8K1S69TAtcFEmg
X-Proofpoint-GUID: Rd6SQbabXh8a1Imk7H8K1S69TAtcFEmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410110098

From: Suresh Vankadara <quic_svankada@quicinc.com>

Add support for the camss driver on the SC7280 SoC.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../media/platform/qcom/camss/camss-csid.c    |   1 -
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   5 +
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     | 339 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 7 files changed, 353 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 858db5d4ca75..8d3dc26e2af4 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1028,7 +1028,6 @@ int msm_csid_subdev_init(struct camss *camss, struct csid_device *csid,
 	csid->res->hw_ops->subdev_init(csid);
 
 	/* Memory */
-
 	if (camss->res->version == CAMSS_8250) {
 		/* for titan 480, CSID registers are inside the VFE region,
 		 * between the VFE "top" and "bus" registers. this requires
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 7d2490c9de01..f341f7b7fd8a 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -505,6 +505,10 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 	u32 val;
 
 	switch (csiphy->camss->res->version) {
+	case CAMSS_7280:
+		r = &lane_regs_sm8250[0][0];
+		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
+		break;
 	case CAMSS_8250:
 		r = &lane_regs_sm8250[0][0];
 		array_size = ARRAY_SIZE(lane_regs_sm8250[0]);
@@ -557,6 +561,7 @@ static bool csiphy_is_gen2(u32 version)
 	bool ret = false;
 
 	switch (version) {
+	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2f7361dfd461..b3525ad81ffd 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -108,6 +108,11 @@ const struct csiphy_formats csiphy_formats_sdm845 = {
 	.formats = formats_sdm845
 };
 
+const struct csiphy_formats csiphy_formats_sc7280 = {
+	.nformats = ARRAY_SIZE(formats_sdm845),
+	.formats = formats_sdm845
+};
+
 /*
  * csiphy_get_bpp - map media bus format to bits per pixel
  * @formats: supported media bus formats array
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 47f0b6b09eba..9295f2fc6745 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -110,6 +110,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy);
 extern const struct csiphy_formats csiphy_formats_8x16;
 extern const struct csiphy_formats csiphy_formats_8x96;
 extern const struct csiphy_formats csiphy_formats_sdm845;
+extern const struct csiphy_formats csiphy_formats_sc7280;
 
 extern const struct csiphy_hw_ops csiphy_ops_2ph_1_0;
 extern const struct csiphy_hw_ops csiphy_ops_3ph_1_0;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ffcb1e2ec417..61f6815a3756 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -334,6 +334,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		}
 		break;
 	case CAMSS_660:
+	case CAMSS_7280:
 	case CAMSS_8x96:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
@@ -1692,6 +1693,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
+	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
 	case CAMSS_845:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index dfa0213ecfbf..7ae4a1312e9f 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -1480,6 +1480,330 @@ static const struct resources_icc icc_res_sc8280xp[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_7280[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {},
+		.clock = { "csiphy0", "csiphy0_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {},
+		.clock = { "csiphy1", "csiphy1_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {},
+		.clock = { "csiphy2", "csiphy2_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {},
+		.clock = { "csiphy3", "csiphy3_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {},
+		.clock = { "csiphy4", "csiphy4_timer"},
+		.clock_rate = {
+			{ 300000000 },
+			{ 300000000 }
+		},
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sc7280
+		}
+	},
+};
+
+static const struct camss_subdev_resources csid_res_7280[] = {
+	/* CSID0 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi0", "vfe0_cphy_rx", "vfe0", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 380000000, 0},
+			{ 400000000, 0, 510000000, 0},
+			{ 400000000, 0, 637000000, 0},
+			{ 400000000, 0, 760000000, 0}
+		},
+
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi1", "vfe1_cphy_rx", "vfe1", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 380000000, 0},
+			{ 400000000, 0, 510000000, 0},
+			{ 400000000, 0, 637000000, 0},
+			{ 400000000, 0, 760000000, 0}
+		},
+
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID2 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi2", "vfe2_cphy_rx", "vfe2", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 380000000, 0},
+			{ 400000000, 0, 510000000, 0},
+			{ 400000000, 0, 637000000, 0},
+			{ 400000000, 0, 760000000, 0}
+		},
+
+		.reg = { "csid2" },
+		.interrupt = { "csid2" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi3", "vfe0_lite_cphy_rx", "vfe0_lite", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 320000000, 0},
+			{ 400000000, 0, 400000000, 0},
+			{ 400000000, 0, 480000000, 0},
+			{ 400000000, 0, 600000000, 0}
+		},
+
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 */
+	{
+		.regulators = { "vdda-phy", "vdda-pll" },
+
+		.clock = { "csi3", "vfe0_lite_cphy_rx", "vfe0_lite", "soc_ahb"},
+		.clock_rate = {
+			{ 300000000, 0, 320000000, 0},
+			{ 400000000, 0, 400000000, 0},
+			{ 400000000, 0, 480000000, 0},
+			{ 400000000, 0, 600000000, 0}
+		},
+
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_7280[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+
+		.clock = { "vfe0", "vfe0_axi", "soc_ahb",
+			   "camnoc_axi", "gcc_camera_axi"},
+		.clock_rate = {
+			{ 380000000, 0, 80000000, 150000000, 0},
+			{ 510000000, 0, 80000000, 240000000, 0},
+			{ 637000000, 0, 80000000, 320000000, 0},
+			{ 760000000, 0, 80000000, 400000000, 0},
+			{ 760000000, 0, 80000000, 480000000, 0},
+		},
+
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+
+		.clock = { "vfe1", "vfe1_axi", "soc_ahb",
+			   "camnoc_axi", "gcc_camera_axi"},
+		.clock_rate = {
+			{ 380000000, 0, 80000000, 150000000, 0},
+			{ 510000000, 0, 80000000, 240000000, 0},
+			{ 637000000, 0, 80000000, 320000000, 0},
+			{ 760000000, 0, 80000000, 400000000, 0},
+			{ 760000000, 0, 80000000, 480000000, 0},
+		},
+
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 */
+	{
+		.regulators = {},
+
+		.clock = { "vfe2", "vfe2_axi", "soc_ahb",
+			   "camnoc_axi", "gcc_camera_axi"},
+		.clock_rate = {
+			{ 380000000, 0, 80000000, 150000000, 0},
+			{ 510000000, 0, 80000000, 240000000, 0},
+			{ 637000000, 0, 80000000, 320000000, 0},
+			{ 760000000, 0, 80000000, 400000000, 0},
+			{ 760000000, 0, 80000000, 480000000, 0},
+		},
+
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.hw_ops = &vfe_ops_170,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE3 (lite) */
+	{
+		.clock = { "vfe0_lite", "soc_ahb",
+			   "camnoc_axi", "gcc_camera_axi"},
+		.clock_rate = {
+			{ 320000000, 80000000, 150000000, 0},
+			{ 400000000, 80000000, 240000000, 0},
+			{ 480000000, 80000000, 320000000, 0},
+			{ 600000000, 80000000, 400000000, 0},
+		},
+
+		.regulators = {},
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE4 (lite) */
+	{
+		.clock = { "vfe1_lite", "soc_ahb",
+			   "camnoc_axi", "gcc_camera_axi"},
+		.clock_rate = {
+			{ 320000000, 80000000, 150000000, 0},
+			{ 400000000, 80000000, 240000000, 0},
+			{ 480000000, 80000000, 320000000, 0},
+			{ 600000000, 80000000, 400000000, 0},
+		},
+
+		.regulators = {},
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sc7280[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -2443,9 +2767,24 @@ static const struct camss_resources sc8280xp_resources = {
 	.link_entities = camss_link_entities
 };
 
+static const struct camss_resources sc7280_resources = {
+	.version = CAMSS_7280,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_7280,
+	.csid_res = csid_res_7280,
+	.vfe_res = vfe_res_7280,
+	.icc_res = icc_res_sc7280,
+	.icc_path_num = ARRAY_SIZE(icc_res_sc7280),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_7280),
+	.csid_num = ARRAY_SIZE(csid_res_7280),
+	.vfe_num = ARRAY_SIZE(vfe_res_7280),
+	.link_entities = camss_link_entities
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8996-camss", .data = &msm8996_resources },
+	{ .compatible = "qcom,sc7280-camss", .data = &sc7280_resources },
 	{ .compatible = "qcom,sc8280xp-camss", .data = &sc8280xp_resources },
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 73c47c07fc30..16e527f8b831 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -76,6 +76,7 @@ enum camss_version {
 	CAMSS_8x16,
 	CAMSS_8x96,
 	CAMSS_660,
+	CAMSS_7280,
 	CAMSS_845,
 	CAMSS_8250,
 	CAMSS_8280XP,
-- 
2.25.1


