Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7EC3768EAC9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Feb 2023 10:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbjBHJPl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 04:15:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231579AbjBHJPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 04:15:11 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDFC45F5B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 01:13:49 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id m1so7098732ejx.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 01:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DuUic+i1U7Wq2FP3EF4of24nNHQpKF/wijqQmHWITsc=;
        b=nDFpFjJi+KCbO6IFRe32xwArDhZIPitZ6Y96CW/FKiA5ymoAy+yjpJvOBtX/RwweKI
         FaWjGlDj8jwi8Wm2Bg6GWr8+ohC3KiZnhlxvbLiSDWkCqqOggWAI9kL/OjSPNc2lwInh
         258UyqHnbEFEsrq1hJjVTC6/e8bThS442mGvY8u7jwed66xz3vrVoX9PNGd3DjB/j3oA
         EB7u+ZIIDIR5Hjg421QkT77lCVnv2TXUAoVKgD0TGfSXorqb4XI/W3mg8SaSD2uKCklO
         K7cK/Y3U2+IQduHLnY+GV8q6dZrON1N4hS6VcnM/UTW3P+CxPKR9Q69DdQS3++/1a0cE
         AFsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DuUic+i1U7Wq2FP3EF4of24nNHQpKF/wijqQmHWITsc=;
        b=lWfKbry1UArde/DZUZ8l5DCn6OPUu5h2mxpEMEubXOskvMFouvxjPHq1clZZxZcnZG
         XZjGXZauaPMWNvDT/4rIVMxOssqb/zO3MKu8Ouf/KpuooIqRBr3XBuEiXvLTvREZM0it
         fuzjPpLuRDwCCMed2AOhLgL062qiOx4uMXca7uiH6jwv215qd9vXBQc4k0TSvSRDGvNA
         e4oaUUjrKeu/7LQ4KD33MOWOdIgKa8K1lGgNi7QiA56bAUnJrz5RF+0GjDY7G0nXQJFC
         TSS5B7jW2zRtSDNKo2G2RoI9J1nAy48ztA8ofS5Uo766pis9wEiQiC68Lpt6CbI6BuEv
         g7ww==
X-Gm-Message-State: AO0yUKWjLR5UQm/+aGz7E7vwY4H1GZXwjfWWNlXJzvhBSgN5A1rfhVKn
        IOQN/rGCeyNqrO+Xisk6dRpncMkSpRIhm+pV
X-Google-Smtp-Source: AK7set98G9vNhInMtInU3tZjeGD3eVHTPFfFB2IIwKOg8kwNUoKVef+wYxPQ9KycOilQpaUf5cVtqw==
X-Received: by 2002:a17:907:2da6:b0:8ae:f73e:233f with SMTP id gt38-20020a1709072da600b008aef73e233fmr490317ejc.32.1675847626017;
        Wed, 08 Feb 2023 01:13:46 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl. [83.9.1.117])
        by smtp.gmail.com with ESMTPSA id z2-20020a1709064e0200b00887a23bab85sm7987279eju.220.2023.02.08.01.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 01:13:45 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 01/10] clk: qcom: branch: Add helper functions for setting retain bits
Date:   Wed,  8 Feb 2023 10:13:31 +0100
Message-Id: <20230208091340.124641-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208091340.124641-1-konrad.dybcio@linaro.org>
References: <20230208091340.124641-1-konrad.dybcio@linaro.org>
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

Most Qualcomm branch clocks come with a pretty usual set of bits that
can enable memory retention by means of not turning off parts of the
memory logic. Add them to the common header file and introduce helper
functions for setting them instead of using magic writes.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/clk-branch.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/qcom/clk-branch.h b/drivers/clk/qcom/clk-branch.h
index 17a58119165e..55b3a2c3afed 100644
--- a/drivers/clk/qcom/clk-branch.h
+++ b/drivers/clk/qcom/clk-branch.h
@@ -37,6 +37,32 @@ struct clk_branch {
 	struct clk_regmap clkr;
 };
 
+/* Branch clock common bits for HLOS-owned clocks */
+#define CBCR_FORCE_MEM_CORE_ON		BIT(14)
+#define CBCR_FORCE_MEM_PERIPH_ON	BIT(13)
+#define CBCR_FORCE_MEM_PERIPH_OFF	BIT(12)
+
+static inline void qcom_branch_set_force_mem_core(struct regmap *regmap,
+						  struct clk_branch clk, bool on)
+{
+	regmap_update_bits(regmap, clk.halt_reg, CBCR_FORCE_MEM_CORE_ON,
+			   on ? CBCR_FORCE_MEM_CORE_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_on(struct regmap *regmap,
+						   struct clk_branch clk, bool on)
+{
+	regmap_update_bits(regmap, clk.halt_reg, CBCR_FORCE_MEM_PERIPH_ON,
+			   on ? CBCR_FORCE_MEM_PERIPH_ON : 0);
+}
+
+static inline void qcom_branch_set_force_periph_off(struct regmap *regmap,
+						    struct clk_branch clk, bool on)
+{
+	regmap_update_bits(regmap, clk.halt_reg, CBCR_FORCE_MEM_PERIPH_OFF,
+			   on ? CBCR_FORCE_MEM_PERIPH_OFF : 0);
+}
+
 extern const struct clk_ops clk_branch_ops;
 extern const struct clk_ops clk_branch2_ops;
 extern const struct clk_ops clk_branch_simple_ops;
-- 
2.39.1

