Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF206789D87
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Aug 2023 13:52:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjH0LvR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Aug 2023 07:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjH0Lu4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Aug 2023 07:50:56 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77289CD3
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:47 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-500760b296aso2789882e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Aug 2023 04:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693137046; x=1693741846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6+5JyGg/RVsbvystfdqTjelqQjEsUcHgseGOGd0sd2A=;
        b=aSTNedRj9jCe9y3t0hQnZaMJKHOiM0JuipUnX25XmiichKI6Tfjv9PE7skbef6vDa+
         xWwqvtfP2znXpUE2t5x1T4/rxfpUnayLBxI1+aiKgCrwSTxPGH/8SgXxP5DqLW9F0WkT
         FrBZJk+sDiO66q1XRPkDEJzrFcwSNW5QsxQBKAy+HLC5if2hmeb/zlst432oX0I20Ioi
         bKqNGSjXccv/c4lTuC1NfTacWyfd0Ezj/DnvBnl9jSQUDu7IOfcdrNtXlQikfpOdMdju
         PfJ4p0ddG5blYbqPPXo94o67P+4FoSKjKjRleq2WMP8WPOphB5qAwmeSBCbBNXL3yCfR
         K5Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693137046; x=1693741846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+5JyGg/RVsbvystfdqTjelqQjEsUcHgseGOGd0sd2A=;
        b=dailEEPoL0E6RnC2kRsFzpCWghqxd1csCyXDE9yi/ZrZur1H1U1EcIu4i/QVgiW01y
         EvqwMFlB9NmunbK/xKiR53jVRG1aI7rLKQNl7xCDR/lmoL1L70ZbKnnDzaWL7O4WyFVH
         i2ztl9JmOM8T9jFYnXRnwaXfZlECvTkRCR5AkoQ5S1QgyEfIpOLvu/APn2AicrpWfUYG
         6iOsBNDdGvvkblVOzw4HP1K8NEEifGA1Xu1gomwn6VkXmq6myG8M3JASgJknWCpjQ8ua
         D0O1idv0J4aLXrDGs+8uG2FvtA0BM7fOfmRlJWupo2EgJckXylS4RFOnxl0GFmaYe2KJ
         yCMg==
X-Gm-Message-State: AOJu0YzIATYTt4VOtw4a2Ia64LPDaRH0xX4nAZgu2TYYMlFdUAk9g5CK
        QlAXYkaLGACqKxWRPNPrK+jkjg==
X-Google-Smtp-Source: AGHT+IERPpheMJF2+A8ACb1ozqTwHyIWBqnIUx7wppUVgi9tjaJj72nweT2g1EdhwLJ0NbJZJNpCOQ==
X-Received: by 2002:a05:6512:3d01:b0:500:a6c1:d8e0 with SMTP id d1-20020a0565123d0100b00500a6c1d8e0mr2395379lfv.22.1693137045746;
        Sun, 27 Aug 2023 04:50:45 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id a8-20020a19f808000000b004ff9f88b86esm1114770lff.308.2023.08.27.04.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 04:50:45 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v4 13/23] ARM: dts: qcom: apq8064: rename SAW nodes to power-manager
Date:   Sun, 27 Aug 2023 14:50:23 +0300
Message-Id: <20230827115033.935089-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
References: <20230827115033.935089-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Per the power-domain.yaml, the power-controller node name is reserved
for power-domain providers. Rename SAW2 nodes to 'power-manager', the
name which is suggested by qcom,spm.yaml

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 5b7d2c6f0ce9..2f94d26fc792 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -365,25 +365,25 @@ acc3: clock-controller@20b8000 {
 			#clock-cells = <0>;
 		};
 
-		saw0: power-controller@2089000 {
+		saw0: power-manager@2089000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw1: power-controller@2099000 {
+		saw1: power-manager@2099000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x02099000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw2: power-controller@20a9000 {
+		saw2: power-manager@20a9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020a9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
 		};
 
-		saw3: power-controller@20b9000 {
+		saw3: power-manager@20b9000 {
 			compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
 			reg = <0x020b9000 0x1000>, <0x02009000 0x1000>;
 			regulator;
-- 
2.39.2

