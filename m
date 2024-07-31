Return-Path: <linux-arm-msm+bounces-27481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C3C942674
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:20:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E76B286772
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0640516D4E5;
	Wed, 31 Jul 2024 06:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="nbTrCAb4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FC616D4D4;
	Wed, 31 Jul 2024 06:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406775; cv=none; b=DzLI1QMLl8IBHt/iYbB3APRHb3i123Wfp2yiYRn5rOhSrla/i0XgKEWpbPSK5G5GXkyk66A2UAhzilsvtpXV68JWey3Z30aOLpQunU102vTv+0UhO7QRMyP6F/blYPsUl+CRcRdfVMzeYSUIlwSMaS9us9u/9dONwyHmgE/7t8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406775; c=relaxed/simple;
	bh=7YtyQR8yC0fz5Hjym/zGWiNBusQ2Pk+Ol8WX+VobTUY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdlVDx7TNy9G9tbbm62xnK/yxJk6cnlIfi2vnUrh9DG3E1yNIZhJTxPEHvX6K8YkskCKKkWvoiZ2MhmsbS0O4WkLkPr4PrXjCyB8et+Qy2J0kG77awo5ONUZeEX2EuhBEXjcodPhBO8d783dhKW2GkhMrpq4vy1g0KFjguNR/5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=nbTrCAb4; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WYhl91x3Lz9wV5;
	Wed, 31 Jul 2024 06:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406773; bh=7YtyQR8yC0fz5Hjym/zGWiNBusQ2Pk+Ol8WX+VobTUY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nbTrCAb4g081NoT2IEJACh8sHBaqL6W7IfkAIWmVxbn44Eex5kX8vgG1lyObd7u9w
	 RkHI+klaYgCc9DoNliDBiRf5vkqLS1Cm2Pllh4o9X0TOUoNBapqDaIvQH49R4e2Nal
	 4Wr2X2TdjXH+CI3L2/mejrLBhgBwd1fffmFxr8lg=
X-Riseup-User-ID: 11683E3B3487C097651A2BC1E80AD1284A39917B1701FD8B09C82E32EDF975C5
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhl63kB1zJmtl;
	Wed, 31 Jul 2024 06:19:30 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:45 +0700
Subject: [PATCH v3 04/11] arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-4-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The Pro1X has a caps lock LED on the keyboard.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 813cd22907c8..b45ae3402741 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -8,6 +8,7 @@
 #include "sm6115.dtsi"
 #include "pm6125.dtsi"
 #include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "F(x)tec Pro1X (QX1050)";
@@ -64,6 +65,19 @@ key-volume-up {
 		};
 	};
 
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		capslock-led {
+			label = "green:capslock";
+			function = LED_FUNCTION_CAPSLOCK;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pca9534 1 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "kbd-capslock";
+			default-state = "off";
+		};
+	};
+
 	ts_vdd_supply: ts-vdd-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "ts_vdd_supply";

-- 
2.46.0


