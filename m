Return-Path: <linux-arm-msm+bounces-59945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EE755AC9AF1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 14:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1A037A5B3D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 12:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9299B23C4FF;
	Sat, 31 May 2025 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gNmxc/Qf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673FB1EDA02;
	Sat, 31 May 2025 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748694457; cv=none; b=qv5XAJT5pwcEZIW2pKT4JDhLjMtWh/G40uL8omosMqo8gGZ29xYG2xsQ69ok/rstzFV8aLibidnyQVhL+cXJfFW9nIrsEi7ShpGrQjeMOdMys0pnTcrR6Eu5ywZ5bG5rZ7Pls11qrW8pYsmUCc0uX4BFcQPyvMlZuxCzjMgFkzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748694457; c=relaxed/simple;
	bh=yz8tt4Bpe7P5wcr9hZe8/onfR3J+A8Fn4wRTEIwzKZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z3Zf8s97yPQaGg7N+umT9NkaCms6GEpDTfhraqKMo19KBnAa5GyypIFR4VZF4kmir3IXr5jFtmt9b/igqjGxxhlq+wNHryDJzWL3XnvJNtwSx1O/wJANkg1XQjYcXs0ce1jOmWDB3TG3bkOKUxnKbdgXaKmfVyBeSmuYoZWPqeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gNmxc/Qf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F03DEC4CEE7;
	Sat, 31 May 2025 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748694456;
	bh=yz8tt4Bpe7P5wcr9hZe8/onfR3J+A8Fn4wRTEIwzKZU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gNmxc/QfKnfmr9QtOAEMftwGPUHMjJgIYpJG8ZuDO4neRNkkX0KA+z4CNF8WSp98o
	 0R8UOV7Q96EqcPOKHOsnSSFL7WgNZXVPjmniMsSu4Ickh7k+jBqfmF1X+Q+FkTQW2b
	 Ts28NFwrDezSvRfs23Eh2rl6oFz5pYmRjpEfTL0MbrvczaoO438f5MpCuWyu+LtDgb
	 GTJbFa8INvV6KcrUtuy5lrd1B/3P01kq63D2KhjGBHvlyGNjGdrvsXMqJoZsOTvilw
	 3JkICAQjUWaL4VBWrishXxbyjTknD2qQWrB7kvzYh2HKy7gKx7CpOwXY2dadhNcvQ0
	 03PN78JDLFfFQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 31 May 2025 14:27:19 +0200
Subject: [PATCH 1/5] arm64: dts: qcom: msm8916: Add Venus OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-topic-venus_opp_arm64-v1-1-54c6c417839f@oss.qualcomm.com>
References: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
In-Reply-To: <20250531-topic-venus_opp_arm64-v1-0-54c6c417839f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748694448; l=1465;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=fIhoSyVtynAkVAixTwm21sdXpM1mvhm8GRPJMHak1Gw=;
 b=HPA3L5V9U+DUQpFC+9mCjHQaNglacI+kXaMlN5rT0d6KaHA+qVsmTrN9JHunTdvJtZy7QxkZy
 SsP43Yb9919CTGTDEQFBux0fpF92YtcldV2cIgOO4cQUEj7RBNjR71V
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Describe the DVFS levels explicitly.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index de9fdc0dfc5f9b223ee252b80fc18d45c9bb6582..6749facabdc512879e17061b03d0ed9e41671642 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -1827,6 +1827,7 @@ venus: video-codec@1d00000 {
 			reg = <0x01d00000 0xff000>;
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&gcc VENUS_GDSC>;
+			operating-points-v2 = <&venus_opp_table>;
 			clocks = <&gcc GCC_VENUS0_VCODEC0_CLK>,
 				 <&gcc GCC_VENUS0_AHB_CLK>,
 				 <&gcc GCC_VENUS0_AXI_CLK>;
@@ -1835,6 +1836,25 @@ venus: video-codec@1d00000 {
 			memory-region = <&venus_mem>;
 			status = "disabled";
 
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmpd_opp_svs_soc>;
+				};
+
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-228570000 {
+					opp-hz = /bits/ 64 <228570000>;
+					required-opps = <&rpmpd_opp_super_turbo>;
+				};
+			};
+
 			video-decoder {
 				compatible = "venus-decoder";
 			};

-- 
2.49.0


