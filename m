Return-Path: <linux-arm-msm+bounces-100091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBqgHrsKxWma5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:30:19 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC933335EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 79D2D3088005
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61003DDDC1;
	Thu, 26 Mar 2026 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fO479Dln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4273DA7C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520842; cv=none; b=LaZ3FB6iyNV7HsFiZzLblNKQVwf99S+mFEVPVKSfgFfdB9I4QxElwVV6ewQXH2ur9Bg8AfFS1VFNk09zjYmogIyALjdFOThcnfcbfrblfWT973R0qTCkYxDzV59qZPN1XMQa7lgf7pCQJSf6Um6JaOIpoq2H54I/j+jTLW6Vd0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520842; c=relaxed/simple;
	bh=1cdZ5ckho7K/P2hgujNxjQln6hrw8pKd1IgFOQYkyio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kfyu7z7nlBbp/gRiaXBsPtIcppmUabc352jrRCWfiYMyFw7sNbAz8puxEktEP066t9us5KBcVhq/FK4M4L372sqng9nenhuSvficxSUp0lFEIvle6mCXxuPZnUrfYvBydR5qhaSs6iiWMQnX7r35Qqs1MEQ8Wk7BGhPL1b5LYb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fO479Dln; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43b4915161fso712753f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520839; x=1775125639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lOHEOXpE/JbN5rqywKSUMyGsAxjLPdyOxtsFRAvj1uM=;
        b=fO479Dln+/vcerrNITN1yQZSIzKK75fjboQvMnVt6CfqnhUN3kb7XD8rwvW0cfalkS
         IwQrfUCaIiE+VnoKyuPW6rENO1OrIffPg8RuTC2ru8LRPVdt2o6klRVKVrGnOiiVTqlK
         /v9f7Ulnjms4OZWK+727YTUdiPliS6SfonPhOIuKTyYzloIx/K7N1b6RgYxOawmW/w5n
         SEbv4ToxRt35CACPE/M9ZXUIH1DTqd0YrqHDO4g9XMH5qgj0RGYDAUEWEVk7T4PCCd0J
         Q5iMu4TsSh6DwlivCb/v2m+JIJynOUbqy2nPWCIpXFVIFBabY0IoXK1ur5gmulTrWw+7
         kruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520839; x=1775125639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lOHEOXpE/JbN5rqywKSUMyGsAxjLPdyOxtsFRAvj1uM=;
        b=ClujtfZ10eo3C4aBxaVS24dqKG/BghahGhRuLbMN4m6uuljdW5xCasRnsdsvE5Cy2X
         naIbAo7cassxNrmA5tYjnI2O9cuw+B1dvjxD6F9KA9JD/Nae3Z4b9CY/CDRkb+FKT/2g
         9qNItDhPqTiFiaHKGjg5m9G6v3xGbAsE3EJb6ihJ1Lv6xxofYOMnWaM998QpIhN74q5M
         P4JifuvkYutNvSyd0e7RXwZAi/zgAeJDfyfpjI/xwKtXXTZ5LJbDmu7Wy3K+ormhqrM4
         ywBEgs/7EfNdLKvxQH/NBeYOQ4nGkI0rz+jmtZK7vdolilPgZUe0pHHcNXvVqaizpSVm
         xTKQ==
X-Gm-Message-State: AOJu0Yyp9lcLp2UzQrvigW7a796WuWNPgBnIACzK+7ON4/d7/LFbgRIm
	5jQxE/4gdcR4PP6fFSN41iqUpNRK2XcvFcmvMKZaBijx0O9WWJU36CiqlVyqRb+F91s=
X-Gm-Gg: ATEYQzxw0NtxgqwZ67btbwBf/kC7b2UrE9h9PpFGeEwIuzEduYTH5YgKMmzDqkMbEwi
	2bsr7mlHvQt2eGaxVVbLc7Kcjqi1mgd/VdxAZ9B/QbAmRvbCrjZFPky34TtqB3EHkLqTRsyFbgT
	DvEeYrd82xbmGTvj8XzBmO7x3M34LOXFSAD7cOXa2g3rP1stXBXzzZAE1EMcPUh/qDKeJktMWyD
	nSDaQAQmromILF0BAJAZEPCUECZLy/mCnkcXmw4eYb8JX7FEYCizo9YnKGb1T9g3J81FogtkSH/
	+cdxJOt5MAMtfsy07Sj13FJy8LoZvgHkjq/CzeKK2jeCeJeXc/NqYXQ9UYKahnGmagfWHkUixDz
	5Xe+KNPRiSWboIlmlP33gjePMTHdVN9htVokndd1aaqk1r2OaF8IWHpWLl9aNin8fFImuZSRrFk
	afdkcgxE6McRwqD344ijR8ccT2yo9H76jzHA==
X-Received: by 2002:a05:6000:220b:b0:43b:6a55:e26a with SMTP id ffacd0b85a97d-43b88a367c8mr10721798f8f.51.1774520838767;
        Thu, 26 Mar 2026 03:27:18 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:18 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:44 +0000
Subject: [PATCH v3 07/11] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-7-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2595;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=1cdZ5ckho7K/P2hgujNxjQln6hrw8pKd1IgFOQYkyio=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQocnga/cd23U4ct1Fknu7cyX1L1BOo7Nntdc
 CfuC9XOQPSJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 Ou45D/9uZAax/XEye7Ix/vX6jOnDCMFJAwiScCFV+81gBQZXZFYQ/JnpiuL7PkQJBJsRhwrCEqq
 TqWsS8IQktcD6d9x+491mPmrFW4JoVyw98h8rAWU+yGc81hjixYofLKaOOpKuiDjL3r6O8BS3mN
 CLjqIi/ijdFTNymNiAG4pCC6ed9dqH3CuEKU/XkmvPnQvZ9HYvQqOQ+Ggaheb2NEb3xMXZ31MWu
 Tvfrgg8jQFxr5akAeOqqrHYuKpoAWXFKOMDmIo+/XxD28a6sujZjDvqbnC3XKANi/N/tJFuj1L2
 Fd7YSwCZh4JKHjo2l3WYGbGifu0tYEco41hRYsnxPFsAXF3wnK8qweSPIfihn04NLBquRT/RJpg
 bdxthHLqeSiWryrWGKvm8O1igzc3Q8JyJ/xOZz7vATJ4LkKW1ioUofenGaK08je2YsHwZd7io+h
 TVnSdabREZoSt1hemQnZGN8xu4HR8eQWwArDbMs9tSX1BiCe1pc1esyOvVJogguwDD+s8KjiPpL
 C/BX3qlDwkgAdtUssO97pSG92G2Y+lD8xyRfvF1hRE4e+jnwBSQLFKMl4+srK1qsPRDUVzC+6PL
 CVKW26cwCxlI8r2u0Uz2Dn+MEjzQW6weFedbH0oINxQXFkNffrla/y3B1+5JVrbg+XvLFbSDf4T
 TTvtnOSceryXtVQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-100091-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.36:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.3:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 0DC933335EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index ee49785c9d005..799c29483e893 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +867,66 @@ vreg_l7m_2p8: ldo7 {
 
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
+				data-lanes = <0 1>;
+				remote-endpoint = <&ov02c10_ep>;
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
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
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
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1508,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
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
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.52.0


