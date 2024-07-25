Return-Path: <linux-arm-msm+bounces-26997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D79393BA5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 03:45:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C70301F22555
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jul 2024 01:45:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A322D7B8;
	Thu, 25 Jul 2024 01:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="RQMiV3y1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CE82B9CE;
	Thu, 25 Jul 2024 01:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721871815; cv=none; b=jrabKnh4jb2rptHtQPwLAZOfzUhRyNllVsGInP2+7JbAOPj9mHpCAY5dEzeAzJVnRAmPRiaaaj4szU0/7ehWduVgJuAvuTxJo8jo+lSzpJk9DXe9ip1IyJuI/Ln54ofPEVzrKhZCnm9qZDb7ybxHSDYez4KHI3ylrvpyRyLi7MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721871815; c=relaxed/simple;
	bh=blYdFhbMB8e9xhr5CuWD6k3VpgztU4sMQ8uHYVCPIaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eyhp9/M/D3Jz/aowgqZwZ6Sgoo3GqFJ+PocDpp8e4f3yI+LKRZkpoYvgGbPeRuYybqpD1op8dLG+no/+rx0/KBNYb/IPza/9KVEhlW+8PjuTCMXDPwODRYHmdCh9ppnOLitkeZMMTeryRDqqE66R99atPPWJABgATq8/UXgt/wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=RQMiV3y1; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WTtvT2XwPz9t9m;
	Thu, 25 Jul 2024 01:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721871813; bh=blYdFhbMB8e9xhr5CuWD6k3VpgztU4sMQ8uHYVCPIaM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RQMiV3y1RUc09vKL8jCaZFDN5DjNnQ2C0ig870K509FUe1P3SPbZLuW5u4G28fK49
	 T5cfNyPsgfNl0fCcUyocC72fegmEJqQkzSTeNGrnYmSp5ViFjfOH+1vCoGsE+TYaUm
	 V/AAHXV56IPbMyFI5YyA4mtkyS6ND7tYHo0iTUa0=
X-Riseup-User-ID: 7FB22837E71FD33E0101349E1E8A2100F9E204DF5704093C7586343082BFDF83
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WTtvQ4SgfzJrWZ;
	Thu, 25 Jul 2024 01:43:30 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Thu, 25 Jul 2024 08:42:17 +0700
Subject: [PATCH v2 08/11] arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240725-qx1050-feature-expansion-v2-8-5fac4bbd946f@riseup.net>
References: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
In-Reply-To: <20240725-qx1050-feature-expansion-v2-0-5fac4bbd946f@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The USB-C port is used for powering external devices and transfer
data from/to them.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 51 +++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 5dd70dc87328..17f40125cb29 100644
--- a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
+++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
@@ -7,8 +7,10 @@
 
 #include "sm6115.dtsi"
 #include "pm6125.dtsi"
+#include "pmi632.dtsi"
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/usb/pd.h>
 
 / {
 	model = "F(x)tec Pro1X (QX1050)";
@@ -185,6 +187,46 @@ vol_up_n: vol-up-n-state {
 	};
 };
 
+&pmi632_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				pmi632_hs_in: endpoint {
+					remote-endpoint = <&usb_dwc3_hs>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				pmi632_ss_in: endpoint {
+					remote-endpoint = <&usb_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
+&pmi632_vbus {
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <1000000>;
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -431,9 +473,8 @@ &usb {
 	status = "okay";
 };
 
-&usb_dwc3 {
-	/delete-property/ usb-role-switch;
-	dr_mode = "peripheral";
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
 };
 
 &usb_hsphy {
@@ -449,6 +490,10 @@ &usb_qmpphy {
 	status = "okay";
 };
 
+&usb_qmpphy_out {
+	remote-endpoint = <&pmi632_ss_in>;
+};
+
 &xo_board {
 	clock-frequency = <19200000>;
 };

-- 
2.45.2


