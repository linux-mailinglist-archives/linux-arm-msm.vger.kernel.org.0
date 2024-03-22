Return-Path: <linux-arm-msm+bounces-14803-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 30468886988
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 10:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 961471F22B28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Mar 2024 09:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432DC3D556;
	Fri, 22 Mar 2024 09:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jG4WQLeU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F19383AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711100574; cv=none; b=XcGudCb5eJSn1KxR4x5T7/4XUrVB3F1+G3UIiNNdnnfdtNT1se/HSStomRsWrLxD4HbdEnAwHuZ6n/WoEldxTdg1Zc0oL3fqK6A1ujOdDulgfYnEO9IoIpKOKCfJg4EriAvtnDkQU3PwfIN7u1iEPLq0NM4qmML27gYIw5XeBc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711100574; c=relaxed/simple;
	bh=0+RdmftpKdoFSVt08YhMwCSmXP/Cp4RuQbNR1jrvu/U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPlE0DlBYGnt/RWw5Uk2VSIGA2Dn6UnWJ7iKURJFaXgk6ji6qBDEzobGYXeHKP90zITN+y6r4GstDOc/opdVpMcPTYf93T01rFKUkwa4JQclEK8XqM6M9VoreCpGRVJ0oRKSgdosuS8kAO4RmuarE0Z39bExuRKhapd5lF52eeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jG4WQLeU; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41477e77151so7543455e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Mar 2024 02:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711100570; x=1711705370; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hIrecpvZpvUh39wfgMpRJv2qYcilhCHDIPFfNLK1JPU=;
        b=jG4WQLeUi06Vunj9q1OG1x89myp4e8Q2wc5qjy3WP/t7WS7RPrO8PXrRAX+1gRE8cI
         K45fjWFKPZyNNCwZ6A9SoLA/XNRgOmFgeoxgAYzSDU4FTS/Ye9hix7zIhwFjZJNI9abF
         kIc9/QRZKSJ6jPZIio/4pUbaSeLazcPcNsA3n17no3D5jV76tZkYipOMkvoWqTYch1I/
         ir8+8JuewdUCXlu9+iLM7P2Phl314WhCRXMKjnnISX8CGZ1RSM4lcHyEsBci2q8i/PWu
         UlZ240I0iM7o7Bff4bTHejFsS8XiMgrFcluOvo163u1xvUbrUrzkBdruNezPDanUNb5p
         S5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711100570; x=1711705370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIrecpvZpvUh39wfgMpRJv2qYcilhCHDIPFfNLK1JPU=;
        b=h2NgsEElL+b6ZgatNt6XPnfucnDclOhRwy3FelsQTZaugM6ceFZGI7r2G6x1HQEj6G
         nb7F4Bws0GTHr67FhSDlr3T1kmxKcIIauoHEF1d5FngdDgOWPBcYuC4SU73f811YKcha
         XL3doskSbNYFLDU8ovrO35kvFFf0QPzI5R4plvCQ7e/ESWXUX7NjuuV0OyktVyLyuetU
         skEJF4m/rptztE6E5h8Zy0kweZlbO65ZWR5TCBJGrPfxqP7DfjjhuGn7GA1kMQ0f/RQW
         ztIfUUn5mGGaP956dG3f6zInWQCSiI2DfLAF20cX29OL/bNiHKetU3qDK1w+qnTWJIOP
         JSnA==
X-Gm-Message-State: AOJu0Yw0m1ub1evxEApTwTLKpDCkqvOxtc7RgmUif0sPE+cNEDPpM0NI
	uxeQDALsm7KoViWB92Rm6fD0s9h4RkK7Zo3L59lKG8Zumo+4CVbZ34L8931a/Gk=
X-Google-Smtp-Source: AGHT+IH/YR4laTJY735GA4EYAew5kiy6VRPjETSq3xzM+ktpO0PWyYNXP/AclpTevxrLp9EqJhpLxQ==
X-Received: by 2002:a05:600c:5246:b0:414:630:26be with SMTP id fc6-20020a05600c524600b00414063026bemr1249855wmb.31.1711100570233;
        Fri, 22 Mar 2024 02:42:50 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j9-20020a05600c190900b0041461a922c2sm2547845wmq.5.2024.03.22.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 02:42:49 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 22 Mar 2024 10:42:43 +0100
Subject: [PATCH v2 6/7] arm64: dts: qcom: sm8550: remove pcie-1-phy-aux-clk
 and add pcie1_phy pcie1_phy_aux_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-6-3ec0a966d52f@linaro.org>
References: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-0-3ec0a966d52f@linaro.org>
In-Reply-To: <20240322-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v2-0-3ec0a966d52f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3193;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=0+RdmftpKdoFSVt08YhMwCSmXP/Cp4RuQbNR1jrvu/U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBl/VKTzlkD0PvADy5t8aFhCAlr/2DypGHOPi9Hy/vi
 4sPxym6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZf1SkwAKCRB33NvayMhJ0XD1D/
 wKWWuMK5/SyPNJUv1YNYkCMVgwrGw3RmeftpRaA4+fZ10C8otoOgbhF+4Ab8bQXmadCsqDc8Mx/9tx
 DYQj/k4Us7lk36YIx3rGRfsQr5QKfef1XAjlbZJ2ZZrEg//0gczMp1TcmVMxj5t9frmV2dRB3nc4sn
 XFgf2CtpuHzVCem+kJ00lDfeCBl7SpCAn8ABE3t0b7feNrfjY23cGC196e4CRZnIVXu6L/DkXotBa1
 nF/5zQxl0jDTcrxbufll1p8lhssZiwy68Q2ZAUHQgIHWU64jjgHuDhgR6fRSdGB2NpszIDGdwJjmPn
 ltWO9qQbPABe4AQa5k8Cr3x+VqGGTe+Oj6bmPlCQhynr6W+aoxCczCq706reHKB1/ER/KIo80MCb9T
 hy+PDGBoRj3ryv+6xYChLKomRxcPJ8HgePWylTd69+NAToY3DRft4Y0UIcdMWOcbU/ls+6QT8yeODA
 e2lISlSqsoNFXS6hDo4JkhcbMAhNEisyQVs/MOrCQcuuqG7gGCYTYa+1sxuMSvMYsp4DZmdfTdQoZO
 +Pun9rcjzWxlWa4ZixSSVjPSnv4801X05yebt2yLZzs5DGe4GTTRapGaKpqC4EmL5i1/+Rp+q0ZJ1o
 7LzcdMRkLbYGo+N90e0UnMytCt/yOJPqpGRdenDmr/Pvvnl5e7+bYviQr/og==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Remove the dummy pcie-1-phy-aux-clk clock and replace with the pcie1_phy
provided QMP_PCIE_PHY_AUX_CLK.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts |  8 --------
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 13 ++++---------
 4 files changed, 4 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index 12d60a0ee095..ccff744dcd14 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -979,10 +979,6 @@ &pcie1_phy {
 	status = "okay";
 };
 
-&pcie_1_phy_aux_clk {
-	clock-frequency = <1000>;
-};
-
 &pm8550_gpios {
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio12";
diff --git a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
index 3d4ad5aac70f..1fa7c4492057 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-mtp.dts
@@ -739,10 +739,6 @@ &mdss_dp0_out {
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
-&pcie_1_phy_aux_clk {
-	clock-frequency = <1000>;
-};
-
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
index 92f015017418..da3cfa697969 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -810,10 +810,6 @@ &mdss_dp0_out {
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
-&pcie_1_phy_aux_clk {
-	status = "disabled";
-};
-
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
@@ -907,10 +903,6 @@ &pon_resin {
 	status = "okay";
 };
 
-&pcie_1_phy_aux_clk {
-	clock-frequency = <1000>;
-};
-
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 3904348075f6..c74455dfd354 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -58,11 +58,6 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-mult = <1>;
 			clock-div = <2>;
 		};
-
-		pcie_1_phy_aux_clk: pcie-1-phy-aux-clk {
-			compatible = "fixed-clock";
-			#clock-cells = <0>;
-		};
 	};
 
 	cpus {
@@ -776,8 +771,8 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 			clocks = <&bi_tcxo_div2>, <&sleep_clk>,
 				 <&pcie0_phy>,
-				 <&pcie1_phy>,
-				 <&pcie_1_phy_aux_clk>,
+				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
+				 <&pcie1_phy QMP_PCIE_PHY_AUX_CLK>,
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
@@ -1906,8 +1901,8 @@ pcie1_phy: phy@1c0e000 {
 
 			power-domains = <&gcc PCIE_1_PHY_GDSC>;
 
-			#clock-cells = <0>;
-			clock-output-names = "pcie1_pipe_clk";
+			#clock-cells = <1>;
+			clock-output-names = "pcie1_pipe_clk", "pcie1_phy_aux_clk";
 
 			#phy-cells = <0>;
 

-- 
2.34.1


