Return-Path: <linux-arm-msm+bounces-26702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 246299389BA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:12:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C51061F2169F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D6738DD9;
	Mon, 22 Jul 2024 07:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="Dbh3wEg6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8285E381C2;
	Mon, 22 Jul 2024 07:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632277; cv=none; b=J3peXxO0WPhK5BUQth36q0ZELB9blxLdod3lPIpEJtuPBCLiHHPQgqyHlhZ5Xydx3OvlK/wzOX03TKs7fEEy/N+dmmLQfd69H7ug+OJqthFjkznXICPRvVQpSmiXh0hU4USjpo3HWLHcDA10FjYrypEOm0t/5NYjMMSNGZFoyyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632277; c=relaxed/simple;
	bh=fOacE2MldaWk+v8NAutCiL/10T6wL7N4YRJ1r/eH6K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJAwcFPGNSLi5jPV6A7MUzhGRRgQ3yNsbdgHMqqhxF3D/cdRIcUaZTrwI9qsoeCYSkQ3JNoGxhO1MpPgigjDkFoSMIdZb6+XYR7iITK4bx9SS2ncEB8SG7hCWpvPrJ5A2iY/5FUXOKPrWyC8N8AXu5kvmpeJzSYQjHQRc8htqAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=Dbh3wEg6; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WSBJz6P7Xz9v89;
	Mon, 22 Jul 2024 07:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632276; bh=fOacE2MldaWk+v8NAutCiL/10T6wL7N4YRJ1r/eH6K8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dbh3wEg6NvOClAUSyZZBOBw63wnsVC6MsWAv60iikJVASt1ct+9TUoS/XHy8b1KGX
	 q38IWjpS/d0bPf33EgwTIckKnduqZ6FaB2wFkw1u2A0D+b1/3UuPROpTA66djkNsh9
	 bETviO4110cg+wqze0akty1dsO7RfSx7RgC3tIBw=
X-Riseup-User-ID: 5554F2B3F567B28ADE8C6CE4DB1B6F99BA99A8BAAB94677C95EC33963B910A2D
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBJx0T5FzJmqy;
	Mon, 22 Jul 2024 07:11:12 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:14 +0700
Subject: [PATCH 04/12] arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-4-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The Pro1X has a caps lock LED on the keyboard.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index d91d31646b29..60c046fe8e52 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -8,6 +8,7 @@
 #include "sm6115.dtsi"
 #include "pm6125.dtsi"
 #include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "F(x)tec Pro1X (QX1050)";
@@ -63,6 +64,16 @@ key-volume-up {
 		};
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		capslock-led {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_CAPSLOCK;
+			gpios = <&pca9534 1 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
 	ts_vdd_supply: ts-vdd-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "ts_vdd_supply";

-- 
2.45.2


