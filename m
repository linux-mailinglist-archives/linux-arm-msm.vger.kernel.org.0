Return-Path: <linux-arm-msm+bounces-22940-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9845890BCE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 23:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F7421F22FD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 21:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5F01991D5;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TMeDv847"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F2A18F2E1;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718659398; cv=none; b=Q8Rqm0jPau4zyu9lvQb0gkspcVWHM3/kECWg5UdgxTuA8q87rvYK6HL4il/ciKymBYGetIn0Te0qeIeKDD60jspB765TcRuubgFmFktRmdywvMhTBNVFHOVHjj3l0yRc/alrX5SAniyNQOUmrcsh+Tn6K0obRG2cXMqU/Ol4fBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718659398; c=relaxed/simple;
	bh=J+DZjuWpLIH16UoIYz36wskMfoII3XzTqDLgxLg1M2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRlehKFYaY36wXVXrHNLcqWKnbptwd8cvoXE1X+Y3dc/xfmOyWxRgvdb1kE2ey28pXzTe6qfN8cJt8QxrMVisvlsyZDveq1ti3XBhla2qFabez7T9D2SrRDJZLYUmerzF4NSrM4G8eoMT71E2yRZm+Jmpn2o4wnQTFLaMpe3Gt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TMeDv847; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 399F3C4AF1A;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718659398;
	bh=J+DZjuWpLIH16UoIYz36wskMfoII3XzTqDLgxLg1M2E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TMeDv847xJm6MBqVLE/ESfBQq4Gx4jSlnbSRyzTVYmZJX2DHbp8pAAwCUPn/UBH/B
	 AOhUEOMm9+ORmRd/YzyC07N7QrzYfi5P4+dhWnUlt38VFFltGVrmOArJ3pi1u0nVrX
	 RArjER1BUJilEJVpb5EvBU3ouGHfXcQXW4D5jeDSRjMSQ4WJ31Uu32R1XHxFfpplQD
	 EoXxblL8jWkK3Z575XuopL++WlHwLkgACFZXyXYDLsOuUboJACF0Z+1YbXyP2SNMx3
	 BpTgpwBS/HmUvcKgwyUDNTf/y19P8Ih8vfh49yRaw+eDJZ7DXH1Xaw1sTg2Xl4TkcZ
	 3kOL1TfPtCw3Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A490C2BB85;
	Mon, 17 Jun 2024 21:23:18 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Date: Mon, 17 Jun 2024 23:22:29 +0200
Subject: [PATCH v2 3/3] ARM: dts: qcom: msm8926-motorola-peregrine: Add
 framebuffer supplies
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-peregrine-v2-3-c8835d2da7af@apitzsch.eu>
References: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
In-Reply-To: <20240617-peregrine-v2-0-c8835d2da7af@apitzsch.eu>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718659400; l=1664;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=AVdHAcobzRIw/Gjph8HbL/rVZTR3nwbn7PLGoz3cDhU=;
 b=9k+Mh7PCXSDNtEdLjjom8Dts6wyGgQpYZ7F8MIt3DlGAej3ybDYviyz2Y6i5tyzG+6A9M1ele
 LNNiBv6ieMzBYFFlr3FKXE3IBbdXyJSzs0pGFN9qhaVXtzr1BYT79bD
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

From: André Apitzsch <git@apitzsch.eu>

Add regulators used by the framebuffer of Motorola Moto G 4G (2013).

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
index cff9415baa46..376a33125941 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dts
@@ -29,6 +29,10 @@ framebuffer0: framebuffer@3200000 {
 			height = <1280>;
 			stride = <(720 * 3)>;
 			format = "r8g8b8";
+			vsp-supply = <&reg_lcd_pos>;
+			vsn-supply = <&reg_lcd_neg>;
+			vdd-supply = <&pm8226_l28>;
+			vddio-supply = <&vddio_disp_vreg>;
 		};
 	};
 
@@ -51,6 +55,18 @@ key-volume-up {
 		};
 	};
 
+	vddio_disp_vreg: regulator-vddio-disp {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_disp";
+		gpio = <&tlmm 34 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <300>;
+		enable-active-high;
+		regulator-boot-on;
+		vin-supply = <&pm8226_l8>;
+		pinctrl-0 = <&disp_vddio_default>;
+		pinctrl-names = "default";
+	};
+
 	reserved-memory {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -342,6 +358,14 @@ accel_int_default: accel-int-default-state {
 		output-disable;
 	};
 
+	disp_vddio_default: disp-vddio-default-state {
+		pins = "gpio34";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
 	mag_int_default: mag-int-default-state {
 		pins = "gpio38";
 		function = "gpio";

-- 
2.45.2



