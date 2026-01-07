Return-Path: <linux-arm-msm+bounces-87783-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4442ECFC170
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 06:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4338C30635C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 05:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545C426B973;
	Wed,  7 Jan 2026 05:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhLD3qdX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HPjMxqhv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23F127280A
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 05:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767764121; cv=none; b=MyXejKt6hM6m4Rp2kcJZMGDjLhrTDuEQU5tJU/c35hyV0SKGyA8dFeaWJ6EkAT+BFHL9AKP97CwFZtM4g+upi2V/BbKjOGF33gFY0VEP2Ra9FLproRY0nvo+uh5GiQVfb9Lkw3y6rwV8+CMGNG1cV3hGMul0gLZreblbMgYUXLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767764121; c=relaxed/simple;
	bh=9W2NsSVmTo4gJlPLl2j5ebai9URurF5tiJWfhlce6+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YMln2FJ+eQrcP6tLcJmAV4EZxV5Uf3N00sWFvgZScCIs4LqdOOpi4g1wlhlrLwZfqZ9XfDMWkKegO+GOFKmpH47v0++jqO94qGGh52DVJ5D+mRqG1MvMYQAVgfm1hAaNSSz96W5AGg5/NTNkjTVQP/lgfcl7k/o5jkMiyR3FuhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhLD3qdX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HPjMxqhv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6073VtSq3888892
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 05:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OYaGUyRAntpE32ASeSNSMZQhu3N6puPsfjF/mDaL9jg=; b=JhLD3qdXGr712sVq
	KU+j2MQytYGm+jjRR2UhxiIYEdfZnf9gkmLS9brIqsxcWAKoYHeFN6Q7xmG36PhU
	2sYishDNAY7AzW0dWt50A52ee4LxO1Z1q0p1+Fdgrl1RuBuqAyoroRXV6KYJBMlp
	2Jrh1KYJX1xkvJtCczBlDRrHW3T6jOcfiZIuc9+4lLH2f4o9z0Ym7vhfLmkutweZ
	SOHcsm+Vb6EuxoxgbHJrucDye/uwdL4bxbFe/8Ka3adtI9bFzkIubimmSerBAIXU
	hOK76Ci5dQlFudWQc3v3PcCjwN0gW0CeEa9JKrLFhefUYshz65cWI5/4RQcyuleo
	m4gjaw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6a0j1x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 05:35:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b0531e07e3so945858eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 21:35:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767764117; x=1768368917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYaGUyRAntpE32ASeSNSMZQhu3N6puPsfjF/mDaL9jg=;
        b=HPjMxqhvw932yF5/Enz6w0uA162cZgLyOALa/iGwwY/6EjbxTOqpXLIdfqW698eksX
         XUa3i9EIJpTs8Vilzvs1FVvNbQsWzkUesT7jiFZmvrwibWL2NGYpZrFJoqx49PPIJ+QI
         EK5lcOKRas8uCXrod2ccGWsHVbYm7s4Sq83qCGlYj9BJMHCOURDtf/7PJV7ZrC2fokF4
         +zbyQi5pX5R2HDzPJ0obDsHeiv53KXrjJ6QZZzUqlPVBg7tvwoOfCptnraqKdJu8jS5B
         Bm9JYKv1KumLyYxENgxbs60EVSPN5M9kS0nlA24ipS6jYlHuDIE+BD8AQYIDowqDjZ9l
         E8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767764117; x=1768368917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OYaGUyRAntpE32ASeSNSMZQhu3N6puPsfjF/mDaL9jg=;
        b=sGCry82fqsWqQSVbXaad/PuDZyXnH8I0GZ9h40P73GMXZ6wYnkceowcWDkGpffjPN1
         cFFBRZxCtRRW0AszBHXGgZtyWbkENf1lE06legPIcWKm7ypQA+nbsti4kkS2ZEb+Kz6a
         X14CiOGVDKaf8E1d+gh5IApO79IrQNmbnrm4huz9o4CyCz5rFX6IBe1gVgIwKjoyhUio
         KfwgmyisPrpXt/+dkgSd7FP61jFZkiB8pbBrL+Vc8rm1DGINm5ZRMmueWeKtZD46Q51K
         fBASq2aQvoFmlaa4d2kGfMJKhmPmfAjDn1xTr3RoyPI1tB+ESRcxbtkLup4S5qqrvlt8
         VtJg==
X-Gm-Message-State: AOJu0YxYBNB2ZKlxAzYVvQgeOMYRy1ZvBJKf/0UiD1yA2NSMDPynGdzn
	zQY8s517FHPvLuLWVfFc0cm8uXSEt33DTXdaG6Npf1DUCeSMo+9rt0OhepOvIXg80EzDC1wHj27
	cqtmDuCwaFzwf83khuY27DP1rxPYDBu0S0qke3tL+KmzQ2hf3V8vZcrAJiEu6yJXWZZNp
X-Gm-Gg: AY/fxX46898AIoibBdCKwrxp/zQcBjZmZ7zCIR98d0F6egTp/fplAG0fCKJGdy7K1sd
	lcnMMkDPQ4EJEW4YdilwwaFb4qH0vLpOF+kvLyz3w1laxIa8vVewx2eeuXJr2Hh7GUgPu2+7w1u
	6rvuOJS1U1bzlL4FOq+YNKWn2seyE3sFW+8EhvYriIHUjijCOwCwZijtrFhKyn96ESczgoCV2uZ
	WdUK3dJ8N5p7SsIXnRLSeK5xw99BgT9VNFYnqfXLvLvL2IIXZMOkFTzOIVyOoXPrOzXju2TRolk
	y75yREfhYduaF88FyM0LpZeWx1cMARtdlgKgpGY/BdXJibg/JZmsvCOpTGy2COm+c3QOVcMEgff
	PVYig1xmjOym2LaxQ/6yJcC7KvckWAz1QQOM4UsaFg9cp/75YVcT7
X-Received: by 2002:a05:7300:fb8d:b0:2ae:5ad4:718d with SMTP id 5a478bee46e88-2b17d34e7e7mr1126403eec.43.1767764116742;
        Tue, 06 Jan 2026 21:35:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/vhyj5twvbB0ARPdtnmPPDYGnMLYL5dKclqCYFPR2zpqE4rY+bJs61YRAkDqiPcLMrxA58g==
X-Received: by 2002:a05:7300:fb8d:b0:2ae:5ad4:718d with SMTP id 5a478bee46e88-2b17d34e7e7mr1126381eec.43.1767764116136;
        Tue, 06 Jan 2026 21:35:16 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm6120311eec.2.2026.01.06.21.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 21:35:15 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Tue, 06 Jan 2026 21:35:13 -0800
Subject: [PATCH v2 4/5] arm64: dts: ipq5332: Add CMN PLL node for
 networking hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-qcom_ipq5332_cmnpll-v2-4-f9f7e4efbd79@oss.qualcomm.com>
References: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
In-Reply-To: <20260106-qcom_ipq5332_cmnpll-v2-0-f9f7e4efbd79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767764111; l=3732;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=9W2NsSVmTo4gJlPLl2j5ebai9URurF5tiJWfhlce6+c=;
 b=f+5ZHncEk61jgbXJaROmkrIZSLv0dXLArLa2Gbro6E9EE5mCLBAt7WCLMQ/xLrBj+CbdZUHJF
 Q3ZyxP4s26iCAIjVC2Ymv9xgnEL1zjrt2rm3WuXBJEJBOwKICz59Mka
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: BQ_0swAcsgEHau7t_ZSS9JygqOdSphyI
X-Proofpoint-GUID: BQ_0swAcsgEHau7t_ZSS9JygqOdSphyI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA0MiBTYWx0ZWRfX/yyscALGcpFP
 JJtYFWIrUmRbJSMDbpTgDmFQzxnztH3AZM0sLHJ2jgwn2KcVLcAltL0r9jLeY7QOG8ogmG3davy
 6Pt0rPE8kfQlnP8bLh3ELC1v3hPxzY+MuKPOVKC8xPOS03OOKybaIf68kTKlRKuArwtlr48V+RA
 9BRczQVh9ZDnaUaglx8ZCesGgIevxCAuhC9VwxAQiHt5FVyuZr2qK7Bv/ohXeYQOrnqm4e0c+P1
 J6duZCkxQucv+nbyK9xqpHubmQkiYk51v5WfcAAvK+E1G9kri1RO6B5LVDi23EhNja1W/QkiMWB
 BQo356KeHfpmk/knEMlrIL+5H+n0YanTpv7yYLrpeJpF5XKayT5iZWKaVKysIB4lXcgDSFYHLeY
 tY1Z4fxXEp+VrGskQnOAXb7WVFwEfKs4yccOVKSLfIz4tfb6GMe67l4/pfPA7lkMHv0RBlHMnP6
 qpWdAQMfUHpFwgmhMJg==
X-Authority-Analysis: v=2.4 cv=MtdfKmae c=1 sm=1 tr=0 ts=695df095 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5EDsn-5GhASIcmvYHhUA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_03,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070042

Add the CMN PLL node required for networking hardware operation on IPQ5332.
The CMN PLL core runs at 6 GHz on this platform, differing from others like
IPQ9574.

Configure the reference clock path where XO (48 MHz or 96 MHz) routes
through the WiFi block's multiplier/divider to provide a stable 48 MHz
reference to the CMN PLL.
.XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)--> 48 MHZ to CMN PLL.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 17 +++++++++++++-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 28 +++++++++++++++++++++++-
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index b37ae7749083..471024ee1ddd 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -2,7 +2,7 @@
 /*
  * IPQ5332 RDP board common device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 /dts-v1/;
@@ -55,6 +55,17 @@ &blsp1_uart0 {
 	status = "okay";
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHZ or 96 MHZ. This setting automatically enables the
+ * right dividers, to ensure the reference clock output from WiFi to
+ * the CMN PLL is 48 MHZ.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
+};
+
 &sleep_clk {
 	clock-frequency = <32000>;
 };
@@ -63,6 +74,10 @@ &xo_board {
 	clock-frequency = <24000000>;
 };
 
+&xo_clk {
+	clock-frequency = <48000000>;
+};
+
 /* PINCTRL */
 &tlmm {
 	gpio_keys_default: gpio-keys-default-state {
diff --git a/arch/arm64/boot/dts/qcom/ipq5332.dtsi b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
index 45fc512a3bab..2b1d098f9424 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332.dtsi
@@ -2,10 +2,11 @@
 /*
  * IPQ5332 device tree source
  *
- * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <dt-bindings/clock/qcom,apss-ipq.h>
+#include <dt-bindings/clock/qcom,ipq5332-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
 #include <dt-bindings/interconnect/qcom,ipq5332.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -16,6 +17,12 @@ / {
 	#size-cells = <2>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -25,6 +32,11 @@ xo_board: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		xo_clk: xo-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
 	};
 
 	cpus {
@@ -167,6 +179,20 @@ usbphy0: phy@7b000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5332-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref",
+				      "ahb",
+				      "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ5332_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <6000000000>;
+		};
+
 		qfprom: efuse@a4000 {
 			compatible = "qcom,ipq5332-qfprom", "qcom,qfprom";
 			reg = <0x000a4000 0x721>;

-- 
2.43.0


