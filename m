Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 542F275A9C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 10:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbjGTI5L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 04:57:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbjGTIfJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 04:35:09 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B41268F
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:07 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so3809345e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 01:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689842106; x=1692434106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yg6D+dDW1EZ8ft1dP7hJ0hvkoxToJTo2PTuVFTDOsvg=;
        b=UiZ+uEPcQj19qIPz/HpBmXrWZPm2Sk4x7mkopCLzNFZdy4Cff/OzdROSIaMyC9pPsi
         ktZ2DMonH6ggn0DNIvXi3oOpuAG0u0kND65ZOyTdX5C6BawSsZuc+m35DleWvNMnixSQ
         czisF9iXGUKJ/tIpNkhjAZvAqZq+x3sYiBD/AV/wjQYMFSPtOCcSdfzY1gBe3Qa9wiVb
         cR/FprXo5n2q5FKiJBPG+QaOYKR/LsHMSWjWjnpw09v4DLkUyCie7Wmksn1OvqIrunsm
         tzVf3keBdAR1zhRyyt2ovmJvEI4UePeXLA3WfkQGR/evO271mLJ1kWpS0qXSH6xMhpzp
         FiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689842106; x=1692434106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yg6D+dDW1EZ8ft1dP7hJ0hvkoxToJTo2PTuVFTDOsvg=;
        b=lKeorC1KT08YMA2OJIHkUhY0BgpvwGwkzTtFe68DXUoA/Yn6TgY84MS+AC3zk82cRI
         QLuf7TXE63CIgcRybvYUeNd3cj9BaaoCruyvd8i4trtSbL6cL9glV6eODFA7JZV9L4oh
         3PuD8UzYu7xqCdMc74P46uWVtSm+HKtHaJn3Vcvpy7ZzI/8ofnqPHjR9Rgd53++/nAOC
         NHc7Poo31d/q2uiiOhU2Zb0am2Yp4O+QaB7s9v0k8XFCnr92ZuqdK9g0CuZYQR3S8srN
         YF9Bk5BEEmElU7NjLIaolBWa6CoUp5eD4HDzUYgFSl3KKyLCTVUFJqOTmiUu4Gel2LUA
         lx9w==
X-Gm-Message-State: ABy/qLZiaGKZoTPEq7CRcld3c8KYQRFFGfnxd6qevZHcq06Gnjkf9qHC
        HJ+W8Ue9DiGq0DpagGdwgo7tkXIOhAzrbhg9SPk=
X-Google-Smtp-Source: APBJJlF7kFKppx9jqRykyYF+E3Gzl5CDg96MpoWgt/+cp65nX07jS07CtJAtio3MePnEcuHacdD6DQ==
X-Received: by 2002:a05:600c:28f:b0:3fc:85c:5ef7 with SMTP id 15-20020a05600c028f00b003fc085c5ef7mr3758067wmk.22.1689842106193;
        Thu, 20 Jul 2023 01:35:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h3-20020a5d4fc3000000b00314329f7d8asm627060wrw.29.2023.07.20.01.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 01:35:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] arm64: dts: qcom: sc8180x-pmics: add missing gpio-ranges
Date:   Thu, 20 Jul 2023 10:34:58 +0200
Message-Id: <20230720083500.73554-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720083500.73554-1-krzysztof.kozlowski@linaro.org>
References: <20230720083500.73554-1-krzysztof.kozlowski@linaro.org>
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

The GPIO children of PMICs should use gpio-ranges:

  sc8180x-primus.dtb: pmic@0: gpio@c000: 'gpio-ranges' is a required property

Fixes: d3302290f59e ("arm64: dts: qcom: sc8180x: Add pmics")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
index ef2f8b732833..53b283e29407 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8180x-pmics.dtsi
@@ -145,6 +145,7 @@ pmc8180_gpios: gpio@c000 {
 			compatible = "qcom,pmc8180-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
+			gpio-ranges = <&pmc8180_gpios 0 0 10>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
@@ -303,6 +304,7 @@ pmc8180c_gpios: gpio@c000 {
 			compatible = "qcom,pmc8180c-gpio", "qcom,spmi-gpio";
 			reg = <0xc000>;
 			gpio-controller;
+			gpio-ranges = <&pmc8180c_gpios 0 0 12>;
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-- 
2.34.1

