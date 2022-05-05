Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3105151BE41
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 May 2022 13:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358306AbiEELmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 May 2022 07:42:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358226AbiEELl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 May 2022 07:41:59 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B95F53E31
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 May 2022 04:38:14 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id ks9so1753066ejb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 May 2022 04:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KgLO+C2/yOlfu/wchcN06UvJAW7HmrFszzDOb32BWIc=;
        b=avupb/HFUW83+Itv9KEKJpUV9154BtGQV9mBeBuVuAW0qTnE5liQxBOSOM7uJS+QLq
         ID14hRVgFsYn2hlVQ4T02BqWIk1wD60GfIr2r92oM+PqjhGl8aDIqgY+34tekiXEB2sO
         n2TEkI7hlKKZPKisDCVvcA1/jppqPdpapdmWvCYg46NSMagiHA7MBEjxj8lMTcxB/lBt
         jX+y6b9HJSA4r0/1V7ICZNheTF0qDHyZSNgGCwobcdXPBKZ07Y2iAa+YCFsToud4qjnv
         g0LTt/alnMGknJLqwXtBrNw6U+TX647OspT3fYaNIV/YTwI1JlpMbLsEG53rabwZ6fBi
         QyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KgLO+C2/yOlfu/wchcN06UvJAW7HmrFszzDOb32BWIc=;
        b=jyLZAv7umVQQZqgtn9md5ZAAwc573Th5YY6tn9JOn91k9lWb+Sx6+9UMLsZbetYb5M
         o1ahGE1ToVXMiVGgYjV2jQGB7rIR09g/fIIUnZnilcll2u6IdRajbomn4pubF7RfDgys
         86LRvHkxPxtaFJT/MaBuSbt5zRpdz5bhVO1Vf7b3GnJ0bp3iCN6Ch1J4zJu3lv05M/4C
         rCGLmmShYwIVIO+ulxxVS+aPCctfV6hK0aPVT4N+kwVngujBKk8wMcHKpK3uexRBZZ8e
         nZVAa+Yre0ZxOlIEfaULS41lS1COE5lD+0h6MmH/ds8K266iA8DIvj2bT5biXPM2dfEb
         BKig==
X-Gm-Message-State: AOAM530d/uYV0BMpcTNNCKPYrGr4gE6kPsGcL8WMhOJz++13KZAbznwM
        44sYzrX6eD8zDqBbdeSJL4+oug==
X-Google-Smtp-Source: ABdhPJzrPkCIO5OQIuDm4iIyHx+cCI9ZlcNZkwkZiyOWeM12UbIS3zVmC1+k5MTg3pxGQO393gfI9A==
X-Received: by 2002:a17:906:6a1c:b0:6f4:b0e0:2827 with SMTP id qw28-20020a1709066a1c00b006f4b0e02827mr9260907ejc.249.1651750692479;
        Thu, 05 May 2022 04:38:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g9-20020a1709063b0900b006f3ef214db6sm661006ejf.28.2022.05.05.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 May 2022 04:38:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/6] ARM: dts: qcom: cleanup QFPROM nodes
Date:   Thu,  5 May 2022 13:37:59 +0200
Message-Id: <20220505113802.243301-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org>
References: <20220505113802.243301-1-krzysztof.kozlowski@linaro.org>
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

Cleanup coding style of QFPROM nodes - put compatible as first property
and drop tabs before '=' character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 6 +++---
 arch/arm/boot/dts/qcom-apq8084.dtsi | 4 ++--
 arch/arm/boot/dts/qcom-msm8974.dtsi | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 3bf870b7de00..d3cb099cb691 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -797,9 +797,9 @@ ref_muxoff: adc-channel@f {
 
 		qfprom: qfprom@700000 {
 			compatible = "qcom,apq8064-qfprom", "qcom,qfprom";
-			reg		= <0x00700000 0x1000>;
-			#address-cells	= <1>;
-			#size-cells	= <1>;
+			reg = <0x00700000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			ranges;
 			tsens_calib: calib {
 				reg = <0x404 0x10>;
diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
index 503b4ae9fb1a..cb01faa23eb7 100644
--- a/arch/arm/boot/dts/qcom-apq8084.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
@@ -240,10 +240,10 @@ apcs: syscon@f9011000 {
 		};
 
 		qfprom: qfprom@fc4bc000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
 			compatible = "qcom,apq8084-qfprom", "qcom,qfprom";
 			reg = <0xfc4bc000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			tsens_calib: calib@d0 {
 				reg = <0xd0 0x18>;
 			};
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 5d2ab5ceb65c..df49be66d0b8 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1118,10 +1118,10 @@ restart@fc4ab000 {
 		};
 
 		qfprom: qfprom@fc4bc000 {
-			#address-cells = <1>;
-			#size-cells = <1>;
 			compatible = "qcom,msm8974-qfprom", "qcom,qfprom";
 			reg = <0xfc4bc000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			tsens_calib: calib@d0 {
 				reg = <0xd0 0x18>;
 			};
-- 
2.32.0

