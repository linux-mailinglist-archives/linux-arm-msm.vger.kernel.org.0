Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D30ED68C09E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 15:57:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230353AbjBFO5R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Feb 2023 09:57:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230388AbjBFO5Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Feb 2023 09:57:16 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA645234E2
        for <linux-arm-msm@vger.kernel.org>; Mon,  6 Feb 2023 06:57:11 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id m2so34938947ejb.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Feb 2023 06:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWJTTVfePORcPPcH6H13Fd3H36Ls8G0fdQpwh+iYVeU=;
        b=fKTqMQIuB7WUG8GgXovc/jz52P/iOoabODFfhKXj0Q3U+SiQVfbNHEJnDxQYvikyFw
         e4/g0Tp9Rpp/aDwOdkXTnhcBEhQpk8rTu4UvozcZEXJ0Pn+VKnVsLrqgSU/8x8e7sxkq
         bbepctgsfpX2pCXluEa8ir6GtXae4nFUsByhlKqUFLiWU/uw6CX8i1aosy83vd1getti
         rr0FcQSqHXvvKBk3GDm2+pYbnsqDJXHL93aywYZoRWKZrV+1F2/CNy357tFeB9BT9zgb
         WQOI38iOyftOlvKzMdhxxFcASxqFP1vfmQQrG6ZSmLEuKPA6+vyZfnwJR/Csw0CJSj1r
         1+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWJTTVfePORcPPcH6H13Fd3H36Ls8G0fdQpwh+iYVeU=;
        b=j4fRTSJbdW8YkgcwNx6RL04xsrp4v4tQDXpKyAWhN8g4HWK2SJpfkf+u2jCFenwWFj
         7uwoo4lB4RhOh6Rwbvt+AuLn9/qXG0E9JvjEvp1IqXXREMxapZ0FBAXEmWQriCHk54TT
         MZFIY0EbYN+4I3JHy9C6IGA241Z8V2SLQPWsHcsOH9I6/JDTkalaMP2t8JlxW+JQLRRt
         yF6tt0DHC1JHKz1f2K+NHPqRTRlyJ6eCZbJ7vy20/dM/xGsiY2xA82KJj5nomWI1J/EJ
         N3F3NtkiLofDgxuicGBsnf2MEwyIWuf4pbztU6sm01lvDHQSyybF2TO7Ab1/Fg62SL3k
         6eRg==
X-Gm-Message-State: AO0yUKUrQl8OyH/hDgkO8cgsdTX52lX7SWTrxhCmn2FWfu8a4iar/6mv
        GBMpJXU0YPugSOR5pn0efc7DAQ==
X-Google-Smtp-Source: AK7set+4HgFJiQjqoladQOeFPQZGQfugQ/vDao8Mt8Efd3ZTknqyhBJdCUmkYIanNZdlUssgTzzeiw==
X-Received: by 2002:a17:907:c78a:b0:878:7349:5ce6 with SMTP id tz10-20020a170907c78a00b0087873495ce6mr21754698ejc.71.1675695430407;
        Mon, 06 Feb 2023 06:57:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id gw1-20020a170906f14100b0087bd4e34eb8sm5495533ejb.203.2023.02.06.06.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:57:10 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/8] dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
Date:   Mon,  6 Feb 2023 16:57:00 +0200
Message-Id: <20230206145707.122937-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
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

The GPU clock controller bindings for the Qualcomm sm8350 platform are
not correct. The driver uses .fw_name instead of using indices to bind
parent clocks, thus demanding the clock-names usage. With the proper
clock-names in place, the bindings becomes equal to the bindings defined
by qcom,gpucc.yaml, so it is impractical to keep them in a separate
file.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gpucc-sm8350.yaml     | 71 -------------------
 .../devicetree/bindings/clock/qcom,gpucc.yaml |  2 +
 2 files changed, 2 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
deleted file mode 100644
index fb7ae3d18503..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
+++ /dev/null
@@ -1,71 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,gpucc-sm8350.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Graphics Clock & Reset Controller on SM8350
-
-maintainers:
-  - Robert Foss <robert.foss@linaro.org>
-
-description: |
-  Qualcomm graphics clock control module provides the clocks, resets and power
-  domains on Qualcomm SoCs.
-
-  See also:: include/dt-bindings/clock/qcom,gpucc-sm8350.h
-
-properties:
-  compatible:
-    enum:
-      - qcom,sm8350-gpucc
-
-  clocks:
-    items:
-      - description: Board XO source
-      - description: GPLL0 main branch source
-      - description: GPLL0 div branch source
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,gcc-sm8350.h>
-    #include <dt-bindings/clock/qcom,rpmh.h>
-
-    soc {
-        #address-cells = <2>;
-        #size-cells = <2>;
-
-        clock-controller@3d90000 {
-            compatible = "qcom,sm8350-gpucc";
-            reg = <0 0x03d90000 0 0x9000>;
-            clocks = <&rpmhcc RPMH_CXO_CLK>,
-                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
-                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
-            #clock-cells = <1>;
-            #reset-cells = <1>;
-            #power-domain-cells = <1>;
-        };
-    };
-...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 7256c438a4cf..db53eb288995 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -21,6 +21,7 @@ description: |
     include/dt-bindings/clock/qcom,gpucc-sm6350.h
     include/dt-bindings/clock/qcom,gpucc-sm8150.h
     include/dt-bindings/clock/qcom,gpucc-sm8250.h
+    include/dt-bindings/clock/qcom,gpucc-sm8350.h
 
 properties:
   compatible:
@@ -33,6 +34,7 @@ properties:
       - qcom,sm6350-gpucc
       - qcom,sm8150-gpucc
       - qcom,sm8250-gpucc
+      - qcom,sm8350-gpucc
 
   clocks:
     items:
-- 
2.39.1

