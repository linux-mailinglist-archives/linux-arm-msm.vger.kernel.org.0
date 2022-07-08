Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0A7256AFDF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jul 2022 03:52:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237159AbiGHBo2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 21:44:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237168AbiGHBo1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 21:44:27 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE76C24F22
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 18:44:25 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id bi22-20020a05600c3d9600b003a04de22ab6so245017wmb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 18:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zzwiIB75BAWXHQ1Oucx/2up/baq7so/2ltJZoy05TUg=;
        b=BWxnfPlV8Q8BYyXMLqgy9hjFNavcy6XvYfjcuZySNKLLpX7kYZP29mLdvn8U9h3DNu
         pGQVijc8PbXDyGp+hl5HvKLIE3jMRKdXNnctSVWT3SXfK4piHeVsRU+KwhT4raSbWbJ8
         Oacrx1luBpcRNAUFIUcjXN8hETTVT1Iu3OkdOnf1OokqxzMRMJWXKX8R5R3K9Ib/Xgqz
         nVGRe6By1k+E+Tm2CXxHuRYPtmGNGtNiy1RdxmU6EKN5wjOKrZUuBNi6H8/ZWWS66FSz
         Rw2YHIjaa4GNC2vbKGjVsZu+Z9f+ts2De9boMOBquRHRQr+9sr4FKeqPB0n1sYB8SJKJ
         go3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzwiIB75BAWXHQ1Oucx/2up/baq7so/2ltJZoy05TUg=;
        b=pxBkz12PbiUm8EYA1Wgps2tFZcLrWdKPzQeQ1wTaKmGywcIaC2jLDq911b58Enm+B6
         LfoX2iv2zHih27C1oLc2tBM27WoAXDJmeh740FhzC9S+acD1N7IsWGM8pNLVyACLFaiK
         mnqWD0T465QjW5QMoyl7Y4cGqJ0lBlBqBqKoTrMFf6YERbu0uO5PiOrrNvF4k3Dfz1ze
         06+lCrHygjtRhW3jcUao40KhV6DcdoH/bQcGgYRCxYTCZcyi5dc92YcF6fEKiJEyOsAj
         5tbmEm9ZAf6pOyWL03fAfvGhU9LL2x+lyh7iHgfVTmH+30iLrrXKTGm9eGmn+8xh/Qh9
         xQQw==
X-Gm-Message-State: AJIora+n8CzM0ubg15EPttk4Z7UK3a/eKypfIe2tafxHEfW8sKqFUtOd
        B0pfSDFHXd/HeUc3a06ZL7hmRw==
X-Google-Smtp-Source: AGRyM1vXwu2pvpX1minwYkFEaPlB7+DgmfwcN1c3PwLM25R4rcBIq8GqBLnOe9At6oQ807VAO2hlhw==
X-Received: by 2002:a7b:c017:0:b0:3a0:355d:a965 with SMTP id c23-20020a7bc017000000b003a0355da965mr7285024wmb.173.1657244664505;
        Thu, 07 Jul 2022 18:44:24 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id b10-20020a5d4d8a000000b0021d4aca9d1esm22732846wru.99.2022.07.07.18.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 18:44:24 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     ilia.lin@kernel.org, agross@kernel.org, rafael@kernel.org,
        viresh.kumar@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, stephan@gerhold.net
Cc:     linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, bryan.odonoghue@linaro.org,
        krzk+dt@kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: opp: Add missing compat devices
Date:   Fri,  8 Jul 2022 02:44:17 +0100
Message-Id: <20220708014419.2009018-3-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220708014419.2009018-1-bryan.odonoghue@linaro.org>
References: <20220708014419.2009018-1-bryan.odonoghue@linaro.org>
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

A number of devices listed in drivers/cpufreq/qcom-cpufreq-nvmem.c appear
to be missing from the compatible list.

Cc: ilia.lin@kernel.org
Cc: robh+dt@kernel.org
Cc: krzk+dt@kernel.org
Cc: devicetree@vger.kernel.org
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index 10b3a7a4af366..b8b6cdc73209f 100644
--- a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
@@ -22,6 +22,12 @@ select:
     compatible:
       contains:
         enum:
+          - qcom,apq8064
+          - qcom,apq8096
+          - qcom,ipq8064
+          - qcom,msm8960
+          - qcom,msm8974
+          - qcom,msm8996
           - qcom,qcs404
   required:
     - compatible
-- 
2.36.1

