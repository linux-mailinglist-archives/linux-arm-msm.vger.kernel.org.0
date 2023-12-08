Return-Path: <linux-arm-msm+bounces-3918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35AA80A187
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 11:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4CA81C20AB6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 10:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCD11A592;
	Fri,  8 Dec 2023 10:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M0Rz45jh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D6201716
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 02:52:09 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a1f0616a15bso183038966b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Dec 2023 02:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702032727; x=1702637527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3yFkfEp12aI+6U4wU/tq2gheT7TJS/3Q4MuYssvsV5A=;
        b=M0Rz45jhRNrG+xtYKkVM6CRyO6pyceWKHaE6n+QuV0gBqAjk9meLRq4zCCqMcfSjkS
         6hB5SvwddqVNQ6NSVVkSSlj2l4UIXHkYvQmjMNNauDhLDq5wYee1Jvwa2YzHDsKcUOyd
         r9MWgzAuTQyIGyN0fBYwTYd9xGJYYNuvRYi3S4dZGJDOuW9O2UUM9eoDp3WxYl0S/UgJ
         qZlLdh4YJY4rpWzftbmyRB76lDmLL8RvGMIfwrY+hoZxakVHNjrE1HSHsIxBQ0Ux9LfG
         HVXbMiVAAa/vQfHwNFNFPtfVeIvku6gI0tW9MLkkedR+Z4/ZxPxkfKNW13U0A5SeDaj8
         cZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702032727; x=1702637527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3yFkfEp12aI+6U4wU/tq2gheT7TJS/3Q4MuYssvsV5A=;
        b=RSiEYxohCWZ/RYfg33du6QWOmTePU8m5kHSXE85p81qwSU4zTchba6M1pneRmtzoQJ
         YsctYHETgjJqHSzu2TbdbMe20eIv3tvDrsA5wkUp2oshe84dBRdblvHrL731MStXvmsO
         wMGTPDyNDlvvJztSRKMQ8lBRP8F3m6IT2cntoa+39XQ1gFKaDqG8YIwxgvzdU1Jg9Pik
         +8IcRIh12dZ6vF844Ebxu/1hDKPFrgfSPxWmtKAFP3JxfmWOY8axs/IKgu8E7XcRBvBP
         85VIgKoGSbETthSb5pTq0y/RYesKmo2AVrXnLQQi8u3YnqO8hiQu4yDGF6zf0vq7+i9M
         Qp5Q==
X-Gm-Message-State: AOJu0YztpU3ABnZDVSkJaSsukgGzk79YCAM3u4+gK91YpiGXgg0hXSJL
	3DowmQW43hgWfpSIZOOsoF+aIg==
X-Google-Smtp-Source: AGHT+IFVGSGWzV2Nk5abJTsBLjnttS05N2wFp85PjCkHQOAwQbKVVnCvVck7KrGQlppIg477ctFxeg==
X-Received: by 2002:a17:906:a856:b0:9e0:4910:166a with SMTP id dx22-20020a170906a85600b009e04910166amr2681680ejb.32.1702032727601;
        Fri, 08 Dec 2023 02:52:07 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id tx17-20020a1709078e9100b00a1b75e0e061sm849976ejc.130.2023.12.08.02.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 02:52:07 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/4] arm64: dts: qcom: sm8150: add necessary ref clock to PCIe
Date: Fri,  8 Dec 2023 11:51:55 +0100
Message-Id: <20231208105155.36097-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231208105155.36097-1-krzysztof.kozlowski@linaro.org>
References: <20231208105155.36097-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCIe nodes should get the ref clock, according to information from
Qualcomm.

Link: https://lore.kernel.org/all/20231121065440.GB3315@thinkpad/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Patch should go via Qcom tree, if the bindings get accepted.

Changes in v3:
1. New patch
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 5edc557ba04a..22ee3cd5549d 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -1858,14 +1858,16 @@ pcie0: pci@1c00000 {
 				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
 				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
 				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
-				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>;
+				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "pipe",
 				      "aux",
 				      "cfg",
 				      "bus_master",
 				      "bus_slave",
 				      "slave_q2a",
-				      "tbu";
+				      "tbu",
+				      "ref";
 
 			iommu-map = <0x0   &apps_smmu 0x1d80 0x1>,
 				    <0x100 &apps_smmu 0x1d81 0x1>;
@@ -1949,14 +1951,16 @@ pcie1: pci@1c08000 {
 				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
 				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
 				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
-				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>;
+				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
 			clock-names = "pipe",
 				      "aux",
 				      "cfg",
 				      "bus_master",
 				      "bus_slave",
 				      "slave_q2a",
-				      "tbu";
+				      "tbu",
+				      "ref";
 
 			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
 			assigned-clock-rates = <19200000>;
-- 
2.34.1


