Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91253744EF9
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 Jul 2023 19:43:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbjGBRn0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 Jul 2023 13:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjGBRnA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 Jul 2023 13:43:00 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D44E6B
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 Jul 2023 10:42:59 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fba03becc6so3933529e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Jul 2023 10:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319777; x=1690911777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGUrC2pl70yT5xQt6wVBykOBcOL77JFwxDC19zavIJE=;
        b=SbMKmAN6L3laP/Q+yqMD9pDXoUK0I9x3KGVs7YaDx95yNQWJYsHovMxRdkCJ0q84Ak
         Lt504z0PNaogYQcD7+wiCRU+rmJJL24JrILUGxduTRnucFW2eIShGBI+weK6mgRe5hEO
         FjwfAjyOmmKgog6lRxnRPjR1g+7MeKPs956FMLLNRKbm18HaSGr6xnEnwY6aSo9rpzbk
         o1noJfZK/x7Hait5MStEEmyh8fk0hH0ySO6R9EHeTeIIifR/DrFEzWLX9eRLPS/FEv+b
         d3Vp+Xw57tK/Q+XjVlI+xS2zl67Mt8ZcBI/PMdfmfGWiZd9dGYLuB8XJpxDyVdkBz4xQ
         zeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319777; x=1690911777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dGUrC2pl70yT5xQt6wVBykOBcOL77JFwxDC19zavIJE=;
        b=dj3ZSt4z5T9FpDWS9kdmJ1ofx3lRwzk4rqZyPabyfTCnUVVgqzzijc6u+mEadQt4oI
         4lyX4CjmaEIXUae7dvslAqDRvmOdiogCzL9QKn9b98KYabqErU7IGh3Zp50LPaKTbwPG
         rQgkaNNRlJ37d3IuK752V+IZf7iovGcC8Ayo4pmWYkfa0MuniGpM8S4h5NacBZoo0YU1
         okK3ucLlvWcoicM5GnfouYNCFOPg9vGox99wGVOwezuXPnnL3bLMe9CVjIaSZ9mSSqjO
         9njdopkUJk0zYX2Okx37NVyr32JL3yjJhsk4EXjLcWwdInrCfRCgVd6m1TOPtyxsWIB5
         jkYg==
X-Gm-Message-State: AC+VfDwR9WJpQnpkxrmqji11uo6Gt0bYnZwODdHvjkPAc7MKtBUzLfMl
        HYaIeOTrkFrV/x2FoR70IwbQcA==
X-Google-Smtp-Source: ACHHUZ4+y/HVTKombqOaLWkQitZBYp37GDvg0uFWAUBBRf/wR6jT3yGk2FBESSJq9VA/W8klWwTx7w==
X-Received: by 2002:a05:6512:110a:b0:4f6:2cf9:f57d with SMTP id l10-20020a056512110a00b004f62cf9f57dmr3569702lfg.2.1688319777193;
        Sun, 02 Jul 2023 10:42:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:42:56 -0700 (PDT)
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
Subject: [PATCH v3 10/28] cpufreq: qcom-nvmem: also accept operating-points-v2-krait-cpu
Date:   Sun,  2 Jul 2023 20:42:28 +0300
Message-Id: <20230702174246.121656-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
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

