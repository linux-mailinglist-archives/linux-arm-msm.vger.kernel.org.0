Return-Path: <linux-arm-msm+bounces-94146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Hs4K00Rn2nNYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:12:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F6199474
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 16:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 915B13029646
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A281A3D6661;
	Wed, 25 Feb 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bQfDr90q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A65C3D6476
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 15:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772032292; cv=none; b=ARgp9/EH7Mr5qZostJmHhLOSVZhcCWiaNhsNl2b5uiLw31MTm3OVLuHeZ5wkIjz42tj+3o4GQ8lnRrDDb7ZneTcHi2yVkeHO8nwAfsiRxr2waIQgwctwWtXlxXdVnw5KDwuZA0ilhQSksI1JWAg3EM9alWsJGL5zg1dzRdLnXpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772032292; c=relaxed/simple;
	bh=DcA3V6DF2BA2QJePYEKIHuVBmYletxrgnzHZXIVjZ8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CRw7CVYucXL6mm/k41oO3pM9iBr+9JEjg/NeQUgj4xXrbNWbcGMdFVvvfoL1jTpjP2L0seP8v+L4ippYQH5D+0X5cNgS60EMGbSiqHc8lNGYNb98I0cWUlY6971e/fpnriLLbJGK6zWm9y2JHK711L0L+xQ5etWMV7msioIzLUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bQfDr90q; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-483abed83b6so33143245e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772032289; x=1772637089; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnME572YexHr/L+BUsLMttYp+WClVIBff5b7dZHNBrY=;
        b=bQfDr90q7LKxdsdCDIdhiW6AToHPGPIEfVnkN7d3wVQb0/DWrcDOslsIiyFvzEMoOO
         CdH6Lye7SZz8M+z2ekSypFmqkeCpVJ9EhvCQvEW/tkK2Z/LOL/5k20FxbHqfTzdePb/Q
         xX72S2v1P8Z8+EES2hdwVgAf2WIE6rfClHqYj9ByAcwNO5iLOZ5aUSjv9CFRT6BEO0jl
         FBZkZJbCYk29kgSEIhF7yvl3K8LVxUTa2xbKXDo7PZQA6XXF1Tjh8ssDyYAdI0u7vB9n
         pzIVi3EsgoeEoHTN3Oj/zHzTAyIwWMSo/amEAGBkC/rBCzvk9Um2EVowBAaSxKzlNmJQ
         K2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772032289; x=1772637089;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vnME572YexHr/L+BUsLMttYp+WClVIBff5b7dZHNBrY=;
        b=vB+em4EGDPnBislU0DqHlJsTjzQqOP56fguMfqqWIVQzvUFveFKUL+om2/kpNXAwlj
         MbmyHyhB82Od5GQNutGtsMkS0/24Y6YBN/ReKx29luvI1CozIzuAJL0oICEwuBpQP97P
         Hmk6kBH24T3159d9xj74bNfmVBIviogDOIfaAR41I6sXHaOizAdtnSUE2WCHMRqyNYdK
         0Tg9POVE+sxsgUTTYNRFHfAyrFhfRoBXXsnjmsnH9bJLqiPtjXDuEbIfKY2+LphyZxnh
         +hqH4aZ9wjkwpUqHFD+DkD7WhwSSsM6KzfhRwLAvNnDm1AeuoK+Eb/UExELU86+oqJGj
         Kf6Q==
X-Gm-Message-State: AOJu0YwUJM/Hij5Jb1rVuCbcub7OR9ch64zQJpchsnKUNCdsmHNKTK7x
	00FuQiavxrlc2eQe6s9jnIB83ErbVCmbnKaPunpyyKlt6o7oLMlYzF0LGocJxxoHb3w=
X-Gm-Gg: ATEYQzy0WF1l0mh9UMeXQ6HhOzX+Wm+qUokJdeWdMn0w6hOufJocmszD/IQuhFehCph
	+nJRaoJkaBdE/WqR2Q3KYG4QJ3LZgx0a/apwgbbwBfuuAkIipcAdajMyebCsBz4Q8mEewebAvKT
	4wBv6UvSuV8/SmE4MQ4eOx+uY5AQ0YnmQ7bEGLi61Mz8wUrFRV5RcguYkdbc0J2/tS4F3AFVJEA
	Pygpgu9+GvoK5/pKwnj5ds2YiApHP7uabRmpsCuProWBEilb6sTPhGnA3/DPjL/10O64PUzKNDl
	R/ovyxkNs2OD/8igGYoWfBVhTOXLYUoONaf8NArJdnDuhq1tiyEfJAKGwDKQoMexwlsg5D59UXx
	lbV5q0zoY0Uta8WHuKTA4Vp/O7K2w4pQAJwLvX4ynsjYrDi+uz9LyrKsQB16oyyFQzLBYh0BJbD
	LWouKcyhMilWiQh9ZSaHBVRHz7gASOlCkOhJfBunPantlPNEB8TFhoUMa6I/BlhQWg
X-Received: by 2002:a05:600c:8b82:b0:483:8062:b2f with SMTP id 5b1f17b1804b1-483a95b3e0dmr257103905e9.6.1772032288892;
        Wed, 25 Feb 2026 07:11:28 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfba9a5esm33950695e9.4.2026.02.25.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 07:11:27 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Wed, 25 Feb 2026 15:11:19 +0000
Subject: [PATCH v8 02/18] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-2-95517393bcb2@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8029;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=DcA3V6DF2BA2QJePYEKIHuVBmYletxrgnzHZXIVjZ8g=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpnxEZUTlnMTFouzw4B6WU01P4kpYkelCY5Wf5k
 r2BmmBTG2WJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaZ8RGQAKCRAicTuzoY3I
 OkyeEACFsYnUDJjs3w9OvZ+590MQb9cixoRKyCTSECKufPS9VpjGOltXi7+yTUvGe1CIXLlBuYH
 mnx4UGCVmX0rzkPCrPqjnU2xjJ9PtH8SUHp1fXVNUyaDByAzMUXK0Hmajz9RnGK7L64qCiePZjL
 sQY1Q9WxJVuoFp8lpDx4gBEZj9g10lcvaDWHnnTxlDeSi1ctXLldeBtWXv5caPttlFd43RL1/4n
 oGbDb3V/A/hlkfrKmPY4EMQhFBqnG2S6npxUUV21kZVg1mQCB+ctAaHDcO83L1sK290/dZ7xmQ9
 WCxbXNI6D+OVX58vcSps2VNArVVCe8RdegUzrB+jRJPy+u/X3Nsff5rfr791JI7ycyABE+1HSLg
 oS3aib2bxCdhB7lsCgVXnBQx+IOUVf6hZ/mFmoloN9Ex/HQGRobn+XX6ZU7yickXYH32amQf0RW
 L6K5viGHGaQB6JssKKPrZmr88eoeK2ULRXNIiqKqZjZEVY9tf2VDISs83alGmeWyBOWjNcTZAmm
 362axR0Xc5ExLdcaklzwf78D2ga0zIQzSoegVQOznUf5EVXRDJdS5YbLgcxy7jdw89JECmr++Hb
 D7yswAldHDstwre716pzj8gd12O2Pr34iX9b7592fSEbk1DxTylNcwx1PAaDH+mCmyyUG/G06rx
 UfKDhdWFjZ97eTQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94146-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: C25F6199474
X-Rspamd-Action: no action

We currently do not have an upstream user of the x1e CAMSS schema which
allows us to make this the first platform to treat the CSI PHYs as separate
devices in much the same way as we treat the CCI block as separate devices.

Convert the embedded CSIPHY node data to simple phys = <> removing all of
the PHY specific stuff previously embedded.

I gave some serious thought to making the Test Pattern Generators TPGs into
PHY nodes also but, unlike the CSIPHYs the TPGs have no dedicated external
pins nor regulators.

The CSIPHYs OTOH have dedicated in-fact generally unmuxed pins on Qualcomm
SoCs and each CSIPHY has its own set of input power rails usually 0p8 and
1p2.

Instead of defining the CSIPHYs as children of the CAMSS block, we take the
same approach as the CCI/I2C bus dedicated to CAMSS and define the CSIPHYs
as their own nodes.

Remove the embedded CSIPHY specific data and give CAMSS regular,
bog-standard phys = <>;

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/media/qcom,x1e80100-camss.yaml        | 84 ++++++----------------
 1 file changed, 20 insertions(+), 64 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
index 9aaed897f7e0e..ff14a8248321e 100644
--- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
@@ -17,7 +17,7 @@ properties:
     const: qcom,x1e80100-camss
 
   reg:
-    maxItems: 17
+    maxItems: 13
 
   reg-names:
     items:
@@ -27,10 +27,6 @@ properties:
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csiphy0
-      - const: csiphy1
-      - const: csiphy2
-      - const: csiphy4
       - const: csitpg0
       - const: csitpg1
       - const: csitpg2
@@ -40,7 +36,7 @@ properties:
       - const: vfe_lite1
 
   clocks:
-    maxItems: 29
+    maxItems: 21
 
   clock-names:
     items:
@@ -55,14 +51,6 @@ properties:
       - const: cphy_rx_clk_src
       - const: csid
       - const: csid_csiphy_rx
-      - const: csiphy0
-      - const: csiphy0_timer
-      - const: csiphy1
-      - const: csiphy1_timer
-      - const: csiphy2
-      - const: csiphy2_timer
-      - const: csiphy4
-      - const: csiphy4_timer
       - const: gcc_axi_hf
       - const: gcc_axi_sf
       - const: vfe0
@@ -75,7 +63,7 @@ properties:
       - const: vfe_lite_csid
 
   interrupts:
-    maxItems: 13
+    maxItems: 9
 
   interrupt-names:
     items:
@@ -84,15 +72,21 @@ properties:
       - const: csid2
       - const: csid_lite0
       - const: csid_lite1
-      - const: csiphy0
-      - const: csiphy1
-      - const: csiphy2
-      - const: csiphy4
       - const: vfe0
       - const: vfe1
       - const: vfe_lite0
       - const: vfe_lite1
 
+  phys:
+    maxItems: 4
+
+  phy-names:
+    items:
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy4
+
   interconnects:
     maxItems: 4
 
@@ -118,14 +112,6 @@ properties:
       - const: ife1
       - const: top
 
-  vdd-csiphy-0p8-supply:
-    description:
-      0.8V supply to a PHY.
-
-  vdd-csiphy-1p2-supply:
-    description:
-      1.2V supply to a PHY.
-
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -166,13 +152,13 @@ required:
   - clock-names
   - interrupts
   - interrupt-names
+  - phys
+  - phy-names
   - interconnects
   - interconnect-names
   - iommus
   - power-domains
   - power-domain-names
-  - vdd-csiphy-0p8-supply
-  - vdd-csiphy-1p2-supply
   - ports
 
 additionalProperties: false
@@ -199,10 +185,6 @@ examples:
                   <0 0x0acbb000 0 0x2000>,
                   <0 0x0acc6000 0 0x1000>,
                   <0 0x0acca000 0 0x1000>,
-                  <0 0x0ace4000 0 0x1000>,
-                  <0 0x0ace6000 0 0x1000>,
-                  <0 0x0ace8000 0 0x1000>,
-                  <0 0x0acec000 0 0x4000>,
                   <0 0x0acf6000 0 0x1000>,
                   <0 0x0acf7000 0 0x1000>,
                   <0 0x0acf8000 0 0x1000>,
@@ -217,10 +199,6 @@ examples:
                         "csid2",
                         "csid_lite0",
                         "csid_lite1",
-                        "csiphy0",
-                        "csiphy1",
-                        "csiphy2",
-                        "csiphy4",
                         "csitpg0",
                         "csitpg1",
                         "csitpg2",
@@ -240,14 +218,6 @@ examples:
                      <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
                      <&camcc CAM_CC_CSID_CLK>,
                      <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
-                     <&camcc CAM_CC_CSIPHY0_CLK>,
-                     <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY1_CLK>,
-                     <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY2_CLK>,
-                     <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
-                     <&camcc CAM_CC_CSIPHY4_CLK>,
-                     <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
                      <&gcc GCC_CAMERA_HF_AXI_CLK>,
                      <&gcc GCC_CAMERA_SF_AXI_CLK>,
                      <&camcc CAM_CC_IFE_0_CLK>,
@@ -270,14 +240,6 @@ examples:
                           "cphy_rx_clk_src",
                           "csid",
                           "csid_csiphy_rx",
-                          "csiphy0",
-                          "csiphy0_timer",
-                          "csiphy1",
-                          "csiphy1_timer",
-                          "csiphy2",
-                          "csiphy2_timer",
-                          "csiphy4",
-                          "csiphy4_timer",
                           "gcc_axi_hf",
                           "gcc_axi_sf",
                           "vfe0",
@@ -294,10 +256,6 @@ examples:
                         <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
-                        <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
@@ -308,15 +266,16 @@ examples:
                               "csid2",
                               "csid_lite0",
                               "csid_lite1",
-                              "csiphy0",
-                              "csiphy1",
-                              "csiphy2",
-                              "csiphy4",
                               "vfe0",
                               "vfe1",
                               "vfe_lite0",
                               "vfe_lite1";
 
+            phys = <&csiphy0>, <&csiphy1>,
+                   <&csiphy2>, <&csiphy4>;
+            phy-names = "csiphy0", "csiphy1",
+                        "csiphy2", "csiphy4";
+
             interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
                              &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
                             <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
@@ -348,9 +307,6 @@ examples:
                                  "ife1",
                                  "top";
 
-            vdd-csiphy-0p8-supply = <&csiphy_0p8_supply>;
-            vdd-csiphy-1p2-supply = <&csiphy_1p2_supply>;
-
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;

-- 
2.52.0


