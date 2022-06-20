Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE01C551743
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 13:20:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241668AbiFTLUf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 07:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241503AbiFTLU2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 07:20:28 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFBB313F0A
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:20:26 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id v8so11523783ljj.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 04:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pC4EIqDh/2k4QfHSQk4lkvNH/kEKDI9RyvpXo+8JMnk=;
        b=qvgprPeYjc4T6Fuv5W88SGtbkrLVcRbKhLyicrX5AM++o1W/a9uRKu3zVq3HBp+NS8
         kzdMc86E5BW3BHI4uXc2qzi9nnxoD5LDjKZu6OA0S/e77WDQzIhat8U5T92lqS6ziQEZ
         pg+QoMAUzSuQaM91rsZjzjgMNUpLTpWWm7xLuCk+LebB4hv/7VGV0gDcF/7+WBTXpBqa
         e4QC0/OHaJN/3P7i+fFoyxgg/SDgDLGZYHDeInXQW/I0n8j1ZsWdRYoWxFvcswL0OhdE
         hGY1fC5F1UJhJYzjbJcrkuUH4cQH5Wagipq4kV1Pi4/XsBFhV1iBOnMrNOHKE9QSkQgG
         JJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pC4EIqDh/2k4QfHSQk4lkvNH/kEKDI9RyvpXo+8JMnk=;
        b=Nyj84RGqV+A2i58+5msYH4as+4/xdcLBFRlZW+ak7vxpN900QhVSQed404eNIONVSm
         btDg3fMrNkm/0MufLeYo8wBhrb0+4b9PkgHPdStFnmxmTY5r7zonhh7SsDPEh5KWnlUo
         bOjIJmsNENSgKOpYdFCouR1ybQ5qf3T+Ue/l3/NrnhA/tGITOO7q14N9L0EzLI83tH8S
         Xejo5pPY+Zjy3skvK2M6c7AdkfksLaZteer4C3wMJPNnIev7FdZtSX2NSGZaLpRFbBua
         0weGI73R71ICwHCg7qip4UXB536lcI8yQJJSY+tqRuUJNdD//4ORvwRv3DqzYuRY0LsT
         jd/A==
X-Gm-Message-State: AJIora9g56wzFqr26kBXWmCjwmRJ0cWEExiZmrLS/kYhR9VE3Dv2+ITO
        eCyeXE04uyumWK4GkBgnq++Clg==
X-Google-Smtp-Source: AGRyM1vN1vaAuE6DNZ02IPR9GXltrH5BY0uR8B48BlR9k8Ne4mkuKP4wulgWDR5tWYEefLRSt9VY7w==
X-Received: by 2002:a2e:bc1a:0:b0:25a:45c0:1848 with SMTP id b26-20020a2ebc1a000000b0025a45c01848mr11970022ljf.255.1655724025215;
        Mon, 20 Jun 2022 04:20:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o23-20020ac24e97000000b00478f5d3de95sm1727270lfr.120.2022.06.20.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 04:20:23 -0700 (PDT)
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
Subject: [PATCH v15 6/7] arm64: dts: qcom: sm8250: provide additional MSI interrupts
Date:   Mon, 20 Jun 2022 14:20:14 +0300
Message-Id: <20220620112015.1600380-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220620112015.1600380-1-dmitry.baryshkov@linaro.org>
References: <20220620112015.1600380-1-dmitry.baryshkov@linaro.org>
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
index 0147fa9ee475..0fa17ccfb0ab 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1808,8 +1808,16 @@ pcie0: pci@1c00000 {
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

