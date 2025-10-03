Return-Path: <linux-arm-msm+bounces-75936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E2EBB7DC2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Oct 2025 20:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A597C19E1111
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Oct 2025 18:15:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42AAE2DF14A;
	Fri,  3 Oct 2025 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hq1NZJF+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7072DE6F3;
	Fri,  3 Oct 2025 18:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759515298; cv=none; b=VlxYz8IMUubdC0TTAEIkeDrCutX1b5kLYXSZqcovnKtx/9C/s/xxc+ynP3pg55J3PHD+5bEIF72jPptcS6QhpVweNrWbAOBcyrNmLY3tcIJjSfA4GmRQdvlstHn7IrwG0KovxSDABOnO+Ic6q/lcbaiXL7Ow5ZJ+hCiPp9KWILs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759515298; c=relaxed/simple;
	bh=62prP2dHzFG2Q4eOW7IrcP7Whf+smyjuX0kmntMCILE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6kedSBrW+D8qaOv5r8Ibdu4kVyrRGgHiT/LAZ3KHtYSLoWPJtuTIYxfRJnVSp62a6ooQDR/6uPIquvqYBgci+7cbHjAoq2WOnrlnafWv6U0ROLQC42UV1qax03cLiHvfvOKalFjWwbxJjIrL0adLzbZTImcsG8+987Ph2dIWdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hq1NZJF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB92CC4CEF9;
	Fri,  3 Oct 2025 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759515297;
	bh=62prP2dHzFG2Q4eOW7IrcP7Whf+smyjuX0kmntMCILE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hq1NZJF+mizPW/uP3uU459jZlt+dO7a1jwWpUdg9g+qoaZf9cQGODxiMXtz4/V4yT
	 T2+ZqpQuiMQEe7dxYA/hvymCaOa4wohIO1qq0r8QW0bpYATPvr43PofZUTYuXj0f+J
	 cfiK1BlLhsEDOA5VVWjXxZY/irCOA66kpND2En4SLSPQqxmvwZN+S8q3VCR0ft38a2
	 iytHyPiz6hoaTcM41V+XuxkamyWHaCvEvB4wzAHLNR+YS9WmiUyRL+psvc6eOJQvfy
	 W6KlbLZKlJmdyhy4pGkdF/DPnG7eMeYAl/W3KyJuV1SGra/4lzfsndS8/Ur6J+tpOv
	 WMxk8kele7vOA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 03 Oct 2025 20:14:40 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100: Extend the gcc input
 clock list
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-topic-hamoa_gcc_usb4-v2-3-61d27a14ee65@oss.qualcomm.com>
References: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
In-Reply-To: <20251003-topic-hamoa_gcc_usb4-v2-0-61d27a14ee65@oss.qualcomm.com>
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
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759515280; l=1397;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Ptb3eamm9HjWOiDCCiBnCDMX562eyPz3xJ8RictPz9k=;
 b=vTrElk6CTem9Y24Vfmy1pHTTdPYZuepuYSeXEbOIUTXkWVVTWN2TqOz5wNXZhDiB1m2zBw9h+
 I05mt5vSL9HCyWJOhj3rAvXX8CZQPjeIkGulgKZltls45htk0jDXrJe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

With the recent dt-bindings update, the missing USB4 clocks have been
added.

Extend the existing list to make sure the DT contains the expected
amount of 'clocks' entries.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
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


