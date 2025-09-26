Return-Path: <linux-arm-msm+bounces-75310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DFDBA392F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 14:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96A0962494B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 12:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403A62F28ED;
	Fri, 26 Sep 2025 12:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S7mN7b1m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDF42EBBB7;
	Fri, 26 Sep 2025 12:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758888252; cv=none; b=VCONoV3mfjh2/TXXc9A/GLfgYNUWjAqgGOoHCPpHAGYzZqLz+p1HuDdCCjWcd/4Riys8tcXPO7xWBQoDFBHvdHkwfT0lfvP4YQdK5enrbHczVzUqN7NNzyVdQH6y7F/SLdSIev9QK2FJfwyraBunM2XZadS7+CtOsyknaBOV38Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758888252; c=relaxed/simple;
	bh=sGrEPDOTeFpipf3hEFypjwjfxNKI0FFlL13nujWnxhk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rcSZgBt7uWJNpQkucY3JRBQOU7SnkqAKV7xezWjBTK6xpyBbqY6aa239HVIhbJ6QMeRuDvzIgWAilohWMLSfvwkXSCaOmcSuFT3eIRBEoL9n98xL8MdurR7gIrNdz7euk4lcpS9PHbLuzvYjg4hjCirY1Va3t/2ax0oAgkXg66w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S7mN7b1m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9459CC4CEF8;
	Fri, 26 Sep 2025 12:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758888251;
	bh=sGrEPDOTeFpipf3hEFypjwjfxNKI0FFlL13nujWnxhk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S7mN7b1m0AEGlpNN+q+214SNMZLkJ/Y2iJ7h7Y3NwQKs+KuLkUjqkxqlL7YaF/op3
	 7xzcMws8ITk5dHaRN3YeHKP5I10w2jB2Zr9gsLXM6zsy7pE9kaw70QJfUASOetCtxb
	 iCwD2OHVgNSEJWiZCUvHAJ0ppiWJu6pGfm4vOrQsmQoqhW/be4l/9EB8CH+PLy1uRe
	 M/Ayxx0ePLtF7HQbD/J8DySyDL0TcE1hQPY54QMUuWSLvmAp392wn/awduTSa87gGj
	 5KLbXQG4tnmQkS2LswG3PL5+xQaPb100sQykJqDAyJz9GCMR+jxR1e2oaylrHFPzpW
	 1Ja1zQ/7sWy2A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 26 Sep 2025 14:03:47 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: x1e80100: Extend the gcc input clock
 list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-topic-hamoa_gcc_usb4-v1-3-25cad1700829@oss.qualcomm.com>
References: <20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com>
In-Reply-To: <20250926-topic-hamoa_gcc_usb4-v1-0-25cad1700829@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758888227; l=1349;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=4oQXHZE7SOxKlBUvkXpVQW/04g8PGSZM5s2yMXgYDWM=;
 b=yP11OufW0uOjQ4DKFPRiljqQwjj2zqc2/5XacMAZcSQ3JlsJcTXdpwUpKFWSqu1W3auO6nxud
 gM15xtcK4WgB1zjPKyL+iX5yR/ah+Z8PV+4fEuIlnPCN6sjUhXVf688
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With the recent dt-bindings update, the missing USB4 clocks have been
added.

Extend the existing list to make sure the DT contains the expected
amount of 'clocks' entries.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 51576d9c935decbc61a8e4200de83e739f7da814..cc76b9933a9bbff396ec4739f4a1dd3d2cc81f0f 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -807,7 +807,34 @@ gcc: clock-controller@100000 {
 				 <0>,
 				 <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
-				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
+				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>;
 
 			power-domains = <&rpmhpd RPMHPD_CX>;
 			#clock-cells = <1>;

-- 
2.51.0


