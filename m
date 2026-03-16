Return-Path: <linux-arm-msm+bounces-97770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 29JMFSJat2kTQQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:17:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B802935C1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 02:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50F61306309F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 01:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BA11C6FF5;
	Mon, 16 Mar 2026 01:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K1kJRu7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA4E231A41
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 01:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773623588; cv=none; b=psXBc1Co9u9sLh8/PFmBfFrEXRSerGYwFX5KXSX2j/nr4Fqow5wlwk6f+k9mWt0kZQMse/nHqVRLOiTqAwLiDtupzP5B+5Oa3JjdmMgnH7AtJj7lLQSe1EPpbTmS1VbnL4GUczV3fQLGj/z1sKnQgrAYcKU4Unfa9RSSmL3bJ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773623588; c=relaxed/simple;
	bh=ebkke2YANs9n6nYyCO22AE5aFFfEjzmYBdxWd0Lesig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kj69fXN4xz8eb2YmiTPMNCDlZ4XVzhO5WcwiNFhPOwPaXnkepwtR/RxxnTuD6gXIpBeAT2R63ExeicK95ddRzXP9ed3+l38KCG+IbEUMZ1WUkhS2BmplCGWXfu8Wzy8KmU2zVovCpd8k52Bw2W871Z3TGBAeVO9BGszn799wNhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K1kJRu7u; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4852ff06541so45146115e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Mar 2026 18:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773623581; x=1774228381; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tos4+IgDSo6CwfLzCIfZMyKUALZ1R6xgwrZqzbsYVc=;
        b=K1kJRu7u/mR3V4jCI+n7yPm2Mf+hF2jI9dfOwt6GujiqcGWvqnG3xXG/Ntv//8ZxuF
         Z1/fqvOvv8plkH697CMJT4DQTb+4HfWg4eXe+7q88vWcVoaUvMvVPRRuBVc5ANexwWsz
         bjVVArLShvRtILCZB6pLNKwmXXyy9Xr9ve6MvKtWpG2KdWderm2j6jbV8cIBXKejhzxZ
         nJ7pZq/7k9SvuPUm8DGf/6L7pg+Xa/EZsJq9F/Y41pQ51MZHLdRMq6yrZafiGHunfVLn
         sCQ/k9sGowH/Rwg0QTqyTjB7yfvgEr8mNLHUdpiGKUGtvkNmlMr7mW1uo2U1YZUnUjV8
         9L/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773623581; x=1774228381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tos4+IgDSo6CwfLzCIfZMyKUALZ1R6xgwrZqzbsYVc=;
        b=Y0239la1a9zdBCyAgXkD79r1UFu74jMEOD7zpOLS1z64aQSw1RL2oK+Kd8WQGdoE9w
         XwNec/snIwNlM+4OyCqJhl0oBLdlDEZmuo/FSvlWk5MQZJMkIlOxBGw2fO0S5AQUP5f9
         6oeMEm/nYUwuSUw0wgyquK55W6u+7LdEtf0jyiYuuinO6EqXvZviIY/DfndsLahX4GXU
         w6Z1UXtu7fGH24ecnonfSZr77rTTj7NFJSj+dK+r4l5ZkFb63aWu2Y4RqDC60Nxdjygh
         gI2frPOaYDz1rLycx7L+NnpvNFtfl6Rdt7uMsyFLsceqnJqsVelL3t9/s17osCjLw74r
         StEQ==
X-Gm-Message-State: AOJu0Yw3xfm+1WUVoA+Nvc3Ry6bs4pjMDbGmJp2OyNLnaboh2kDzzEQA
	/k/FvxoRCmQZPQlvdIkuotMoDcecvxQxR1eEpZj3lRcj2eGEExNUO2uGc/mxUCaIe+U=
X-Gm-Gg: ATEYQzyDlA4oei7fz4EclfDJ+KyRcyJA0CwMBH6EwnJUQ3HD2QBc/Os0wmUWVgh8nTz
	AtnNs97t2rJJtxD6IWvTYX0PpXM3jZqCQBTWsVh32FO7WTXjSKjAZxiwTkhElTq7M3WSSfYz1i/
	dmfdum4zDALQD5GdE7GnCnLwAtg/tGqx0C1K5BRaS7LWtKv3TyL7uDQx6/TzBNN7PyQVxzSNaG1
	l9130yVDbdVNkcuGeCC3MHkvOreoyxhyOjlKHU0Thx/p4VGe5bO8ZzolqwM1uoDa7kaUwLf3HTs
	JrczhidzpdGYDZ2RxP1UKOaojuTS3A+bXPRweWVRNRLRT1R0+oTRU/tN22jxYPrchxQgajeyj6P
	hg6ZRJL7Uuj1MVCY5JKSJQMT1q9LqSphLM0QqiooA5Pg4ezTB/uNy5HG2wua1crMKVcYiBCxw5q
	R9qfVgaZdhbqLNfunGcKFg8LWAfS4NnQH5FsaJaa+VUWdoHQ==
X-Received: by 2002:a05:600c:6748:b0:483:71f7:2782 with SMTP id 5b1f17b1804b1-485570ce1damr166046205e9.12.1773623581367;
        Sun, 15 Mar 2026 18:13:01 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.190.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm560918225e9.5.2026.03.15.18.13.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 18:13:00 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 16 Mar 2026 01:12:53 +0000
Subject: [PATCH v2 11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-x1e-camss-csi2-phy-dtsi-v2-11-859f3fa55790@linaro.org>
References: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
In-Reply-To: <20260316-x1e-camss-csi2-phy-dtsi-v2-0-859f3fa55790@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ebkke2YANs9n6nYyCO22AE5aFFfEjzmYBdxWd0Lesig=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpt1kaY0PM4iTRTNzHigDrfNbBKkBLRq/EsWLJ7
 rA5EXXydpeJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCabdZGgAKCRAicTuzoY3I
 OkrbD/4px/ThkeHs68u1vz05Q4uI0DMbxILo96KhMQp3MrSj7lUBj1i7/YDVcHvAWkZ3Rcx4/L3
 x6LbKaEscJ/nOxHOY4+cvq2Y6oX9rVRPL2OFt74/eqFUyq56rBRNOIE2JQV9StfIODqCGbKJnsX
 ePzGDdUAFfKdonFPcUnP99cTnfG7tTi6rZSyS8Vyv8DNBgY3xn2WseHb35e4ch/uZSMUtp/OYjO
 XNG7FRDqe8ZvRTtCQ7Hrgw8DvtUXyb8Mw20s0Bfbn8JwuIg2+4Ef17erdeV4DqAPPAsiTyiu/6c
 TV9v2LEK64As+G00ZzBA/S7576EThi+0uxGOHpR/63an7T5LtOEu/C6EQN/I6f5z9hSfqMKxQnS
 lzUsVy53pHrc0qDCC5jht4t9brBYB0y2ufyDmToYEEMBv3oaTEmMtZB8wa3YXL0DMP45Z3d/bqR
 HFOwpgMm8vQuclGdya120lImf9/cLNm/jaJqGgxJLkCLRHIJPginQ/Vn9pf7WPhwEcX1L/4IDZH
 t9ZPli6MsTD9Qj0TC+b0Hruly1DDBgnDQmchuE7Badoran+ut13Gtdu8wXvJjdSOz6tM4kYI0XV
 pjBI9NCI7r/tx0WaAq91CTJNtYOuVXX7Ab7tJL1ljk/QtPwNr7DnuK4Q9MPvnIavwi+K3BosGpz
 gPo3ZvSCMt6t42g==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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
	TAGGED_FROM(0.00)[bounces-97770-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid,0.0.0.0:email,0.0.0.3:email]
X-Rspamd-Queue-Id: A6B802935C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 61 +++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index bf04a12b16bc9..d21963e52ee48 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,66 @@ vreg_l3j_0p8: ldo3 {
 	};
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
+				remote-endpoint = <&ov02e10_ep>;
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
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
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
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
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
 

-- 
2.52.0


