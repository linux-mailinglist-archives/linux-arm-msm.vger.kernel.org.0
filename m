Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89C5A596F69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Aug 2022 15:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239680AbiHQNOg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Aug 2022 09:14:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239605AbiHQNO1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Aug 2022 09:14:27 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 201354BD03
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:24 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id w5so18961703lfq.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Aug 2022 06:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=ylRikkO/bjiVr6cfpMQukwsajH9gmB7MCgQxpA3FZjg=;
        b=PlW7Mtcl47MpdE/4X+zlMXjbRlUXpGWW9lYJlFzAkyhQ6HaAUQuNhxHKHBZATug0fV
         qWWX0jOXCVp+nAnrGjjF7KUBOemnJGrR02np5S78KK79cjImAtHquy9edBoPFqJ1zp5T
         sxPsNlena2Y/2n9nF2P6+V51h8teL+21UMhJNmrqGofHl8pDvNYByk7pnsQSIaPyKLr4
         2LzUPkeLxCO/3TpJnod9YLGzhENtwtomzyI4wdvNDWiqh7rDVci2w1728KL/JHXN9d0k
         OOV1Hd63+mI08bZZDt1S+FdV6Dtz68N3ZL/czhDm4NXBFmrPYnbwWb0K5GgrPluFd5hl
         JFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=ylRikkO/bjiVr6cfpMQukwsajH9gmB7MCgQxpA3FZjg=;
        b=ikp3kI4QXIeQ4VSRULIQDWp6hzef+LVwq8jT9jvcM75v5g8zm3N0yOR88c1qZ/BevL
         n4GcCvMLxCpFolgeiWQMIDK1CIox/X6MIserALUsBeHhAlZ58J51yR7HUvKr1hLPBqWw
         0Mv2TEPUjNHU6bdGL3nnhepuwmw9VY2uwSJXEyGVvBRNM2k5zFL+zoYgmc4l2Jgtnb1w
         L9isYjKtV5gFLAWPUJPKhwNsYt1d0P8GRl9MY8eSBdb8b3WtQMONrA7zDMAWLHFr/W4M
         eGEroQEHTKWN061npKQHqJ+0OL1sRl1aWoBD4/36r0z8Ik3SbJsRb/Rh+CEJAGt7+Apn
         PnWw==
X-Gm-Message-State: ACgBeo3iUF9jtRpWBssHO0H51Y8bDLdU66Bjj1h39GgDkqW+gRa06SuO
        DTJXIWNRGNU5fo/3AlUA01xV5w==
X-Google-Smtp-Source: AA6agR7hK/LtVDTNcW/FOB3ZBLh9ErM5S9vA8oOiKLvSKbz5Ptv+gx5OFqdfNPZpxNBEgxnzgv8Lag==
X-Received: by 2002:a05:6512:4c7:b0:48b:29bb:8195 with SMTP id w7-20020a05651204c700b0048b29bb8195mr8347371lfq.386.1660742062364;
        Wed, 17 Aug 2022 06:14:22 -0700 (PDT)
Received: from krzk-bin.. (d15l54h48cw7vbh-qr4-4.rev.dnainternet.fi. [2001:14bb:ae:539c:1b1c:14b7:109b:ed76])
        by smtp.gmail.com with ESMTPSA id k1-20020a2ea261000000b0026182f31aa0sm1411307ljm.1.2022.08.17.06.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 06:14:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Lee Jones <lee@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 01/12] dt-bindings: hwlock: qcom-hwspinlock: add support for MMIO on older SoCs
Date:   Wed, 17 Aug 2022 16:14:04 +0300
Message-Id: <20220817131415.714340-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
References: <20220817131415.714340-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Older Qualcomm SoCs have TCSR mutex registers with 0x80 stride, instead
of 0x1000.  Add dedicated compatibles for such case.  Unfortunately the
binding started using a generic "qcom,tcsr-mutex" compatible without
specifying the SoC part, thus it looks now quite inconsistent.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If anyone ever says "I want a generic compatible because I am sure all
devices are compatible", that's one more argument they are wrong. :)
---
 .../bindings/hwlock/qcom-hwspinlock.yaml          | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
index 1c7149f7d171..de98b961fb38 100644
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -15,9 +15,18 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,sfpb-mutex
-      - qcom,tcsr-mutex
+    oneOf:
+      - enum:
+          - qcom,sfpb-mutex
+          - qcom,tcsr-mutex
+      - items:
+          - enum:
+              - qcom,apq8084-tcsr-mutex
+              - qcom,ipq6018-tcsr-mutex
+              - qcom,msm8226-tcsr-mutex
+              - qcom,msm8974-tcsr-mutex
+              - qcom,msm8994-tcsr-mutex
+          - const: qcom,tcsr-mutex
 
   reg:
     maxItems: 1
-- 
2.34.1

