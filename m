Return-Path: <linux-arm-msm+bounces-47536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DC7A3076C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 10:43:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F7207A3B8E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 09:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C018F1F153A;
	Tue, 11 Feb 2025 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="pZaquEQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055751F1530;
	Tue, 11 Feb 2025 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266984; cv=none; b=VwDZXGgA2SPkbzSRAZv/dw/Bubt0333gSvg108QhEr6UXQzW3i+T2+cHPPH4Jt++eLVtvBjj1eG3ipiOYvetDhgTGBp8kGYalPVRw+T+OF5orC3jJhsbtycBmuSXGz3Zmt+b6EZ32icIIc08fIfpx2kUCYVRNG8BKKRlmL71xOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266984; c=relaxed/simple;
	bh=UDUBWOYE0MJmtSRQUpSl2kGFJ6PkBRXwv4eRQHw4x5w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SYQjsg7vfiaij4b5SLwy1B/NFxjNRNDZqhvTgheWfOh08BIETR3+Ijefo1bnpFybqDZ2jzMNsEyiu0E11JMpjTakAgcpVAABnGtOgsbFiLd1yQPSECgnN0a7WR/XHQL0X+VZqEfKB2+CVo4a0T8w9ogDXqqd5zSt/VzNcbts9iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=pZaquEQq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B0SXSH000369;
	Tue, 11 Feb 2025 09:42:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ddm6e6oeL1J
	8QGmqUUhqwVMx8Y75jlwFElDicUEe0NA=; b=pZaquEQqu+iBnWS4WF7h6/hrj67
	+iX/poUWaGMlvNOBodDhwH0wMlSe/olmfakx7P6I3WVRFWTZ/405n0xRmXadDFBA
	XbZCfknlAs8RclZOP31zgiW9K1Cr0OCF6k7abF0BdVm2Z9l+wt3DGrYixuJltQNR
	jWzwScql9Pq2DOUQvdy0E33EQT1EStCDsnJmF8sz9qctNzAlcDi5+FWjSjjk5jet
	px8n2j6hTofCBqdmDtYs3QIEgJK6e41oot2nVJbWcYaXLKDSPTBx9d30JfWgm1cD
	qfLF4BvoaDcrr4HnLm3UOQpHqIlOD2NeJwBfp2XgkCAtC1tV+VbBh/OgGSw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qgtk33kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 09:42:47 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51B9gjMH012321;
	Tue, 11 Feb 2025 09:42:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44p0bkpchb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 09:42:45 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51B9gje6012313;
	Tue, 11 Feb 2025 09:42:45 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51B9gjrL012306
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 09:42:45 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 1CAD340BEB; Tue, 11 Feb 2025 17:42:44 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v2 2/2] phy: qcom: qmp-pcie: Add PHY register retention support
Date: Tue, 11 Feb 2025 17:42:31 +0800
Message-Id: <20250211094231.1813558-3-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
References: <20250211094231.1813558-1-quic_wenbyao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T1oMJVH0OPOia2dDFcxamurKuAGYqhGR
X-Proofpoint-ORIG-GUID: T1oMJVH0OPOia2dDFcxamurKuAGYqhGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_04,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 suspectscore=0 phishscore=0 impostorscore=0
 adultscore=0 clxscore=1015 mlxscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110060

From: Qiang Yu <quic_qianyu@quicinc.com>

Some QCOM PCIe PHYs support no_csr reset. Unlike BCR reset which resets the
whole PHY (hardware and register), no_csr reset only resets PHY hardware
but retains register values, which means PHY setting can be skipped during
PHY init if PCIe link is enabled in booltloader and only no_csr is toggled
after that.

Hence, determine whether the PHY has been enabled in bootloader by
verifying QPHY_START_CTRL register. If it's programmed and no_csr reset is
available, skip BCR reset and PHY register setting to establish the PCIe
link with bootloader - programmed PHY settings.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 91 +++++++++++++++---------
 1 file changed, 58 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index ac42e4b01065..7f0802d09812 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2805,6 +2805,7 @@ struct qmp_pcie {
 
 	const struct qmp_phy_cfg *cfg;
 	bool tcsr_4ln_config;
+	bool phy_initialized;
 
 	void __iomem *serdes;
 	void __iomem *pcs;
@@ -3976,6 +3977,7 @@ static int qmp_pcie_init(struct phy *phy)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *pcs = qmp->pcs;
 	int ret;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
@@ -3984,10 +3986,17 @@ static int qmp_pcie_init(struct phy *phy)
 		return ret;
 	}
 
-	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
-	if (ret) {
-		dev_err(qmp->dev, "reset assert failed\n");
-		goto err_disable_regulators;
+	qmp->phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
+	/*
+	 * Toggle BCR reset for phy that doesn't support no_csr
+	 * reset or has not been initialized
+	 */
+	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
+		ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+		if (ret) {
+			dev_err(qmp->dev, "reset assert failed\n");
+			goto err_disable_regulators;
+		}
 	}
 
 	ret = reset_control_assert(qmp->nocsr_reset);
@@ -3998,10 +4007,12 @@ static int qmp_pcie_init(struct phy *phy)
 
 	usleep_range(200, 300);
 
-	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
-	if (ret) {
-		dev_err(qmp->dev, "reset deassert failed\n");
-		goto err_assert_reset;
+	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
+		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
+		if (ret) {
+			dev_err(qmp->dev, "reset deassert failed\n");
+			goto err_assert_reset;
+		}
 	}
 
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
@@ -4011,7 +4022,8 @@ static int qmp_pcie_init(struct phy *phy)
 	return 0;
 
 err_assert_reset:
-	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (!qmp->nocsr_reset || !qmp->phy_initialized)
+		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -4023,7 +4035,10 @@ static int qmp_pcie_exit(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (!qmp->nocsr_reset)
+		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	else
+		reset_control_assert(qmp->nocsr_reset);
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
 
@@ -4042,16 +4057,22 @@ static int qmp_pcie_power_on(struct phy *phy)
 	unsigned int mask, val;
 	int ret;
 
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			cfg->pwrdn_ctrl);
+	/*
+	 * Write CSR register for phy that doesn't support no_csr
+	 * reset or has not been initialized
+	 */
+	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
+		qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				cfg->pwrdn_ctrl);
 
-	if (qmp->mode == PHY_MODE_PCIE_RC)
-		mode_tbls = cfg->tbls_rc;
-	else
-		mode_tbls = cfg->tbls_ep;
+		if (qmp->mode == PHY_MODE_PCIE_RC)
+			mode_tbls = cfg->tbls_rc;
+		else
+			mode_tbls = cfg->tbls_ep;
 
-	qmp_pcie_init_registers(qmp, &cfg->tbls);
-	qmp_pcie_init_registers(qmp, mode_tbls);
+		qmp_pcie_init_registers(qmp, &cfg->tbls);
+		qmp_pcie_init_registers(qmp, mode_tbls);
+	}
 
 	ret = clk_bulk_prepare_enable(qmp->num_pipe_clks, qmp->pipe_clks);
 	if (ret)
@@ -4063,15 +4084,16 @@ static int qmp_pcie_power_on(struct phy *phy)
 		goto err_disable_pipe_clk;
 	}
 
-	/* Pull PHY out of reset state */
-	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	if (!qmp->nocsr_reset || !qmp->phy_initialized) {
+		/* Pull PHY out of reset state */
+		qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-	/* start SerDes and Phy-Coding-Sublayer */
-	qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
-
-	if (!cfg->skip_start_delay)
-		usleep_range(1000, 1200);
+		/* start SerDes and Phy-Coding-Sublayer */
+		qphy_setbits(pcs, cfg->regs[QPHY_START_CTRL], SERDES_START | PCS_START);
 
+		if (!cfg->skip_start_delay)
+			usleep_range(1000, 1200);
+	}
 	status = pcs + cfg->regs[QPHY_PCS_STATUS];
 	mask = cfg->phy_status;
 	ret = readl_poll_timeout(status, val, !(val & mask), 200,
@@ -4096,16 +4118,19 @@ static int qmp_pcie_power_off(struct phy *phy)
 
 	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
 
-	/* PHY reset */
-	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-	/* stop SerDes and Phy-Coding-Sublayer */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
-			SERDES_START | PCS_START);
+	if (!qmp->nocsr_reset) {
+		/* PHY reset */
+		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-	/* Put PHY into POWER DOWN state: active low */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			cfg->pwrdn_ctrl);
+		/* stop SerDes and Phy-Coding-Sublayer */
+		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
+				SERDES_START | PCS_START);
+
+		/* Put PHY into POWER DOWN state: active low */
+		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				cfg->pwrdn_ctrl);
+	}
 
 	return 0;
 }
-- 
2.34.1


