Return-Path: <linux-arm-msm+bounces-30401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF2968A4B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 16:51:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D27F2B22D7E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2024 14:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA10A20FA97;
	Mon,  2 Sep 2024 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaW5Oo1W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 901F81A263C;
	Mon,  2 Sep 2024 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725288643; cv=none; b=qGZVf9MC/Gg/SKJlpdJ2k/6ONtvUoweSHkhTpl+or2NTklh0YVW4nZ+bxuX1R0KENjh5qe2GmCRN4cjxLRbeHck8YYg58pjLG6M3gVpAprWR5qgTcEUs+LEi/zi/11HhSNhPfRVmVVBzftxgzwn0pZdAt99vDsXkUeqJUYmHo/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725288643; c=relaxed/simple;
	bh=yR60XCfURw0FQLF6V0+FubP9qr/PcgxiSYB0KGpj5E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=duFuPKgKH/wlt9W9o6/IwmEjSbJaTGuJXQxIElEBZHkrrOH1LHN6l9O0bQbmrKiCd9bWl1QM8xY6qOqIuQUIAMKJUfiwnm/nDyMLpxUj1HR8i3CTTpvj8+n3qRIZkmfHgUHJkhzMtmAjU8gnU5mTWV4yHSx3Gr3tSoSMPkM0OU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaW5Oo1W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03D5EC4CEC7;
	Mon,  2 Sep 2024 14:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725288643;
	bh=yR60XCfURw0FQLF6V0+FubP9qr/PcgxiSYB0KGpj5E0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GaW5Oo1WM1esTC2XBkRAlYSITWMFhWUJGC8qP4ay+96jA0X+9/TZjaQCWolG8yMNx
	 jJ1tGFnPQ0cjPy+Tf1nind7kZlBGnxHInyFGghSTfbJx/7+uGIx3FCdfEPvyghPWbr
	 DAFolQofHLYoLnUHnwetvsouYEtH5NWVszpYC+8iRuI3cQwc9b8QiPzm3m3MQzJebO
	 XCwZQ40GsRPWfCqwHaVq/v9d+XZh7JOCUM/Ui+2zThWzUfuh5lQC3MzWz1omC6TKzy
	 7qwRjWQ5NS9vQBZ2klC+TwkReaImec3TKWJrY3obsZ5Sdwd0Q+nut9wcopGTHwGFJ8
	 yTwjVxSQx2y6w==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 02 Sep 2024 16:50:33 +0200
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-romulus: Add lid switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240902-topic-sl7_updates-v1-1-3ee667e6652d@quicinc.com>
References: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
In-Reply-To: <20240902-topic-sl7_updates-v1-0-3ee667e6652d@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>, 
 20240830-nxp-ptn3222-v2-0-4c6d8535cf6c@linaro.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725288635; l=1648;
 i=quic_kdybcio@quicinc.com; s=20230215; h=from:subject:message-id;
 bh=MoIcFxZunJ/Z8E+MV8efnfiVLgeaK70xCs+sNGq6SSI=;
 b=k+qptwrRl+40IUsWAaXjn2r4oNMBK2cuBMO+QqD+OTAXzoF8ylV8EL2YD1Exw9t9eMHd327zx
 oyHoPVEImqcBTPDJTONwqgl2B/C3dDSoIeAhW6EDUq4+fj4PKKsUKQD
X-Developer-Key: i=quic_kdybcio@quicinc.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <quic_kdybcio@quicinc.com>

One of the best parts of having a laptop is being able to close the lid
and go on with your day. Enable this feature by defining the lid switch.

Signed-off-by: Konrad Dybcio <quic_kdybcio@quicinc.com>
---
 .../boot/dts/qcom/x1e80100-microsoft-romulus.dtsi  | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 42e02ad6a9c3..5419d0b02785 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -30,6 +32,21 @@ backlight: backlight {
 		pinctrl-names = "default";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 
@@ -704,6 +721,12 @@ &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	hall_int_n_default: hall-int-n-state {
+		pins = "gpio2";
+		function = "gpio";
+		bias-disable;
+	};
+
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio18";
 		function = "gpio";

-- 
2.46.0


