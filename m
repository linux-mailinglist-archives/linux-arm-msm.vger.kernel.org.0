Return-Path: <linux-arm-msm+bounces-94321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCK6HtxfoGmMiwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:59:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1C1A822D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:59:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72CCB31CB850
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:53:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 149523EDACC;
	Thu, 26 Feb 2026 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vbWK8LRv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981F3ED119
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117484; cv=none; b=HXmmk7ikYLqU8BUNDA2mRrWufMcRpzI0xXApKHoraReyXUL+WEX5ToTBCIwxDXDdDK+SLl17Ox6xtdgsi6x0A0YhO+hVMZh8kj7rKi68h9gunKm0ljggVh/uq9ZfOrrtBcFvYDAzyZghleRc2nHCsvbO+bytutRqDR63P/YOGV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117484; c=relaxed/simple;
	bh=3nVSYJBG/RHwLpzJ3jy8WUI63ecwZdGLAVBwNBEWi1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gPiS8BPsCV3bQXXlAldBzskPKhlmgSDAFTAQeRfRIcS0Z0o05DMiRB0RydHSM8coG3iNxGlyI8N2wJ6/GKj8iaFTjgplzfdWc+uxLeUpNT298dFfDpTX9Ru1yT1samvEaJTAwc52U0PlWO8dqwU9es3beaY2nmVxsam0meUf9Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vbWK8LRv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-480706554beso12425025e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117477; x=1772722277; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dQHvQSUZFEo8KyeR/vWOplBdKKbajrVoCBMz2zzdolM=;
        b=vbWK8LRvHKxrNDCujiVoZGC9cQ0v7Jox5hPRVyNwCxqx0ryTFoH2igbCPulpFREAXw
         9eOOkSI77nCgeGsABuhuhsLExG0D9TQd4voJRPoMw1YHybKg3U/nxlzsY70CTem5u+W9
         Wd5jpe1s8/ynjikx2jFWRUZKkFuoSe8wBb2ANlbvDMV84MfVcuzr2SVOpmDguiIjUKS6
         BC6FWlKwses8ZbTrnJYoLlJpVbyyr7xxQcp/T5uHBv0DfqtFQEGnuA8AbFKD4AkR5Fql
         xZyl+r/WoqjWMqZ9ojMndoxw7pqexSr68dOggDeigxsEe5mhXvJytCxVG1AJ4YemryPs
         YKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117477; x=1772722277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dQHvQSUZFEo8KyeR/vWOplBdKKbajrVoCBMz2zzdolM=;
        b=kkSEAh2d4sNLhLxp4SAgS1k+4FdxR6SLl312phb7yE5iYe2aKH+AwxU/T3efvHOfcl
         H8Mh1TGHGXdNeJ4YLNpf0TPdmQW/MZkwr5uJmX43jpLsLmL/TKbgyu86whM4chTNDPjM
         6vnCNa82Wf7imuEkgkRY0h42h02E6WtRVzAwt3FLJdfe3MzEq2jJg1IUCEIuDveMYKRG
         fgedjoMI5m9i6f9oTI+VywDZYYClZomRDw8aJ4UQmpVLpI5CU/Yj+bM636EwDT1Dqne5
         OOkbLSWGSE0YtyARHr+kI0mA6jH0FKPl5ZMT91VcSYT73gIZhn+Aw6DYN+/1dLZouGYK
         c6Qg==
X-Gm-Message-State: AOJu0Yyn8wgbhQzuJPLc23sg0SAM+sp4frzmspHvHgKUOXXbM5PjWkgD
	apLzIJmCTshJKE8QOs68deevNVHfRoVNvretqwij22R5ahkPu+aHxpFi9z4F48PytyA=
X-Gm-Gg: ATEYQzx+0VTfYBoolQXlleemISnF63XJ3WiTVN6Sl4m4NHEn7ckAHgo7cchI07vi3ZM
	X37IgPfAoE4w3reKeHLSfskzzmhzby0hckJS9p+a5A6FIEIKJQx0tDjlKoOLatpgYmEmXGF6nRM
	IMTZU7rf2H9JHVR3GaId0tPdUHnDSqX7JfHVzZznH4fpz8a7DTBEzbvCISvKkF2qB3N6+ArXE7r
	45tztYj/8Ybpc8ezmTaQ2QCzCy4SCTNgdcaTasaWI8B4hhIFnNyWRUyEcRWPxHN77ucu8MLm+5J
	XRfUo5xNZa2j5mb7BFTPY0llEpnYFy+JjgU2T5JwBl+pRxH+C/FRLijIUE8/yyJes78DzdB0l/J
	qLPVsaWhXGwuF7ftCNoPIxKD6uvrAvcpou1JEMqcia742jB9z8ZjUye+73BlVY45DNrbSXrDJou
	vClp0CT7Flt3dkvab3VczDO2xAATdKUQxxCCTBCNPyR7k6WXQx0yu9Z0HE69sn/NpP
X-Received: by 2002:a05:600c:8b82:b0:47e:e48b:506d with SMTP id 5b1f17b1804b1-483c219b6fcmr80106515e9.16.1772117477342;
        Thu, 26 Feb 2026 06:51:17 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:16 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:11 +0000
Subject: [PATCH 06/11] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-6-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=3nVSYJBG/RHwLpzJ3jy8WUI63ecwZdGLAVBwNBEWi1E=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3d/u9tgEcJ+mUfclA0BWk0q/YpbC3++16CS
 rIt1Qw7pUuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3QAKCRAicTuzoY3I
 OoXWD/9ZN7VtJd4CTYE4qVg7g3xkxqFvZmKnpmWwBgjP+knF0K9lA0q+UorTOX4Im+UwMR+7CVx
 5NSGxriJGNzRi4KiptptqmN2e4uxPXk6aBTfm3nARSwFRgmZ2+WTI/pYb/ojnxuKoWLNcNTRLTF
 0Yg0ALcG0egGadKQG7D6Ji7wbFPnMNmHvArOExiU7Q2G5L0QT4sDuuOiu6rAaRuWq+aSfTJP7xn
 qEQO730BSGgWQfc0yoRemxRPpYj/VrcKPW85qUh4/QzFTc27WGL6G2QYt77c4nMsuU0S/gZAZ8L
 mIb3C/ASGVxVlqgnFZy0dTVcidKieRrr1Uij4mnobni1H3cuqVDPUufG92yJLynm1FRqGqHn2vK
 UZDUPnN2bS8qspsdfJH49BhItUYyREpfN5STXwCZTjlVOZkqyjnItm3o+62UBsjSEO7Tcda9w5g
 gQPoUr1jHXZlL3qspT7Pgd/FUoQH2Euh3ggYPuEcAzIMaztBzDF/6BRht7JOw4IJEAWcPg+MOwF
 XhYuZhq180esDLWYrzuQZDDYLNxoN3a9MQpfDjTXnzym1bjj0BppBlU57X2EiUuiWrYk/8qW7zk
 jjNubdcLlkQOTQfXR+aYtn3YXdkIw/iAlS8iq9C5qjRLNKprSLuJVW5N3uO/0Htc8TspEzaotPk
 jHKiG7WPyjNVNsg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94321-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.36:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1BC1C1A822D
X-Rspamd-Action: no action

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index c89f5ad0aed56..d47404c71b80b 100644
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
+	vdda-0p8-supply = <&vreg_l2c_0p8>;
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


