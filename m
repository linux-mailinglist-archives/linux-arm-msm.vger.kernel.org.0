Return-Path: <linux-arm-msm+bounces-63342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39919AF0ED6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 780B14E547A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB0C243964;
	Wed,  2 Jul 2025 09:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cJuLTJg9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46E724167F;
	Wed,  2 Jul 2025 09:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447140; cv=none; b=nPtU6VvbLh9VvUKT0jMhpUfgBpowhJj268aDj7ieYIUPndaiYLCF2kK+gb/xMydKB5GDFdL1yvy3V/H6SHvjdWoHSXOHnT5CiTErPhgHDkTfh/VG1cnmDtZNlQZxRgQ8rjV1SxihvPZmfEaOj2CtJXJjy5T7HZngEAB0e7S40uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447140; c=relaxed/simple;
	bh=v2KmNiv2zaiWQ0FlFXXxh2IbcUMft4QWS51rPlx3ppc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rMLzGNx+bvCsOQRYYGHGf2f2OpK/oVNBWCBPE3v+42/AdDo0feJgfm9FHPOHV1K/nZhpR6D1eLf6tKxH+pOhyTix0LVl2ca3miZR4oYoxM+b/Hs79TPYQX+7eU086J+ZtAQYdHdYS5k8q2V7vlMBiYr59iUezucFixICMQL3bek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cJuLTJg9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56270f7X024875;
	Wed, 2 Jul 2025 09:05:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zU2XWqSviLDYr6fxM7rA5jCXANPu/eQbR/mM4cIdn6g=; b=cJuLTJg9HDVJbjRu
	vB4ldLc7lejDU1sA3aIbFKzRO2GBggxD5PW4g7BHidDkE3W1AUYm4oz7Qeg2KkUJ
	OZulnE8v+/+BT4uxoQW2L6uabDPYXFO4wjSBKlCxIKiGzIR7TaGZ32A4d6xDvJPX
	t7EyMVTA4ccKf1IqXfxeRJilqPK3+2p4sK8gh9IWfy8KbY7rrImwEF9BO19zlIgf
	ocMmgaPwupsgflgjscgc/xAOb7MDLeB8Ct5HUfWE86ZFI9B1UcTDWKn/AWzG5H//
	/qissaXSRxO0M/ApduncBZxHyxr3oa8jMKYGD9/UKu35eDH3DPYao6FzG/PjjYLd
	sy9QPA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8023swh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:05:25 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5629533q005667
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:05:03 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:04:58 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 2 Jul 2025 14:34:21 +0530
Subject: [PATCH v11 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-1-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
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
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ILQ_LBKPQLtx8rh7BKxJELHv-0lSN_3t
X-Authority-Analysis: v=2.4 cv=YPWfyQGx c=1 sm=1 tr=0 ts=6864f655 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=rpD9z14lcGW1emOW4AAA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ILQ_LBKPQLtx8rh7BKxJELHv-0lSN_3t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MyBTYWx0ZWRfX5O+VoeTtRzWf
 zr14BfET5ubgcksEhv2a9+6VzFnkv30MP8fhvYfa3BRzU5mGX9YZianB6XSabmkhK2PSO82xntn
 VVBAFfY1u+Df+DATyDoX+9Oo67++b7P9zPX8F/hOViMIIRk7S0QOgYWvtns9PU1i7H8pidTpNNW
 Z2IkvfnclSFscI53tgqX90byCsblKVdZRpFEyMw5+dNakQ1GPZZXBNMeZ/V7HNjB4OiaK/AWzMg
 123gQDKkjNyQDrLP9iyJyBWAsSLZATwkVCn+dFTwrxcszrETSlPICzsKulWzUKGrGOPibtSmHpI
 bm7l/v3mj+AC7ERD0yP/LsM81zA7CpjOdeDnkTyWXpaDH/v0zxcC9tX45EPcQDff/ImsLEstpft
 jof3OJ2lXv4iluBbhWt6YFIuhFvF2O1C+RiqfpXV4Ks7Kl1XTAoA6yv/xcRqVtj6wEnTEuzf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020073

The alpha PLLs which slew to a new frequency at runtime would require
the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
which can support the slewing of the PLL to a new frequency.

Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 192 +++++++++++++++++++++++++++++++++++----
 drivers/clk/qcom/clk-alpha-pll.h |   1 +
 2 files changed, 175 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d8e1cd1263317814da2d0414600988de4b87c56f..fec6eb376e2707deda11609fe5d0d45082048a0b 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -790,6 +790,29 @@ static int clk_alpha_pll_update_latch(struct clk_alpha_pll *pll,
 	return __clk_alpha_pll_update_latch(pll);
 }
 
+static void clk_alpha_pll_update_configs(struct clk_alpha_pll *pll, const struct pll_vco *vco,
+					 u32 l, u64 alpha, u32 alpha_width, bool alpha_en)
+{
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+
+	if (alpha_width > ALPHA_BITWIDTH)
+		alpha <<= alpha_width - ALPHA_BITWIDTH;
+
+	if (alpha_width > 32)
+		regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(alpha));
+
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(alpha));
+
+	if (vco) {
+		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
+				   PLL_VCO_MASK << PLL_VCO_SHIFT,
+				   vco->val << PLL_VCO_SHIFT);
+	}
+
+	if (alpha_en)
+		regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
+}
+
 static int __clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long prate,
 				    int (*is_enabled)(struct clk_hw *))
@@ -807,24 +830,7 @@ static int __clk_alpha_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 		return -EINVAL;
 	}
 
-	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
-
-	if (alpha_width > ALPHA_BITWIDTH)
-		a <<= alpha_width - ALPHA_BITWIDTH;
-
-	if (alpha_width > 32)
-		regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), a >> 32);
-
-	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), a);
-
-	if (vco) {
-		regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
-				   PLL_VCO_MASK << PLL_VCO_SHIFT,
-				   vco->val << PLL_VCO_SHIFT);
-	}
-
-	regmap_update_bits(pll->clkr.regmap, PLL_USER_CTL(pll),
-			   PLL_ALPHA_EN, PLL_ALPHA_EN);
+	clk_alpha_pll_update_configs(pll, vco, l, a, alpha_width, true);
 
 	return clk_alpha_pll_update_latch(pll, is_enabled);
 }
@@ -3017,3 +3023,153 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
 	}
 }
 EXPORT_SYMBOL_GPL(qcom_clk_alpha_pll_configure);
+
+static int clk_alpha_pll_slew_update(struct clk_alpha_pll *pll)
+{
+	u32 val;
+	int ret;
+
+	regmap_set_bits(pll->clkr.regmap, PLL_MODE(pll), PLL_UPDATE);
+	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
+
+	ret = wait_for_pll_update(pll);
+	if (ret)
+		return ret;
+	/*
+	 * Hardware programming mandates a wait of at least 570ns before polling the LOCK
+	 * detect bit. Have a delay of 1us just to be safe.
+	 */
+	udelay(1);
+
+	return wait_for_pll_enable_lock(pll);
+}
+
+static int clk_alpha_pll_slew_set_rate(struct clk_hw *hw, unsigned long rate,
+					unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	const struct pll_vco *curr_vco, *vco;
+	unsigned long freq_hz;
+	u64 a;
+	u32 l;
+
+	freq_hz = alpha_pll_round_rate(rate, parent_rate, &l, &a, ALPHA_REG_BITWIDTH);
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
+	clk_alpha_pll_update_configs(pll, NULL, l, a, ALPHA_REG_BITWIDTH, false);
+
+	/* Ensure that the write above goes before slewing the PLL */
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
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct clk_hw *parent;
+	const struct pll_vco *vco;
+	unsigned long calibration_freq, freq_hz;
+	u64 a;
+	u32 l;
+	int rc;
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
+					&l, &a, ALPHA_REG_BITWIDTH);
+	if (freq_hz != calibration_freq) {
+		pr_err("alpha_pll: call clk_set_rate with rounded rates!\n");
+		return -EINVAL;
+	}
+
+	clk_alpha_pll_update_configs(pll, vco, l, a, ALPHA_REG_BITWIDTH, false);
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
+			clk_hw_get_rate(parent), &l, &a, ALPHA_REG_BITWIDTH);
+
+	pr_debug("pll %s: setting back to required rate %lu, freq_hz %ld\n",
+		clk_hw_get_name(hw), clk_hw_get_rate(hw), freq_hz);
+
+	clk_alpha_pll_update_configs(pll, NULL, l, a, ALPHA_REG_BITWIDTH, true);
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
index 7f35aaa7a35d88411beb11fd2be5d5dd5bfbe066..ff41aeab0ab9844cd4e43c9b8e1ba0b50205e48e 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -206,6 +206,7 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
 
 extern const struct clk_ops clk_alpha_pll_regera_ops;
+extern const struct clk_ops clk_alpha_pll_slew_ops;
 
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);

-- 
2.34.1


