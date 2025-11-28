Return-Path: <linux-arm-msm+bounces-83704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301AC9141E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 09:42:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26DE83AE380
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 08:40:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EB02ED15D;
	Fri, 28 Nov 2025 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UWwI3FP7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZHwfu7K9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5202ECE97
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764319225; cv=none; b=m0GX+PQ7XQDglSFZ4ymw5s7R70aTCKrEhpnyxZXrdlZj19jo/8Z6Zk00/EKm4bDhhcrJ+cNlSgsOoM39Th5YDmnyMqRqSUd5+bXNYbzddvvuomwRcZf8v1iPqPINyaSpOCOx/3/q152sFvbgkR43Vtdz+Oa7ZFkT0PdTQVWlRbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764319225; c=relaxed/simple;
	bh=mHpQjm5uMmfeEHbk5vJMLsRIY4uxmat4DEorvQQusFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LfGx8LdyG6JcIfxIe20mPMwXRi2pnQ2RYEisz608ZhdlanTy/wf2L9HLlm5x/VpqSWLteYwOqpyv6ZnbrZzCmaFPNzWXtScwpkKrX5WUazPaqlkQ+z45vZpNwp3hhLgAAmNdB+iJcS74vNb6nkdeW60Tkkq+TyCoXOAlt5VzF2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UWwI3FP7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZHwfu7K9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS8Oabo3531010
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sbUUlgRufuKSd9dQJoEl+MOxWhuytzzVGG1c8fE2gdA=; b=UWwI3FP7CRH6XuO9
	pZ6YYicdVegm6K8MourD3ToprorT2tuA5Qdsupnhne1728310vF3NLhAuN0o/ju7
	xHV+1K94zpyYQNYC1XvuGqnhAFMz6ZtS0qtma8Btrx5o1+SC6c0xZGI5DdLIDFRN
	WxiHSGc2F2uTv+QRTj0TO7+9yoFI1d71PL17yzlEU3UvmdT90Hr3rQ/tRX9zLDEJ
	Uy06GFxMB072T4oLyoiNRI2QdHTe+AMsCuGqzv1qZNps5p5B6c5gvhtmFfcdYgUE
	wXaz3Qm0gOcUnbcoSMEqJma8cV57VbFX1AEjDVnpdSUYPcUrbg5e4kBahVLmG0/U
	nmESKQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4apm2rtumj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 08:40:18 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bc0de474d4eso3965609a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Nov 2025 00:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764319218; x=1764924018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sbUUlgRufuKSd9dQJoEl+MOxWhuytzzVGG1c8fE2gdA=;
        b=ZHwfu7K9T+adTe/gE09Babfy2amqHi1NSXjQaBAJh/ub3oVNk5Pky1xmgyaE7d4Wgb
         Zrp0c4CblmJz0wKXTSNLh3/48v7jaFoGmgu4/wNjI/cMnttXEhFbJt6eRJ/Og64j5i4m
         Pcf7idYd5iAkyc41FrMntBnq7KlWTYXYUvHXvp2+6CU8GxTN+ZwiQkl/NjcG+fSxGRsd
         3t9bIjtZNzrOW21DG6nlZAkKOeOm6dwN6RHkiz7hK47xB9fo/ERw6/iAZlJkuPDiqRxC
         4yMHyKbwwaePAzLrLKDd6SLggJ8hRoLvn5/N7rw2vhiE2CnERlcXPL6i4dYpaQnejKWD
         Jb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764319218; x=1764924018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sbUUlgRufuKSd9dQJoEl+MOxWhuytzzVGG1c8fE2gdA=;
        b=qZUqcWkuPkUVkXJ2iDFaMVwz6/oX9UhnZCdUaL+sS+PO7gKvkAoYxj+g1FGS67nolN
         xdPwSQg4whWKuWflsX0uR3JodeTBu6SHhMaaqskjYCZh1z3FuauTDmFQoHJeKYoCT3DG
         jdQm6zskEDKal18/bBklOaBNdnOgX3QY6d0alHrnoyRiaGVqqxMGw6vdJ1TuTA3Hfnqx
         lKwUVCADipFvC7e/gbBwwc5jwBpi02IVBSFqMNbS9xPuCnf65yOmTuk+pFW6qKU8tHo0
         6p9NMImtTTz7naxxgcF69l/NAu49vZ4HNJLbbOZikMjq2L9XcQo/GBTpE2M685DXUCF0
         PNYg==
X-Gm-Message-State: AOJu0YyJowcHzQeLjsEkRad/GQk/U7MDnKwSYregD9YkZflLR13d2KmX
	PnAZckThFvIbVspX6619TP3F+PMSKHgsnFnW0XACTYtirnWBDChvAqtc9n265n1QLp5RZs/OWhJ
	Csf1x0y6qlaNdWoEjf+LFV+HLLiSf30YghuFsVCrfnxkgpTcybpKwcQH2r8zGVc+SyoHX
X-Gm-Gg: ASbGncuq9xb11OW1RlQp0wGVUu5hjwj190jT5TpalgEn2XmpcmuHa/0h+YyvhT1/Zu9
	XnDvr25SV284te6LUjlBiiwT+1A3qKdo51mWjVlQdua1vSY1aFEEq8HOAxnQsS8PRlz928eNDG7
	9wnJeg6f3kHNBKNQZcYxBZIxH+gX2DZoytuNunrZokXv8LoHbmLYdWdL9/jVlO7MqtgfpPmPKnX
	OFgQbtL92MoaXmHY7u5CM6TrSy1tBeJJx3g87jOCs4NkzmHhk259bOBP5TL+aDi2+/d3Ek7PZkA
	l5am/21uwSRJkqgVZOFuZ4jvUpI3xyZ1QMidEBEAI/2dewaKQZjnnPZM/PKGpRyUaZl9jGFnZo3
	DWgeDwvH3pB81lIfJVSi0KFMzP8FgJremnib9bZUPyELzKP9IfjMA
X-Received: by 2002:a05:7301:d184:b0:2a4:4e40:7c89 with SMTP id 5a478bee46e88-2a941894af7mr7110157eec.28.1764319217628;
        Fri, 28 Nov 2025 00:40:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjlgqRAodQoGQOMiFl/70mlHJjYMJNxnpthX0kdToaKfnukIdPW/wAxAYUSFDXORf4oHV5iA==
X-Received: by 2002:a05:7301:d184:b0:2a4:4e40:7c89 with SMTP id 5a478bee46e88-2a941894af7mr7110137eec.28.1764319217100;
        Fri, 28 Nov 2025 00:40:17 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm21895872eec.2.2025.11.28.00.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 00:40:16 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 28 Nov 2025 00:40:14 -0800
Subject: [PATCH 4/5] arm64: dts: ipq5332: Add CMN PLL node for networking
 hardware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-qcom_ipq5332_cmnpll-v1-4-55127ba85613@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764319213; l=3649;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=mHpQjm5uMmfeEHbk5vJMLsRIY4uxmat4DEorvQQusFE=;
 b=alOeJlji49VxisJ33KpFYSBQdtUeCb7wvWxz/Q5ZV8GYGQMzuaT3AqC48hjOMZocwAPm62ajz
 255qQs/YFB7BJqMcVD56jWTlO1cb/v3WrARHPVkKgtyeMm45yiZCEkq
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA2MiBTYWx0ZWRfX5NKwWhZRW4Lc
 QYSoP8bPGq6GB8mLRstnLtviAz02tZPj7Wj/oepg/8NsbWyA/iERgWHMhswR0vypedHaZXpY43P
 htcyXeY7XzrM8FT9t7NqVuhMOmQu0GUWuOoSfckrO5/4eeb3sq/aHwcNX127Y0lSm/iNUgJdDFj
 ewoNsXx/u/4WtHKXeQh7uc3IQpaPTQOguEckml0IRimpsdJBIK8M8c2+5n3fBmA8q9aCkcvTftY
 J+Jt4L9wiGluRK1soxfY8z4s8InODIVvDK2Rj1c5lDiA+n25Ck/Wi+RoNHO72UlBZ5wrVG3qWje
 Iu7M+8f8kw3dlNzRdpYw8NcV0nhb9c/8sqDVYT91MZIMVs7cdbqeiD745sdQr1ZNsBx63ZehSJf
 sWLBWDz2UYnMDgGeymXe8XGzmWuZEg==
X-Proofpoint-ORIG-GUID: pFsrIXXymjPet2nSv5QOiAimHGtXA4zR
X-Authority-Analysis: v=2.4 cv=W941lBWk c=1 sm=1 tr=0 ts=69295ff2 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5EDsn-5GhASIcmvYHhUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: pFsrIXXymjPet2nSv5QOiAimHGtXA4zR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_03,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511280062

Add the CMN PLL node required for networking hardware operation on IPQ5332.
The CMN PLL core runs at 6 GHz on this platform, differing from others like
IPQ9574.

Configure the reference clock path where XO (48 MHz or 96 MHz) routes
through the WiFi block's multiplier/divider to provide a stable 48 MHz
reference to the CMN PLL.
.XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)--> 48 MHZ to CMN PLL.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 17 +++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq5332.dtsi            | 26 +++++++++++++++++++++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

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
index 45fc512a3bab..0707e053f35d 100644
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
@@ -167,6 +179,18 @@ usbphy0: phy@7b000 {
 			status = "disabled";
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5332-cmn-pll";
+			reg = <0x0009b000 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
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


