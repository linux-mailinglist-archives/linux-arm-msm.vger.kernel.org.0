Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0303E669434
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jan 2023 11:34:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240593AbjAMKd6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Jan 2023 05:33:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240782AbjAMKdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Jan 2023 05:33:55 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 459D13E87A
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:33:53 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id ss4so44037666ejb.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Jan 2023 02:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bYOqqTk6W0WcbF3/QFz8WMheMJbLViofomUPeNUrXjM=;
        b=yWEwQ8+yBSI7+C+2uY0UASWBa3ZZHy3UUeQhIVUvZbJNDoDSjzqt9pcIdy5vohkSoE
         SxvsLCAANjoXcgweqHR++3P3/e8yrB5z8MGKfmPq2ZVfLMBmdewfKRSHj1F3/nSnkpWx
         ZHm0kC5w2iC1SKa+d8jBMLDA6DCDWIXodoiIY5bRHx8rjLjwtV8COsLJc8zbWL3Pdowh
         NDZ1f0NStjG0bPXSURiOY3K/GT9vnSUDsDGdGbp/39RVKk2SFMEMeB/GrJTS6rfvjzXC
         aLgT5eur7ulGq8Ot58hoJpu0G7PYZ8xSuOzTejQV0LMhNAeDfuzbLtyehKRROUdo2Elh
         noyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bYOqqTk6W0WcbF3/QFz8WMheMJbLViofomUPeNUrXjM=;
        b=jlH7P7Vzm0dXktGdpmu0JyrDHrQG0+lcuRctvRMDAnUT8EUGI8MyG7xnOtGQBo+iRM
         fJz9TSa11gmWkBBhvB43DgSXxTKYf5F0POmRmiJWrqKXjjrcWifNtCpq3yXdjLDh4kxT
         SbAl2PAkHwKJNWyqyI78h1z7kRmvdsw27CdMSPy1E5H4n84wp1rm/RqMKKeanpclhg4k
         TKdpVRjQzyGmFHZS7MVkkddCj1vP7YKDGjCetmhJp4ZoQQkCF7bsqSK4la9FQp/kbuKZ
         ukkQkHtGtCi/nttnj9DFcOHMVDfEDXuQ1yeOKuSbQuU4Uhax783GimDHaL5bSg74MG8v
         7Fwg==
X-Gm-Message-State: AFqh2kpXlNA0ur/8mfOv6tqvyHUzKvuQcT7PVsFyydHwPAaGMDpjygAt
        2khC/wZ4R0O0mp3jO3qsiMqadQ==
X-Google-Smtp-Source: AMrXdXv/ET3OjcfkK4iBVg3ov5aALx5HQAP7NF6nSOUQ1AHdNtC05OscMma3EhHqFBoxKiKmIrwmUQ==
X-Received: by 2002:a17:906:c18f:b0:7f7:a4ed:f2d4 with SMTP id g15-20020a170906c18f00b007f7a4edf2d4mr2638607ejz.77.1673606031860;
        Fri, 13 Jan 2023 02:33:51 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id qw25-20020a1709066a1900b007ae1e528390sm8296926ejc.163.2023.01.13.02.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 02:33:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/7] dt-bindings: watchdog: qcom-wdt: require fallback for IPQ4019
Date:   Fri, 13 Jan 2023 11:33:40 +0100
Message-Id: <20230113103346.29381-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113103346.29381-1-krzysztof.kozlowski@linaro.org>
References: <20230113103346.29381-1-krzysztof.kozlowski@linaro.org>
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

The device specific compatibles ("qcom,kpss-wdt-ipq4019") should be
follwed by fallback "qcom,kpss-wdt", which is actually used by Linux
driver for binding.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Add tag.
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index a1f17c9e02db..e76364c52fc7 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-msm8994
               - qcom,apss-wdt-qcs404
               - qcom,apss-wdt-sc7180
@@ -35,7 +36,6 @@ properties:
               - qcom,kpss-wdt
               - qcom,kpss-timer
               - qcom,kpss-wdt-apq8064
-              - qcom,kpss-wdt-ipq4019
               - qcom,kpss-wdt-ipq8064
               - qcom,kpss-wdt-msm8960
               - qcom,scss-timer
-- 
2.34.1

