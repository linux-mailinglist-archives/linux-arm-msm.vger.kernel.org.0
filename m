Return-Path: <linux-arm-msm+bounces-117455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OyAkOZyeTWrt2wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:49:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92C720B33
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 02:49:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=SH6sMXHQ;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117455-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117455-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC42030D6E6D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 00:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF1136A344;
	Wed,  8 Jul 2026 00:44:44 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3816336A37D
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 00:44:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783471484; cv=none; b=skftIlQ7KgLJs2nCWBaa8Fw5Q0pkPKgrs2JDnCYQrmCwmRRFvkAEiCpxanqb6lRovAoCq/f2yXtCtDnBl7YNVAYdc97nFn6U8sCpo7Qda28odFGA8VNew4yoNJ7l+mnX7KrI/HDjZkTFEqU7ehpAQoAM7IiFfEMl7HOMYVxlHJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783471484; c=relaxed/simple;
	bh=wdTjCu2iIapoyCDwicYhqowPI7KxEg9v/HwTrOwsTfk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uF+iJnuWwhaJa0sM64+d8rpb4L/Oslrkdqszq2FBabcijftaAid/rndQRmqH2T9YY/IiU15toj1lE2pE60TnTTl/a80/ipiUfb9hpMnqT6CX6DOHndzK0fi7HAHGiNVYgixTD8WfEMW9xiYStZrQGdQRp/2BOII632feOZOmaLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SH6sMXHQ; arc=none smtp.client-ip=209.85.128.52
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493d92b7db3so847045e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 17:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783471476; x=1784076276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eL7C2TivAhFoMuIpE15O00uVHzYATKH26ir7lQJ+yLo=;
        b=SH6sMXHQ+nhpmnHSDroSJuvGvzfwWoixZ+U++hQwML84xYOgbmVx66I6k3do350Q3w
         l8LZfVHQRQtuVVdjgBeGA1G2MZ5TNli9B1VMnNmZ0Pu+2hKvao4Ms7YVH1gKbw51tA7Q
         N302F6pfYNogpexMPzsNyh3PuveF0dCoW0nPSkqm8EyXdYhb9w9pW4XrNkU25OWh/BON
         r1xqTYOFz+SITpf0sxLT9ZnAQ2PX1uTEhct0jhp1sdZBUPAyBN7LxAWdaCur8jIlO7QE
         ovIBc9hLwWGTfrgjHvlnFeaPWVgtAqDxXayelJMQFtrReuMFIuMHqYw/6u2sCI3sT/jc
         l0WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783471476; x=1784076276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eL7C2TivAhFoMuIpE15O00uVHzYATKH26ir7lQJ+yLo=;
        b=BmMCbbCOTSkTOluIslQowLtnVRTXR87SMHrpPOlqquL2Rs8pbQ5GRQkBv8SZSaU4Cw
         Tjf7nDz/5yHTlxBQjNHWqH9gFv+9jKpjwm/iWsJsXPmHSiaKSKrxJXZIsYX0bSPeGprE
         gFGUNT+Qwvmev70acorWigMVLSao2GV8g5z92WLdXl6rw/YtIAOF+ddcI0FP8Krb6+Cd
         EeW6q/br3lr32aM2GPha4pbGc4UeVxVN/wV1fIlC6vSmba4+QOjxAz+Fx+XMSQWY7sIz
         jBvmESesqoxQ86cig6nD7nWazjNw3kQ6TvrTTNz09aTYkZXkX4HSssop9HQpyEjK+rYe
         PKyQ==
X-Gm-Message-State: AOJu0YykiPzLPm1yLmDTIN7uOl27f2rJEdsQe+XR4aVHhWBv8fRfXCHs
	6ELLJSrLNg8aX3IRz30MKFxpWMX/kmLfL880yPmdlX0csO3kW4LxgghwHFOiDmnOZXI=
X-Gm-Gg: AfdE7clj3ePDgTARn4shSKdRWjlmFBdWVZrj33u18CLWdm5h6mZZAVZV8paOB/6B6W4
	8JKt8xamKMTwiMmpxu35bNCcVnZLNflQOXME1J7w6YjxDO7CN4zlhzfaQVfRpBd2GxvEkRYb8GF
	DE/ZSZeHk770sHHsUTU8Xwm5tOJzBwqBouLPQcpqgGSZ5wUoL7Y8xrIonuKdFxts+9rysmrJpnE
	wdRbXElbVbM5utOxB1wxuFV3H4fQMXrwxpHiP6h8R9/1eN89q0qRXVqwNj2fmj47RiPoMuE0Stt
	nQ8tAST+jp4UDkvFM3J5/JzbRbj8epqcFQ0gXYL+tAXT5FqrHXB03qB99vcd3s5u2jeYeWfNgVE
	7Djisjf5zoZ0FoFKAx79860EOQB4BU204U6O4S3gIRoDPzBQZKlFeJefeKRJR5NAs2dsRBZejKV
	CS1mH8Cn4o7Poe2IbvdbG7RRk=
X-Received: by 2002:a05:600c:4754:b0:492:5145:f054 with SMTP id 5b1f17b1804b1-493e68e750dmr1135895e9.26.1783471476565;
        Tue, 07 Jul 2026 17:44:36 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.92.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fc1348sm99727985e9.14.2026.07.07.17.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 17:44:35 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 08 Jul 2026 01:44:18 +0100
Subject: [PATCH v4 11/11] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-x1e-camss-csi2-phy-dtsi-v4-11-572348ad1b2a@linaro.org>
References: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
In-Reply-To: <20260708-x1e-camss-csi2-phy-dtsi-v4-0-572348ad1b2a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2402;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=wdTjCu2iIapoyCDwicYhqowPI7KxEg9v/HwTrOwsTfk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqTZ1fqA66iPWXw6Z1WlOawNeu7cCv+kEG5n99G
 xDuTpkStTKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCak2dXwAKCRAicTuzoY3I
 OgJ+D/4t8/ggM678NCIecsTKlPzS9uglAouDpGM+XNnnUrss9eR7GXV3mKvOoBTbESHaesQkVCX
 rzKGYZhy4CwK6mqCJjLtaBKoqdwyw5FHTgngt2RcK0k/jwhS5F0AB1hs14f2mfGFeAKtypJm+Be
 GuJHbBaa8XOaXZXThAGIY9KA+HCSefNKimICd8JY2ghcZp9sYgkYZ3i1DgoRw5XHsqu8gANemXj
 bDPLlzuYfcxdizonIvM08o8aqpK8D0c0KO9LoEpqXTHhC45KGuqwd2ETq5lYiOTbkCvJeNLXmh4
 AkJuwmD/nGDKwK4sQ+jprJszHg7WVd8FU61Z56WMdQxI0d09zB1cgrzYVSXuwgnMzMlsvfgDBqT
 rq/b6dSj6h+p7GOJUxLY0e9QeuJ5hp4whnG+D5kxUw0rUCAzf67lbhVutwzVC6jaL5opGSkedQw
 UGtXUm2zUkBkw6rVgwgqw8EkNwb0PE4FaW8p3l38fxB6zGkYPuft7s1h8y6g+fmdvSWO80ltm72
 7TOgpgWPvZPmtSLG3RFUfv+upabS9BiYLwCmn9l/hD+yuEcM1NlT1ZvAvtiVbbIUe2qtoF9NmM6
 ioFXm2ANiFI0jlR2LteIFHF7GbcTrBhxGlNqwvlDZDF1XcnSaxsuBcYxJ/9ok4OMtsF5q78epFv
 HdLVyTu3BE8ATGw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117455-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bryan.odonoghue@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D92C720B33

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 83 +++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c7..63417d942b13a 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,88 @@ vreg_l3j_0p8: ldo3 {
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
+			camss_csiphy4_inep: endpoint@0 {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy4_out_ep>;
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
+				remote-endpoint = <&csiphy4_in_ep>;
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
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csiphy4_in_ep: endpoint {
+				data-lanes = <0 1>;
+				clock-lanes = <7>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.54.0


