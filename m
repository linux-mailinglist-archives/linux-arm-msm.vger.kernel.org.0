Return-Path: <linux-arm-msm+bounces-94319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEOJMDBfoGmMiwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94319-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:56:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 629C11A816C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:56:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DA34930A84FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:52:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE6A73ECBF6;
	Thu, 26 Feb 2026 14:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pP9KXH6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827D83E9F86
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117479; cv=none; b=kBh4lZC80JEHsrLXBu9+Ynxj1xaykDmvfAgeuYERLa2P7cbfZEZLbvmkvLILgEskvF2Ntb0LSzBV1PmAYsT81hNi1ySWo6S2i7qK4+sV11eTd9dVzFQCsWHzuvg13F7FI8cnUa69zAmItSAX7TZW2elhuR2lwB9k3P0gh2U+jBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117479; c=relaxed/simple;
	bh=JroXwqsdd03273iY3I0FAgKY/sEgdngvDFJfFyhLp1g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jc3k/xBL7WKhSASmadLnD58kSd+hXvO6GKoO6sWjHlYXy/oIv5n92WcdXD+eHBeAC+D0WfLqPlt99jqhR+ZBycjZ9ozLxD4Lxq1Udxe/Ue/aLwj4xOo6xomrNysLHF5zCshKf2ewn3/K6/Vv5ht8C8cxLv8scpuSgYzxKVrLdwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pP9KXH6C; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso8101845e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117473; x=1772722273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=foH4txHEALAU3mMg443JiOclx0ShfjeOi2oTBlBmPCs=;
        b=pP9KXH6CwnnLSaVjcDs+32G/ffClUCObYhxJ5mmIQOu4WCIBTAUun0KT6tgqbQz0Lz
         ehWCEhdf/lYlOxS1lz4wV8un4QNJsoFWNKa/SjtK9tgok21yY0vKmgxYAKwVlHxQJ3Gj
         MdhbMgx3+EMaCEAsVwheNpdDsTs+/XOvRoS4yUemPXFKIXVB9FX0/AUhmSWstA8wRqow
         vFMzwQranOio72vWmeFIea7a8ZD8wI9BqYTZUpv9OSBlmUo5dV2RLldXnXjeKA1om4Oz
         S2Df2j08XyK1xHzlYE5axVYnH0BqEvHnak5G153thjxFoP/GDEIJVi1BqGbquy4odPUM
         321A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117473; x=1772722273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=foH4txHEALAU3mMg443JiOclx0ShfjeOi2oTBlBmPCs=;
        b=Np2XQxWtYGdEA/ErZdMluYKPF5Q4e+dkZLOUzC60uxAO2HfOdbTd32xUm7A+i8IGWX
         GB+6ihJTITmaqul4TDE9sf0dOCGHj7VX4TXCTxhlODX+1p7JDHP3TNIRmP0OunU0tNvO
         JcPe70BNQHeNyCO17A7qnvMrSUBzTSixwk+JEfVJCHC5pI3UoxE+eOPB5JGs8TEFfrUX
         qVYVMtufAatc9WcrsdEP0UC4kXCXXT5MoV5HchWhy/CEUziV7pMpQRX0kd+htvSAhTEU
         w1vM81i4gyzMtvOhpUlyEmg0Ojz4sH7hK79UgDuwQ94bQhFdEI/iS/o5Wx2QDUJZJTLi
         Yz8A==
X-Gm-Message-State: AOJu0YxyrL2jvdKphw+XbT3CPfbfmfAZZctAS+1nHppmDsy/RM6LDJOU
	70qo8FNMNcjjH+9jXpuMfbjZVYy0F4JmR3W6nyozvGuyyhonXjLMiGFvK7BKjQqwhoo=
X-Gm-Gg: ATEYQzzsKZiRpXOr8iHaFz3nUkhQ1P+SYSHZlDoNQn6JU3F8b+WR8N55GDu2z/ZUJj0
	mARXudgcXR569I7UI1zjSpTpHaSEb5N5KOM9UG5qwZu/vsPI2VFndyTXiRhZRgy7nzG/r//WHu9
	D1QFT59/RIYZ8OqMsS9IPojVbStkkc59yY8IL3qK1ObBtbUzTVwzvM+KTqD8+sUhQBsl/yG+SDj
	+SjonmEHlPajSxUrPnxGI2i7iucNqioJYHmk6zZiVf0ACza00FJ4x+D5jtAKRHqT9S+dN9s5xZn
	mvJybkSt0CsksizKutm1/Im6+gxR7OyL2y8qEiLGxzzbv0GBfZWz2pMDDJBZOYuQkaRSMnqR5JY
	yt9DNB+wAe29RzvhHeTXFbJdIrkv/nrKb9yJnn1LV0CpO12e/qhXItSCyNLCZV0w6XAfuxa/N7w
	hTt/CpDBAoi102nnzcCTrt/jKvT7bqZ0ivWayZY6pQib43V3kr/kyyZrSOG5Zp2noT
X-Received: by 2002:a05:600c:4451:b0:483:b505:9db7 with SMTP id 5b1f17b1804b1-483c3df7281mr34857015e9.32.1772117472792;
        Thu, 26 Feb 2026 06:51:12 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:12 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:08 +0000
Subject: [PATCH 03/11] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-3-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3982;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=JroXwqsdd03273iY3I0FAgKY/sEgdngvDFJfFyhLp1g=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3cjIExvf7Ghv76qB8XodpXt+nLYm/LojKLV
 pCDZM+LLa+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3AAKCRAicTuzoY3I
 OjSGD/9f0oE1uxxcZbSusZXIJXdg80CJD2UcucO4arKaExFr01ZXg/t1IS9yiCi2Vh7gmSZwl5C
 /Y4wt76mXW12uEHvxEmOUdwn6dmJ8USt20dBirqATUuOUwmK0GZ1HNeLouw+Eus11XoukWFitDW
 p1UoZJn8GB2WIGEfbP+7tJwW3qQS9qmGY9YEhtd7Vs68BottjSXxbBKr1+1eDble7AXGWI4G72U
 6PL0L1gDPxWrSRfab35COlBUyNyQ17/OxgX/QQijCOm5FoE3TQADnRZVMXF0VTVKCeEmd4KPtPj
 J4hXr4R1vjmDufaore2pLczbpMqhAkCX62Mxc/+xgZDQ13/yjEVLBdgyTWnDwrVkqtLHlYWPjzc
 XgDqEucKxYXpHixHLlInltRs+z93Ir1FMmIXn+MD3HKhZambSO/WXz/CXJq6Gm39qmj4X8KQz09
 XKEAxmBZC05jWVZXcKaqkBgCiXc5s2xzbFrBy1+M7g1NrVqldRtLHtDGuzSKn9rZDykx6C7z8XW
 g5HNe6/XdgZ1D11nCqMeJ1nf1RaxOL88z/5YRQ3kHR8nG4llj6koyuYa8+GVOXbgfoSLNCKvOcV
 I+7dMao6a5WfRTxr/yfkw4ZWPRnXi4d5nXdOsEj0aXXT6lea1piAAYb/IS9UbMqAu0awwWr0vmz
 1+ApG1f1/CGLNkQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94319-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ffe00000:email,ade0000:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email,ace6000:email]
X-Rspamd-Queue-Id: 629C11A816C
X-Rspamd-Action: no action

Add csiphy nodes for

- csiphy0
- csiphy1
- csiphy2
- csiphy4

The irregular naming of the PHYs comes directly from the hardware which for
whatever reason skipped csiphy3.

Separating the nodes from CAMSS as we have done with the sensor I2C bus aka
the CCI interface is justified since the CSIPHYs have their own pinouts and
voltage rails.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 115 ++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 38f9da6ad9ca5..9c5ebe1b48ecd 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -707,6 +707,25 @@ smem_mem: smem@ffe00000 {
 		};
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+			required-opps = <&rpmhpd_opp_low_svs_d1>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+		};
+	};
+
 	qup_opp_table_100mhz: opp-table-qup100mhz {
 		compatible = "operating-points-v2";
 
@@ -5543,6 +5562,102 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: csiphy@ace4000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace4000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy1: csiphy@ace6000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace6000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy2: csiphy@ace8000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0ace8000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
+		csiphy4: csiphy@acec000 {
+			compatible = "qcom,x1e80100-csi2-phy";
+			reg = <0 0x0acec000 0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>;
+			clock-names = "csiphy",
+				      "csiphy_timer",
+				      "camnoc_axi",
+				      "cpas_ahb";
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.52.0


