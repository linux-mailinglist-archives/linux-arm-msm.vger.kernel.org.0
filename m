Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0543B68B343
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Feb 2023 01:27:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbjBFA1n (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Feb 2023 19:27:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjBFA1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Feb 2023 19:27:42 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FDD18147
        for <linux-arm-msm@vger.kernel.org>; Sun,  5 Feb 2023 16:27:40 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id mc11so29811042ejb.10
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Feb 2023 16:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWJTTVfePORcPPcH6H13Fd3H36Ls8G0fdQpwh+iYVeU=;
        b=HULpsXVGKRFy+h69lzY/L1ZYutzwew53C7+pgIYNEeIeDJsMUY7bxZbtbW01I3baTm
         eFNmrrTrOWe/9b+8D95YsVYZ4LvuQMDB73UuEJsliTFpr3MKqN12u+Cx3WQUZ8vcshPj
         SMjbZlG+thtWRa7UJIYEvTTOGPiyfb2JWO1vpXVe/doVRSBsjs2XOqNr2zVZ3criO9ne
         gPNN+z9aDBbZq4G/6wf7RTf9A71lEV/N88bsJBWprpj21HKGQEIUp+BasEeOzvKW4JTC
         tct1SmqhCI2LRdyun9JwmN7Pb8MNkAzhqkX6z+c6HJvXTSTry+f9CYHGbJE6AFoGLLXA
         zxRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWJTTVfePORcPPcH6H13Fd3H36Ls8G0fdQpwh+iYVeU=;
        b=nZCp+grt6HyeLcfUmgGNXZ9B2myCINlDSmNtk4k82L7F9A5ASiblqgchjfC/25OFcx
         Avi/XeR+E9hzoYZWQygKiIUxTDPguvLS4Df2/qNMiA4H/uha/4jVj3y1BZvVZFAWu/GE
         +20EBXj5L7IGsL5WOgAlv9wmq01VNpmdXnvQv8i1Ub9SCy4bHEkRZGMog+1skRFmyuBy
         /x9MafDTHiHPB/oBBMFlrIvwBtSQiNbJRxeYh0x4aFgq6uPBUVZ1+/A/mMzsVe3z2jr6
         5+8QfDAaggmR8mv+OsGgCdftStasZrRQjpXYjbUhqiRD6Bzc0f60sZgGWRkh9GkIZH0c
         yRFg==
X-Gm-Message-State: AO0yUKW5R3PFSrSXfhy5QT4pqFjWgY6ZAyZwhDx+hTUg0lyXQ1hGzGgW
        /zICSuY+r6AoRHDWzXBZERvnwg==
X-Google-Smtp-Source: AK7set/n2hRRJljwHkVMRXSMpZMx6IoxKU6T9qwpJCv1uTh2yARMMOvKgJD+paX8nsKxzTILG6UZEg==
X-Received: by 2002:a17:906:4fc7:b0:87b:1be:a8c2 with SMTP id i7-20020a1709064fc700b0087b01bea8c2mr23061840ejw.73.1675643258870;
        Sun, 05 Feb 2023 16:27:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y18-20020a1709063a9200b00878b89075adsm4716085ejd.51.2023.02.05.16.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 16:27:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] dt-bindings: clock: Merge qcom,gpucc-sm8350 into qcom,gpucc.yaml
Date:   Mon,  6 Feb 2023 02:27:27 +0200
Message-Id: <20230206002735.2736935-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
References: <20230206002735.2736935-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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

