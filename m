Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFF8D54F78D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 14:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236636AbiFQM3d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 08:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382143AbiFQM3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 08:29:31 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8815EBE5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:26 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y29so4579518ljd.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/Z+AMU7vrtO5o4KexqAVpmPzeKjXxbfUDDVj5eR8YgE=;
        b=NasIhQJ8njHh6EJ/Jb/E09pmIvlloYmqEDStQrVhi/XB53zTcgNqqfL7DFKcu1JhD+
         bxijVAyhVOFnyWLjPegjK12n4AXIpxy6UV3S2lHZ1mkjR2U7H3/1q6cO2+l51XjaN9BS
         qsViaWRsyv0HpfA/ixgndDmBt/ZGTP6Zrso943pu1yPg4ftwtz094PIhxJoW6agEqjhh
         5yeIB46cNoflK35gQAxIEVJEoeuRKy5wX/htwzRZ5B+ma0+P8DUaySOM6GkFpE5PPyEP
         MsgwkTXn1bLKBzsYdj/wYCmydcHRy1nIRVDwUCr8TUyu46Vg1ABHURiilSySint0zxIj
         lx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/Z+AMU7vrtO5o4KexqAVpmPzeKjXxbfUDDVj5eR8YgE=;
        b=uTLL9AH5ELR4pIdhf4XEvOil0jXZBDQGztjfRBJvCiy1rm4ITc2SOJHWVJiw9BtNKm
         Cdpwn9dSL/ed2kS8MTn243wPRM2xhF4qYRAPwoXRHESm4YXsroFxYTOai5ExrjxjTu23
         hqqOwdWvJjfqmS0mDqjDLkripeoTjgF6zvalox5lqBLb1yLRPB3MBYE4uBTCD9sOSxV/
         Kkq5EmBQHAtQstsQi+vlGz+1/PkKgmKZKYXSmsvcDRa+heGDePp+B3ZDXKNru3pvLO84
         BX17NsHh0ZiaQTTCyghCfvJbT3aXtfnGaPFxeObncK1QNI+yZ3Yi5zyOtlnJbaOWquN2
         lfow==
X-Gm-Message-State: AJIora+bLxrlLY0oXabNJgTtnqAa/Hst5tMlCRqZGRFqIwICCVX48hQm
        96aDVFi8WEDT9nbpZ/KOGZREnw==
X-Google-Smtp-Source: AGRyM1uET43SPf2YBPsiv9lOOHA8Rj2QWblgCJX1YA2Tz/S75RJhO36ZkZK0JQNdouoNm+wI/txKuQ==
X-Received: by 2002:a05:651c:1988:b0:255:b2ef:6a5b with SMTP id bx8-20020a05651c198800b00255b2ef6a5bmr5012858ljb.465.1655468964896;
        Fri, 17 Jun 2022 05:29:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8948000000b0025568a2a018sm539471ljk.129.2022.06.17.05.29.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:29:24 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 2/6] dt-bindings: clocks: qcom,mmcc: define clocks/clock-names for MSM8996
Date:   Fri, 17 Jun 2022 15:29:18 +0300
Message-Id: <20220617122922.769562-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
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

Define clock/clock-names properties of the MMCC device node to be used
on MSM8996 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index d02fe6dc79b5..f1d8325be4eb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -31,11 +31,11 @@ properties:
       - qcom,mmcc-sdm660
 
   clocks:
-    minItems: 9
+    minItems: 8
     maxItems: 10
 
   clock-names:
-    minItems: 9
+    minItems: 8
     maxItems: 10
 
   '#clock-cells':
@@ -113,6 +113,35 @@ allOf:
             - const: dsi1pllbyte
             - const: hdmipll
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8996
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: MMSS NoC AHB clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: gpll0
+            - const: gcc_mmss_noc_cfg_ahb_clk
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+
   - if:
       properties:
         compatible:
-- 
2.35.1

