Return-Path: <linux-arm-msm+bounces-37314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7029C1524
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 05:10:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1E6F1F21F18
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 04:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE381C7B8F;
	Fri,  8 Nov 2024 04:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Wk5tj1Zf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9FBA194A68;
	Fri,  8 Nov 2024 04:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039025; cv=none; b=uOlq6hrZR97pxqkr0f93JQXL+cMmL6suMa1DfehAKrmbg1DjB1IAMugRmUKCKEDOe9uAbgjCEAOw7GcbfujNTpxWG3ZEoxggQv45x+zau003AVWXLgElkhPoBs56rx3w6uYEqL6bmlCg5pU/muKlR4XNpuVpKpTlXG8LkunQ0/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039025; c=relaxed/simple;
	bh=x8pRv+TevxojuzkF1VPiKkrJZGlxgGxlknCblU1sX/A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tu+skjLAovnrlTIBTrK2Jg0Z/8EFKXQXiAUV6ke272I9KOnEw8WkVmE6JrLIgf0gNpFe97qR5z5bulaxPkrYAn69po4vBUbVA3GmfCcLBG7KvnTOIe1w2AtW2AhUXp7ZuFP38JfePY6Ls3yxAJfZM30IF7vJHaLeELx75IkJJbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Wk5tj1Zf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7MbKl7012125;
	Fri, 8 Nov 2024 04:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0YCmv4L34VsXx/JBZpKkoOE2xgh5yH1w//B2d2zXcbw=; b=Wk5tj1Zf6+IYqVLn
	kP+XVLj3vscdyLVC71P/TlXIviqA3MKCADJ6uzS3K7r0nBhF9IoavyjKy9iaUwHF
	opqTv8VsrWVGa4OVql9Y3L9++ENS0obyhWtWAOMIvOcv8JEYCeZwJd8mw/Irrmm4
	8Tde76MAoN65D6ER2f/5MLwv/d6Z14kNrY5dx9ZuHBX/Q+3m8E/5iQlusgJg6ChL
	ZIaVhhjBc3XmJJksk4hrqHxuGLHKbtm9ryBNjNIKtCn5y+N41sLS8VfKyUQn77+h
	Gtr0f/0ijLHIlg9l44xSvMciQhlf7VgUDUbpP2DIg7ipUD1RtdFZtTlcd56bOI0j
	v7upnQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gm0kt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 04:09:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A849pPu011768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 04:09:51 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 20:09:46 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 8 Nov 2024 09:39:19 +0530
Subject: [PATCH v3 02/11] clk: qcom: clk-alpha-pll: Add support for dynamic
 update for slewing PLLs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241108-qcs615-mm-clockcontroller-v3-2-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FbSYT5E-FikJyQFzdJ5tChrk4T3y3kCQ
X-Proofpoint-GUID: FbSYT5E-FikJyQFzdJ5tChrk4T3y3kCQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080034

The alpha PLLs which slew to a new frequency at runtime would require
the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
which can support the slewing of the PLL to a new frequency.

Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 170 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |   1 +
 2 files changed, 171 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 03cc7aa092480bfdd9eaa986d44f0545944b3b89..fe9e5d5344d7fa9a8a1f220f8982fbafc875c4c1 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2758,3 +2758,173 @@ const struct clk_ops clk_alpha_pll_regera_ops = {
 	.set_rate = clk_zonda_pll_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regera_ops);
+
+static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
+{
+	int ret;
+	u32 val;
+
+	regmap_update_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE, PLL_UPDATE);
+	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
+
+	ret = wait_for_pll_update(pll);
+	if (ret)
+		return ret;
+	/*
+	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
+	 * detect bit. Have a delay of 1us just to be safe.
+	 */
+	mb();
+	udelay(1);
+
+	return wait_for_pll_enable_lock(pll);
+}
+
+static int clk_alpha_pll_slew_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	unsigned long freq_hz;
+	const struct pll_vco *curr_vco, *vco;
+	u32 l, alpha_width = pll_alpha_width(pll);
+	u64 a;
+
+	freq_hz =  alpha_pll_round_rate(rate, parent_rate, &l, &a, alpha_width);
+	if (freq_hz != rate) {
+		pr_err("alpha_pll: Call clk_set_rate with rounded rates!\n");
+		return -EINVAL;
+	}
+
+	curr_vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
+	if (!curr_vco) {
+		pr_err("alpha pll: not in a valid vco range\n");
+		return -EINVAL;
+	}
+
+	vco = alpha_pll_find_vco(pll, freq_hz);
+	if (!vco) {
+		pr_err("alpha pll: not in a valid vco range\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * Dynamic pll update will not support switching frequencies across
+	 * vco ranges. In those cases fall back to normal alpha set rate.
+	 */
+	if (curr_vco->val != vco->val)
+		return clk_alpha_pll_set_rate(hw, rate, parent_rate);
+
+	a = a << (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
+
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
+
+	/* Ensure that the write above goes through before proceeding. */
+	mb();
+
+	if (clk_hw_is_enabled(hw))
+		return clk_alpha_pll_slew_update(pll);
+
+	return 0;
+}
+
+/*
+ * Slewing plls should be bought up at frequency which is in the middle of the
+ * desired VCO range. So after bringing up the pll at calibration freq, set it
+ * back to desired frequency(that was set by previous clk_set_rate).
+ */
+static int clk_alpha_pll_calibrate(struct clk_hw *hw)
+{
+	unsigned long calibration_freq, freq_hz;
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct clk_hw *parent;
+	const struct pll_vco *vco;
+	u32 l, alpha_width = pll_alpha_width(pll);
+	int rc;
+	u64 a;
+
+	parent = clk_hw_get_parent(hw);
+	if (!parent) {
+		pr_err("alpha pll: no valid parent found\n");
+		return -EINVAL;
+	}
+
+	vco = alpha_pll_find_vco(pll, clk_hw_get_rate(hw));
+	if (!vco) {
+		pr_err("alpha pll: not in a valid vco range\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * As during slewing plls vco_sel won't be allowed to change, vco table
+	 * should have only one entry table, i.e. index = 0, find the
+	 * calibration frequency.
+	 */
+	calibration_freq = (pll->vco_table[0].min_freq + pll->vco_table[0].max_freq) / 2;
+
+	freq_hz = alpha_pll_round_rate(calibration_freq, clk_hw_get_rate(parent),
+					&l, &a, alpha_width);
+	if (freq_hz != calibration_freq) {
+		pr_err("alpha_pll: call clk_set_rate with rounded rates!\n");
+		return -EINVAL;
+	}
+
+	/* Setup PLL for calibration frequency */
+	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
+
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
+
+	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_VCO_MASK << PLL_VCO_SHIFT,
+				vco->val << PLL_VCO_SHIFT);
+
+	/* Bringup the pll at calibration frequency */
+	rc = clk_alpha_pll_enable(hw);
+	if (rc) {
+		pr_err("alpha pll calibration failed\n");
+		return rc;
+	}
+
+	/*
+	 * PLL is already running at calibration frequency.
+	 * So slew pll to the previously set frequency.
+	 */
+	freq_hz = alpha_pll_round_rate(clk_hw_get_rate(hw),
+			clk_hw_get_rate(parent), &l, &a, alpha_width);
+
+	pr_debug("pll %s: setting back to required rate %lu, freq_hz %ld\n",
+		clk_hw_get_name(hw), clk_hw_get_rate(hw), freq_hz);
+
+	/* Setup the PLL for the new frequency */
+	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
+
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
+
+	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN, PLL_ALPHA_EN);
+
+	return clk_alpha_pll_slew_update(pll);
+}
+
+static int clk_alpha_pll_slew_enable(struct clk_hw *hw)
+{
+	int rc;
+
+	rc = clk_alpha_pll_calibrate(hw);
+	if (rc)
+		return rc;
+
+	return clk_alpha_pll_enable(hw);
+}
+
+const struct clk_ops clk_alpha_pll_slew_ops = {
+	.enable = clk_alpha_pll_slew_enable,
+	.disable = clk_alpha_pll_disable,
+	.recalc_rate = clk_alpha_pll_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = clk_alpha_pll_slew_set_rate,
+};
+EXPORT_SYMBOL(clk_alpha_pll_slew_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 55eca04b23a1fc3f3554f43a8fdd329a524dad0e..f149d10247bd4a85521940a1255cd019bde4729a 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -195,6 +195,7 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 
 extern const struct clk_ops clk_alpha_pll_regera_ops;
+extern const struct clk_ops clk_alpha_pll_slew_ops;
 
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);

-- 
2.45.2


