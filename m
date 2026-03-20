Return-Path: <linux-arm-msm+bounces-98896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ePprOtECvWkO5gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98896-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:18:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1952D71A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 09:18:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5430312B52A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Mar 2026 08:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F4B375ABE;
	Fri, 20 Mar 2026 08:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wHMQTAaS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154E2373C1B
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 08:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773994221; cv=none; b=HfljRCRVWzcJ5eoRdraTKBTFHkbJacHu5S759sNG8yIbBi3PhgUmbSZ8RN3iyGB2XXkaJ4q14mco2/B9yTUoHz0zjPD0+ecpEcbLaRjoDp5IVFJ41tBvSxjixla7v3Ayh43ZMcnitZn+9GtOm0tkk/L7yeGlBxDUeOqmz8UHwI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773994221; c=relaxed/simple;
	bh=ZVeEkBuycOCd0nHZagbGIipxk4V8apZYhSoIWrKgIxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sjoWpY/MnwJ08dMRBlagR3SkmmBwFd7apK/7ZZmFX0P1LDtAM5UQB7WvxV0+SA+aBig7OF+Za7cubnSdW/JiayiWixt9cMpuJN1hBES4DOF+lQW1ScMF2XCt9V0v5fKZi+rY/Ut9H8HQqpPocnnUNk4VPFjLfDXK0RoJ7vRpg/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wHMQTAaS; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b982b0889d8so114985166b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Mar 2026 01:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1773994217; x=1774599017; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ithYjobQzMm/Lyd/lLjuU39YHOTs+QgqcfOEAIdEfwc=;
        b=wHMQTAaSD1Y0EbCxYN9+uCyj/Mkl2zKQu95II8JM9MaEsCBxonp6RvPCziwCA+vouy
         qy30y20vD6iaLX0j3Rt0jSLkJlCc6caimWPAEDkl2amm0uXl9Aa569NtiLPY9Yo0I+/k
         7hwt9iVk4fu5D6mXjLFQ7KiaGrINtueKNqq5uO4Nms1+NcqEDgmO+D9UJtcRhU07pWR3
         gMhIXjxG1Gbk8C1enWJZuo378JymQXkTWZlVKe6yOPhCqkTx8r7Crs1kur0URUaAR1uD
         cYRQ+5V+sYLmwPi5wJwVfI6duf3SSRkl07FDX5vQl08ItPUUEv6WKxPLVS6SU+jPcjSU
         VYrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773994217; x=1774599017;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ithYjobQzMm/Lyd/lLjuU39YHOTs+QgqcfOEAIdEfwc=;
        b=ByS9VJ82nl9N2YUbpeBxhWkrUNlX1vuJqP70WGFGYsuCcXUXpDqIcm72XG0LXrxrl5
         WcCPIo9xobZI3utkhQKi9RppDvaptT/6dXgzIW1wLOEHG93eE8949lGGGA9Yk06mk5On
         DZnAmmqK7YRZwW/FLebjfV69kRYXiXlgN42s5LDa72iD9xDM76WFpqlpqG1h4+UoSYt3
         F7vhrLpKVgiEbi/nwXiaFr0nv1R7y5P9gdliD4aHlXSlUR0ntu0mCblVLe5+AFsuhnH5
         NOKnMsJ23ZdOBuQs+grLsQO6pmLS+hl3GAWydDop76PdHugH+seOrzbFiI9POeDU45Dv
         gPCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf0ovog8Qg3+oW6G1El6EiKbgD6MC7E/B2X8goGFvL75PFtztxsykp8VsXReK4MGVmCZzg/x8ML04aqkCh@vger.kernel.org
X-Gm-Message-State: AOJu0YysWc6qF2T0/5dH6dk7tWtjb7MEdAKw/eSb6WEdhvSKJUfWrnh3
	oKh2MX8MpxHrXEFUkRVZEktVKluYiTToMikmxwEezCVrJTSGULSyBYx+2YOrk0/+GLw=
X-Gm-Gg: ATEYQzz/Vr2+KStNk520yplCm+4aft/9fM0zyTS8atuJ8qUcLeeuMvVZu73LeepZpPV
	nzqGDgOB2LbJY2LV47CBv4u4Vusuly8TtKiE1OXUw6SyYlMlm/OuP5/YhgAACXsOG5A31XIB4SR
	ZYdeicxYmpC9197oepQv+dq1ESrWLsMqeJ76D/e0mj9c6I+EyD23zg1YFbw+2P3HnmPh6Mn14q5
	J9ZMbyVZfi3pXUZwlcrMdvwkbBtTo95ZbrGbIUYCCYrSl47SpIeMdK4a5RJtpmPxgVf0fhG/BVl
	tBzO6rVEki+9/0hbgZ4hkR+RAko8XHVHUf6fp9/qeJDfSsyKzinnYP/+qhQE1TNUnP9KxQpOHGQ
	5dSTkjBLbVopr77t91zr9h6rm11X1DUxj0mP3kL2k3XZOlCvg4cgN8pRAMftOTIV9xKBx1twXTP
	zaGwdOGhM+Y7g4nQ4aZTGc9oEbjlw0TexxNKm2QE6UBVLdJo5oLs9dzbx14IqxeMGf0LJxoIRB4
	tln5w==
X-Received: by 2002:a17:907:8709:b0:b93:81e7:845a with SMTP id a640c23a62f3a-b982f0c8097mr103281066b.9.1773994217357;
        Fri, 20 Mar 2026 01:10:17 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f43b5csm121016466b.1.2026.03.20.01.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:10:16 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 20 Mar 2026 09:09:50 +0100
Subject: [PATCH v2 2/3] arm64: dts: qcom: milos: Add CCI busses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-milos-cci-v2-2-1947fc83f756@fairphone.com>
References: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
In-Reply-To: <20260320-milos-cci-v2-0-1947fc83f756@fairphone.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773994215; l=5346;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZVeEkBuycOCd0nHZagbGIipxk4V8apZYhSoIWrKgIxI=;
 b=JvH1cpPA8oAB8wBpZ+RQhMJ3ATTOrVsaqMgDVWm1E4tLVLdRVAMlKGR2U9b260cJctET0aTxJ
 X7F7wCWFdwPBc8CtVMlr4T0zpcbUeUWgn+O6r3BbeQx86wDFRryg8/D
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98896-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.228.225.192:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,0.0.0.1:email,ac15000:email]
X-Rspamd-Queue-Id: 5D1952D71A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the nodes and the pinctrl for the CCI I2C busses on the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 194 ++++++++++++++++++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index 35248fa30747..4dbcd0147587 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1742,6 +1742,72 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,milos-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_CAMSS_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,milos-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING 0>;
+			power-domains = <&camcc CAM_CC_CAMSS_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_SOC_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "soc_ahb",
+				      "cpas_ahb",
+				      "cci";
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@adb0000 {
 			compatible = "qcom,milos-camcc";
 			reg = <0x0 0x0adb0000 0x0 0x40000>;
@@ -1989,6 +2055,134 @@ data-pins {
 					bias-pull-up;
 				};
 			};
+
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio88";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio89";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio88";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio89";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio90";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio91";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio90";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio91";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio92";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio93";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio92";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio93";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio94";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio95";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio94";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio95";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
 		};
 
 		apps_smmu: iommu@15000000 {

-- 
2.53.0


