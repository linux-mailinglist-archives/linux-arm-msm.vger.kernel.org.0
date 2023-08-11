Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD8B778C99
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 13:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbjHKLCE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 07:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235371AbjHKLB6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 07:01:58 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDAB4E68
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 04:01:54 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bcc0adab4so252107466b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 04:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1691751713; x=1692356513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fveq6PGN3gWXEUx4KXNg92eNPtqGmETUjIV8dFbBH3I=;
        b=XXX8cav2N5IOf9GHsIcdv3FF/7SnG6Vtz/X7exfj9Pa1kNMGk1iUg+FA3lrIFPnw3A
         DBEPJVqzmeTz/xgzCm7yXb84Jifh+mAYtZYM+Eqmufn8jfAUHJeIgKsRzyM+ZKVIhH10
         8W3Ohao0qjEc5tbxQtQWcMWIdu7//F8InZIqW3MYl+vkI6bQvufiSvrrQ87U8RrANVQ+
         a91ARyEcWWstSHRfFwH07IXhH6aJvfk6OKTHPUfWbm7v/INgEX8PveMu1Ft7q2gtJwbW
         96Dlt33miooM6YfQyp+eIKPe4VrbrBOgjRlKYDw9vtU288kKbvWeBLc1zHYBD6nsF3O9
         Tapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691751713; x=1692356513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fveq6PGN3gWXEUx4KXNg92eNPtqGmETUjIV8dFbBH3I=;
        b=S8/I/DRKvbcg3coSErr4+QBOqcoBCy/o001hK5oOW2WYOCSllXhkavxnHh8RrEY6r7
         xeyUkMfR5pPV+wvzNyGBuwhA4rpamZHmcjhNmgx4rDzCJ7nl3BMMObUnikZzHrMJ/bJP
         cDmRhCukvaqUuchBJUzjZYLMvzqaWl23n6C37na3oH3U8sWcqKKroc1KbQL6LZOQA/iX
         oOl6UC5wthqBUr65Pz1AvOK3nyBlOhJM/+IJaMoSfxTEy5IsCUYNn7rHeySyY5E1OsIg
         LCgrs5IrYKAYNXKkj8iQowk9CTpDWIcERvn6J7Q4vE8Zl2TP5Wisr4XOjDmvbOHpqOqh
         89BQ==
X-Gm-Message-State: AOJu0Yy+9P8l10ezSzCn4J2tckDbXulDDgI5nxD7zLmqEHMwADw8NfF4
        Lk4M5pgPgGOduGiXRhH28ODksw==
X-Google-Smtp-Source: AGHT+IHL1RcjnuUMBLw6U+H9UcMBTxfxIdpZPuC3pS3RxmU9ZEnu6dNClTxIAvFRA/VlJIp21KRVIA==
X-Received: by 2002:a17:906:318d:b0:99b:f645:224 with SMTP id 13-20020a170906318d00b0099bf6450224mr1392297ejy.9.1691751713272;
        Fri, 11 Aug 2023 04:01:53 -0700 (PDT)
Received: from fedora.. ([188.252.220.253])
        by smtp.googlemail.com with ESMTPSA id i18-20020a1709061cd200b0098e422d6758sm2088179ejh.219.2023.08.11.04.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Aug 2023 04:01:52 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2] ARM: dts: qcom: ipq4019: correct SDHCI XO clock
Date:   Fri, 11 Aug 2023 13:01:16 +0200
Message-ID: <20230811110150.229966-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Using GCC_DCD_XO_CLK as the XO clock for SDHCI controller is not correct,
it seems that I somehow made a mistake of passing it instead of the fixed
XO clock.

Fixes: 04b3b72b5b8f ("ARM: dts: qcom: ipq4019: Add SDHCI controller node")
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
* Make clocks and clock-names one-per-line
---
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 5492aeed14a5..80c04915f0e8 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -231,9 +231,12 @@ sdhci: mmc@7824900 {
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			bus-width = <8>;
-			clocks = <&gcc GCC_SDCC1_AHB_CLK>, <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&gcc GCC_DCD_XO_CLK>;
-			clock-names = "iface", "core", "xo";
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
 			status = "disabled";
 		};
 
-- 
2.41.0

