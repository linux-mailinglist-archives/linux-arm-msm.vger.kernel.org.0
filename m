Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CAE7F73D3D1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jun 2023 22:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230154AbjFYU0F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Jun 2023 16:26:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjFYU0B (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Jun 2023 16:26:01 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50626E48
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:26:00 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fb7589b187so206753e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jun 2023 13:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687724758; x=1690316758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1nKcaVfPItdNnd084tpWE4cy/erttO67WFc7s18El8=;
        b=riCQEjNydzQwD+qTxa7CaKEn+baUASyGj+qU2/kP2Qd5pyp0XQCVASg7oCW2Zefdsz
         tp1twjmhi1BZGDMpKDRbRY8Yj9eg6d5BRjB5FzMqaZNxf7y56KZHc/g/iAOSwkg2ZJ+H
         cqGjgwZOVOnbre/U/nfwe5t4X7DNMeAVnMSZ5vCtmF6Bzx4QVFcyK1fTalaWJKdW2goA
         RlzZJnWHYeOlRlO71s77CuM7+REmm+tOjZwAiSUJlsWxWG2l8bWVOb9Hp657/DSqf6bv
         Ogm2hDCD5aJXNYXkM3uUu9EHfP9nqWCc64Gj43AVb9hExtzOWkeZ5afX/YxJMoFFVOZw
         vrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687724758; x=1690316758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1nKcaVfPItdNnd084tpWE4cy/erttO67WFc7s18El8=;
        b=if81hAQXzftKzboB6ESYc6/8hmQyUOXEEelVpMB0exfJoIut4gvY6AJJGWhqTMMY9H
         Z2WA4ZsaQCyH4F6k55GAkUI+OAvhBvTWKyd0KoFbf6a47klhS2Bh51E/AZzUDN0jDJWa
         YwpvPUDwubBrZrStecT0mNfjGZErfgvS39FJWMs9kVETI7XE6kDsTsvAmAEOdAQQ11TI
         xiaSbz/nWWL5h82OVcRPpxf9wAobxb130y0u4Tt+RdDRcMAG2BDRzFnosvmZKpBozup2
         i6yxWRd/XRm+WaCj0otjEurdT1Jkbc5z4uD9IpIm261G9BYH4AdSfp0v5NKPedYlKy1P
         tUUQ==
X-Gm-Message-State: AC+VfDyEYg7wRo55J3k+KV1xAGio5b2iPhEMvTLbiUnFLRIKYiAPYlgJ
        J8MVO83qJcAngm/d2xL3WWlkyw==
X-Google-Smtp-Source: ACHHUZ7yAvIsFKBxHC7sl8caX8317B5sQI87G5FhbotJEhsvBrXKjimmTAeipHRKpBfBqSkMSxabsQ==
X-Received: by 2002:a05:6512:1d1:b0:4f8:6534:c6fa with SMTP id f17-20020a05651201d100b004f86534c6famr14210147lfp.63.1687724758643;
        Sun, 25 Jun 2023 13:25:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id m21-20020a195215000000b004f8427f8716sm787537lfb.262.2023.06.25.13.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 13:25:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH v2 10/26] cpufreq: qcom-nvmem: also accept operating-points-v2-krait-cpu
Date:   Sun, 25 Jun 2023 23:25:31 +0300
Message-Id: <20230625202547.174647-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
References: <20230625202547.174647-1-dmitry.baryshkov@linaro.org>
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

the qcom-cpufreq-nvmem driver attempts to support both Qualcomm Kryo
(newer 64-bit ARMv8 cores) and Krait (older 32-bit ARMv7 cores). It
makes no sense to use 'operating-points-v2-kryo-cpu' compatibility node
for the Krait cores. Add support for 'operating-points-v2-krait-cpu'
compatibility string.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/cpufreq/qcom-cpufreq-nvmem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-nvmem.c b/drivers/cpufreq/qcom-cpufreq-nvmem.c
index ab78ef1531d0..3bb552f498da 100644
--- a/drivers/cpufreq/qcom-cpufreq-nvmem.c
+++ b/drivers/cpufreq/qcom-cpufreq-nvmem.c
@@ -238,7 +238,8 @@ static int qcom_cpufreq_probe(struct platform_device *pdev)
 	if (!np)
 		return -ENOENT;
 
-	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu");
+	ret = of_device_is_compatible(np, "operating-points-v2-kryo-cpu") ||
+	      of_device_is_compatible(np, "operating-points-v2-krait-cpu");
 	if (!ret) {
 		of_node_put(np);
 		return -ENOENT;
-- 
2.39.2

