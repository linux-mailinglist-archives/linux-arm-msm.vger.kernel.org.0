Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B41C777997
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Aug 2023 15:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235302AbjHJN3O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Aug 2023 09:29:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233425AbjHJN3N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Aug 2023 09:29:13 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C561F2106
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 06:29:10 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b9cdbf682eso13918171fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Aug 2023 06:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1691674149; x=1692278949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ggdZ4XY1iyuyGYCuXDSqEBNlGtJDtI1zfdyeI7JfU4g=;
        b=weriFHGUujpIhTpjbDqe5WHkhcuVt23H8ey84ziXNWkddK61gwpUT83eV+crojnsqY
         YaAh/K4HXCPKHvmGzXS2uE61WYqYhoRMQsxAmPJnX7MXnrwgiNE0/fzJYVnlA0ycVAm+
         onARqzviG0px4STv9Wu8P6JSZ6ho1ZbGsPa2y/ZVzsmpW8Agk2Qg9oGoUF2UtpG0zHuU
         8cEfYUMOHF5eZHbrVQ+uFWa+wSHqSx+bpu2dUMddyfxASUkkCrn9d+D2mst7G4DuDCKw
         MYk/a78CgZTz3rnONokhwR5i9IxPtlVjSyQ4xVU62Fg6a3iwfPmKtmv5LHRab+faaFRX
         JyBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691674149; x=1692278949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ggdZ4XY1iyuyGYCuXDSqEBNlGtJDtI1zfdyeI7JfU4g=;
        b=ity7mZ7odfgWkjuZ6jHe2S0gQ5upz5ECxe0lR1/uwXnxmohE+8eHZcwIYmMW1Y1d/w
         yJe7U1V7Jx3cM95oFmW1Ru6tEOVos0kjJn06RKcXlN4fkonM0qJkwW3RWYTbGcLEfFHQ
         0iY7TEEGl9fp1vL6u/x4Wp7iBAtPKvGB5ReKSVGkmK2Wt40n7MmB0yU/1RIUP6i2/992
         NFyjO3J5e1fDeydpXoVozyz9J7qkgqSWLFfoXMxmw7HdqrDblP6GFQH4vmQfboi7EJx7
         1haPbSyITd7OPTVuYQw0mJaYyxi3Gy+rLZ9Znm5W9auZFLhZv6sDeyxDpS4WvYeFKZBS
         m9SA==
X-Gm-Message-State: AOJu0Yxy2cvx4T6sgr8QEESIgUuWZVlz2uE0EyrqIfnKGoqcDPzZAkki
        O7sKSF/f5asA2waoruVy9xsQPg==
X-Google-Smtp-Source: AGHT+IFyQLSVI1PI8OdHmd9Bwhh8DppcsoZdi218UWEQJXLxuZZTWyG2nLaCRRSUsUciLeTkIqpSuQ==
X-Received: by 2002:a2e:8756:0:b0:2b6:fa3e:f2fa with SMTP id q22-20020a2e8756000000b002b6fa3ef2famr1935253ljj.32.1691674148887;
        Thu, 10 Aug 2023 06:29:08 -0700 (PDT)
Received: from fedora.. ([88.207.97.255])
        by smtp.googlemail.com with ESMTPSA id l1-20020a170906938100b0099b76c3041csm948654ejx.7.2023.08.10.06.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 06:29:08 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     luka.perkov@sartura.hr, Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH] ARM: dts: qcom: ipq4019: correct SDHCI XO clock
Date:   Thu, 10 Aug 2023 15:28:21 +0200
Message-ID: <20230810132904.367418-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
index 5492aeed14a5..450179fbed32 100644
--- a/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi
@@ -231,8 +231,7 @@ sdhci: mmc@7824900 {
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>, <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 			bus-width = <8>;
-			clocks = <&gcc GCC_SDCC1_AHB_CLK>, <&gcc GCC_SDCC1_APPS_CLK>,
-				 <&gcc GCC_DCD_XO_CLK>;
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>, <&gcc GCC_SDCC1_APPS_CLK>, <&xo>;
 			clock-names = "iface", "core", "xo";
 			status = "disabled";
 		};
-- 
2.41.0

