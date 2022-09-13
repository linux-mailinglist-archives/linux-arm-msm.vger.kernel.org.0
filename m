Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A50E5B6E0A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Sep 2022 15:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230001AbiIMNOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Sep 2022 09:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229876AbiIMNOi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Sep 2022 09:14:38 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBA55FA1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:14:34 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id w8so20023436lft.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Sep 2022 06:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=DQIW4wvUgD0lYAn0kE2/YaEvgt08S3ejHQvW4rHtlsM=;
        b=OyExbSWn1p17oLiexCOjoMEeY0TnNaDEmZ6+4fd0hsAHW6NwHFGIsAfz13/FCmE6+f
         i1kbzx0NQkx9Nko4o07CwC3AyobzEh/i5gEneWEEhauIm0SRGOS1r2ZhebBi4Da6bc3q
         Z29AHyi0CiIgRzX1WSnltpXU3zU+ePGViMIyM8Vz3bZiYc70YIq/ve+7uwiyzoFagmkN
         x6RJAEFkrQ4s+laZvpna54gMc+dqLgh6ScbLnU9CCVHKrdVYNlsDaQtyNHUlzyJqMnmx
         sbT84HapRdxtImwvXzwK7IUkpxuG4ti3ypI8avpLUACjGI1jb5Z2I8MNF4ABZ/ekSSEs
         lJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=DQIW4wvUgD0lYAn0kE2/YaEvgt08S3ejHQvW4rHtlsM=;
        b=l+Uvtdq5CxaXkPRlDZk65wbDZPPqpzpBfXvUYB5gZD2pfnsTUASGqLEqgVPJOLQAM8
         kb1Ib6186y9OGCofzrMKsXn8D5uNDKvsrNlHmcBOoOT74r5+5wZN6Xe3SlcWOq+GN5/y
         CZXoye7hKZeE08pzIIVWWKjN8cW8VGw8Wr5nhCz7U2P3v+itC5mXiDf9okkA3J+0Qrhk
         RPq10mChj0euY6hNi0LKnsS6TKU/RmeBZv05aO1T4p0deiXqtLzaZcKQeO9QoL6H6QOm
         Foz5eE8Iea/sm+21hFsgvMML/PBvFilLXyGvEayc/w6wO2yyRa2XA8updD6iJz+XNp3i
         xciw==
X-Gm-Message-State: ACgBeo2H0X0mIyPN3xpyHC/hnYuB2g/lvbDdj35vkyiUNwj3dosNYiKF
        ipb8zQz4fMcOZ9WMI35KuwmxLXT9AGrkDg==
X-Google-Smtp-Source: AA6agR5E+OSRi+pk2x7l7InFA365or6uEBJLwbNOZCJdYg96dmCCVjX9EGkjVW8ZJvvtYRLT1LVTVg==
X-Received: by 2002:a05:6512:ea3:b0:497:a170:a23b with SMTP id bi35-20020a0565120ea300b00497a170a23bmr10987606lfb.514.1663074872544;
        Tue, 13 Sep 2022 06:14:32 -0700 (PDT)
Received: from fedora.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id m25-20020a05651202f900b00492f5ad0ae7sm1703255lfq.43.2022.09.13.06.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 06:14:32 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Herman van Hazendonk <me@herrie.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 2/3] ARM: dts: qcom-msm8660: Add GSBI3 I2C bus
Date:   Tue, 13 Sep 2022 15:14:22 +0200
Message-Id: <20220913131423.304804-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220913131423.304804-1-linus.walleij@linaro.org>
References: <20220913131423.304804-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GSBI3 can be used to enable an external I2C bus on e.g. the
APQ8060. On the DragonBoard APQ8060 this I2C bus is used to
talk to the Cypress CY8CTMA340 CYTTSP touchscreen.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8660.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
index 5640c02db852..f3131bee752e 100644
--- a/arch/arm/boot/dts/qcom-msm8660.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
@@ -156,6 +156,31 @@ gsbi1_spi: spi@16080000 {
 			};
 		};
 
+		gsbi3: gsbi@16200000 {
+			compatible = "qcom,gsbi-v1.0.0";
+			cell-index = <12>;
+			reg = <0x16200000 0x100>;
+			clocks = <&gcc GSBI3_H_CLK>;
+			clock-names = "iface";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			syscon-tcsr = <&tcsr>;
+			status = "disabled";
+
+			gsbi3_i2c: i2c@16280000 {
+				compatible = "qcom,i2c-qup-v1.1.1";
+				reg = <0x16280000 0x1000>;
+				interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GSBI3_QUP_CLK>, <&gcc GSBI3_H_CLK>;
+				clock-names = "core", "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
+		};
+
 		gsbi6: gsbi@16500000 {
 			compatible = "qcom,gsbi-v1.0.0";
 			cell-index = <12>;
-- 
2.37.3

