Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B15735659C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 17:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbiGDP2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 11:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234293AbiGDP1y (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 11:27:54 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 502C5FD38
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 08:27:53 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id f39so16376050lfv.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 08:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5MgE6HU68Gl0JS97jw9dEMrCc1kfAF4oW2i80S/99yM=;
        b=CMD5BK10AzEqh44ftduc4JEXDWJt4wX2+RpPkYt1Pb7p6pRUIfCr+C12JYSzp+wCD1
         ddhPCK/4vpGvDj/gUTJtSpMPVATE0r1vEsuk5ed+620QEwCgGkn0UIgTOnVKZ5bzHWDo
         8hCo2pXRtt72fUvhWgcJlqcNhXRzCo094yfFkmAozp3gXzaeI9hQlIsIDDHJuU087Vrx
         Ol5VLuGeThIGuVOxptUjw8VC/ANsSGG4FhZhbWYnXbtG0RaGNlJ0vyWYgHkArggJDG1t
         hRBJcfPBSwerlkkFGSFRjuodzaHHGb6Fn/NH0Nni0SdY7ol5rqZm7Lrvm9kWTl/rAlWE
         eIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5MgE6HU68Gl0JS97jw9dEMrCc1kfAF4oW2i80S/99yM=;
        b=3Q3zNeLRJX9k0BJWuSa8jmJN0uTLMYMphx0yYOcyKhwz7jnUc/VzvjU6/bOrxtI3yf
         SKPN5wVowwJrQfqtjBphTZ/QjYKvG8DElSlaLtc0I0F2o917k2jAti1uXcl0c40FDMwZ
         EY7TCSbGrOdmejmFQpFAg9lrl23+KBlUyotc07XAstrsQzRYs/nQslMd/OBuuRrfE4OV
         aavvhEmFFmGqVQd8hpThNq8hm6y/fstAHHK9OwgrEk+Bt2e0yVUDJraRaCpswxrLQRom
         na1oObW8nCWPtzTo86xDK7LEm+KUYPG5aCkKVQxd15GPPTzZYNWyqSxnVWQfzkrO6kGj
         dWjQ==
X-Gm-Message-State: AJIora8E+C48rB8WiaCUNn/W4CA8Aba4ezIS/ASv3VB0eGCjrDxF1C/h
        OACmgdes0i/SfvZgNyp3c6qd2A==
X-Google-Smtp-Source: AGRyM1t6UITxHaLuTEfbmVL8xdWsw1B9UvUeNYKkndooSXesx9Upovs6+kLWwC24bYBcNNpYPk1LrA==
X-Received: by 2002:a05:6512:15a8:b0:481:b03:2434 with SMTP id bp40-20020a05651215a800b004810b032434mr18752203lfb.621.1656948472901;
        Mon, 04 Jul 2022 08:27:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h14-20020a056512220e00b004786eb19049sm5175820lfu.24.2022.07.04.08.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 08:27:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v16 6/6] arm64: dts: qcom: sm8250: provide additional MSI interrupts
Date:   Mon,  4 Jul 2022 18:27:46 +0300
Message-Id: <20220704152746.807550-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704152746.807550-1-dmitry.baryshkov@linaro.org>
References: <20220704152746.807550-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On SM8250 each group of MSI interrupts is mapped to the separate host
interrupt. Describe each of interrupts in the device tree for PCIe0
host.

Tested on Qualcomm RB5 platform with first group of MSI interrupts being
used by the PME and attached ath11k WiFi chip using second group of MSI
interrupts.

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 43c2d04b226f..3d7bfcb80ea0 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1810,8 +1810,16 @@ pcie0: pci@1c00000 {
 			ranges = <0x01000000 0x0 0x60200000 0 0x60200000 0x0 0x100000>,
 				 <0x02000000 0x0 0x60300000 0 0x60300000 0x0 0x3d00000>;
 
-			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "msi";
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0", "msi1", "msi2", "msi3",
+					  "msi4", "msi5", "msi6", "msi7";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
 			interrupt-map = <0 0 0 1 &intc 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
-- 
2.35.1

