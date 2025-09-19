Return-Path: <linux-arm-msm+bounces-74199-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D4B89ECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:26:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA490585008
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 884A1313D5C;
	Fri, 19 Sep 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="khaP++Er"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D28313548
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758291928; cv=none; b=EhTBAoD9rNXt55VO82yreDC5IQJPmJBPD55z0gs1vYa+zitzlM0IkyCH/VoZ+xQvd+hk09wdzhcMqrm13aHquY0OQd9uQvM70uvki3iJSYQouZN2oMK4Uha04XLSqOPwLOTidpOqEjkDkykcfDOUAaVBRLd/rt0u5dxEIIC8Dmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758291928; c=relaxed/simple;
	bh=V+bmwYjKfMRV9O7yUHq5omi3q3vjjg0Qz8GTgu2JE4Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igDHzbzGWr4diu4AhWTqjRjzS0iIG5Cb/WD9KeKncD6+Tl+G7LAELDBL8vO86Bv34gkM/VMutgC1wf99HGkMcnevha4SdoNxSHZdAIJXE3wSvwLktmUJFqGQHv0FufS7AiJ1PSUbR1h7H1RA9YIg87oZAXSvrn2eoyylk7/HB7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=khaP++Er; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JED4rJ032429
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=; b=khaP++Er38sTrdaC
	a25QtnMmySG6jlbQzmbJPk9nvq8JUfUhtCu/p3VLfk0YA7FtM9oEN8s97ZnX5L1Z
	gnTjOdD7MtBAA2TeEWdbFO896ubNLF28BA4dxSc9ycdT9AwS9IBbzF4nrLA0hUZz
	zPty+mSFjpL2QHY9ENQPEnMwmPemM/tElkwKNgUF3FN5FMu6dGqPqdSpNeIILVvF
	gbskIgLEIDJW47aOensImQFZr1quulM+nEwqS9NJMHSuxcnVIj6KdotAuHRq5w8B
	QjSveBb6h3w8hYOsDXC13Zq5sik0CXxBfkW9nKcV5IKI7Bton3mEIg7ymC/0J7kk
	XZLwEQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxytqg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:25:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2698ede62c2so5949905ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758291925; x=1758896725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaxo68cQZZrWEEivhuCOX2owVkj5hniZ5EATwBZwjNk=;
        b=A/nxWduODoFyYHJmZa2oWCny+EMqo/zQZn1ORu/f12flQTd+D6hnesjED8raLvj7kx
         nLXPRN3lT9lzI2J0o056CPzQ0k8eEm0qN/tvr8AViT+NwGdcDPQchN/K3tYDUwtzPT55
         +FSlrm6nz5VFLan60ZePAw3/vKbDtYSCWQtIrs7tHusIQopp7cXJjiUfcVIjF7Yl7VaO
         SxPHudMOmG4fsSwYAsiSdq+Vd5JivNfH3X85/6u5JMwUzEhloAV2PG9xM6ghxGSOg455
         TXJ4Ms+9SSo8KYl/IOWvuwQ5eRB2t5UDFZ+2FekXTErTyYiKYRHcMr3qrc6jLvE3GZjm
         pNng==
X-Gm-Message-State: AOJu0Yx16iqmD+3ki6OWqTi0rhSR1NtuRJXUuPTy9ncHEBlB6IeVrXLa
	RXRtrsyvzgLlcGp4kaT+kysVlgf0DhIGwv84oJonZwfPPsCNNPxrtrMYZqIAYOK0q8wwfEG/5qu
	9UBvoZxUIlfrWjdbgwn2FKU4a5NEH+rmAyFk5gEQA2ACy6c5LtuyjX9y9p3Ndt0Zvsxj3
X-Gm-Gg: ASbGncsIkAcAw5OnGf4saGchwEBKDF4KsanpZudY1HAelngMUhi1qCnHUWL82J4s8fo
	fDAm/lJjNZJET4u4q6oXv7yl14DrUswxxySxIx3aWG3Ek5KsBzJYuzXM6Rghf/tLmInDeBuGQKK
	FQl6FIOfhhoSMPm13Pdg1uqZkF9ouTbrJhxqgdi6XfDaoNL2t7QmPBDmGNwhyUOz7jRmLWVdu7G
	5bEoKSWnIUpI6AjlnIBPzOIv6qi2T0CrEhTVYd6noyELQO3Yp6ufNOVP9IfWTtTcg7NfaokdnbQ
	2EC04Seh0kK1AEFITQvrFjgrS3ZB6Zjf661vUmktAus2n75A0EjUDGhieqZidiTDkpk783iNaK2
	BhXWfor4SvDz9QQ==
X-Received: by 2002:a17:902:f68e:b0:269:96d2:9c96 with SMTP id d9443c01a7336-269ba2611c1mr28869525ad.0.1758291925140;
        Fri, 19 Sep 2025 07:25:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBIBS4AXXrSudYOMfmAwfNi+JdtzGlXQtukko475U4cFxag3zIVrNAiD2nbk1f8DLKq0tYqA==
X-Received: by 2002:a17:902:f68e:b0:269:96d2:9c96 with SMTP id d9443c01a7336-269ba2611c1mr28869165ad.0.1758291924517;
        Fri, 19 Sep 2025 07:25:24 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:25:24 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:20 +0800
Subject: [PATCH v5 03/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-3-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291893; l=3979;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=V+bmwYjKfMRV9O7yUHq5omi3q3vjjg0Qz8GTgu2JE4Q=;
 b=D+YumCGLZ9Fv17diaosjhiV66oYGcYAUQpxt2JXYY0XK8mFV9R6yRnGH0JVEsEsiIQs6Zzfex
 tbHbYNLSINAA4p/JbPECyhUigU1ZdJjQj/ZzXsCwtg6fIlUQ4UP5k2H
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cd67d6 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=jm3WsR2aq1IkTfYpOVcA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: F2OMh_RH1qFwSJoLO6Ly-fUaz5E51LaK
X-Proofpoint-ORIG-GUID: F2OMh_RH1qFwSJoLO6Ly-fUaz5E51LaK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXy9EqU3p698q+
 bKbSRZct2ZII9bb+nJp29kDI9BdsJ8EoG3OCUI+BiNwxgX04fk+KSfrQ0QOxca1/ziETeEXrIQt
 fKsThHcUvrLZlIpX4QaPtpJGO2sj0f3rTSv1vMdzUacvGTYsxgGLB+DfCIo+XGY9lvdIKcHrKkX
 RdSv3Kd70la3/mHAJl0mfdwdrQG7vt7S4WOputh8ySqDCTBDYxpwfX5rD+eF5FKSIfAonfxRM4r
 fughkKjtPpPvFKltIzd/EOf5n026bWXEU4Cx/EGoNn/bTbJ2u4CHq0NgqTHrjtWU3J+nrDsT9tD
 nPfAEIMgj1w2DEKwdc6YtMx4tav6e4qzHeoLSAqFlI7domBOFL0O0RG7dVNVJC4VH/3Uia7uzwr
 /14nC1XL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
including register offsets, init tables, and callback hooks. Also
update qmp_usbc struct to track DP-related resources and state.
This enables support for USB/DP switchable Type-C PHYs that operate
in either mode.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 54 +++++++++++++++++++++++++++-----
 1 file changed, 46 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 62920dd2aed39bbfddd54ba2682e3d45d65a09c8..de28c3464a40ea97740e16fe78cba4b927911d92 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -293,13 +293,18 @@ struct qmp_usbc_offsets {
 	/* for PHYs with >= 2 lanes */
 	u16 tx2;
 	u16 rx2;
+
+	u16 dp_serdes;
+	u16 dp_txa;
+	u16 dp_txb;
+	u16 dp_dp_phy;
 };
 
-/* struct qmp_phy_cfg - per-PHY initialization config */
+struct qmp_usbc;
 struct qmp_phy_cfg {
 	const struct qmp_usbc_offsets *offsets;
 
-	/* Init sequence for PHY blocks - serdes, tx, rx, pcs */
+	/* Init sequence for USB PHY blocks - serdes, tx, rx, pcs */
 	const struct qmp_phy_init_tbl *serdes_tbl;
 	int serdes_tbl_num;
 	const struct qmp_phy_init_tbl *tx_tbl;
@@ -309,6 +314,27 @@ struct qmp_phy_cfg {
 	const struct qmp_phy_init_tbl *pcs_tbl;
 	int pcs_tbl_num;
 
+	/* Init sequence for DP PHY blocks - serdes, tx, rbr, hbr, hbr2 */
+	const struct qmp_phy_init_tbl *dp_serdes_tbl;
+	int dp_serdes_tbl_num;
+	const struct qmp_phy_init_tbl *dp_tx_tbl;
+	int dp_tx_tbl_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_rbr;
+	int serdes_tbl_rbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr;
+	int serdes_tbl_hbr_num;
+	const struct qmp_phy_init_tbl *serdes_tbl_hbr2;
+	int serdes_tbl_hbr2_num;
+
+	const u8 (*swing_tbl)[4][4];
+	const u8 (*pre_emphasis_tbl)[4][4];
+
+	/* DP PHY callbacks */
+	void (*dp_aux_init)(struct qmp_usbc *qmp);
+	void (*configure_dp_tx)(struct qmp_usbc *qmp);
+	int (*configure_dp_phy)(struct qmp_usbc *qmp);
+	int (*calibrate_dp_phy)(struct qmp_usbc *qmp);
+
 	/* regulators to be requested */
 	const char * const *vreg_list;
 	int num_vregs;
@@ -329,24 +355,36 @@ struct qmp_usbc {
 	void __iomem *rx;
 	void __iomem *tx2;
 	void __iomem *rx2;
-
-	struct regmap *tcsr_map;
-	u32 vls_clamp_reg;
+	void __iomem *dp_dp_phy;
+	void __iomem *dp_tx;
+	void __iomem *dp_tx2;
+	void __iomem *dp_serdes;
 
 	struct clk *pipe_clk;
+	struct clk_fixed_rate pipe_clk_fixed;
+
+	struct clk_hw dp_link_hw;
+	struct clk_hw dp_pixel_hw;
 	struct clk_bulk_data *clks;
 	int num_clks;
 	int num_resets;
 	struct reset_control_bulk_data *resets;
 	struct regulator_bulk_data *vregs;
 
+	struct regmap *tcsr_map;
+	u32 vls_clamp_reg;
+	u32 dp_phy_mode_reg;
+
 	struct mutex phy_mutex;
 
 	struct phy *usb_phy;
 	enum phy_mode mode;
 	unsigned int usb_init_count;
 
-	struct clk_fixed_rate pipe_clk_fixed;
+	struct phy *dp_phy;
+	unsigned int dp_aux_cfg;
+	struct phy_configure_opts_dp dp_opts;
+	unsigned int dp_init_count;
 
 	struct typec_switch_dev *sw;
 	enum typec_orientation orientation;
@@ -689,7 +727,7 @@ static int __maybe_unused qmp_usbc_runtime_suspend(struct device *dev)
 
 	dev_vdbg(dev, "Suspending QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->usb_init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}
@@ -709,7 +747,7 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 
 	dev_vdbg(dev, "Resuming QMP phy, mode:%d\n", qmp->mode);
 
-	if (!qmp->usb_init_count) {
+	if (!qmp->usb_init_count && !qmp->dp_init_count) {
 		dev_vdbg(dev, "PHY not initialized, bailing out\n");
 		return 0;
 	}

-- 
2.34.1


