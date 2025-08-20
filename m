Return-Path: <linux-arm-msm+bounces-69931-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66BB2D8C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:43:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22A75563B75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F1C2DEA61;
	Wed, 20 Aug 2025 09:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oTmPs7x8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3912DCC1F
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682593; cv=none; b=SM+KB8QAC8ZugszaaohhgI2ZIuX4ZhuoJabS4S4lKgwvVFCI9wf4z5+rqSo2SijmkOTvpi3yrmaoU8fMsEPoTiH3m+WkCEVUi1xphHVQtlis84DVbI9bF9ZbAHak7hAUHQPA0xYH/qPkLGJAPvH8E0GbzKuT/eCAyf4xH0fXJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682593; c=relaxed/simple;
	bh=+nHyT48cRMJ7suWVMlfbbY6+YDu1YwhgikHX48zQXdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OiNLuNJAOfeg70ExCf0fHSpRITLDb7xfUBwJqloGekG3Fp7U161v9AyUGFLecu6UMfDsVjipywdJKkaQ54J/SqrNP+ZezucgZWcrzXC0QAQzd6xoWgw6JsqA76hG483kXBc7MjCTncF08NuIoe1aWMJ8zLz226yof/Vy8iGzgQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oTmPs7x8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1p2F4009540
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	orPZqzZzw4JcvquvD6KbeTmqShcbVWUFlNLN3adtmmw=; b=oTmPs7x80UWWh1IT
	fLbmTcZVx9qaBaTfRGhhVicn3ASP4+p/3g+yYGnn8rqdf81O86UhFaK4HnsSXdLP
	+ok8V47oRM54ngEwuYVHY/GMK/17jp9X2wpQEYpfHutH5E6Tf/oH45+T/alCwa9w
	jwUfCCmEMS43U/d/bFQDjp3xfXztV3KbGRanZTI2ax6/1yCK2QM2MOezgwgRNyD9
	8DvXiw4CfTcUNPGYEeYHsd7ctIavU2gTdnYbco0rmq5opW0RicpjYluse+Vga105
	GIw1iDr8KFxUn5lBGyxxNcpoaS0uZaNpOmqRt8tvkxVP5V6cq7tNvaMd/yZiSCAH
	ZX0vqg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a17uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:36:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2445806fc48so15938695ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682589; x=1756287389;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=orPZqzZzw4JcvquvD6KbeTmqShcbVWUFlNLN3adtmmw=;
        b=qmY7z1qVGkgUj8A7gltSx2STYNjJHdCmdrLO1aVWq/uoEnC/74UCGMh3GSqDmcYs/7
         RshyxDFy/zW+XIAZxGlgxz9TgKIVTX6bqh0n4+4RDoBkHo6y++qq37Lr9tHAYLjUfszG
         qxojn694lnktHafiZN005JO4CF8127Ai0zHQJO/e+el6VG81ks0ihEKixRHeHO5SOqKJ
         fgHlx34SLlvBb/6v1Q3/2ryKNtZpf6v1p72e8RNfC6tAQXKjA6g4p+VVdWyDH5NvD4At
         ZrrgIDLLGdtt0t/ArUO8kY7sxc6CSNPDmWzYwfnD8sNvNvkmn8lDYdQODp5lKIgLwToS
         QjNw==
X-Gm-Message-State: AOJu0YwQNiUzIfm2jGC4Hzq7Kj4wUzBxtXUuv4b81ThaSdiijIU+Prv1
	300pqqwbgk+adPEF/5FcSFvn8K3JAgFX2cjamEpzKAN8l8NHtBKQ/hkJQ219ev5wH+ClxLATYot
	T/Xkig1hzovRmRpQLDfzZuo/VdIKpwbwW7i5j/jomYCiDdnBtWCF7nOHa4BNLGJPSyUn4iq6MO6
	Wb
X-Gm-Gg: ASbGncukt0g7IJckTn8edXow1IlX9ohF9LEwDYwA5BUayQ3nZEvvC60kHyEXAgyT83Y
	oegoa4MKUyTl96c1gdFcdurKcrxQ3MvJpzox6vZdhvAqPjbFDxe+Syay6qqZXAf7TAaQz23TGeB
	VSpiOYRw19rUvavs+MtqyaS7Jak1qhhjZHfAQIVXiox+2VNKypL1lhrjyRFs7ey96+jJPagQFTh
	EViKsFVLf/9dxCFAbk5BZxTsXarrXGWECpOwCunStWma51wRMdjJuT2YyOhgUL4Zy/EcHeUWGC6
	pwdQqq6JhfnaRdB89qnyCFgXomVQHdhAhhWlq2etlk23+MG47nQH4p/HG2Y9kPforJR0ZMo3Zl2
	ksJ83r6U8xz0PMlkZ7tw0QVM4Uzd4xFeH3XBGprwhwCAhhkZgkeoCwO3w
X-Received: by 2002:a17:902:ecca:b0:240:5c13:979a with SMTP id d9443c01a7336-245ef27a6aamr13412165ad.9.1755682589120;
        Wed, 20 Aug 2025 02:36:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkdSiYltbj31GCPpo7Vs7xo/QlcsdPeU7zWLOIX2jkAqwf4FJ/V31D5nzCQAqJOKrVUAMCmQ==
X-Received: by 2002:a17:902:ecca:b0:240:5c13:979a with SMTP id d9443c01a7336-245ef27a6aamr13412045ad.9.1755682588665;
        Wed, 20 Aug 2025 02:36:28 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:36:28 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:49 +0800
Subject: [PATCH v3 07/14] phy: qcom: qmp-usbc: Move reset and regulator
 config into PHY cfg
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-7-a43bd25ec39c@oss.qualcomm.com>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        quic_lliu6@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682520; l=8280;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=+nHyT48cRMJ7suWVMlfbbY6+YDu1YwhgikHX48zQXdM=;
 b=IOOcvFICrEZas5f0cHFp9KO7fs5v0mtfUpbU+HJL07BGShS12kJY79lYWGBh+62CElBFEk8I3
 ACmuc5aOob8BzaGyG4DyoBtaHRNBCyIXJnVkj673cPUi3JlyVVtc0Ct
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=feD0C0QF c=1 sm=1 tr=0 ts=68a5971e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Kf0ARtB50tyeYv72HkoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 2jBIiHSdN155Aml1qYxHX66yAduQcnTj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXz2LY8WHni//Z
 GdMI6OTMZxPTaRAOtN7c/w0tPmAYaBVzWLG5RJ3QvY7Ku6natqGb1pHlGFb/Scl8Ina72+zq9Iy
 o9OSxAoBzXcdAganoGz1kz75iMYvEvfg+ojtK/0riwsQS8CIsZ8sERDOFVp1hRdzBHEYP4DXGfB
 BXe7UiVVxSSxSA50YvuWv4DalmRSv6y/D7SPbdtss3CpWtiTs5YXx+KUCc8Ll8npyrxVTFV/CED
 +ASbO+fxuQF/mo1wbSi+E81d/ZQJxf8WzpIw9ljMuD7PfRPzCH2iBICT0+q9olZxC08SCFQXyU9
 CcW+pS6yzQcxAWlXPs9cd+L90pReHyHtydrJKOxCR+PgDknItoAROipPnzPPdbwo9qkj1gOZi7V
 ITcfsPEsydqIMLsj1xPiehUfWZp/ow==
X-Proofpoint-GUID: 2jBIiHSdN155Aml1qYxHX66yAduQcnTj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Refactor reset and regulator configuration to be managed via qmp_phy_cfg
instead of hardcoded lists. This enables per-PHY customization and
simplifies initialization logic for USB-only and USB/DP switchable PHYs.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 108 +++++++++++++++----------------
 1 file changed, 53 insertions(+), 55 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 61128d606238321d1b573655b3b987226aa2d594..4e797b7e65da0e3a827efa9a179f1c150c1b8b00 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -421,8 +421,9 @@ struct qmp_phy_cfg {
 	int (*configure_dp_phy)(struct qmp_usbc *qmp);
 	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
 
-	/* regulators to be requested */
-	const char * const *vreg_list;
+	const char * const *reset_list;
+	int num_resets;
+	const struct regulator_bulk_data *vreg_list;
 	int num_vregs;
 
 	/* array of registers with different offsets */
@@ -453,7 +454,6 @@ struct qmp_usbc {
 	struct clk_hw dp_pixel_hw;
 	struct clk_bulk_data *clks;
 	int num_clks;
-	int num_resets;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
@@ -514,9 +514,18 @@ static const char * const usb3phy_reset_l[] = {
 	"phy_phy", "phy",
 };
 
-/* list of regulators */
-static const char * const qmp_phy_vreg_l[] = {
-	"vdda-phy", "vdda-pll",
+static const char * const usb3dpphy_reset_l[] = {
+	"phy_phy", "dp_phy",
+};
+
+static const struct regulator_bulk_data qmp_phy_usb_vreg_l[] = {
+	{ .supply = "vdda-phy" },
+	{ .supply = "vdda-pll" },
+};
+
+static const struct regulator_bulk_data qmp_phy_usbdp_vreg_l[] = {
+	{ .supply = "vdda-phy", .init_load_uA = 21800 },
+	{ .supply = "vdda-phy", .init_load_uA = 36000 },
 };
 
 static const struct qmp_usbc_offsets qmp_usbc_offsets_v3_qcm2290 = {
@@ -569,8 +578,10 @@ static const struct qmp_phy_cfg msm8998_usb3phy_cfg = {
 	.rx_tbl_num             = ARRAY_SIZE(msm8998_usb3_rx_tbl),
 	.pcs_tbl                = msm8998_usb3_pcs_tbl,
 	.pcs_tbl_num            = ARRAY_SIZE(msm8998_usb3_pcs_tbl),
-	.vreg_list              = qmp_phy_vreg_l,
-	.num_vregs              = ARRAY_SIZE(qmp_phy_vreg_l),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
+	.vreg_list              = qmp_phy_usb_vreg_l,
+	.num_vregs              = ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs                   = qmp_v3_usb3phy_regs_layout,
 };
 
@@ -586,8 +597,10 @@ static const struct qmp_phy_cfg qcm2290_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(qcm2290_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
+	.vreg_list		= qmp_phy_usb_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -603,8 +616,10 @@ static const struct qmp_phy_cfg sdm660_usb3phy_cfg = {
 	.rx_tbl_num		= ARRAY_SIZE(sdm660_usb3_rx_tbl),
 	.pcs_tbl		= qcm2290_usb3_pcs_tbl,
 	.pcs_tbl_num		= ARRAY_SIZE(qcm2290_usb3_pcs_tbl),
-	.vreg_list		= qmp_phy_vreg_l,
-	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_l),
+	.reset_list		= usb3phy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3phy_reset_l),
+	.vreg_list		= qmp_phy_usb_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_usb_vreg_l),
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
@@ -637,6 +652,11 @@ static const struct qmp_phy_cfg qcs615_usb3dp_phy_cfg = {
 
 	.swing_tbl		= &qmp_dp_voltage_swing_hbr2_rbr,
 	.pre_emphasis_tbl	= &qmp_dp_pre_emphasis_hbr2_rbr,
+
+	.reset_list		= usb3dpphy_reset_l,
+	.num_resets		= ARRAY_SIZE(usb3dpphy_reset_l),
+	.vreg_list		= qmp_phy_usbdp_vreg_l,
+	.num_vregs		= ARRAY_SIZE(qmp_phy_usbdp_vreg_l),
 };
 
 static int qmp_usbc_com_init(struct phy *phy)
@@ -653,13 +673,13 @@ static int qmp_usbc_com_init(struct phy *phy)
 		return ret;
 	}
 
-	ret = reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 	if (ret) {
 		dev_err(qmp->dev, "reset assert failed\n");
 		goto err_disable_regulators;
 	}
 
-	ret = reset_control_bulk_deassert(qmp->num_resets, qmp->resets);
+	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
 	if (ret) {
 		dev_err(qmp->dev, "reset deassert failed\n");
 		goto err_disable_regulators;
@@ -682,7 +702,7 @@ static int qmp_usbc_com_init(struct phy *phy)
 	return 0;
 
 err_assert_reset:
-	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -694,7 +714,7 @@ static int qmp_usbc_com_exit(struct phy *phy)
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
+	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
@@ -921,42 +941,22 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 			   qmp_usbc_runtime_resume, NULL)
 };
 
-static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
+static int qmp_usbc_reset_init(struct qmp_usbc *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
-	struct device *dev = qmp->dev;
-	int num = cfg->num_vregs;
-	int i;
-
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
-
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
-
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
-}
-
-static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
-			      const char *const *reset_list,
-			      int num_resets)
-{
 	struct device *dev = qmp->dev;
 	int i;
 	int ret;
 
-	qmp->resets = devm_kcalloc(dev, num_resets,
+	qmp->resets = devm_kcalloc(dev, cfg->num_resets,
 				   sizeof(*qmp->resets), GFP_KERNEL);
 	if (!qmp->resets)
 		return -ENOMEM;
 
-	for (i = 0; i < num_resets; i++)
-		qmp->resets[i].id = reset_list[i];
+	for (i = 0; i < cfg->num_resets; i++)
+		qmp->resets[i].id = cfg->reset_list[i];
 
-	qmp->num_resets = num_resets;
-
-	ret = devm_reset_control_bulk_get_exclusive(dev, num_resets, qmp->resets);
+	ret = devm_reset_control_bulk_get_exclusive(dev, cfg->num_resets, qmp->resets);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to get resets\n");
 
@@ -1146,11 +1146,6 @@ static int qmp_usbc_parse_usb_dt_legacy(struct qmp_usbc *qmp, struct device_node
 
 	qmp->num_clks = ret;
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
-				 ARRAY_SIZE(usb3phy_legacy_reset_l));
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -1187,14 +1182,9 @@ static int qmp_usbc_parse_usb_dt(struct qmp_usbc *qmp)
 	qmp->pipe_clk = devm_clk_get(dev, "pipe");
 	if (IS_ERR(qmp->pipe_clk)) {
 		return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
-				     "failed to get pipe clock\n");
+					"failed to get pipe clock\n");
 	}
 
-	ret = qmp_usbc_reset_init(qmp, usb3phy_reset_l,
-				 ARRAY_SIZE(usb3phy_reset_l));
-	if (ret)
-		return ret;
-
 	return 0;
 }
 
@@ -1228,6 +1218,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device_node *np;
 	struct qmp_usbc *qmp;
+	const struct qmp_phy_cfg *cfg;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -1239,13 +1230,20 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
 
-	qmp->cfg = of_device_get_match_data(dev);
-	if (!qmp->cfg)
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
 		return -EINVAL;
 
+	qmp->cfg = cfg;
+
 	mutex_init(&qmp->phy_mutex);
 
-	ret = qmp_usbc_vreg_init(qmp);
+	ret = qmp_usbc_reset_init(qmp);
+	if (ret)
+		return ret;
+
+	ret = devm_regulator_bulk_get_const(qmp->dev, cfg->num_vregs,
+					 cfg->vreg_list, &qmp->vregs);
 	if (ret)
 		return ret;
 

-- 
2.34.1


