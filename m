Return-Path: <linux-arm-msm+bounces-18191-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 975DB8AD1B0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 18:16:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D9312817DC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Apr 2024 16:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4707153BEF;
	Mon, 22 Apr 2024 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nVWHqn14"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D031E2EB11
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713802596; cv=none; b=GdI1TmsF6L2dtcBOr50ixha0JwPeTJCL4zUlcL+mGQ44ornuXm/Fq5zHStc7QDDh45IFHh6zbQV4zNs+b/yqpW+/AumEHPK5WXfjaKU49TIUVSUCcOehtcjdZjZIRpLiN1nZUNVQHexKEQR5PTu8GPetAFxJftOy45yCBMZlXYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713802596; c=relaxed/simple;
	bh=zQpxV0djrOiwPxhRvSgIUZn7ViHWbqTnSNjH4kOd7u8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=igz+hR7fXpoEX8FwpBBEFD96xlFhEVfyiGShZAGxHmUo+8uSoJAwmkSl28VlmBdUraR7k2c+UcnMNu5Tbjq/yGj50XzPTAKNAhv373HywURI7EpzVgg1mIKWtRRB10hltDbQMEPzzRpv5Fes21zl/+BbH+BXf1YGB/3LekxttYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nVWHqn14; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41a74e60753so7022265e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Apr 2024 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713802586; x=1714407386; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLRaymjKldV5Ae25ez2pVEwmOtAjv9LTg0zkuha6uuU=;
        b=nVWHqn142wNve00UJZ2AAT+vYtYcpmpEXOu3eaKU3tmRW8ZKHzT6U999iNsUFSonMl
         EPAB9ydYBO8PJmvIY0hD7savpadGVEVLFGrNdrf5Q0zZhaLB2qIkLUUYohqkqdazp7cO
         h6D214hXvZ0iWOl2vuXTBJvdPJIughicdvTPzglqaHoMV1GVElYfJyUi0vLlNMYgAWMR
         j1ieZW7QvGroDn+JI/oQO1a/F6Hlc+ABFrHfcdEPQW2L/f3J1YvMosaaPKg8PmQ81NZX
         mVpWFBNyJGR42isyFXzSbZMcs6E13FoK6VkvZam9Ma70/DHpfvl6SxTgMALSi83CQQXA
         drtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713802586; x=1714407386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLRaymjKldV5Ae25ez2pVEwmOtAjv9LTg0zkuha6uuU=;
        b=Fskcc7149XK7CUSmEI5f/hGcBW4Pu1ZwSibOBbrvKGI4Td+UccEaNHhxipDiMjsJJq
         MkdzU+Nx/QTe2KdJpFHlEf7ZE3FltTRN3hjL2dosP3MAyTGLhEeemhJNifBD5FLxovcp
         wkfT8+NCi3FZ+2tpiLWq9CNr95M2a36pf5YeSlaYT5O1xZQMYMvYXwt4LymznJLYQ4Uy
         GRTi3+exD/BYUnWmX2EeGHMq4XtiERm6NKfr0Kem5AKOM/HF0dQgZBR4a1y6cD5hn0mj
         Ig3idA0F69UkaOHPs7RK3/+wm3cDmpsHR0pafHpWpHVakXhW6sbFwhJa+eWfiSeLWxuO
         tDcQ==
X-Gm-Message-State: AOJu0YyxCurynLBxouPj55oYlA1jS51n7H/dT1XeOkfkR+25lxhfIfAL
	2JlqjGhDVfnpy78u+Ip2s8g3y5HJfYu9v8FqbJEeOY7WMumHOOR7g1p5pc2oZ9I=
X-Google-Smtp-Source: AGHT+IEdkYcVtwh40osd4Oka6JYMUbTOhMjD4X/PZ8vmFTtoSEQvJrYa2uPdOkANHBd0NVvOkkru2Q==
X-Received: by 2002:a05:600c:4f49:b0:418:7401:b15f with SMTP id m9-20020a05600c4f4900b004187401b15fmr7685138wmq.38.1713802585704;
        Mon, 22 Apr 2024 09:16:25 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id a12-20020a056000100c00b00349ceadededsm12463710wrx.16.2024.04.22.09.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 09:16:25 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 22 Apr 2024 18:16:20 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: sm8650: remove pcie-1-phy-aux-clk
 and add pcie1_phy pcie1_phy_aux_clk
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-topic-sm8x50-upstream-pcie-1-phy-aux-clk-v4-3-868b15a17a45@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2488;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zQpxV0djrOiwPxhRvSgIUZn7ViHWbqTnSNjH4kOd7u8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmJo1VSLSi38VwUGg9SkrFCuwR25JxE8KGd2ordZb/
 iMfwOeaJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZiaNVQAKCRB33NvayMhJ0VRtD/
 9P+KWUA0JixCC1oGR2+YHAxDG+fQHXgdzp2az5ClOduO3N7RRavgAW9eXu/RCG+etSnXlXV9Cb8bwJ
 zQRFJgon3i3erE3aMlmgjEUM/E3/dfLpfvP73rON4BrIWVQ3uTEbNb1W38U7ww+CYA+8pMiU/1OjRk
 W8vQzfPZM8xiG58kVagNo6z7XJvpMAO0S9uHCZRZV3b9N/FuZPlGu9bphEOTTiMmtb/nuJze0x1bV7
 6bBPC1xeCwoZpq2isz0ePgFEcZQbuBJMlw2Kre0Nf7WF1QqZTjXTnq3zIId/N2jGkNp3yev9LDlRaj
 zgHEX/LqARu1nlSBczDoy56J92Q8nP7VliMaUoVmkfUN7WOoppwGC05sWlhfX409GoUmxwBu7e5RGj
 Zh+/pzsafSWO/jOarfo8SsAsLkJeH8a75Bf0U1aCdp78KsTwHekC1EFTwALCPyO/FbbpNsdImpe3Wn
 O+6Xjy4gwZe/Wumfy3rLZ9UOxvkRinFIOYXXHot6LOTbLTUc5ZxywUaTbWWSi7QUn2qCrDTlnmqnaT
 xmm/DNeOMSB6QT06HlJXTNHFuR+9XttavsSSwuuCbxhhbJGsSXrw3muKD5GR3eLFRgINOjmspvwDI+
 KZ/tU64jVUJceM8veKRafjYnK5T+NaHkh4BXADXoWLJW+OwXa8SjyIG3o6Xg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Remove the dummy pcie-1-phy-aux-clk clock and replace with the pcie1_phy
provided QMP_PCIE_PHY_AUX_CLK.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-mtp.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8650-qrd.dts |  4 ----
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 13 ++++---------
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
index d04ceaa73c2b..ea092f532e5a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-mtp.dts
@@ -641,10 +641,6 @@ &mdss_dsi0_phy {
 	status = "okay";
 };
 
-&pcie_1_phy_aux_clk {
-	clock-frequency = <1000>;
-};
-
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
index 4e94f7fe4d2d..bd87aa3aa548 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-qrd.dts
@@ -835,10 +835,6 @@ &mdss_dp0_out {
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
-&pcie_1_phy_aux_clk {
-	clock-frequency = <1000>;
-};
-
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 8e0c1841f748..658ad2b41c5a 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -60,11 +60,6 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
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
@@ -758,8 +753,8 @@ gcc: clock-controller@100000 {
 				 <&bi_tcxo_ao_div2>,
 				 <&sleep_clk>,
 				 <&pcie0_phy>,
-				 <&pcie1_phy>,
-				 <&pcie_1_phy_aux_clk>,
+				 <&pcie1_phy QMP_PCIE_PIPE_CLK>,
+				 <&pcie1_phy QMP_PCIE_PHY_AUX_CLK>,
 				 <&ufs_mem_phy 0>,
 				 <&ufs_mem_phy 1>,
 				 <&ufs_mem_phy 2>,
@@ -2467,8 +2462,8 @@ pcie1_phy: phy@1c0e000 {
 
 			power-domains = <&gcc PCIE_1_PHY_GDSC>;
 
-			#clock-cells = <0>;
-			clock-output-names = "pcie1_pipe_clk";
+			#clock-cells = <1>;
+			clock-output-names = "pcie1_pipe_clk", "pcie1_phy_aux_clk";
 
 			#phy-cells = <0>;
 

-- 
2.34.1


