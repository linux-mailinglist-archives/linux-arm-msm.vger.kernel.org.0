Return-Path: <linux-arm-msm+bounces-8085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4794E83A31B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 08:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C49661F25A9F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Jan 2024 07:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A708017C6B;
	Wed, 24 Jan 2024 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OJdebiI4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F0017C62
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Jan 2024 07:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706081852; cv=none; b=M+be/tK6pky/zm4jteNOJ2XNTtfmcUnXVvqnAbXCSLKimS/sjUO1tCEcQiTlj1a/VzQ+rg7eAYYtnL1mX6Syw7ZzoY0HEG4e4JWgM9BWMQJUqi2DkC3swucu7J1OfBVIMj7HsYwt8Pea+VNZQgKsHCMtV8NXBVhLT5IxctgJ7/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706081852; c=relaxed/simple;
	bh=5NPwNoYz985HYek6uHJDI/5wY+uuiyXnKa4opvBCJj8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P9eevNGNYfEGX06l82AJf2KNpHket4IPzRfE+DbYE4ZuMi/E+s0zAd9Z1xEQe3nt10NjULwyFx8GzIUj6QsPkqpLR8N0MXZDX1ATvWKzUfgPWuC/qLVvZB1wL9J1MXgSXZHpq9rkt4XMUD6+gyCymZ4H799m4WiCWI6onFLkXVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OJdebiI4; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d711d7a940so44980885ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 23:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706081850; x=1706686650; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7tKk/gUA2vZt4YWRFyEnjgkAtVvTsiFIxZN8q5DEuUk=;
        b=OJdebiI4f0B1iL3Di2wlf/6pKIOa+3ut/BFGdP/kD6jpjK4IgvDq79GRlK4GbPgXtQ
         YpQkjY0XYF/TMyGc2huRoqH5S0sjBm+xiKY/DZh6OgGGFkce0YjD/75rDyXq0CODJj5x
         /n1/mFpbaWAMfPb0nRxJm7mPCQdB1w0WST+O7LINf+/BqCL6l3ohviTcZXQXSsJm6c+a
         DnHbx7LGg+z5sAK3HwzJ/4Jqgzg20xBU5J8V56zgUZVJFpaYOGnFq1Fg9xfiXJAm55Yf
         v6R0WNS6+n6Ojv1aZpm2c7T/d5dwkeZlFp82LCcqpzlQKdumq7s8C3IMJBf7GqmM2KTe
         8acQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706081850; x=1706686650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tKk/gUA2vZt4YWRFyEnjgkAtVvTsiFIxZN8q5DEuUk=;
        b=KXpoZHOTl8ZtNAv5+Psc6yLKoYufZvJxf9d+JIonmSr/WCxlFn6bamSQ16/JlbUyko
         1CFcT9T2DdAAPJhK0W2SASgUy5n5wSsZTVez3sJdXeHXa/cEf5zzhb48BWlxbdiPfsM6
         4h2Ji0zULjpXU4XViUSa66qo8zF2cBZMrZTvWRmmnmtsVFPoPwfu4E3ajcuPENWyeFvi
         ivrTB0uaTk58F8vTN4y0nqmK66IRElypB/Bw4s2ZrHvLdaq3FZ9dYwAjYL4ky3xaMRy7
         5nbYapzAkezU/0gvZ+j8RJSmhzYpdtnAeVznc1zlwNMApef+dqcz/Q0neK7DZU8kOWHn
         Is8Q==
X-Gm-Message-State: AOJu0YwWv4r9+j8Dfzk+bixRPpYlEXxx/Xp7yrisNNQSb2iBf6sqGoZ8
	LHZYDSJli1kmcrfZc/NACuJ153s7KiJu8oDTd6y3DqXxxOyuixjVYSzWvz2Uxg==
X-Google-Smtp-Source: AGHT+IE5gSR9S1hNumT5Gs9vRn/HrJ2yq2svOakpJLMn1E1SeeC1nBHi/YQbyiTo51gPSYVY5Nv8ug==
X-Received: by 2002:a17:903:492:b0:1d3:d27f:77c9 with SMTP id jj18-20020a170903049200b001d3d27f77c9mr390645plb.14.1706081850722;
        Tue, 23 Jan 2024 23:37:30 -0800 (PST)
Received: from [127.0.1.1] ([117.217.189.109])
        by smtp.gmail.com with ESMTPSA id t3-20020a170902b20300b001d726d9f591sm7386982plr.196.2024.01.23.23.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 23:37:30 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Wed, 24 Jan 2024 13:06:37 +0530
Subject: [PATCH 09/14] arm64: dts: qcom: sc8280xp: Drop PCIE_AUX_CLK from
 pcie_phy nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240124-pcie-aux-clk-fix-v1-9-d8a4852b6ba6@linaro.org>
References: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
In-Reply-To: <20240124-pcie-aux-clk-fix-v1-0-d8a4852b6ba6@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3664;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=5NPwNoYz985HYek6uHJDI/5wY+uuiyXnKa4opvBCJj8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBlsL4EVGO3TtV6DQzvJ/PExud2tothVXBlk9nJc
 KgeDCk+AGuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZbC+BAAKCRBVnxHm/pHO
 9ae/B/45By/VPGVbVxv8n0z7xSGfU/JGiMFrTjUS69Gmsob8PF7fxftlTWwZCLkrUgIuJRBzdkb
 ZkHzrSGbdR0j2Foxfp/j51A4pVzGBC45wverE1WOVAm7SXjE1RiAe+KFpN70Jnciy0gDs0voIsC
 I8h+my8LE3a9yTp9A2F0se8GWbdtNlTIXQLB3l5n1QNEohi+6AaJMXKXo2RAZ0T91aPbtOmcn9z
 tkxrffCFt8jriWYRyJB7Nw1aHfs7LoWB70dND9G+MqYRK9dMhufB9K7BXZgQniBJZ9xkoe29Tzt
 jJRaUqkSIdQFvvfxsXfrJN5i+O0TgUj8StTbu76AE2zXoRtv
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

PCIe PHY hw doesn't require PCIE_AUX_CLK for functioning. This clock is
only required by the PCIe controller. Hence drop it from pcie_phy nodes.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index febf28356ff8..cc33ef47d5a7 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -1785,13 +1785,12 @@ pcie4_phy: phy@1c06000 {
 			compatible = "qcom,sc8280xp-qmp-gen3x1-pcie-phy";
 			reg = <0x0 0x01c06000 0x0 0x2000>;
 
-			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
-				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
+			clocks = <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_4_CLKREF_CLK>,
 				 <&gcc GCC_PCIE4_PHY_RCHNG_CLK>,
 				 <&gcc GCC_PCIE_4_PIPE_CLK>,
 				 <&gcc GCC_PCIE_4_PIPEDIV2_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "rchng",
+			clock-names = "cfg_ahb", "ref", "rchng",
 				      "pipe", "pipediv2";
 
 			assigned-clocks = <&gcc GCC_PCIE4_PHY_RCHNG_CLK>;
@@ -1883,13 +1882,12 @@ pcie3b_phy: phy@1c0e000 {
 			compatible = "qcom,sc8280xp-qmp-gen3x2-pcie-phy";
 			reg = <0x0 0x01c0e000 0x0 0x2000>;
 
-			clocks = <&gcc GCC_PCIE_3B_AUX_CLK>,
-				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
+			clocks = <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_3A3B_CLKREF_CLK>,
 				 <&gcc GCC_PCIE3B_PHY_RCHNG_CLK>,
 				 <&gcc GCC_PCIE_3B_PIPE_CLK>,
 				 <&gcc GCC_PCIE_3B_PIPEDIV2_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "rchng",
+			clock-names = "cfg_ahb", "ref", "rchng",
 				      "pipe", "pipediv2";
 
 			assigned-clocks = <&gcc GCC_PCIE3B_PHY_RCHNG_CLK>;
@@ -1982,13 +1980,12 @@ pcie3a_phy: phy@1c14000 {
 			reg = <0x0 0x01c14000 0x0 0x2000>,
 			      <0x0 0x01c16000 0x0 0x2000>;
 
-			clocks = <&gcc GCC_PCIE_3A_AUX_CLK>,
-				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
+			clocks = <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_3A3B_CLKREF_CLK>,
 				 <&gcc GCC_PCIE3A_PHY_RCHNG_CLK>,
 				 <&gcc GCC_PCIE_3A_PIPE_CLK>,
 				 <&gcc GCC_PCIE_3A_PIPEDIV2_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "rchng",
+			clock-names = "cfg_ahb", "ref", "rchng",
 				      "pipe", "pipediv2";
 
 			assigned-clocks = <&gcc GCC_PCIE3A_PHY_RCHNG_CLK>;
@@ -2082,13 +2079,12 @@ pcie2b_phy: phy@1c1e000 {
 			compatible = "qcom,sc8280xp-qmp-gen3x2-pcie-phy";
 			reg = <0x0 0x01c1e000 0x0 0x2000>;
 
-			clocks = <&gcc GCC_PCIE_2B_AUX_CLK>,
-				 <&gcc GCC_PCIE_2B_CFG_AHB_CLK>,
+			clocks = <&gcc GCC_PCIE_2B_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_2A2B_CLKREF_CLK>,
 				 <&gcc GCC_PCIE2B_PHY_RCHNG_CLK>,
 				 <&gcc GCC_PCIE_2B_PIPE_CLK>,
 				 <&gcc GCC_PCIE_2B_PIPEDIV2_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "rchng",
+			clock-names = "cfg_ahb", "ref", "rchng",
 				      "pipe", "pipediv2";
 
 			assigned-clocks = <&gcc GCC_PCIE2B_PHY_RCHNG_CLK>;
@@ -2181,13 +2177,12 @@ pcie2a_phy: phy@1c24000 {
 			reg = <0x0 0x01c24000 0x0 0x2000>,
 			      <0x0 0x01c26000 0x0 0x2000>;
 
-			clocks = <&gcc GCC_PCIE_2A_AUX_CLK>,
-				 <&gcc GCC_PCIE_2A_CFG_AHB_CLK>,
+			clocks = <&gcc GCC_PCIE_2A_CFG_AHB_CLK>,
 				 <&gcc GCC_PCIE_2A2B_CLKREF_CLK>,
 				 <&gcc GCC_PCIE2A_PHY_RCHNG_CLK>,
 				 <&gcc GCC_PCIE_2A_PIPE_CLK>,
 				 <&gcc GCC_PCIE_2A_PIPEDIV2_CLK>;
-			clock-names = "aux", "cfg_ahb", "ref", "rchng",
+			clock-names = "cfg_ahb", "ref", "rchng",
 				      "pipe", "pipediv2";
 
 			assigned-clocks = <&gcc GCC_PCIE2A_PHY_RCHNG_CLK>;

-- 
2.25.1


