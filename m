Return-Path: <linux-arm-msm+bounces-28208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DCC94C822
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 03:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7A181C216E8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2024 01:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D87DC152;
	Fri,  9 Aug 2024 01:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WILfVNw9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1517BC9;
	Fri,  9 Aug 2024 01:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723167818; cv=none; b=dF5xb7+JoSdwZglzPrf0QMnqUsmjq76hQL38JLyisP7WZ46TTMyNEURdiCKJpOh8wH4xk92UekyEWHM92PlABOqBUEyIHVUdc0l4bSv6IEjhXWkhbt9nlM9zjUoy/4LkyeTFZnvwWxxEwgMDcjDB8RHWOEm4WVxXCi4GqIVNsrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723167818; c=relaxed/simple;
	bh=bT/fwgV49uTeD5E5U5PyN6g2VlugFUBLQSy7HvJnDik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MEzfQuX71WJv7Cf4B7OTimH56Dsp5B31+sgk0fSjqA/D5IUMbppGjlKRLi9dsEt2FWIjbQHGOjE0GlckQLPrMRDo6jmVvfUC0uid8OL6QUcdnAF/tnAtpVLt0+WRVIv5H6Dt1zkStpH3i7nBA0Lbyaa7wl5fyg9eGRjauxvyF9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WILfVNw9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ACD7C32786;
	Fri,  9 Aug 2024 01:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723167817;
	bh=bT/fwgV49uTeD5E5U5PyN6g2VlugFUBLQSy7HvJnDik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WILfVNw9EhQnossFGwH9JeRyssh8wopN+0+ksXgHnQ/Sz176PxeKtCTu2xbEQdm1L
	 uJhv1RzbZDgjKZ3aVa/eryDKHuy+TmZFrM03ZT0OYW+dJ2huCy4J0pZhrjn0d0EUX1
	 CIv9SF15Kas4ZG9H/qmDmVSz5Oxq4O4FIS4EKvSQeO4dfZMGcSE85ducFqcW2YqG/T
	 gajJV8fniSj/Va7ufTIf//tZ2u1SFbWE0Co4HQPvNxvg6EF3OSXxz59wu6tGr4KkEH
	 6rbmIUmcOV9JjKq+JxTXt5pPSCZzMEw3CCwx5TqPGkXQaAG6tFTkogE3IihAHVoPXS
	 aPLccS7U7nCtw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 09 Aug 2024 03:43:22 +0200
Subject: [PATCH 3/4] arm64: dts: qcom: x1e80100: Add UART2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-topic-sl7-v1-3-2090433d8dfc@quicinc.com>
References: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
In-Reply-To: <20240809-topic-sl7-v1-0-2090433d8dfc@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723167803; l=2149;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=TtHdNs+6i3n8jsKuyaD5jBPXgL3GwwIPNx7CnO3pjEY=;
 b=8ngqqAzlfGyYJN5lFg9gsHawPgyTJQC8I2/Z/iVx9Gq3yLq6nupFJzdtSx0fS+JNqEJT2bjW6
 tvQvoUYWWKFDidXjx+JHZ+H4c++Qnh/LkxyG6vaXTNkYDy6zr9wxEC6
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

GENI SE2 within QUP0 is used as UART on some devices, describe it.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 52 ++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 326283822aee..a2a011702752 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2142,6 +2142,28 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 				status = "disabled";
 			};
 
+			uart2: serial@b88000 {
+				compatible = "qcom,geni-uart";
+				reg = <0 0x00b88000 0 0x4000>;
+
+				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
+				clock-names = "se";
+
+				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config";
+
+				pinctrl-0 = <&qup_uart2_default>;
+				pinctrl-names = "default";
+
+				status = "disabled";
+			};
+
 			spi2: spi@b88000 {
 				compatible = "qcom,geni-spi";
 				reg = <0 0x00b88000 0 0x4000>;
@@ -5365,6 +5387,36 @@ qup_spi23_data_clk: qup-spi23-data-clk-state {
 				bias-disable;
 			};
 
+			qup_uart2_default: qup-uart2-default-state {
+				cts-pins {
+					pins = "gpio8";
+					function = "qup0_se2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rts-pins {
+					pins = "gpio9";
+					function = "qup0_se2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio10";
+					function = "qup0_se2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio11";
+					function = "qup0_se2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+			};
+
 			qup_uart21_default: qup-uart21-default-state {
 				/* TX, RX */
 				pins = "gpio86", "gpio87";

-- 
2.46.0


