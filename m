Return-Path: <linux-arm-msm+bounces-27485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614A794267F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:21:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76C631C243A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 055DF16DC2A;
	Wed, 31 Jul 2024 06:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="X0cNyRUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB6416DC1D;
	Wed, 31 Jul 2024 06:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722406786; cv=none; b=k+H9IlwzIUAOk/wE6wumSqMdhk5dpomg7g7bm6ls8r6IB9fGm+Zc1cCL9D+F6R6PvJTPUyo0323XdCWrVn4X78I9R6JTP0pOHluR9yEzhaiRIaA5lFN3rS6FLWt1oIHEQEzoO6jeEOBRFjN5JV+GeuP/KzHVufQQYi+8NcWXESY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722406786; c=relaxed/simple;
	bh=4+E89Igb8pJU07wTpnP4b6t+jrZA950FAqCmNFzLwfU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MLq6BK+eagnUPoAToqT/opOQ8hTYp1cMwKBzJ5SOSrp277NGlr7OZ/BC3SRGeoOyfOPzxYvjDpDRZF2Pv7CqI4uB92Zisjpijoz04GUUu2weSadkbYjgZ962f8hcIlLD1QqyLEzfbFmAAonX3s/kUS09ZohAMBHzsvM989lfxgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=X0cNyRUn; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WYhlP1gSVz9thY;
	Wed, 31 Jul 2024 06:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722406785; bh=4+E89Igb8pJU07wTpnP4b6t+jrZA950FAqCmNFzLwfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X0cNyRUnRn+e5R10z+S/n4DSoD+Ymr+1o82z6g/nWEcuo1krSwiIRVIvN7nWDfcWE
	 oLk7BDP1WCYkqwNbgCQ4MElAfioc6ZxEpen9POgr+xCmgqzcbDzgmQ5KFRkybMgmEw
	 rhGVI7SLY3CdX//Ee327aNzhshtHuY4Pe1xHHOfw=
X-Riseup-User-ID: EE02B06630D4F35A30203847CBE53B034F3A790A4F5A3427A4793BBFA8E12C18
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYhlL3jcxzJt03;
	Wed, 31 Jul 2024 06:19:42 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Wed, 31 Jul 2024 13:18:49 +0700
Subject: [PATCH v3 08/11] arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240731-qx1050-feature-expansion-v3-8-b945527fa5d2@riseup.net>
References: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
In-Reply-To: <20240731-qx1050-feature-expansion-v3-0-b945527fa5d2@riseup.net>
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
index d28b870320c9..be77a8318800 100644
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
@@ -209,6 +211,46 @@ vol_up_n: vol-up-n-state {
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
@@ -455,9 +497,8 @@ &usb {
 	status = "okay";
 };
 
-&usb_dwc3 {
-	/delete-property/ usb-role-switch;
-	dr_mode = "peripheral";
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
 };
 
 &usb_hsphy {
@@ -473,6 +514,10 @@ &usb_qmpphy {
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
2.46.0


