Return-Path: <linux-arm-msm+bounces-83703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C11F3C9144B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:44:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 26BD94E9BF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051352E7F3F;
	Fri, 28 Nov 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpfoCnW6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UnpJOWss"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936D52EC086
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319222; cv=none; b=C1wWpizthqWCrEhdF0v2EUZnimFZ1ZuAbWMOnaFd2h8ncKpIWhYqjJ493s2GPfL7DItGyTXHdDsZcBuGl58cntfiH7JxokoSljtgyTiJKhhg6pEKmYTTBOBz1ZHPZivP7C1N0vKHB05SFCz8XFSESmtEbOcfRHDI76iJScMPi34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319222; c=relaxed/simple;
	bh=fngTMAlj8/JOrVqugfPFt+lT3tloNMK4jV2wmbRbI54=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NxnnhUzorm1rL3izlMocHGVF2gbd5yS5yYUd7UQHvatC4OnyBuq+pmtfh/HhFuwnC9RlCL5CJCQGK0mvPIt2GKFEdKq15ihTUzfoAI8iwGvdRHzYUVpo9R590w0BqGFg2O8pWygiFGhnUV0zU3hCo7WMZ3a2YjC5nrMhGHx7J3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mpfoCnW6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UnpJOWss; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Oabl3531010
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhODlRoTJ7qVC/2V+TnZmMJl4LfMZeHxFqqvPBHyinc=; b=mpfoCnW6hUIiWPQT
	UtFrMufr9Jdt1HruOzTv9XOcSleDukB1mqOPFY/M0J/dmO8o4CKwfxKN8rnWgRZH
	6Z0VB5yFQTcsMFMlhl0Qp/KH8I+BHc7HVuMKHEGQh/he0fmK+prT3avbbyRuVlUO
	O++Jj/ib+3IitOtU/fAsMWRbUQlQrsRakDJGuFuuOabD7OUhyBe3Sk2Aq4scC/HI
	G8nO/GLQoaEHGw6EbIFVPPL7jkbZp9k7ca0GopFR1l+HfDN7ycj8xtzNEEauzKDk
	USaOYZajLDSW9Z2HfBLIw4bcLS+wQdxNwEEDwRflCPhBV7INzErLor6xd1N76XEG
	AlZCDg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rtumb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:17 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b993eb2701bso1690474a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 00:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764319217; x=1764924017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhODlRoTJ7qVC/2V+TnZmMJl4LfMZeHxFqqvPBHyinc=;
        b=UnpJOWssMC9shmFU4bvmfNqkYmO0ARkbLzgAIhVR5BQIWQjsK2YPa97R8Zh6mrDpPm
         exzWy5pB2pkIPWOMpRPSGRHPrkFF1YZGhVeeaF/H15lezySdxgypj5lX8uc2CEiDUSej
         YzF8He3V/HXy0mEXT6t9xUztKfdlPJAZeEmHwR8aSJKtUU43l3dMJ0bzP3Ky24esXDWi
         5VBKPKrdewXGgeD+x/cmmCGofP3CYEDks9j90wz/hG77yCNjtWquSOoV3hGxI2amoMZI
         u0muwUmIQpHEY42Tlhct7iYUcppb3lJa3Etn8AxrD+7rUyxXGfodxOJrIghyUWVluBYm
         KV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319217; x=1764924017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PhODlRoTJ7qVC/2V+TnZmMJl4LfMZeHxFqqvPBHyinc=;
        b=qcinn99iO9IPJjEw7CMj3cBeN7Y7B9DIKENiartJ5PP7hbMfbSdWcOy/onrpEY4GoH
         EIfMY08nUk6rbbWy6oJMPLaAGVd2tABReUbz91ZCgp243ZEL+NS8teabwxatyPgn1XYr
         kc2On5BW8e+/SEzkEvqqGLG0CkTV3tb433WJhzMkYptQ0BOQAOdL1lHIyARcnpB+TfTS
         QtPpH/3F0H+mfVIQh3gRqotyJ+gW+BXueEAcKmQvGOFggluu306PeoNMKuEW3P1yIDad
         tWkMjYbFJt6T3jJL39FKDKXkKYwX3cLO90FnWryNccoZmMTWGncjPa69sXjDq6X+XBe1
         TdKg==
X-Gm-Message-State: AOJu0YwSY5U9+0inFBi5xNrkLaM/qM2TiLlY1AqQPne1Q3G33SRHPpcO
	4Uwh+Hv0d0rJYb03+eInRmJjlFL9RPqrf4a3jmNgY8n2IGkVSmV8ZZQ+VGl4hxw0WVlqiuuqTRI
	ctaQ5CSRzuPhHBHaN0hqzmVUh3jZi3b7n3vWjkM92zrbXZcfZmsJSFGTngOz82EKyOSB1
X-Gm-Gg: ASbGncuVcHF2wG3jxfwDuydH/rpW+6qjJm4karRyOee6oB1ar+I/GvEBqFyaTdKejX3
	szZHb0VFTEk/MwRfzPcYhs6P/tM4/gQiT/Om16HCGEI0tV1tY9KkzQi/fsaQaYtdbfRMA6JSvsM
	qa5jGgue2ZRVJ2NpJRCu7hJfx2XPpL6KLMf4G63SOfI//3h1nku+tkqT5F4XudXb/WlTdLFr/a7
	q2EjNDDT4UicXpA/B+Lv5olgea1hDzNgCsJT3teTlxAbEcHcXncnpDmyK9kFKzdhXu4Rki5CCVG
	ioIHqf/qsUl529FdmWDvewonByXL1YB58LDO7vJvsUm/t8CFCa1dGHWekTQpyK5gLk3cr1bLgQb
	GLhZdRpxAWJIXKCo+Iqx4/EHYmvY3h+VbxwwbKyWp5ob88rp5IgaX
X-Received: by 2002:a05:7300:d4ca:b0:2a4:3592:c600 with SMTP id 5a478bee46e88-2a9415ba3acmr7907325eec.17.1764319216818;
        Fri, 28 Nov 2025 00:40:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoYq5NfdOWQ33VjWq75DPbPBOkH+zaUlbzwGG8PWLO78JeXM99PhHk+EAQ9/Gg0eg3WKmLqw==
X-Received: by 2002:a05:7300:d4ca:b0:2a4:3592:c600 with SMTP id 5a478bee46e88-2a9415ba3acmr7907301eec.17.1764319216277;
        Fri, 28 Nov 2025 00:40:16 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm21895872eec.2.2025.11.28.00.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:40:15 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 00:40:13 -0800
Subject: [PATCH 3/5] clk: qcom: cmnpll: Add IPQ5332 SoC support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251128-qcom_ipq5332_cmnpll-v1-3-55127ba85613@oss.qualcomm.com>
References: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
In-Reply-To: <20251128-qcom_ipq5332_cmnpll-v1-0-55127ba85613@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luo Jie <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764319213; l=3013;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=fngTMAlj8/JOrVqugfPFt+lT3tloNMK4jV2wmbRbI54=;
 b=2zCgXlKllG9ymmhK1oO9iNdHYOknYIxlqktRebfVe5MQlPoa9FiZPiNo96aA4/8Fjwzq9uN2H
 g3ubmrMdxRQCop0q7zvQ0pTNP1sEAPR5jrUlDf0mGfBPMPSDYELNNK9
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2MiBTYWx0ZWRfXw32GiDCDNO1R
 t796xwfd0iWU99RDBeobKjJ5wASpkAp5gQqy9f/bOhKWVuaBquAHWRaFq5e6Pb7akehbyLyRvBb
 adr1/gtwp0s6s5bHxQCyzQ/QgtXC9uxryS3/EJwdpzRQFYt0zfgDHL28/uCUTiy85WzJyusQBhU
 LQXRQSh9lveYl8MupTQ4Kb4iIPZIMFq0T/lbRiAS0XAa/wgHA5yc4qAEwcv2ebhkbc73enDgHNT
 i1EhZ9p+Dl6PKyPcbGEgR14cEvitkB/3BIeZBY0vMoI3x8Zu943/3EGKTKn/W5r8wG4ZcetxzRz
 MUKOGoI1bODhNqzUhkzwltB6JzzzHjR6SVoPS2fFNkQOak6oegPQyk1hyTWIm6UGZc1MtBfw9Dv
 iJNGxWswvgPZVV1gVTi4KuySQzqW4Q==
X-Proofpoint-ORIG-GUID: TrlrCl4L-bRjzDy0JZHA4TQ80P0oSWcg
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69295ff1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=34uckhk-FeckjHo7bNMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: TrlrCl4L-bRjzDy0JZHA4TQ80P0oSWcg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280062

The CMN PLL in IPQ5332 SoC produces different output clocks when compared
to IPQ9574. While most clock outputs match IPQ9574, the ethernet PHY/switch
(50 Mhz) and PPE clocks (200 Mhz) in IPQ5332 are different.

Add IPQ5332-specific clock definitions and of_device_id entry.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index c6180116e1fc..08159b427f89 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 /*
@@ -20,6 +20,11 @@
  * and an output clock to NSS (network subsystem) at 300 MHZ. The other output
  * clocks from CMN PLL on IPQ5424 are the same as IPQ9574.
  *
+ * On the IPQ5332 SoC, the CMN PLL provides a single 50 MHZ clock output to
+ * the Ethernet PHY (or switch) via the UNIPHY (PCS). It also supplies a 200
+ * MHZ clock to the PPE. The remaining fixed-rate clocks to the GCC and PCS
+ * are the same as those in the IPQ9574 SoC.
+ *
  *               +---------+
  *               |   GCC   |
  *               +--+---+--+
@@ -51,6 +56,7 @@
 
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
@@ -117,6 +123,16 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq5332_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ5332_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
+	CLK_PLL_OUTPUT(IPQ5332_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
+	CLK_PLL_OUTPUT(IPQ5332_PCS_31P25MHZ_CLK, "pcs-31p25mhz", 31250000UL),
+	CLK_PLL_OUTPUT(IPQ5332_NSS_300MHZ_CLK, "nss-300mhz", 300000000UL),
+	CLK_PLL_OUTPUT(IPQ5332_PPE_200MHZ_CLK, "ppe-200mhz", 200000000UL),
+	CLK_PLL_OUTPUT(IPQ5332_ETH_50MHZ_CLK, "eth-50mhz", 50000000UL),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ5424_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
 	CLK_PLL_OUTPUT(IPQ5424_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
@@ -454,6 +470,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
+	{ .compatible = "qcom,ipq5332-cmn-pll", .data = &ipq5332_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
 	{ }

-- 
2.43.0


