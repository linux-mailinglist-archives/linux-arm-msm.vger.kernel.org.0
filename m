Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC7952F2C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 20:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352809AbiETSb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 14:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352761AbiETSb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 14:31:57 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ACEA3B028
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:31:29 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id h8so10558704ljb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NdSvHfXJPo04rlWXmRuhXyu21lDLotG2rBlKXKJ11GQ=;
        b=EEwTuALcxRNmSVRNDadTU1k+Ae9oz3bcn1BfXl16XqaEFPZVWbIbgCDscVm/NO5qHB
         angznNMlHmZydT81JVc1NojEbI5k1w1e3xnk5V9CBTo2V4NKE3EIY9KVTOgiwx0GSq+G
         VUxjzthgCUD6Cd6rQjLwIQkTS00W7dg80uh+h2pSG49dsET0GE5Ls7secTEa4PXA2R7X
         TlCupT8U4phL03A6yzAapfF7GlMz6sfcetNyQX8b7o/m6MErHsVeDc5nOtbDeIpGbIEE
         2oPN2GS8zXj49vrGuoXnMVjALYQLbMsJrymnP18PT/lN3CnTDzo7GIeNPLmtkRZ71Jyy
         DFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NdSvHfXJPo04rlWXmRuhXyu21lDLotG2rBlKXKJ11GQ=;
        b=mgrGNY2ayaY478upcD5lBsDYYTqimQjDGORtgknXh3KDSa71bGZ0szf2crg28MpOjE
         pZcZPjjVlJekTJVJyOpzyBC2jyAu9TOaQre/HK4NUEEjMyj2qjCgXpSFegFQFa9E6W5Y
         JN+svSoEe69IcvMGU/+ga1s/VvX4VLJ/7EODPgnWRQuXzJw+xAaT50w8+ImBQYNb/CNv
         RJVpg0e9XAIKrL4CEi2cPikFApme/rJ84ve4RjoHIqu4Tjid0v7qRj+fp3JcQ3e9uPFj
         KXoTAXDo+uLCu38FHQl6juusSSJKXhn+WfPeeIV3qWV+dXUclri/GZs5ZDZQB0DYmDZx
         Dogg==
X-Gm-Message-State: AOAM5315PulBBy6sVFTfH9F6JpGfAaaDY3YO5filY4kK1KdWyYqEwDfv
        7CnMKbkArXihnuD23jxQzyK/Rw==
X-Google-Smtp-Source: ABdhPJy4OGzYU700BuclxX8ZOeJt4SOdbuuh9c2d8gLYg6uy/uvkKWiN4PxVlN3oT9Dgp5TNrXGccQ==
X-Received: by 2002:a05:651c:158b:b0:250:a056:7e48 with SMTP id h11-20020a05651c158b00b00250a0567e48mr6320959ljq.64.1653071488068;
        Fri, 20 May 2022 11:31:28 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9556000000b0024f3d1daef4sm392951ljh.124.2022.05.20.11.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 11:31:27 -0700 (PDT)
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
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v11 6/7] arm64: dts: qcom: sm8250: provide additional MSI interrupts
Date:   Fri, 20 May 2022 21:31:13 +0300
Message-Id: <20220520183114.1356599-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520183114.1356599-1-dmitry.baryshkov@linaro.org>
References: <20220520183114.1356599-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
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

