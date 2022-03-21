Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A544E349D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Mar 2022 00:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233330AbiCUXqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Mar 2022 19:46:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233291AbiCUXqv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Mar 2022 19:46:51 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F04EA27D2;
        Mon, 21 Mar 2022 16:45:24 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id m26-20020a05600c3b1a00b0038c8b999f58so476473wms.1;
        Mon, 21 Mar 2022 16:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HxwJ/rmGXQIKgHQmjTVr7v/2TGpe+xuVVbkVjt0eYLU=;
        b=nStquK6TyNYcOv5GJ1NxuIx/DoXoT4yjOTTkZ2xEmnVYjhaS24fYn4vBwM8DpsMg8r
         TR1v449Ynvl9NcMxcqhcJHoQ4vrDKi3ttElhP3+GHU0Iy0bbGizOS3etmAcZhbAkQNX3
         cYI7B1GBiEn2u/47JqJuM0ZhUconBHCLDMjHjidiLdczOCcFMwm6feOoWiH9YdUwf8jd
         y4D0I/yupR49Dz3H5TJLdTzRTXLpHk5U7gtU0EXTdxTu96RZ+KFpJhqZg8KM/lKQuz2O
         fsTET5lQEIf7++R0k0XFkmaf9jgi3VWVOdaMPAvCM01sC62Vcfgfoh3hDrumUoD4ZPkF
         HqCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HxwJ/rmGXQIKgHQmjTVr7v/2TGpe+xuVVbkVjt0eYLU=;
        b=zdJBzb66mDcMiNBpDWzR1cZIOXK25tviqYwsZhVMKxvk4sOp4Tk10qOuHuYSdwu3Sc
         D36a3/uxu1B08LKZlvukuyWTBOpGjWvRcNQb4BQ5H1bBejDqZMxW8TqehJULJP04O6KX
         AMZsGy3+qQap2I0c2Exo+CVufwMUCjpipbuVXfoWT0pJ5/aM0ThHpoelvo+RP1lqYhet
         zzwiieNXVkFYrFY+8XxZfXOHzCflh5ZAVtFrqFVY/yp+fjT+p7SJXdVsg6ylKbjzXkCJ
         /d+DPhRdy18ow8Ek00SgPKlC3951y6LTcNihWzP/l5qzzOX1TsfDpLzT+AM/WRp8ymln
         QQsA==
X-Gm-Message-State: AOAM533gSMmh9kfMRPePkw4a0GirNtPGp6gtaXzoeB2SZo6UJCtOD7eh
        Nita3LHLrmbRN1xYL31vJtA=
X-Google-Smtp-Source: ABdhPJwRMi2XdYQnQNNkReksZJVk5TUny/4ToUYciihKHRF5DRh7NJqvvxhnotXrvmsj6ZzbI18drA==
X-Received: by 2002:a7b:ce02:0:b0:381:2007:f75c with SMTP id m2-20020a7bce02000000b003812007f75cmr1291711wmc.6.1647906322774;
        Mon, 21 Mar 2022 16:45:22 -0700 (PDT)
Received: from Ansuel-xps.localdomain (93-42-69-170.ip85.fastwebnet.it. [93.42.69.170])
        by smtp.googlemail.com with ESMTPSA id n10-20020a5d588a000000b002052e4aaf89sm105497wrf.80.2022.03.21.16.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 16:45:22 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v6 10/18] clk: qcom: krait-cc: drop hardcoded safe_sel
Date:   Tue, 22 Mar 2022 00:15:40 +0100
Message-Id: <20220321231548.14276-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220321231548.14276-1-ansuelsmth@gmail.com>
References: <20220321231548.14276-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop hardcoded safe_sel definition and use helper to correctly calculate
it. We assume qsb clk is always present as it should be declared in DTS
per Documentation and in the absence of that, it's declared as a fixed
clk.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/clk/qcom/krait-cc.c | 40 +++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/krait-cc.c b/drivers/clk/qcom/krait-cc.c
index e9508e3104ea..5f98ee1c3681 100644
--- a/drivers/clk/qcom/krait-cc.c
+++ b/drivers/clk/qcom/krait-cc.c
@@ -26,6 +26,17 @@ static unsigned int pri_mux_map[] = {
 	0,
 };
 
+static u8 krait_get_mux_sel(struct krait_mux_clk *mux, struct clk *safe_clk)
+{
+	struct clk_hw *safe_hw = __clk_get_hw(safe_clk);
+
+	/*
+	 * We can ignore errors from clk_hw_get_index_of_parent()
+	 * as we create these parents in this driver.
+	 */
+	return clk_hw_get_index_of_parent(&mux->hw, safe_hw);
+}
+
 /*
  * Notifier function for switching the muxes to safe parent
  * while the hfpll is getting reprogrammed.
@@ -116,8 +127,8 @@ krait_add_div(struct device *dev, int id, const char *s, unsigned int offset)
 }
 
 static struct clk *
-krait_add_sec_mux(struct device *dev, int id, const char *s,
-		  unsigned int offset, bool unique_aux)
+krait_add_sec_mux(struct device *dev, struct clk *qsb, int id,
+		  const char *s, unsigned int offset, bool unique_aux)
 {
 	int ret;
 	struct krait_mux_clk *mux;
@@ -144,7 +155,6 @@ krait_add_sec_mux(struct device *dev, int id, const char *s,
 	mux->shift = 2;
 	mux->parent_map = sec_mux_map;
 	mux->hw.init = &init;
-	mux->safe_sel = 0;
 
 	init.name = kasprintf(GFP_KERNEL, "krait%s_sec_mux", s);
 	if (!init.name)
@@ -166,6 +176,7 @@ krait_add_sec_mux(struct device *dev, int id, const char *s,
 	if (IS_ERR(clk))
 		goto err_clk;
 
+	mux->safe_sel = krait_get_mux_sel(mux, qsb);
 	ret = krait_notifier_register(dev, clk, mux);
 	if (ret)
 		clk = ERR_PTR(ret);
@@ -204,7 +215,6 @@ krait_add_pri_mux(struct device *dev, struct clk *hfpll_div, struct clk *sec_mux
 	mux->lpl = id >= 0;
 	mux->parent_map = pri_mux_map;
 	mux->hw.init = &init;
-	mux->safe_sel = 2;
 
 	init.name = kasprintf(GFP_KERNEL, "krait%s_pri_mux", s);
 	if (!init.name)
@@ -226,6 +236,7 @@ krait_add_pri_mux(struct device *dev, struct clk *hfpll_div, struct clk *sec_mux
 	if (IS_ERR(clk))
 		goto err_clk;
 
+	mux->safe_sel = krait_get_mux_sel(mux, sec_mux);
 	ret = krait_notifier_register(dev, clk, mux);
 	if (ret)
 		clk = ERR_PTR(ret);
@@ -238,7 +249,9 @@ krait_add_pri_mux(struct device *dev, struct clk *hfpll_div, struct clk *sec_mux
 }
 
 /* id < 0 for L2, otherwise id == physical CPU number */
-static struct clk *krait_add_clks(struct device *dev, int id, bool unique_aux)
+static struct clk *
+krait_add_clks(struct device *dev, struct clk *qsb, int id,
+	       bool unique_aux)
 {
 	unsigned int offset;
 	void *p = NULL;
@@ -261,7 +274,7 @@ static struct clk *krait_add_clks(struct device *dev, int id, bool unique_aux)
 		goto err;
 	}
 
-	sec_mux = krait_add_sec_mux(dev, id, s, offset, unique_aux);
+	sec_mux = krait_add_sec_mux(dev, qsb, id, s, offset, unique_aux);
 	if (IS_ERR(sec_mux)) {
 		clk = sec_mux;
 		goto err;
@@ -301,18 +314,19 @@ static int krait_cc_probe(struct platform_device *pdev)
 	int cpu;
 	struct clk *clk;
 	struct clk **clks;
-	struct clk *l2_pri_mux_clk;
+	struct clk *l2_pri_mux_clk, *qsb;
 
 	id = of_match_device(krait_cc_match_table, dev);
 	if (!id)
 		return -ENODEV;
 
 	/* Rate is 1 because 0 causes problems for __clk_mux_determine_rate */
-	if (IS_ERR(clk_get(dev, "qsb")))
-		clk = clk_register_fixed_rate(dev, "qsb", NULL, 0, 1);
+	qsb = clk_get(dev, "qsb");
+	if (IS_ERR(qsb))
+		qsb = clk_register_fixed_rate(dev, "qsb", NULL, 0, 1);
 
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
+	if (IS_ERR(qsb))
+		return PTR_ERR(qsb);
 
 	if (!id->data) {
 		clk = clk_register_fixed_factor(dev, "acpu_aux",
@@ -327,13 +341,13 @@ static int krait_cc_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for_each_possible_cpu(cpu) {
-		clk = krait_add_clks(dev, cpu, id->data);
+		clk = krait_add_clks(dev, qsb, cpu, id->data);
 		if (IS_ERR(clk))
 			return PTR_ERR(clk);
 		clks[cpu] = clk;
 	}
 
-	l2_pri_mux_clk = krait_add_clks(dev, -1, id->data);
+	l2_pri_mux_clk = krait_add_clks(dev, qsb, -1, id->data);
 	if (IS_ERR(l2_pri_mux_clk))
 		return PTR_ERR(l2_pri_mux_clk);
 	clks[4] = l2_pri_mux_clk;
-- 
2.34.1

