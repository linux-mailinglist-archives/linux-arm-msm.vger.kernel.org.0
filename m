Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81F88518503
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 May 2022 15:05:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235271AbiECNJJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 May 2022 09:09:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235871AbiECNIm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 May 2022 09:08:42 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E9138DBF
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 May 2022 06:05:05 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id y21so19794432edo.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 May 2022 06:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0SBCr7UtqnGTe/v3toP46qKZcKN+CT+jT8gh91QnOI=;
        b=FpFzDemp5JAOfv7feq0gNrbwAphBwtF86TL1CKRNuwxEeRgcVfl/mFHV2no7999C4e
         aZWaXxGCYMbf7yRcOt/v+EhsQz93NVJWmaSykBFpZYTC9xwKmQhuKY/xyuTF1yV8l+dq
         EsoU6dx8qc6MJZKHi/Jxc8SUT8v3S5Ot3QUwfYoqHzr8Vcu3E8DjCIM2IWrTsep+VHRn
         F1uU1Y7/7iDM4Twmh4xraXgEpz0QdSbEsj7MBHFcCEOR9qZSGs+zu8svkopyH/y/s5IE
         8c8AXCpn3Uowesjm8Nfn18S6SX2yG9KYWiBsXfyHyI6JRPQparEvbl0VtwJpokWHsSii
         4HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0SBCr7UtqnGTe/v3toP46qKZcKN+CT+jT8gh91QnOI=;
        b=ALbx72VFt94A4WbpXRIA7wy2i8uNsMMqX8VgF8SphJni6p9N+/b5ZeQbF0ntQLIay5
         ypPgFsHtYK67UPVA9HZTSDuqtm5lZzuvygSxHFIiHK9E4DjAsUBQMh84xjHHgc6Pc1Y8
         bvquhGo3j7PwzEYZJnY/sda+O93Amj9N7i3647zb0MadcDx6TI4v17OFA6RYgvkpBCwx
         3Mby4/+JzvVz3IE7Tul1P8WbZIaJ1jo9/QonRtx7ThY3EeNbFEHyQFIKm8fzCVRN7xZ5
         3/hf902lxSUiZTfEwga50uRqVh7199cjkTKxFuEZP73hk2mtKgehmtnvG2OmdmloswBT
         DbLQ==
X-Gm-Message-State: AOAM530biPmUT+y8WRHozZgJcadXMCZL9RXmse4Lo8JLl0bvDvKkPae8
        KHSRihjRChiLUOQWQB6uQ6Munw==
X-Google-Smtp-Source: ABdhPJx0ChXIobPkGkhWdTTODEQzyFRu77Glvj8BqeOTzzb17aBc4FJAO3qzbzS6sVFzqDCv9ox9fQ==
X-Received: by 2002:a05:6402:4251:b0:427:bbac:e1ee with SMTP id g17-20020a056402425100b00427bbace1eemr11658858edb.374.1651583103417;
        Tue, 03 May 2022 06:05:03 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7cccd000000b0042617ba639asm7868782edt.36.2022.05.03.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:05:02 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v2 7/8] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Tue,  3 May 2022 15:04:47 +0200
Message-Id: <20220503130448.520470-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503130448.520470-1-robert.foss@linaro.org>
References: <20220503130448.520470-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
 include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 31497677e8de..7a8d375e055e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
 
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SM8150 and SM8250.
+  power domains on SM8150/SM8250/SM8350.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sm8150.h
     dt-bindings/clock/qcom,dispcc-sm8250.h
+    dt-bindings/clock/qcom,dispcc-sm8350.h
 
 properties:
   compatible:
@@ -23,6 +24,7 @@ properties:
       - qcom,sc8180x-dispcc
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
+      - qcom,sm8350-dispcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
new file mode 120000
index 000000000000..0312b4544acb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
@@ -0,0 +1 @@
+qcom,dispcc-sm8250.h
\ No newline at end of file
-- 
2.34.1

