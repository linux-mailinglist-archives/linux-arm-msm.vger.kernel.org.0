Return-Path: <linux-arm-msm+bounces-100089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM2VOokKxWma5wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100089-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:29:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B915333588
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 11:29:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4164A3074F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:27:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 284C43D2FFD;
	Thu, 26 Mar 2026 10:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHt/CdxL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D33C9444
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774520839; cv=none; b=RmbImfSyXBZypS61/klYoANHhdzYrmQCGlV4Y7edwn3H9AIRYvmAG4UwBBl8wEgvVoKaUNuGQKXKki6HG2DNyJLfRqMXCeEzDEks0BIVt9b/UDoGWF3s7DgLnuEeDNcvhPo7wP9t/+AD46xpGmorBKXxTSvnIv2y/YLe3exhZj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774520839; c=relaxed/simple;
	bh=K0XUGrD5+VXgvb0goOQpiva/KqZ/ELAp73Gm7bK1j6M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ddusnksPoKuQLD9QP/XCUb5GsVcyPFM8m3X34eW5Z6dIVkUattc4WNPH32+uIDbm9NB/YEf6kX8DGpJiBNESBKZYJfghFEY/YPNf4pwOnGhBYj8Wrsk7bCB35lESdP81SspN5PZ+KopcboITGadrlVjqw1k0YbWiZsPJfgadxCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iHt/CdxL; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b2965d4bso605901f8f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 03:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774520835; x=1775125635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFH6znvuyd5xKzl6HZV5WXUXeZh+v+g+G9umkMozHAc=;
        b=iHt/CdxLLYTkjo4zjRVY2KaikvUvWJuogSSP/TATr0w5sbqODdPoTutldV3pbRAw2S
         670IvmZrVyg5hf3GhI82p/9hRDFBgpmJvQmoK0ABYCtgTiCMqLiTVdzdT9U2JKDv7UjW
         ZcmT/yL4gTcQNq1HFrya6u5ffqWzjfHJl0TXTCKcUN5XiJbFJEeU7x/UfCgsKUKfRg/o
         3l2uhrCOVwTdwFAzbbBBYxGVJlQreNDj0/yr17nGm2x3beDFi6oJuIlf8fTKM0ohmUaQ
         57x2p0oN9jFiTH80y8tRyq52jgK0fVGXa6iCbbKmWG5Xyr1rpsE9pv2LSLqvJj5gpHgb
         Oafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520835; x=1775125635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFH6znvuyd5xKzl6HZV5WXUXeZh+v+g+G9umkMozHAc=;
        b=XCKVa6qci9/yQyaXclixDW4hJK4Y47p95vbOjJu4E4frX4dpctok7+y3KOKewTtB1z
         pTki+VviuCelMVfgdCf68di/5NKEufwtKgCP6eajY71k4yNzCrI218+ogK8c4IpS8kKl
         rF2X4UkVTsbAYllDBGM3nGqjjlrXcE6xYqTOonrhz08lP1Z0xuDVi2uRA8fgQPDxeTF8
         /pF+SVi+yyalsz4bZKlY48W/pa5V1kM3z8JHJltn304l9PXA/0StSVr1L6mZZ7uCWpPK
         z5IfM3x6N3Mz8Px9owHZizHXcjUdx9M2JVLTUYslKXpyr+P9kZYVQvSrQ1RN0Z5r0hcL
         4/qw==
X-Gm-Message-State: AOJu0Yw0DJaXPCLGaHY4dCdksLmvyYPXEoG78qz3jzRukth7x3GN1Idz
	atExXCYktzdQl1wuo9l9ZpXby0s+iDyg+dqOjpkGOZw5nuePYSEk48ofVgBf2cA8tzk=
X-Gm-Gg: ATEYQzwoz7vWbhIEfpi3+chL5BCf4RokHAuwzQE7pIMJCfkoEhypMWzn9I5PSk1DJcq
	x32RwAkyrpCS1h0Zm+gnjFnHrpH41jDg5mTERf2yirHtXP+LVyYTxySxXKMeYFHo6NThWSCDdE0
	SpVp8hVPGhziO9/AI59qLMJjNzAsph/OhaDjVN2gz5hGsWtpBjQeBu0w3uSADUcmibPzEblTYnT
	Az4fyhzGDpn36OnjXYdmbIeaEsImNNyo1R2kuUOZ0lmg+JrP1hJRpciXJ63CUxW+eohkLeGwYue
	9mpgyV45CNZsuBu0/FZRtje+dNrHJV13Pqn9Bdrmbr39oTNfDnHVruVIq8aeg/ZReEbI4OANgG5
	KuSVFX+EUAIba2pIjf8gFtMww1KKZ5AWFwSaoiGdiiUAHpdUVMkBuGvBaA1SHK2+uz8H0TiXM3K
	Vb+Q0rdiTRc0fNAq45GdIEt+dqIwzUeJ97Pw==
X-Received: by 2002:a05:6000:2287:b0:439:d242:e8fe with SMTP id ffacd0b85a97d-43b8898d586mr10627732f8f.11.1774520834494;
        Thu, 26 Mar 2026 03:27:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.111.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm6912278f8f.19.2026.03.26.03.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:27:13 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Mar 2026 10:27:40 +0000
Subject: [PATCH v3 03/11] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-x1e-camss-csi2-phy-dtsi-v3-3-1d5a9306116a@linaro.org>
References: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
In-Reply-To: <20260326-x1e-camss-csi2-phy-dtsi-v3-0-1d5a9306116a@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10431;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=K0XUGrD5+VXgvb0goOQpiva/KqZ/ELAp73Gm7bK1j6M=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpxQocuCewVL84DItYug5qMV6u5Lr4Kgm1nzMrW
 dBg5+te5DqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCacUKHAAKCRAicTuzoY3I
 OjBOD/49Tlr5AAyTiqKa0SvrESFBTKBZ6WWfha5YLKcMMdxcDjjIuhGyrCS7j6dmhfX+zIeh4y5
 Nkg69sFqrF8ebq1yEVKrgoW1NA3Rf1ro27pbXzTTfcPSrbLvocuklrOA8WhZoPVSDQ33T9HGH0V
 jYEyclBIoJOqemz3CjovyZKCPohLqX4XErNQCPPswDzWvprDQsA3vZH/+IT+AOhJDwfOQcs1v3d
 Wj2VksYKAuiiZjspSjl0aNECLW1y/Q8vPhwmwSAZg0ofT2qjEi2U7Lk9zyrtdHetOyjm6tPyB1t
 7fNZo8Wj7f1bAlgQkv8vtOfeatwUdiGK8cCGq0DCPc9Y+NDDM3GEEDOmhxgpztI/AU2cRXdkH5Y
 mh3lE2F0R8twtxdtBBWKyNxkJfRNh4+38TmBBuBKoSaZJrgsfw9rXfcHuMD/ipK8EAaijSyQH6o
 A54aAuJk0ykLt7cEeKZaNrBcBHxThMU6Wz8kuHwVjLQZFev5Fed7wjjoo9wc1vlf9KQWLb3VMc+
 XtRgV0wB19pS/5jzDCriFW1tMnogWKTebVU0OCvyNhuA9OhVZhi06wOSa9gS9ZkzBX6KUpauMGi
 UGCEqf0XYcwtl1sjf/b3eScyUo3zcB6cMGHVcwEEdcRbN9la+/M4IwVNkqPuEh9rzGMhckepODC
 TUGFFs8kYCvHpMA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100089-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9B915333588
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add dtsi to describe the xe180100 CAMSS block

4 x CSIPHY
3 x TPG
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 348 ++++++++++++++++++++++++++++++++++++
 1 file changed, 348 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 38f9da6ad9ca5..9b7c7d30d7093 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -16,6 +16,8 @@
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
+#include <dt-bindings/phy/phy-qcom-mipi-csi2.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -5543,6 +5545,352 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		camss: isp@acb7000 {
+			compatible = "qcom,x1e80100-camss";
+
+			reg = <0 0x0acb7000 0 0x2000>,
+			      <0 0x0acb9000 0 0x2000>,
+			      <0 0x0acbb000 0 0x2000>,
+			      <0 0x0acc6000 0 0x1000>,
+			      <0 0x0acca000 0 0x1000>,
+			      <0 0x0acb6000 0 0x1000>,
+			      <0 0x0ace4000 0 0x1000>,
+			      <0 0x0ace6000 0 0x1000>,
+			      <0 0x0ace8000 0 0x1000>,
+			      <0 0x0acec000 0 0x4000>,
+			      <0 0x0acf6000 0 0x1000>,
+			      <0 0x0acf7000 0 0x1000>,
+			      <0 0x0acf8000 0 0x1000>,
+			      <0 0x0ac62000 0 0xf000>,
+			      <0 0x0ac71000 0 0xf000>,
+			      <0 0x0acc7000 0 0x2000>,
+			      <0 0x0accb000 0 0x2000>;
+
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_wrapper",
+				    "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe_lite0",
+				    "vfe_lite1";
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
+				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CORE_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
+				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,
+				 <&camcc CAM_CC_CSID_CLK>,
+				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+				 <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
+				 <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
+				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
+				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+				 <&camcc CAM_CC_IFE_0_CLK>,
+				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_1_CLK>,
+				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
+
+			clock-names = "camnoc_nrt_axi",
+				      "camnoc_rt_axi",
+				      "core_ahb",
+				      "cpas_ahb",
+				      "cpas_fast_ahb",
+				      "cpas_vfe0",
+				      "cpas_vfe1",
+				      "cpas_vfe_lite",
+				      "cphy_rx_clk_src",
+				      "csid",
+				      "csid_csiphy_rx",
+				      "csiphy0",
+				      "csiphy0_timer",
+				      "csiphy1",
+				      "csiphy1_timer",
+				      "csiphy2",
+				      "csiphy2_timer",
+				      "csiphy4",
+				      "csiphy4_timer",
+				      "gcc_axi_hf",
+				      "gcc_axi_sf",
+				      "vfe0",
+				      "vfe0_fast_ahb",
+				      "vfe1",
+				      "vfe1_fast_ahb",
+				      "vfe_lite",
+				      "vfe_lite_ahb",
+				      "vfe_lite_cphy_rx",
+				      "vfe_lite_csid";
+
+			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csiphy0",
+					  "csiphy1",
+					  "csiphy2",
+					  "csiphy4",
+					  "vfe0",
+					  "vfe1",
+					  "vfe_lite0",
+					  "vfe_lite1";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "ahb",
+					     "hf_mnoc",
+					     "sf_mnoc",
+					     "sf_icp_mnoc";
+
+			iommus = <&apps_smmu 0x800 0x60>,
+				 <&apps_smmu 0x820 0x60>,
+				 <&apps_smmu 0x840 0x60>,
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x18a0 0x0>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			phys = <&csiphy0 PHY_QCOM_CSI2_MODE_DPHY>,
+			       <&csiphy1 PHY_QCOM_CSI2_MODE_DPHY>,
+			       <&csiphy2 PHY_QCOM_CSI2_MODE_DPHY>,
+			       <&csiphy4 PHY_QCOM_CSI2_MODE_DPHY>;
+			phy-names = "csiphy0",
+				    "csiphy1",
+				    "csiphy2",
+				    "csiphy4";
+
+			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+					<&camcc CAM_CC_IFE_1_GDSC>,
+					<&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "ife0",
+					     "ife1",
+					     "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy0_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy1_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy2_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+					camss_csiphy4_inep0: endpoint@0 {
+						reg = <0>;
+					};
+				};
+			};
+
+			csiphy0: phy@ace4000 {
+				compatible = "qcom,x1e80100-csi2-phy";
+				reg = <0 0x0ace4000 0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+					 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+				clock-names = "core",
+					      "timer";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&rpmhpd RPMHPD_MXC>,
+						<&rpmhpd RPMHPD_MMCX>;
+				power-domain-names = "mx",
+						     "mmcx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy1: phy@ace6000 {
+				compatible = "qcom,x1e80100-csi2-phy";
+				reg = <0 0x0ace6000 0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+					 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+				clock-names = "core",
+					      "timer";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&rpmhpd RPMHPD_MXC>,
+						<&rpmhpd RPMHPD_MMCX>;
+				power-domain-names = "mx",
+						     "mmcx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy2: phy@ace8000 {
+				compatible = "qcom,x1e80100-csi2-phy";
+				reg = <0 0x0ace8000 0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+					 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+				clock-names = "core",
+					      "timer";
+
+				operating-points-v2 = <&csiphy_mxc_opp_table>;
+
+				interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&rpmhpd RPMHPD_MXC>,
+						<&rpmhpd RPMHPD_MMCX>;
+				power-domain-names = "mx",
+						     "mmcx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy4: phy@acec000 {
+				compatible = "qcom,x1e80100-csi2-phy";
+				reg = <0 0x0acec000 0 0x2000>;
+
+				clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+					 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+				clock-names = "core",
+					      "timer";
+
+				operating-points-v2 = <&csiphy_mxa_opp_table>;
+
+				interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+				power-domains = <&rpmhpd RPMHPD_MX>,
+						<&rpmhpd RPMHPD_MMCX>;
+				power-domain-names = "mx",
+						     "mmcx";
+
+				#phy-cells = <1>;
+
+				status = "disabled";
+			};
+
+			csiphy_mxc_opp_table: opp-table-mxc {
+				compatible = "operating-points-v2";
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+			};
+
+			csiphy_mxa_opp_table: opp-table-mxa {
+				compatible = "operating-points-v2";
+
+				opp-300000000 {
+					opp-hz = /bits/ 64 <300000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;

-- 
2.52.0


