Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFAF4F0029
	for <lists+linux-arm-msm@lfdr.de>; Sat,  2 Apr 2022 11:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239783AbiDBJlX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 2 Apr 2022 05:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239794AbiDBJlV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 2 Apr 2022 05:41:21 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1461427FC
        for <linux-arm-msm@vger.kernel.org>; Sat,  2 Apr 2022 02:39:30 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id f6-20020a1c3806000000b0038e4a0fc5easo2764431wma.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 02 Apr 2022 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXj7BO+bBl0pqBjxQeNENw+58YReTBBaL4hobpryihU=;
        b=vet3rbn/NG8QVw+yDszbyDWKY5L90KbtP9S0HjYYSY8QDBQ2EgIozScdmHkMB8JmfI
         9JIiUpaE+NwLgmYolUdfJisSKANyb/qwg2Sq3P9NnTZxMnNLq9IO/K2zVgSkwIYsh+eW
         rBuHQZdLU8mVvgc2sJDjN4n7+hp6Pe1m6JwGFUFSLnXRxcbTlUCOeUB8AVNB3FcgL728
         MF6AycKkgJGiZYRYHceFjwk8HRzstF5lWwNbqsJM8fE4PteMNbNIrZ2ozchaXmxgQIW6
         bWvaMBfB2sceHNAHaHux9nMl9bZFEMm04dCBb31tJph9jPZU4TVRmy4wxykfzLzpNkfh
         tyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aXj7BO+bBl0pqBjxQeNENw+58YReTBBaL4hobpryihU=;
        b=sYfjuFgiBDJnNNcJwiEGET2yoC8dNLhvpwgacOKby3aVmiCLp8nhH6X146XsdvEkka
         sOFMd2SG9DBCT8eIKanJedRTsdaIngN/Xrt7d2LMZteIqk+pjK+OlBpUlUtxw95XkM4y
         kfd+EsixHo8B1KzQkXK5A6hlY9DHlRFSTlg+R4pGVVtsMZhEqCyDRZciBEp+yUszTDl0
         TMkgNP6TnKnMWjPGW15NJ/n2CLSu55jdVLTPM5jrQelYbqnloFHi4g0YYwnExd8F10GY
         wKAZp1zQFAxx/i6RHYVaMCmkzmh1InbeLDL+VzolCUA54807QK5B+h741PZPewSN/1Wg
         4UOQ==
X-Gm-Message-State: AOAM532Rj5YfnUoIaiDtmGR5uWMa3Ieh1xsoqCAbdnWJ+e2ZBbrky3JX
        FkTh4bWK/ADJmM2UGdfDvQIJfw==
X-Google-Smtp-Source: ABdhPJx9Mu6P0y0Lvm9ZJupxsF1r0ICkLoSYcvm03bfXv+UG9HlYaDhP47N9pxGhwPLH5v6BWwXLRQ==
X-Received: by 2002:a05:600c:3d8d:b0:38c:6f6e:e61a with SMTP id bi13-20020a05600c3d8d00b0038c6f6ee61amr11875820wmb.101.1648892368692;
        Sat, 02 Apr 2022 02:39:28 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id y6-20020a05600015c600b00203fa70b4ebsm5265713wry.53.2022.04.02.02.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 02:39:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] ARM: dts: qcom: rename WCNSS child name to bluetooth
Date:   Sat,  2 Apr 2022 11:39:17 +0200
Message-Id: <20220402093919.50084-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
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

The "bluetooth" is more popular and more descriptive than "bt", for a
Bluetooth device.  The WCNSS DT schema will expect such naming.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 33a4d3441959..6eaa996272e5 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1548,7 +1548,7 @@ wcnss {
 
 					qcom,mmio = <&riva>;
 
-					bt {
+					bluetooth {
 						compatible = "qcom,wcnss-bt";
 					};
 
diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 2035be2fb8c4..0799dd4bfa2d 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -930,7 +930,7 @@ wcnss {
 
 					qcom,mmio = <&pronto>;
 
-					bt {
+					bluetooth {
 						compatible = "qcom,wcnss-bt";
 					};
 
-- 
2.32.0

