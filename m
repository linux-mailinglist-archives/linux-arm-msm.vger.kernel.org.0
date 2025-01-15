Return-Path: <linux-arm-msm+bounces-45135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F147CA1252D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 14:46:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 738CA1888464
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2025 13:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16582442F2;
	Wed, 15 Jan 2025 13:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p0r8ZdgE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45F91E9904
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 13:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736948648; cv=none; b=In/IzglK6T1fAB2zUsp4g/11dSAnFC1hRo4aWb/LU4HpFVa7S/CgrcB1PNFhBR0G2iLN7byt+yeebrEz1msXMYFITyB+PBqFacG4X7mQjuvdNLZC/dWt1XUz5nao8vPxZQkpKbtAFV+V8ZGffQslMPKV2+8C4EgheJOEl3sgIZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736948648; c=relaxed/simple;
	bh=ZI7GQbjgxuGWsEsoRi1Z27Tkxrt9xFBzVoFkKCeDx78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IL+dLZekneOgYaOjfQOjS3bphKodDrjFLEVKM5s8CAjfij4dkkCL9TobqE7jF9vikYaq0y+EGSurIPOPpWMYtUlwn6al16dqmMmPb5pMLGgfIJa5obsd6DqkF2Gzol/3PkKdNx7mU2u94s5sOLyYJ2ke0GyW8pvfBUyRtFBSjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p0r8ZdgE; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43622267b2eso69743845e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 05:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948642; x=1737553442; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvBOQ4MlwgdbyGAOjIMH4siwd9wCI1oQk4atTT2g1ik=;
        b=p0r8ZdgEt6uoedRs+UPKgnWbk3vd301FJ+KnvMJFEVm49JL37wRzkPY/9up9IxMwU1
         ItLIfDhkfNGm/BdKmxysjKjNNFhJmBhoQz6THEwm30P2qLNaS09Be+iLZpbm3KbI6yiW
         Mm8yhh8qcKUr4kdZ4s4uXvyNpPPHmmc259hWVXrJSXFci6fbN+3Da8LjIchSLayFpIBM
         pQ8hf6fPb7kqdL/hiTIfu2O2kdv8YeZyqGh7O4oCCMau5UsKkyw5QE61GrXGvKne4UAe
         gezo7ryXOZlHFnd2Phh1wQxbz/9AU9o8e1/Wl1ZmbQeAWQ83VjbZYcnghWCWtfpU9en+
         NzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948642; x=1737553442;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yvBOQ4MlwgdbyGAOjIMH4siwd9wCI1oQk4atTT2g1ik=;
        b=d4LXwBW9WIdA02UyB8N3BjSvryrHcsGRgD9BY4hUGbyAOzZgG0c4/O5t1NNJ1W2wiO
         2T8OTdeIoJggPKxaY/OcaUWpfjuOqKUPDFk+BH34Dsz1hNx5fqIgMOzeCE2aq1ePs1FW
         Zwe39EAaQdAFJNJ3ZFbjNbTy5hd9GKsn7TKbYQyhWc25z34IRCMuUmwctxHd7SB7CpUm
         ZxRuJikFoADjKiXfz3XMJYf6ZSpAKbWWZtIIeULKGUsejXrV7U4cGgoGXDmQmxE4kYjJ
         em4xxdJRV2L3tkXtbEuoXDgcrlwgDRGgECPIM1EIME8B4zOuurpZxZCu8mknWfJplvN3
         Ljpg==
X-Gm-Message-State: AOJu0YzwoQ1o96xIM3/jWz2wM+InnVi4fvbYiY+TdNdLgV5McM1aORJu
	sp48HzBJEu0f8HgBG4wlskrNdHvn+ZLeT7yvMCxCRI2H2bSHn7aeU9iRQOMfZBk=
X-Gm-Gg: ASbGncs8ABKlCkq+sw4mOTGfClka5fazzPkKNakpFT0Qobmff7vHzhFvUwyMOGi5Usl
	Ndlx5BlaSTV7/mwhZ9rn9WCaoS8tgHtf9NKr/zvnV4u9TL2JGaVt3bfy/Z11pCj6SJwPUQ+cS5W
	X/seedXBoC+bwLubNeOI/1sjsotXYIkIHhyJXlpXpyKRS1mgVirjM0q5IMYmp1YmU5dtEWNl544
	t7KZmmlrSzEQqjoFLRaonBvAXaJ18NPp+Rm2+u6OFUGfhcb3ERJV4Sk2Y64UaGAtMNo4QzhltQD
	fQ==
X-Google-Smtp-Source: AGHT+IEn1xz/W3TOftuARAjoTrMr94bLOemTUB2ZrXOrOqANgffpSUAPNxR5gvrApysfVkuPEMlXsw==
X-Received: by 2002:a5d:64c9:0:b0:385:f0dc:c9f4 with SMTP id ffacd0b85a97d-38a873066fcmr22382551f8f.20.1736948641987;
        Wed, 15 Jan 2025 05:44:01 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7540ae7sm23454655e9.33.2025.01.15.05.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:44:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 15 Jan 2025 14:43:54 +0100
Subject: [PATCH 02/10] arm64: dts: qcom: sm8550: set CPU interconnect paths
 as ACTIVE_ONLY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-2-eaa8b10e2af7@linaro.org>
References: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
In-Reply-To: <20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=27171;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ZI7GQbjgxuGWsEsoRi1Z27Tkxrt9xFBzVoFkKCeDx78=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnh7ubAbsEzXbLR+2LpYMf+o42Dh0J0NUkmyz+ppCu
 pkrkPb6JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ4e7mwAKCRB33NvayMhJ0R+hEA
 DKu8Adg5P5vnAE60mEh5pkWRg4rC271seb/amXEPMaU9yR1KCoVtv92cONGQ6+54fMLRnAjxOirET7
 yK1hbyXAQNbvRfIpVo1hoiu1aqXPMhePq642v5+D3sDRPomB0lAj3ccrDMxlb6ZzMBa1AI2JSuK8wY
 /F53eOD5kjA08kCRfKoYHD91ZshAlABu9f21ZXnCxbJ9XMbqRWeWyvbSspQQHj9rUPYa6WbaoGJO9a
 XyFmRYygt87dvb5HMCGQOz0l/p0EbYV7eTHyWoLg/pT2+V2rRp5CbygWrFJrVX/xaz9Mmgj2ulTfZS
 5DehSemsxGpwdF8hn1n+lDcMIKXQhzw/F2nKXdDfJP+CnVK/Ws+yOezfjwMqByExc0gUgb9XBwjvd5
 ZA2dGrbzBAZqTxBPXSl2swLZeOyfJV7oyacgJ1oHBHblVdkLKACI2J+GsktM8QAFEimObZPthlI7Vx
 1c9xaVDn8lBsLmDr1uoq8LM/yIuPyrnBiXdFu3dvhsNzlKN6Qx9KJr+90xrlHixl3M5AF/96Ops0AI
 qQ8UyEp2h/cVNc+YwKt9/hUucB4/xJ9wOGDPtuBB1QAM+H8qm7xpLWcX8scxa2J06j3FRkqCQieM7i
 p13MzzcBN27htJDafoCUgUe2AvhK4HvQF6iulIOVMXEQaEpshV3scgZg14ig==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

In all interconnect paths involving the cpu (MASTER_APPSS_PROC), use
the QCOM_ICC_TAG_ACTIVE_ONLY which will only retain the vote if
the CPU is online, leaving the firmware disabling the path when the
CPUs goes in suspend-idle.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 184 +++++++++++++++++------------------
 1 file changed, 92 insertions(+), 92 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cc754684bf05b99d39e3987312a200b479e8de2c..a04a405a3f78f34fddf14a26a6996148cf60c85f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -853,8 +853,8 @@ i2c8: i2c@880000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -874,8 +874,8 @@ spi8: spi@880000 {
 				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -899,8 +899,8 @@ i2c9: i2c@884000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -920,8 +920,8 @@ spi9: spi@884000 {
 				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -945,8 +945,8 @@ i2c10: i2c@888000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -966,8 +966,8 @@ spi10: spi@888000 {
 				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -991,8 +991,8 @@ i2c11: i2c@88c000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1012,8 +1012,8 @@ spi11: spi@88c000 {
 				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1037,8 +1037,8 @@ i2c12: i2c@890000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1058,8 +1058,8 @@ spi12: spi@890000 {
 				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1083,8 +1083,8 @@ i2c13: i2c@894000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1104,8 +1104,8 @@ spi13: spi@894000 {
 				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1127,8 +1127,8 @@ uart14: serial@898000 {
 				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1145,8 +1145,8 @@ i2c15: i2c@89c000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1166,8 +1166,8 @@ spi15: spi@89c000 {
 				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt  SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1203,8 +1203,8 @@ i2c_hub_0: i2c@980000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1222,8 +1222,8 @@ i2c_hub_1: i2c@984000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1241,8 +1241,8 @@ i2c_hub_2: i2c@988000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1260,8 +1260,8 @@ i2c_hub_3: i2c@98c000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1279,8 +1279,8 @@ i2c_hub_4: i2c@990000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1298,8 +1298,8 @@ i2c_hub_5: i2c@994000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1317,8 +1317,8 @@ i2c_hub_6: i2c@998000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1336,8 +1336,8 @@ i2c_hub_7: i2c@99c000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1355,8 +1355,8 @@ i2c_hub_8: i2c@9a0000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1374,8 +1374,8 @@ i2c_hub_9: i2c@9a4000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_I2C QCOM_ICC_TAG_ACTIVE_ONLY>;
 				interconnect-names = "qup-core", "qup-config";
 				status = "disabled";
 			};
@@ -1432,8 +1432,8 @@ i2c0: i2c@a80000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1453,8 +1453,8 @@ spi0: spi@a80000 {
 				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1478,8 +1478,8 @@ i2c1: i2c@a84000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1499,8 +1499,8 @@ spi1: spi@a84000 {
 				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1524,8 +1524,8 @@ i2c2: i2c@a88000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1545,8 +1545,8 @@ spi2: spi@a88000 {
 				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1570,8 +1570,8 @@ i2c3: i2c@a8c000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1591,8 +1591,8 @@ spi3: spi@a8c000 {
 				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1616,8 +1616,8 @@ i2c4: i2c@a90000 {
 				#size-cells = <0>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1637,8 +1637,8 @@ spi4: spi@a90000 {
 				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1660,8 +1660,8 @@ i2c5: i2c@a94000 {
 				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1683,8 +1683,8 @@ spi5: spi@a94000 {
 				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1706,8 +1706,8 @@ i2c6: i2c@a98000 {
 				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1729,8 +1729,8 @@ spi6: spi@a98000 {
 				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>,
 						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
 						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 				interconnect-names = "qup-core", "qup-config", "qup-memory";
@@ -1753,8 +1753,8 @@ uart7: serial@a9c000 {
 				interconnect-names = "qup-core", "qup-config";
 				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
 						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
-						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>;
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 				status = "disabled";
 			};
 		};
@@ -1880,8 +1880,8 @@ pcie0: pcie@1c00000 {
 
 			interconnects = <&pcie_noc MASTER_PCIE_0 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			msi-map = <0x0 &gic_its 0x1400 0x1>,
@@ -2005,8 +2005,8 @@ pcie1: pcie@1c08000 {
 
 			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &cnoc_main SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "pcie-mem", "cpu-pcie";
 
 			msi-map = <0x0 &gic_its 0x1480 0x1>,
@@ -2130,8 +2130,8 @@ ufs_mem_hc: ufshc@1d84000 {
 			operating-points-v2 = <&ufs_opp_table>;
 			interconnects = <&aggre1_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
 
 			interconnect-names = "ufs-ddr", "cpu-ufs";
 			clock-names = "core_clk",
@@ -2433,8 +2433,8 @@ ipa: ipa@3f40000 {
 
 			interconnects = <&aggre2_noc MASTER_IPA QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_IPA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "memory",
 					     "config";
 
@@ -2971,8 +2971,8 @@ sdhc_2: mmc@8804000 {
 
 			interconnects = <&aggre2_noc MASTER_SDCC_2 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "sdhc-ddr", "cpu-sdhc";
 			bus-width = <4>;
 			dma-coherent;
@@ -3619,8 +3619,8 @@ usb_1: usb@a6f8800 {
 
 			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
 					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
-					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
-					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
 			status = "disabled";

-- 
2.34.1


