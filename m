Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F3C756AD92
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 23:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbiGGVcU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 17:32:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236681AbiGGVcQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 17:32:16 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3312333E01
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 14:32:10 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i18so33279329lfu.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 14:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bai7uA9Zgr1Dxz6AfyxoBBI60z5ndVSBWprohGAiax4=;
        b=qEEHXBHCgDuyEBTWfYy2HkBs5w4OvbEUbUNseSTVjgEZx+VeadXa9ccQqCkUP5WuQN
         vpn8YrRRCsnN/3nY/PloQQTMl1e7EpdqeybEIXhliof9CXdUuhPFt4IUghqQ5+xur/s6
         Tze1TgJwR5Ffx4ipVMFuyDue/h38WE5kW6HCtNu6FAQ0MdQZqpkEcogHyrDJM2lpuLfB
         4Z/t5jEiC/r+FgknJzN0CYmj25oDUfEPjnL8+2tSlCrSkYhJFPbmW4fjBWLpm5IPQyrK
         GGTaAh3scH07p4/eQXuOZq5lB9DrsLMtabWKjciA46Spa+DwfoWe2G2qcRYsnhxaZBHf
         Tyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bai7uA9Zgr1Dxz6AfyxoBBI60z5ndVSBWprohGAiax4=;
        b=uBj4DqK7/hZb8MAP+Ulsjn9RLGWgMT1s78lwph39VEQnUNgRN6WpnzR1sz2w74wrX/
         HkgzxzZO6o8FpoS9ImUjXcxGNdP4WnuYjxTUHPc64txFT6y+D/hwfW2jUQ+97EhCfqKr
         cBDi1AKoI5yCA9LOiUQK/Mm2MsQqx94l4yyO0CudFi6V6nV0HcEjpmbivxeyU8IrbS3j
         CRnXcS5NjwjYFHYfAnAVuNrvo2h365p9pElul7utp3fDf7hzBcOzLgBCzt8M4wqrMZBa
         oElOsl00nuzqRBwy+RcOSVAxmzTi+Pzi3AtEOMmCTlMxGva2T1+Bz+Iy1e3twAh419sZ
         XoXQ==
X-Gm-Message-State: AJIora8p0qxGnW9iLo+IkUaO+cURIigXt62BIu84VQ6Zufv3j+5kh2pq
        Mn18+dV2DMAHbPZfDSb0jnFnQw==
X-Google-Smtp-Source: AGRyM1s0dJc5gcVjYEXPgUWqRTH19P4dhK1AZJwU2duhUmKpruScIAJJg7eI5CiOAKTtl2Cr0u2CCA==
X-Received: by 2002:a05:6512:234e:b0:487:8835:e92a with SMTP id p14-20020a056512234e00b004878835e92amr162026lfu.190.1657229528577;
        Thu, 07 Jul 2022 14:32:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020ac24e93000000b0047f8cb94004sm7046709lfr.35.2022.07.07.14.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 14:32:08 -0700 (PDT)
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
Subject: [PATCH 3/9] dt-bindings: msm/dp: mark vdda supplies as deprecated
Date:   Fri,  8 Jul 2022 00:31:58 +0300
Message-Id: <20220707213204.2605816-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
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

The commit fa384dd8b9b8 ("drm/msm/dp: delete vdda regulator related
functions from eDP/DP controller") removed support for VDDA supplies
from the DP controller driver. These supplies are now handled by the eDP
or QMP PHYs. Mark these properties as deprecated and drop them from the
example.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index dde82d5f6610..75344694466f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -79,8 +79,10 @@ properties:
   "#sound-dai-cells":
     const: 0
 
-  vdda-0p9-supply: true
-  vdda-1p2-supply: true
+  vdda-0p9-supply:
+    deprecated: true
+  vdda-1p2-supply:
+    deprecated: true
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -143,9 +145,6 @@ examples:
 
         power-domains = <&rpmhpd SC7180_CX>;
 
-        vdda-0p9-supply = <&vdda_usb_ss_dp_core>;
-        vdda-1p2-supply = <&vdda_usb_ss_dp_1p2>;
-
         ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.35.1

