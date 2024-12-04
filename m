Return-Path: <linux-arm-msm+bounces-40361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D42429E44CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 20:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B930165F53
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 300EE1F543E;
	Wed,  4 Dec 2024 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="dfnfqXED"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA5A1F03DD;
	Wed,  4 Dec 2024 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341068; cv=none; b=n8xSPNX2lMB5FcJf5Y86pSf4jnMBObMoUmSs1BAb1eOpjDP/mqA9ZsJpuDPmDayvsebaz51xYds28XqAXvk9/6KsbH3Mfm6jYNpvvMk65ZHYHi8UeLJCtOezMro/v9Uf4GAlgzY6c4pt9MPODLfRZhtXwYcdgXZ3tbg3NT9EFtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341068; c=relaxed/simple;
	bh=ybquNvhu3fwqsGgB0h3HTK1V90aQE1rAdBik/KxijJY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=GIXpdPgQccJ60urqTVgsOqhOeZyS1TdEa8Mgrgi6DXufrDzs0YvgJh3UePsj9jn1wC7P37XsmpGLYHON/5aswDqMHQjNb2xsuWmyI5wgZzSXWkhvC7w3GNTWY7vFS0pozAiPS5OJaYuOdQnzU7zILJJPqC4+YSFl0dpg5Wb9V/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=dfnfqXED; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4H6KpV024772;
	Wed, 4 Dec 2024 19:37:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqaiQr43W7Y8YIMX4TayhXzJvPjTkQo4hxliRcBkemU=; b=dfnfqXEDXryh0DKK
	DaAVnnclP/Un6c/2aNZg/EzL86ywFpjjJWBBr+q1Fft99ZFavzcJuXVZHJ8f1cQJ
	/9nvSGjxZksAom6Y6git2WWnCfuLpctXLjCVraZLfE6u0w4GIFi9GwqO+4Xt8lcu
	yKK4IEXlRo6t1tYC0cMqGYtxAaSbYKGyI7JSlsA1yBdh0FvEaAJjrVkhs3lMG0zi
	ofGxpfdnCyB3H9pg+XMqEX7Gzb5F/XqB4So322FULbpKPLRrAgAp9wuyV7QEtY86
	Yd/nL7JvJEOKe0ooMuPC3aezZvz6z3tWq21ye2vSdfFAzp3pgNj26sLt8LLcRhdT
	D3sgjw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vnywa56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 19:37:41 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4JbeLJ031068
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 19:37:40 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 11:37:39 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 11:37:16 -0800
Subject: [PATCH v3 4/8] clk: qcom: clk-alpha-pll: Add support for
 controlling Taycan PLLs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_clks-v3-4-1a8f31a53a86@quicinc.com>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
In-Reply-To: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733341058; l=3482;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=NnNEqYZ5pV8Imdcrsg1kU2E1AOytgnDs8DFuBqwClzI=;
 b=LAnzFjB99jLjkvqOrLKEIvXdXc/GCcYtZrl3gqW0lxOn/0xmFWKg5Vv96m3ruNO1Y8RuLu+zk
 WmEuOE0n0aZD8AuqivoZO7/RNm+ug676/ZOROf0Bk/PoCVYkX6hVjAj
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NwpLKTWyg_w-jsCiMuOjVybpDkokGPZA
X-Proofpoint-GUID: NwpLKTWyg_w-jsCiMuOjVybpDkokGPZA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 mlxlogscore=999 bulkscore=0 impostorscore=0 mlxscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040150

From: Taniya Das <quic_tdas@quicinc.com>

Add clock ops for Taycan PLL, add the register offsets for supporting
the PLL.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/clk-alpha-pll.c | 14 ++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  7 +++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index b8351f8c0b8401f55c564e8ea32308333d012887..5e9217ea3760efe640718040b8659cb37ef9ede5 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -197,6 +197,20 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U1] = 0x34,
 		[PLL_OFF_TEST_CTL_U2] = 0x38,
 	},
+	[CLK_ALPHA_PLL_TYPE_TAYCAN_ELU] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATE] = 0x08,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_ALPHA_VAL] = 0x14,
+		[PLL_OFF_USER_CTL] = 0x18,
+		[PLL_OFF_USER_CTL_U] = 0x1c,
+		[PLL_OFF_CONFIG_CTL] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U] = 0x24,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x28,
+		[PLL_OFF_TEST_CTL] = 0x2c,
+		[PLL_OFF_TEST_CTL_U] = 0x30,
+	},
 	[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO] = {
 		[PLL_OFF_OPMODE] = 0x04,
 		[PLL_OFF_STATUS] = 0x0c,
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index c6d1b8429f951a27fa18cd5b82f067acdf826454..87bd469d9c2c2ec4e0758c97231527b92fe6afe5 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -27,6 +27,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
 	CLK_ALPHA_PLL_TYPE_LUCID_OLE,
+	CLK_ALPHA_PLL_TYPE_TAYCAN_ELU,
 	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_DEFAULT_EVO,
 	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
@@ -185,12 +186,15 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 #define clk_alpha_pll_zonda_ole_ops clk_alpha_pll_zonda_ops
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
+#define clk_alpha_pll_taycan_elu_ops clk_alpha_pll_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 #define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
+#define clk_alpha_pll_fixed_taycan_elu_ops clk_alpha_pll_fixed_lucid_evo_ops
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 #define clk_alpha_pll_postdiv_lucid_ole_ops clk_alpha_pll_postdiv_lucid_evo_ops
+#define clk_alpha_pll_postdiv_taycan_elu_ops clk_alpha_pll_postdiv_lucid_evo_ops
 
 extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
 #define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
@@ -218,6 +222,9 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
 				 const struct alpha_pll_config *config);
 void clk_lucid_ole_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config);
+#define clk_taycan_elu_pll_configure(pll, regmap, config) \
+	clk_lucid_evo_pll_configure(pll, regmap, config)
+
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config);
 void clk_stromer_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,

-- 
2.46.1


