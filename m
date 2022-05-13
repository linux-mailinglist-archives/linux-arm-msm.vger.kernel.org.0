Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5415267BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 May 2022 18:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382606AbiEMQ7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 12:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382592AbiEMQ7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 12:59:49 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE8531EAE2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 09:59:47 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 137so8042848pgb.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 09:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z+QQA0s7nyDs9BM2EhvV+3A+fminA8LpaU1NJGXjcLo=;
        b=hL1NBu4POZdPxhSikhfLyBRG4riwOdOJ/CPbSr+/jJsUJRmN7HqBSgM2de468tghgL
         Q+ESZ11vD6nLA380hIKLidIfwmAVii8qeZvC7TDx9t6wh3DViJxfoM/qsk3OQLMnPqOV
         OMJgsJ22NR3I38htH0K6C8NfCkF+fKAwqN4JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z+QQA0s7nyDs9BM2EhvV+3A+fminA8LpaU1NJGXjcLo=;
        b=06rl097Jku2ZLi6isvSU3EMNesyZF4S2874ynazBBgaHtqdbr4Nq/G+ZZGbWcWicJy
         sHe9hvktA4W8RQZpNxPhS8msNMKvFmDXSjgmJmaf1waXr8IzMz/JgZ886zApj259Cugp
         LOKzkn4czl9TLsJe4B4hPrdy+TLf1n1TL6N1OmH4ZYI8cGaRK8x1+qvWu/6BIAmLG7c5
         HeKR1UhHcK/cysPiJMacl1zerpAEpJcEPVu+SIxkAKlYDsamU7UZwxUVAuxEomVx37hN
         LORTzVUx6PscUSs8h3gl1yvKWm4PoJGkVjGhtRJgICLJm5rdxCwJxkJQ0bH1NCUAtlAy
         qofg==
X-Gm-Message-State: AOAM532KdmAGbYLqiGWWLYHFM0eIEapA+JdLmPIXuqlsEJNDaz9qlXYv
        CAoF8IhG0E4z7ZPoRwMBsEvZPw==
X-Google-Smtp-Source: ABdhPJxnX5aT2CaKMHadwtsb1I27ePUchFw0f0cLKhqXTK4o8m4H2OG2UYB3TuqVqD4f3kl1t7L6rQ==
X-Received: by 2002:a05:6a00:2408:b0:4f7:a8cb:9b63 with SMTP id z8-20020a056a00240800b004f7a8cb9b63mr5416931pfh.33.1652461187378;
        Fri, 13 May 2022 09:59:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:f334:6f80:82ed:5653])
        by smtp.gmail.com with ESMTPSA id m1-20020a17090a7f8100b001d97f7fca06sm1824548pjl.24.2022.05.13.09.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 09:59:46 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Alexandru M Stan <amstan@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] dt-bindings: arm: qcom: Add / fix sc7280 board bindings
Date:   Fri, 13 May 2022 09:59:19 -0700
Message-Id: <20220513095722.v2.3.I1318c1ae2ce55ade1d092fc21df846360b15c560@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220513095722.v2.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
References: <20220513095722.v2.1.I71e42c6174f1cec17da3024c9f73ba373263b9b6@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This copy-pastes compatibles from sc7280-based boards from the device
trees to the yaml file. It also fixes the CRD/IDP bindings which had
gotten stale.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
It should be noted that these match the sc7280 boards as of the top of
the "for-next" branch of the tree
git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git

Changes in v2:
- Use a "description" instead of a comment for each item.

 .../devicetree/bindings/arm/qcom.yaml         | 42 +++++++++++++++----
 1 file changed, 34 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8ec0805f4996..c76ea703c2e6 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -404,14 +404,40 @@ properties:
           - const: google,trogdor-sku0
           - const: qcom,sc7180
 
-      - items:
-          - enum:
-              - qcom,sc7280-crd
-              - qcom,sc7280-idp
-              - qcom,sc7280-idp2
-              - google,hoglin
-              - google,piglin
-              - google,senor
+      - description: Qualcomm Technologies, Inc. sc7280 CRD platform (rev3 - 4)
+        items:
+          - const: qcom,sc7280-crd
+          - const: google,hoglin-rev3
+          - const: google,hoglin-rev4
+          - const: google,piglin-rev3
+          - const: google,piglin-rev4
+          - const: qcom,sc7280
+
+      - description: Qualcomm Technologies, Inc. sc7280 CRD platform (newest rev)
+        items:
+          - const: google,hoglin
+          - const: qcom,sc7280
+
+      - description: Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform
+        items:
+          - const: qcom,sc7280-idp
+          - const: google,senor
+          - const: qcom,sc7280
+
+      - description: Qualcomm Technologies, Inc. sc7280 IDP SKU2 platform
+        items:
+          - const: qcom,sc7280-idp2
+          - const: google,piglin
+          - const: qcom,sc7280
+
+      - description: Google Herobrine (newest rev)
+        items:
+          - const: google,herobrine
+          - const: qcom,sc7280
+
+      - description: Google Villager (newest rev)
+        items:
+          - const: google,villager
           - const: qcom,sc7280
 
       - items:
-- 
2.36.0.550.gb090851708-goog

