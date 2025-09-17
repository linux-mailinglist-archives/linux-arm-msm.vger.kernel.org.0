Return-Path: <linux-arm-msm+bounces-73831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB95DB7F410
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 15:28:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14C73AF3C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 01:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E34221FD4;
	Wed, 17 Sep 2025 01:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="V/EUBVEs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573F8221F1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 01:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758071447; cv=none; b=OwqGEa9YK/zJrbW0pdVlOIJ6Pi+mgN0xR/7tN7Th8g0e3nnYCI9A3kAFApCXWQ1cXVjZNuaeT0pgfWo5cppTsN/AiwRtJ7+86oTvyQUlMhXotypWEmYWXKHkfox0wh/uCKdl91cgXnffUkrlWWdaufT5qOdeWKrCuGmsaEIUzFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758071447; c=relaxed/simple;
	bh=xZrvlCbh6KRTeGh7bMXMcKiazIl49qX+yWDASsQLlxw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5aLKLssmH/402mKunymti8NtPGUrEhck2rA4qnZNq9IN70M8ntBPv1hEk7rYPT6VpMXNS0akucjI60VF/sgGwZRfxcIyCWeG3Kj/CN4TO60Z6xxtIMWBaj2mFw92I7cDMCLIiTIUcapmYH1XixtjPidCweC02yBbA0xrPvlrLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=V/EUBVEs; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1758071443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qdtVBhLjrCAT0UtTMMYkYZgI4fbXbm3xNfHPjzi99/4=;
	b=V/EUBVEs9b9esJvRv/ebDVvKukQ1b0hy0xrVe0JUt53ULdFRglZD8QauMH851zGUqReRs9
	eRNPbIlnFl/ogHLFbZTP1sGLB0+X9ciMjBiFvQW6+hFPgOYdNyR9q4xWFSRFlE6TN/lPOx
	R5NFVmaE/Yh7sWw1dgcozyC8JFdEFpN7VAOJUU4EAWlmee25rKMHAFyF6Xv5RZ+tqCVw0J
	Crq3lAW4+SRHin+5B0yifmdq23INXcGqkUZhz53qqTD5elb4a5FxajXHQme71CWCcC7I2K
	gre+58Y4HbvVgf3b4cKKeawCVX/NH4AmuJfD00SIBwiJ9SpXvVP2v74XjPJ3Og==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Tue, 16 Sep 2025 18:09:50 -0700
Subject: [PATCH v2 04/13] arm64: dts: qcom: sdm845-lg-common: Add leds
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250916-judyln-dts-v2-4-5e16e60263af@postmarketos.org>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
In-Reply-To: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758071415; l=1305;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=w23PMqpum8pcUJy81Rq3Il/ng8AVSkuyum+QLCF/jC8=;
 b=7qSoO8jUJuJ2BB0N4lwHtjXQyLif7MyytKHQ0zFO2+COp7+VYrUXXAyqY0dGzrfOTdMGLJ16a
 pnmjfpkMl6iB9y1T51a++MM1Uc+S2vVlRatumxhKJ2FdEKzcnvEABTz
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Amir Dahan <system64fumo@protonmail.com>

Add the multicolor status led in the phone's notch

Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 911f5e614d0a4a85da61570ce400a85efa08623b..db28a2494a0cc4b9e9d997d11f1acfb116e586e3 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -504,6 +505,33 @@ &pm8998_resin {
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
2.51.0


