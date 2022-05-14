Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8399D5273A1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:02:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234810AbiENTBu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234800AbiENTBr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:47 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29ABF28718
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:46 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id j4so19659003lfh.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tlRHmgPz4LKIxlJZY56dKqZYBftzR9zIcahl7t/spec=;
        b=CLPEdVhl0oxgnpnYiBRLIj8yhWLkGR7D0CTkD9UyA/ZJltjSMROYhcUX/NR1HHFqWB
         RuESzpou3uBjwGfK4mniNIIfrsn0L0LPRjsZqIkwkIWbQbZcUcXLALIs9N9Laai/jMHZ
         N/DtY12ccvCf9IFLfOaXcs6GNeSA4Dm43/2oVI0zJrCKKy39eEQZ19rmKbSex1iAkk+S
         J5zKzkNrECQmqwitpdhYf4x3kTVHaSZQqr7RScI5BIOEzDjC8wNKYRALkIurBPW6v94K
         JC1FlF24uRqCPxNh5h9drC0yZstxbIuxYW2Gj+CoDCw8WSNBC8j/ADf3TR3sAiRnrG0F
         /zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tlRHmgPz4LKIxlJZY56dKqZYBftzR9zIcahl7t/spec=;
        b=k44NPYnORztMpcrlK0Q6MGDDxHfgKz85cdQykcjggxP+9QEYu4xQ1RmbeerUxHxLcS
         vAf8WtNbgTY9pQSM4J9NGJgkZKexr1a+oNvOBNVDW55EGmbqSVNehSzLZH5F/8dCKjch
         wIPYo4G07/dkUHqT2zpoV6w6pege+I0dhmMaQd9e0CoNo7pewGPH7XI07/qQ6Ok2OTzD
         lVVyvra1PfrwCkhiqQyjCPMrW3A4lpZRO0aRlynRJ4nRtzFdRCyQ7p6OMBNsE/Y4XNdu
         sgJehPzHBzQFwlza5SphsRDk/StlM2o7o+rdBoa0cghV3hsAHgB6Ub3mBRwG0EDRXQhO
         sJKQ==
X-Gm-Message-State: AOAM5337dBa0rh5G9exoIt7yYa46FUtoE4qQf1GAJcMgMBi+NSi6dqoC
        RJjtu8kajvs0I1dFiDboJz23sQ==
X-Google-Smtp-Source: ABdhPJxPWyKK/HOJCkVNT8Q+MdU7UfmFRpDpme1E6D83G/PYJ9fN1D1RXV/3pLB+4Hq4WK2IZZOb4A==
X-Received: by 2002:ac2:5f7c:0:b0:472:2133:c12c with SMTP id c28-20020ac25f7c000000b004722133c12cmr7448905lfc.385.1652554904549;
        Sat, 14 May 2022 12:01:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:43 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 05/12] arm64: dts: qcom: sdm630: rename qusb2phy to qusb2phy0
Date:   Sat, 14 May 2022 22:01:31 +0300
Message-Id: <20220514190138.3179964-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
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

In preparation to adding second USB host/PHY pair, change first USB
PHY's label to qusb2phy0.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 2 +-
 arch/arm64/boot/dts/qcom/sdm630.dtsi                  | 4 ++--
 arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts   | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
index 42af1fade461..00baacf28c63 100644
--- a/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi
@@ -224,7 +224,7 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEUP>;
 };
 
-&qusb2phy {
+&qusb2phy0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 5be0ec06ed86..eb8504e5735c 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1250,13 +1250,13 @@ usb3_dwc3: usb@a800000 {
 				 * haven't seen any devices making use of it.
 				 */
 				maximum-speed = "high-speed";
-				phys = <&qusb2phy>;
+				phys = <&qusb2phy0>;
 				phy-names = "usb2-phy";
 				snps,hird-threshold = /bits/ 8 <0>;
 			};
 		};
 
-		qusb2phy: phy@c012000 {
+		qusb2phy0: phy@c012000 {
 			compatible = "qcom,sdm660-qusb2-phy";
 			reg = <0x0c012000 0x180>;
 			#phy-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
index dcbaacf18f66..9280c1f0c334 100644
--- a/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
+++ b/arch/arm64/boot/dts/qcom/sdm660-xiaomi-lavender.dts
@@ -103,7 +103,7 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
-&qusb2phy {
+&qusb2phy0 {
 	status = "okay";
 
 	vdd-supply = <&vreg_l1b_0p925>;
-- 
2.35.1

