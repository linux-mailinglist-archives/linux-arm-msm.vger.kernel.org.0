Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0AA2EA800
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 10:50:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727764AbhAEJtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 04:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728765AbhAEJsv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 04:48:51 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 281C2C061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Jan 2021 01:47:26 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id t8so18075241pfg.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Jan 2021 01:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ShXu7/U7Beq0uWc9RaEN3HI3oScB32KORyGyOVEnVV0=;
        b=L7g9QoMhsM/md3H09TU/qGKLV6n/fvcMcaIst+541H1zvXZzIDdYziOSFMDCX0dZz1
         74GHHV0h0ZRnjOiZUNkfZlMmDT7ocfRKvyolc8pifvHNLgm3vHzrqDyEw8e+qfyyiFCI
         KqTlVIvbs5U8y31sxrbsloQi7gj8hlbz5ANitzbFNGU+86BpTwnhx6OfiwY10iZADxn6
         kHbyjXg8TY7Jb/NnvqpZKNtFX+oK9NSe0yzZZ1pEMUju7zW/lek6xTNNpWWuW/aPNatY
         /ocVvr+VSLe/+JIGc1GzTod37CmtdjdkZ4EkorcOnoyypSdryJTdsz7HpQmgHYSDIWxU
         hsJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ShXu7/U7Beq0uWc9RaEN3HI3oScB32KORyGyOVEnVV0=;
        b=rr3bXnlApGIrI5YD2L1D7+OisGodepQYFOnZ7NJm6ll+M419+RTm3LQscgWyNVlQaL
         dOVMntk1DIzN/jSrhkQ2HbzGSZCxX7BKVI8WkFme4oP/yCrzRNF4SyCAjlKNNrE5bEoq
         HQA447CCKGiJQdmOwSTwDzh9V/CFeoBYlKOO0PS25qh8GGXLg4oEp7Ng4SC9DZVs/z8p
         S5H/3a9AQ4uOhRbs2bgpLvqCf+P0cm1I+QIYCxsheepB36YA9id8ZSMGz5KheKhTLkbD
         tgQyoKlNF6PBKcQmRUNme6bRnTH2we6Pfl7xJJdxLHye8bNcwP14VIGrRDqzvwJVyo2j
         Te4Q==
X-Gm-Message-State: AOAM532FSKAqbZtd6zD2BNDC2iL/Q68ggMMwc67blEjAcF1HR98fphfL
        wF1v2LRQiOmER5bh6ir2eRqh
X-Google-Smtp-Source: ABdhPJxELuUoNRACruwC2BnEkNekuLylw3gP4BzwYrKw7zVoF0qPZ8uVrnGprcjbw2PRLHCacLXhIw==
X-Received: by 2002:a63:6241:: with SMTP id w62mr75713052pgb.67.1609840045688;
        Tue, 05 Jan 2021 01:47:25 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id f64sm60073921pfb.146.2021.01.05.01.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 01:47:25 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 13/18] ARM: dts: qcom: sdx55: Add spmi node
Date:   Tue,  5 Jan 2021 15:16:31 +0530
Message-Id: <20210105094636.10301-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
References: <20210105094636.10301-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

This adds SPMI node to SDX55 dts.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/qcom-sdx55.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
index 1a6947753972..f3864471ba4c 100644
--- a/arch/arm/boot/dts/qcom-sdx55.dtsi
+++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
@@ -226,6 +226,25 @@ pdc: interrupt-controller@b210000 {
 			interrupt-controller;
 		};
 
+		spmi_bus: qcom,spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0c440000 0x0000d00>,
+			      <0x0c600000 0x2000000>,
+			      <0x0e600000 0x0100000>,
+			      <0x0e700000 0x00a0000>,
+			      <0x0c40a000 0x0000700>;
+			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
+			interrupt-names = "periph_irq";
+			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			qcom,ee = <0>;
+			qcom,channel = <0>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			cell-index = <0>;
+		};
+
 		tlmm: pinctrl@f100000 {
 			compatible = "qcom,sdx55-pinctrl";
 			reg = <0xf100000 0x300000>;
-- 
2.25.1

