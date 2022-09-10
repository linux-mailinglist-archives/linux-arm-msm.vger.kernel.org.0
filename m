Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51A375B43AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Sep 2022 03:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229599AbiIJBmN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Sep 2022 21:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiIJBmM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Sep 2022 21:42:12 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7902F7A751
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Sep 2022 18:42:11 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id o25so5875564wrf.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Sep 2022 18:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=UDIQkC2ms264gTGFxnmfmclKEemKDBECbA2lZM/6kdo=;
        b=gcW1kZw6a6GiKsTL150Mz2Bpwe8UjVLyN7DsTkbpz/IPhRj32gL8q66Wix+Jc6OV5q
         Yr0HibEp8lA7hb8nLRVMpQTAgxMf7Y3B07klgbRYwHZ/yAnTw6L+EBrN3Ni0+W5erRBO
         Slv45CJw6r4G8yF5ts/5LgymcXlnTK5C0HQiL1KayNGcVWuEVKcFk04NsCBOBPL/BkUx
         3vz84G8Y0D6bW7MBrELFKhiHUGiGlt/UmDY+lPe7O190S1jsKz+9MlcY6ORMfFNiWHOC
         oUv2LbZ9k67+Ee0xKQkRuZOsCubOC+B6ht8LBGVdgrqVm/HxNbIzgbapZOQ4dxzhOy3S
         V4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UDIQkC2ms264gTGFxnmfmclKEemKDBECbA2lZM/6kdo=;
        b=7wEwp/8KtGT5gWmph5LYAddg4+PqF4Jc7Ks94wMdtL8/Sk7jm0wgyfdAlnQ1DRGEWf
         m9yIvEq9wWMEeViP6aPQ5IQtmiiC3Kyp92523Dm4vpwLWZso/z0oXBim+SO0HsuL6r31
         j+FsEJZYGxh90p326C3juA7HkLnkgi9aQ6BDaQI1w3I4+pgyr9FjNTVbL1sxLS1DSNDC
         9N0eg6MjhXmHDSHjgqVMG9UpSZMBmCUHj7lZoEngE+Y27O/MDVCUpCbaw+MwOwbhmbBF
         pURIT50Xn7OIv54qGD+FT7GVVjaDQc7j+9PoNAD4Uxv43bAr8BGKSAqgsHmWP8ALT6m3
         8yyQ==
X-Gm-Message-State: ACgBeo01iGnNaD/o7OfLquwHoJWMujrHGSQSlkDbStRZCoMDQ+4srWu+
        VAxsFNHHFPd7S6re0CkPDmXJVg==
X-Google-Smtp-Source: AA6agR4A3uAkZnwfWr+B70Bhxrm/cGUVMICHkrtQXyMQXuot0E2VBOK1nib8BJsfwaZyN6b7pCRFzA==
X-Received: by 2002:adf:e199:0:b0:228:60f6:f775 with SMTP id az25-20020adfe199000000b0022860f6f775mr9290646wrb.478.1662774130058;
        Fri, 09 Sep 2022 18:42:10 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id j24-20020a05600c1c1800b003a8434530bbsm2420910wms.13.2022.09.09.18.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 18:42:09 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH v2 1/1] ASoC: dt-bindings: Mark old binding qcom,cpu-lpass-apq8016 as deprecated
Date:   Sat, 10 Sep 2022 02:42:06 +0100
Message-Id: <20220910014206.1101962-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220910014206.1101962-1-bryan.odonoghue@linaro.org>
References: <20220910014206.1101962-1-bryan.odonoghue@linaro.org>
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

We've had some discongruity in the compatible string of the lpass for 8916
for a while.

Mark the old compat as deprecated. New SoC additions such as msm8936 and
msm8939 should use the compat string "qcom,apq8016-lpass-cpu".

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/sound/qcom,lpass-cpu.yaml   | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
index ef18a572a1ff3..e2c0f573a3084 100644
--- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
@@ -18,11 +18,14 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,lpass-cpu
-      - qcom,apq8016-lpass-cpu
-      - qcom,sc7180-lpass-cpu
-      - qcom,sc7280-lpass-cpu
+    oneOf:
+      - enum:
+        - qcom,lpass-cpu
+        - qcom,apq8016-lpass-cpu
+        - qcom,sc7180-lpass-cpu
+        - qcom,sc7280-lpass-cpu
+      - const: qcom,lpass-cpu-apq8016
+        deprecated: true
 
   reg:
     minItems: 1
-- 
2.37.3

