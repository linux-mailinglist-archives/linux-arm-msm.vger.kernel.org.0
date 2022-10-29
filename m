Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E96FD612064
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 07:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiJ2FPt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 01:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiJ2FPe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 01:15:34 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB0C2D8EFE
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:30 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id g129so6506158pgc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 22:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP7gKJEnRLPQX8LHnYkF6JBv/NDORO6b+eeedw/waq8=;
        b=Axg7TGotGyn7k8aGjCb71M3oWjFr7DHM06AkL471EdFh/1FkXrWac5iEnOfl+/cMXp
         RE8mklO7EVC9BnDNsiwwn31Z+YJ6Zgkc7cxcwKQvJu5Spcw3t8AZsIbXn5/d2OVgzNR8
         9xl1RXVhpoN5Of1ur24IRlpDvR3XC3nNWmoozBfg6QWprIcyYxcToEoH958Sy7Cfolbo
         IACx5SRpRnqFWOKIpBameVC/QTgxyP60SStvJifZeh2yn13HhbZb2sWHIPEe/ora5IXD
         uQG6lh1QtKfeJnZpicY7pqcpJt1v21K83OVthxBuTW5yl9Z9R+ulTQynGZPaB01R0cPT
         LFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dP7gKJEnRLPQX8LHnYkF6JBv/NDORO6b+eeedw/waq8=;
        b=ZDATYs5Q/xOnUtonsThaGlHJl6SOFlQqh5s2RgTBb8Q0KsjivgQ0Pgr5YKndAxZ2RM
         7zBYUecDrwz6DsczaKmugKQoWtj/WrC0dYMly1uxsBQAtVJe7K4qQTd8qGSQXLWAKz55
         ORi7QbrQ2ONz6/9QANxwCs2CrXgB1tdNGrAuy0k+vydkmj/NqC5/dhrT4P7CiED7U3gd
         ubCt1pMWFMQbcLgusimDi/UEeUO4UUcHUqFXtlDsKcwlZGOR1pcxAreRcrAsLYMcbM+2
         0QzuhquQEFlY7+WPDE50ldqsnD+PckUr8LFySSzoBH2e1ftvErzeOkLiBEDR/RhFZk4B
         3LpA==
X-Gm-Message-State: ACrzQf0gGo+pnijFJrH+t0VrkITBi4gx3eMTkFyDPnzw2k7ueOJFubwM
        4afucX7bcw0V6VHcFNm0DyV/
X-Google-Smtp-Source: AMsMyM53L8+5me23k36tNwbqKhP5jxGXxdpRgTB0eqtnitZ8clokbB+en/jQ3HVh1qgjp3pi01o7QA==
X-Received: by 2002:a65:57cd:0:b0:46e:ca52:f6a9 with SMTP id q13-20020a6557cd000000b0046eca52f6a9mr2621739pgr.269.1667020530129;
        Fri, 28 Oct 2022 22:15:30 -0700 (PDT)
Received: from localhost.localdomain ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id f5-20020a170902ce8500b0017e9b820a1asm363150plg.100.2022.10.28.22.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 22:15:29 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org
Cc:     konrad.dybcio@somainline.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, johan+linaro@kernel.org,
        quic_jprakash@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        steev@kali.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 05/12] arm64: dts: qcom: sc8280xp-pmics: Add PMK8280 ADC7 block
Date:   Sat, 29 Oct 2022 10:44:42 +0530
Message-Id: <20221029051449.30678-6-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
References: <20221029051449.30678-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for ADC7 block available in PMK8280 for reading the
temperature via the AMUX pins.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
index 4a3464f5e6e9..3c56e4cb5b5b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-pmics.dtsi
@@ -75,6 +75,15 @@ pmk8280_pon_resin: resin {
 				status = "disabled";
 			};
 		};
+
+		pmk8280_vadc: adc@3100 {
+			compatible = "qcom,spmi-adc7";
+			reg = <0x3100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
+			#io-channel-cells = <1>;
+		};
 	};
 
 	pmc8280_1: pmic@1 {
-- 
2.25.1

