Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6B5B57786E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 23:37:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232896AbiGQVhG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jul 2022 17:37:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232923AbiGQVg4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jul 2022 17:36:56 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5EE11A0B
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 14:36:55 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id r14so14639096wrg.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 14:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jqO12wXazmzjTuSQ7dV8WqcDOHjrC6yvS/uuR6oSvw0=;
        b=R3mbQ2eT+VNlRmFpWLm0JoUejcecPuDHPUvwVmPaAp7iJup9ZBjClHaBp65ZeJg1m4
         8aCspyMoYC7AQajKaPUMbYa12Nx30l3jWy2PMjAMOLq86EUavsuPsbX3jhfubg5Cz5eL
         JEgm2ajd1WwODyAIR0Y2+sPs8vu3EJaUBnb2QqXzScXtAuOTVBltUqvP1waIk5NgRnS/
         X+UiO9G4w0fNL3Y4q9iSZdDpJw7vMOWouHws/ldmH2v4760pnZ+Tfyh9Q3joOv6EOqwf
         94f94pYNGjtHDMDjyBRuanlmonoCQiw0SF74ebWzyLNkEKAm10VhD6gmUfSHxM6p74Ca
         XUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jqO12wXazmzjTuSQ7dV8WqcDOHjrC6yvS/uuR6oSvw0=;
        b=nEQh/fop4wpk89ucwMFSDVjS/NqgAXXX7xgWnTTuxTbmByIPzTz48PbHoChUbBWrTS
         NnfacWo3MuekDYr1L7jH7Wzdp1Qm4MHLrJab68i43ObHyKyvtaB6tYOMKlTUjIjAspfW
         xfaRl6Dzd7FKw/8FZzgt8VqG7UAqkp/t2U0P0I4HQ1W0I8B6xhfVqTPsLJZ2Cl2qmb0f
         xXuzr/AQLVA2jtWw56rVzi8m/Y9+6KIAkIaXP5Aw6yAzGCJ6W52czycjMsqTxPS4Nrva
         hMDe+bpHQSuw1tvBfPnlNri7oCp53Uc6LmntF3Qm+nzZvFEa3Tornu66EvDaZH3ImqYQ
         9uSA==
X-Gm-Message-State: AJIora/gug5UuSJlv6iHat/B1dTbw+rEW440hB7jx3glTKyNUIwURzzz
        Nutd0Csbk/aPvHgC7hC0zMStpw==
X-Google-Smtp-Source: AGRyM1tiZtquDBefjxeYFd655eeTIpBagSlJJWwNkYp9WHynFda3yrliPsZIJBM+XYX/17sAHCT8Jw==
X-Received: by 2002:adf:dd0d:0:b0:21d:666b:298e with SMTP id a13-20020adfdd0d000000b0021d666b298emr20892799wrm.412.1658093813754;
        Sun, 17 Jul 2022 14:36:53 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003a3187a2d4csm3715956wms.22.2022.07.17.14.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 14:36:53 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, jassisinghbrar@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org
Subject: [PATCH v3 2/2] dt-bindings: mailbox: qcom,apcs-kpss-global: Add clock-output-names
Date:   Sun, 17 Jul 2022 22:36:45 +0100
Message-Id: <20220717213645.1147342-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220717213645.1147342-1-bryan.odonoghue@linaro.org>
References: <20220717213645.1147342-1-bryan.odonoghue@linaro.org>
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

Add clock-output-names as optional so that SoCs such as the msm8939 which
have multiple a53 PLLs can latch the appropriate output name in
drivers/clk/qcom/apcs-msm8916.c.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index f504652fc0ea2..7497e4c930ae7 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -63,6 +63,13 @@ properties:
       - const: aux
       - const: ref
 
+  clock-output-names:
+    maxItems: 1
+    items:
+      - const: a53mux_c0
+      - const: a53mux_c1
+      - const: a53mux_cci
+
 required:
   - compatible
   - reg
-- 
2.36.1

