Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51105619EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 14:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiF3MI6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 08:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232111AbiF3MI5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 08:08:57 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC3B205C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so1520468wmb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DyPxfEgniN5NAuSTp0u5CFD7e7/QLtzxkjKqP7SWLms=;
        b=KYn84+/cfSOH4MzjIixeA5hWyTicZ6TpkqLzPVy2guLoqeA3aeEWEtjfwJYiMFL17t
         NhpDQaZH68tZAJd5cqFWj9FWa9KjLZ6shKcHDCrrewAigvKxo2kl4VCvVaYraX9QthyM
         AUFbgPAA7jyGrlCJLXAcfecgwi+uyaasntwYX1K3jXJDqZ+D0e/GOr0W5lAoGnIwaU5h
         CdeYkWDqZJus41Wslm1cpfrudhVYypccQUUiI+SvWzKbzpKWGPug0egBiIzhcy5aSfrV
         wiY01A5rRMSU0lOKZ2ve5ibEzloEGiURINYaIa6FrYmy6Rl+cGtNvf8q+QiVtIwZy5vj
         b+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DyPxfEgniN5NAuSTp0u5CFD7e7/QLtzxkjKqP7SWLms=;
        b=1OkxVI8hVOBpnjs5Vnrbz1fHmlnj9jVRpbi5PIUzE2afbavznKhzO7CSRJdddl5iIa
         grYlvMHTOnNLFcDwFF9rKVqhsXEmKa6lTNJcRpK+FXOTTlc70T4RBm8amF5m1yPJ7TAS
         +LnssDYct6A8O4K/SeGcWSQX74vxWapZE5gpgl8XibMwTFLMqq3NjGlUFzXfR5Rs3D9G
         K1HEQpXj4A/AtS8tSXdnlrH9fDoYjEeotR43pvyUCWo+MeyEvT4osm12R0DI0nt74KLE
         NaDgF+JL7ayr5QvrBguPLqAU2uGkfdaW3tBqKja7MYozAjw8jtbvUQji9H6BU3W18qe8
         3/jA==
X-Gm-Message-State: AJIora8ctJ9JejYLIxBBSTzgHQgaxsiGgh6+EMC2gGWihmDzpdU6crNs
        qplIq4LGhXdeFk2MmPTsxRmhtg==
X-Google-Smtp-Source: AGRyM1vMKCCLOxQaWrm/VzD2MG3JjZP+mwqBUGB9LgYbHwney0SzT0Gq4V/cF0E6OuH5UJ2GT8brlA==
X-Received: by 2002:a7b:c741:0:b0:3a0:5473:efc1 with SMTP id w1-20020a7bc741000000b003a05473efc1mr11942903wmk.201.1656590934390;
        Thu, 30 Jun 2022 05:08:54 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:08:53 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     quic_mkrishn@quicinc.com, swboyd@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH 5/7] dt-bindings: msm: dsi: Fix clock declarations
Date:   Thu, 30 Jun 2022 13:08:43 +0100
Message-Id: <20220630120845.3356144-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
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

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index fd9d472437853..b24ba6c346a77 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -28,22 +28,31 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Display byte clock
-      - description: Display byte interface clock
-      - description: Display pixel clock
-      - description: Display escape clock
-      - description: Display AHB clock
-      - description: Display AXI clock
+    minItems: 6
+    maxItems: 9
 
   clock-names:
     items:
       - const: byte
+        description: Display byte clock
       - const: byte_intf
+        description: Display byte interface clock
       - const: pixel
+        description: Display pixel clock
       - const: core
+        description: Display escape clock
       - const: iface
+        description: Display AHB clock
       - const: bus
+        description: Display AXI clock
+      - const: core_mmss
+        description: Core MultiMedia SubSystem clock
+      - const: mdp_core
+        description: MDP Core clock
+      - const: mnoc
+        description: MNOC clock
+    minItems: 6
+    maxItems: 9
 
   phys:
     maxItems: 1
-- 
2.36.1

