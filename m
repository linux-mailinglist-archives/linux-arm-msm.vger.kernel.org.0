Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52E695598F9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 14:01:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230520AbiFXMAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 08:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbiFXMAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 08:00:04 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499527E016
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 05:00:01 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id a13so4045290lfr.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 05:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p8a54kHUC74uWm194BlTVU3tRlk7CchK44/KJ1a/oWw=;
        b=RYiFfreS5ZT98btdp6eoyR+sZ3X/50pkvPbKD/rHksiojmIPHSzaZNc5e7TgYTEB6v
         oMz7jtUimr8ffeNT8j0NOctK5BLfpL+tbLKpAfQ2f8qKePmq2WLWIOFhB8dzEMR726Ii
         I/GMNx4/qFsw5FaYKI2Z3t35iop2YgdmYdFxoVATm9Q9OJm0AfYvJVHvIupXatMLFKFz
         kEbYJEK+j8kEggV5SlaBD5iBbeHhkN9PiwSJqawykynClnYJE94jHGngfOqk7i6kFlJv
         UuHrxmYGKI9pWM9qKefyuSobiPsiuW6R2tqROztbOVNjR1VMcCuiAbmhvp4Zj4xzigHq
         r3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p8a54kHUC74uWm194BlTVU3tRlk7CchK44/KJ1a/oWw=;
        b=QLjO8DUgXe+grkh5UsL3J+suA9eAC4O+yOJ16NV32H2LW3r91LgIm9f1LZ7qxhiD/r
         66u+jkiEEYsXawdl4Xw9u4EHI2nFR2FTqmGncge09cmwmkTwyJjr5i0t4ROn3w+Kapzz
         ZW33UdAu2i8IBx9/raZh3geyzuOrUw5aFfo6oGDvMFThEH//o3tpJPznL2C3UOZr6oAQ
         zZn5Q7u/VxfgM40+sy7YIwsN+nBLsWS6vKQ+BgAJdsQ7TNvKoxT3/svh0ZCwXcoA8TDg
         2m9W/THf6jrl0afDt2KqeY4noC93kQj+tAEQhFHOVKi40tVdoLt4MJfAk2oz8yOOlj0v
         QtIQ==
X-Gm-Message-State: AJIora906cPXIBYkybGU6fupX92IxkeprYkowqejASZ+STPJ6otvMAYt
        WQB+ZZ3SoKICxE3S+qQpxQPU/Q==
X-Google-Smtp-Source: AGRyM1sENlKmkw69YMN7KGv2mHNnwQXAJvEIeSL4Exlj4Jg+gZNuX495Ml+aUqq4BGpBrolhx1EaRw==
X-Received: by 2002:a05:6512:2249:b0:478:f926:ad7 with SMTP id i9-20020a056512224900b00478f9260ad7mr8703367lfu.511.1656071999580;
        Fri, 24 Jun 2022 04:59:59 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id bu35-20020a05651216a300b0047255d211b9sm333402lfb.232.2022.06.24.04.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 04:59:59 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v8 3/7] clk: qcom: clk-alpha-pll: fix clk_trion_pll_configure description
Date:   Fri, 24 Jun 2022 14:59:57 +0300
Message-Id: <20220624115957.2524892-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
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

After merging lucid and trion pll functions in commit 0b01489475c6
("clk: qcom: clk-alpha-pll: same regs and ops for trion and lucid")
the function clk_trion_pll_configure() is left with an old description
header, which results in a W=2 compile time warning, fix it.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v1 to v8:
* none.

 drivers/clk/qcom/clk-alpha-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4406cf609aae..288692f0ea39 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1439,7 +1439,7 @@ const struct clk_ops clk_alpha_pll_postdiv_fabia_ops = {
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_fabia_ops);
 
 /**
- * clk_lucid_pll_configure - configure the lucid pll
+ * clk_trion_pll_configure - configure the trion pll
  *
  * @pll: clk alpha pll
  * @regmap: register map
-- 
2.33.0

