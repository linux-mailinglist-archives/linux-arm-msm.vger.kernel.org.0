Return-Path: <linux-arm-msm+bounces-75453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D463BA7F5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 07:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 774AD3B043A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Sep 2025 05:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F7902264AB;
	Mon, 29 Sep 2025 05:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="jikWNt2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979432253B0
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Sep 2025 05:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759122349; cv=none; b=iFtX8IxHt1EFkZF/AsQkxQqRsJxalL11DXh73hFzJYjjxAty+CWwVeGzg1D2b3ddqK9MuE8FTDO8xTeDlGnL54jciQme3wsEjeE9KPVNjFaw3r8WSlhNQBDk2gnOy+iuxMw9BLLaAiY9DL/ijmXqjS7hN75bQrRS//eYwHka2dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759122349; c=relaxed/simple;
	bh=NsbvBfFHuY2uQ1VcvUflISjvUjpdGLIxOidlpBu5O3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llNljWbuN3B+LQMmDEdn3R03iDbVEQUcdDsFVISbnxUeramxkfLYUgVMK5qWLmT194Wml84M7N0nJ9mbzO1CSg2lXuEHvEd0556FdDZfMnzGfSJGwJpliwfjOnrctowLl+KtMMCjHzrRwgRL2F+h/VckzcCn4pgOEr71XsJojSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=jikWNt2j; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1759122345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bZxq5G3nNqXbQaVSDTDX36CPVaWyqxP3g16ODSCsmdQ=;
	b=jikWNt2jkMxfe8Emc+bE+42DAQxKfnCOKhwkn2WnoXkail44eL/+5Iyf2GxIBK5h4BTVk5
	Yr7owT0rHGEZ4Fc4uVdADqWp2K07d/at46h/yWcmlEsgBrl8OoaOvUSn4v/5OldfggEdMc
	dZl0gZGxg1XnxksUe0s3TtaXuBe87/Iv9c29kjDQhy0Tmr0dgapgwZyeuFEEFdhqJT/gjg
	Nw9S2HB7Mia2WvB+YJA0DoRcYiqECoxrVgqoZBcVp3P6Bh9VFrpXnO/h2DF6WMKHRfzW/h
	8YozZ13gt0D+IeiWVwbjPWq32sEFjH0/MxwAOfovzVoNGsq4hbHK79g6Jz0dkg==
From: Paul Sajna <sajattack@postmarketos.org>
Date: Sun, 28 Sep 2025 22:05:27 -0700
Subject: [PATCH v3 04/11] arm64: dts: qcom: sdm845-lg-common: Add leds
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250928-judyln-dts-v3-4-b14cf9e9a928@postmarketos.org>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
In-Reply-To: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 Amir Dahan <system64fumo@protonmail.com>, 
 Christopher Brown <crispybrown@gmail.com>, 
 Paul Sajna <sajattack@postmarketos.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759122330; l=1361;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=R/ovOfMdUcC9ioPSWG62aeN+LFk8swX9QU0v6KKurME=;
 b=53+8lrb3ixpZbug7I9qMdC9roO9AZiTFfwUTnEjiQmC2YrkcTcl1Y/cmFiwYNLdMe0x6HtqVv
 TMgfga0Dh3pBfEJemiP5k80uUSxZrND9y/0wMnub/SGksPP1xkE3TAc
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=
X-Migadu-Flow: FLOW_OUT

From: Amir Dahan <system64fumo@protonmail.com>

Add the multicolor status led in the phone's notch

Signed-off-by: Amir Dahan <system64fumo@protonmail.com>
Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
 arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
index 4c631df56f262ba9e730f6720abd94d374b14692..2a612922ecf7ce3f8a0734cb1a31a8a81efdb4f2 100644
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


