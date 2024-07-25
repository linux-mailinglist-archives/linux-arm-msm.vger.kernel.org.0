Return-Path: <linux-arm-msm+bounces-26996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB88093BA57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:44:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A3B71C23577
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14088125B9;
	Thu, 25 Jul 2024 01:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="AZA0iN7X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C452B9C3;
	Thu, 25 Jul 2024 01:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871815; cv=none; b=OmQfhS+cD19nbRzSSoHOMkB7ccd9gkaCy8PSnunLjEO3ITvDEYfzvhcf1n8Hqgrc4hvKIwz3g6KQ3BUA0JJxDOhKLuXPRO/wXTsVZiyScE0m/+up/7mmBKj4SLNC+4hg0dr2jA8/zZh40ZR/0FlNybdpkpi/ljf0vEvoGdL3lzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871815; c=relaxed/simple;
	bh=06xCHX6G0CAp40GbFoUH0NALBIXsManKNRduPreuF7k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EoMURUAl5tGBUWfm7TrNvmxvM/uZZJDXcoT1le7aCjUQpQdp8Eo343i7x+ldFbBYL0TKHvJlmmpXWNHH/vOGi7675hOHq04pUpI79lFYMHnMQEt03dUVc1xfRchVOaDmSOaER07HP9s0wk/FDdXUp+kZSW103et1AG3txu5Ox9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=AZA0iN7X; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WTtvF44q8zDqk2;
	Thu, 25 Jul 2024 01:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871813; bh=06xCHX6G0CAp40GbFoUH0NALBIXsManKNRduPreuF7k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AZA0iN7XeDLa1EwPSfkBP46Orz/8nM4oYhHtb4KNBYMJn8iK7/Z373NUttxr3J69A
	 nIyuWEXC/Tq8BWsIuwLSlbJjVzb6BQ9Pgfpx9Qjk8jKj/9uCeHDCfpNH/g7vB02/vT
	 54O1PwdTCYls1NhIJqwz7BwXQD0Zq+EB3lEgWmk0=
X-Riseup-User-ID: 17A9782C175B03C17C7418CA294103C77C2A962BB1886FA0C8BA59163213D08F
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtvB5XpQzJrRJ;
	Thu, 25 Jul 2024 01:43:18 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:13 +0700
Subject: [PATCH v2 04/11] arm64: dts: qcom: sm6115-pro1x: Add Caps Lock LED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-4-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
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
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 3be70beb9562..7c3a7bb8df8f 100644
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
2.45.2


