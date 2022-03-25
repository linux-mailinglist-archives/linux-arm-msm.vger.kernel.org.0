Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E71044E7900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Mar 2022 17:36:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376381AbiCYQhb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Mar 2022 12:37:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359165AbiCYQha (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Mar 2022 12:37:30 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D24CB60A9F
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 09:35:55 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id q11so8576370pln.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Mar 2022 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04bZ9l2OKVtfN4Urve70oIr9AZ8XOtSj5lg9hqy/gnE=;
        b=iFDs5Id5VD5k6hsPSJH29huaEDAR8cn8C3MwuTRBTIR0IpLn/rWnNtU4f2b3E7G4OC
         InZOXxCieQdNzNhNTz4wg0bZ/pEKb5VMsxZbr7Xvelbs1t6m/fSrsEvXSZEGXmy+pPTm
         K7DCl8ZDxDcTLDWrSfS45Ne7XRq/xY33KaMi0jJS/70m+kMWLt7FN8fAe/hawW+Z53mO
         ALdMKn53561aYVc7DowPmx7eu7QhQ++MMq2n07gRaeZ6xs3fUZ/u2POmqlr35h4FQALt
         +8JiVMFmXgnG+kaOqKGt6miiDAYaVr91eB2lUUtj1rJT8doCNRoJCFm4+N6kKsCmyniE
         vnQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04bZ9l2OKVtfN4Urve70oIr9AZ8XOtSj5lg9hqy/gnE=;
        b=QS+wKwYDoroRpuiVPkvQgb2HRQHZAJzLA8SjJj7VmOkX3WqgweZ3iBKCU7VftFKcUa
         gjIpDqPs2aJFYKdmzug2VSYq2OFw0LOTsJrHVsHLYltiKNTjBL1nmoRhCE21jakw1rbn
         HXhFKYHreaAlJuQuWhKMCdS26WiSiWprSirDxKdMZYqme7LDsWXKmp4DhPMS04tjueYN
         /PkHIl65aqegHB53LxqUm28rWrE6Urk+77oQHLDgnisn4f8h7+hDfr8Fr5w4R29Zxiau
         372IR3iZrhXb/bcQs3yscP4UMaF5FbeQ+SoQczNmDdT+HgMlAfiRaiDU7Ww8ucZAtQT6
         duiw==
X-Gm-Message-State: AOAM530tL8eyc/OfDeI+OfKYOdtKo4l/t/aKj3DSI5wCXfTsl4sdeNmz
        vhUUgfPt+np0LGYzMT9wVuadczKlkbQ8Dg==
X-Google-Smtp-Source: ABdhPJxO/yWk7yYNVZDfTf1TBINSbNDhDNnV/sXkdPgDHGtU4vUS5etlY89aEMtu1PjfCzfH5Zt1Pg==
X-Received: by 2002:a17:902:f243:b0:154:57eb:c748 with SMTP id j3-20020a170902f24300b0015457ebc748mr12434732plc.164.1648226155153;
        Fri, 25 Mar 2022 09:35:55 -0700 (PDT)
Received: from localhost.localdomain ([223.233.78.42])
        by smtp.gmail.com with ESMTPSA id j6-20020a17090a588600b001c699d77503sm6264948pji.2.2022.03.25.09.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 09:35:54 -0700 (PDT)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, bhupesh.linux@gmail.com,
        agross@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        bjorn.andersson@linaro.org, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v4 1/2] arm64: dts: qcom: sm8150: add ethernet node
Date:   Fri, 25 Mar 2022 22:05:36 +0530
Message-Id: <20220325163537.1579969-2-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325163537.1579969-1-bhupesh.sharma@linaro.org>
References: <20220325163537.1579969-1-bhupesh.sharma@linaro.org>
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
index 15f3bf2e7ea0..915c8353feb4 100644
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

