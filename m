Return-Path: <linux-arm-msm+bounces-100090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDDyIPMLxWma5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:35:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DD533376C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:35:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98BA23148A3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:27:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643883DA5C4;
	Thu, 26 Mar 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZHUL2prq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4951B3CCFA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520840; cv=none; b=BGW1T6sT0s1SG6hpQTfm1RoJsYiwytIbLA/WA2OD+xTc9FUJ8FnqFyWLr+DKSVXgcFTsKXxxX4l2AhfGy2hOmJiFyECsMmS28dvoE850VDGBlwcDKhTRoC30Klj1s6ymMUnDf5ZRXyWwZIe9Z3HrftLGfE1/+HlnjgabnlYORF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520840; c=relaxed/simple;
	bh=zThgr41Rx9Gjz99hFv4NSI9Mkt9M2V7QYNCYF2DLaDQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMoYKp8r9VyzJT+X+J3VxOASPB49vqQMHMaeM575k6LTnlK1awa1lBEHCkpFH1bdA8K/C+3O9OO79FT0JMAlLufafH/fvNU5g3vzUFV7GgQm3R29p//c6sMaaELxJ6Vk3koxzxI8ivHU5nhpIlFvCuAfyUNbpWf817TTDvgzDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZHUL2prq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so528008f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520837; x=1775125637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hI5861g9V+AK8xL5a9qGA+PKhyksWvAaYlqS2+1AuFQ=;
        b=ZHUL2prq29DIJvykjoy3/F79A+wBWUwEz2aPF7XjStOvdjbsF8c0ymWy5/UAaCZZpR
         6HIuS30PLLYC3bKwn0+/7N1e4EHwWn5MWZFtsagWIs9NQv7O/oFeHiPAXxVrgwYwNKkk
         yqt1BDtXot7gAqK3IssxQaU4ZjnRI6Ru6JuditcUGNrKfA6sWMBTWnKMb/aqli96QWJL
         VyY1f7q/YYDTKaF2YbGix2Up+X5K7PuDZpUFwX57ean3ptuP2DdFgaNPFOaWEIimvwkO
         Mbv7DbA0/Gk8WdgSAcL/Il2BRP/N35yl3PUv1K3aXnacHDs2KYyDj+wtzaJp5rMxiZhx
         jPPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520837; x=1775125637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hI5861g9V+AK8xL5a9qGA+PKhyksWvAaYlqS2+1AuFQ=;
        b=bV6SSGZScSCNfBZ9NbUrA6vEihk0iw6D36pjzp03aGcHvw5CWgK5qSkDDZq3CuloWB
         SpErGiqIEfCNM8sxwuaGR8plJlD94hOuFEVhho7wLD7Z1Kf3oiwWnSp7xClyTKOv7e+o
         da3Ax0CbooyWqi+IP0odKzw6eJiu+v8V+b2dQH8KnIzHiya6YYR4VBjGDmfm7B2ZpJKo
         vCzLEKxLLrLnyejqE5DmYZGRbDSMuWBFinU7en/eD7eg6vEGv3KMd/wjZhW0eJ5aHdZi
         MqZbku5useWxMUxpPkZULw5x6VafZSirUXBNocGhqg2SbUY3S+FcuO47qnI0ga5yNsSt
         KBRg==
X-Gm-Message-State: AOJu0YxRiUV/ZE3GNcgzGBk8bV0oc2wKDGMQsmL5C1dn7ZrxYh0PQ6jo
	2mQCzHFFxrXsArHxK91ZhgWJ6UAkR1fgqYDSBmN39f0EXHV1DxGQ+sieGv35KzPM2uw=
X-Gm-Gg: ATEYQzzxSheegiI+zU6s4L9K2uTJb2ePgsqy/nO0G4bYKTwaLjkW9kWKb20mAP7XHrW
	HGAE+b67aUB1bYWFfIB4bvxhXBgYvlJtqv8xsonG6DztfKKW7lgjYXm9p5OIf8rGjglhWg3lbx4
	HyjQKRqAmzYNBENt3lJwfhZHdL0MWAV/tB1+igLmeWo1v+DOXCoRkEPad/XjKSELp04sGTqH+E7
	iqXiBOuWG8G6cK5WGGdlnq9/oJ81zbOzp4z/MrELrKyrDpkKz8M0Z6tEOMHTrrP6jEmLyW099Ly
	zMCmN9PvXflbb03lQv+yY8aeUowh3wbGDFq0Grvxk1QV1pVq3wp1BYLfIr/1QyQW0eVEV5WH0iI
	/adaMbO+5HM9do9lfRmZ3PKMBRDEHWvhDCShOG9XN9lnBv8bSaUnZjogDu0tTpXjfCy1VL1b3wM
	FCJ3h5MvfxHK0/wbNhW25OVsBzjiXLzcQO9s/OszkDzEX2
X-Received: by 2002:adf:e18c:0:b0:43b:5557:ed9d with SMTP id ffacd0b85a97d-43b97a69d13mr1598379f8f.25.1774520836588;
        Thu, 26 Mar 2026 03:27:16 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:16 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:42 +0000
Subject: [PATCH v3 05/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-5-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=zThgr41Rx9Gjz99hFv4NSI9Mkt9M2V7QYNCYF2DLaDQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQocLj7dbDuts0vH/oNqsZVRMrwq9jkjxNulg
 jcnKUqu0U2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 Ots5D/9Z9mR9rouuaTHdsLZOUyLaTsMyzi4kMYhTsB2tDbjULcMedy+ykmc4f5B9oyW7k5cD9Go
 xM8xEmTcn+8/HYACXlD+mN4iIlqEH1m51Nv0lNfRSowdwzmiCLqXEm4hGvjwvccHyXurp/rdmQT
 Upd4qFBvzx5s9V9O4P7MRr8hiIpCj9YSyfdYKBsXVcRkaDlfqYbrnGzzYJZxQbj47EM3kJeLmqo
 V4o6EbBaDweMxP0UQa5sdLo9TOmjXKo+Dfs64imHHRVBNLXuOIxOI5D3ZW6VgDtle6f//HShhtq
 VASwaZuYb7eyo3b4MsQOskyjVppi+FNsGaG0Hz9zYo4PhJJOS/c6FwX7T0/99UoVKRPlqx8PcCs
 x64Urd0VqQ7rBFzD7+z/EiMAubal483XB5ffWy1GfpecxsHDXBA4AalHOH1bQKzo74tfmgULNxz
 TbUj3RIOHCzVujSRLAMgZHaMeoidhaWRCxTy6iJTVneqHKE5BxrRKZ18/Ggw4eNv7WRMyBKncKi
 8oIe8fLfBj5eJw1EyRw+UI6Ajhzro1Lefa0wAzWEgXQtL+xbNcQpg+GITwpzUshEmWUZ8dHpFRR
 S1azqElsTZLCfFPB3esFpVbSB3zCHUgxffrnkf4wi8bgyO5cUKCaMEKgwG6vKSCHBOFkG1ITnh3
 QVnEvfMHbvbBzLg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100090-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.3:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.36:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 42DD533376C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c89f5ad0aed56..567be2796d6a1 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -901,6 +902,65 @@ &gpu {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep0: endpoint@0 {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&ov08x40_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&camss_csiphy4_inep0>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1515,6 +1575,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.52.0


