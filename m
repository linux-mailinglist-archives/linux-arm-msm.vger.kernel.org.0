Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A638D6ECBE3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Apr 2023 14:14:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbjDXMOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Apr 2023 08:14:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231800AbjDXMOM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Apr 2023 08:14:12 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A7872D76
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 05:14:09 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2a8b766322bso41149901fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Apr 2023 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1682338447; x=1684930447;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cSg+Sr4Izv6SuaT8Bc0GsU3O/zi4zb4SC3eF1z+OThY=;
        b=DnyhHHIEm7sOXD8G9rdXFjq+JJGE0aolitslG+kUVa5NShlUFkU/gQb74Na0IBX0T/
         +vyjyltyk4uLFEPmQBVEQBbc8n4Jp53+hpkP9c+5197U2HDW1wHvl623oLJDOUDWAEIs
         O8ZNxzwVmB9VWKisLIAKF9+Y0LEFm5DR0QtzlIRIDm5lDOlib8OJd/DwA1lhzhtOrLcc
         FJbkhhR1dUHCQ0fxNQpJEUjBmOe0AIPIRDTf/v7t0tT4Pw9Omhsgb7013aSs8ki/d230
         Ng3PdOOadNeA8QUZojqMiMqnFDwwrQh3p7YOwNrlMR7Xd4GJ8+T7My7GIH/JDGkoifqM
         4P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682338447; x=1684930447;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cSg+Sr4Izv6SuaT8Bc0GsU3O/zi4zb4SC3eF1z+OThY=;
        b=bBpNWOEkB+wo2AFdeyy/bOibiv6yZ56JKwPTK9C0r92Qg2UiwiHHLE4sitksPTjhq5
         z56dLHfwCwI9rGf7AkwyCEGG6cXU32gULnjrhspW6EeEjQA/4ov0a6QKsMj34Irxx30U
         Q7Ul4wisInfGGTOsx2DsUXJs4sLmZreHVIlDe1oTfywxSFuqTnPgNltfe+sbQXtSKew4
         TayXkIBPXK+UmfzmISPlUYX6+3a957+V6EOk7ZDvTr5k8ORtFKjAuDCBKg+IFGO1VhF+
         rvPmJaSrJgAs38kaosUaL0P6YvyjAaUSM20tHm6TdDk/ECCWnj0xK0K6zwyPuFo0DDJF
         b83Q==
X-Gm-Message-State: AAQBX9eigth3LluLVkPedBsdhNbUQ8MBLsQ8B/VUbHvk5JZhy8IDvpbC
        rZaB6dHkoKTU3+xo2CVSwzDIFQ==
X-Google-Smtp-Source: AKy350aqa3hL84PCEAOSmwTnpLJXRUDhws2ye0MyTd3kcxq8Q2zZlZqvrmn88+r0T9u3JCEatIzbiA==
X-Received: by 2002:a2e:a3d6:0:b0:2aa:44ae:45a with SMTP id w22-20020a2ea3d6000000b002aa44ae045amr2102991lje.13.1682338447334;
        Mon, 24 Apr 2023 05:14:07 -0700 (PDT)
Received: from mantas-MS-7994.8devices.com ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id x23-20020a2e7c17000000b002a5f554d263sm1732382ljc.46.2023.04.24.05.14.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2023 05:14:07 -0700 (PDT)
From:   Mantas Pucka <mantas@8devices.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc:     Abhishek Sahu <absahu@codeaurora.org>,
        Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>,
        Sricharan R <sricharan@codeaurora.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Mantas Pucka <mantas@8devices.com>
Subject: [PATCH 3/3] arm64: dts: qcom: ipq6018: add SDHCI node
Date:   Mon, 24 Apr 2023 15:13:32 +0300
Message-Id: <1682338412-15420-3-git-send-email-mantas@8devices.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1682338412-15420-1-git-send-email-mantas@8devices.com>
References: <1682338412-15420-1-git-send-email-mantas@8devices.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ6018 has one SD/eMMC controller, add node for it.

Signed-off-by: Mantas Pucka <mantas@8devices.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9ff4e9d45065..b129b23d68b1 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -414,6 +414,29 @@
 			};
 		};
 
+		sdhc_1: mmc@7804000 {
+			compatible = "qcom,ipq6018-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x07804000 0x0 0x1000>,
+			      <0x0 0x07805000 0x0 0x1000>,
+			      <0x0 0x07808000 0x0 0x2000>;
+			reg-names = "hc", "cqhci", "ice";
+
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq", "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo>,
+				 <&gcc GCC_SDCC1_ICE_CORE_CLK>;
+			clock-names = "iface", "core", "xo", "ice";
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+			supports-cqe;
+			bus-width = <8>;
+			status = "disabled";
+		};
+
 		blsp_dma: dma-controller@7884000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x0 0x07884000 0x0 0x2b000>;
-- 
2.7.4

