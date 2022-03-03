Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5ABB4CB989
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Mar 2022 09:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231628AbiCCIt6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Mar 2022 03:49:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231659AbiCCItv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Mar 2022 03:49:51 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801E9175871
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Mar 2022 00:49:04 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id 9so3456364ily.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Mar 2022 00:49:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmDFo76a8otWYPkle6/ziOHDKrQe2qvu7laZ0IuPxgk=;
        b=pEPvESRJI48xS2elV5WAwPdzq79lbuEX0mJMGOriSO2nx/CR9KcY4gtRcZepohg2Vm
         BQBqoDoc6A1EDnx683AOSc6TEv2MQduvgU6B4SMpIT7sKJ2Ja0Mw9FHvxtWOdm8fxpeY
         2TNy82FUU+ChydePWan1n1msrKN3Wb3W2gGBFrOde4UtzJZ1H2+WN70JFuuYYFOcJyFp
         DBsE7HV41lMc5dJ3gjQSreUppJok52JBMYaXYd7mIVLjz1tZ0EUuCSD50wSAmqg8YFb0
         B4pd/xvHWSehk93qJXPdKMbd9wfke7hIN0tCQlkhSimcZHHPYkD0Tfs46YYI2qSbuLDe
         vzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmDFo76a8otWYPkle6/ziOHDKrQe2qvu7laZ0IuPxgk=;
        b=WuQTFL2mtNVAmrZaURiKK9ua3FtEnorBz7GDa8lkuLbz296t7hU1TkYzdRY3wbFmx5
         ++daDgmDSHPpiPMoRWmXLoFMK1gMFp5L3yGvdq4U/P7XHU6mihpgfDjxdhqhakpnNeSq
         /D2OKJN9snnJz7agGM1v1se1bRGb14gl6ffWPa8zDa1stoL+eQ4r0hgvHGa/K/1lZHDw
         geIMnpRmnT4/+bhzmngo7NHtwrv2EdI6L5C2b1Q3E0MQ/Ee/5F4T4Zpf/mo4TZB7NibR
         +cQ3vwflgAPwleH74pUtawdsZYl6AqZUa6BT/lIe7cUYKmi8wTbQxtVovTtEQKV01+Sh
         vNAA==
X-Gm-Message-State: AOAM530lt9GkG17pkfwNGf775BcXdXyhZxWol+KKsJaj4GIsb8Qcou2W
        itsOktawBQWh2pKSKZulrBpiPvPzllDoUg==
X-Google-Smtp-Source: ABdhPJy0qRkKTXUocNRK9zJolxu1WKIs0inaCacjClcTk+OetAPbdiTI3xUT1LzoDW6O8+WuN1ZiZA==
X-Received: by 2002:a92:c246:0:b0:2c2:740d:1c12 with SMTP id k6-20020a92c246000000b002c2740d1c12mr29753994ilo.55.1646297343663;
        Thu, 03 Mar 2022 00:49:03 -0800 (PST)
Received: from localhost.localdomain ([182.64.85.91])
        by smtp.gmail.com with ESMTPSA id m9-20020a923f09000000b002c2a1a3a888sm1480704ila.50.2022.03.03.00.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 00:49:03 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, bjorn.andersson@linaro.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 5/6] arm64: dts: qcom: sm8150: add ethernet node
Date:   Thu,  3 Mar 2022 14:18:23 +0530
Message-Id: <20220303084824.284946-6-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
References: <20220303084824.284946-1-bhupesh.sharma@linaro.org>
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
index 6012322a5984..2ed231767535 100644
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
2.35.1

