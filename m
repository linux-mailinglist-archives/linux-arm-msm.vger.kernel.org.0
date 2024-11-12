Return-Path: <linux-arm-msm+bounces-37505-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EC69C4B19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3FABB2C05B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7813B1F26FF;
	Tue, 12 Nov 2024 00:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eQspTU75"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65F41EBA19;
	Tue, 12 Nov 2024 00:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371305; cv=none; b=Z8cstjhcxMG+Lu5PMKWjFxlS8OX4NtsGId+jgwjCZ5CSIhnXRDFVmluvvLVm7mrtoX7LgnsGvkh5fHvITvbiT7H/OGSC5W9Jtppz6z6ERRhhryKeMxcs8zK0OLqs5i2AKZNq3l68ZpH26ZXW6sqOGWMy+/znVaZvALpGU5bZOHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371305; c=relaxed/simple;
	bh=s+b5xWbEJ51ECQJsvJKXWTaHy3Sp7M6Ae9tGG9krGDU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o7RGMG2pkBPsxmpzVLVQpGhr6RqCP9mUfNwZg5fFqth8rF6erU6D5Q8RxigSjdjLHcTyG5s4iNOVF4uy68Fnfl2RiAZW5kuARwdggXX3X0d0evtOOaqIQJFrqexuE2Fn7I5cwQJaZJzBYgXw6SJWKl7Q1BBaEBleaXLdG5wLffg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eQspTU75; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABBSIHR028090;
	Tue, 12 Nov 2024 00:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P1mLNyFfdpsj57fwZ4/3THZXv7EOUKqTG+DS4Tc/D14=; b=eQspTU75+IKPaiDh
	MxloRkWcbp+itIzgftkA1b6rq24vWVeK0U5DkbdIEL5oOtOGjdfQ6gkYxtruvQLi
	E0plDrlTQIPD40HG5K5HbzyNOl5YIZuEi0cNtzHtnr0JGA42q9lmvEPbGFbG2bwi
	yRyXGvimgDPEbVYa0s6iYhBrLm/8pBwT7S7rgvnYs7fwsUqQKyTnZHMr6BzfPW8T
	x5DHRvdqPnDbYBzhbTSMb8OzGCRKxiNrZwRnyEmOzDyqB3091M1UWe+c9hSL5Jvy
	7tMreahNKuDGXGdiqk3Ff3SXaBNO5UWIq6O0KcoUJGL1lsih0jfgIRyV4ENy2qZa
	I06LhA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sytsnnju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0SInk024779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:28:18 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:28:17 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Bryan
 O'Donoghue" <bryan.odonoghue@linaro.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
Subject: [PATCH v2 2/7] clk: qcom: rpmh: Add support for SM8750 rpmh clocks
Date: Mon, 11 Nov 2024 16:28:02 -0800
Message-ID: <20241112002807.2804021-3-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241112002807.2804021-1-quic_molvera@quicinc.com>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -PhDKQebWtuH2wCtjhKJrvYLFrex8vGs
X-Proofpoint-ORIG-GUID: -PhDKQebWtuH2wCtjhKJrvYLFrex8vGs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120002

From: Taniya Das <quic_tdas@quicinc.com>

Add the RPMH clocks present in SM8750 SoC and fix the match table to
sort it alphabetically.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/clk/qcom/clk-rpmh.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index eefc322ce367..a3b381e34e48 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -368,6 +368,10 @@ DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
+DEFINE_CLK_RPMH_VRM(rf_clk3, _a2, "rfclka3", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _a2, "rfclka4", 2);
+DEFINE_CLK_RPMH_VRM(rf_clk5, _a2, "rfclka5", 2);
+
 DEFINE_CLK_RPMH_VRM(clk1, _a1, "clka1", 1);
 DEFINE_CLK_RPMH_VRM(clk2, _a1, "clka2", 1);
 DEFINE_CLK_RPMH_VRM(clk3, _a1, "clka3", 1);
@@ -807,6 +811,27 @@ static const struct clk_rpmh_desc clk_rpmh_x1e80100 = {
 	.num_clks = ARRAY_SIZE(x1e80100_rpmh_clocks),
 };
 
+static struct clk_hw *sm8750_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_clk6_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_clk6_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_clk8_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_clk8_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a2.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
+	.clks = sm8750_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(sm8750_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -894,6 +919,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sa8775p-rpmh-clk", .data = &clk_rpmh_sa8775p},
 	{ .compatible = "qcom,sar2130p-rpmh-clk", .data = &clk_rpmh_sar2130p},
 	{ .compatible = "qcom,sc7180-rpmh-clk", .data = &clk_rpmh_sc7180},
+	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
 	{ .compatible = "qcom,sc8180x-rpmh-clk", .data = &clk_rpmh_sc8180x},
 	{ .compatible = "qcom,sc8280xp-rpmh-clk", .data = &clk_rpmh_sc8280xp},
 	{ .compatible = "qcom,sdm845-rpmh-clk", .data = &clk_rpmh_sdm845},
@@ -909,7 +935,7 @@ static const struct of_device_id clk_rpmh_match_table[] = {
 	{ .compatible = "qcom,sm8450-rpmh-clk", .data = &clk_rpmh_sm8450},
 	{ .compatible = "qcom,sm8550-rpmh-clk", .data = &clk_rpmh_sm8550},
 	{ .compatible = "qcom,sm8650-rpmh-clk", .data = &clk_rpmh_sm8650},
-	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},
+	{ .compatible = "qcom,sm8750-rpmh-clk", .data = &clk_rpmh_sm8750},
 	{ .compatible = "qcom,x1e80100-rpmh-clk", .data = &clk_rpmh_x1e80100},
 	{ }
 };
-- 
2.46.1


