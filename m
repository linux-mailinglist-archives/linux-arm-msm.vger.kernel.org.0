Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80B6651A5B2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 May 2022 18:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353541AbiEDQmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 May 2022 12:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353535AbiEDQmQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 May 2022 12:42:16 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB83433B9
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 May 2022 09:38:39 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id j15so2810575wrb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 May 2022 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QsArDsBFqUycL0OUq1BkvVO8KcvVKPwCI/znAJ555vE=;
        b=b1K+gvu29EvZ5OjuDgM0ZBxY3gbITvpzYjXL0dE7CYg4ETne4M5U++YzxdxiovYKMQ
         FsWn/by2DYvnT7Ty+RmSFGfJPWYteM+8zvIYDJPlroW0H3L4SXtV7wrDKxwZomnzlafx
         OLsdbzHqJPWODie45J2MyyH5rpiUSPKGPADmv3Knq+8LBrRUaoVX5eX+CTVs/LK7Htpq
         16+Agjg3fY/FJaWGMmfSlPzdqNSMnmuOIh9/xkXttA5wUptN4nwqwenHYRQkwOkJ06DX
         krmWe/tWhaxM39y3bAw0/MhsY5SNDRWvDcE78I8SCMiK8Or/oJPoYkN1vJp4/oxFbtV8
         GQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QsArDsBFqUycL0OUq1BkvVO8KcvVKPwCI/znAJ555vE=;
        b=ECjMmZzVI9VZOWn5k4W7XoMw9WIrWH4fi5SvvPCyjraRpXg3W0Hlc/WOQXv6S3lBGj
         2JsKwOby7q5nveQ6IbPBb29INZiKEwI+Ua8sPoYjuHmJ7lJ8W+sbGUPnPvn4T2/N6QPw
         SWTkrGvqU9XzG8WOzqv0T6icmz8+/qVfhA3o6fE2wQ4epRtfZCQK75jsMOT9DiO9SmfT
         FktEs4QzTLxrbjoxHvENROkWuG+bsYZUmgaLY38d3ZhJ+6U2kHMmv6SCLw6RyRCdE5H0
         wztn2bOFTt2105zjDJexaByIIDe4H+2tECeLjLdvCuucNdoYVyYI3g01bLhTBjWxcOAm
         kbyw==
X-Gm-Message-State: AOAM531lz8UYCima2FFSMvthYgmG3cTuQpWCzXHd33y4+RpAT+hu2DTx
        E+zH8aNILZAwn70J32w6Jmoafg==
X-Google-Smtp-Source: ABdhPJxr7GTfB4YHvkUzYYC3fblzQ0zsPjdB56qzjA4MwiwHXRrYaOEpjYNVx+JS5Bb36j9w2H5YqQ==
X-Received: by 2002:adf:f2cb:0:b0:20a:e801:d13f with SMTP id d11-20020adff2cb000000b0020ae801d13fmr17154819wrp.309.1651682318598;
        Wed, 04 May 2022 09:38:38 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm11671706wrr.19.2022.05.04.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:38:38 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/4] clk: qcom: Add missing SYSTEM_MM_NOC_BFDCD_CLK_SRC
Date:   Wed,  4 May 2022 17:38:32 +0100
Message-Id: <20220504163835.40130-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
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

When adding in the indexes for this clock-controller we missed
SYSTEM_MM_NOC_BFDCD_CLK_SRC.

Add it in now.

Fixes: 4c71d6abc4fc ("clk: qcom: Add DT bindings for MSM8939 GCC")
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 include/dt-bindings/clock/qcom,gcc-msm8939.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-msm8939.h b/include/dt-bindings/clock/qcom,gcc-msm8939.h
index 0634467c4ce5..2d545ed0d35a 100644
--- a/include/dt-bindings/clock/qcom,gcc-msm8939.h
+++ b/include/dt-bindings/clock/qcom,gcc-msm8939.h
@@ -192,6 +192,7 @@
 #define GCC_VENUS0_CORE0_VCODEC0_CLK		183
 #define GCC_VENUS0_CORE1_VCODEC0_CLK		184
 #define GCC_OXILI_TIMER_CLK			185
+#define SYSTEM_MM_NOC_BFDCD_CLK_SRC		186
 
 /* Indexes for GDSCs */
 #define BIMC_GDSC				0
-- 
2.35.1

