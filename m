Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA6AB6B04BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:40:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230484AbjCHKkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:40:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230207AbjCHKkT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:40:19 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492469E068
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:40:18 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id ay29-20020a05600c1e1d00b003e9f4c2b623so937054wmb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678272017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnjTJUURheMCpnq/4EiXlRkiu/sc76vfGYo6X61pH2Y=;
        b=mEWqN68IZDo7BbTn6nrr6q3NjbOYAEmJ80biTam7iaw4ucC2q5F/U9AynauXFbpM9F
         5fRhGVZZV/oxnVHzvTCpd0JWtuc1RA0eOJ7uHRq3IliOdp5epBxkDT5mOMU2PjizCGd5
         VrNBnTQkWi0lrchIim3C1R4QC4/sKDTIIZ2XHvhXf0EuhmzzF3KX/SqNrLOo6J0nl/cg
         EbokRk4gq00YdpmeoEIG1xmzS4u7rWlzPNSOq1lzPXURMjHhzN65G5F9rx9r5nR/G3DS
         odpRY9cALfkXqBPhhubqoqNUc1g4EFhh3lpm0AWZYW7R9mfKvJ/AQMUImbzFZ4zMInK+
         BZlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678272017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnjTJUURheMCpnq/4EiXlRkiu/sc76vfGYo6X61pH2Y=;
        b=rOpgZCoX/9xn8oSx7MwrlBPf6NzqZylCVDK/yWfEPrUaVCj0u2zXVnuFyUV+E6p00t
         2omneEs4kv7Z76TnKX2kWSJL4hZWlKowJLxu/DnOYdAO2tfnMGDGRN14KOdNjktSsEHw
         xU7Tgr7W4wgbTmdIUT3mWMTII5pIx4pJWnl6rGl34psdI5XOUCRnbiojeN2fDfAUfIim
         kuEAuBM3tZqmxx37JABMUIk420gTxTDSj7FmJuWPbhZBxyFE2xbe62RWCRCBPof9/V7s
         i+2SEJlcalPNjUqHJUCp4GjMft33KrDZRtJanJPXPGjZmeaCSQl0FYLasRG1H+SuqPXp
         zdSg==
X-Gm-Message-State: AO0yUKUDBO9AHht4QWD21bYh3GxGaBJm8t6Av4wC7/BzOw5xTM7rNnG3
        zNisHfr5drr55cDEC43MzDRb0w==
X-Google-Smtp-Source: AK7set/yKNjhw3OrFGGNhe+/0iHT1/hwDEfDKcewPZELynzxrzbdgJSPWp1VQMl49ECDG3D1x78zKA==
X-Received: by 2002:a05:600c:1c9e:b0:3ea:e7f7:4faa with SMTP id k30-20020a05600c1c9e00b003eae7f74faamr16031738wms.26.1678272016909;
        Wed, 08 Mar 2023 02:40:16 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:2326:fd4c:82e3:7e07])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003eb0d6f48f3sm20664135wmn.27.2023.03.08.02.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 02:40:16 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v4 3/9] arm64: dts: qcom: sa8775p: add the i2c18 node
Date:   Wed,  8 Mar 2023 11:40:03 +0100
Message-Id: <20230308104009.260451-4-brgl@bgdev.pl>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230308104009.260451-1-brgl@bgdev.pl>
References: <20230308104009.260451-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a disabled node for the I2C interface that's exposed on the
sa8775p-ride development board.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 5efb3e4f2335..d65e7826f1d7 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -3,6 +3,7 @@
  * Copyright (c) 2023, Linaro Limited
  */
 
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
@@ -502,6 +503,27 @@ qupv3_id_2: geniqup@8c0000 {
 			clock-names = "m-ahb", "s-ahb";
 			iommus = <&apps_smmu 0x5a3 0x0>;
 			status = "disabled";
+
+			i2c18: i2c@890000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x00890000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
+				clock-names = "se";
+				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
+						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
+						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
+						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "qup-core",
+						     "qup-config",
+						     "qup-memory";
+				power-domains = <&rpmhpd SA8775P_CX>;
+				status = "disabled";
+			};
 		};
 
 		intc: interrupt-controller@17a00000 {
-- 
2.37.2

