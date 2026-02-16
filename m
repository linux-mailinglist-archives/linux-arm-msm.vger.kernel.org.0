Return-Path: <linux-arm-msm+bounces-92902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IahLxrckmn3zAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:58:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 69950141C20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 09:58:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BEFF3026C16
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Feb 2026 08:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDB427FD76;
	Mon, 16 Feb 2026 08:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yXwyE2YB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018E281357
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 08:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232243; cv=none; b=oU7z1MyfO5QMaaNhSkn1Iqoi/MKXUcVS+PHSO23iOYAKkMMf/GPTFnxm0ta4RZ6c7tGFf8B+QCMDlTKnMO2fi+heu0wn7qTI1LKqhKB45/kG+VAbIJIOtVfyMIyXDj8KGNh7cQ6qJPxT8EsHaU3EFhTUJ0ZZS6KZR/eMxaLDhQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232243; c=relaxed/simple;
	bh=1KRN293OH5EKdYWlTp7ImbYFsJEvyt/yzz6qHzJsRRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VzIo2T1Wr+rIdiVw0nLTCVMMI8+XW8jSDNo80WOqxe97boNw+e7U55r9l/+SNdD3HaTPT+r0cGp54G4OSg/Rx7xYJu6cFTSvEO8Jvyeg697tL0qz/I3OItjj8VATB9Ck7QtG+VTYmuDYCggEgVTrRQlY17j8/M3QBQUZmKZ44yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yXwyE2YB; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b885a18f620so370896666b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 00:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1771232239; x=1771837039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lihyZGSPeHa/Gscs8vNHaVQUw7h5CDO0qKQPRC56kzI=;
        b=yXwyE2YBAPV921O4dMJ27yKWOLaJb5bx64x1feR2e6DxQ9TcPjZvKeZaTHRWpD/OBA
         cBgn9CfYxyi9xzeSGa5Yr//VOtAqkguuDCyKV3zA4dFD54UK+IasSJWuZtDZ2qHk40tk
         T3fob9nkrAfI2bZTqICXOWUy9Bpt4QLoHFw81VJMmlsetaykrFP9yrwypIfE0oJMIzm/
         DuQ7FsL+hJlekcwgu0koEAMeUPj3F9JWHHMlf05E/H09ydK4J+My1cgxUVeNY3+k3k/w
         +AWVOjQnYy/h3XblAt2Q2DsfftUrESRN9TwcV1gxDMbiXxeJ3Re9j1saV+clmqanKE3n
         +pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232239; x=1771837039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lihyZGSPeHa/Gscs8vNHaVQUw7h5CDO0qKQPRC56kzI=;
        b=iYL1iVYZRyppRqysDAzhnvSIr7/URXZud7i1s6HG4FlpXh23a56BT2LnwQrcEyhVQn
         xVJpv+iAnd2ZFQmKorwYnClU0VDALnfKy/51otE9ikQwOLGsANlhpLa7I9T+xdMbG2Lf
         csrWlDpqRyjumNs0fe5GQ4yWhmFU227plDt+Z7e2UKKyJG0ohFkhSmXJCko4ah7yWy8W
         BsqO2wZjYA17K0zfiCT90tOi993UEe4QkaGuS9z23xyUS6jf4sd5oalsCAgEoFryfpYG
         nvkm4J/G5cfzMhJVFW8IL45fcMfCaSnN29jbjWmefLZv+R438rMCg1UbFt5vDP2dlz++
         t9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWQdiA+WlP68fG+U7sR5Fvx6VVABd7qdXU/lBACKAnwS0JIHa1in1JLT/csgk9PHC6gtiiV98ZqoNFMZ7Wx@vger.kernel.org
X-Gm-Message-State: AOJu0YwNCHMsJEzsjkwKfMHHGdIyUYeTbHi52B325+Rxk1fVPrIQ5Ryf
	xTjyspi/ajxc5lBJ9XWZx3goVoAuXLQlcASFLQPqCCAFITysAy5CyKCzdffabhC1X6o=
X-Gm-Gg: AZuq6aKfIuZ7NrAWK+djQqTKBid5nh3umMUMjiAo76sj7NnyySPV6zFwnJlmUiyC101
	UeqhXLH44O15G8of+5Pv90ZnvFQf6WHKOECpMjPT1PojVKiAHZAtRcm+BVlG3EXHALysUVTF5IB
	AnDpOqH+mBptSsZ+aEpy3WKl839Yjgj1EHoYGFi/sgMpV/1i8hg3FM/vjFtXKiJvvz6b6Y/qgMY
	WdUNYGvhsJmAGRQ5j48SKaaVMQg+z8rmr6aOKmE82oXaiIihAZzGft2gJthg79e9Q1ybb62KfkP
	XuPGQ4eKOhOpFQLQGyrTm3InzJHIWNEiTOlAiLh3HmDTRMhgAAOoFCvJrymC6KseUMYk0LLBxLg
	pfnm9q328fSY74ztsoKARLs2KSk6Z0HrNYFTwmtWB3/qWqTrwlKTvYOWZudVpmcejoCcV+Bv5mN
	RFrT9n35DOu8h1I9/X+jAYWMXXUlQjadAl5A8beH8kBV3Xnwb4REW04oKme8BXRQkRhLIp28ha7
	OLcZg==
X-Received: by 2002:a17:907:c27:b0:b87:15a7:8603 with SMTP id a640c23a62f3a-b8face4c826mr636035966b.43.1771232239019;
        Mon, 16 Feb 2026 00:57:19 -0800 (PST)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc769437bsm236867966b.61.2026.02.16.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:57:18 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 16 Feb 2026 09:54:19 +0100
Subject: [PATCH v4 1/3] dt-bindings: media: camss: Add qcom,sm6350-camss
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-sm6350-camss-v4-1-b9df35f87edb@fairphone.com>
References: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
In-Reply-To: <20260216-sm6350-camss-v4-0-b9df35f87edb@fairphone.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Todor Tomov <todor.too@gmail.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771232235; l=16775;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=1KRN293OH5EKdYWlTp7ImbYFsJEvyt/yzz6qHzJsRRU=;
 b=2r2tnyDarpow6yu0GpYcI/qjKe3+05KZbjpBt0o/3Yfx0tsElEaSnwEB8KFJArodihGHNrhkV
 R1FRymixuhtBKsTHYxKp0HCgOPi1CCZdh9QXtr4FVOr2jHeHAKAgmuj
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92902-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[fairphone.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:mid,fairphone.com:dkim,fairphone.com:email,qualcomm.com:email]
X-Rspamd-Queue-Id: 69950141C20
X-Rspamd-Action: no action

Add bindings for the Camera Subsystem on the SM6350 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/media/qcom,sm6350-camss.yaml          | 471 +++++++++++++++++++++
 1 file changed, 471 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
new file mode 100644
index 000000000000..96974d90d8c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm6350-camss.yaml
@@ -0,0 +1,471 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm6350-camss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SM6350 Camera Subsystem (CAMSS)
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The CAMSS IP is a CSI decoder and ISP present on Qualcomm platforms.
+
+properties:
+  compatible:
+    const: qcom,sm6350-camss
+
+  reg:
+    maxItems: 24
+
+  reg-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite
+      - const: a5_csr
+      - const: a5_qgic
+      - const: a5_sierra
+      - const: bps
+      - const: camnoc
+      - const: core_top_csr_tcsr
+      - const: cpas_cdm
+      - const: cpas_top
+      - const: ipe
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: lrme
+
+  clocks:
+    maxItems: 39
+
+  clock-names:
+    items:
+      - const: cam_axi
+      - const: soc_ahb
+      - const: camnoc_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: csiphy0
+      - const: csiphy0_timer
+      - const: csiphy1
+      - const: csiphy1_timer
+      - const: csiphy2
+      - const: csiphy2_timer
+      - const: csiphy3
+      - const: csiphy3_timer
+      - const: vfe0_axi
+      - const: vfe0
+      - const: vfe0_cphy_rx
+      - const: vfe0_csid
+      - const: vfe1_axi
+      - const: vfe1
+      - const: vfe1_cphy_rx
+      - const: vfe1_csid
+      - const: vfe2_axi
+      - const: vfe2
+      - const: vfe2_cphy_rx
+      - const: vfe2_csid
+      - const: vfe_lite
+      - const: vfe_lite_cphy_rx
+      - const: vfe_lite_csid
+      - const: bps
+      - const: bps_ahb
+      - const: bps_areg
+      - const: bps_axi
+      - const: icp
+      - const: ipe0
+      - const: ipe0_ahb
+      - const: ipe0_areg
+      - const: ipe0_axi
+      - const: jpeg
+      - const: lrme
+
+  interrupts:
+    maxItems: 18
+
+  interrupt-names:
+    items:
+      - const: csid0
+      - const: csid1
+      - const: csid2
+      - const: csid_lite
+      - const: csiphy0
+      - const: csiphy1
+      - const: csiphy2
+      - const: csiphy3
+      - const: vfe0
+      - const: vfe1
+      - const: vfe2
+      - const: vfe_lite
+      - const: a5
+      - const: cpas
+      - const: cpas_cdm
+      - const: jpeg_dma
+      - const: jpeg_enc
+      - const: lrme
+
+  interconnects:
+    maxItems: 4
+
+  interconnect-names:
+    items:
+      - const: ahb
+      - const: hf_mnoc
+      - const: sf_mnoc
+      - const: sf_icp_mnoc
+
+  iommus:
+    maxItems: 14
+
+  power-domains:
+    maxItems: 6
+
+  power-domain-names:
+    items:
+      - const: ife0
+      - const: ife1
+      - const: ife2
+      - const: top
+      - const: bps
+      - const: ipe
+
+  vdd-csiphy0-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY0.
+
+  vdd-csiphy0-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to CSIPHY0.
+
+  vdd-csiphy1-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY1.
+
+  vdd-csiphy1-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to CSIPHY1.
+
+  vdd-csiphy2-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY2.
+
+  vdd-csiphy2-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to CSIPHY2.
+
+  vdd-csiphy3-0p9-supply:
+    description:
+      Phandle to a 0.9V regulator supply to CSIPHY3.
+
+  vdd-csiphy3-1p25-supply:
+    description:
+      Phandle to a 1.25V regulator supply to CSIPHY3.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    description:
+      CSI input ports.
+
+    patternProperties:
+      "^port@[0-3]$":
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+
+        description:
+          Input port for receiving CSI data from a CSIPHY.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+            required:
+              - data-lanes
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - interrupts
+  - interrupt-names
+  - interconnects
+  - interconnect-names
+  - iommus
+  - power-domains
+  - power-domain-names
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm6350.h>
+    #include <dt-bindings/clock/qcom,sm6350-camcc.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm6350.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        isp@acb3000 {
+            compatible = "qcom,sm6350-camss";
+
+            reg = <0x0 0x0acb3000 0x0 0x1000>,
+                  <0x0 0x0acba000 0x0 0x1000>,
+                  <0x0 0x0acc1000 0x0 0x1000>,
+                  <0x0 0x0acc8000 0x0 0x1000>,
+                  <0x0 0x0ac65000 0x0 0x1000>,
+                  <0x0 0x0ac66000 0x0 0x1000>,
+                  <0x0 0x0ac67000 0x0 0x1000>,
+                  <0x0 0x0ac68000 0x0 0x1000>,
+                  <0x0 0x0acaf000 0x0 0x4000>,
+                  <0x0 0x0acb6000 0x0 0x4000>,
+                  <0x0 0x0acbd000 0x0 0x4000>,
+                  <0x0 0x0acc4000 0x0 0x4000>,
+                  <0x0 0x0ac18000 0x0 0x3000>,
+                  <0x0 0x0ac00000 0x0 0x6000>,
+                  <0x0 0x0ac10000 0x0 0x8000>,
+                  <0x0 0x0ac6f000 0x0 0x8000>,
+                  <0x0 0x0ac42000 0x0 0x4600>,
+                  <0x0 0x01fc0000 0x0 0x40000>,
+                  <0x0 0x0ac48000 0x0 0x1000>,
+                  <0x0 0x0ac40000 0x0 0x1000>,
+                  <0x0 0x0ac87000 0x0 0xa000>,
+                  <0x0 0x0ac52000 0x0 0x4000>,
+                  <0x0 0x0ac4e000 0x0 0x4000>,
+                  <0x0 0x0ac6b000 0x0 0xa00>;
+            reg-names = "csid0",
+                        "csid1",
+                        "csid2",
+                        "csid_lite",
+                        "csiphy0",
+                        "csiphy1",
+                        "csiphy2",
+                        "csiphy3",
+                        "vfe0",
+                        "vfe1",
+                        "vfe2",
+                        "vfe_lite",
+                        "a5_csr",
+                        "a5_qgic",
+                        "a5_sierra",
+                        "bps",
+                        "camnoc",
+                        "core_top_csr_tcsr",
+                        "cpas_cdm",
+                        "cpas_top",
+                        "ipe",
+                        "jpeg_dma",
+                        "jpeg_enc",
+                        "lrme";
+
+            clocks = <&gcc GCC_CAMERA_AXI_CLK>,
+                     <&camcc CAMCC_SOC_AHB_CLK>,
+                     <&camcc CAMCC_CAMNOC_AXI_CLK>,
+                     <&camcc CAMCC_CORE_AHB_CLK>,
+                     <&camcc CAMCC_CPAS_AHB_CLK>,
+                     <&camcc CAMCC_CSIPHY0_CLK>,
+                     <&camcc CAMCC_CSI0PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY1_CLK>,
+                     <&camcc CAMCC_CSI1PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY2_CLK>,
+                     <&camcc CAMCC_CSI2PHYTIMER_CLK>,
+                     <&camcc CAMCC_CSIPHY3_CLK>,
+                     <&camcc CAMCC_CSI3PHYTIMER_CLK>,
+                     <&camcc CAMCC_IFE_0_AXI_CLK>,
+                     <&camcc CAMCC_IFE_0_CLK>,
+                     <&camcc CAMCC_IFE_0_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_0_CSID_CLK>,
+                     <&camcc CAMCC_IFE_1_AXI_CLK>,
+                     <&camcc CAMCC_IFE_1_CLK>,
+                     <&camcc CAMCC_IFE_1_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_1_CSID_CLK>,
+                     <&camcc CAMCC_IFE_2_AXI_CLK>,
+                     <&camcc CAMCC_IFE_2_CLK>,
+                     <&camcc CAMCC_IFE_2_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_2_CSID_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CPHY_RX_CLK>,
+                     <&camcc CAMCC_IFE_LITE_CSID_CLK>,
+                     <&camcc CAMCC_BPS_CLK>,
+                     <&camcc CAMCC_BPS_AHB_CLK>,
+                     <&camcc CAMCC_BPS_AREG_CLK>,
+                     <&camcc CAMCC_BPS_AXI_CLK>,
+                     <&camcc CAMCC_ICP_CLK>,
+                     <&camcc CAMCC_IPE_0_CLK>,
+                     <&camcc CAMCC_IPE_0_AHB_CLK>,
+                     <&camcc CAMCC_IPE_0_AREG_CLK>,
+                     <&camcc CAMCC_IPE_0_AXI_CLK>,
+                     <&camcc CAMCC_JPEG_CLK>,
+                     <&camcc CAMCC_LRME_CLK>;
+            clock-names = "cam_axi",
+                          "soc_ahb",
+                          "camnoc_axi",
+                          "core_ahb",
+                          "cpas_ahb",
+                          "csiphy0",
+                          "csiphy0_timer",
+                          "csiphy1",
+                          "csiphy1_timer",
+                          "csiphy2",
+                          "csiphy2_timer",
+                          "csiphy3",
+                          "csiphy3_timer",
+                          "vfe0_axi",
+                          "vfe0",
+                          "vfe0_cphy_rx",
+                          "vfe0_csid",
+                          "vfe1_axi",
+                          "vfe1",
+                          "vfe1_cphy_rx",
+                          "vfe1_csid",
+                          "vfe2_axi",
+                          "vfe2",
+                          "vfe2_cphy_rx",
+                          "vfe2_csid",
+                          "vfe_lite",
+                          "vfe_lite_cphy_rx",
+                          "vfe_lite_csid",
+                          "bps",
+                          "bps_ahb",
+                          "bps_areg",
+                          "bps_axi",
+                          "icp",
+                          "ipe0",
+                          "ipe0_ahb",
+                          "ipe0_areg",
+                          "ipe0_axi",
+                          "jpeg",
+                          "lrme";
+
+            interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 717 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 473 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 461 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 718 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 472 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 463 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 459 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 475 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>,
+                         <GIC_SPI 476 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "csid0",
+                              "csid1",
+                              "csid2",
+                              "csid_lite",
+                              "csiphy0",
+                              "csiphy1",
+                              "csiphy2",
+                              "csiphy3",
+                              "vfe0",
+                              "vfe1",
+                              "vfe2",
+                              "vfe_lite",
+                              "a5",
+                              "cpas",
+                              "cpas_cdm",
+                              "jpeg_dma",
+                              "jpeg_enc",
+                              "lrme";
+
+            interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                             &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                            <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>,
+                            <&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+                             &clk_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "ahb",
+                                 "hf_mnoc",
+                                 "sf_mnoc",
+                                 "sf_icp_mnoc";
+
+            iommus = <&apps_smmu 0x820 0xc0>,
+                     <&apps_smmu 0x840 0x0>,
+                     <&apps_smmu 0x860 0xc0>,
+                     <&apps_smmu 0x880 0x0>,
+                     <&apps_smmu 0xc40 0x20>,
+                     <&apps_smmu 0xc60 0x20>,
+                     <&apps_smmu 0xc80 0x0>,
+                     <&apps_smmu 0xca2 0x0>,
+                     <&apps_smmu 0xcc0 0x20>,
+                     <&apps_smmu 0xce0 0x20>,
+                     <&apps_smmu 0xd00 0x20>,
+                     <&apps_smmu 0xd20 0x20>,
+                     <&apps_smmu 0xd40 0x20>,
+                     <&apps_smmu 0xd60 0x20>;
+
+            power-domains = <&camcc IFE_0_GDSC>,
+                            <&camcc IFE_1_GDSC>,
+                            <&camcc IFE_2_GDSC>,
+                            <&camcc TITAN_TOP_GDSC>,
+                            <&camcc BPS_GDSC>,
+                            <&camcc IPE_0_GDSC>;
+            power-domain-names = "ife0",
+                                 "ife1",
+                                 "ife2",
+                                 "top",
+                                 "bps",
+                                 "ipe";
+
+            vdd-csiphy0-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy0-1p25-supply = <&vreg_l22a>;
+            vdd-csiphy1-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy1-1p25-supply = <&vreg_l22a>;
+            vdd-csiphy2-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy2-1p25-supply = <&vreg_l22a>;
+            vdd-csiphy3-0p9-supply = <&vreg_l18a>;
+            vdd-csiphy3-1p25-supply = <&vreg_l22a>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    csiphy0_ep: endpoint {
+                        data-lanes = <0 1 2 3>;
+                        bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                        remote-endpoint = <&sensor_ep>;
+                    };
+                };
+            };
+        };
+    };

-- 
2.53.0


