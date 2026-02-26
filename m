Return-Path: <linux-arm-msm+bounces-94316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJdNKu5eoGmMiwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:55:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D9E1A8101
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 15:55:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5732306DA46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 14:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14AE23E9F8E;
	Thu, 26 Feb 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RIqKQbzY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF333E95A9
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 14:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772117475; cv=none; b=D3AiWCzNrBVx5JPoFlWsYC1ePsA4VnpLMk03FZJmVk2FRr1yqF5YexSiP2JVN3BhdjSe3yQwbVFInklVb2Ne7PjZHGNJZse8SHYGMsQtKgS7OrlEKaSgYRr1sLtYdTIsJj296ZC76rb/sFmoS1FrU/IH8AfZQSEWE8TBQ4nzjlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772117475; c=relaxed/simple;
	bh=yLDu5cUjFhdo3AGB18pqGPkWdyiwCXvV+O3RIhuuAB0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FOreqGaoo5Lrk0roL4n29TXYeSLNXbNPpF+8kybb+JP8vuyJ3Xpf+7hHPHCdqQ6IysZvwwPNko64gi4zrW2snzVosndrLd1EA9ghjMOT2nBA/DPDlv09YczK4odLOSoeooUJw2dtePyKeI1h3HmwxvmQq144vC3WLFsO5f754iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RIqKQbzY; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-48372efa020so8176515e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 06:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772117471; x=1772722271; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VvIHme2tr+I1I9sXyZ4yONNWMUoW8jtQIkjCl+HmFNI=;
        b=RIqKQbzYzAw6aB1U9FKCMmqOIpBIt/tTCLFclbY+VNnY+26VqTSiTc6NOnWsyVVvhZ
         +Rw6Mjm4hUVsKYz1PARvEYVAwBfN8lhZJiL6jU8Yj+ZLg9Ffp37aWITPzgYkvroS45Ml
         p+wT3Nrhp/Nz+5vqL/vrmsp3hwfS3PMq0aQf9MJbDvw8URDIdDtHIk6QTwu4rnD8V/lH
         pXn1YDPUN+rMR1NIxexlyJq5eBDIlTUuk+/mW2bBlv/fNhOC7ey6r68ocVkKu8EJjPp4
         QEC6PJXE6Tiqwum0ZNFq4H33XWKCIgAglfnxSlbiOvXv/+7eI0EsxZbgJ8Y6VqqW13qj
         FisQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772117471; x=1772722271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VvIHme2tr+I1I9sXyZ4yONNWMUoW8jtQIkjCl+HmFNI=;
        b=sAbSwF2CZLI9JD88+3920grxixrmh8YtYKb9zYssnHM986RDkkJzBaxTJZiLoZj8zJ
         LC3Af9QKhETjExLFkdG1ZrZFzuXSmbmznmtV391G5pbRmneQkqRhWNQqBUEfvR9OYTpL
         j9Mx+85jZKVilJY5E3xMtc4hLpkxomlzWUO8aQZrGfSz7to6TyFH4cwfy4MM3RgFr1Pn
         w6bq5uwvqy1JzZXJrLFhz1UhQM0UwK5GTcNYSGEGi7NH5zNcMF0gndMcUhvqqmi+ONcI
         dGnKYC5kaOrlvZ6Fudr7sSgw2LfAIPF+yqqaiRpXTB1AOe2TO1MAwKM2YLq76KRVJ2J4
         OzCg==
X-Gm-Message-State: AOJu0Yyr3aAnZgIrDMBhQVT3BGy1rpF71vbyC6QNTkhXCAWQ6pYAntQI
	jVOk8vS79t66Z95TglSVGMKXGWcK4pTbcbhoyB26fhR2OtoiwZHLm57HrYH3ZuEmTbQ=
X-Gm-Gg: ATEYQzxOwFPqa2QJXngOORJM3T4WAvKLzp8dr9D44TLyrHhK85tSj7cMwy6xAxzuYFw
	nqE9Bb2e3V/mjSvOU22s50Bxj3hhDjdNAeVvwZR5qJ5Rlg7MHFo34FcKIZEw3Ddsedx4CvfFMvf
	FyI3bPznfUikZQucUvbk+066LYO7L9bzPkZq1kWQdNY+lDKpkCsbSwuZzSyXTJpdD46crJVncJK
	IUJoOtwq/BKsajZNdgyx5MtjVD4LlEbytbjwlXEHDEv6BESuEne0En2FluseNIFo7a691f4SHqs
	IJJ6K0VNShWlV4kdpMFj9yRIozln6H3Mhx4R7uibiusBNlZ9ECaLqbvA/odMjHjo+NuqYmjDk99
	pkNzfCqWWSkuyVn0yM0HETLitvZf4cEXxkK8+N5UB6JUY4nNmuwiWzBXDguILBH0F6A/LP/vxVU
	Q/2Xla/lkqkZ+iCMEWB/wlskiWlYNw4Is6m0wVb5/ANXoarbGWcmR6LEB6TZzxew8n5e4pj/g7J
	s4=
X-Received: by 2002:a05:600c:5491:b0:46e:4a13:e6c6 with SMTP id 5b1f17b1804b1-483c219ebacmr76912195e9.19.1772117471221;
        Thu, 26 Feb 2026 06:51:11 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf5fbsm36621675e9.18.2026.02.26.06.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 06:51:10 -0800 (PST)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 26 Feb 2026 14:51:07 +0000
Subject: [PATCH 02/11] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-x1e-camss-csi2-phy-dtsi-v1-2-f3f7ddfbf849@linaro.org>
References: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
In-Reply-To: <20260226-x1e-camss-csi2-phy-dtsi-v1-0-f3f7ddfbf849@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5036;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=yLDu5cUjFhdo3AGB18pqGPkWdyiwCXvV+O3RIhuuAB0=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBpoF3c8S8ecNcxODgltMqkQmkWD78oaaooRGxIl
 OFMkcghj9GJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaaBd3AAKCRAicTuzoY3I
 OtM2EACpBVvu8zac4hxKrejAvPcMknUsnks33PZuMRPvL8kdkeYDPxpQ7yIGUHRzbDbxmGzMBsy
 tvziyKEJ/feSgSTT1fTxG4PHkX51lXcSHThOvOwJWYU7UZt0DxgXH7i5OrgYk+yAJUddmmXzSTz
 TsdR1bwpIZTjDIDCwXzEQbatTO6wsa2nccTt6KFwREkJ77XmI/zQdgt44QTkNYXumWkhGJfW9+h
 WQwnLfO4GaXcCV7E5/cTHBPUtmcH/sLc1MEGDr5XXksnXbZWtu8tjr1ZbsaUspMkE5qlWQ5c9yE
 CLcNxUEoPdOHz+aM89M69nC8wMbhjnrQEt7JuzWxvszrMBbwTA7TDnX8r5i3s/3jzBtwTYPuuUE
 joJjoHnwHTvpJKr6TUBn/2cfqAm8p4e2JS6G7CcwjGhY+f+gc3k9QPCPTBd5rQxZZjI1WD12JYt
 LtCLRPlzvyWftDGWVQFdTiMpXk/M0s0e4+2TDepXFzSTrAwOQOG82B85I19CpcR2FLvguj77jLS
 vHYlsqCI51SxkpYWxkFYg65frM4fIpAl96N4+BljxtEJaBewt051/j/vhXKsTkCGTmNcmf+ZPiu
 RtWxG9XFn9Nj6gXqkzhGeqSPMxl7D8MR5p3E+8VaGGCT4Bxky/MR2lKZ7yqOtRz8vD0cz6iUNhQ
 OZTujjBYBxsCZAw==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-94316-lists,linux-arm-msm=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,ade0000:email]
X-Rspamd-Queue-Id: 31D9E1A8101
X-Rspamd-Action: no action

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 149 ++++++++++++++++++++++++++++++++++++
 1 file changed, 149 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index f96411f481305..38f9da6ad9ca5 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5465,6 +5465,83 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
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
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
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
 
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
@@ -6116,6 +6193,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.52.0


