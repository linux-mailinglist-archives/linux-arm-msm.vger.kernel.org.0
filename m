Return-Path: <linux-arm-msm+bounces-77967-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC087BF0784
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E89381888B78
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 10:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A312EB846;
	Mon, 20 Oct 2025 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9bFlltG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADF6191F91;
	Mon, 20 Oct 2025 10:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760955226; cv=none; b=J+M6Vwd+sbPdVNWSFEcR+LyUtlTUuhkuSV6VXxgZy/ji3iaM6xSK79cDou0exF7D6GFM/wqeIENNYx2w2tsUWta3SKi2r/1Hw0tyJXK0Imw5uWiOHuudG9aQoJU+XTqUIfVep4r+4Z5HGaTJMjvvBITit1yzAGhQ6Ww/hvW69Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760955226; c=relaxed/simple;
	bh=tIWBCIsaoT4wnAs1pu5i22DQkL3EHE+ksWJLZLB4LAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=myRZ27FrgwtgWkJWGsljlEaLwM/X0DbDqn+RfTs9oR30JocAUTvAKJRCEIzYcz4i6YwMdwfviI0KbVj/0/HMaFELYmh7m9AHzT7TOhYP/C6BrMKjqTCzskKnlYLz1xTvupe+AQduwt1Vw7m5J63T5Lqx1gClBaLfVqt9bmJNAsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9bFlltG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DC8C4CEF9;
	Mon, 20 Oct 2025 10:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760955226;
	bh=tIWBCIsaoT4wnAs1pu5i22DQkL3EHE+ksWJLZLB4LAw=;
	h=From:Date:Subject:To:Cc:From;
	b=c9bFlltGFqtt5hJ6R9USJ68fmCn76BJzACz3iwR5BQ9KfWOf1UxofbCAjTGK7+Qv8
	 Zv982gL32EEs1fvzm+EPDMx0VSa7m1gbqW5QfuGxw2LKZTTI96fGEhdU2V7kQZpjGZ
	 ZhK28j3GFGCuLYZiXczDz+mc32IO2eTjkWumxHtZU/w9Rah+G/3fxJJ6VdfgMbB/2n
	 6+u7p+7pIWcDWiGb7mEkpfmeCPV6yZsw5QeEg/lh936EJ66ApQeC4HoP41ClMihKOT
	 T0iFn+s0CzRd0m6+IJ9u47Z/qjFPlo3hqDEofLkdrh5tHPVgkostv+UmUs/X5ztkj5
	 XqdaAx2mZPuMw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 20 Oct 2025 12:13:38 +0200
Subject: [PATCH] arm64: dts: qcom: sdx75: Fix the USB interrupt entry order
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-topic-sdx75_usb-v1-1-1a96d5de19c9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFEL9mgC/x3MQQqAIBBA0avErBPUkqirRETqVLNRcSqC6O5Jy
 7f4/wHGTMgwVA9kvIgphgJVV+D2JWwoyBeDltooqaU4YiIn2N+dmU+2QraLs6pvfGNWKFXKuNL
 9H8fpfT/Sn2g2YQAAAA==
X-Change-ID: 20251020-topic-sdx75_usb-04acb193d35f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760955223; l=1226;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=3Bp8P7Ht03R3ivd5SxVXsCR7SjX9DbSkryw+IQzbxBQ=;
 b=txCiNXt1ROeRMb0luzl/Fx7NoCezQa9HpsH15VDXAKyuZqJCj3jRajOQJeOELwkWsyZRQup+I
 Zko9huXy4MHBNmryXUyOOG2t30M+TWho933v75enPR/H0bJ0LsVJENf
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The DP and DM interrupts are expected to come in a different order.
Reorder them to align with bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 75bfc19f412c..f26ba90ba66d 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -1043,13 +1043,13 @@ usb: usb@a6f8800 {
 
 			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 9 IRQ_TYPE_EDGE_RISING>,
 					      <&pdc 10 IRQ_TYPE_EDGE_RISING>,
+					      <&pdc 9 IRQ_TYPE_EDGE_RISING>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "pwr_event",
 					  "hs_phy_irq",
-					  "dm_hs_phy_irq",
 					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
 			power-domains = <&gcc GCC_USB30_GDSC>;

---
base-commit: 606da5bb165594c052ee11de79bf05bc38bc1aa6
change-id: 20251020-topic-sdx75_usb-04acb193d35f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


