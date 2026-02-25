Return-Path: <linux-arm-msm+bounces-94162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIjoH+wSn2nWYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:19:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 277791996F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:19:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B821F30C0230
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB7263D6493;
	Wed, 25 Feb 2026 15:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BeaSEnys"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0DB3ED130
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032319; cv=none; b=QiRpo5f+SXmPXle+VendWLaxvMvFthUkhbZmJWtmpiW0yyhKzrDka9wMqMibuZmPP7JEpIOHJrKIhQbE0fvUn0BWSc8CPYVQS57ZZYdsc5YalrQxL4J8JRwzLLvc8MfxAWWjdtp0Ai3rhTDkT9ZdrrJCtttaKgiLgmgOpzwTrbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032319; c=relaxed/simple;
	bh=ebkke2YANs9n6nYyCO22AE5aFFfEjzmYBdxWd0Lesig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8ASaUqLpClEhmQBRLmMfya42Lg6EKvEjqxiVLYM1eF0hn0tfh5JAkzSW6pZmlL+tB+MvcdGF/LPNO40OEXHOIyMhN1ybc6n+4pxf/dLDnJwqfG7zAzutyZYxP1I9+S6cmgl/b0AGC6how5dTIhHn6r66LxNCJW8Q2LGMCdJ+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BeaSEnys; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso53484195e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032316; x=1772637116; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tos4+IgDSo6CwfLzCIfZMyKUALZ1R6xgwrZqzbsYVc=;
        b=BeaSEnysUQJJmPwOPyMxDwDj6Nvu47ngZf1f1KyeaSu1Ll1VPKQtbUJs9EVgH9x0cm
         hGwcDfdf1q8Y493gqvylCaUpywVdXMSbxPLI7Yu6EdAQjNVbmJimN4gXUb1mAFN5EBM6
         MjoPCGXkGd+vNEI/FnBSg7ueUdU6plzthAExgbSqRM4D7pH5O7oGZAjLwNr49y/5wVPz
         V+6ZpBxYhtV7NFT3ToMkztdb9p5nfr2nbgveWnkZa6/lzn5DTKxk1z2ML/p6uB7bFj6H
         +4HqMszswXAXtbS7YW5w0Mhw4wnctExv3zy2cMF5jtSZrKJoqy79oVcdVrDjuawElhmq
         IsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032316; x=1772637116;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tos4+IgDSo6CwfLzCIfZMyKUALZ1R6xgwrZqzbsYVc=;
        b=I9w3MR/MWrFx8iB0Zc88BxwzYyQIEJ3a+U8MGHhCpEpVNnlONAgtSEoRYn1ZCB6qkx
         77RdaNa5WbTcWHt7heGpGIOyAYyWLcp/+zc1CStS29n81HZ4QiddvUTzrUa+n9vvHEVq
         LC6t5aXt/YwkXC00Q8xJ51p2Srzj/W/OddjKXWac+c5LW4HGOoPDIcDkV2stXBDDAHqJ
         YGQYsZjqd0f7UoqPwA7XJUGqBTpt94nndcQf9yPgn8oVJ3+kYgGj9OAlzh3mUx/OYCvj
         tmgGigOOG2aoHefiYeqn0PMlRq+2L8Sfs7N6qLGCriVZXBfMkGwWpefau8XTFLxk2xr2
         vkWg==
X-Gm-Message-State: AOJu0YwJUN9+2ipuxhNfAEQ2Tkxt3Oe0oB+oteKMoWAchLwx1T1pQxTB
	LCwgp4ZswoUL5xSj0T41KtqHy3uvkvw3jCshOPmbwMmliw/9sCiTf13DHuDqvNAt0Eg=
X-Gm-Gg: ATEYQzwc4SIZj/9MEqyhl4qJp5Np6oJcrSzN8rq0YCHfMZjgERWzOBkyJSCGEZE3jlW
	2ozTsCkffw5HJumYuCijVtaRWtfeh6j6agwzvwpArqBPupHmn5RVakMy11NhEcsPwLUusXPwLCE
	4RG8Z+EpcifX6Vh/LmLxYx4YnyxsYcAwZO+/Dq4NzLQwLtolgZzRzaB7YJNyQbz2tQCl3epDi5q
	lKHshr0i1Yn5P3Q+nC4/fxoYz8w8iIRs/If2fE+5WzctECeXslwXfOlPVySiu/MKqGqcof+7s6t
	SUitrVwiJ/9VXCANnAlQyrhmJqqBN0DqeGG5MsdtJ8N50iUj8ETJj/9pMEkXZTNAtUhe6Sm71h+
	VCa4XbDiKEPLOR0/AYW71s0qL0FqEzoyz/8txPR0hkrqCAWi8J1sJzwYdgSRVd0dcdt0sIIG+Ee
	PtaNO5cFGhasGT7p2n6+C0MtfuIJhERX7zlQs0iyryg5Ht35RkyJ5WgRh41Z1C/G+x
X-Received: by 2002:a05:600c:5486:b0:483:709e:f239 with SMTP id 5b1f17b1804b1-483a95dea69mr255370725e9.22.1772032316285;
        Wed, 25 Feb 2026 07:11:56 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:55 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:35 +0000
Subject: [PATCH v8 18/18] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-18-95517393bcb2@linaro.org>
References: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2061;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=ebkke2YANs9n6nYyCO22AE5aFFfEjzmYBdxWd0Lesig=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEcTGwAibtB0wENsoOC1s/k6bz4RyirTAXoc
 7ZjukTPtpCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RHAAKCRAicTuzoY3I
 OitLD/99TbZpAmDM1v6XAbKZ/oSRLA+tzBou8rGcdJ5nf1guXh1CLNuuhnm6GqG7Pbyk8X3WfFW
 VE+3wWLJoFwv8kXwlkwwwCYtdMYID7E/IItqUBVlNyO9v4POOYomAgvjBfozD1ee25uZTMDvPQ5
 JCXh3ubpjOPoFOZ9VlFx/0i8ADEbFbthhl3lsFO4YNaj8dOmACrVm7nbtx6l1tAKm15W2KAc4jJ
 eaYLi68Ln3i1n0HKMsfO9tWtRlBvQw0K1hpyOq4vlUPGp+qJ2mfs7xldjCCIVXQJnSKhuE44yuA
 CXCKOt19GiwEtpFb+ZpAWmVrEsKOonWyEXYKvf+5H8bVcbo7joTfbcWsYm8PCGJHnG4VXqqjZdX
 XyOEXj4ys3FtU0JknkO55+9gxne80Eh5wUHcZJWl3DyOi1c3Tw9Y818tH6jqR0Ai9I7ZLNWVD9l
 95L8CTR6rg+NemKwEDFCRpelZWzCSjq3/Jm6b2F1Y2zQgwge3cJhwJdaFhIU9ieuy+Y7NqvP4Gr
 fD+O0qt54vAD0ZsrC6X5p8JZ2JxAcmvi2hiOtxN+3IWfbkHYrTTP8W2s44eap+9jKsMwInTUm0P
 dwqjIezR2ZTAeNOpYPyZ4op83A5xinGC08v3HfHM//5ak0BONBW86Xae0EV+pkI5UKV4CSv8NiD
 iX4GYktCULafB8A==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-94162-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.3:email,0.0.0.0:email]
X-Rspamd-Queue-Id: 277791996F0
X-Rspamd-Action: no action

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


