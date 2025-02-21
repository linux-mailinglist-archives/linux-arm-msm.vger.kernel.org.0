Return-Path: <linux-arm-msm+bounces-48933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A40C9A3F9A2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:57:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5B08165B2B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A2F211A00;
	Fri, 21 Feb 2025 15:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QhnuiKTi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3832121146F
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153138; cv=none; b=CO0r8C7SP6MDkQWg+6g2Y1WgyNa1FokFddxWoMxELPs+PWYifSnhz1l8V4AeM0zt+jvdvXoONV+7n5QpmmEKAvUkgSE365Oh4XbiEfFqw9Uz6r2mEbpqDprgypU5NHnvlmGdK/ba5IPxtycW1dyxAYhxHt5zFzCLSflYt2tL/vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153138; c=relaxed/simple;
	bh=itIH8UmE28DLal026/vQWt51OaBADCkRmt6MMWb6ec0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KUVNhYYs2C7AbHXeBk14VcuSVOfu7NvvR/lGz8SMJg08aqqiIAuUfdl93kWlVdPMShl2RrxQ8L+7654ioBfkRXaiWMPakX14uc9uhsQgClci+/uIPvh7tfzK9v6czHjAxELMW67NuO1QN2E6XhyrKwCkVkYNaXpFKROyI0LVu6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QhnuiKTi; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5462ea9691cso2476238e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740153134; x=1740757934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcBk8LX8RGiFV095rZ/v8IBisxh6FvmuEC9JHwGym/o=;
        b=QhnuiKTixEqncOBSyU/e8BRYtX4GoPwKQSFigZZUTyJgHJ7i4kVl2CKQbriFM9mz2V
         NsgYlKFeo5NWbZxHXRedxaB2ibmgsd4+bcVK06fyV+uOdIfD2tb5+guRwSUpK//bnFY3
         kXwsRUPDsh3oHlpuyoq/OeV+ZJw2N56lXtf+oWs6yFTJIEaUc92YSy7fs77uB8sI/T0v
         wNlgNpZDrYcFsOBVDICmza7PxjwDZ6M3YVL8Eakm3KrdstwnuqFj1KjTDYzNZdr+I7Pq
         QMvwKdnFNk4vMlM0cpzWa7hyGydCc/PRq+fyeXIpI9XRV+bHN/GwZ9yfxqfwKriMO9+o
         /veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740153134; x=1740757934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VcBk8LX8RGiFV095rZ/v8IBisxh6FvmuEC9JHwGym/o=;
        b=PSfnZiAk3RnQCEo2r8REFCiEIgM/QK3mfA+Nk1Pg3QC6WvEyq+znoabgw0MnnhMEfD
         eugws5DFv7sfbWS5fJqg3a3gqEGp0Ydhsx/t6MLc8k89g29PLcTP37RMgjnaJdwoDTVL
         e7AXcGhKQGXxPCg9SRjA4f7B4SAfvZPdiVaZ2IJPGj6T85lJWa7YKbRAy2tUqDRlFQ2Y
         RMIc6houVJOPua84TJnfnUVEH29rNp5SU30cEb3Dml8ZPjIMYfwuOCXULPmHf0CLUYzK
         vArmEQ5uB592a9Vf7srb4v3zF1hhDJTk/Zwv6KjOjXLxisAdT5CyjA7oB5Pn13rCGqDd
         JjaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJKjknMb4CuIyOuLYJ6Psp+nuk86blZfy7uLT8eLuf/vL4BHUNPNDlbanvShuT+tF/77+DMLYhSgc91T9l@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2GoU5RyKUe3F2rr3tTkubtOAAOyegihRqMItddNf05Dzta9kw
	6zkPJvGJllxIBX3Kdc1FMLZJAgKIfmTBRJuCaaKGEJ+1Yzj+n3IkSo2z+ic0oT8=
X-Gm-Gg: ASbGncsiM/QxvCoNRt2yctOECjBinM+XCz66WL2/eCHBOyQm6Pful/a5necGUkOhyqR
	l8iqIbuHnG36v5rUQ29ZGdTt+3/SQ2WcB/cUePF5E1+3yjMV2apta2p3NU3wjgdKXGaEoaBl+fs
	GN8V4Pc94+RpcPE4dVsuNEWWAbqE+jBtZAuc1e4ExYj0zmJJrfbsZS7SqVS6mTT6kix8VwYFEA8
	EuSHtfew5SMDstJ860W6KGVfP8dSyPL5l34mqZlTdiophCpzahae67Em9JvzN7dwzGIY2sPvYJT
	SvBteIxUwpt6ZwX84AAf6YzXZfis2O5lU3T9crftxPo8vF2YDvC4E8kB7xPlC2YERI6s5w==
X-Google-Smtp-Source: AGHT+IGXwDQ6KvAlUvgVLHl9BpLcdHtn4LDHMCX5t2NTi/kJuJKg0cz/4viQPsv+yDPDkIHr723vVA==
X-Received: by 2002:a05:6512:3503:b0:545:95b:a335 with SMTP id 2adb3069b0e04-54838ee79abmr1182590e87.14.1740153134346;
        Fri, 21 Feb 2025 07:52:14 -0800 (PST)
Received: from [127.0.1.1] (2001-14ba-a0c3-3a00--782.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::782])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54816a55851sm287643e87.27.2025.02.21.07.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:52:13 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Feb 2025 17:52:06 +0200
Subject: [PATCH v3 8/8] arm64: dts: qcom: sm8450: add PCIe EP device nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-sar2130p-pci-v3-8-61a0fdfb75b4@linaro.org>
References: <20250221-sar2130p-pci-v3-0-61a0fdfb75b4@linaro.org>
In-Reply-To: <20250221-sar2130p-pci-v3-0-61a0fdfb75b4@linaro.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Mrinmay Sarkar <quic_msarkar@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2643;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=itIH8UmE28DLal026/vQWt51OaBADCkRmt6MMWb6ec0=;
 b=owEBbQKS/ZANAwAKARTbcu2+gGW4AcsmYgBnuKEjzP90Rsi8wZFwY1H7vj6P3ZzTAfBsi5R7u
 f090X2czsuJAjMEAAEKAB0WIQRdB85SOKWMgfgVe+4U23LtvoBluAUCZ7ihIwAKCRAU23LtvoBl
 uN75D/9s5F14U18NUkgIuUc/tS92qDUirdg/CqgymIIjiZr4UzLk1AapcRVsrtNLfgzaZT1H5Rl
 Kk0Gs1lchiauAdklqFB0V5kYqPoCUro26yAjssr7B+GoRy/VLyawcnQNceRA4QTThknZn81CfdZ
 h4Ynu1kt15nXjFWoCrrZH3SvcxS9z1Xga3Hkng1nCnBFXGL8eoC1GJqf+6D2zbDCv2OVKnJDGBb
 X3Fo2m4fjIlmr+7MDHcuOWr9GXkFOyiH1zzU+JFL7ljVP4YIjMo0DFlkaH3ahsQTZ6j5JhEhWUe
 9j9zwHyvOJ+Kcz3WA9M26htXbYneF1Diwu9WplGL8C5lRQpYB9uxAtvDXILo1QsM60lBP12sF4Z
 vVIcoOZyBa5iL8MGtM7zI9qyjr8Re2wincJ2m82pkW6nt9HSssnuBsAL9Dn+VDuJ6j4VMe1cjqx
 S77og6Shhpoc9JunjDxl3iClfK1yMpCLgVABuepNWurpa1BfoVwKnnpXOVFTmUqM7/KO4xXYygI
 2TzXh9NzainkP2rEQbmg4deUYPRGAQ3qyqnTwuUcfzahligFTmus9FUR/TJGf8/OMbSN5+tGS2E
 YvO+XTBAEE3cP4teEP33Jtm528bE/5NvlgI9Ld4WKDowjd/eX/KqduOyyccCntQhvb/XTosLVwl
 pDMcjIcbPgZnE8w==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

On the Qualcomm SM8450 platform the second PCIe host can be used
either as an RC or as an EP device. Add device node for the PCIe EP.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 62 ++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 9c809fc5fa45a98ff5441a0b6809931588897243..3783930d63a73158addc44d00d9da2efa0986a25 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2262,6 +2262,68 @@ pcie@0 {
 			};
 		};
 
+		pcie1_ep: pcie-ep@1c08000 {
+			compatible = "qcom,sm8450-pcie-ep";
+			reg = <0x0 0x01c08000 0x0 0x3000>,
+			      <0x0 0x40000000 0x0 0xf1d>,
+			      <0x0 0x40000f20 0x0 0xa8>,
+			      <0x0 0x40001000 0x0 0x1000>,
+			      <0x0 0x40200000 0x0 0x1000000>,
+			      <0x0 0x01c0b000 0x0 0x1000>,
+			      <0x0 0x40002000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "addr_space",
+				    "mmio",
+				    "dma";
+
+			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
+				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_DDRSS_PCIE_SF_TBU_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "ref",
+				      "ddrss_sf_tbu",
+				      "aggre_noc_axi";
+
+			interrupts = <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "global",
+					  "doorbell",
+					  "dma";
+
+			interconnects = <&pcie_noc MASTER_PCIE_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_PCIE_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			iommus = <&apps_smmu 0x1c80 0x7f>;
+			resets = <&gcc GCC_PCIE_1_BCR>;
+			reset-names = "core";
+			power-domains = <&gcc PCIE_1_GDSC>;
+			phys = <&pcie1_phy>;
+			phy-names = "pciephy";
+			num-lanes = <2>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie1_default_state>;
+
+			status = "disabled";
+		};
+
 		pcie1_phy: phy@1c0e000 {
 			compatible = "qcom,sm8450-qmp-gen4x2-pcie-phy";
 			reg = <0 0x01c0e000 0 0x2000>;

-- 
2.39.5


