Return-Path: <linux-arm-msm+bounces-66469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C00B10678
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 578BD1CE1E4F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:35:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F497286408;
	Thu, 24 Jul 2025 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cylrEX9R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B89283FEF
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349377; cv=none; b=c+Ctd8eZEjl6vtiAsuXrUJr2d+8yh4YbQ4qUUKCDNi5lvGfq5el6hKFqQlme1gQP16DzOW1zvkjZ0Q9xI9iv1bZ3RIDbsqeBBV4CZBmvouRQvXLmaRRPVSgJe514gkXjflLbRwEHXkd7n/CAs34ZbWNFcl9xsvXr2ioC2pwbfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349377; c=relaxed/simple;
	bh=5xkfcJbVkKNZ5yfJhspI+J3h+efsZ+lO+pcNZ6b5KUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q03XoPYMmKz0I1qgs7mukAC8FZ6T2ciwD0uahh5myyt+f7VM8SE8jCwcA1eTWUVpwazBjHvJYi9ItbclFmXP3CfJcNIPQJVTMfVVb7PpuUP1V3D22iLCw6Kyo4gUnGCpLlsGj4YDWQYpc/HrCsyd4doow9cLAKDOLokBe6S7hfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cylrEX9R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXaQm022148
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rkua1eHudLhTq/27Qdikz3br+O5tiA9+J0gTy0Df1aQ=; b=cylrEX9RPzGDW56n
	g9MM8K86OVjTqP0kSNa57MhmWiDLspD3/TyIBYAoLUGJT4sWgsOl36ccK31jwH/4
	J54QkUIbSfettp/3fq0btB4U09PjmTd0SIj/MSDl0lVzCqv/hc1BCDtp5G6+N51D
	dwQCwUI4yXHS1/awKKOQO2xAarheD+SjRUOwSAj9YRNjmJ2PYDs5MnLpOYfOA0qI
	c1XCnr9gadrmZJrsxgMLLHCkGxlsRdf+5XBWtKFbKNCDbzF5d3O3KUXl4NunRpAF
	JEd68VKyBDcn1K6kaqZOpgg7mSpVb9FEgTFUaL9wnQth4Ep2nPj/TtuNtGx3n9Yk
	aEvyRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dr05g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23536f7c2d7so13444095ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:29:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349374; x=1753954174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rkua1eHudLhTq/27Qdikz3br+O5tiA9+J0gTy0Df1aQ=;
        b=w8DyplBteWu2Xo67rNjDBC127QolIgWS+IzxkNKk9hono/FhlUALfXfPei3XkYMs8d
         DxSw7XMfveoDU0PXjoZCQcCUJABy3aDXPVbx+wHTmrHU84LYLf6+vPUMYRU/nbg22GFo
         Kn6nMw4rLe+33YToqv9h7De9NhOG3J7kAVSJo1gIDKhFrNl8LOYeiA6wf2dvweABpHmA
         pXnhdO2J+r0NMXv4ux3z07ROuCYdXWBqy1VCBBteagWFKhbGbnJJQg6uC2bpLexH5eLQ
         8/GjxQtBs8EoWm/a6nQhN31AgwzskXDqtLk2dOUUkKM6yFBmUB/EeKvXciATyONb+Zxz
         U34A==
X-Gm-Message-State: AOJu0YwMI0wnCe1GagySLYVN7nNtfk6bWHpIWcISo3ZR+YqdZdo5GKXJ
	TQEtBOm+PFuMRQvMh6GEpzAWWTX0AJGLxdRbGNAxLdaIG+6IbPpG1hWu8isF+Jou94tKwZitJgO
	ZQ9DE+AJurJIBODjatn0TxQPeaaChLmJnHSAdvmbaQ6+PkaMhZ+r+jWEMEoIzbjRhBhwf
X-Gm-Gg: ASbGncslESKwFOluBdfcuSJdwo9ZhjBnoczHGQ6iRxlhBLVM/DP++RoxAbdhxpEleMi
	9hM02k6mYe/CrwPPJB3293Y2cmS4648WCQ3LbxfDd1BKNiR06kSq+SkhWZMPmsyzopMtGVBq3Vv
	3uqRPOY8SzKNBAZXcmtuhr55z7D8hP2XTt0XiKeeLFAuZqtHDF8Ch27/2GJ2UowCqzYasoR5C2v
	HUZXafnfEijDuEtsjAkvfEumOD68n7dX4zcDJL4bIXQJ9YsKz4iUH/CvOrU0RolJMsa3axKR85+
	7EJueAH14zY3YzNn2RngFJwK851oNM51ioGlRrhKBh3e8yMow5cBkVMNXLgQ16DD
X-Received: by 2002:a17:903:1b4d:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23f9812b6c9mr96867205ad.4.1753349373713;
        Thu, 24 Jul 2025 02:29:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7g+nxtHCjv5a2DV93ZQS9k2ZMHV3+YGWomUwAyenemQGop7HippiSuv8MVpUq7jurR6UPkQ==
X-Received: by 2002:a17:903:1b4d:b0:235:1706:1fe7 with SMTP id d9443c01a7336-23f9812b6c9mr96866835ad.4.1753349373301;
        Thu, 24 Jul 2025 02:29:33 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f8a0sm11276505ad.24.2025.07.24.02.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:29:33 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:59:12 +0530
Subject: [PATCH v2 4/7] clk: qcom: rpmh: Add support for Glymur rpmh clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-glymur_clock_controllers-v2-4-ab95c07002b4@oss.qualcomm.com>
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
In-Reply-To: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6881fcfe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=RRvC4NyyfoRIYhV0TvUA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: qrT_AmOzzb5n9nZRM7qj1Lq5aC4wzUa7
X-Proofpoint-ORIG-GUID: qrT_AmOzzb5n9nZRM7qj1Lq5aC4wzUa7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfX635h7vI6QjLS
 6NJ1l3GJyJ7HsqYCvVtO+puS9FqgnS1oN7oP4Qe3Q2cqUF93KdoGWF+KXfABYRqTB0aFrX0t1yC
 YauP/4QgRUFHY+iF7TFe0gq9Q0Hve5E8FMKoNWZqCIDStS5uM6t96DdkqdNCXOmGKE5dLzcHLJP
 J/tkFkv0TbjFICsBLiUwUb6u+7GurcBFbQXTxzOznl2J28v/5RYq6phfU5hu5XpQcMFKL5fw2LN
 X6s9AdWFKvunekqc7oAbE/2k2tNrGlLlcuZZPB6d0RBAyHhSiAkUfyXYRvAMnjxTcvcTUyl7E/o
 toefPmQNCklqZmgfvu89A5/2vIBRV4aILbp123yfTdi+uhKaEkmRAgBgCOHhStWrRVuelAryXfg
 fjFASz8sl5GHEuw+aqhgk6AwMGY4l2kxv6/fN/7z7CNNBpwJhRLqVo40cDX6MaTon3AluI1T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240070

Add RPMH clock support for the Glymur SoC to enable proper clock
management.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-rpmh.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1496fb3de4be8db0cae13e6358745660f286267a..d31b1ea963e3a54ecfa25e6c5cb0806e562525e4 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -390,6 +390,11 @@ DEFINE_CLK_RPMH_VRM(clk7, _a4, "clka7", 4);
 
 DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
+DEFINE_CLK_RPMH_VRM(clk3, _a, "C3A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
+DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
+
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
@@ -879,6 +884,22 @@ static const struct clk_rpmh_desc clk_rpmh_sm8750 = {
 	.clka_optional = true,
 };
 
+static struct clk_hw *glymur_rpmh_clocks[] = {
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_clk4_a_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_clk5_a.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_clk5_a_ao.hw,
+};
+
+static const struct clk_rpmh_desc clk_rpmh_glymur = {
+	.clks = glymur_rpmh_clocks,
+	.num_clks = ARRAY_SIZE(glymur_rpmh_clocks),
+};
+
 static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
 					 void *data)
 {
@@ -968,6 +989,7 @@ static int clk_rpmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id clk_rpmh_match_table[] = {
+	{ .compatible = "qcom,glymur-rpmh-clk", .data = &clk_rpmh_glymur},
 	{ .compatible = "qcom,milos-rpmh-clk", .data = &clk_rpmh_milos},
 	{ .compatible = "qcom,qcs615-rpmh-clk", .data = &clk_rpmh_qcs615},
 	{ .compatible = "qcom,qdu1000-rpmh-clk", .data = &clk_rpmh_qdu1000},

-- 
2.34.1


