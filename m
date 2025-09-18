Return-Path: <linux-arm-msm+bounces-74111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A3FB87193
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 23:23:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BAE17C0E6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 21:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DB2E2FBDFF;
	Thu, 18 Sep 2025 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YubTuwnN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B202F83B6;
	Thu, 18 Sep 2025 21:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758230457; cv=none; b=fTc/wY3hnytjWvKoTBwded4QNHeAH9yCrQdHiiWK0z6Pqcdtg+10gDKp/ccSB66DbzE9eIj9Le0CcXiAavv7yD9sT9nPxxuGP/BmLlm5kurzpbIOLKkTSehJDsGqutg4GpI7r2o5Cw3AAEG74Xwb/k03QsLhQbhp6DWlej5a1qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758230457; c=relaxed/simple;
	bh=dSo8PyCv5W3wiR8ABae/XBucYd73xpUbLl7qWfh1KCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTWwfoXSQYxe9UihEet/KoEy8+gssft04eerj6B9obrjyNRyEj4o8/jVNHMYfT3h8SNqhco6AsANZG9+j5RpjH2FgqFlDxSjWzu5ef8svH0hBc4ZLwwLP4j1qoVpLhr+OReGD1kkH3uOQxQkifX22f2LYSGV/2nLsXO4rqN7R+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YubTuwnN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE1D0C4CEF0;
	Thu, 18 Sep 2025 21:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758230457;
	bh=dSo8PyCv5W3wiR8ABae/XBucYd73xpUbLl7qWfh1KCs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YubTuwnNXOEsZGOJrmNzP4BY8+oXAxaZ8/3J6b7ZP7w7k7Yzrma1vHKKvco/Fz2Jh
	 IMgMWqw9P9cYnU+i6+q7lGukmUnVB/Tb6xHCj5xWF4kY0sBjaXW31iw9ExO+Bu51wj
	 4RBi3qIG3RfLDnfboA66rdLxN3mmgV4JAMgDmHmvcMuCbTs+YcmAEkQ8knUYzuNTRz
	 rz6vrFMyg6KbU0NLT5UevgXmylfJnoyHonHG63Wp2fbDreQAoohtzKHxRpIIRYbmUP
	 I5svjp7Ok9P66SN/zfnhCfTXgr4gHrf/5ZX22a5x5hG1TCZ8+BXbjtyCEviOhmQk3Q
	 Goq7pyFOlw2Xw==
Received: by venus (Postfix, from userid 1000)
	id 2A8A1180F7B; Thu, 18 Sep 2025 23:20:50 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Thu, 18 Sep 2025 23:20:28 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: x1e80100-t14s: add EC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-thinkpad-t14s-ec-v5-3-ac0bc6382c5c@collabora.com>
References: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
In-Reply-To: <20250918-thinkpad-t14s-ec-v5-0-ac0bc6382c5c@collabora.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
 Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1616;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=dSo8PyCv5W3wiR8ABae/XBucYd73xpUbLl7qWfh1KCs=;
 b=kA0DAAoB2O7X88g7+poByyZiAGjMd7HIPCB6SidF/F0gf4XfrlxnI8SEHQTMMLGDdoMGucYS9
 YkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJozHexAAoJENju1/PIO/qaOyoQAKTM
 Kv+SX0EsexHhM5HSGv0TkgZsXb8HaRqjsJUop81J5l6ZWx37oIr4Rd6a2DqnEOQJNFFUqyoaeHC
 bNHwoobRSsWJxTLb73+pYXXzCYS4AQA+CnC5cWSgVMioQ2uxIxlHNkmuhHsHLVTKJ9clmIHSEnS
 BAkmCQybFdH4zoTeX87zDCkrInrF2t6L0gmIGxIyG529lvC5RyNzbrjZ52sfJ6Xss9nOpxZfFQj
 4/fSUGJNHVbH6JH2/j5mxHFqdxUpFK4rS+Wxds2msvMZWFvhr6HpuvwtgXEB5D33kFb8jAgXVK/
 1YjBEu4e3RbO0g5LPfIqXKPRXb3gz05P5Lrv8STE31T0nJQ4+QqF+venbid/sXHb0yBdR5Bu3bq
 fGTr9+uCgdRO5sZ95clX9bIEkQqQPYltdfVGy+cdEyWbeciFjL226QDeBYBM8ux/gs0ZL+BsYt2
 sSu8dYJJjbBtNK+NF4KVwY+/taip+INXc5f2GoyqP80PB2bOktO4b8hsEGHCOrqHY4TB8qxI3eK
 y5/6icskrWZxJKZSLwg7u/Bn3Xey2nUDyYPU46pJ8j9FFclHmH3YJauQXTVsEssyfdHzf4sae6F
 XUAnwVKFI7rl8jHFkYS1m6yKWoqnP5XiNxGR5KYonF+jVgbrnnJMeavKqM5u9w5lPJkP7lhMDJg
 stFB5
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A

Describe ThinkPad Embedded Controller in the T14s device tree,
which adds LED and special key support.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on Thinkpad T14S OLED
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ac1dddf27da30e6a9f7e1d1ecbd5192bf2d0671e..f70489aba870289edbcf84ec22fdb004e010868b 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -887,6 +887,24 @@ eusb6_repeater: redriver@4f {
 	};
 };
 
+&i2c6 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &i2c7 {
 	clock-frequency = <400000>;
 
@@ -1267,6 +1285,12 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
 			       <238 1>; /* UFS Reset */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.51.0


