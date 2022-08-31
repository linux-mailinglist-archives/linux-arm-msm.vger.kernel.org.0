Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 536A95A788E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Aug 2022 10:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbiHaIIn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Aug 2022 04:08:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbiHaIIh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Aug 2022 04:08:37 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45CBBB276C
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 01:08:36 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso11243706wmc.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Aug 2022 01:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=dgZ5OlqxSJ9OrGvG83WjC1EfyHitqCW6YeiAJ6MJi5M=;
        b=dCi8+tthhmPPjM66AZMoyj5XX/gkd1kqgewRKrO3rM449iB/vPYkU5R3LAFwj5C85D
         CgS2D2SEAyJm1ZeoYJYGFuECUKXXgCUWMrKGvjDziAiDRQB+4DroDINaZKUx7CSSKQPp
         XpuoIpWzd7on2H2gq3Hy/mPvlGiFdCytkUqDZKMuOJdi8bFV/zMdgyf7/pftfl0M/1j0
         ULrh0cRxNbAPDtUJiyJmfF2rpACMpACZxPokGzh7UpxDtGemTS4/GZFrHY5EtX7kZsme
         mxJjxenSAw6yK/0RCW6VGVCz0yX/oNXRLLTCzoa353i8st2fv5Mzn4GRbkuC3Xu29n28
         lKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=dgZ5OlqxSJ9OrGvG83WjC1EfyHitqCW6YeiAJ6MJi5M=;
        b=stynhpIeBpoz2ooD5LQcxnUluHkufKTSqRjTWsa7cG4U1u5nWabsW8SKEqu72JFXOj
         syPUfYktNv4CEkp2yk3aRLOaP4qPTsFDSO2V9GpHSLj3ZInQrMNYMdD4D5G2zRBJncRS
         zYGjlCgAnonT3EbdE1NzBwLJ3aeyYZ4L4rWroQwrZ/70p6hc0QnyJiSa3j/IikqKnDGu
         zkNVDKOT4EgUew2KxA9J3Tl83qSul3Ldvjhpufu3V/5K1E4HVjIqhjqW2iNFYAalckJD
         NeGwLUzKwfUvhjZvTRhVpXnQmQ+tToHB6rT5gErpiHAzGH0HZDYsolDDMyeBB/aO3yPo
         Us+A==
X-Gm-Message-State: ACgBeo107ezBO9Z8hrIAa7WPomlBmXYVtmal9uv0dmjf8uTRNFmSEzxG
        xdslYcoRXirf27urXTn00Dxzmw==
X-Google-Smtp-Source: AA6agR6zuzDfMk9fxKwk1F//fcR8VdIgb+NJQ/7GTu1ecWFQDKEMuYgfGOFD2p9Y12U78xhqicqkWA==
X-Received: by 2002:a05:600c:2e47:b0:3a6:75fe:82a9 with SMTP id q7-20020a05600c2e4700b003a675fe82a9mr1159075wmf.189.1661933314602;
        Wed, 31 Aug 2022 01:08:34 -0700 (PDT)
Received: from localhost.localdomain (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id f16-20020a5d58f0000000b0021e42e7c7dbsm11418278wrd.83.2022.08.31.01.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 01:08:34 -0700 (PDT)
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     broonie@kernel.org, lgirdwood@gmail.com
Cc:     bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
        agross@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robimarko@gmail.com,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2] dt-bindings: regulator: Fix qcom,spmi-regulator schema
Date:   Wed, 31 Aug 2022 09:05:04 +0100
Message-Id: <20220831080503.17600-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.37.2
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

The DT validator reports an error in the schema:

Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml: ignoring, error in schema: patternProperties: ^(5vs[1-2]|(l|s)[1-9][0-9]?|lvs[1-3])$: properties

Move the unevaluatedProperties statement out of the properties section
to fix it.

Fixes: 0b3bbd7646b0 ("regulator: qcom,spmi-regulator: Convert to dtschema")
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2: Added Rob's reviewed-by, adding some Ccs
v1: https://lore.kernel.org/all/20220822152224.507497-2-jean-philippe@linaro.org/
---
 .../devicetree/bindings/regulator/qcom,spmi-regulator.yaml     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml
index 8b7c4af4b551..faa4af9fd035 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,spmi-regulator.yaml
@@ -35,6 +35,7 @@ patternProperties:
     description: List of regulators and its properties
     type: object
     $ref: regulator.yaml#
+    unevaluatedProperties: false
 
     properties:
       qcom,ocp-max-retries:
@@ -100,8 +101,6 @@ patternProperties:
           SAW controlled gang leader. Will be configured as SAW regulator.
         type: boolean
 
-      unevaluatedProperties: false
-
 required:
   - compatible
 
-- 
2.37.2

