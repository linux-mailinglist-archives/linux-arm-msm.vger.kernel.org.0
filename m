Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C338851A004
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 14:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350059AbiEDMzQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 08:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350118AbiEDMzM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 08:55:12 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DCE63CFEB
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 05:51:23 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id b24so1564509edu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 05:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjmxXKFpqf8Z4PNCW7+PYo1hRoBDuo7aymv8o4l0yig=;
        b=aXfY/UifkO/9PvC8A7tJ7N9w2P+4MfokRY5N48dcJ7tVumGyuQRJBOane2na/rpX5j
         0iOj2Pb7o4cj35miU9Z1pog+murDeRRKuOep7SWHpsQEEKNR9qBTWopUScPNNL1aoipW
         +6KenYFjpVqsUfFnK4v0Dez/uqovQeELxRsUyW+dRYRjBjDI1GLYzin87eX2nxqeS2uC
         A4abEkuRrbhlivBCVgpa2ciIDqcUKSUrB9m2rXeAAahCLxYDTLnYNZdWlX1rqKFJ/OSC
         aqiOWKOgvhtnlOgzoP4MRDTUojNy2goFoUxyl8Du81SuEhV4N+2ahPA0O1LFu/HTOoNl
         fIcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jjmxXKFpqf8Z4PNCW7+PYo1hRoBDuo7aymv8o4l0yig=;
        b=W7yFRflhH488E1pbm5xYJ5H3rureTBW6pA1dsLnx+iep3Plfv19/mde8gq9G36NZy3
         7fLj4mRq8MAqykkOz1hVJVvWew9ACmpCJswU/v5Pox5RpRKl5yaERVph6wE4ULB39w/K
         b09s/KHTMwb+uqHjMU8BDpCxx0++3ri1PN4EZ3J/vOT5caWUTT7F6MgrhzpjYJCYupnk
         aDJZs/nFpkGiaOS0aeu/q37GB85rbvcrOGK7IJw9XgG0EgE59x4blvtH8cpfaOqTlYAl
         OFDkg9btzNDMtEyz1V5Q2UfMg1re/TYrzpjpr2LqrAPa8ii+XpbQyCMXxt8ntiDK+Lpr
         F7uA==
X-Gm-Message-State: AOAM532PuI+PoLtryye5tzk/3s4XoRSP4EH9EvVwF0sF4Pr+L4IfxKTt
        3yQXSzlZRUUsJx+a2qG9umKZC8GCP6gfzQ==
X-Google-Smtp-Source: ABdhPJwx4+fZYJ0ueATWol1S7O97WonwX3s+AS1NMLk16prb52CGswaP2AVvW6RQEEejrEh/pn3QuA==
X-Received: by 2002:a05:6402:1592:b0:425:edec:992d with SMTP id c18-20020a056402159200b00425edec992dmr22368071edv.283.1651668682420;
        Wed, 04 May 2022 05:51:22 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id hg13-20020a1709072ccd00b006f3ef214df3sm5664261ejc.89.2022.05.04.05.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 05:51:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] spi: dt-bindings: qcom,spi-geni-qcom: allow three interconnects
Date:   Wed,  4 May 2022 14:51:19 +0200
Message-Id: <20220504125119.190526-1-krzysztof.kozlowski@linaro.org>
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

Recent Qualcomm Geni SPI nodes, e.g. on SM8450, come with three
interconnects.  This fixes dtbs_check warnings like:

  sm8450-qrd.dtb: geniqup@8c0000: spi@880000:interconnect-names: ['qup-core', 'qup-config'] is too short

Fixes: 5bdcae1fe1c5 ("spi: dt-bindings: qcom,spi-geni-qcom: convert to dtschema")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Fix for a commit in MSM/Bjorn's tree.
---
 .../devicetree/bindings/spi/qcom,spi-geni-qcom.yaml          | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
index e2c7b934c50d..47e1b3ee8b1b 100644
--- a/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
+++ b/Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.yaml
@@ -45,12 +45,15 @@ properties:
       - const: rx
 
   interconnects:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   interconnect-names:
+    minItems: 2
     items:
       - const: qup-core
       - const: qup-config
+      - const: qup-memory
 
   interrupts:
     maxItems: 1
-- 
2.32.0

