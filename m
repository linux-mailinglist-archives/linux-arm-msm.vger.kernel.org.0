Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5AC8505C5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Apr 2022 18:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239069AbiDRQZL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Apr 2022 12:25:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346117AbiDRQZL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Apr 2022 12:25:11 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AC982ED68
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:22:31 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q3so18473920wrj.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Apr 2022 09:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5UcOXVNhBqW5Ks+E6zq9WwfA0YmdX2BW7sLm1qI65JQ=;
        b=fGFN0H643ROtLz8qHmRmxJWVMRhktrnJwhqSBz1hS2zhknCdiljTZ4iYpfPpWy6M7n
         sNmYTOitPwTDB2Qo/6nueM4ni7dNKqjS7JftAp7uD3EKdONUUGHm/wXxDsGneKhMNnBF
         1+QzhA+hmcnFMHDwce0RwYIxpGBkVg8G+jLwaF+8VPRKfj51PmdpKAPxMYehxYE7M9p1
         3rXY2gPuxmKcsyTpKbFcIAWhHr0RhrUOQpnCJbK9FGdi07oAg5yVx5FmReLKvJEkIH9z
         8De9e5Qe479M3DV6MKqate+O7SwFcO/vBNprWj+eZWy9qAkzGiZzdE9tvLBuEGJaSRDY
         LBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5UcOXVNhBqW5Ks+E6zq9WwfA0YmdX2BW7sLm1qI65JQ=;
        b=MBOy9esI8uj4KQ3phMzH1HVoP8R0VE/bkRZD1010xrhKGCGfOpVyKseOr8LuO6Kduo
         yBcZPeS6ONEBnSfkXEufW+1U6+4+GF0cVIcU6gtCe1eQXZiUQ6WbWv8oiAb4ekkehdCk
         kwttoaGpmaQjRs7Cf0TCvfBaxrX0GWeDQk88HTniQxzTvfDBNP2JF34ZOC9ptnziMmQm
         sJV0mtnERXBB2qRMNbM0mFeh4dV4l7uQF1RS0RJe+5sLvS3Opwana94HSLQ4ZaA6ncVM
         3diK1xXdfJ+bL0UrWlzA5xWmGFui/nqMEZha8fyJMTNl2i5RHhOpCAWlsLyx7BAYmu4F
         s9VA==
X-Gm-Message-State: AOAM533l9pIzyB5R1FMEhEgBJHYe6r3B09bLIsDfu5XCZjOOyGZu1CAY
        cJrLGsru3749eSo2IAQzTBemNw==
X-Google-Smtp-Source: ABdhPJySd/Kb215eN49sj4XVWZxJBPqGLwcgslKA9jNnheiw0gNvYOhdZpU20D8ACs/emVjmAiuJXg==
X-Received: by 2002:adf:fd50:0:b0:207:9f29:1dc2 with SMTP id h16-20020adffd50000000b002079f291dc2mr8459212wrs.135.1650298949702;
        Mon, 18 Apr 2022 09:22:29 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 205-20020a1c02d6000000b003928c42d02asm8460853wmc.23.2022.04.18.09.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:22:29 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ilia.lin@kernel.org,
        rafael@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        bryan.odonoghue@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 1/5] dt-bindings: opp: Add missing compat devices
Date:   Mon, 18 Apr 2022 17:22:22 +0100
Message-Id: <20220418162226.2983117-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220418162226.2983117-1-bryan.odonoghue@linaro.org>
References: <20220418162226.2983117-1-bryan.odonoghue@linaro.org>
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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml     | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml b/Documentation/devicetree/bindings/cpufreq/qcom-cpufreq-nvmem.yaml
index a9a776da5505..5eb1dba13fe2 100644
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
2.35.1

