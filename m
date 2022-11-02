Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E677615DEC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 09:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230452AbiKBIiR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 04:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230431AbiKBIiO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 04:38:14 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 489AD24F22
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 01:38:13 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id d59-20020a17090a6f4100b00213202d77e1so1464055pjk.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 01:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jQnAjVM8KfWMqcwU3yG9m91ABhfRemXy71C0Mul10HU=;
        b=BI5z3t5yh+o/6QROXQ6AMqcln1aDKa4g86WvBaWv08SoJh/CN4rpQJxusRiuGqubs3
         0WKp/NDTUz2/m4GvxtOKJybTLZBtjcCpjj2xkSoaqzwHfLROyh4mIRqDiuEPWkeSsBJz
         mJ0WEEO7xVScBm9QejSv5iKbaDFRPnEY+LhjOrEGX4V9nOd91nFhC95M0GNBinOthfQA
         bdH9/BADrpnxUJTwYvjk2RDtf+NFSc3pPYzZs48nYMYxMoj+2vXn6IY4Yb39O1nt+p9A
         tr6pOV3jUfPvwEL2quP5wv98BXGLmipv9MQoUzIWqMTRMMEMsGTJcY8Ysrf5YeuUYfB+
         tdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQnAjVM8KfWMqcwU3yG9m91ABhfRemXy71C0Mul10HU=;
        b=aDi8UZAOE4EkK1w6wu3ivl5qTXjdH4c5frcjUEf3MqtwcejGyJCoJYafdiAqWbRwMt
         9YkVCeRCL3zUOejYgsXap2prAD426L2J/lMD5AEJO8B/g9qXuUh2AUuM0g813vMGELv7
         1lGR2MxyxcRzpg66pIRQaD1SQiLgKfKgjfMZ+43te6GLWfwfF17oNUGErjSlYIQnj+iK
         Toagr1/zdRNLaMzs5Gl+IUo6QrB12yfofPRNa6LfqLpC9jv8hEhiMk0yGIA3RiBaOB+C
         QPAT3Ky5isEBBT+wO+fJJNzHb/Kd8oYoTkTDuywiJJf+E591Mf2dZ/GTUsVAMOAXbZhH
         6xMA==
X-Gm-Message-State: ACrzQf2se6NXckAsqXhxS+e/9sAnjIQ2JyItMD+iZ2lys41DQdfBWQ1n
        8mc/JuQZN+3eP1cu1CEo24yF
X-Google-Smtp-Source: AMsMyM77dg5YxTTvjtwAYBd+pJTnRDwtud450+37wTGwfMoZBBFV0IUkYDuLrrWRee0lywU00ZFaSw==
X-Received: by 2002:a17:90b:1bc1:b0:213:e2af:b1f4 with SMTP id oa1-20020a17090b1bc100b00213e2afb1f4mr15165846pjb.47.1667378292730;
        Wed, 02 Nov 2022 01:38:12 -0700 (PDT)
Received: from localhost.localdomain ([117.193.209.178])
        by smtp.gmail.com with ESMTPSA id x19-20020aa79573000000b0056bcb102e7bsm7887770pfq.68.2022.11.02.01.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 01:38:11 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     andersson@kernel.org, viresh.kumar@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, rafael@kernel.org,
        robh+dt@kernel.org
Cc:     johan@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add cpufreq clock provider
Date:   Wed,  2 Nov 2022 14:07:49 +0530
Message-Id: <20221102083751.56330-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221102083751.56330-1-manivannan.sadhasivam@linaro.org>
References: <20221102083751.56330-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_WEB,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm platforms making use of CPUFreq HW Engine (EPSS/OSM) supply clocks
to the CPU cores. Document the same in the binding to reflect the actual
implementation.

CPUFreq HW will become the clock provider and CPU cores will become the
clock consumers.

The clock index for each CPU core is based on the frequency domain index.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index cbba8979fe0e..2e0336163ffb 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -57,6 +57,9 @@ properties:
   '#freq-domain-cells':
     const: 1
 
+  '#clock-cells':
+    const: 1
+
 required:
   - compatible
   - reg
@@ -84,6 +87,7 @@ examples:
         enable-method = "psci";
         next-level-cache = <&L2_0>;
         qcom,freq-domain = <&cpufreq_hw 0>;
+        clocks = <&cpufreq_hw 0>;
         L2_0: l2-cache {
           compatible = "cache";
           next-level-cache = <&L3_0>;
@@ -100,6 +104,7 @@ examples:
         enable-method = "psci";
         next-level-cache = <&L2_100>;
         qcom,freq-domain = <&cpufreq_hw 0>;
+        clocks = <&cpufreq_hw 0>;
         L2_100: l2-cache {
           compatible = "cache";
           next-level-cache = <&L3_0>;
@@ -113,6 +118,7 @@ examples:
         enable-method = "psci";
         next-level-cache = <&L2_200>;
         qcom,freq-domain = <&cpufreq_hw 0>;
+        clocks = <&cpufreq_hw 0>;
         L2_200: l2-cache {
           compatible = "cache";
           next-level-cache = <&L3_0>;
@@ -126,6 +132,7 @@ examples:
         enable-method = "psci";
         next-level-cache = <&L2_300>;
         qcom,freq-domain = <&cpufreq_hw 0>;
+        clocks = <&cpufreq_hw 0>;
         L2_300: l2-cache {
           compatible = "cache";
           next-level-cache = <&L3_0>;
@@ -139,6 +146,7 @@ examples:
         enable-method = "psci";
         next-level-cache = <&L2_400>;
         qcom,freq-domain = <&cpufreq_hw 1>;
+        clocks = <&cpufreq_hw 1>;
         L2_400: l2-cache {
           compatible = "cache";
           next-level-cache = <&L3_0>;
@@ -152,6 +160,7 @@ examples:
         enable-method = "psci";
         next-level-cache = <&L2_500>;
         qcom,freq-domain = <&cpufreq_hw 1>;
+        clocks = <&cpufreq_hw 1>;
         L2_500: l2-cache {
           compatible = "cache";
           next-level-cache = <&L3_0>;
@@ -165,6 +174,7 @@ examples:
         enable-method = "psci";
         next-level-cache = <&L2_600>;
         qcom,freq-domain = <&cpufreq_hw 1>;
+        clocks = <&cpufreq_hw 1>;
         L2_600: l2-cache {
           compatible = "cache";
           next-level-cache = <&L3_0>;
@@ -178,6 +188,7 @@ examples:
         enable-method = "psci";
         next-level-cache = <&L2_700>;
         qcom,freq-domain = <&cpufreq_hw 1>;
+        clocks = <&cpufreq_hw 1>;
         L2_700: l2-cache {
           compatible = "cache";
           next-level-cache = <&L3_0>;
@@ -198,6 +209,7 @@ examples:
         clock-names = "xo", "alternate";
 
         #freq-domain-cells = <1>;
+        #clock-cells = <1>;
       };
     };
 ...
-- 
2.25.1

