Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 136A956ADA4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 23:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbiGGVcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 17:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236792AbiGGVcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 17:32:17 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20B0D4D171
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 14:32:13 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id n15so23798687ljg.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 14:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4qmHqomtPIyCyTmU9c0GuY++F1fuqEtzhO4HzH/F14o=;
        b=JqL35clNBQYGPpaEjGmP1beT+IT1EyV8unkvRsu5HYH9lBGYNo8xV8yONYTT2/4waM
         IL+rG1NWqVUWLiB+qBszuthBY4ieC94jIpRIfmk/47TSLj5BnjI2Ccy64RKUULYP4DrQ
         0YXS3RxG7Dw5reRbvYjC2YN3uhuQilzvFhiTCDRB052/MbM1RINhz3eEIYv0Xvu9/ZIG
         thmEVSfE6eP6P/+9pErPme9PIGxByD4IxyC2nPV27Yr5TijqJkipUQfG1XmuMZ6KgZHv
         tbZmH7a9yV/I7dd3Y1DeyQR5OklzSRZjn23nsxSsRpBCIzwoXhfGNL0YvNOy+BDljE3l
         Ku9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4qmHqomtPIyCyTmU9c0GuY++F1fuqEtzhO4HzH/F14o=;
        b=y69Pg11B/NKmT8B2BqiWo+2n+kU4S+3nyiyWnnhPEse6vOCSk74fWuYZokc0pydGIp
         zAdOJOxwpHc3YVeEU/VS5QmZ/T9kb5MsGXYS6z0APSQDLFrt+z0AtmKWFyGnkDr+i1PO
         SxkQX6qQhgibtzL+pPTDzR3lJzqIzCj7zDvGTZHA2P9C1gIvboEaZU8iym2ZCw0lRmkP
         cKSU2Q49RpsLtcOEyE6n5u+4IB0EsKnPA2iXKdoUpsOuzK0B2vl5y3YngdI7y6WXRQFR
         qsq4/LjjA2A9y7wbujYparAJp6x/8nRVNGVTMFdbfRl1bew0b7q4UWgXq+JZ40nvpkKQ
         6Rwg==
X-Gm-Message-State: AJIora/vXHmKWTmVvuwsVh97DVnLKDehkkU3uR3KjzdbgQo5dEBTHGOE
        6+Ymke71xKxD/UgU2QT23roXSQ==
X-Google-Smtp-Source: AGRyM1u/zrZV5WDyRRmrgrTfbAEEMXa9NwgyyQheuXKk49R9ljtdKrfrkROt+ndm+hSOiQv8gSUPfQ==
X-Received: by 2002:a2e:2284:0:b0:25d:490f:60d3 with SMTP id i126-20020a2e2284000000b0025d490f60d3mr20372lji.486.1657229531507;
        Thu, 07 Jul 2022 14:32:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:32:10 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 6/9] dt-bindings: msm/dp: handle DP vs eDP difference
Date:   Fri,  8 Jul 2022 00:32:01 +0300
Message-Id: <20220707213204.2605816-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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

The #sound-dai-cells property should be used only for DP controllers. It
doesn't make sense for eDP, there is no support for audio output. Also
aux-bus should not be used for DP controllers. Take care of these
differences.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 1ef845005b14..491f4aefe0db 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -107,7 +107,6 @@ required:
   - clock-names
   - phys
   - phy-names
-  - "#sound-dai-cells"
   - power-domains
   - ports
 
@@ -155,6 +154,24 @@ allOf:
             - const: ctrl_link_iface
             - const: stream_pixel
 
+  # AUX BUS does not exist on DP controllers
+  # Audio output also is present only on DP output
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,sc7280-edp
+              - qcom,sc8180x-edp
+    then:
+      properties:
+        "#sound-dai-cells": false
+    else:
+      properties:
+        aux-bus: false
+      required:
+        - "#sound-dai-cells"
+
 additionalProperties: false
 
 examples:
-- 
2.35.1

