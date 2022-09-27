Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF1DC5EC806
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 17:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbiI0PgP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 11:36:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbiI0Pfj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 11:35:39 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCC310543
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:35:16 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id b6so11324958ljr.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=1t0TIGJesK6hLM5PKw2EecRxO6c2wK2K1+TZumZPtWk=;
        b=Zd+cDgXiUivkzOnNFILtkBUnmUVQGo0NTItQGI0pc0jvJWMCwLFM4PgofQnzwpMXgP
         Lr3SUU/EFKSX6fExAKqNx6z0tTHZaXh559ZsExQKnKUSaL4W38N6M3RBlf5zFMSpQmeH
         lA2eXyXrakU0D++ih83K9oYhwmtO1dsIDcVXZL2Hsb/UG3oWT2zpYfbGEjDkwtbEqVOS
         VXPE7+vM6hVe+nE2qRWiQwQtK70FdIIVZkDvNbeBapfT+mcjWeIZUsehzgBGN41Kdaaa
         xKE6XdN4OYs1xtGOypEZ6c6EcoINpxywJ4I8aWRBlktARPx6Z5f3HnDsSzPAhG1ZJ8GI
         nm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1t0TIGJesK6hLM5PKw2EecRxO6c2wK2K1+TZumZPtWk=;
        b=QmZpU6uSiCFLA+JC1rqvStA812IgT/0S20x9BrNQQOcfHTbO0kZlKBPPTTOtM3TXJc
         rlusCsqYbKmxQmJz1XGFvwMMhl5XELRXbtufsRKMA+ODt/0mUVpsk2GS2/5/ksll68JR
         74fiUir2WJ6jM6LiNMFT2xOtxURLXk5ZQ7pdxZKMlyS9UNbphNArhVYZVf2slLIZUeQZ
         TOb+pGKRDgGGcODj30fiKKt/v3vPAaL5bfZvM7E+STt2nn9s2pikxlZdqTHIAv/hOEe/
         gV0o1zRL6U7P5LmWCXoc0Ewtvs5FiImv9/TC+ahQGtT4/IXtZ6PCPc0qgLe/CQ6u3OWo
         CP7w==
X-Gm-Message-State: ACrzQf0vKAY1w+2qsTbKk/3yFq4+16/V/6dujyGW/BhtaIuMEoNqwSt3
        yjh7lGM3bUGuuD3vJx+yMY6o/A==
X-Google-Smtp-Source: AMsMyM4yTeO2bn30uGrLMDwGpJ8vVNyDNE/DJp3E6f2DnLXWPNQW/gMeP/hHBhmgWo9UQJQFyeINCQ==
X-Received: by 2002:a2e:a910:0:b0:26a:ed13:cda6 with SMTP id j16-20020a2ea910000000b0026aed13cda6mr9437335ljq.250.1664292914866;
        Tue, 27 Sep 2022 08:35:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o18-20020a2e7312000000b00268bc2c1ed0sm191592ljc.22.2022.09.27.08.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 08:35:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 12/12] dt-bindings: pinctrl: qcom,sm8250-lpass-lpi: add bias-bus-hold and input-enable
Date:   Tue, 27 Sep 2022 17:34:29 +0200
Message-Id: <20220927153429.55365-13-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
References: <20220927153429.55365-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The existing SC7280 LPASS pin controller nodes use bias-bus-hold and
input-enable, so allow them.  Squash also blank lines for readability.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
index 78da5d2bb353..290ba2375e92 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8250-lpass-lpi-pinctrl.yaml
@@ -96,13 +96,11 @@ $defs:
             3: Reserved (No adjustments)
 
       bias-pull-down: true
-
       bias-pull-up: true
-
+      bias-bus-hold: true
       bias-disable: true
-
+      input-enable: true
       output-high: true
-
       output-low: true
 
     required:
-- 
2.34.1

