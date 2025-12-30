Return-Path: <linux-arm-msm+bounces-87006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C02CEA557
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 18:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 82E433015E27
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 17:38:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A76932B99A;
	Tue, 30 Dec 2025 17:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cqA0rhHH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIkrmKNi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6DF32B98D
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767116338; cv=none; b=C7wN0L6LWzxL2Oq7ZsmIoRgax2YGMMLP0UBjq4oOwtxtckWigPo+KcWGU7A4pmW6kVGV6ctTHTywwW3MuP3OC6iNB1m0Q1H6STD34imBMlWKWJSZI7WJCHCFwncnC1Mgo+xBSRvg2KCvMHohJiN3Qc82k5jWik21+EHc7SRXJoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767116338; c=relaxed/simple;
	bh=q5Cs9pMAdeX8ROnaUQwit23gUZZU92irF88/Bmc63Tc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=De1kgViGp/AhDPp4h/Uy59B5QigO3eONsy98PIjaFcaHdyS2nLJB1af7FkAD5vLQh07TXUSZl1g+3KhpTazcxmZeiZeFRNWJehQeEPZa1dIVIFwsB1/bT4k/ND9yAlPxZvNFAg4RAx8iJePj0kt5yrstsXgaLW7aV4B7w1E4i3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqA0rhHH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIkrmKNi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BU9Qi3e2723263
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A+8oapdwj8Kirsaqr20TQ6RDvOnq/fvBRIB/9Md1HLc=; b=cqA0rhHH8BRuxJZn
	4qHiwgjfinXDTLrM9nTRE4mIt3ogrPDYqucHKsPNP00MMSzV8zHi0enTMdi6Kbxw
	m3EtYAmE5xi/2UeN1JRBazs6DI5zutvhbnOTifaC5oJgqmmouyT9io7hFjkc/zJ3
	7HPx4sepOxcxItakN9WS2t+RZWPM5Ayj3nU6pGxPYN1syVWnE2c4+OVwxXEX4rHT
	kqoN33HepfD/qsSXXAkajSnTF9BqFhLpQWlMA4awnx9YBwHTSsD0TPKs4BC+k+z1
	Qi3a+51R4+irkj3mnRWmsJa3nzRsNejSedKMNGtO4Yly6TggzlkOY/mAP+MnmNc0
	rGTZtQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc0vdjhsr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 17:38:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7b9321b9312so21197246b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Dec 2025 09:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767116334; x=1767721134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+8oapdwj8Kirsaqr20TQ6RDvOnq/fvBRIB/9Md1HLc=;
        b=kIkrmKNi2uMND6NUZaThgKi2wp2891V6ECvD9PAkv4BEIIeivDkT45857qYRU4XvUt
         HcDDJDUfRAKi/n2sVNZa346CLEjWdys/l5GVqzDaVqwnOWnk9RiOAWxEw6dw3iBywjK4
         66WLWjvhCeFyD2nZERdqdjxTRQ2/JfHr8mADV8rmFEu3iBU88BW6DhU1mmVbOBn0ngKv
         ozUU/is1vtzHipxz/OnCf7Ro4ddtNhdwcTX3BSpo8YuY5v1+77RqzHoGkaKmZF6dyPbZ
         9dfta21HPkbFWM71aZrs/uU4BH4oYlNhTxTFnl7FL7diXUwLp8iRjMYZ7xRjYLdUBKkl
         2Rlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767116334; x=1767721134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+8oapdwj8Kirsaqr20TQ6RDvOnq/fvBRIB/9Md1HLc=;
        b=AqERRJ65ZVAKYm3Xke0L0g1yv6xiIb99Aq01scbX6zcFip20ESqnZpzDtXg/Wy55YZ
         eUMFiLgQd30R43loF3cx0FSMUox7Q5hkoIOymYQsI25MM/UQQF4wQFrOkt19FgDEqclC
         VWT4k+XIbedMhOfyyFLD1LAWqjGnoASMs/ejc5TozWpJXGZ6t6iP7pEi/xWA1176dweq
         9jfehkCxCzf/lYS1xL7lqwvVUFyIGK6fJHJnZJcY3m60rI4yINzoOIetoSc4jaBpFTja
         dVFlnNlNU1gdXZ1E9wV5GoxkIWnrBlLz85C9CqlvVGYlszuOrT5aqppFPWCKf0q86Za3
         oTvg==
X-Forwarded-Encrypted: i=1; AJvYcCWKOw4MGXR6YEGV9Cd8ucfOI/2i4JjHJlsy13cofIGVKeAusbKdjeDzTNxuvHZwluuk73Fy/+/OUv+I1B1/@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/ptBWeqKP0FvtmsJvictS4N8l1LEZLIJlEvUivFNPNewsP7r5
	c4ARt7CykZFmMrLMLuMllBbAn9aCQ0Cuir3JWClKkF96HLqN41WGBAROmu33SKh39UA2MDAEJGA
	U+tbVyupYqR5792PX7ELxEhAhCzPDucn4skk9vupkvHqt1KWS60xOA7anBlKE1SH/fp3I
X-Gm-Gg: AY/fxX41JqCB5y3jtkmQCNZIpwwCZwhPxyl9reiwZvkxOAZJ+xBXMOTE5fz3q8qnwXS
	cijc+YGs/uJbVTQrVxTAjbqKNqttXBMN2OkJNBiSd6wMa87J+fI0yBPoiORwGQx5ZXqfh009kpU
	CCTlpVfY/wpfcu40b0RgEOyIvnUqu7aeLReqL2Qg38rmDX4lRgWR1D62GdDTeMTmu7B/Ua1EmFS
	FvDkTztaMyfaZ0OEtVKdNvxmVw5k2/zrJlcY/UQTQKUXCKR+rh2aJko2rUwUMV4fwQBzt3Ho3o6
	NMgwnPAYDnS9Jd9ANEbCgm7iD+2GCro7vKFQW/9EFeoQYVy7s2HIwbdrIYBxClA1SH6XjDNadp3
	dNPrap6Y9Xn7RXF2gWbix5jvYkdrmPd0oiQ==
X-Received: by 2002:a05:6a00:4105:b0:7b2:2d85:ae74 with SMTP id d2e1a72fcca58-7ff65d7e724mr30564495b3a.29.1767116333938;
        Tue, 30 Dec 2025 09:38:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ48hkLumTZo1qmOgJTcbRN51YorB0Ubsww+zTBgea2mb5I+SE1k3buqmASho6QQmQRfIagQ==
X-Received: by 2002:a05:6a00:4105:b0:7b2:2d85:ae74 with SMTP id d2e1a72fcca58-7ff65d7e724mr30564465b3a.29.1767116333428;
        Tue, 30 Dec 2025 09:38:53 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7af35f37sm32865208b3a.18.2025.12.30.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 09:38:52 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 30 Dec 2025 23:08:35 +0530
Subject: [PATCH 2/3] clk: qcom: gcc-x1e80100: Add missing UFS symbol mux
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251230-ufs_symbol_clk-v1-2-47d46b24c087@oss.qualcomm.com>
References: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
In-Reply-To: <20251230-ufs_symbol_clk-v1-0-47d46b24c087@oss.qualcomm.com>
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
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=69540e2f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zK1IZneI0yAGVV4HvJ0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDE1OCBTYWx0ZWRfX4HcidtV8hcYL
 J+oXPJga6A8yL3kbf514vJsbbYwHi4aQvF7/9Go0Ic6UK7HsRnqUciHoPQ3wg5ku96/Rdis5+CI
 PlIssl++unVkitGoGgRNK6p7PbAWTFp+HAJTmdVeRU5fLL0nJw7JRXKXNPwZjRlUL3gwYfluA+C
 mG0U7sDuTly7aAiJlGWwN5NgZ6kPBpOWYPBRn9LED7Xfs2IutHKO++/61G+J/eHug1JZ4iSJLUN
 XgpoQOTNSLu+FepUabc/OtmJ6ukJQ9QAX2ZFDwcFPIrK5YFuqVjBiNRYSz9q97JFK6soWv2gptO
 oCQV98kCBQRlrRHQGZUApCI+xO5mRt58mCxyaS7rY+f9EeiSTN9XOtJsZFnMsGDmb77OeqcjB/Z
 l/3mWV8Cr9dzaBetKyfnVbEJXIS4E0TCnkIH0DGhNdO96jUH1tIQRscUnbxYMCaI4cersDq5NdG
 x2145IshBTnQd6voKlw==
X-Proofpoint-GUID: URp5txIpXtlbnqfqe9PzdkmLHJ77mMvv
X-Proofpoint-ORIG-GUID: URp5txIpXtlbnqfqe9PzdkmLHJ77mMvv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_02,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300158

The UFS symbol RX/TX mux clocks were not defined previously.
Add these mux clocks so that clock rate propagation reaches
the muxes correctly.

Fixes: 161b7c401f4b ("clk: qcom: Add Global Clock controller (GCC) driver for X1E80100")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-x1e80100.c | 102 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 99 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-x1e80100.c b/drivers/clk/qcom/gcc-x1e80100.c
index e46e65e631513e315de2f663f3dab73e1eb70604..c8fc9e6b1ac97b13f84753ac7f76e23df071c2e0 100644
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
@@ -482,6 +488,78 @@ static const struct clk_parent_data gcc_parent_data_33[] = {
 	{ .index = DT_USB4_2_PHY_GCC_USB4_PCIE_PIPE_CLK },
 };
 
+static const struct parent_map gcc_parent_map_37[] = {
+	{ P_UFS_PHY_RX_SYMBOL_0_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_37[] = {
+	{ .index = DT_UFS_PHY_RX_SYMBOL_0_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_38[] = {
+	{ P_UFS_PHY_RX_SYMBOL_1_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_38[] = {
+	{ .index = DT_UFS_PHY_RX_SYMBOL_1_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
+static const struct parent_map gcc_parent_map_39[] = {
+	{ P_UFS_PHY_TX_SYMBOL_0_CLK, 0 },
+	{ P_BI_TCXO, 2 },
+};
+
+static const struct clk_parent_data gcc_parent_data_39[] = {
+	{ .index = DT_UFS_PHY_TX_SYMBOL_0_CLK },
+	{ .index = DT_BI_TCXO },
+};
+
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
@@ -5148,12 +5226,17 @@ static struct clk_branch gcc_ufs_phy_phy_aux_clk = {
 
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
@@ -5161,12 +5244,17 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_0_clk = {
 
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
@@ -5174,12 +5262,17 @@ static struct clk_branch gcc_ufs_phy_rx_symbol_1_clk = {
 
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
@@ -7180,6 +7273,9 @@ static struct clk_regmap *gcc_x1e80100_clocks[] = {
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


