Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17FF6514EE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Apr 2022 17:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378196AbiD2PQ5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Apr 2022 11:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378165AbiD2PQn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Apr 2022 11:16:43 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC82BD4C65
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:22 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id k23so16067048ejd.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Apr 2022 08:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t7lOY18RHlZ0BRHPiFyuqSErNh+XH4pnEzjovY987mo=;
        b=bd4cKg/YJO9uNiXNz2ptctAHSlEMc/8+uk7IpV09iAP/ktqU3v3zz+nlAlPWgUVQlY
         wfjOmNPpz3Or4aKQNrvzy0zCwGRq2GPs5t9BN9zhZmAC7M2cmQVwEm+lcU/w5RS5J1No
         TLUl/IXvCS+5ACzn6DouqT+pel95NaBj4PBWrde3gZ+AXUSzhUUYRN0UKTi8SRQQlUMk
         JqPd8nXzJZGwQEPMGxTXUTiDKXlISc0L8IlNEgq4wdFVBKG/MYdZdjBAk/3X+0NE4wvL
         c2UacIqwny/K30VZ30tfcc3XVGsAhZX8cw90PAuYG/r6vt7UNQqx5itUBDoteK7j8v+Z
         ld/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t7lOY18RHlZ0BRHPiFyuqSErNh+XH4pnEzjovY987mo=;
        b=eUut1KJi8fLvdgA3CpBHzqCelWgxCdWb0D9o9eAvy11LT63h+MFjiElZfvoZC5Lqj5
         LtrCMyKoC8p8U48+a1im5F+u+08EkOj1/+QZoq4WwIWQvNw++HT1NgoITcKbsvPzzSXK
         4TPbuVTkduswETzQl74BEGHc08Q9mQCngV7d8EKWuva1F0yxO8ePx7/CCArDEh1OXeWc
         qTS9HlXVmLjkg/AxWi32JGAh2WIUDDf77Tm6HsOCPhs7CD+n+9UY9/vVAueZW6TjDxVx
         ZOuYReSErxXHbjEk2teBWte+erfyb/i5WWxcnGeFrUPzGQ8jcfsQlo//PwP55BH9U1Cf
         2yeg==
X-Gm-Message-State: AOAM533GtaC69xi9HYkgNKUa6EhduLcCvmgJK6Ss85v1eO4EYQ9xqJ+x
        TOi4kZdoYCWC92F9JlwNhGRTuQ==
X-Google-Smtp-Source: ABdhPJyiUiFYbed8YEoHLc9yAXU/m+TLLx6s5tqKTIOVWFqJ6vqYGODES6q27KDUUvpBQGdpzBVulA==
X-Received: by 2002:a17:906:c14a:b0:6e8:76d0:e0eb with SMTP id dp10-20020a170906c14a00b006e876d0e0ebmr35781195ejc.412.1651245200918;
        Fri, 29 Apr 2022 08:13:20 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id zp15-20020a17090684ef00b006f3ef214e4esm712677ejb.180.2022.04.29.08.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 08:13:20 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v1 7/9] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Fri, 29 Apr 2022 17:12:45 +0200
Message-Id: <20220429151247.388837-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429151247.388837-1-robert.foss@linaro.org>
References: <20220429151247.388837-1-robert.foss@linaro.org>
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

From: Jonathan Marek <jonathan@marek.ca>

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Due to qcom,dispcc-sm8350.h being a symlink, checkpatch is not happy
with this patch. Other than warnings related to this, it should be good.


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
2.32.0

