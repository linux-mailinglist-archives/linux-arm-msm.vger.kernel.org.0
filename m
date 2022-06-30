Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5008F560FFA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 06:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231590AbiF3EYD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 00:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbiF3EYC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 00:24:02 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 287B032EE1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 21:24:01 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id o4so21411543wrh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 21:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+gc2pfqdlbXIZ0VWFy8LDQmiYN4Kvsy5JJdLdp7+YMo=;
        b=wmyNSYLyh3OTKn2BuKgHKW2bZsCk777Bej8jjoIQpWSBskVJsS8zzAvoNCIxKIQLWy
         6wAfGm4AE39f5hm5OLxkibcz85RPO8aD01bbdA+RsmS/JUCU+KozCqlnrDRKaiDQxO1f
         I8/cErG63rx6DilRwVDb0WpvsYXVUAWzPTB8jP8KsU8R5eYhEXTlkNM8PCdzr9zNCMeM
         iYHcXra6nLgGhwZS5l6O6MkaDShZJ5+OxJcnY8YBlYkB1YDosdRI1dZO32Z1rgY2Vjq0
         DGCUAlxMlmtuYjUP2fLw7jOMQe6ZCaj4mrqKPtwAA3BYzkTdg81zaOzYHsaoNMjo5cyj
         izZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+gc2pfqdlbXIZ0VWFy8LDQmiYN4Kvsy5JJdLdp7+YMo=;
        b=McvDt7DCuwI5FtymRc9o8bfhqaUJsF5JyHgP2xBoju3oM1xJhXh3rL2R9TY/AT67tK
         DN7iJlfrrNBiXE6gLBuhYCUmm/5GWfkTlFqXNszqaanFRz5TgnqJsj64+6QukfEDdutw
         oBGTlNSApC5BkVpKaxFWfAanntK72+kf6wu/0liUVbSHwDdB1H/Ee+AFKsvRqq7+HSBS
         ofh/5WF5i3c/QLks7oDFrRxnHzN16ey1pRCqxl2K6zDnMX4TqOtc1LwPk2Ika/AB7XCX
         nlSQWspA2XNhj/afgONnn8q5k8dCW08hh6vUjwUuquX3d5QZZJ3zakVkWRDCuSIyMJSD
         LFvw==
X-Gm-Message-State: AJIora9+YYDRhBbHMdK13w7YS8r9oHmZvsuRlKf8PsddqeV2EoDT1oii
        VhE33IxDDGnS+Hh4vpOkjQ+xX5jsKYscOQ==
X-Google-Smtp-Source: AGRyM1u+q7RLVYTy7D1ioa/GA24TzTsVQh2hDlkZ19jwfVnkPYA5pEkFsR9A8gojXhWJNEgRZ0XMEQ==
X-Received: by 2002:adf:ef42:0:b0:21b:8e58:f24b with SMTP id c2-20020adfef42000000b0021b8e58f24bmr6327192wrp.257.1656563039767;
        Wed, 29 Jun 2022 21:23:59 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u20-20020a05600c19d400b0039c4f53c4fdsm1328634wmq.45.2022.06.29.21.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 21:23:59 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        myungjoo.ham@samsung.com, cw00.choi@samsung.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        gurus@codeaurora.org, aghayal@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH] dt-bindings: pm8941-misc: Fix usb_id and usb_vbus definitions
Date:   Thu, 30 Jun 2022 05:23:57 +0100
Message-Id: <20220630042357.3308128-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
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

dts validation is throwing an error for me on 8916 and 8939 with
extcon@1300. In this case we have usb_vbus but not usb_id.

Looking at the pm8941-misc driver we can have usb_id, usb_vbus or both at
the same time.

Expand the definition with anyOf to capture the three different valid
modes.

Fixes: 4fcdd677c4ea ("bindings: pm8941-misc: Add support for VBUS detection")
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

