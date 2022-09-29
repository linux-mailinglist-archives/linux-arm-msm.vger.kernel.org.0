Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCE925EF1BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Sep 2022 11:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235582AbiI2JVx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Sep 2022 05:21:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234939AbiI2JVv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Sep 2022 05:21:51 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8700212FF0E
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:49 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id k10so1341046lfm.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Sep 2022 02:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=hW4yNt9fG4pRCpDzEdmb4e/N01zz4GZdn2Oz7sGKOzM=;
        b=Yj01Yq2njr7MgM3THhEe81+z3RpH6IIFrxzmAa9gBodgWTntxfMbX/Dq59oU1bQt3a
         zXozq0ToCWXkrcDpq1PPfHj6WJiOc4jrUr4its5+lz2PDkxEmdiDFp5ErsU2Zjq6oT6/
         Ka8Zm/at42NBX77Gr7WfeFXej8015U3zQpoa51NfIgpODTh8VkoQV5vEPPAf0ZOWhiEX
         0N7691diN0KjXlnkyyRjsmqvFabc1EtNxFnWNCmUU1kDqfTWSmIaj5X50iEWkI2sxqL3
         6LK8DPU9fPR/6vTb3z53BpUOMl9yQAgI1NcwDWfWj7UKKDSi5mXjvgvhIF1Q8yuGPknK
         Dq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=hW4yNt9fG4pRCpDzEdmb4e/N01zz4GZdn2Oz7sGKOzM=;
        b=q07QEQi5Jh3+obZ8qKIZ1njKl12E/sboIKTOxCOcJd5QUc3ZU+1TKQgpXhbto2D9pG
         DGWiyMcVxMX0u7QBxOe8FDzeHJs0+TbjhsAc4TwT0WE7GOqHPbgV+W6p1lF/AluezVmx
         DaeNTxOmqT4+EZsujpxmySlR1LRQe7IZ9x69lXLyZcwRYnehAFNU7zNRoZIX8U1qJhxN
         UgYJOllUP/fV8OEAreLAJQEks3QscKVXyr0hm3YcD/2QerqXmM+aaaHbDufReaGNhk/O
         NV4KRN+eTCBmetghBTmN6fNWt6Ah5AoAXdKJCeiWyJgUPZYy/zAaK5LvjbCM4kBlGCEp
         iA/g==
X-Gm-Message-State: ACrzQf2C6Xmz4M3jII1FvP+q8VXL7mr1XgGzMZtsRCKbYVl9r/SjRw+p
        CTp6m/PoNZSMXUWz+nM/CgGhCw==
X-Google-Smtp-Source: AMsMyM7sbQzmGrSDHPIN0cOU8chX7FEO+7RKaET+8dMHMol1lyuK05jHKTZj4ovg95qKZqjfUv17tg==
X-Received: by 2002:a05:6512:239e:b0:497:a36a:9ae with SMTP id c30-20020a056512239e00b00497a36a09aemr993269lfv.378.1664443307551;
        Thu, 29 Sep 2022 02:21:47 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c22-20020a2e9496000000b0026c687f9f7bsm633271ljh.107.2022.09.29.02.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:21:47 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/11] dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8974
Date:   Thu, 29 Sep 2022 12:21:36 +0300
Message-Id: <20220929092145.473009-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
References: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
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

Define clock/clock-names properties of the MMCC device node to be used
on MSM8974 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 03faab5b6a41..78473475c68d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -99,6 +99,44 @@ allOf:
             - const: dsi2pllbyte
             - const: hdmipll
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,mmcc-msm8974
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: MMSS GPLL0 voted clock
+            - description: GPLL0 voted clock
+            - description: GPLL1 voted clock
+            - description: GFX3D clock source
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+            - description: eDP phy PLL link clock
+            - description: eDP phy PLL vco clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: mmss_gpll0_vote
+            - const: gpll0_vote
+            - const: gpll1_vote
+            - const: gfx3d_clk_src
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+            - const: edp_link_clk
+            - const: edp_vco_div
+
   - if:
       properties:
         compatible:
-- 
2.35.1

