Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 506A452FE45
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355465AbiEUQq2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355457AbiEUQqH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:46:07 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F08456575
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:05 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q1so2984439ljb.5
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1CNzdj/syMEdOL6sFg1I8zFQMw1U0E7UM4zdtExgB4s=;
        b=elXP+yONQhW2Vfrcz/thcfYRN2plOGYWsXeGKE62nLVqmPxaZumOyPkkUj4VpCUW9f
         SXJoDd1fx+iT6tilmZL1w8JPOM/wwTwfbawTCJasdIfpfcWSWtX/K6jlLVwbDbWBGTW5
         h3167hKlBsNz+8d0yFVSKZY4VAg2tnPbJZS0pif4HShGmECwmVSU6XEnMXlTXXgogvxj
         CqKiX1Bpqt5eerYIX9/AUYLe4QE8LUMn+Dd7P+wecWC8IBvtvYLtXAhlz7GHblsqJLrD
         xcuAKFYYAQUItevQtXHdxxJ/K2UZHFFkNnzxLh6Ih2zKcvDwFXBJOZSWI8D7RsYwDEL1
         VIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1CNzdj/syMEdOL6sFg1I8zFQMw1U0E7UM4zdtExgB4s=;
        b=rsLcH9Ss0i6QFjmSutGVSzn0g0XdxnZIRvrzoKXxZBfQ4kQx6iGWAoibmxXOhMYDRJ
         grJ/LRW13rOrfpslh3tDrq6Dj9xR2ZMQwJnQyUIC5w8Oki0PamlSXtTbdxoFR4+2luhM
         DxTjphVu+GWhaMzuAvDuWrp+HZ0NinWtq3SRpP/PucC4i6RPCfytlQWGDKyP1ms/dSbD
         vxprj7Mjioa9IzvcHEe10FTGFy1q2O4MITlFpsnz1VeYyebilu/DrgTv0kVez1xD4kc6
         s8FhA7nHadbtuEdfviwsR1rmIJz/IKaztkrRbSJRPxwfaWIMe3c3c7dyK5aoWYbvdQPr
         diLA==
X-Gm-Message-State: AOAM533IRftJ+ZYIYOCuuCZCFHrIHhteppDG8zmIFKXeP0LS8HnvNy9K
        x5vbI7J2xnPBZouoe/tk5wtJOA==
X-Google-Smtp-Source: ABdhPJzD2T3UaTWLdGznbdjSeezNWL3JILTrWVBx+t3eTuKGIGlzgSM/MCD+tz6R62EhUUc2kze+Lg==
X-Received: by 2002:a2e:a90d:0:b0:250:8444:2681 with SMTP id j13-20020a2ea90d000000b0025084442681mr8694441ljq.342.1653151564347;
        Sat, 21 May 2022 09:46:04 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f26-20020a19ae1a000000b0047255d211cesm1114282lfc.253.2022.05.21.09.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 09:46:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 10/12] ARM: dts: qcom: ipq4019: fix Micron SPI NOR compatible
Date:   Sat, 21 May 2022 18:45:48 +0200
Message-Id: <20220521164550.91115-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
References: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
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

The proper compatible for Micron n25q128a11 SPI NOR flash should include
vendor-prefix and use jedec,spi-nor fallback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi   | 2 +-
 arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
index faeaa6bf0def..44a9597d8bfd 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk04.1.dtsi
@@ -93,7 +93,7 @@ flash@0 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0>;
-				compatible = "n25q128a11";
+				compatible = "micron,n25q128a11", "jedec,spi-nor";
 				spi-max-frequency = <24000000>;
 			};
 		};
diff --git a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
index d596dd1180ae..c7a6e77da272 100644
--- a/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
+++ b/arch/arm/boot/dts/qcom-ipq4019-ap.dk07.1-c1.dts
@@ -56,7 +56,7 @@ flash@0 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				reg = <0>;
-				compatible = "n25q128a11";
+				compatible = "micron,n25q128a11", "jedec,spi-nor";
 				spi-max-frequency = <24000000>;
 			};
 		};
-- 
2.32.0

