Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9516A577626
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Jul 2022 14:33:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231534AbiGQMdR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Jul 2022 08:33:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbiGQMdQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Jul 2022 08:33:16 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5E2B15A2E
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 05:33:15 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id v16so13223162wrd.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Jul 2022 05:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2uCwmHdjg21zPOoZO9GyiM8A7cUULvVI0yDuz4f3uYI=;
        b=t32K0zJnrJk84Oroej5+duxaqm9tE5E/z9ohHiatAtOz0K9wrvwbIbXSP8oUZX3yU3
         Idflt8y7m7oVEDfymBlfVzJKdR0iFa03OQJVN4hNxDOEunTqS+Wnn9BYvsvrzbHLjtk8
         cM1cj9V4ZO7Y6jHRvwUGNnOxQXXmp2qn1VNufvPhMgBQMk3aCneUs55XCW6yzRDUcVf1
         CQ1ARAYVHUCb1BOvVeD9GsKuB9NrcywXserD+qiH88lHk6d/4mS1EQZQwhSW6ovxYsc3
         xYtpbqq7vu0vd+5a1KuikKyqemhqPS9iaAo7e6PjwRQVZddRuswuvAADy8zht61+8m/G
         NkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2uCwmHdjg21zPOoZO9GyiM8A7cUULvVI0yDuz4f3uYI=;
        b=HHq6ZJcQJsX1hnGMoKob+TQxiWUrEp/ckIyPgRRfoizmZrvwwtfWHiN7uzIZE6XkSx
         LaB1JJA2uMg9qRlGjC6sIUFFPIl7iYsQbreOthPwOahuRc+C6AtcMheB0PQ+RuusOXgg
         U44RghFIym9O8idqIvGiJFpuUGFeYhjmGXalFjfYCGtfBTsqft9fmoufU6vHCzzKIdQm
         +JMxV1S6x9tw+/K2PcbX6r5AEmYZZG8TK0Qgz3uO+Qp8muptP5owo19Sva46cwLD6ijB
         LFPGGxIFSJshPBk8t+Z5unOsiR/R9ZFyv5tPJj7QqOquP7LDk0VM3AhbCUnCV026zbRF
         r1mw==
X-Gm-Message-State: AJIora8927Ifv2vwIoh6iiTZvFi2rZO4hBh6VrN7N15znm9L34PZ/nb9
        HsDiGOhnTdTZ6RSyGBSHV1LS2A==
X-Google-Smtp-Source: AGRyM1ujSirm/jZ8J8Xz8yhFRzFmuzdM5ekAtCUG9NdHduCUcRFsy6B14AY8FTjzyClLzEpZyVs/sQ==
X-Received: by 2002:a5d:5a9d:0:b0:21b:8247:7ec4 with SMTP id bp29-20020a5d5a9d000000b0021b82477ec4mr19225709wrb.561.1658061194249;
        Sun, 17 Jul 2022 05:33:14 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id m9-20020adfe949000000b0021d4694fcaesm8146790wrn.107.2022.07.17.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 05:33:13 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        marijn.suijten@somainline.org, bryan.odonoghue@linaro.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
Date:   Sun, 17 Jul 2022 13:33:03 +0100
Message-Id: <20220717123304.938259-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220717123304.938259-1-bryan.odonoghue@linaro.org>
References: <20220717123304.938259-1-bryan.odonoghue@linaro.org>
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

dts validation is throwing an error for me on 8916 and 8939 with
extcon@1300. In that case we have usb_vbus but not usb_id.

It wasn't immediately obvious if there was a valid use-case for the
existing code for usb_id in isolation, however discussing further, we
concluded that usb_id, usb_vbus or (usb_id | usb_vbus) are valid
combinations as an external IC may be responsible for usb_id or usb_vbus.

Expand the definition with anyOf to capture the three different valid
modes.

Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/extcon/qcom,pm8941-misc.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
index 6a9c96f0352ac..1bc412a4ac5e6 100644
--- a/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
+++ b/Documentation/devicetree/bindings/extcon/qcom,pm8941-misc.yaml
@@ -27,10 +27,14 @@ properties:
 
   interrupt-names:
     minItems: 1
-    items:
-      - const: usb_id
-      - const: usb_vbus
-
+    anyOf:
+      - items:
+          - const: usb_id
+          - const: usb_vbus
+      - items:
+          - const: usb_id
+      - items:
+          - const: usb_vbus
 required:
   - compatible
   - reg
-- 
2.36.1

