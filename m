Return-Path: <linux-arm-msm+bounces-83192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 920D9C83E9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 09:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 697023484D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 08:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9A92DE1E0;
	Tue, 25 Nov 2025 08:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="J9BC2/Xw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0292DC35C
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764058394; cv=none; b=JmihOsP4YitDlOMSH9Hxv5p+QleIR6U5vrKIOdJ4aCxnXh2p2bMb1khv9LvDbEGPf8esGmfKQD17eV1A896VBbt39QXwNbP/P+r4l4pz0bDaqG02DdUfBZBGvk1qKVfGhVLV0tq27ovxxg+nN1qKY/WY+Orn4nCuSAEIdPgukSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764058394; c=relaxed/simple;
	bh=BILF+312DoEZHFMhq6PgEju1QSw/kEbtGLsTHq2fRBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5lryTklgpGv8ucj4SCQ3ZK00gySelJNDKVov66wnIBI1/IoR2bHxY1JTM5Hjv6BOqeGKUrqyKUSdIJtbjbmEKJxu/YysvCL/Cp+IbujjY3Zb9NbKp1bsg2ObStRvtC+6W1M3nJ/73z1yPFlbBN/EoIvRKHCSwT25S1TQEOejf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=J9BC2/Xw; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1764058390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x/phkmFd59KwNNkfXZCi1lXkxaFCmrSLml1VouoFitM=;
	b=J9BC2/XwQeKbNGuXs2KfiCMbDgIEtQARi7eAKXg6Vkh8RtujI8gBplh4Zu8sPqMltEdzq+
	f1lTqfqi1I2MMlPmVPjC3EEZU0rVLIFOGDDDd3KV7gTrzNeiAIWXJaTnpwwinWnXDd0vVs
	rTsmyC/NmdD5pNNgEREpCXrbtj1XHWyZrM1Ik8PN+405CwkFEKbytIWo7+waSJn0u4LbKB
	ywapomUd4s1XjyGvhEsIrmZzCRh/GOyjxPQturkRgIWOoY42jxUAO5kq7NtuYzEAlImSoV
	50QV8vNk0dzRd7v2QU3zs7NCPulH7R5sWTGHokpGpFwZZC9yhszaRd92eqm8zQ==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 25 Nov 2025 00:12:34 -0800
Subject: [PATCH v4 04/12] arm64: dts: qcom: sdm845-lg-common: Add LEDs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-judyln-dts-v4-4-a5a60500b267@postmarketos.org>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
In-Reply-To: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>, Pavel Machek <pavel@ucw.cz>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764058372; l=1348;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=HZWHYdFywZMsrGHyKVHvXqKgErjfbfkcMg1UF3hCQCA=;
 b=hzf2RZzKOzrR5uVGfpM0a9XJZnsT2Vl0FS1A/L6Zs1wA7BZkbYHqL4aFG5VIv5a0o2ZkO1gP5
 s7GiVP+X59IDQQ4f11uG0WDiu41En3nOytTp6pKuLTFkhIASCrYbgjZ
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Amir Dahan <system64fumo@protonmail.com>

Add the multicolor status LED in the phone's notch.

Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
Reviewed-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index cbd57eee6ffc..165523db4d49 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -489,6 +490,33 @@ &pm8998_resin {
 	status = "okay";
 };
 
+&pmi8998_lpg {
+	status = "okay";
+
+	multi-led {
+		color = <LED_COLOR_ID_RGB>;
+		function = LED_FUNCTION_STATUS;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@3 {
+			reg = <3>;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+
+		led@4 {
+			reg = <4>;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@5 {
+			reg = <5>;
+			color = <LED_COLOR_ID_RED>;
+		};
+	};
+};
+
 &sdhc_2 {
 	cd-gpios = <&tlmm 126 GPIO_ACTIVE_LOW>;
 

-- 
2.52.0


