Return-Path: <linux-arm-msm+bounces-82723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EC61DC75C62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 18:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 8011733829
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 17:35:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53EBD2BF000;
	Thu, 20 Nov 2025 17:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvb/MEJc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248D236D506;
	Thu, 20 Nov 2025 17:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763660034; cv=none; b=P/pk+4akZ2QwTv8T0X8SimPAUEDL9jg3zj3qTU+cdVbZxsa+5VQhDMKFVGnF3QgFAUN7FuGEtkgq4Yl2Etl8oNQ4IXPCx8xY/qdel4R2f+rtJTAQfqHi0vBvcv5ZdWCoBD5d0iV3b3S/iip1tmIQqssOogkyCEYt4rxWr43/VK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763660034; c=relaxed/simple;
	bh=C/tEt3dLJrR3r5o4iek5F6b0mqBPJQz3oHLpaMQQYdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FJgoGnDtjcYDmqFOkrGfqtqYhKtk1JoN8ezRJVAnnv6WgCa7lar06yuIolTNjdy33luDtBp1R/1d4jCF5PdhEsPmHRinOAk1LnQPNiw9p50k9qrlEoTIOziEbl0D0Wsf+5OaflsLQrp6hnBB1lXnNQcEhW2HbrqvkZkAANs1NTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvb/MEJc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF8DCC116C6;
	Thu, 20 Nov 2025 17:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763660033;
	bh=C/tEt3dLJrR3r5o4iek5F6b0mqBPJQz3oHLpaMQQYdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qvb/MEJcJeZannCQVeP2JMDHFPXiU+NQUoOQ88cFmmv3YJWdsVfMkrt0bzKO4FOU4
	 bVvVEaUnwLkZehNt5sbV5EekgiP+2iTNtefF7PHH+POqIIA2pTOMauBy61VkE7wKxo
	 zhH0/6/uXfl4imZmlH/4ZW3OXR3pfSmPXDqObwXiWx60AKaQ27vCjXbj+7ZlXcahah
	 PbKrWmlY/t6JzmxmFfg4A/Ojh+G7GkwqrvOb52PgKVA0QovUjR1Yf1gpGknnCvboMY
	 edsPf8uI7jQLq/ftIsoSXVQ2XUsw+NAZIcr94hmf4IdiMgZO5rcBR2660bGr2N5ETd
	 Llsrap8oXYXLg==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 20 Nov 2025 18:33:31 +0100
Subject: [PATCH v3 1/3] arm64: dts: qcom: sm8750: Add Iris VPU v3.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-b4-sm8750-iris-dts-v3-1-8715442c30d9@kernel.org>
References: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
In-Reply-To: <20251120-b4-sm8750-iris-dts-v3-0-8715442c30d9@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4707; i=krzk@kernel.org;
 h=from:subject:message-id; bh=VnK8D2erdO11uA/SvnjmY0l27O0oHV2D0dM/QA6ASR0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpH1D6JBdNvnHYcBqry2lJvVaMSpJv5qGT8eD4z
 wve8qDNFtmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaR9Q+gAKCRDBN2bmhouD
 10ZPD/9gl3CwCnUxjt1xUKqSF0Ft0UfoxKsxAjdXrkeNiGfvrMna363Tb+3w0zuKzHe2WHDJ4vr
 5vFY0KAP9tAT3VMiYM+aWL8s4NIm5zpjs59DI5WU32xpYplbD4ObgCbePdY4sEexu4kjzeqJrX3
 WSkeT8k2/LQ9nbtHw6QIjC9XcMOPtC79HqpZp9tnXTzH36nj6yVB5/T/YEjJneZ0esBQIYdZzZI
 vNRz3py2qiQg8FjA9ewtL60w65IpxWA6/p+gQBLflx5A9pONUX9HD9PFxPu7YQvMRHnzVBNybkC
 26WXI+idjW2EBmwedZeWp5Pn1oNUs3KHT8d8Raoel2//4CdcvdPsw3WSJVF4++Ko0sD2XE8/n9r
 ndJkKKyqYQ1Y1jIyE3hg1RF8mSTk59jL/fZW0cLap+yw1OTT4NyoqW4bd90Jb5LkMxuQorRQht7
 8eAeRRk3RsR+mUDFdO9zv0tm7qANFcRm+o4o6nEt+jBHx/qEb99ZIPkPgqn3cBffA2Md5esrsfj
 xED7OP0kXp9B/eZ9uFdzU2vlgctUl2aRCgV8UhNvgGC8KIQm4SIUZKAk1K9RKJ94h9Z6Jfzsjai
 p0yBWZ8PeOVoi+LRtNhoGJsXtvk9o7B6d+Wbp8GtIEFLcIxDqtyCn2h0aB3HaTozJe1zPTDyV9X
 l9WypdUur5YkrMA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Add Iris video codec to SM8750 SoC, which comes with significantly
different powering up sequence than previous SM8650, thus different
clocks and resets.  For consistency keep existing clock and clock-names
naming, so the list shares common part.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Keeping my original authorship (with bouncing email) + new SoB. There
were no changes here done under korg identity, so all credits are for
Linaro.
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 119 +++++++++++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bb..f8f6cbcf7f45 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sm8750-gcc.h>
 #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
+#include <dt-bindings/clock/qcom,sm8750-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -2740,6 +2741,124 @@ usb_dwc3_ss: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8750-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core",
+				      "iface1",
+				      "core_freerun",
+				      "vcodec0_core_freerun";
+
+			dma-coherent;
+			iommus = <&apps_smmu 0x1940 0>,
+				 <&apps_smmu 0x1947 0>;
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>;
+			reset-names = "bus0",
+				      "bus1",
+				      "core",
+				      "vcodec0_core";
+
+			/*
+			 * IRIS firmware is signed by vendors, only
+			 * enable in boards where the proper signed firmware
+			 * is available.
+			 */
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-570000000 {
+					opp-hz = /bits/ 64 <570000000>;
+					required-opps = <&rpmhpd_opp_nom_l1>,
+							<&rpmhpd_opp_nom_l1>;
+				};
+
+				opp-630000000 {
+					opp-hz = /bits/ 64 <630000000>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_turbo>;
+				};
+			};
+		};
+
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,sm8750-videocc";
+			reg = <0x0 0x0aaf0000 0x0 0x10000>;
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sm8750-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x10000>, <0x0 0x164400f0 0x0 0x64>;

-- 
2.48.1


