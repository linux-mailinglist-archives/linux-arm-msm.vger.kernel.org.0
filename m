Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CFFE07ADA75
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Sep 2023 16:51:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232540AbjIYOvD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Sep 2023 10:51:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232566AbjIYOu6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Sep 2023 10:50:58 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C94111
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 07:50:39 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-9adca291f99so808025866b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Sep 2023 07:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695653437; x=1696258237; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55KLykjn1PnKwPDK5zu7mxi2gd1J0lug+paYekIyZv8=;
        b=Em/7YuYr1LzrDMFK+aUb8qVxH7QHdCk11IQovVtDRFLnVfC2xfvJ5exV8aSsdj1NAf
         NdKsyl4s7bOws3kHPUlwATzQuXd2BvI/PSI18Fc5cUbhr6YIkdCkmIzC/foZolo/ed0p
         o5kn8sXv0BU6gbHt2zlQbP29sYm7r7thbEEW9VPbulPEjbenmdUcg4OLta5nTN/b9rCn
         tWGQgZxol0KEiOe9OLtfCeigsehly1xFD62KLqJF4CXJZfeM/xFBC4//MxxRWYWbOgwd
         U7w1OCYy+7+hQDdzF7X9I5sWGGsCb9816S793ESNQ+fZGkHSlBPuc+MN/nDH2q4lMMDo
         tVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695653437; x=1696258237;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=55KLykjn1PnKwPDK5zu7mxi2gd1J0lug+paYekIyZv8=;
        b=t8uxYFZCmDc+pvXW0C/RWuvhFGwzp+8AVLgxcnG7CHftHpCnqkrRBixSvZhnLQ0UbC
         FO/pXYtkNyFCaWDpdvyLCILl8He+047Ah18uWqrg2eNfUye2pA/Q8GJCmr6W7ggaYRkr
         sZahURHlgVgPU81OXN5qe/7HGq+tBJnohW94Ytx/OeS65PXSnnzOjled9YlAJUxDiRCs
         3lP6tkKSRI2JYABcgBrdtxJzo2QGwIVdasYchaA2Qj8rJQvBZ4JVetDJsYIzU3ZMGuQk
         r3zopWI+H6CyY9yeN0AATRXiBVfpGt68uh3ed5GyzjI9foyMxlzrh0zz2uBVYDPWDwOe
         IKbQ==
X-Gm-Message-State: AOJu0YwuJ1JS9g71RplLpxgighzzUeWvPbDbDR0Qmpk/XVRF4PPbTrJT
        dfBW+L69wW0xLaK8LQmZ9RmdKg==
X-Google-Smtp-Source: AGHT+IFaXNxwlFWxMeQ/5HhV3ihSzn+GoLwlLRm3zMJhAHhxXB8RJs6h/QPnFbQfHoV4sGwMyi+Eww==
X-Received: by 2002:a17:906:1bb2:b0:9ae:5202:e611 with SMTP id r18-20020a1709061bb200b009ae5202e611mr6132132ejg.14.1695653437554;
        Mon, 25 Sep 2023 07:50:37 -0700 (PDT)
Received: from [10.167.154.1] (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
        by smtp.gmail.com with ESMTPSA id k8-20020a170906a38800b0099bc2d1429csm6426640ejz.72.2023.09.25.07.50.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 07:50:37 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 25 Sep 2023 16:50:30 +0200
Subject: [PATCH v5 01/10] dt-bindings: display/msm/gmu: Add Adreno 7[34]0
 GMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v5-1-3dc527b472d7@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v5-0-3dc527b472d7@linaro.org>
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695653434; l=2826;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=uMWu7ymKY3eYzgWjGn5JPo+8PeGurJ1cuv0/kOUDIFY=;
 b=Au0tyJmG59eJHkGXgh4DHk2BrLSfA+/HoUwV5HtBq64LbTFibaQZfUzhkr/yPaIUtrIBPgr42
 n+Q1vPaYOCPB04BVrSZuGVaQwet2V7UvZG6HHVnWwglRKZLBvVEef6G
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The GMU on the A7xx series is pretty much the same as on the A6xx parts.
It's now "smarter", needs a bit less register writes and controls more
things (like inter-frame power collapse) mostly internally (instead of
us having to write to G[PM]U_[CG]X registers from APPS)

The only difference worth mentioning is the now-required DEMET clock,
which is strictly required for things like asserting reset lines, not
turning it on results in GMU not being fully functional (all OOB requests
would fail and HFI would hang after the first submitted OOB).

Describe the A730 and A740 GMU.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/display/msm/gmu.yaml       | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index d65926b4f054..428eb138881a 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -21,7 +21,7 @@ properties:
   compatible:
     oneOf:
       - items:
-          - pattern: '^qcom,adreno-gmu-6[0-9][0-9]\.[0-9]$'
+          - pattern: '^qcom,adreno-gmu-[67][0-9][0-9]\.[0-9]$'
           - const: qcom,adreno-gmu
       - const: qcom,adreno-gmu-wrapper
 
@@ -213,6 +213,44 @@ allOf:
             - const: axi
             - const: memnoc
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,adreno-gmu-730.1
+              - qcom,adreno-gmu-740.1
+    then:
+      properties:
+        reg:
+          items:
+            - description: Core GMU registers
+            - description: Resource controller registers
+            - description: GMU PDC registers
+        reg-names:
+          items:
+            - const: gmu
+            - const: rscc
+            - const: gmu_pdc
+        clocks:
+          items:
+            - description: GPU AHB clock
+            - description: GMU clock
+            - description: GPU CX clock
+            - description: GPU AXI clock
+            - description: GPU MEMNOC clock
+            - description: GMU HUB clock
+            - description: GPUSS DEMET clock
+        clock-names:
+          items:
+            - const: ahb
+            - const: gmu
+            - const: cxo
+            - const: axi
+            - const: memnoc
+            - const: hub
+            - const: demet
+
   - if:
       properties:
         compatible:

-- 
2.42.0

