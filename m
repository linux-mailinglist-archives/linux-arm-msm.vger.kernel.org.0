Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36DD549D541
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jan 2022 23:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233421AbiAZWSh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 Jan 2022 17:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233209AbiAZWSd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 Jan 2022 17:18:33 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86502C061749
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:33 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id i65so913212pfc.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Jan 2022 14:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KBgdN+co4LtU7NMnSWz4acLWCwzrBClPTqWc7Je8BYw=;
        b=W5EEhqpRVGU9Y2o9POs6E2fLvEn4ZEaKOovkMSC/L9DlrDACAZfjiX+j2JZyzRXb10
         zJGyk5Tm1ucmLrFGvVFZ4KfK2/5pEViTk1+mGjRJ8TxmsbVjewwQxqwJmfrTkr9Pn0gO
         QuAJ2yDdJOXK7wOHf73RhGjr7n1wQkQVUMmw4hUoku+RPDsCOd7oiw0I80OsU/VL+DHH
         LVgjKC5bSIrcOuNlBTNQlM92ecZPT6Z+zAgu48F0eAd5shd7Qdy8l13k+ygHuU5A06uP
         TN9BK9JuG/6QW0m5wgieX1Re+W729+JGe48eVwOt0OAjqvcaAeDRgw9Pt7uhjCeJUmdI
         7fPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KBgdN+co4LtU7NMnSWz4acLWCwzrBClPTqWc7Je8BYw=;
        b=oHuPJJycFeO+/RU9tJFkuYiqU4UGZPz1X6g1yf3C6uDlnwKJPxfNs+5Sr35kJz0/f8
         0y1SOWkK+g2zdy/sODrZIwIgNSn8sw2H4xvXOLHqD/ujbwMcafc7u0ZNW8rDYay4v7OR
         BYAAXm4/0A0y35jfgXE+JstjJX2Gx7ap2HXIC4sRGr/JYPMDuWUIHQi7/CeJ/wcoIrCi
         YerP4LHKJLQY+Pa+v3P+llx5Of0bO6XzTaA5eoth0C/nqpk8ZLm8o++jZqGnCp0vJhhJ
         grY9kVl1lw0hfFJNvRpK0Ogb0kmxS40UBIgt7OueKm6LBMCgsLpRoNTggKH9q1aSBD7O
         uuVA==
X-Gm-Message-State: AOAM532xV3O6qA3VTENLJekyBwK7sEWrWDl/PilL5QM6Mk12IV4RxMMS
        DlvS9CriRihTISeZV5Mb+jr1pJ4Eu8K1O3T6
X-Google-Smtp-Source: ABdhPJyTGUsXNlI0HzeNM24QYSjBTru7XzxYUlqID7j3dzDzLhivwfjFLLdzVJo9LUgE9szmA7NYDw==
X-Received: by 2002:a62:cf81:: with SMTP id b123mr835238pfg.47.1643235512865;
        Wed, 26 Jan 2022 14:18:32 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1f3a:4e9b:8fa7:36dc:a805:c73f])
        by smtp.gmail.com with ESMTPSA id t17sm4233742pgm.69.2022.01.26.14.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jan 2022 14:18:32 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, agross@kernel.org, sboyd@kernel.org,
        tdas@codeaurora.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, bjorn.andersson@linaro.org,
        davem@davemloft.net, netdev@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 4/8] arm64: dts: qcom: sm8150: add ethernet node
Date:   Thu, 27 Jan 2022 03:47:21 +0530
Message-Id: <20220126221725.710167-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
References: <20220126221725.710167-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

SM8150 SoC supports ethqos ethernet controller so add the node for it

Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
[bhsharma: Correct ethernet interrupt numbers and add power-domain]
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index 463732bcfc07..70cf4651598a 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -915,6 +915,33 @@ gpi_dma0: dma-controller@800000 {
 			status = "disabled";
 		};
 
+		ethernet: ethernet@20000 {
+			compatible = "qcom,sm8150-ethqos";
+			reg = <0x0 0x00020000 0x0 0x10000>,
+			      <0x0 0x00036000 0x0 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+			clocks = <&gcc GCC_EMAC_AXI_CLK>,
+				<&gcc GCC_EMAC_SLV_AHB_CLK>,
+				<&gcc GCC_EMAC_PTP_CLK>,
+				<&gcc GCC_EMAC_RGMII_CLK>;
+			interrupts = <GIC_SPI 689 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			power-domains = <&gcc EMAC_GDSC>;
+			resets = <&gcc GCC_EMAC_BCR>;
+
+			iommus = <&apps_smmu 0x3C0 0x0>;
+
+			snps,tso;
+			rx-fifo-depth = <4096>;
+			tx-fifo-depth = <4096>;
+
+			status = "disabled";
+		};
+
+
 		qupv3_id_0: geniqup@8c0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x008c0000 0x0 0x6000>;
-- 
2.34.1

