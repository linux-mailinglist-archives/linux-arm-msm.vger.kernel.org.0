Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5B2D56B962
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 14:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238143AbiGHMMG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jul 2022 08:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237753AbiGHMMF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jul 2022 08:12:05 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FD609CE36
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jul 2022 05:12:02 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id g39-20020a05600c4ca700b003a03ac7d540so1031042wmp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jul 2022 05:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zzwiIB75BAWXHQ1Oucx/2up/baq7so/2ltJZoy05TUg=;
        b=fS/KGgOkPYqMZusHtXdWErW3j83m13AQ/3rcuGrcMYmuWCOEt9nC4UVo6U+YJB7H/B
         ahPgaWfDVZPl+dOCX35mUw6KJnH7du6sc+OkxVMNRXpUkbP+rpKSCCra4H+PAIEAkUeo
         IApfWnvm/tMaPCMayoiMFhmctKRzb5RB5hjbdiQzbyhMYMGpqkd8I36+JaiTTT/9Fho5
         OBrgNCRfTy9Whk0x+flYmSoAOixx0oQZpr1cgw6YMRTU0azRv6euQZ+7T3P3KDGa/6Cp
         MwUYtaxcKywXjj6/GNnRStx+LlexpvP8BWLZmLkyllafL1B/qa6gEZNl7B9aoaAXPBQ0
         skWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzwiIB75BAWXHQ1Oucx/2up/baq7so/2ltJZoy05TUg=;
        b=RA58sNKiYfc8sJGkSiaSYDQyNNQBarSywRddP7SAm7lJ/oPx5wW7ncBcWa+oSSbQM5
         gMECojkK8CoBATe1j7RgIGOqjTJoHVrauOre8Bckpd0A7VYiQDQwbYwg8Q31wAQTRuyZ
         Qber5poRBi8xiVfhzV0fCqnvvsU0BYNFraFZi7Feuf5X6EYom6CY88BaXUi1yXiLUpWH
         M97G5v0hPg68u9weih++0Vzgdrzr4cPP+d1ZI8sODxbPYKyGx3NbHlmyeNnYBeP9Lb0G
         YpCJr4mrrUXnGzk+y6yoCPnvkH+/SpDVP/3HlFdloMcu9+e7HwemPFCVwBwSr2rMkK12
         119g==
X-Gm-Message-State: AJIora90pvjnXXzONi3Hn4HDAlX/HImOE30v+nxov6lWBVx6OZ1Okw6P
        AS50K5UozCwf8LF5oVpVdQ3TmA==
X-Google-Smtp-Source: AGRyM1u43pXQOxy0D4XqWjeK/L+qlw/RNqBRoy0krV5lx7XaAHCQs98J00RUUyFcMbkHolYW6lbfkw==
X-Received: by 2002:a05:600c:3494:b0:3a0:37f0:86ad with SMTP id a20-20020a05600c349400b003a037f086admr3507351wmq.65.1657282321052;
        Fri, 08 Jul 2022 05:12:01 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id l3-20020a05600c1d0300b003a03ae64f57sm2030549wms.8.2022.07.08.05.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 05:12:00 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, stephan@gerhold.net
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/3] dt-bindings: opp: Add missing compat devices
Date:   Fri,  8 Jul 2022 13:11:55 +0100
Message-Id: <20220708121156.2165250-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708121156.2165250-1-bryan.odonoghue@linaro.org>
References: <20220708121156.2165250-1-bryan.odonoghue@linaro.org>
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

A number of devices listed in drivers/cpufreq/qcom-cpufreq-nvmem.c appear
to be missing from the compatible list.

Cc: ilia.lin@kernel.org
Cc: robh+dt@kernel.org
Cc: krzk+dt@kernel.org
Cc: devicetree@vger.kernel.org
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 10b3a7a4af366..b8b6cdc73209f 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -22,6 +22,12 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,apq8064
+          - qcom,apq8096
+          - qcom,ipq8064
+          - qcom,msm8960
+          - qcom,msm8974
+          - qcom,msm8996
           - qcom,qcs404
   required:
     - compatible
-- 
2.36.1

