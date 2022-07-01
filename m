Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 037DA562E0D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 10:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232772AbiGAIWp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 04:22:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234252AbiGAIV6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 04:21:58 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3B1770E58
        for <linux-arm-msm@vger.kernel.org>; Fri,  1 Jul 2022 01:21:32 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id i8-20020a17090aee8800b001ecc929d14dso4882205pjz.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Jul 2022 01:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I+uUN8YmF6Y3SMg45UrmTSTfreR+Uuwz5CwiR64yruQ=;
        b=ai3Ck45InrudUZgQWOt7Efro+1T4l8qeSZrIoa5VX0J5lQUZUvtOWQji0YMj37k3zg
         hAb2l8LXQJ7wf4HcLU5fpbPV5AoadiebA5ojy+FCW1TwljfqL04dqdpGsNFt8OcNH5co
         zMNl9alI9601sDUayUWxUJNzqnyUh7k28gVgpL5Px8ahRbeWq7SU+iOxN+MCLoptgTBp
         ITbDdXOwOW3/YpfHq2QUtFZt2SLmOU7AJrOksQwK+TKjG90hxHC89OBzVJZ/52Hhnb+r
         Ff+VEsOQ38lcF2bJgWBXSUUctNQd/YTk9tTOIz0+XfxFAGhZCJv1Fu3UR0LmArlQ0SCP
         MZIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I+uUN8YmF6Y3SMg45UrmTSTfreR+Uuwz5CwiR64yruQ=;
        b=G34jvD2eTIkX7RIdWFOOaIzuEr5bO1al9d/xOX1DCYgKpQ9cFSkY3UoX7IZfZ8Yl5X
         Zu6IFFqDqyjQA8katT0ZgbJ7fobpvPSI68faimYs9nW1Lal59UW3lpurDBZvSw/Uhrx1
         0PFwQm0sag85bugasF8FcCvTYIQFr0hIElEmeLoJcd9dY+dI3bLk5NHZcxYrPBI2b/4A
         QaW5F2Dp5HM9ftyPLBeg+sFaBE/8aOMQaodA7pLwpuc2I1K0WLAUI/7lGnvzs7zJGvWP
         gvR0beHEXETit1rFwuNmBBVQFW9srV2GLQQMhxiWYK80DM+Tunhod2I6oWKCAG5HFpxs
         suBw==
X-Gm-Message-State: AJIora98mBy89i7hYLFYDijq3sn1i/DsnNVgS8+FePTU7IKa8jajEO0O
        k2idI7RmtvmrSEVI/LdbOUmSmQ==
X-Google-Smtp-Source: AGRyM1sF4UOt+eefyjUdDM65skipT1RPGgPcN3j7d+pLAC1n7IhL0v/+hLjDRiJ6xNliShlWFibWdQ==
X-Received: by 2002:a17:90b:1a81:b0:1ed:3c0:3abb with SMTP id ng1-20020a17090b1a8100b001ed03c03abbmr15494279pjb.5.1656663692462;
        Fri, 01 Jul 2022 01:21:32 -0700 (PDT)
Received: from localhost ([122.172.201.58])
        by smtp.gmail.com with ESMTPSA id g29-20020aa79f1d000000b0051c4f6d2d95sm15033596pfr.106.2022.07.01.01.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:21:32 -0700 (PDT)
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH V2 17/30] media: venus: Migrate to dev_pm_opp_set_config()
Date:   Fri,  1 Jul 2022 13:50:12 +0530
Message-Id: <989d085e6ff7ca6196e7076bba3aad8ac8851b00.1656660185.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1656660185.git.viresh.kumar@linaro.org>
References: <cover.1656660185.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The OPP core now provides a unified API for setting all configuration
types, i.e. dev_pm_opp_set_config().

Lets start using it.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/media/platform/qcom/venus/pm_helpers.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
index cb48c5ff3dee..f68cc938ebff 100644
--- a/drivers/media/platform/qcom/venus/pm_helpers.c
+++ b/drivers/media/platform/qcom/venus/pm_helpers.c
@@ -294,12 +294,16 @@ static int load_scale_v1(struct venus_inst *inst)
 static int core_get_v1(struct venus_core *core)
 {
 	int ret;
+	struct dev_pm_opp_config config = {
+		.clk_names = (const char *[]){ "core" },
+		.clk_count = 1,
+	};
 
 	ret = core_clks_get(core);
 	if (ret)
 		return ret;
 
-	ret = devm_pm_opp_set_clkname(core->dev, "core");
+	ret = devm_pm_opp_set_config(core->dev, &config);
 	if (ret)
 		return ret;
 
@@ -862,6 +866,10 @@ static int vcodec_domains_get(struct venus_core *core)
 	const struct venus_resources *res = core->res;
 	struct device *pd;
 	unsigned int i;
+	struct dev_pm_opp_config config = {
+		.genpd_names = res->opp_pmdomain,
+		.virt_devs = &opp_virt_dev,
+	};
 
 	if (!res->vcodec_pmdomains_num)
 		goto skip_pmdomains;
@@ -879,7 +887,7 @@ static int vcodec_domains_get(struct venus_core *core)
 		return 0;
 
 	/* Attach the power domain for setting performance state */
-	ret = devm_pm_opp_attach_genpd(dev, res->opp_pmdomain, &opp_virt_dev);
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret)
 		goto opp_attach_err;
 
@@ -978,6 +986,10 @@ static int core_get_v4(struct venus_core *core)
 	struct device *dev = core->dev;
 	const struct venus_resources *res = core->res;
 	int ret;
+	struct dev_pm_opp_config config = {
+		.clk_names = (const char *[]){ "core" },
+		.clk_count = 1,
+	};
 
 	ret = core_clks_get(core);
 	if (ret)
@@ -1003,7 +1015,7 @@ static int core_get_v4(struct venus_core *core)
 	if (legacy_binding)
 		return 0;
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
+	ret = devm_pm_opp_set_config(dev, &config);
 	if (ret)
 		return ret;
 
-- 
2.31.1.272.g89b43f80a514

