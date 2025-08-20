Return-Path: <linux-arm-msm+bounces-69935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB51FB2D8D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 11:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B838658420F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 09:40:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 713981DA60F;
	Wed, 20 Aug 2025 09:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eta2IeCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE972DCF69
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755682626; cv=none; b=ajCRrx7YcEB8iQszGyDrHtXFjXL59QTxTWzDbu4ri6y8iDSOpVC5/0RcYxEdCh8moOuBXm8/oDs4P31lVRHmXvRPKCCtS8ExIWuPtOwvUs735ez81Jf1XyN0ZuVVz0RdU0u6x8WnMxa1nDbifMf93aAj+NnQciQXz61TUxIVH4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755682626; c=relaxed/simple;
	bh=q8YyvwtouFMxjAMATiwtXLflnc9t4c5fbKwPwNsKBOc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQ5xz5SdXLKvB9JZirO1Op2eHskTBVIOLm52Tz0rRrOU7WMQJwzg4Gs/zy6Sk5EK26wr9S4WxFfl8jH8st2KkSQqVn17UbkFsvgRF4ef/kqSnoybtgmD0kTNAbkuer2ISLbp3hkU2OhwwvjvCPcQv34DIL32fbk7OyxzfNR/HQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eta2IeCp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57K1oX2B019724
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4qsMCsuJLF/Arg3bzvJueMrIMOL81tADEhGamW6w3E=; b=Eta2IeCpPVduWutr
	mLbN2yijJPM7lIQFPjgfCD49PLZaNK4+bs6DRx1rft5yPtfefZtDm2CSie/sNTPU
	vAD+2dfeEmM57HoAH9GyCz+xS4nbmJ09vLb0xeNSOB23SMwsYmGkrYnLovppbYUD
	Z2M3eg1HLU5J5tOTaoPwQ3EaP9+s7SHPxPR4z9KI31MtJEZY8GCJ+VbmNiBY/Le9
	8WOCcg6T6plb+dWh18xJGkCCcx2M+GLfK06xEJaEJGnUE1Kbevwni3cxS+xZzN5P
	xV7WU8RusXSsOqayLOa7/k88yzevMfWJDlK48UWVIGYEQADaOrC5hf6sERRZjm6v
	SZ7evQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n529175x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 09:37:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244582e9d17so16144425ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 02:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755682623; x=1756287423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4qsMCsuJLF/Arg3bzvJueMrIMOL81tADEhGamW6w3E=;
        b=xBZhjqafNKkl/3ngW/D4V9oECvz3Mn3a/v8gB26VDbRK0t0hrKQYkizis/DNn6KXi/
         Ij2oiNd8orcpkgUDyduOYl8FFRItLJ3lUcRiahvWwo7aAZiviop2q+Q04M82Hdg246Ra
         kVc7Bf7cOiEQwo5XQ2u2/fHP1eK/Ik59wJZo0fcNmdb2AtlQipA32YkdLOV/acCnkfl9
         og7OYWS4TDfx4HPf7bRVCH3y4hu3Td01+HhILebk5gxqFcWHLPgGVRvw6VPzS6V1Qvrs
         EX4f5AlboGU2Bo+z2RfczSgIegBkqVOv5Lq/ck77kdqHvkfNE71C/eq4htT4lyOS7ste
         pgew==
X-Gm-Message-State: AOJu0YztxY77lPAI1Fi5wEpHV0Kuf01T1LC2wpVN9AH8UwEqyn3JBgZB
	hwF7/thv5s1nQ02dBQB5NEtTdvDAxaRC9Gj6ZXZV5QiI1Jg6p/LcZ6tPt865CABC6ru+O4CW33e
	SGfwBva0POFL21KigPs3JsMI6Ew3kMv0T+iKtaVb3U2nFuwKyiBSLAynhktnJSsc9tncO
X-Gm-Gg: ASbGnct7ha3XYWzQEUHRtPm7ZgjzCrC8ILGqPbRjuCnUDKH4rx3qa5F9oW90KPGoI6v
	wwDMAHkLBa30U4+p1iITln3ZjxSvOKhnIfmopvUfe79wkpTE8FHOYZKzh+QHEqhAW+2g+fKeehq
	FG+AirzY2j2AFTtGUYlAtyDTXfQVYqnYd+L2dIXRmi3WbSJrxXei2aw429sADzD2tHS2cdOkEDH
	+oMNFZlRSJi4K3aoYxkmmW3O/MuKHeRsKKZvg0iwBLXLJyaPkHuiG2nyKqiJB/e2Z55in2X5Buz
	P66cWBr52HA446oAoLtsZr4NiQUDx5uJyhtnudv1DobUxmrt+s0uzrUPHACKzVezB2LmnOv8TD7
	NrA0IthMkue4DlBdjbhXuzuqYQ4T14S8907P64Qkg1MhKpF3U/Yz7wYTe
X-Received: by 2002:a17:903:33c7:b0:235:737:7a8 with SMTP id d9443c01a7336-245ef14b727mr9669635ad.3.1755682622750;
        Wed, 20 Aug 2025 02:37:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrk5SksRA9uk/VyNvSYVTS1g5ngAwy3hrnfRKLAYmDynktsIKlvJe3cRKfQKJHfe1IWjn2CA==
X-Received: by 2002:a17:903:33c7:b0:235:737:7a8 with SMTP id d9443c01a7336-245ef14b727mr9669465ad.3.1755682622228;
        Wed, 20 Aug 2025 02:37:02 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed4ec100sm20954305ad.116.2025.08.20.02.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 02:37:01 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 17:34:53 +0800
Subject: [PATCH v3 11/14] phy: qcom: qmp-usbc: Finalize USB/DP switchable
 PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-add-displayport-support-for-qcs615-platform-v3-11-a43bd25ec39c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755682521; l=12787;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=q8YyvwtouFMxjAMATiwtXLflnc9t4c5fbKwPwNsKBOc=;
 b=qb0n/4KULl8bjq/PMNhyOpEtquCRY8hjsAPJhbcTOCVqp0WV8UZgIyN/vFG1hAQjeWIDUcMP5
 l04ahsgBfPaCKeog7XH16xeYZp+6FXuwzUjyD1btpk/3F9XrPkIsNPk
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-GUID: UnE2ArOGUixEh0Hjzg6EcLpapGuQw_bc
X-Proofpoint-ORIG-GUID: UnE2ArOGUixEh0Hjzg6EcLpapGuQw_bc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXy0yKslb/5E9q
 ynVnvQaG4Lc+sUXgIiM8fR7SWq94Ff53CZKQ6hyEV+PQZKkuC0IfHsTOrN2/+hD25cMycAajEXd
 ozOSf3VRmYxgL+hoRxSAq2Spyke2CBMUwlgyaSr6KELvT0t3RNUWOW1rPCtXdvnjxJt1VZ7Yf7E
 KoREE4F7ebSmEwelD05C0OcQomKlOEnTl3WSPs0epF2j7Mpejnvhh7FtswnkqylJtIOl+wqBnMP
 D9MXMDTuBv/5h17JFACnFMTsT7v5qiIlwJpjM01zzjiQVfOiQN81NxGYfxGhTKwSmzZL8Nphm+P
 +55IrG8gn0yR9gAMYtZnYCA8hUTPpdpQ1SaDJ6KBK79Cgl3NfB+AdQnr5uVo3BYj4xKMUMJ9rRQ
 t0ohuN40dqSUS0MKyuw4GbE87Uv2VA==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5973f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=s_XQLyGCJITBpQSLS4cA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Complete USB/DP switchable PHY integration by adding DP clock
registration, aux bridge setup, and DT parsing. Implement clock
provider logic for USB and DP branches, and extend PHY translation
to support both USB and DP instances.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 331 ++++++++++++++++++++++++++++---
 1 file changed, 299 insertions(+), 32 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 821398653bef23e1915d9d3a3a2950b0bfbefb9a..74b9f75c8864efe270f394bfbfd748793dada1f5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -995,6 +995,11 @@ static int qmp_usbc_usb_power_on(struct phy *phy)
 	qmp_configure(qmp->dev, qmp->serdes, cfg->serdes_tbl,
 		      cfg->serdes_tbl_num);
 
+	if (IS_ERR(qmp->pipe_clk)) {
+		return dev_err_probe(qmp->dev, PTR_ERR(qmp->pipe_clk),
+				     "pipe clock not defined\n");
+	}
+
 	ret = clk_prepare_enable(qmp->pipe_clk);
 	if (ret) {
 		dev_err(qmp->dev, "pipe_clk enable failed err=%d\n", ret);
@@ -1365,11 +1370,13 @@ static int __maybe_unused qmp_usbc_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(qmp->pipe_clk);
-	if (ret) {
-		dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
-		clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
-		return ret;
+	if (!IS_ERR(qmp->pipe_clk)) {
+		ret = clk_prepare_enable(qmp->pipe_clk);
+		if (ret) {
+			dev_err(dev, "pipe_clk enable failed, err=%d\n", ret);
+			clk_bulk_disable_unprepare(qmp->num_clks, qmp->clks);
+			return ret;
+		}
 	}
 
 	qmp_usbc_disable_autonomous_mode(qmp);
@@ -1422,9 +1429,23 @@ static int qmp_usbc_clk_init(struct qmp_usbc *qmp)
 	return devm_clk_bulk_get_optional(dev, num, qmp->clks);
 }
 
-static void phy_clk_release_provider(void *res)
+static struct clk_hw *qmp_usbc_clks_hw_get(struct of_phandle_args *clkspec, void *data)
 {
-	of_clk_del_provider(res);
+	struct qmp_usbc *qmp = data;
+
+	if (clkspec->args_count == 0)
+		return &qmp->pipe_clk_fixed.hw;
+
+	switch (clkspec->args[0]) {
+	case QMP_USB43DP_USB3_PIPE_CLK:
+		return &qmp->pipe_clk_fixed.hw;
+	case QMP_USB43DP_DP_LINK_CLK:
+		return &qmp->dp_link_hw;
+	case QMP_USB43DP_DP_VCO_DIV_CLK:
+		return &qmp->dp_pixel_hw;
+	}
+
+	return ERR_PTR(-EINVAL);
 }
 
 /*
@@ -1453,8 +1474,11 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 
 	ret = of_property_read_string(np, "clock-output-names", &init.name);
 	if (ret) {
-		dev_err(qmp->dev, "%pOFn: No clock-output-names\n", np);
-		return ret;
+		char name[64];
+
+		/* Clock name is not mandatory. */
+		snprintf(name, sizeof(name), "%s::pipe_clk", dev_name(qmp->dev));
+		init.name = name;
 	}
 
 	init.ops = &clk_fixed_rate_ops;
@@ -1463,19 +1487,7 @@ static int phy_pipe_clk_register(struct qmp_usbc *qmp, struct device_node *np)
 	fixed->fixed_rate = 125000000;
 	fixed->hw.init = &init;
 
-	ret = devm_clk_hw_register(qmp->dev, &fixed->hw);
-	if (ret)
-		return ret;
-
-	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
-	if (ret)
-		return ret;
-
-	/*
-	 * Roll a devm action because the clock provider is the child node, but
-	 * the child node is not actually a device.
-	 */
-	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
+	return devm_clk_hw_register(qmp->dev, &fixed->hw);
 }
 
 #if IS_ENABLED(CONFIG_TYPEC)
@@ -1660,6 +1672,235 @@ static int qmp_usbc_parse_tcsr(struct qmp_usbc *qmp)
 	return 0;
 }
 
+static int qmp_usbc_parse_usb3dp_dt(struct qmp_usbc *qmp)
+{
+	struct platform_device *pdev = to_platform_device(qmp->dev);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	const struct qmp_usbc_offsets *offs = cfg->offsets;
+	struct device *dev = qmp->dev;
+	void __iomem *base;
+	int ret;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	qmp->dp_serdes = base + offs->dp_serdes;
+	qmp->dp_tx = base + offs->dp_txa;
+	qmp->dp_tx2 = base + offs->dp_txb;
+	qmp->dp_dp_phy = base + offs->dp_dp_phy;
+	qmp->serdes = base + offs->serdes;
+	qmp->pcs = base + offs->pcs;
+	if (offs->pcs_misc)
+		qmp->pcs_misc = base + offs->pcs_misc;
+	qmp->tx = base + offs->tx;
+	qmp->rx = base + offs->rx;
+
+	qmp->tx2 = base + offs->tx2;
+	qmp->rx2 = base + offs->rx2;
+
+	ret = qmp_usbc_clk_init(qmp);
+	if (ret)
+		return ret;
+
+	qmp->pipe_clk = devm_clk_get(dev, "pipe");
+	if (IS_ERR(qmp->pipe_clk)) {
+		/* usb3dp allow no pipe clk define */
+		if (cfg->type == QMP_PHY_USBC_USB3_ONLY)
+			return dev_err_probe(dev, PTR_ERR(qmp->pipe_clk),
+						"failed to get pipe clock\n");
+	}
+
+	return 0;
+}
+
+/*
+ * Display Port PLL driver block diagram for branch clocks
+ *
+ *              +------------------------------+
+ *              |         DP_VCO_CLK           |
+ *              |                              |
+ *              |    +-------------------+     |
+ *              |    |   (DP PLL/VCO)    |     |
+ *              |    +---------+---------+     |
+ *              |              v               |
+ *              |   +----------+-----------+   |
+ *              |   | hsclk_divsel_clk_src |   |
+ *              |   +----------+-----------+   |
+ *              +------------------------------+
+ *                              |
+ *          +---------<---------v------------>----------+
+ *          |                                           |
+ * +--------v----------------+                          |
+ * |    dp_phy_pll_link_clk  |                          |
+ * |     link_clk            |                          |
+ * +--------+----------------+                          |
+ *          |                                           |
+ *          |                                           |
+ *          v                                           v
+ * Input to DISPCC block                                |
+ * for link clk, crypto clk                             |
+ * and interface clock                                  |
+ *                                                      |
+ *                                                      |
+ *      +--------<------------+-----------------+---<---+
+ *      |                     |                 |
+ * +----v---------+  +--------v-----+  +--------v------+
+ * | vco_divided  |  | vco_divided  |  | vco_divided   |
+ * |    _clk_src  |  |    _clk_src  |  |    _clk_src   |
+ * |              |  |              |  |               |
+ * |divsel_six    |  |  divsel_two  |  |  divsel_four  |
+ * +-------+------+  +-----+--------+  +--------+------+
+ *         |                 |                  |
+ *         v---->----------v-------------<------v
+ *                         |
+ *              +----------+-----------------+
+ *              |   dp_phy_pll_vco_div_clk   |
+ *              +---------+------------------+
+ *                        |
+ *                        v
+ *              Input to DISPCC block
+ *              for DP pixel clock
+ *
+ */
+static int qmp_dp_pixel_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 1620000000UL / 2:
+	case 2700000000UL / 2:
+	/* 5.4 and 8.1 GHz are same link rate as 2.7GHz, i.e. div 4 and div 6 */
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long qmp_dp_pixel_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qmp_usbc *qmp;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	qmp = container_of(hw, struct qmp_usbc, dp_pixel_hw);
+
+	dp_opts = &qmp->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		return 1620000000UL / 2;
+	case 2700:
+		return 2700000000UL / 2;
+	case 5400:
+		return 5400000000UL / 4;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qmp_dp_pixel_clk_ops = {
+	.determine_rate	= qmp_dp_pixel_clk_determine_rate,
+	.recalc_rate	= qmp_dp_pixel_clk_recalc_rate,
+};
+
+static int qmp_dp_link_clk_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	switch (req->rate) {
+	case 162000000:
+	case 270000000:
+	case 540000000:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+static unsigned long qmp_dp_link_clk_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	const struct qmp_usbc *qmp;
+	const struct phy_configure_opts_dp *dp_opts;
+
+	qmp = container_of(hw, struct qmp_usbc, dp_link_hw);
+	dp_opts = &qmp->dp_opts;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+	case 2700:
+	case 5400:
+		return dp_opts->link_rate * 100000;
+	default:
+		return 0;
+	}
+}
+
+static const struct clk_ops qmp_dp_link_clk_ops = {
+	.determine_rate	= qmp_dp_link_clk_determine_rate,
+	.recalc_rate	= qmp_dp_link_clk_recalc_rate,
+};
+
+static int phy_dp_clks_register(struct qmp_usbc *qmp, struct device_node *np)
+{
+	struct clk_init_data init = { };
+	char name[64];
+	int ret;
+
+	snprintf(name, sizeof(name), "%s::link_clk", dev_name(qmp->dev));
+	init.ops = &qmp_dp_link_clk_ops;
+	init.name = name;
+	qmp->dp_link_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_link_hw);
+	if (ret < 0) {
+		dev_err(qmp->dev, "link clk reg fail ret=%d\n", ret);
+		return ret;
+	}
+
+	snprintf(name, sizeof(name), "%s::vco_div_clk", dev_name(qmp->dev));
+	init.ops = &qmp_dp_pixel_clk_ops;
+	init.name = name;
+	qmp->dp_pixel_hw.init = &init;
+	ret = devm_clk_hw_register(qmp->dev, &qmp->dp_pixel_hw);
+	if (ret) {
+		dev_err(qmp->dev, "pxl clk reg fail ret=%d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
+{
+	int ret;
+
+	if (!IS_ERR(qmp->pipe_clk)) {
+		ret = phy_pipe_clk_register(qmp, np);
+		if (ret)
+			return ret;
+	}
+
+	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
+		ret = phy_dp_clks_register(qmp, np);
+		if (ret)
+			return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
+}
+
+static struct phy *qmp_usbc_phy_xlate(struct device *dev, const struct of_phandle_args *args)
+{
+	struct qmp_usbc *qmp = dev_get_drvdata(dev);
+
+	if (args->args_count == 0)
+		return qmp->usb_phy;
+
+	switch (args->args[0]) {
+	case QMP_USB43DP_USB3_PHY:
+		return qmp->usb_phy;
+	case QMP_USB43DP_DP_PHY:
+		return qmp->dp_phy;
+	}
+
+	return ERR_PTR(-EINVAL);
+}
+
 static int qmp_usbc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -1703,16 +1944,32 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	/* Check for legacy binding with child node. */
-	np = of_get_child_by_name(dev->of_node, "phy");
-	if (np) {
-		ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
-	} else {
+	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
 		np = of_node_get(dev->of_node);
-		ret = qmp_usbc_parse_usb_dt(qmp);
+
+		ret = qmp_usbc_parse_usb3dp_dt(qmp);
+		if (ret) {
+			dev_err(qmp->dev, "parse DP dt fail ret=%d\n", ret);
+			goto err_node_put;
+		}
+
+		ret = drm_aux_bridge_register(dev);
+		if (ret) {
+			dev_err(qmp->dev, "aux bridge reg fail ret=%d\n", ret);
+			goto err_node_put;
+		}
+	} else {
+		/* Check for legacy binding with child node. */
+		np = of_get_child_by_name(dev->of_node, "phy");
+		if (np) {
+			ret = qmp_usbc_parse_usb_dt_legacy(qmp, np);
+		} else {
+			np = of_node_get(dev->of_node);
+			ret = qmp_usbc_parse_usb_dt(qmp);
+		}
+		if (ret)
+			goto err_node_put;
 	}
-	if (ret)
-		goto err_node_put;
 
 	pm_runtime_set_active(dev);
 	ret = devm_pm_runtime_enable(dev);
@@ -1724,7 +1981,7 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 	 */
 	pm_runtime_forbid(dev);
 
-	ret = phy_pipe_clk_register(qmp, np);
+	ret = qmp_usbc_register_clocks(qmp, np);
 	if (ret)
 		goto err_node_put;
 
@@ -1737,9 +1994,19 @@ static int qmp_usbc_probe(struct platform_device *pdev)
 
 	phy_set_drvdata(qmp->usb_phy, qmp);
 
+	if (qmp->cfg->type == QMP_PHY_USBC_USB3_DP) {
+		qmp->dp_phy = devm_phy_create(dev, np, &qmp_usbc_dp_phy_ops);
+		if (IS_ERR(qmp->dp_phy)) {
+			ret = PTR_ERR(qmp->dp_phy);
+			dev_err(dev, "failed to create PHY: %d\n", ret);
+			goto err_node_put;
+		}
+		phy_set_drvdata(qmp->dp_phy, qmp);
+	}
+
 	of_node_put(np);
 
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	phy_provider = devm_of_phy_provider_register(dev, qmp_usbc_phy_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
 

-- 
2.34.1


