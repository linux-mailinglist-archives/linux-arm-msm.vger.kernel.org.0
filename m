Return-Path: <linux-arm-msm+bounces-62420-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1CBAE7FDD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:45:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4EC83A7793
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:44:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA91A2BD5BC;
	Wed, 25 Jun 2025 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VTcO2/Pn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439B62BD59F;
	Wed, 25 Jun 2025 10:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848284; cv=none; b=fG+R+m3lL57nE0xq0JGrmci4j1pK/wDfKi8hpGkBfNCoLfr8FoEnGOWcjsZSwztYcQMr+kY0FQZldvoZ+A262rqC2pvtxUwYagb2lVogVdbALpAzA8te5pqJmJvgrWECDqKI8iilCp7sKlCFHW2NqrlnpFnDyEk/GSrfd4mtv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848284; c=relaxed/simple;
	bh=Ejqv8wUXoGYcHPtjm52loRjGC8laFGva0XsGVphFp7E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=fWphJy2pnKU+wunxVgpJZUISf+5SMLuAE3u5jKtXFpSS6TjVSpx1FZrciZvB58lc31dAbRNo58hMXGWkH6uU7MZdVCF71LV28s1loysR3aLfVETJ51maGe0LDulHufALDuUyOj/jQLH5MAFLQ6oP2P9/vsISXOMwq7Q7dBKHJ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VTcO2/Pn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAVXeF005493;
	Wed, 25 Jun 2025 10:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ssm0aUepJ0GVszCPiHptjQ9gNY3vxM9Q7AzdBfFJgnQ=; b=VTcO2/PnKZEjlqgj
	WNnBlOWO6Vn+JyPya+qF4qLijUPXfvwQFKrNIWRin8J/XCSA/Scr2msPmDLk4E4I
	z6n9LTMMuDMKRFTLwjC7g3AIWCNGWUWPwXACDCfSjaFnDcnDtA63YWIk0idNv7a3
	Q9oQBFAnX4sP9W4WMLhwgZYhgktYgznwjr0z4xUEG/nqsp+U5UxTjRk346xEbeVa
	cdA59v27DeitynC6NxphMjbzXoN086YcVcC5L6JhArnw31UmR87HdRjGwRCbgpEA
	fCUXqoUeuZZlqWnCJEVoaN6VKaYrYucQ9EkYXugJ5kIrr819sNa/VpN+ndS616v6
	w0Qgxw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g7td9d28-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:44:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAiWvD027877
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:44:32 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 03:44:27 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 25 Jun 2025 16:13:26 +0530
Subject: [PATCH v10 01/10] clk: qcom: clk-alpha-pll: Add support for
 dynamic update for slewing PLLs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-qcs615-mm-v10-clock-controllers-v10-1-ec48255f90d8@quicinc.com>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
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
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CPYqXQrD c=1 sm=1 tr=0 ts=685bd311 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8
 a=mqrKFzemJvgpN0bEk_AA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4MCBTYWx0ZWRfXyM4pnAcpfgum
 qHfJ1FiX3ETvZUvx4KW/4vxwXPI5+aevY6/YmmDzAh4KqmSwYn0urviud7Q1daFU+xYZRMBuXvZ
 VDPwiID5zMjKbgnKx8csQjBe3GHplm8KY1Pv2M7BzcVnnptue2xnt1WZY1pW6AIsm0yMilwSYW2
 GpZaRj22gRe/Za3tAVbowt3Rig4maNUGIXFCnAKuUYI660Xo1tHxBAf3D0l8B41iQqppNdqls/Z
 7tZK66D/y1+zm/V/EnXCcwSFk7ElY2B1MPfFnp2WNSJuM9dDw9UuBHVPOjLzSarL34zv2VkKz0H
 0vR4de7YmYKnBl32UAxiOUQvM6BcBrHN4OuvVo06AOJ1NTzXwz4E2V/aOk6lQBkI6VoTf+F2/sL
 /1xdGBJyZ+b5IzTJpp/1Alwxwyh76QbLHrh1oQ+rt0WxuQ047mA2jbeM3njIsZ/bIyJR0AeR
X-Proofpoint-GUID: bLQ7ZtmuIaf74eVjO0BlvUkiYe2SZg8J
X-Proofpoint-ORIG-GUID: bLQ7ZtmuIaf74eVjO0BlvUkiYe2SZg8J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250080

The alpha PLLs which slew to a new frequency at runtime would require
the PLL to calibrate at the mid point of the VCO. Add the new PLL ops
which can support the slewing of the PLL to a new frequency.

Reviewed-by: Imran Shaik <quic_imrashai@quicinc.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 169 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |   1 +
 2 files changed, 170 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index d8e1cd1263317814da2d0414600988de4b87c56f..354ebf48435f1ef7f76ead05e9ca882085dcc46d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -3017,3 +3017,172 @@ void qcom_clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regm
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
+	a <<= ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH;
+
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
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
+	/* Setup PLL for calibration frequency */
+	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
+
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
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
+			clk_hw_get_rate(parent), &l, &a, ALPHA_REG_BITWIDTH);
+
+	pr_debug("pll %s: setting back to required rate %lu, freq_hz %ld\n",
+		clk_hw_get_name(hw), clk_hw_get_rate(hw), freq_hz);
+
+	/* Setup the PLL for the new frequency */
+	a <<= (ALPHA_REG_BITWIDTH - ALPHA_BITWIDTH);
+
+	regmap_write(pll->clkr.regmap, PLL_L_VAL(pll), l);
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL(pll), lower_32_bits(a));
+	regmap_write(pll->clkr.regmap, PLL_ALPHA_VAL_U(pll), upper_32_bits(a));
+
+	regmap_set_bits(pll->clkr.regmap, PLL_USER_CTL(pll), PLL_ALPHA_EN);
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


