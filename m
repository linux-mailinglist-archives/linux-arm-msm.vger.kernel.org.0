Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A05D5600EC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jun 2022 15:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233561AbiF2NDP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jun 2022 09:03:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233591AbiF2NDK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jun 2022 09:03:10 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39BF221BB
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 06:03:09 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id r20so22393038wra.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jun 2022 06:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3AwBtfOYMYv3MKFwS6XRJvYCb+XS7virm8BOPqSNmpo=;
        b=vXs1YtTUFgrXwv6BzDSmkZQIQSeDfXGrTalbB6cH5PWeIe7HkPMwx+ks9LDJC6GTy4
         YzHTzDVwBBc+kKdbj8FMBLFBr/2MNyCbRKkrKDggN1SKoFNOFP0nZEGjMDemeM9DuQel
         77MrWf6CIad1Hfa9gsNupl8VqH1+fO76WTLyTsKypsmOS5xYj7/pzvGQqWOAdTNbua35
         bgYggYiWPng0amd/AdTBDPJxcblljL1FR90gdWu9Kj0Pq9VdZ6uqpnY6lrGGMT/8xBqF
         PAkD8UQsNl+AlLqGSypOcKnmeCjrMbXUrXnH9bFUF7d+f7u9ZeH+9La8z2CyT0q81vIW
         DUlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3AwBtfOYMYv3MKFwS6XRJvYCb+XS7virm8BOPqSNmpo=;
        b=NgaJO1JOmFmX4I3ksjOQvQYHi/p0G7D3h18mdvq9LW9tAojRVI6skBjXMqvRKI0r62
         cIZaV8DdIKDD0RE90sId+wnZJ8NHjSst7JMNra8TFNi4MKWGAWe1ualS6ubAzvlalT9K
         KeIrpuF6CUOlXQpyuQ1QW60vkfgy0ytW2//x1JstkT+kxS1sT6BK3oa32Nq0tlSHj7OJ
         tstYaApGX2flSHMXMHA/AMczZI/MLj9TlKhppQUMayLvtZ5RLBplDgTE9pE4xZ57k4YN
         nFjoqJRE0BnaOKW9HgU3mFLxOKN36jBc/fQxP7QCe+i8kEcy0+T2LtJ05vLXXq0ZHiEa
         uceQ==
X-Gm-Message-State: AJIora/ulBZRG8srpuYG5GJrC2j5Fibq9ekMw0Vzj6lfhtUTX6MMaBRn
        FXBmVMUv87Kc3F+BVDX62RJvAg==
X-Google-Smtp-Source: AGRyM1vtGJPoJn0iOSIvDsybyER+K7qSelOxtXN41Z2C9n6cc4fqXeYEwm81M46uJWyE1Ul0QGBKFQ==
X-Received: by 2002:a5d:52c6:0:b0:21b:9f39:78de with SMTP id r6-20020a5d52c6000000b0021b9f3978demr3172858wrv.699.1656507787788;
        Wed, 29 Jun 2022 06:03:07 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g1-20020adffc81000000b00213ba3384aesm17056979wrr.35.2022.06.29.06.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 06:03:07 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
        rafael@kernel.org, viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [RESEND PATCH 2/5] dt-bindings: opp: Add msm8939 to the compatible list
Date:   Wed, 29 Jun 2022 14:03:00 +0100
Message-Id: <20220629130303.3288306-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
References: <20220629130303.3288306-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm8939 will uses this driver instead of the generic dt-cpufreq. Add to the
compatible list.

Cc: ilia.lin@kernel.org
Cc: robh+dt@kernel.org
Cc: krzk+dt@kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 5eb1dba13fe2b..7efae476c02e0 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -25,6 +25,7 @@ select:
           - qcom,apq8064
           - qcom,apq8096
           - qcom,ipq8064
+          - qcom,msm8939
           - qcom,msm8960
           - qcom,msm8974
           - qcom,msm8996
-- 
2.36.1

