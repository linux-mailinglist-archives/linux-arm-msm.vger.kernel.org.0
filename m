Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C3B5262DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 15:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380644AbiEMNRP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 09:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380648AbiEMNRJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 09:17:09 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F875E0C4
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:17:08 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h29so14512126lfj.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 06:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yqdAfmtIDWHLF/VJbRu/tBP/l22n+nezjJyshDnmIDw=;
        b=cj2uBsbU8AWmv9OPTvRIlBu7taCtdFsVqWGmyf9sNXxollW8058dCw94vzS8sHhYn3
         ndUPYVbNJlAkhACzNBNvN8P6hsmm1DmAIPEnc5IJAPCULjCTtujcrdbrer5gX/VuqC8y
         Pg9C6k9J4dEqSwwkrPbkCEPisSwAFYCFkzkJkHrro38yErbWU5LQ2NqPIuGDRqvb68F/
         jQCqZaz8EKkvqY5ZaF4JLzVmhisix+oElmmwFhArhwi8dzPdQ6iMCZOIKfBTAt3uZgZG
         xKLYwjyUSeGFbl2FiC3TQtAe7W9j0Zsv/LuMFDLGjAvwl8zKm7Bk13ie6wK4BY1idxKZ
         iN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yqdAfmtIDWHLF/VJbRu/tBP/l22n+nezjJyshDnmIDw=;
        b=tqcKqsn18HhW/aYscT6QAv4TVmInH3+A8EoyuvKKrqdXCwIENh2GJk2HYMJaN89w44
         Q7QjmwA+GKqOZ8zkSnU6h57kxYvxYPLodrD5VUEh4j/SyPBaZ8/Smpsoto6/24TJMbmH
         gtjIRzEJYFEE7FNx4lM49YJmx4xmzYtjnNt0+kxvs19ZFBhT4JbKyEyag+prQhhCGswd
         eZXNt7d4THMbYW5l0mzxgr4vfCnnNZbB8v1p91v2OILGfw/aJzTAAEJQd6eYwntwZYnS
         E2bGA8RUgcwkloSHjTJRRW415LYpF/66zpSMP/qNZsWNcW5Wp8SVdP6LFyyvQ3xrROSc
         Mhpw==
X-Gm-Message-State: AOAM533prft+iljusAmnSFC/qXAfNFmgS6TkbDO7UbQyO1wG5u1R24Qb
        QM+X9T0B7k9xABVMeN4g4BcK5w==
X-Google-Smtp-Source: ABdhPJz7658XluON6oKg1AsH1HZAUt/bIHXeQY8K5sd4ekrVYi2AuRG2hwy5CzeHZnZfX8HRiw8oqA==
X-Received: by 2002:a05:6512:3b0f:b0:473:9dbb:a72c with SMTP id f15-20020a0565123b0f00b004739dbba72cmr3363370lfv.399.1652447826408;
        Fri, 13 May 2022 06:17:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u22-20020a2ea176000000b0024f3d1dae8fsm436991ljl.23.2022.05.13.06.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 06:17:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 10/10] arm64: dts: qcom: sm8250: provide additional MSI interrupts
Date:   Fri, 13 May 2022 16:16:55 +0300
Message-Id: <20220513131655.2927616-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220513131655.2927616-1-dmitry.baryshkov@linaro.org>
References: <20220513131655.2927616-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 410272a1e19b..523a035ffc5f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1807,8 +1807,16 @@ pcie0: pci@1c00000 {
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

