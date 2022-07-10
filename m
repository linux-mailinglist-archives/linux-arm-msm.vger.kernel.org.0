Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 997AF56CDF0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jul 2022 10:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiGJIls (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jul 2022 04:41:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229599AbiGJIlq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jul 2022 04:41:46 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6197918E28
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:45 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id z25so4258781lfr.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Jul 2022 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WZU55ztxCr9hrm/X9mq0W7rnO8DhBgA9l+GjYiiRXCk=;
        b=j7WKH1P9qrMtVfM+BgRoq05JqWY9cqgdDSOY0uMJ+i+8vwStr6I3MUVM2F/0mo/bUn
         SRQnXsUNDz88GLtbvVdJknG/dcAAY3PhVKkvsj/NJbuQbxyk6L3hksHvGDEDgSGUkzYz
         OTCvxU/U/EqnQUgDNdO1/bBL87VtpycpRHXJO3EecLnuPnLC/meVtM6JmLc7ZsDUM1Xp
         Pu0Azk4GUHVoOAQHhPPDRfHw6TfHz+PKCpedDEl3vvE2OOhOapqMh650MEQa/IbKocSc
         FQHjPK89bsHYItgUfUEyRUvnNHs3VQKamH1aNwj6U6A7mDEhCP69LjegN8zYxKva8k3u
         Js2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WZU55ztxCr9hrm/X9mq0W7rnO8DhBgA9l+GjYiiRXCk=;
        b=RfcAo33idRtsWJDDLJa/I0a2x6tvuiikVVQuQ2/oCEykNKZ9s2qd3xu4Bpl5NLZ0hz
         RPtTe9+OemN7k3sJMBeicbYXEW5TBrxha5HFCBieY2W5Fp0Wne+lKFisL/GGQoDlsewk
         GEgiLydAaT0Q8o8T5rYMchZHOVQ1PSu1p9Mk3upQWEknwuA31UePOVkWW6p8iHLDIWCQ
         1jpntc9FyetTf0BOPn4tUU6xCgkNPS894L11DhbbJAOrChiObFCDFWeC6ceFF+pxuk5o
         UBsexrAQL2Z3Dta4p/sYDA1SM9oY53QEXdqGBJHI5a19zdNEWZpYC9SjbgQcRZEvIsdT
         JCfA==
X-Gm-Message-State: AJIora+GUXfanRmlgCLpwDBUJUO+CrEAdYsI/ktWQrYU/m4SvwbzKV1x
        F6snMGLgWyUPLQeJRJa5AW50rA==
X-Google-Smtp-Source: AGRyM1vxQa30p97YqLFfiaEcWr22TJ7iZraKSZ6N1/3jsyAQ35Xl5FJKJAdTXadD7Mj4DfudYkLbbw==
X-Received: by 2002:a05:6512:2306:b0:485:8e08:5740 with SMTP id o6-20020a056512230600b004858e085740mr8320796lfu.354.1657442503707;
        Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i21-20020a2ea235000000b0025d4addbad4sm912536ljm.91.2022.07.10.01.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 01:41:43 -0700 (PDT)
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
        freedreno@lists.freedesktop.org,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: [PATCH v2 8/9] dt-bindings: msm/dp: add missing properties
Date:   Sun, 10 Jul 2022 11:41:32 +0300
Message-Id: <20220710084133.30976-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
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

Document missing definitions for opp-table (DP controller OPPs), aux-bus
(DP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/display/msm/dp-controller.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 391910d91e43..52cbf00df0ba 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -70,9 +70,21 @@ properties:
   operating-points-v2:
     maxItems: 1
 
+  opp-table: true
+
   power-domains:
     maxItems: 1
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
+  data-lanes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 4
+    items:
+      maximum: 3
+
   "#sound-dai-cells":
     const: 0
 
-- 
2.35.1

