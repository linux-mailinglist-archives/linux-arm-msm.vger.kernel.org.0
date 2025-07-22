Return-Path: <linux-arm-msm+bounces-65998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF7B0D2C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 330591C25079
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FA4C2D3A83;
	Tue, 22 Jul 2025 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n6+Xs1t7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DF12D0298
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753168983; cv=none; b=Kmk27DbIRQJjyZIvks50hT1lD205DaLeJ+/ltuM6HE9IxxjlfHSVmtoHUWrQRjtIlvzM6TZ2cAbWYlIfIT9iAM6rVP3jdZjtqOwFQqJyCTbS7u+JyT52GtGimbp4FfFBLgm9ikVe39G5LinwZznRn0ev6tDjA8ZRoJdbp/Xb/GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753168983; c=relaxed/simple;
	bh=A/33KDRt3oDK4NDO2X2o64L+cjx2DofT19gj6OCqf7g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PArTjPdclPSpG0UeXIrb97fhrD0QEjcvLuMHVrULR9EvuCz9GSgOrlfrLuc83RB9Ku/3G6wba20vOU2a+Qbtd8C+5EYybSv/fUreYnMKOCnJPxvRN7Q3fohe7C1VqP0dlUp1s4pYBBPTHRkGaF83uvlO9OXWSSZ13v0nro4ClhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n6+Xs1t7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M3eh7r029264
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YZ4FgzCJdzXTZ68oWJfU94gpKDzF/Xt5MxzpGoR2lPo=; b=n6+Xs1t7W7KzG/B1
	PAhr0SZg0iBIDLsAbPrX2Zwk8Wr4lya+C2+5+OdnzpDd43Z/erbgMbXCuEuBLieQ
	waICVPJGZEP40CEnOJ/Xt2PGic2xUN9+phA3jiZnCfD7rkKscpsbalAoD78O1JuI
	E2hGhJ78zHD3ycHeOLq8Zp7/DU3zWGJa/+Q+BBTT//nxGlgTX6ccW2QNCK02azuD
	G27CI1HVGaN66n/3FsNAoafNreRB0PGEzL9LoyD8+Vke+HLcDDD0Eh5kILUaI7Rg
	n5rbB372Z+LxwLDwSt6GEEx18Gm5Yvq2dNTsQC5oeqXLoYPDhhpyj9tGN6o6UO9J
	3pT8/g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tgebh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-311d5fe941eso1624397a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753168979; x=1753773779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZ4FgzCJdzXTZ68oWJfU94gpKDzF/Xt5MxzpGoR2lPo=;
        b=m1GBZZ8QUx5GyjhVsfbgNwqPk9vQgRd28jJm68WSeiK6KQ2AJdQ+C+9a4j5NreHARu
         FvW1dDuWT+zTAn+BLpb5ZOf0iTyqssn9lyu/NzxNxIeMfXCsweUt3oJR9CZ6ylUkkUV+
         wdzV/El+eD60x59vWfjfgq3TIjtYDo/xlr/yqDyJNgY+7cqzexJWJUDv2VFHAPnogfGH
         PdGkF5GtDuiKQYUB+sTWpC41NKGW/GRikA4Mc0AQ5qHF3SBUQHKK4MvkmI0iKZ/K4DGX
         f6kVpRhQYnUF8Imwo6x1glGXRhb48lkWoMJ+n1Sl2eJsMcx26JytDH04USk5OQ2WfQ5O
         ZX3g==
X-Gm-Message-State: AOJu0YwgbJrjb9jNGj52I8R3GQiSWSi4vuQnPc5HbJHaPkH5fmSZpsWz
	3IUzZvhQf83a+AX7PjoaqABkWSKzu66QuxAxjC0yp7TrnATUXCQ4PDBynTqDzcqSLCavTolYjOB
	B6dr1K9jBQnNVf9PB57bp+Q5lngRVgTl6TEGtbItB3qwIIZ6Botyml0eOaNSr8tuAkj+H
X-Gm-Gg: ASbGnctbT2eS1FfGnMyAA3Vtau+jp7uyyygo1bjRGaMjnTvMudgtgHfwkhUWVKQSHrQ
	LANaYBU3JfdKF06HzyCaXFQaj8VnbhlmMjRFzXh1Cwf+8IMy9jz0ipQxrMqVtHC3UK70pk9b5kM
	iDZMRT99xBy49yItOR1mKNnEFWpCfDYw+dtAGD0XX2c3LAeqUL6DbIY9HTKeEBQpREPDjwvuRhi
	7z16SVkjfTh+8i6VYqHu/mTkVJV+K2N55Vw1qU60E3s0qY+Bz9Al2KJ8sF5xUeN6+auerDwtcty
	LDGs1Ke9WTkW5kh7upEeYsLPbADTQOvVCrUnEptB3gl8PeGWJ8Lo4riZ7iaqTVpL2Fy2vnQBb/j
	ReDJV+ZLfbrRCxUlRQFMsUlboEm4rjJGjQdFS6jXmPQrantH+nxQIQPp9
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id 98e67ed59e1d1-31c9e76ae7amr13792186a91.3.1753168978868;
        Tue, 22 Jul 2025 00:22:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+RLb9NbCc3+jcSeXV7HScdHKbTZCeU1tAR9/nK43lPZ6TFTvGxTPW2EvCOjgTdwguI8na1A==
X-Received: by 2002:a17:90b:518d:b0:312:ec:411a with SMTP id 98e67ed59e1d1-31c9e76ae7amr13792158a91.3.1753168978262;
        Tue, 22 Jul 2025 00:22:58 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:22:57 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:06 +0800
Subject: [PATCH v2 05/13] phy: qcom: qmp-usbc: Introduce PHY type enum for
 USB/DP support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-5-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
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
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168937; l=10901;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=A/33KDRt3oDK4NDO2X2o64L+cjx2DofT19gj6OCqf7g=;
 b=YDREKYRUTca7/pvK1h3Q1whlAfi6sY4u2iLzec2J+rRH4GEmAsQfi5xA6MykrceM7premjvzW
 8+2lZrRHeNLCOStdaoVpXGAY81dSnFd33BOhziX5Gq3z9TGWcw3TP/u
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfXzSM1f++fIFzr
 2RhiGos0/RgOof4a7130yapPxpJpDoxLwitkBPnmc1XYxaYbmAefeOjjkOvTrM/iu03IL/jxiRL
 ymuX8Qy+xu9p18DuhSd+gXTLXD/tlvliephtKl85bjuv9QGXrJUuVS0w7jy3ORBQkuEAFX5E8NQ
 2IXiYbkJX9SNubGf2faJdj71n0uccoWVOQXYWaPE7XwTx4e37I13jffKATiVUWUk+7d5fhBSdn2
 2EU9M8wpkJhDVRQbdZZvq/zWBDlEVLLPObiOlYnTNBkK2OuOXRnZE8XHXE+tc224XLnzTDu5OXh
 oAVOzL4xerOyvvzoC0dnrL23+M7WCbxGepP7kiN53Yit9zJDQERK0Q6sgKpB73MYWZAUdXTI00j
 ThGbImWmhs04RyLmH9fU5mNzYRDlzk8Zei9ffvPReSFLLDi3O1+ZFe0amMX4Hhzm/8RdEzA6
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687f3c54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=lpKKpq6P2_pQO93rLgIA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: aU4hOeMKbSo15-KSqSaiYV4Jd8fwpr3V
X-Proofpoint-ORIG-GUID: aU4hOeMKbSo15-KSqSaiYV4Jd8fwpr3V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220059

Add `qmp_phy_usbc_type` enum and a `type` field in `qmp_usbc` to
distinguish between USB and DP PHYs.

- Introduce `qmp_phy_usbc_type` enum with USB and DP types.
- Update device match table to associate compatible strings with type
  and config.
- Wrap existing USB-specific logic with type checks to prepare for
  future DP support.

No functional changes and serves as a preparatory step for adding DP PHY
support.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 195 ++++++++++++++++++++-----------
 1 file changed, 126 insertions(+), 69 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 078752dbc66f9b9844c003e7755fff6466ea1d6c..647e2f54b744bf099ea667e672c606dd7aef3bcf 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -286,6 +286,16 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
 };
 
+enum qmp_phy_usbc_type {
+	QMP_PHY_USBC_USB,
+	QMP_PHY_USBC_DP,
+};
+
+struct qmp_phy_cfg {
+	int type;
+	const void *cfg;
+};
+
 struct qmp_usbc_usb_offsets {
 	u16 serdes;
 	u16 pcs;
@@ -454,23 +464,40 @@ static const struct qmp_phy_usb_cfg sdm660_usb3phy_cfg = {
 	.regs			= qmp_v3_usb3phy_regs_layout_qcm2290,
 };
 
+static const struct qmp_phy_cfg msm8998_phy_usb3_cfg = {
+	.type = QMP_PHY_USBC_USB,
+	.cfg = &msm8998_usb3phy_cfg,
+};
+
+static const struct qmp_phy_cfg qcm2290_phy_usb3_cfg = {
+	.type = QMP_PHY_USBC_USB,
+	.cfg = &qcm2290_usb3phy_cfg,
+};
+
+static const struct qmp_phy_cfg sdm660_phy_usb3_cfg = {
+	.type = QMP_PHY_USBC_USB,
+	.cfg = &sdm660_usb3phy_cfg,
+};
+
 #define to_usb_cfg(x) ((struct qmp_phy_usb_cfg *)((x)->cfg))
 #define to_usb_layout(x) ((struct qmp_phy_usb_layout *)((x)->layout))
 
 static int qmp_usbc_generic_init(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
-	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
-	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	int num_vregs;
-	unsigned int reg_pwr_dn;
 	u32 val;
 	int ret;
+	unsigned int reg_pwr_dn;
 
-	num_vregs = cfg->num_vregs;
-	reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 
-	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
+		num_vregs = cfg->num_vregs;
+		reg_pwr_dn = cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL];
+	}
+
+	ret = regulator_bulk_enable(num_vregs, qmp->vregs);
 	if (ret) {
 		dev_err(qmp->dev, "failed to enable regulators, err=%d\n", ret);
 		return ret;
@@ -497,8 +524,12 @@ static int qmp_usbc_generic_init(struct phy *phy)
 	if (qmp->orientation == TYPEC_ORIENTATION_REVERSE)
 		val |= SW_PORTSELECT_VAL;
 
-	qphy_setbits(layout->pcs, reg_pwr_dn, SW_PWRDN);
-	writel(val, layout->pcs_misc);
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+
+		qphy_setbits(layout->pcs, reg_pwr_dn, SW_PWRDN);
+		writel(val, layout->pcs_misc);
+	}
 
 	return 0;
 
@@ -513,13 +544,18 @@ static int qmp_usbc_generic_init(struct phy *phy)
 static int qmp_usbc_generic_exit(struct phy *phy)
 {
 	struct qmp_usbc *qmp = phy_get_drvdata(phy);
-	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+	int num_vregs;
 
 	reset_control_bulk_assert(qmp->num_resets, qmp->resets);
 
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
-	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+
+		num_vregs = cfg->num_vregs;
+	}
+	regulator_bulk_disable(num_vregs, qmp->vregs);
 
 	return 0;
 }
@@ -650,7 +686,7 @@ static const struct phy_ops qmp_usbc_usb_phy_ops = {
 
 static void qmp_usbc_enable_autonomous_mode(struct qmp_usbc *qmp)
 {
-	const struct qmp_phy_usb_cfg *cfg = qmp->cfg;
+	const struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	void __iomem *pcs = layout->pcs;
 	u32 intr_mask;
@@ -698,18 +734,20 @@ static void qmp_usbc_disable_autonomous_mode(struct qmp_usbc *qmp)
 static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 {
 	struct qmp_usbc *qmp = dev_get_drvdata(dev);
-	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
-
-	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", layout->mode);
 
 	if (!qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
 
-	qmp_usbc_enable_autonomous_mode(qmp);
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+
+		dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", layout->mode);
+		qmp_usbc_enable_autonomous_mode(qmp);
+		clk_disable_unprepare(layout->pipe_clk);
+	}
 
-	clk_disable_unprepare(layout->pipe_clk);
 	clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
 
 	return 0;
@@ -718,11 +756,8 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 {
 	struct qmp_usbc *qmp = dev_get_drvdata(dev);
-	struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
 	int ret = 0;
 
-	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", layout->mode);
-
 	if (!qmp->phy->init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
@@ -732,14 +767,19 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(layout->pipe_clk);
-	if (ret) {
-		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
-		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
-		return ret;
-	}
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_layout *layout = to_usb_layout(qmp);
+
+		dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", layout->mode);
+		ret = clk_prepare_enable(layout->pipe_clk);
+		if (ret) {
+			dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
+			clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+			return ret;
+		}
 
-	qmp_usbc_disable_autonomous_mode(qmp);
+		qmp_usbc_disable_autonomous_mode(qmp);
+	}
 
 	return 0;
 }
@@ -751,20 +791,28 @@ static const struct dev_pm_ops qmp_usbc_pm_ops = {
 
 static int qmp_usbc_vreg_init(struct qmp_usbc *qmp)
 {
-	struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
 	struct device *dev = qmp->dev;
-	int i;
+	int ret, i;
 
-	int num = cfg->num_vregs;
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		struct qmp_phy_usb_cfg *cfg = to_usb_cfg(qmp);
+		int num = cfg->num_vregs;
 
-	qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
-	if (!qmp->vregs)
-		return -ENOMEM;
+		qmp->vregs = devm_kcalloc(dev, num, sizeof(*qmp->vregs), GFP_KERNEL);
+		if (!qmp->vregs)
+			return -ENOMEM;
 
-	for (i = 0; i < num; i++)
-		qmp->vregs[i].supply = cfg->vreg_list[i];
+		for (i = 0; i < num; i++)
+			qmp->vregs[i].supply = cfg->vreg_list[i];
 
-	return devm_regulator_bulk_get(dev, num, qmp->vregs);
+		ret = devm_regulator_bulk_get(dev, num, qmp->vregs);
+		if (ret) {
+			dev_err(dev, "failed at devm_regulator_bulk_get\n");
+			return ret;
+		}
+	}
+
+	return 0;
 }
 
 static int qmp_usbc_reset_init(struct qmp_usbc *qmp,
@@ -1061,6 +1109,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct device_node *np;
 	struct qmp_usbc *qmp;
+	const struct qmp_phy_cfg *data_cfg;
 	int ret;
 
 	qmp = devm_kzalloc(dev, sizeof(*qmp), GFP_KERNEL);
@@ -1072,39 +1121,45 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	qmp->orientation = TYPEC_ORIENTATION_NORMAL;
 
-	qmp->cfg = of_device_get_match_data(dev);
-	if (!qmp->cfg)
+	data_cfg = of_device_get_match_data(dev);
+	if (!data_cfg)
 		return -EINVAL;
 
 	mutex_init(&qmp->phy_mutex);
 
+	qmp->type = data_cfg->type;
+	qmp->cfg = data_cfg->cfg;
+
 	ret = qmp_usbc_vreg_init(qmp);
 	if (ret)
 		return ret;
 
-	qmp->layout = devm_kzalloc(dev, sizeof(struct qmp_phy_usb_layout), GFP_KERNEL);
-	if (!qmp->layout)
-		return -ENOMEM;
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		qmp->layout = devm_kzalloc(dev, sizeof(struct qmp_phy_usb_layout), GFP_KERNEL);
+		if (!qmp->layout)
+			return -ENOMEM;
+
+		ret = qmp_usbc_parse_vls_clamp(qmp);
+		if (ret)
+			return ret;
+
+		/* Check for legacy binding with child node. */
+		np = of_get_child_by_name(dev->of_node, "phy");
+		if (np) {
+			ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
+		} else {
+			np = of_node_get(dev->of_node);
+			ret = qmp_usbc_parse_usb_dt(qmp);
+		}
+
+		if (ret)
+			goto err_node_put;
+	}
 
 	ret = qmp_usbc_typec_switch_register(qmp);
 	if (ret)
 		return ret;
 
-	ret = qmp_usbc_parse_vls_clamp(qmp);
-	if (ret)
-		return ret;
-
-	/* Check for legacy binding with child node. */
-	np = of_get_child_by_name(dev->of_node, "phy");
-	if (np) {
-		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
-	} else {
-		np = of_node_get(dev->of_node);
-		ret = qmp_usbc_parse_usb_dt(qmp);
-	}
-	if (ret)
-		goto err_node_put;
-
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
@@ -1115,15 +1170,17 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
-	if (ret)
-		goto err_node_put;
-
-	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
-	if (IS_ERR(qmp->phy)) {
-		ret = PTR_ERR(qmp->phy);
-		dev_err(dev, "failed to create PHY: %d\n", ret);
-		goto err_node_put;
+	if (qmp->type == QMP_PHY_USBC_USB) {
+		ret = phy_pipe_clk_register(qmp, np);
+		if (ret)
+			goto err_node_put;
+
+		qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
+		if (IS_ERR(qmp->phy)) {
+			ret = PTR_ERR(qmp->phy);
+			dev_err(dev, "failed to create PHY: %d\n", ret);
+			goto err_node_put;
+		}
 	}
 
 	phy_set_drvdata(qmp->phy, qmp);
@@ -1142,19 +1199,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 static const struct of_device_id qmp_usbc_of_match_table[] = {
 	{
 		.compatible = "qcom,msm8998-qmp-usb3-phy",
-		.data = &msm8998_usb3phy_cfg,
+		.data =  &msm8998_phy_usb3_cfg,
 	}, {
 		.compatible = "qcom,qcm2290-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data = &qcm2290_phy_usb3_cfg,
 	}, {
 		.compatible = "qcom,qcs615-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data = &qcm2290_phy_usb3_cfg,
 	}, {
 		.compatible = "qcom,sdm660-qmp-usb3-phy",
-		.data = &sdm660_usb3phy_cfg,
+		.data =  &sdm660_phy_usb3_cfg,
 	}, {
 		.compatible = "qcom,sm6115-qmp-usb3-phy",
-		.data = &qcm2290_usb3phy_cfg,
+		.data =  &qcm2290_phy_usb3_cfg,
 	},
 	{ },
 };

-- 
2.34.1


