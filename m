Return-Path: <linux-arm-msm+bounces-94317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uKqgFXdioGk0jAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94317-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 16:10:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCE11A8491
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 16:10:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7CC68308EF7A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:52:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EF33ECBE4;
	Thu, 26 Feb 2026 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z51JSHmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B425A3E9F93
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117477; cv=none; b=SZyA95CzKL0JfIA5bmanne+RveTdvcAAACBnXEqJkeKiy9oQnyWO7LkEixllgzHIuWfgD/Ksv+RD6ScW9hjUBe6m66OBYWtIj6OmAByKyg2E++qV8s69pRmn/4K6W4nPzp/5IHJVWeXLCddG7Oxsm8Oc7VVUcV/kdGd1jyFoF0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117477; c=relaxed/simple;
	bh=gaCQVgm1Bfxx0mlQEfofuMnj3KbchRV0epPGarSQrrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qtQbeD6M/p/P4VoPIbyMPa2RHVlHNvCWCr6sUSQIh2iL5tcrOnHtBKAw+S3dK7gVPh8z5FHkFHk3Q22JacRqmRNDP8KgvvXfz6ynQCYomReJB7kmUkshq2QKBN9vRRTXOYIZPCLP1SocPLBP9kP/bVdooJG1aGD6KbnJiASsj+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z51JSHmJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4833115090dso10012115e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117474; x=1772722274; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzIze1mR8YQtGjnUPUFkmHAM5nTEESuKWO5adeEL/tc=;
        b=z51JSHmJ1LRMMhVFWaB9awu9fAbSWcD4Kcplt+d5bR0Y9ET8mA0dJP7B16173IzdZ5
         N2FwksURExXz+Q5xNu+E0ykPNLautouFO/+tU63EOhDFDe5Lz6Uh9YTtNhpWtb7daTtN
         PddCk/2CcpgvjqUuPjeBS+WRI8hCdEuIl0QVVmbgq/QhPyAB3/8Ni/QglfGKcBL5XX1Q
         mhT0cSM05BfowBIDl2u5mbXvEh1vNqKjWdLRD2YbUHV3wIfu5GP7ojZmmR8YlzISAJQh
         HqDtRk+4Qflxcbr/f+6QjgrixlYaIVfe8NIX65ie4Ek+GdGTVtT9135bqEakx9BKEUJO
         f8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117474; x=1772722274;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OzIze1mR8YQtGjnUPUFkmHAM5nTEESuKWO5adeEL/tc=;
        b=Xzi4PHI4/e2XwgUTW455RTu3nfqL9yKq3Ggn8OBobcrl5yv/f5co71rZYDs1djJFhX
         AClVoJAaL1k1dseaoFP8RoAjpuDoR6uIhgS/IbEyhYFyGC6FslINs++Xq4OJMn6Bki89
         YmyVTtPaUiDzdbEDtRW80ZV29hajzi5S+nuYAivfCK0rOzb+2kgUnQBSfRsv3Jzp/U1k
         L7tYVs+H0zW5zIs7WqxOpm0qCt/DYQvcpjsEdxmLWzmxXQBpJjW/q1psvrPZKPQwQMX7
         OvzwlmjCrfLWv4G0nJiSd3JENpAC7ocwBwUwnYvxzSHcCUMIRUA/uvpe7dgvvRiEMd3Q
         z/ag==
X-Gm-Message-State: AOJu0YxF4lw5nE7TqWwiVtCrNPqStlPDl1yt540mIVS55AGfvuh5t2J+
	ZZ6BVxP9wuS7REmPg8hO0gPBXNtnJP+EaiSv32kF4hybqlCWSpbGaUF+vXRsNCcFElk=
X-Gm-Gg: ATEYQzwpydGAq4BsaO/a5IOxj0c9wal8zZqEkINFImWBeLENZ7XmMlKoiv/ZcZiesqQ
	MORoeqbJ8616eMmrETswHydjqVp855ITgNAtTDdPK3LIgrUGbgBS+HG93rKnNHuSt8ggxT94wsp
	+DqzRjH7z3pLXXAi8O78OsBfk3XUv1i5ZcwREo1kU2KJoS4kH+KQNLR/mMYiCDkq4gitEislXwa
	i6tEVU6pBDeiRWmHlPQcuVHlzmNHLtn+nzfrRx0ynS5NKgqH5HMHxpfvC69ZP+n+k4R0tjSNx+a
	aXB0GESvnWexxy7E2G0moeU3o8orQWHXwvK2rBEGSTWp59T60VwXOj/nKkXqb1x78CQVDC9FREC
	+gT9F6vGM6UZ8ZU9OcMPdJHS0Slwu0lrNAnGRl6e8XDAuSGCmwCF0hUEJ1xpmK8CArJNm1o8+CG
	rijUGe1u7ioq3Twk5kUBrb129L3HvUb8AT5pG3P1N84hHiwdiYu+5D4XpYpLGzGle/
X-Received: by 2002:a05:600c:3f16:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-483c3de3b7fmr44101875e9.19.1772117474065;
        Thu, 26 Feb 2026 06:51:14 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:13 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:09 +0000
Subject: [PATCH 04/11] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-4-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6842;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=gaCQVgm1Bfxx0mlQEfofuMnj3KbchRV0epPGarSQrrk=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3ccZuShRoij49S+75lkRueaGDNwiJ343jWx
 CKtIhYWdXmJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3AAKCRAicTuzoY3I
 Ok4UD/9cdIxJFQPgcvtPF800h3PL1692/+XXdaJj9GI6OsRZke+tFK0BYLHKX5Al/x8kRnM3FuB
 mSVafcbecOFwzSNBEW/zNc9SheFlQYPqSL/a+9QNHtPwAadEuiqtSsIpEsKdYkicP0kNOJdG5oU
 94BjddHqg0KDQjm3Wv2W8qQsnodRfaB6ZWH2pUNimeYMJImepu6feFB14LygISalMnv904o5k8U
 0CfScafh5J7EF+1EuMyfvWZIF2t+BdCiuNaeiRILuaYgFigozyxF56s+7r53QCRKxjCnw911lpj
 1L9qnAtu9L4kvTYdntYE/DIOVojOexVciHinJnu9+9LaIAD+dth/iqDGLEh5lnb0457iCJsnCs2
 ZOy5zU37REDhQpyNxG1yxU1MbFyMzDWE/sqGcEyDTt0NWFwpmu/l3UD44XtgYwowwb7FaaqS4Lw
 JCkaDATlRmiYu+zmFoKeBxw4HtwjmfyWIzDVUquPExg/MQZzSptlC6u/AC42HXgpZtrr1Aa/EXs
 /zBhMP0Ymjo0zWTvL7R/d/MSQ6lveUeCbF6bESK0m9VT7+8eMGoaxebY3u6BXEOPrD/bmACwZE6
 XC8Tt5GRMV4grYSNKOn9CpudzjCANtIaH3OzhvKcF8rMKlSLAqODCX3vJ1ACi6FiQM9I+5r3cj/
 onAQjTO2ndAfn3w==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94317-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,0.0.0.3:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,acb7000:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 4BCE11A8491
X-Rspamd-Action: no action

Add dtsi to describe the xe180100 CAMSS block

4 x CSIPHY
3 x TPG
2 x CSID
2 x CSID Lite
2 x IFE
2 x IFE Lite

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 203 ++++++++++++++++++++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 9c5ebe1b48ecd..5d0148ff2e85c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -16,6 +16,7 @@
 #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
@@ -5562,6 +5563,208 @@ cci1_i2c1: i2c-bus@1 {
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
+			      <0 0x0ac62000 0 0x4000>,
+			      <0 0x0ac71000 0 0x4000>,
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
+				<GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
+				<GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
+
+			interrupt-names = "csid0",
+				      "csid1",
+				      "csid2",
+				      "csid_lite0",
+				      "csid_lite1",
+				      "csiphy0",
+				      "csiphy1",
+				      "csiphy2",
+				      "csiphy4",
+				      "vfe0",
+				      "vfe1",
+				      "vfe_lite0",
+				      "vfe_lite1";
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
+				 <&apps_smmu 0x860 0x60>,
+				 <&apps_smmu 0x1860 0x60>,
+				 <&apps_smmu 0x18e0 0x00>,
+				 <&apps_smmu 0x19a0 0x20>;
+
+			phys = <&csiphy0 PHY_TYPE_DPHY>, <&csiphy1 PHY_TYPE_DPHY>,
+			       <&csiphy2 PHY_TYPE_DPHY>, <&csiphy4 PHY_TYPE_DPHY>;
+			phy-names = "csiphy0", "csiphy1",
+				    "csiphy2", "csiphy4";
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
+		};
+
 		csiphy0: csiphy@ace4000 {
 			compatible = "qcom,x1e80100-csi2-phy";
 			reg = <0 0x0ace4000 0 0x2000>;

-- 
2.52.0


