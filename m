Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63F905251F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 May 2022 18:06:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356263AbiELQFS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 May 2022 12:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242649AbiELQFM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 May 2022 12:05:12 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8556F26195A
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 09:05:11 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id x12so5005376pgj.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 May 2022 09:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jQodzRrpvLC8VVynkNqTImsbAA7vm6HuQVRMnPSoLww=;
        b=dhlGVikVk9gpPZjb2ivh84DU0OiBpQH/FKtrtIAGJjq1P/v/U+ah3cU+8Z+zGc1grE
         rxxTUO6TJr1ndbBS4s5jmG8YtkQldK7fSfh/iDdM15sNMSw7P6ivKsicF/Iza4kN0BDP
         SQD6+4bm0hAhmfWW5j5+X9aosx2LetWZtwSfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jQodzRrpvLC8VVynkNqTImsbAA7vm6HuQVRMnPSoLww=;
        b=ZVNVBUFsN+6m/OIC21ETnNDdPi5PBot30trpMYhavMfs9aTVRMLG1gNYSwpseSvig6
         G0zMVtRvkBncHKllWjnBUWIEbiGxlX3Fww19Fx/pQfmdFgitRJl4Y9sykIUebYXFMNN5
         W6iHqHfbOqz13C96GYeW4h2v0PU+yKLKdo4hAzE56pcgU7ml7Ud1iRRCmbF4pd1IDKxE
         WCiZyjQP1zsgBtkvKhgT4HNyeFzzRxYmT1Iknx3UIHwuKc+jcagkHDfqMZRBkitWMnDq
         a/7e4w06HHWYhJmhtjFuuSAyjrJ71FJqu/aipwW3pMyd0aDQyU2p3VG5ObLnzSXMC0G1
         LjnQ==
X-Gm-Message-State: AOAM531e8FiB69MpBoCSUK4uEkY7UrefwVjh6alKp2qebOD/TNOhtAEq
        coMtOGywEGwnM8hJi2XtAqmcZg==
X-Google-Smtp-Source: ABdhPJx51s++hc6gA/ZX1sf8tg3GuQAsQdZBrp6LYUTPfePxvWWMxmRIYkK5jtyP2P3NLOLqSwaGxA==
X-Received: by 2002:a63:dd55:0:b0:3da:eb74:ef9b with SMTP id g21-20020a63dd55000000b003daeb74ef9bmr313327pgj.600.1652371510964;
        Thu, 12 May 2022 09:05:10 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:504e:720d:de58:4f66])
        by smtp.gmail.com with ESMTPSA id b15-20020a62a10f000000b0050dc762817esm21381pff.88.2022.05.12.09.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 May 2022 09:05:10 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        "Joseph S . Barrera III" <joebar@chromium.org>,
        Julius Werner <jwerner@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: arm: qcom: Add / fix sc7280 board bindings
Date:   Thu, 12 May 2022 09:04:46 -0700
Message-Id: <20220512090429.2.I1318c1ae2ce55ade1d092fc21df846360b15c560@changeid>
X-Mailer: git-send-email 2.36.0.550.gb090851708-goog
In-Reply-To: <20220512090429.1.I9804fcd5d6c8552ab25f598dd7a3ea71b15b55f0@changeid>
References: <20220512090429.1.I9804fcd5d6c8552ab25f598dd7a3ea71b15b55f0@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
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

 .../devicetree/bindings/arm/qcom.yaml         | 40 +++++++++++++++----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 399be67eb5d2..c7ab028d54a0 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -399,14 +399,40 @@ properties:
           - const: google,trogdor-sku0
           - const: qcom,sc7180
 
+      # Qualcomm Technologies, Inc. sc7280 CRD platform (rev3 - 4)
       - items:
-          - enum:
-              - qcom,sc7280-crd
-              - qcom,sc7280-idp
-              - qcom,sc7280-idp2
-              - google,hoglin
-              - google,piglin
-              - google,senor
+          - const: qcom,sc7280-crd
+          - const: google,hoglin-rev3
+          - const: google,hoglin-rev4
+          - const: google,piglin-rev3
+          - const: google,piglin-rev4
+          - const: qcom,sc7280
+
+      # Qualcomm Technologies, Inc. sc7280 CRD platform (newest rev)
+      - items:
+          - const: google,hoglin
+          - const: qcom,sc7280
+
+      # Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform
+      - items:
+          - const: qcom,sc7280-idp
+          - const: google,senor
+          - const: qcom,sc7280
+
+      # Qualcomm Technologies, Inc. sc7280 IDP SKU2 platform
+      - items:
+          - const: qcom,sc7280-idp2
+          - const: google,piglin
+          - const: qcom,sc7280
+
+      # Google Herobrine (newest rev)
+      - items:
+          - const: google,herobrine
+          - const: qcom,sc7280
+
+      # Google Villager (newest rev)
+      - items:
+          - const: google,villager
           - const: qcom,sc7280
 
       - items:
-- 
2.36.0.550.gb090851708-goog

