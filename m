Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B612726910
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 20:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjFGSl6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jun 2023 14:41:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjFGSl5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jun 2023 14:41:57 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D59E91712
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jun 2023 11:41:54 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-97454836448so1040678166b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jun 2023 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686163313; x=1688755313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XfuroyQJAbz9eJ8IYNpTYqcNYBwtnqvDKwV5tW+1tFE=;
        b=IcfL/GcfP36E83IHgmLLRi5x1twq00fmG6Sfg8gSppBVGwe2eLmviHQPFJ44wcHFAJ
         BZjzoqPyR/Nr8XZQTdbjkEtgGtt5h9R/QencLiOrJZBGy7AlV7sPcECAxKrtr7HM2JqY
         /tQh38luGPEzqOFmx5LXn57Ix1WXy1sw/jzFu3DeThk/4BqOeQx7xEaP8SczU190LF+F
         ot9K9/TfEHCHi/GYMMbzC79T88RLWwZr/L10IayHPC1szSRe9EzXx74tSGl8hENMr48i
         VMhEbpuoRrZpj2U2c7sJL9TG895IB21QKqKiB5pTkt08w04BKsNz4j3qX/tJYP+IwaxL
         H6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686163313; x=1688755313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XfuroyQJAbz9eJ8IYNpTYqcNYBwtnqvDKwV5tW+1tFE=;
        b=DG1q1Vmd6neSitzvVfcOquomLtprtOI1fS2N5m3kXRbFLkxwEZzSuuVP0bMGGSpg90
         W/V/cxDd3kpjD6lDSakxvclDY/jduvkicsInbeyD6aIA5PNitJvX2EsDPTUoq7FKjiju
         yBIzkd1H3BwV7D7LJcrFyFTRQqGKs7dwWDO39cZhblxkYf27EF9tXn0l96gCzy/4/tfp
         q0NbAx6JggyoZ+gY2Dd3R1nuNx2OnVuiwrzoEzV/jbNXjjMkWMaFY269q1pInXEZoRz+
         Dl+IfOVl1AbBx/LpFDCZos73OfkNQ8zu8D4dBxKVsWwmD9NdXxCXZeOcKCf6jdZ55lBN
         Hhfg==
X-Gm-Message-State: AC+VfDzTGfQh8e3KlIlx+hVJDomGbzTujbStvjFNiZlOAfYE0krLBhaq
        7ZiBxxXlJqtMg5DCbqYCx6iSgA==
X-Google-Smtp-Source: ACHHUZ6zGHkNvsuGpMnZNEHMZYFlUcKqv1tGCUIBu62p6KkmSMlv2eSJHXspjLAOaPba7v7Y91kGHQ==
X-Received: by 2002:a17:907:2da3:b0:978:337e:c417 with SMTP id gt35-20020a1709072da300b00978337ec417mr7146739ejc.60.1686163313297;
        Wed, 07 Jun 2023 11:41:53 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ci17-20020a170906c35100b009787ad3157bsm1435856ejb.39.2023.06.07.11.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 11:41:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: misc: qcom,fastrpc: drop unneeded quotes
Date:   Wed,  7 Jun 2023 20:41:47 +0200
Message-Id: <20230607184147.420352-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Cleanup bindings dropping unneeded quotes. Once all these are fixed,
checking for this can be enabled in yamllint.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 1ab9588cdd89..2dc3e245fa5d 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -36,7 +36,7 @@ properties:
     description:
       A list of channels tied to this function, used for matching
       the function to a set of virtual channels.
-    $ref: "/schemas/types.yaml#/definitions/string-array"
+    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - const: fastrpcglink-apps-dsp
 
@@ -48,14 +48,14 @@ properties:
   qcom,smd-channels:
     description:
       Channel name used for the RPM communication
-    $ref: "/schemas/types.yaml#/definitions/string-array"
+    $ref: /schemas/types.yaml#/definitions/string-array
     items:
       - const: fastrpcsmd-apps-dsp
 
   qcom,vmids:
     description:
       Virtual machine IDs for remote processor.
-    $ref: "/schemas/types.yaml#/definitions/uint32-array"
+    $ref: /schemas/types.yaml#/definitions/uint32-array
 
   "#address-cells":
     const: 1
-- 
2.34.1

