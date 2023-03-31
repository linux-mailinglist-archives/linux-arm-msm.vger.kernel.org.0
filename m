Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21226D1BE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Mar 2023 11:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231415AbjCaJVk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Mar 2023 05:21:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjCaJVi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Mar 2023 05:21:38 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53C6419BA
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 02:21:36 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id h9so22369858ljq.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Mar 2023 02:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680254494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pmaEro9qJ+WFWPEtna9Xd9AaFut1CJeCBKXroVRKWyA=;
        b=FIZ8ZxAJp4cqsSt94KmZsnFwd9GFQBHF989CwXrTFCHrS0GYuaC9KFvpIrp++JbQW/
         9U8wpZ9SQuKLDm6k6IsLtbdn1dAtky8tJejv9pe1SPsHYe4fffjG1RXm3YeCeGbWjwyo
         qFHOkrtMj09MNwUCyJ3vHZ8QFYlm9I3R4JqoArtAL3v+xgBxM1ZA3Et9y3ZZ/0s+YNA2
         /1WY+RTMcs8oV2kvJMFOd+mxbV2zb/9Y5oQHGgFnmiKOmtZjyjF/mAfubx7s3hLBzkQ6
         99v8i/dE5/vKimmq6sbsRtDH+pLaibweHAa6CvfWTtarRP1FMUcsq+2Bl71toeqpBm/E
         Dw2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680254494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pmaEro9qJ+WFWPEtna9Xd9AaFut1CJeCBKXroVRKWyA=;
        b=lKykgLR6K9xwpHN94XVGWLCPdGidfdKihwfhGFNf5n2XWt4gOEyMl27Pa2CD8Iaus0
         WFUThPDBYOBzR0KDV/RGlyeeXqF9VVJBAvYnbOrWYoUxgUauVEB6iamIJYd5o8zjnTbX
         Ep9ouKrzkX1p3E8YkfeagCY8p5s1L3P08wIqk7e0y/ks670Gvq1WhrTW+pGTtyoVaXhV
         Yw2JfnQ/xTzJ+J/YMkB0Utt7GJhMnl8I0b+Y389sjeu0G1NA2xELOccnXHwMmumEYCzX
         LF+fPvGc/CnuoQqt9C7rDVTKOymGMVKyh0hcGNWt7k1b0WF8ku3REsq8h+yfrmLSNSxo
         HXeQ==
X-Gm-Message-State: AAQBX9eeceCEJPkmD1i0EIAEfSeqX5AhP3Pdxg41Jz8EjJkkymuyyuEH
        MF1Yi22DXm70tr+2E8TSweqZ9Q==
X-Google-Smtp-Source: AKy350aGVXPWJABt4xJLjGmuG7zNjs4L3aSsJ+nPkZRk7N9zS/D+N/69PUJRzZGKJ2kplzpG7PMjeQ==
X-Received: by 2002:a2e:8781:0:b0:2a6:2088:cfa4 with SMTP id n1-20020a2e8781000000b002a62088cfa4mr422773lji.42.1680254494629;
        Fri, 31 Mar 2023 02:21:34 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a13-20020a2e88cd000000b0029bd1e3f9easm282629ljk.32.2023.03.31.02.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 02:21:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH 2/3] dt-bindings: remoteproc: qcom,sm6115-pas: correct memory-region constraints
Date:   Fri, 31 Mar 2023 11:21:24 +0200
Message-Id: <20230331092125.44885-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230331092125.44885-1-krzysztof.kozlowski@linaro.org>
References: <20230331092125.44885-1-krzysztof.kozlowski@linaro.org>
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

Qualcomm PAS devices expect exactly one memory region, not many.  Also,
the memory-region is now defined in device specific binding, not in
qcom,pas-common.yaml, thus also require it in the same place.

Fixes: 838c558bb8bc ("dt-bindings: remoteproc: qcom: Add sm6115 pas yaml file")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
index f5d1fa9f45f1..1ac5b99b2fad 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
@@ -32,7 +32,7 @@ properties:
       - const: xo
 
   memory-region:
-    minItems: 1
+    maxItems: 1
     description: Reference to the reserved-memory for the Hexagon core
 
   smd-edge: false
@@ -44,6 +44,7 @@ properties:
 required:
   - compatible
   - reg
+  - memory-region
 
 allOf:
   - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
-- 
2.34.1

