Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 947306DB466
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Apr 2023 21:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjDGTt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 7 Apr 2023 15:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbjDGTtP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 7 Apr 2023 15:49:15 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48EE83F6
        for <linux-arm-msm@vger.kernel.org>; Fri,  7 Apr 2023 12:49:11 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id eo6-20020a05600c82c600b003ee5157346cso1310460wmb.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Apr 2023 12:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680896950; x=1683488950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx4ZG1ko//+xYTTb+kTxJu31+DpqiDt4rv+DgOwHnaE=;
        b=ALcHgkfJG2QsUjJ0ooFlkRhktGrwItT5a6DC45zL5AMivy7azhy46Ss71dac8kQF+K
         tMH+nBK9JVKWGkj0lMMJdJvmJ/T0YD1EN1taikO/mfRy/JC1jwlqmEGBkabPJG1D7aS4
         LZJ+7fOJ4GDsas+yPUu2OuC/CbZHnbkVGOU3A+L0E/6uYSZITckU5EGSb+3U1GNgXNRj
         50ysd+o5oaytiYEhPRGiytZdwvj9GzWsN9giHHM/J06Aw3DvZ8Ag9d5L5i0E/C5z1bQ7
         CddePRMTCpiSY2kWvSK3/GPfVwekhOUVpkCe2FAwN4ilJeVnxmUFmJMD6TP7sNd0Q1bu
         Q8GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680896950; x=1683488950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rx4ZG1ko//+xYTTb+kTxJu31+DpqiDt4rv+DgOwHnaE=;
        b=xT0kdO+mGpP+3o9M2LMDmA6xEfTnj9HSCdgYDcJKa/tKcN3L2LZ0kj12/pGfE0wOlo
         ufT5TMY1rXHINKKlii964hpfiigxDdsL113/YBWmJo3Ipqwn1jDk7OULH0p9xu6AOiM8
         eeE7d97JMYSsigh2RPMcWjI6A8TsgcYzy3UIBxfXqTgyn+AuEyjb92KsGBV5ZVPKAbde
         ypMtIJHTY6eI3Xoh2mISVZ3Q9uzPbRY0vUTarxtjTIQqfnyMqcPEwXuSoj1nku+DegnE
         xCPdkXfXUrjv5Sdqxo9hFvumWXVRV1cszOdc6EjuteAGIERXOsTBtrltMcs4ubaPTpor
         CXtw==
X-Gm-Message-State: AAQBX9dLvnRkaCvd9tL08zzAayIHyLc3x5FYlY1J6AsWjrM8snzHjqcg
        2b7RI0To0RPt10Tgepz7WeDMzw==
X-Google-Smtp-Source: AKy350aPZgAYNKbxv1SlLlzpEwpihDK7ztXY/5kL/fPTimrolsxEyEp0uHp1sLN6D09qvIN+o73yig==
X-Received: by 2002:a7b:cb8a:0:b0:3ed:a07b:c591 with SMTP id m10-20020a7bcb8a000000b003eda07bc591mr2003657wmi.1.1680896950203;
        Fri, 07 Apr 2023 12:49:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r15-20020a05600c458f00b003f03d483966sm9429551wmo.44.2023.04.07.12.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 12:49:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        djakov@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     bryan.odonoghue@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, benl@squareup.com,
        shawn.guo@linaro.org, fabien.parent@linaro.org, leo.yan@linaro.org,
        dmitry.baryshkov@linaro.org, stephan@gerhold.net,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/5] dt-bindings: vendor-prefixes: Add Square
Date:   Fri,  7 Apr 2023 20:49:01 +0100
Message-Id: <20230407194905.611461-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230407194905.611461-1-bryan.odonoghue@linaro.org>
References: <20230407194905.611461-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add vendor prefix for Square (https://squareup.com).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 055704dce3d1f..2efd185053bbb 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1263,6 +1263,8 @@ patternProperties:
     description: SpinalHDL
   "^sprd,.*":
     description: Spreadtrum Communications Inc.
+  "^square,.*":
+    description: Square
   "^ssi,.*":
     description: SSI Computer Corp
   "^sst,.*":
-- 
2.39.2

