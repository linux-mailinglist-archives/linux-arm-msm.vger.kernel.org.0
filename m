Return-Path: <linux-arm-msm+bounces-87289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF76ECEFB99
	for <lists+linux-arm-msm@lfdr.de>; Sat, 03 Jan 2026 06:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 828573022181
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Jan 2026 05:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD61B271457;
	Sat,  3 Jan 2026 05:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aG8ymXYy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XREX54N9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A727626FDA8
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Jan 2026 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767419848; cv=none; b=CF6Rcx0UejzRtTQkuFvmxGxzyLqIh+fEGiGNZorg+Y6aNFSmUe8Qt2pQw9WQ7D5AedssueJBZxUGDOJmVe6dhPNhhpdbZ01LCDIfonE7V+kyitLtR+yxZ1rk8TSH7m4beuPoRaMKs3G/t6EvfCSJlYHN6+Gs72sSf3AUSqyaoxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767419848; c=relaxed/simple;
	bh=TYIye7MjBVQahXkozumbkYbOg86ROaD2jqdeGERogG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RK7ca1lpLDzdF2IUro2qHQGAdn/1FuCPk9Bkf0cZN84JYweArA0wzif9nawSlTNPKBQsW6x+8Xzr5TCrX2J9Ipi+1LnmhfBOH82L2Vc3WfccbF5AeaF2e3H1rkP1E/C8YdFeWmuvvF1Q3G+mhPcHkOvYbk/Qq4gqWyhq2COYxgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aG8ymXYy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XREX54N9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6030KMiG1557144
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Jan 2026 05:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sv0KgKsllMGo1VGGmTLD83XZZzOB6mzv07rP+VhvoBA=; b=aG8ymXYykLSyzHWI
	lqlxi0wJ3RjXXIqd0fAwvUF2Y7dAyKvFDrHtVGQe6hpv8J2slP47J4g7avy+6P9S
	6C8kZ3W+zubZgroclaHyZ3ui0QM6/RsVEdU88n4JtY6JB1Tdmd8GYp8aTYzxvRVp
	7X+j5mh3uHOz3oCxaO0KCncORIJAHxJES867DWchupiBPC5SwmOjb9nU2e8ZHqDZ
	wSc9QGjceuSXRtCbC20JSD3LRmwDcyy5WjWjD5jqbaukZWFzy6Jx7VqUWWRSWvvR
	nzUdG3w8VB9WVr7qq4uXARajz7t5K7JmNBs7LS8mlvtLJg0HVi+iPtZ70ruYAe1U
	7Wov+g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4berfn8cee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Jan 2026 05:57:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-34c43f8ef9bso278632a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 21:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767419844; x=1768024644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sv0KgKsllMGo1VGGmTLD83XZZzOB6mzv07rP+VhvoBA=;
        b=XREX54N9AdunuQxrktnLXDxX61Fa7gO9XD25oF4FaZVeNnIKmAUhTKgc9P0Z6PnAGX
         KcWauvoyzptMp4NjXH45G0BFeNPKS9JecQ0pQlbYElOU2OhwDGoZlGjBkBRZ08VGDmLm
         Iwy70XQNzeexthuHoTHEWqbLBTWUyaLL4nVfoAZhoYK5RB2R9fSMsGIX+iz+eDCCXlPw
         VavloyHkqNhZ3BTQBciyXGdfXriuTo76cYk6S0GuKZ86riCsJ1FQ9dF7V0SLPjGp5Ki3
         bXVuEE2DE0pWN3B1UWildFl60XSXyoJiAVOahvm5KY2EkUbLpWwiZFnF78mpTB03ZJq6
         OfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767419844; x=1768024644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Sv0KgKsllMGo1VGGmTLD83XZZzOB6mzv07rP+VhvoBA=;
        b=Eh5LBJsANFWaaJ5+sAkvayxE/zxAAQW1ycAl5PhSOgDHnYE+CmvKCTyGyZCifMoqME
         c5Hytuasu+oqrRXabPheB6yWne9ymtQQ7agC/qiBVDbvQ2LQJn3IISPK4nTd++ghz9Dj
         JRuVkqCx9kJMyjfCoZRRUwtkUTm4bBo5kSGRLklrisgn/nYuhUwZHNlYQt8iILj87kDB
         WbuYtWXt/l3lNmT6ViDBEyFRJ28IwBMIITYzcW46VZOOo1B1FhAoD5w+liJq0XAqMsjO
         TkxYfrrixpzziBB9zDiH92KlKswy3LWJ9hi5LzooLwASvnsw8FyQwgDXmu6A/W5dOX6H
         1NNA==
X-Forwarded-Encrypted: i=1; AJvYcCXE8vltjRjlXi+ML8svurqosrUO1T/b91yQi49IUDsO0/IiZSuFKR908gau3iRV7nfNFzIkiMtw5O+1PyXS@vger.kernel.org
X-Gm-Message-State: AOJu0YzaP/XWd9ulyeFxDPv4ly4eXmF5PKZQioCCel4oQ7OLhf/0Vvdu
	vBt70st0v5sVkiz1+hV4Z+11BCz14J7i54hpOqy5rreEUmIAeDhKzsnq7gcQD0cb29igSFWkn4K
	ulDohsoKDRB4UeY9cx/iQzi5S8yOwTmLGDlxqtdGWZs66Pjw3RFO3+yC8Kn6gqc7sdX3l
X-Gm-Gg: AY/fxX56Bm/oNuv+2sSrfgWsEI2OChzqQLBdHTSCXaG2qyt62Q5PvpxC4Kw7fYS2wyx
	zle6bAgihiCf58voh+uliRCoGGaLVHgZ2EuSGAaa+KfxU/cvCMs5Nf6m7/aiK2trKqgqXhFitLz
	/bhye6odh55U737xYs7hZZuqDywmxs16jhjrmLC66B7MiXu2Hp41v6G3x8s8aWANP9GOM5QF5WA
	8lKYOaepl0Ccpv2vpnTSYlta8yqOeQrhHXhn4tQ/dwWSjIg1Anlm52XXxoS4bjCIBf7YRi0xOlc
	6VkGnzaTbC8MEYZpZhHqasqDaEs6DudIqtSmu4ec0O4YKR3/UjsTLPEiICaj3hKO0Et3yS+s06B
	EW9SyoO3MUGbeE+HI/2vWtQr7/jeNbXABWQ==
X-Received: by 2002:a17:90b:4c8a:b0:34c:718c:5448 with SMTP id 98e67ed59e1d1-34f45262492mr1572027a91.4.1767419844064;
        Fri, 02 Jan 2026 21:57:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEW0P8432la5NtcdKIalMlpY2t31D24eKvoeVQOSDHJOaG4liJLfSUeYSNtKLZkKeuvehHbVQ==
X-Received: by 2002:a17:90b:4c8a:b0:34c:718c:5448 with SMTP id 98e67ed59e1d1-34f45262492mr1571996a91.4.1767419843404;
        Fri, 02 Jan 2026 21:57:23 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f475f1726sm754760a91.4.2026.01.02.21.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 21:57:23 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Sat, 03 Jan 2026 11:27:06 +0530
Subject: [PATCH v2 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol mux
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-ufs_symbol_clk-v2-2-51828cc76236@oss.qualcomm.com>
References: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
In-Reply-To: <20260103-ufs_symbol_clk-v2-0-51828cc76236@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: rhpnFkOFxZVE0gtVGm2BPhuAg2l3czcr
X-Proofpoint-ORIG-GUID: rhpnFkOFxZVE0gtVGm2BPhuAg2l3czcr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDA1MiBTYWx0ZWRfX6NMq6ZoeOklE
 jNzIWHzjiqKK3bl5z5Ydjd8nHVasbqR/FqBY3LO3pVKNgdxRxrQK76JshatUQ+ytDBPZEqPFO+d
 Qum4V82qLiAJsrNWlqpSHcTOc8wCojctFTMECDmFtjjI7VUzUWbthPeKWnXpeqqtwvh3N/kUOB6
 XCjfE7VnsiLXvVRl4GqBm3msniLmPZd5uQyrEwVzcQs8gpXXZKh0H7QZ+tp1DssFYMKdZA04GoA
 WmRZqV1XqzbvZNRoCUiitvFAq7QrSvwPP62bg1eUvXHAr+Uq7OlOcIf6snmNhiZm9LHIxfonmYs
 738YAUszva3GVKRB2INVIqfVso1YSXAeddyQggQJtraw0C6CadOmVSqwVCF97eP30zoDb8CrOlr
 RBDX7ymLhYVSlm508XrfPmgkxkIT7dEu+LwqgTh4UTogmM+gZod5Vqi06J5tSwtRVXohpqO+6DO
 Kad+O3S/eJ43v0pnqfQ==
X-Authority-Analysis: v=2.4 cv=GNkF0+NK c=1 sm=1 tr=0 ts=6958afc5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=F9uGy5JsO3lP6kdW_XMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030052

The UFS symbol RX/TX mux clocks were not defined previously.
Add these mux clocks so that clock rate propagation reaches
the muxes correctly.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 72 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 69 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index e46e65e631513e315de2f663f3dab73e1eb70604..74afd12c158c01c121d9aecd56e65c0c302d7cd0 100644
--- a/drivers/clk/qcom/gcc-x1e80100.c
+++ b/drivers/clk/qcom/gcc-x1e80100.c
@@ -59,6 +59,9 @@ enum {
 	DT_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
 	DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK,
 	DT_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
+	DT_UFS_PHY_RX_SYMBOL_0_CLK,
+	DT_UFS_PHY_RX_SYMBOL_1_CLK,
+	DT_UFS_PHY_TX_SYMBOL_0_CLK,
 };
 
 enum {
@@ -103,6 +106,9 @@ enum {
 	P_USB4_1_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
 	P_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK,
 	P_USB4_2_PHY_GCC_USB4RTR_MAX_PIPE_CLK,
+	P_UFS_PHY_RX_SYMBOL_0_CLK,
+	P_UFS_PHY_RX_SYMBOL_1_CLK,
+	P_UFS_PHY_TX_SYMBOL_0_CLK,
 };
 
 static struct clk_alpha_pll gcc_gpll0 = {
@@ -482,6 +488,48 @@ static const struct clk_parent_data gcc_parent_data_33[] = {
 	{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
 };
 
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
+	.reg = 0x77064,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_UFS_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
+	.reg = 0x770e0,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_UFS_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
+static struct clk_regmap_phy_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
+	.reg = 0x77054,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_UFS_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
+		},
+	},
+};
+
 static struct clk_regmap_phy_mux gcc_usb4_0_phy_dp0_clk_src = {
 	.reg = 0x9f06c,
 	.clkr = {
@@ -5148,12 +5196,17 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 
 static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 	.halt_reg = 0x7702c,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x7702c,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_rx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5161,12 +5214,17 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 
 static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 	.halt_reg = 0x770cc,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x770cc,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_1_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_rx_symbol_1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -5174,12 +5232,17 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 
 static struct clk_branch gcc_ufs_phy_tx_symbol_0_clk = {
 	.halt_reg = 0x77028,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_DELAY,
 	.clkr = {
 		.enable_reg = 0x77028,
 		.enable_mask = BIT(0),
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_tx_symbol_0_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_ufs_phy_tx_symbol_0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -7180,6 +7243,9 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
 	[GCC_USB4_2_TMU_CLK_SRC] = &gcc_usb4_2_tmu_clk_src.clkr,
 	[GCC_VIDEO_AXI0_CLK] = &gcc_video_axi0_clk.clkr,
 	[GCC_VIDEO_AXI1_CLK] = &gcc_video_axi1_clk.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_rx_symbol_0_clk_src.clkr,
+	[GCC_UFS_PHY_RX_SYMBOL_1_CLK_SRC] = &gcc_ufs_phy_rx_symbol_1_clk_src.clkr,
+	[GCC_UFS_PHY_TX_SYMBOL_0_CLK_SRC] = &gcc_ufs_phy_tx_symbol_0_clk_src.clkr,
 };
 
 static struct gdsc *gcc_x1e80100_gdscs[] = {

-- 
2.34.1


