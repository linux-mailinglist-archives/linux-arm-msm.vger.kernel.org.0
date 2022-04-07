Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 915C64F81A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 16:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243392AbiDGOdT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 10:33:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343965AbiDGOdR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 10:33:17 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 535C2193229
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 07:31:17 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id b15so6644022edn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lbmt2ZWkYQOCIxnrzFI9pJMNabnWaT0G0BJUYh98KKQ=;
        b=osVx5uLdCQntezxcS1EuI5EjLmg15e9eBXjpqoffCJtGiWBFV6QeZBS2DdckdNkFSi
         2ZhU76lYaxzms4vS+tWIUCZOH9WSUkr2/yMyflGcLjVQjrsZS7Zp3oqszMabepw1cpPt
         pR/7vTPBZHlVVwtqfZ7pj1VMO5vUgWkxfLo3c2SrqdkNAKZctGebvYDxpzzdof1ieR76
         5zb4sZ3ZTYYAzdX3JBkL9VLxBvEIEGhv9ZLsZEGKtomGxcKul/88oQbr8GmcNk1H+1Fa
         8rtyruqhJ3BCFUznT318s5JNDZmV1nSbFFi7csQ0QiQzves1AjaZZ0TAhuv+yqL+/end
         v2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Lbmt2ZWkYQOCIxnrzFI9pJMNabnWaT0G0BJUYh98KKQ=;
        b=bosCbXA+KNiPBl0cLJUMmO2GguKMICx6jvV8vt9O+gVjKPzsLCDFClGKQnaWp73h8X
         3tDL+lxncd5quhOlLgmCcZPzEfrv7HUxq+EcfOqjk6bKiCOLeGDCdT28oTTHRA47S708
         rZicsf4G9vev8RKOotVkwiA8hPoeRZmc5Bvx6DMppx6vg+IUdMK2JGw8ieYZNAUJf1DM
         ET+QswgOL8DhZYiZvHcfuyqR/TR3uVg21DsFJoLWwi43Wth4R2XiP5fYnXmfVsiNX+5v
         GoCSwlQT5zsFT9fhCzJ8h9+Vhi4R/GHN5yr3tSg0DP5XvmOle3CNiICfHhXaCCACl/T7
         Ra9A==
X-Gm-Message-State: AOAM531TwRVZvAJS2Pp3cG3YD0BR4A8HYhYQkB6zcKo8CL/BuY9Y2U/Y
        du8FzRhTNYnjohIvjGesr7jzTg==
X-Google-Smtp-Source: ABdhPJzl+5jnd4VTKp6cs/rXYPYKOYGnBaiLrJG9EA3aHe4G3M4emyq4amT2Ssv5YlHk+Don0kddHQ==
X-Received: by 2002:aa7:c793:0:b0:408:4a69:90b4 with SMTP id n19-20020aa7c793000000b004084a6990b4mr14397051eds.58.1649341875838;
        Thu, 07 Apr 2022 07:31:15 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c3-20020a17090654c300b006e4e1a3e9d5sm7256670ejp.144.2022.04.07.07.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 07:31:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: qcom: align SPI NOR node name with dtschema
Date:   Thu,  7 Apr 2022 16:31:11 +0200
Message-Id: <20220407143112.294930-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The node names should be generic and SPI NOR dtschema expects "flash".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi   | 2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts | 2 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
index 7a337dc08741..2fba904491d9 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
@@ -89,7 +89,7 @@ spi@78b5000 { /* BLSP1 QUP1 */
 			status = "okay";
 			cs-gpios = <&tlmm 12 0>;
 
-			m25p80@0 {
+			flash@0 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0>;
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
index 06f9f2cb2fe9..d596dd1180ae 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -52,7 +52,7 @@ spi@78b5000 {
 			status = "okay";
 			cs-gpios = <&tlmm 12 0>;
 
-			m25p80@0 {
+			flash@0 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
index 65330065390a..5c802b99e15f 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi
@@ -36,7 +36,7 @@ spi4: spi@1a280000 {
 
 				cs-gpios = <&qcom_pinmux 20 0>;
 
-				flash: m25p80@0 {
+				flash: flash@0 {
 					compatible = "s25fl256s1";
 					#address-cells = <1>;
 					#size-cells = <1>;
-- 
2.32.0

