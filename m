Return-Path: <linux-arm-msm+bounces-48010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF160A35BC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 11:47:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A43188F684
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2025 10:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67151261369;
	Fri, 14 Feb 2025 10:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eYhiOMAJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47E325C6F2;
	Fri, 14 Feb 2025 10:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739529962; cv=none; b=sxn0kpYK3SgQ/DrpWGR24kco35Q7JtZGo2PX4qnXoi9XsK2OHZSYhESu5Mxeok+96vGlyjcs0YvzmiGhlFqi64QLocaZvYu08+VwcyqZI++ELw0q9FYmyNLS+2DMN4ytjlq0ymTr3RqFNuOM0bCWbCRr+xNSYYeUVjRtRaP59ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739529962; c=relaxed/simple;
	bh=i4H1ZohnNi3f2NljAShhMHx8wdM90Nv4/s/U7AZr9Ro=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tBWOw388tm5L7hn0mUCR24Ju0Ulmcan2HFZmTSMZyUo3io+JJtvPxQ3/WqEhM6CuH6mifK+XwBMPLNvlk1MzSGMn/L3UdVq4tZhIKS2lFMKqlQZVHQJe5y1mG1W+5HP+DoSmHO9mFkLAUwGuSUHZQfib2SYwN6/Ixn3zTUiu/tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eYhiOMAJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E9ApUs027463;
	Fri, 14 Feb 2025 10:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PcocqT3klzs
	RJTTK1QX9bOfky8+sArDLX6/eEnBuMEw=; b=eYhiOMAJCMaiqNrAFm/qV49GBgV
	b+K3gy8DufmyzkZkFouzESnCylxPPESMVGZJ/nK42nw1lcujKjCz9GzaKj8HRXQG
	C1HjO1GhUzQUGoyayItwcwGlhHhWweITXkAvJCyZfeQJVu9FXongBaHjHJn++aiE
	/yi4tXvfwM31lWJOx0qWqxrW6Qrvmoo6hK+PGhHHNtrUZoUBQCrb9T1fur4E7QP2
	JoC4Pi7bOaN6LDHQG8+Gxd/jvQApjZyQi5nj/7nKaVa5IG47Sp25RRh8wfGKP0qk
	M3zUwbwk0s+KZ4qr+BpMbzIc+Vr3/3qIagBGPmdvK3slSxCzeDGIGlbAu3w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44sebnbf31-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:45:53 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51EAjpnw010548;
	Fri, 14 Feb 2025 10:45:51 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 44p0bm4h3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:45:51 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51EAjohK010535;
	Fri, 14 Feb 2025 10:45:50 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 51EAjoaM010534
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 10:45:50 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 97E7340BE6; Fri, 14 Feb 2025 18:45:49 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: vkoul@kernel.org, kishon@kernel.org, p.zabel@pengutronix.de,
        dmitry.baryshkov@linaro.org, abel.vesa@linaro.org,
        quic_qianyu@quicinc.com, neil.armstrong@linaro.org,
        manivannan.sadhasivam@linaro.org, quic_devipriy@quicinc.com,
        konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>
Subject: [PATCH v3 2/2] phy: qcom: qmp-pcie: Add PHY register retention support
Date: Fri, 14 Feb 2025 18:45:39 +0800
Message-Id: <20250214104539.281846-3-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250214104539.281846-1-quic_wenbyao@quicinc.com>
References: <20250214104539.281846-1-quic_wenbyao@quicinc.com>
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
X-Proofpoint-GUID: I8pt6kBK3kO7NHos3bgNs-cxFDuPm03K
X-Proofpoint-ORIG-GUID: I8pt6kBK3kO7NHos3bgNs-cxFDuPm03K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_04,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502140078

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
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 96 ++++++++++++++++--------
 1 file changed, 63 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index 219266125cf2..b3912c1a6de8 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -2805,6 +2805,7 @@ struct qmp_pcie {
 
 	const struct qmp_phy_cfg *cfg;
 	bool tcsr_4ln_config;
+	bool skip_init;
 
 	void __iomem *serdes;
 	void __iomem *pcs;
@@ -3976,7 +3977,9 @@ static int qmp_pcie_init(struct phy *phy)
 {
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	void __iomem *pcs = qmp->pcs;
 	int ret;
+	bool phy_initialized;
 
 	ret = regulator_bulk_enable(cfg->num_vregs, qmp->vregs);
 	if (ret) {
@@ -3984,10 +3987,18 @@ static int qmp_pcie_init(struct phy *phy)
 		return ret;
 	}
 
-	ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
-	if (ret) {
-		dev_err(qmp->dev, "reset assert failed\n");
-		goto err_disable_regulators;
+	phy_initialized = !!(readl(pcs + cfg->regs[QPHY_START_CTRL]));
+	qmp->skip_init = qmp->nocsr_reset && phy_initialized;
+	/*
+	 * Toggle BCR reset for phy that doesn't support no_csr
+	 * reset or has not been initialized
+	 */
+	if (!qmp->skip_init) {
+		ret = reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+		if (ret) {
+			dev_err(qmp->dev, "reset assert failed\n");
+			goto err_disable_regulators;
+		}
 	}
 
 	ret = reset_control_assert(qmp->nocsr_reset);
@@ -3998,10 +4009,12 @@ static int qmp_pcie_init(struct phy *phy)
 
 	usleep_range(200, 300);
 
-	ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
-	if (ret) {
-		dev_err(qmp->dev, "reset deassert failed\n");
-		goto err_assert_reset;
+	if (!qmp->skip_init) {
+		ret = reset_control_bulk_deassert(cfg->num_resets, qmp->resets);
+		if (ret) {
+			dev_err(qmp->dev, "reset deassert failed\n");
+			goto err_assert_reset;
+		}
 	}
 
 	ret = clk_bulk_prepare_enable(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
@@ -4011,7 +4024,8 @@ static int qmp_pcie_init(struct phy *phy)
 	return 0;
 
 err_assert_reset:
-	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (!qmp->skip_init)
+		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
 err_disable_regulators:
 	regulator_bulk_disable(cfg->num_vregs, qmp->vregs);
 
@@ -4023,7 +4037,10 @@ static int qmp_pcie_exit(struct phy *phy)
 	struct qmp_pcie *qmp = phy_get_drvdata(phy);
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
 
-	reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	if (!qmp->nocsr_reset)
+		reset_control_bulk_assert(cfg->num_resets, qmp->resets);
+	else
+		reset_control_assert(qmp->nocsr_reset);
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(qmp_pciephy_clk_l), qmp->clks);
 
@@ -4042,16 +4059,22 @@ static int qmp_pcie_power_on(struct phy *phy)
 	unsigned int mask, val;
 	int ret;
 
-	qphy_setbits(pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			cfg->pwrdn_ctrl);
+	/*
+	 * Write CSR register for phy that doesn't support no_csr
+	 * reset or has not been initialized
+	 */
+	if (!qmp->skip_init) {
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
@@ -4063,15 +4086,16 @@ static int qmp_pcie_power_on(struct phy *phy)
 		goto err_disable_pipe_clk;
 	}
 
-	/* Pull PHY out of reset state */
-	qphy_clrbits(pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	if (!qmp->skip_init) {
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
@@ -4096,16 +4120,22 @@ static int qmp_pcie_power_off(struct phy *phy)
 
 	clk_bulk_disable_unprepare(qmp->num_pipe_clks, qmp->pipe_clks);
 
-	/* PHY reset */
-	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
+	/* If a PHY supports no_csr reset but isn't enabled in the bootloader,
+	 * phy settings can be reused during the D3cold -> D0 cycle. So it is
+	 * unnecessary to check qmp->skip_init.
+	 */
+	if (!qmp->nocsr_reset) {
+		/* PHY reset */
+		qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
 
-	/* stop SerDes and Phy-Coding-Sublayer */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
-			SERDES_START | PCS_START);
+		/* stop SerDes and Phy-Coding-Sublayer */
+		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_START_CTRL],
+				SERDES_START | PCS_START);
 
-	/* Put PHY into POWER DOWN state: active low */
-	qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
-			cfg->pwrdn_ctrl);
+		/* Put PHY into POWER DOWN state: active low */
+		qphy_clrbits(qmp->pcs, cfg->regs[QPHY_PCS_POWER_DOWN_CONTROL],
+				cfg->pwrdn_ctrl);
+	}
 
 	return 0;
 }
-- 
2.34.1


