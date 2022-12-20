Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7A8F65207B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Dec 2022 13:37:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233468AbiLTMg4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Dec 2022 07:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbiLTMgr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Dec 2022 07:36:47 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCEB16473
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:45 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id o5so11607525wrm.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Dec 2022 04:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFSiXEp/F81I9rA8oyYkmW6cQulf46aZV7cm+NnbXns=;
        b=c8e3WBKo9a1OtUkjjTp9eBaKaFfiMlh/R5UX0kgZgfi9v49CAAdCoPIZoaoU7PbIzx
         MrON+bCxS0OvO2833qm8tOqB0JnTrCExHVR+65jfzwZZCYw0812YC+nmwSR9oQu0yvQz
         qBlO1nsi0p2GHRCAD1laaut9JRWjAlHOQtbLrH8iRC2nuKrMGCz35anyp19xSXDGxOgl
         /FqrpUpqUV0c2TUhcJP3BWmfz99NZTBszaDwOl4U284TxpYpbVNYk4M3EBTn6gkPjBh+
         Wn2Tz4XlH03OSsRM7X8BgnLQNXBxjNj7MLXIxjMDydIgjkvZFp7AbhrLCaYM92dKls0F
         IvdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rFSiXEp/F81I9rA8oyYkmW6cQulf46aZV7cm+NnbXns=;
        b=gw0vQ5JEC5K9qlsjVx+dsVZUwPf/FM/dZ7lU6dOokf/U2Egdk94trs7eCM9a0ZoHXw
         7Z4w8k8QlTGuvLmbctL7+mbveQ8o4/50NNoDC477QCVANbeGhQgmhFUXLvF7IEP3atp4
         Hh2U9PNkudcVTONztbGSVEv8YWfeTC8CuwkJwN/Rt0LSZrcQrNbABzncf0O/0AklWsvs
         VjvCcFJiE76q+CH4ztEkJeFL1iDARR/84oXR2aDpBACopkW56CW3yrLGduy92Jc9oHrs
         3SB7n0Md6K+KmH31I9uKvnVwYCivy8xhdQWmgG3UNyyeezUgSSHG5IHlg7EOPPlu/s2z
         uMNw==
X-Gm-Message-State: ANoB5pkU2JSpiWikZdO92ivVIDlo64uIyGpk78WzYoMvFS4F+mdHMTqA
        b9TjQGfa+XYtjXL/7TKSuFnxWOhdFaBVobbyIiY=
X-Google-Smtp-Source: AA0mqf7+GSrjWRgSJIptzklKTRg+Hk2DgWMf0VY7MsFeUzZMDYtNEYOoAY8knKPM3DTwuGHGeRQfMA==
X-Received: by 2002:adf:f802:0:b0:24b:b74d:8011 with SMTP id s2-20020adff802000000b0024bb74d8011mr27693857wrp.6.1671539805263;
        Tue, 20 Dec 2022 04:36:45 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id da13-20020a056000408d00b00242257f2672sm12641208wrb.77.2022.12.20.04.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 04:36:44 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
Cc:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org, dianders@chromium.org,
        david@ixit.cz, krzysztof.kozlowski+dt@linaro.org,
        swboyd@chromium.org, konrad.dybcio@somainline.org,
        agross@kernel.org, andersson@kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v5 07/21] dt-bindings: msm: dsi-controller-main: Fix clock declarations
Date:   Tue, 20 Dec 2022 12:36:20 +0000
Message-Id: <20221220123634.382970-8-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
References: <20221220123634.382970-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When converting from .txt to .yaml dt-binding descriptions we appear to
have missed some of the previous detail on the number and names of
permissible clocks.

Fix this by listing the clock descriptions against the clock names at a
high level.

Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../display/msm/dsi-controller-main.yaml      | 20 ++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index ce103e3ec4db3..4116b3010219a 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -43,13 +43,19 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Display byte clock
-      - description: Display byte interface clock
-      - description: Display pixel clock
-      - description: Display core clock
-      - description: Display AHB clock
-      - description: Display AXI clock
+    description: |
+      Several clocks are used, depending on the variant. Typical ones are::
+       - bus:: Display AHB clock.
+       - byte:: Display byte clock.
+       - byte_intf:: Display byte interface clock.
+       - core:: Display core clock.
+       - core_mss:: Core MultiMedia SubSystem clock.
+       - iface:: Display AXI clock.
+       - mdp_core:: MDP Core clock.
+       - mnoc:: MNOC clock
+       - pixel:: Display pixel clock.
+    minItems: 3
+    maxItems: 9
 
   clock-names:
     minItems: 3
-- 
2.38.1

