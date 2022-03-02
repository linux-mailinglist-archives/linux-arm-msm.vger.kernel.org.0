Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B93174CA2C6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Mar 2022 12:06:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241294AbiCBLGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Mar 2022 06:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241266AbiCBLGf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Mar 2022 06:06:35 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E9791AEB
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Mar 2022 03:05:49 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id e13so1265489plh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Mar 2022 03:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vmDFo76a8otWYPkle6/ziOHDKrQe2qvu7laZ0IuPxgk=;
        b=IzpfZk50nXuiVWgNMU72JSSGrmI9Qt1iKGALVQkGV8dBZJpTQUW0eOWvJ5Stmxgo93
         rdAZG/lvGUdWsKuepZ3mR7eQYZav1EoB4LjL0OyxAIRB04RI+uf5Qm/rMXYhJelVMmzA
         pBHGuT5c1wZ7QYFVvIaiVWX8utoBS9RgPkJPpPwkQCWJRNnktAN3PvHrjAuXsgyomg2/
         lCzI1yuS0s7RVQFcqUcntBVJGBy4QG4S7BitPN4HXwnDqcotd2f2s4Cf9Kna4J7DCU78
         JPlMAk6yEKY1TIUaq9KlVPXlz4v9qcOsprprhKG5DuFt8SfZkAoyOEjAc7XlHsc7VN0z
         +qbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vmDFo76a8otWYPkle6/ziOHDKrQe2qvu7laZ0IuPxgk=;
        b=7bZj96vp0U3SAzqBfiASzXCd4vP4liaPJEPcW/Vz+rd9budiNeKdOcu4CW0pCU8s8h
         Jyz/a5TtMUFO+Z0YJGMsIYJbBdptzTaS0BIH8wZ0Q4VPBHM3L/F7k+mxMl0/139INHsw
         PbwJHkAsgPblY9Hx1AZHLHuf4bsjwlxudI6xKfqrCurnySOLa39kz74C/HdtIyOhr18X
         PacUMttdzj3cfCHYlS56VBP5J4+OeKbWA+1pp6LDaQP1TNvb47sqME02S1edUS1KScm2
         Hh2hKP9jA+RyuZ5Kjr5fRqzQzvzvqfo00tSDZX+PbC7uAkV+k2xOEtQQLDzaDtI3QMEG
         L2rw==
X-Gm-Message-State: AOAM532fCzLEvmKOYHXlCJI08Z5vfzlDiGwrBYCmps61ZTaKzg4jx02n
        UoxH1b6I2O4vp/sfESyiPDGIFW3IX7WgfQ==
X-Google-Smtp-Source: ABdhPJxoUZGbwWKrd44OrQlUtT7O1K8fuDhbVMyfeMvTHmOKBbYfk2J0LIulRhny4EvTsNQ1UAv1Wg==
X-Received: by 2002:a17:90a:4b45:b0:1be:da4b:a56a with SMTP id o5-20020a17090a4b4500b001beda4ba56amr8115077pjl.82.1646219148073;
        Wed, 02 Mar 2022 03:05:48 -0800 (PST)
Received: from localhost.localdomain ([171.50.175.145])
        by smtp.gmail.com with ESMTPSA id hk1-20020a17090b224100b001b8cff17f89sm5049186pjb.12.2022.03.02.03.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 03:05:47 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, sboyd@kernel.org, tdas@codeaurora.org,
        mturquette@baylibre.com, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 4/5] arm64: dts: qcom: sm8150: add ethernet node
Date:   Wed,  2 Mar 2022 16:35:07 +0530
Message-Id: <20220302110508.69053-5-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
References: <20220302110508.69053-1-bhupesh.sharma@linaro.org>
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

