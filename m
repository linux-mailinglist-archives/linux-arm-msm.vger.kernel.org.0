Return-Path: <linux-arm-msm+bounces-26707-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8DA9389CA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 09:13:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29375B22618
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 07:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3CE64963D;
	Mon, 22 Jul 2024 07:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="nmp7bb4Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEF649625;
	Mon, 22 Jul 2024 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632293; cv=none; b=ccX6PWFsaVnptKgHpQjPb+8kcFYoWfDgZ0BywmZMdzP1NHADgO2WlmYWpMRX0NHQeKWxbQ9P9K9s6pCJ+xFO6wdjXrJWp+PAfZTbgH22X/JvgkB0iXCgOf1xGlkuyUJwZ8Biv2kE9UrWwLnlO3T1dfzKfSyqHpQubZ3lN2/Krws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632293; c=relaxed/simple;
	bh=fZzBukaA/Zp0ajPgX2Pu0mA349XDLDuRR09TQSLL7c8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vE4cP2ZrkPFVQF8yVb/hARV0Z4UFGYaS71kV5aSu0o1lE1SXycn3dhWOpQ51ZvTGelDW1kBrymtsYr/JtlGMP2Kx/Xhs+mGzvapLFuNIHZGKw1uPGYrFosNPBTQuN+oJwwTUzudj7uGOWPcbaCOCx+bFjg0ELJN0w37fjNXfIw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=nmp7bb4Z; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4WSBKH6KDmz9v89;
	Mon, 22 Jul 2024 07:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1721632292; bh=fZzBukaA/Zp0ajPgX2Pu0mA349XDLDuRR09TQSLL7c8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nmp7bb4Zi41w6588TQwm1EyK8uV/4l8o46zhcfWTe6/ykdC9hJeLqfoxgEYrvvNLj
	 vVvbJFyOQd0TIE1jE5f+JJamWF6K2W0wyAjQbCidb9HSac5yCiGqBPIlBdBxDL/l04
	 QUsvcj5bK8YXg5H2t7X56EuF9xEe/IjWDK0Qxfjc=
X-Riseup-User-ID: E9377D6A8CF7494D418DB7FE8DC8D1B73087EB71B7BF79C64A510FFAB824CCB2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WSBKD5mCszJrYb;
	Mon, 22 Jul 2024 07:11:28 +0000 (UTC)
From: Dang Huynh <danct12@riseup.net>
Date: Mon, 22 Jul 2024 14:10:19 +0700
Subject: [PATCH 09/12] arm64: dts: qcom: sm6115-pro1x: Add PMI632 Type-C
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240722-qx1050-feature-expansion-v1-9-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
In-Reply-To: <20240722-qx1050-feature-expansion-v1-0-c4d486435b96@riseup.net>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dang Huynh <danct12@riseup.net>

The USB-C port is used for powering external devices and transfer
data from/to them.

Signed-off-by: Dang Huynh <danct12@riseup.net>
---
 arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 51 +++++++++++++++++++++++--
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
index 6e9e4d9f8250..88df28fc8c7e 100644
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
@@ -181,6 +183,46 @@ vol_up_n: vol-up-n-state {
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
@@ -426,9 +468,8 @@ &usb {
 	status = "okay";
 };
 
-&usb_dwc3 {
-	/delete-property/ usb-role-switch;
-	dr_mode = "peripheral";
+&usb_dwc3_hs {
+	remote-endpoint = <&pmi632_hs_in>;
 };
 
 &usb_hsphy {
@@ -444,6 +485,10 @@ &usb_qmpphy {
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


