Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27E0F72BC5B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jun 2023 11:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234784AbjFLJ3G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 05:29:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231296AbjFLJ21 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 05:28:27 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9192C4C19
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:22:53 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b1ba018d94so46946551fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 02:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686561772; x=1689153772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wF7kJNEVNClZhr22GJ39Mf3qOuL6Q0VFjYnT8ReRfhE=;
        b=TQFyRQ9dCAAjzWOD1qlKjLIaGuoxP8JtMlaRrMdhIDuLRK4jGXpvd9VWW5vx2qTjIS
         IgZLOVYLfGkuntkIxDONGBdGyukhQOKTQmYYsLh6KJvYOtOMEaC0oDUQ4TeQllmB9DSM
         1TzEhCcbitB1S1jqEYzXDhZK370PA2R3KJV++NAO93DIWdcAszS+iaCEEAxw1tcDm7H7
         mJ3naSjr4iUs1S/w7yidyLrpmVQyer7mjnZsSGAneL767HuG0AOWbx6jTgPk1QCfDYUv
         NV/wwsgN7wXiJhI9YdNMImRO+Q7nHpXyWashbxmUNzs1qz2q4TAHosQq1BUxtgizWvKX
         HqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686561772; x=1689153772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wF7kJNEVNClZhr22GJ39Mf3qOuL6Q0VFjYnT8ReRfhE=;
        b=SFp9A5k/msVaXn+pqO70O/tFvurJqb/CtCTjTK21mmfz2GQSV1JGzac/MrKPfvIP8Z
         rpv0rpdL5bmMgVRSjvwqzfZTAP4QxaUtxwT6skAWuVkJB/qeWWeKR26ioJ4tALCHhjNG
         6oLl9VAfHuRx3Ad+VYAdV72aX1eCAagyyvzCuvz4PKzeOMGVB9cI/PZHsnui0CAHCbsO
         Hjtgt9jwP0zE0LibKEAxWr691wzB5pPgJ6q1a36tN5can8jgjmjd7tx8sxSbZJtrLo+H
         Xi0sBA8knScpmJtFhzdmrvwslU0p4J63/L4A4JXNMv4dL9Qt3myiqIMDO8UIHUrzRz4d
         grtA==
X-Gm-Message-State: AC+VfDwdGkqGWHxyYSJ5/sPbOxXTl5tdfRKcIne/nu1FAEsc91NTWkUJ
        QPqjtv5SbaFT367cpcraHdooSA==
X-Google-Smtp-Source: ACHHUZ7RbAzssVMBcdrvdXlaVgKlkWxS5u0gD99JnUeFDv45MtVzgcIujsTbpXWa2jpkgJNModhPWA==
X-Received: by 2002:a2e:8719:0:b0:2b1:e65a:a1d3 with SMTP id m25-20020a2e8719000000b002b1e65aa1d3mr2200583lji.40.1686561771994;
        Mon, 12 Jun 2023 02:22:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id o20-20020a2e7314000000b002adc2fe3fc8sm1681722ljc.4.2023.06.12.02.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 02:22:51 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 12 Jun 2023 11:22:48 +0200
Subject: [PATCH 2/2] clk: qcom: gcc-msm8996: Use read-only RCG ops for RPM
 bus clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230612-topic-rcg2_ro-v1-2-e7d824aeb628@linaro.org>
References: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
In-Reply-To: <20230612-topic-rcg2_ro-v1-0-e7d824aeb628@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686561768; l=1415;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ciUM7VVqmyaHUus+1v7jieLBfQZSXfrd5Ukd9qFyQXo=;
 b=34ZFn6hCgCgNYS/VVRxB/dsQm8stj9nIrROWY7b0B1M6RqHvB/A+SpcLbyv4XA5qQ4vbLebmW
 giUvvTAi9p0BcxEhM4uBTY9UCEv86kBgUMnYvr0BMrglAgg99c9oOtL
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The config/periph/system NoC clocks are wholly controlled by the
RPM firmware and Linux should never ever alter their configuration.

Switch them over to read-only ops to avoid that.

Fixes: b1e010c0730a ("clk: qcom: Add MSM8996 Global Clock Control (GCC) driver")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-msm8996.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8996.c b/drivers/clk/qcom/gcc-msm8996.c
index 5e44d1bcca9e..588e3b67657a 100644
--- a/drivers/clk/qcom/gcc-msm8996.c
+++ b/drivers/clk/qcom/gcc-msm8996.c
@@ -264,7 +264,7 @@ static struct clk_rcg2 system_noc_clk_src = {
 		.name = "system_noc_clk_src",
 		.parent_data = gcc_xo_gpll0_gpll0_early_div,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll0_early_div),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_ro_ops,
 	},
 };
 
@@ -284,7 +284,7 @@ static struct clk_rcg2 config_noc_clk_src = {
 		.name = "config_noc_clk_src",
 		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_ro_ops,
 	},
 };
 
@@ -306,7 +306,7 @@ static struct clk_rcg2 periph_noc_clk_src = {
 		.name = "periph_noc_clk_src",
 		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_ro_ops,
 	},
 };
 

-- 
2.41.0

