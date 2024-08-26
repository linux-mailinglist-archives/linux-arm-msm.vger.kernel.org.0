Return-Path: <linux-arm-msm+bounces-29500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EF595F407
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 16:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5863A1C2183E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Aug 2024 14:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A62A18F2C5;
	Mon, 26 Aug 2024 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfEkf7fz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E89618D64D;
	Mon, 26 Aug 2024 14:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724683103; cv=none; b=jpOy0fAT5WtsM2iRJl+Hi5VinMsXztfR9YzeTxNO4g86ZHQ3wGIYZJmI/5CBObOqKLlHIx7A6kMf09Q98d6VDDqwXap+35OgCo3yGI5jK/7kiAZ9Xst/oEgCDi+pNUazah0jMJZufaYSBDOZtzm0hZQuNeRxf1mSphzz75JtKv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724683103; c=relaxed/simple;
	bh=XiEnj8CekaU34GsCU3zQDJcUQIIPOTqeITMExw6yYGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L+Na7vWho54GyxU1rxvNTAdq8t2vRht8ddvtVDs2fI+p3LRnfkQ+e8vFGLmDXnrcP1QYnqfdcJTUoBad/5UZ/rCJ54c49rEeeAdKMNW9sQd8oB2K13PrajCYThKwM0ZZpmI7N2BmRqT/Z0AgpUmJJzw9x93NtSEJhSu8ZcvdE7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfEkf7fz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3592C4FEEA;
	Mon, 26 Aug 2024 14:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724683102;
	bh=XiEnj8CekaU34GsCU3zQDJcUQIIPOTqeITMExw6yYGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MfEkf7fzZ9C1Kx7WCTuMTrp0A5+Xmg9umIY2GbMQTceB/Npc0K1zqoV+hoGdriFaO
	 O0v57td+44Q9llFQDGOR+vl58JnmY4rFa5WpuCVJApTQa1A0TEYq4hfdgerkU4+P1U
	 EdFNi3DOEvPZsjx8EBVhtJi3O+R4ry+Cck+NxJnujo1tHEWGLUJI/n10oyuxGobsH1
	 mBMCA4ka/LIDH91cHaknpMKOlyRKMWK4FxrB94FGxFCIW438jJznvYYQpBxthWddcJ
	 vCkuY26XcmSnkRGXCXUWHlQUlGnwKXmtfEQnrhwYj2ran1LbTf9XJWA5bp75WBDd4w
	 wH5p84z4I539g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 26 Aug 2024 16:37:53 +0200
Subject: [PATCH v2 4/5] arm64: dts: qcom: x1e80100: Add UART2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240826-topic-sl7-v2-4-c32ebae78789@quicinc.com>
References: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
In-Reply-To: <20240826-topic-sl7-v2-0-c32ebae78789@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724683080; l=2610;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=sfXh8ooTeCsIQMVI1QWC//uWteDvPhWqv+ZdmPj1p6o=;
 b=dKYrKXG0sR5/MJtihewN5bIBPJW31gwkdkHFwLcKGf/TgtijFCnt3ss6yI7UuckxIvktEqtLj
 jnG2iaVS2JWBz2QSAZhJVN3Ri8R7yDHQbZooBZfG6tFEoEpS3KNoduU
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

GENI SE2 within QUP0 is used as UART on some devices, describe it.
While at it, rewrite the adjacent UART21 pins node to make it more
easily modifiable.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 70 +++++++++++++++++++++++++++++++---
 1 file changed, 65 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 6abff8258674..f9e0b1dda4c0 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -2143,6 +2143,28 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
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
@@ -5559,12 +5581,50 @@ qup_spi23_data_clk: qup-spi23-data-clk-state {
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
-				/* TX, RX */
-				pins = "gpio86", "gpio87";
-				function = "qup2_se5";
-				drive-strength = <2>;
-				bias-disable;
+				tx-pins {
+					pins = "gpio86";
+					function = "qup2_se5";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio87";
+					function = "qup2_se5";
+					drive-strength = <2>;
+					bias-disable;
+				};
 			};
 		};
 

-- 
2.46.0


