Return-Path: <linux-arm-msm+bounces-18190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C738AD1AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 18:16:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D818EB23585
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 16:16:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8AA6153BE1;
	Mon, 22 Apr 2024 16:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/TlkRvg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD03C15381C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 16:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713802595; cv=none; b=ANlTYLk+nnetglhm67+IB2QWM5A3kCvaAVwMIm4SFLcbkLmTFYQFtT+Ahd9mQoWXiu7zB1Hc2D1DUsyGMlq9KR7Pg0jO+/sWlR4IowiscaPVkn60KOxg5fDrK6DBjjXugIaoIrQ2wLTVUUq1Ze0RFC1tRGuDDH9F/P7mlkn0UBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713802595; c=relaxed/simple;
	bh=rYxvioeYdrYpFuDiaA9P8FKJ7TkOlkTdAv+95S9xHjU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmHFLzeXnJWCPLGIS7hVejLOcWX8o2iXU5i+dz55zXvXwc+xvxr5mpO4lUxPqUjjcuBCJVuKQtlT3NQGWkVtieFfCvrRQT2bUa+L4HPUgWLYLIALiD3pTIPdPRht+UaQQ32+TGDBCD1D3+8nlpy+gdVWopYyy0CN187kz7orbgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/TlkRvg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41a7ae25d53so6366555e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713802585; x=1714407385; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oegXinPYwwoL2z7AYKNs7tSUYhpriNFMkgsj5BeRMAw=;
        b=K/TlkRvgwnpO3eGzFUismGJ5pSPKVEZkRa+ftpMMrmdp/2NHjTdpY4f+JggPbaATRO
         PyB/ZtkfSe/B85CFv7nKidh3yIZCUeWDjBRYXC7oNpcF8mVqwChPMbX1R1k/WHaf2v+i
         b1K0rbhQrtx5Rfh6hmHtpwr33we09fduHw4T82T/BVod5Xw9sPOH6S1HlReZQ4Ag94xO
         Ie5I1LHVhntc0YNSHSYKLeWWP7bBcpkJ3w1ymOGmid2XC3y6BrWbGpXcnD7udlzSDfCb
         D3Ctvk85e3in+u9CGuZtgLmPPEuqm6UgUWzrdG1HEjCFOsyLkZfk0+QzQPM/GwXaHdDO
         cXDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713802585; x=1714407385;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oegXinPYwwoL2z7AYKNs7tSUYhpriNFMkgsj5BeRMAw=;
        b=CtlE2x+z1vOSnkgiZbXMdm1HaXuSChmzQiO49mrM8evziyC/MVkxfU+jdz+14W8zcG
         gVIylwLGfOFNCwDj7hUVcMDkQBx5Xw0g1HAAcMn2fbTHRFTwj6+VNps508Le8ikMNvxX
         R/kK2uFhxSvzH+SB4dNrd4Yupe0ShTTOk0uTqEWtRnu00/8C+3rI4wjxyLXNqLXG/2cX
         5p735BEIMtl9rjYGLsdjzb5pbC4eMQsXjr511QrB7Y0bWHHIUiVNkmaSFlK0n9zTdS6X
         9WbBty9KwouvMWdBYFQrEHBjmZiYbdHWHdZERDvsrEeTDHtRrNhi16M6f59Z9ky/EBMT
         omjw==
X-Gm-Message-State: AOJu0YyMW0TPdulatoME/8ITuStEQ/b/T6SfHd8lhg7pQY0oZAhjf78n
	dgTNyBFpd4OnpcMvKg2vB+vX8weDj1qOYML2rTYXLMVm2PTc5jIkdl7v+eL2VNM=
X-Google-Smtp-Source: AGHT+IGSQUQfn8YiizXCX0G96buoTLgow78PntJ8E8/Mr8X0ro+Sanyat2q1M625zyt//Gj6wmDfTw==
X-Received: by 2002:a05:600c:3504:b0:416:605b:5868 with SMTP id h4-20020a05600c350400b00416605b5868mr6505304wmq.35.1713802584792;
        Mon, 22 Apr 2024 09:16:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000100c00b00349ceadededsm12463710wrx.16.2024.04.22.09.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 09:16:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 22 Apr 2024 18:16:19 +0200
Subject: [PATCH v4 2/3] arm64: dts: qcom: sm8550: remove pcie-1-phy-aux-clk
 and add pcie1_phy pcie1_phy_aux_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v4-2-868b15a17a45@linaro.org>
References: <20240422-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v4-0-868b15a17a45@linaro.org>
In-Reply-To: <20240422-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v4-0-868b15a17a45@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3526;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rYxvioeYdrYpFuDiaA9P8FKJ7TkOlkTdAv+95S9xHjU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmJo1VxU2ecxpDYSriHYfNiKEKc1H/282dmFjacNo2
 b2qwI3iJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZiaNVQAKCRB33NvayMhJ0Q05EA
 CvoavizC5fznewE5XEKnrfZIghet8RQ5aDEKYxrcayZ1d/KAdeFVWdN1v5R0BZloPfPm/kEPYKctF6
 JuZllGgrC8efxtAWG0P4YNB+oxzMCd0f9YXtGD3p3dwctp7HWno9qLIRmrc53T9AnGVtHRZePHEFcr
 bdcLVnPeADtXWzx8QcQp4QWo68OdySBN0kd6il2iae7JlyWQOeq4hTWB14yJAw8T7j+Giu8Ptotn8l
 0zt3XWvtJOOB0fMLIuTrrBHYUdyCEvTRQFb39y/hr7asFUgDHAtcSr+RW5MWrclcSnOSDnKFEPPjgt
 emFBtLLeX0UUP92qG8vZkAfXiU+YOdvF+T1y4gb9mSpHxUjrFYkJ/s2oJSNhQXS4+xwRRp9aRNdjyI
 Mf5k+Y2tqxCae3MJ7LxkipEDqOJHdKXlbK+Ms/lANecUg2IFMWO1bwwEwvUaas0Ps1EmiKBbdauA9d
 KFbEMPxWvFDpERSVMK20Jb2K9MVw1ItJSL7b3KRQeocv+jDat4Ad37I4BeJBmkxUlaN/CykCfEhixm
 E92gozD+DJEJMoeUGE1DOzT+7F43J3EGMgiL0fHWaaXXfwrrLyrcOtMH01KV9sL1PS3Ts5F41e3EXJ
 P7dfH1rxyxOlko3uCYBDURdFNzUXuC8DWjkQKpIt5ZNvbiDPLwdH3eT5GiwQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Remove the dummy pcie-1-phy-aux-clk clock and replace with the pcie1_phy
provided QMP_PCIE_PHY_AUX_CLK.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8550-mtp.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 19 -------------------
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 13 ++++---------
 4 files changed, 4 insertions(+), 36 deletions(-)

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
index 92f015017418..39ba3e9969b7 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
@@ -720,17 +720,6 @@ &ipa {
 	status = "okay";
 };
 
-&gcc {
-	clocks = <&bi_tcxo_div2>, <&sleep_clk>,
-		 <&pcie0_phy>,
-		 <&pcie1_phy>,
-		 <0>,
-		 <&ufs_mem_phy 0>,
-		 <&ufs_mem_phy 1>,
-		 <&ufs_mem_phy 2>,
-		 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
-};
-
 &gpi_dma1 {
 	status = "okay";
 };
@@ -810,10 +799,6 @@ &mdss_dp0_out {
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
-&pcie_1_phy_aux_clk {
-	status = "disabled";
-};
-
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
@@ -907,10 +892,6 @@ &pon_resin {
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
index bc5aeb05ffc3..143994d1e6ca 100644
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
@@ -1928,8 +1923,8 @@ pcie1_phy: phy@1c0e000 {
 
 			power-domains = <&gcc PCIE_1_PHY_GDSC>;
 
-			#clock-cells = <0>;
-			clock-output-names = "pcie1_pipe_clk";
+			#clock-cells = <1>;
+			clock-output-names = "pcie1_pipe_clk", "pcie1_phy_aux_clk";
 
 			#phy-cells = <0>;
 

-- 
2.34.1


