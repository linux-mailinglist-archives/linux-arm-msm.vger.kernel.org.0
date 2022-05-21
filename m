Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A25C752FE5F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 May 2022 18:48:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355174AbiEUQq1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 May 2022 12:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350298AbiEUQqD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 May 2022 12:46:03 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F59DF6B
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:45:55 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 27so7709102ljw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 May 2022 09:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gddd0fAw+DDHS5UQpyWxRARue36ZoZZ9O5PUo4nnIcU=;
        b=rRqCRfxqlvdHIxEcE+nigMTIT2JUiHyQtIr3jv9PdDUR4xMzvj/bCgXsm5OKnpZT4+
         +zC+4exp2z8CFKngJCNXPdY3ygS7Z2BfavarrvRbBE+EllfkdomzXn65OBx80skthS35
         FVXDMYEWKKdp3dsfL5Q4uKlVWCdus4R5FzOpjvA2se1XcIMYEa6vwooJOxRM/tsTlUHv
         UC8Dyh9O0dT0+K1RB1iV+RCKL954DcZIu3JqjDVr9cg/aAC3P3KjGfcDAjbChQ5IKKuw
         XwkUolUthegmReuh+IIG5tsxHYUGenpp7baWz/54gNYBMoRZROb9B4CsDgMfz9MyaGa8
         dYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gddd0fAw+DDHS5UQpyWxRARue36ZoZZ9O5PUo4nnIcU=;
        b=kSfhW9Wuha+Vo7Hw2qGnCO55zJfbgjSCGiKyhZdRY2c+gxSjkXcYkNE7lvE8W3HIwG
         Y4jAiG8iwARboF7xYb4uuCegh0fRcNZKj96Wumr2FKUDgM6raR6bT85vtI0X/PXiDRJF
         T3CQqUrJTv3HLS9dHLYmwxiTimGw6HqeI+3IbKOVfSCyAq0CfVYkPYy4R3wJ9NOLXkee
         sGpSI+l6980FeGDzWY2WSK91ElT3izW15+LSFA//zudrb1ziagytVQ/sGgTItBWttz0K
         D0VBTkAvFg9kFmmNqy2VHw4jVIY2lWFm22DIcXcovAP7N32CuprOurvlnhJdr9SkNnUn
         AP0w==
X-Gm-Message-State: AOAM532Hd8YjbrEIiLiA0V09hMIplTb8jvjc08ic4UOqYTjJy1XKX/zX
        Xe9Vd9tsMHIP5Mi4+UUOThvy4o6LN8kYRTXY
X-Google-Smtp-Source: ABdhPJwJ4v+PxMbSwUzIRXnS3FZidnv/KU4MzdWcShWBU/bE1bew+wzucXOs6iv/xPda8u0RIIDTQQ==
X-Received: by 2002:a2e:6e02:0:b0:253:d7da:ef27 with SMTP id j2-20020a2e6e02000000b00253d7daef27mr7183920ljc.105.1653151553619;
        Sat, 21 May 2022 09:45:53 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id f26-20020a19ae1a000000b0047255d211cesm1114282lfc.253.2022.05.21.09.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 09:45:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 01/12] dt-bindings: vendor-prefixes: add Shift GmbH
Date:   Sat, 21 May 2022 18:45:39 +0200
Message-Id: <20220521164550.91115-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add prefix for SHIFT GmbH, phone manufacturer
(https://www.shiftphones.com/en/).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 495a01ced97e..85d52300e588 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1098,6 +1098,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shift,.*":
+    description: SHIFT GmbH
   "^shimafuji,.*":
     description: Shimafuji Electric, Inc.
   "^shiratech,.*":
-- 
2.32.0

