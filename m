Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F08058A773
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Aug 2022 09:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237761AbiHEHtx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Aug 2022 03:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240250AbiHEHtu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Aug 2022 03:49:50 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BCAF62F4
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Aug 2022 00:49:47 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id b4so1973259pji.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Aug 2022 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Brym2/V9OM2lQXUhI8Uh5+ajUm4TUUoqfd33kuLRL58=;
        b=Pgq/sMXnxHTiJb6P6KHRWfGQnSmb5sCtoQEuyLt6rd8iIQ1wcQNSohjiyROHsU2nnX
         qkEPP1OUhFk23ISXRF95p4xvXTseAUXsywSGet4HTtoptEB1pwb0O3p1syOucsbrEAPQ
         dwcvqqisX8osKMECotkh6aDNhpSd0QSgAzmBMMHsLg/ZCmFbFp3LG6D1rJu0hfb7JKSy
         SP9fruJURboEGIwvYMb/HDOGATTZawg/OKR9E2RmxRuxSG4GZ5ZQfTPn6yNBo7wxWks2
         8yxNAMne77naZGBbmJ1wHPlbmEkFdu0sjuYsstRX76Ju2+leOCEjAx+4y7Zn7WXkLuN9
         16ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Brym2/V9OM2lQXUhI8Uh5+ajUm4TUUoqfd33kuLRL58=;
        b=znMNRuhymlG7J3e2ICiw2rAAYsbpIEzcPSRz0kFdhHw6kps/KsnsGg8Y23EDRaMvy5
         p5FEK63khAAlqwmoNsWnvwm4oJ+nOkJhbQETQRMlg4B0Rjlhr2PTpWLWUREMJ8HaYkMO
         Z41V5QbOm43yFib+dUrxzt2t9F2tV9diCwA+gsp3cywD7ob09/WAKmz/b9DQAroSBkwM
         2jsW6z2f1Lvi0Y3jj3XXlBg23loEXPLm2huIU8eCHoPqhhBUSnmgZLRSt43OBWrhGroE
         NdXt9CHq/DRd+rbCvNVlQuj4ebJ9j9CXPolDpaWYW2Tr49mWFUWSaCY1MHHC7YMK0wVk
         cGUA==
X-Gm-Message-State: ACgBeo11pdFOgJg7NMgnXCJBXFqDMu/M1plKdQJhhww0Py73HZ/ji+c6
        VCkqfj6fIQgmaZ5K30viMwIglA==
X-Google-Smtp-Source: AA6agR4CDPSMM4xDjQGLfZGRixoaLgCUYWEAIFrv7FIOhzE9KW1P9m6pxc+3cTI/dHAUmJU/h321Yw==
X-Received: by 2002:a17:903:2452:b0:16e:d0b6:6507 with SMTP id l18-20020a170903245200b0016ed0b66507mr5769571pls.68.1659685787060;
        Fri, 05 Aug 2022 00:49:47 -0700 (PDT)
Received: from localhost.localdomain ([45.8.68.134])
        by smtp.gmail.com with ESMTPSA id z10-20020a1709027e8a00b0016ecda71e26sm2309372pla.39.2022.08.05.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 00:49:46 -0700 (PDT)
From:   Jun Nie <jun.nie@linaro.org>
To:     abel.vesa@linaro.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     agross@kernel.org, shawn.guo@linaro.org,
        bryan.odonoghue@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jun Nie <jun.nie@linaro.org>
Subject: [PATCH 1/4] clk: Aggregate power operation in clock controller
Date:   Fri,  5 Aug 2022 15:49:32 +0800
Message-Id: <20220805074935.1158098-2-jun.nie@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805074935.1158098-1-jun.nie@linaro.org>
References: <20220805074935.1158098-1-jun.nie@linaro.org>
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

Add power domain operation per clk frequency. Some hardware support
dynamic voltage frequency scaling in clock controller besides devices.
Which is not related to any clock consumer devices. While power domain
operation is operated per device in driver model. If they are voted per
clk, not per device, we need to aggregate them in clock framework,
then send request to power framework.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/clk/clk.c            | 212 ++++++++++++++++++++++++++++++++++-
 include/linux/clk-provider.h |  62 ++++++++++
 2 files changed, 272 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f00d4c1158d7..0ab79b9ebefd 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/device.h>
 #include <linux/init.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
 #include <linux/clkdev.h>
@@ -89,6 +90,7 @@ struct clk_core {
 	struct hlist_node	debug_node;
 #endif
 	struct kref		ref;
+	struct clk_power_data	*power;
 };
 
 #define CREATE_TRACE_POINTS
@@ -812,6 +814,161 @@ int clk_rate_exclusive_get(struct clk *clk)
 }
 EXPORT_SYMBOL_GPL(clk_rate_exclusive_get);
 
+static void clk_unvote_genpd(struct clk_core *core)
+{
+	struct clkpstate_node *ps_node = NULL;
+	struct clk_power_data *power = core->power;
+	unsigned int pstate = 0;
+
+	mutex_lock(power->genpd_lock);
+	/* Do not free the node. As performance states number is limited, and we
+	 * will re-visit it later.
+	 */
+	list_del_init(&power->genpd_list);
+	power->genpd_pstate = 0;
+
+	/* Find and set the highest pstate */
+	list_for_each_entry_reverse(ps_node, power->genpd_head, genpd_list) {
+		if (!list_empty(&ps_node->genpd_pstate_head)) {
+			pstate = ps_node->pstate;
+			break;
+		}
+	}
+
+	pr_debug("%s: clk %s unvote genpd set genpd perf state %d\n",
+		 __func__, core->name, pstate);
+	dev_pm_genpd_set_performance_state(*power->genpd_dev, pstate);
+
+	mutex_unlock(power->genpd_lock);
+}
+
+static int clk_vote_genpd(struct clk_core *core, unsigned long rate)
+{
+	struct clkpstate_node *new_ps_node, *ps_node, *pre_ps_node = NULL;
+	unsigned int cnt, pstate = 0;
+	struct list_head *insert_pos;
+	int ret = 0;
+	struct clk_power_data *power = core->power;
+	const struct genpdopp_table *tbl = power->genpdopp_table;
+
+	/* Find opp pstate for required rate */
+	for (cnt = 0; cnt < power->genpdopp_num; cnt++, tbl++) {
+		if (rate <= tbl->ceiling_rate) {
+			pstate = tbl->pstate;
+			break;
+		}
+	}
+
+	if (!pstate && cnt == power->genpdopp_num) {
+		pr_err("%s: clk %s rate %lu not supported by genpd\n", __func__,
+			core->name, rate);
+		return -EINVAL;
+	}
+
+	pr_debug("%s: clk %s votes perf state %d\n",
+		 __func__, core->name, pstate);
+	mutex_lock(power->genpd_lock);
+	if (list_empty(power->genpd_head)) {
+		insert_pos = power->genpd_head;
+		goto new_pstate_node;
+	}
+
+	/* If this clk power is already in some perf state */
+	if (!list_empty(&power->genpd_list)) {
+		if (pstate == power->genpd_pstate) {
+			mutex_unlock(power->genpd_lock);
+			return 0;
+		}
+		list_del_init(&power->genpd_list);
+	}
+
+	/* search the genpd pstate node that match pstate requirement */
+	list_for_each_entry(ps_node, power->genpd_head, genpd_list) {
+		if (ps_node->pstate == pstate) {
+			new_ps_node = ps_node;
+			list_add(&power->genpd_list,
+				 &new_ps_node->genpd_pstate_head);
+			goto linked_into_pstate;
+		}
+		if (ps_node->pstate > pstate) {
+			if (pre_ps_node != NULL)
+				insert_pos = &pre_ps_node->genpd_list;
+			else
+				insert_pos = power->genpd_head;
+			goto new_pstate_node;
+		}
+		pre_ps_node = ps_node;
+	}
+	/* Add new genpd pstate node in the end */
+	insert_pos = &pre_ps_node->genpd_list;
+
+new_pstate_node:
+	new_ps_node = kmalloc(sizeof(struct clkpstate_node), GFP_KERNEL);
+	if (new_ps_node == NULL) {
+		mutex_unlock(power->genpd_lock);
+		return -ENOMEM;
+	}
+
+	/* link this pstate node into genpd pstate link list */
+	INIT_LIST_HEAD(&new_ps_node->genpd_list);
+	INIT_LIST_HEAD(&new_ps_node->genpd_pstate_head);
+	new_ps_node->pstate = pstate;
+	list_add(&new_ps_node->genpd_list, insert_pos);
+	list_add(&power->genpd_list, &new_ps_node->genpd_pstate_head);
+
+	/* Find and set the highest pstate */
+	list_for_each_entry_reverse(ps_node, power->genpd_head, genpd_list) {
+		if (!list_empty(&ps_node->genpd_pstate_head)) {
+			pr_debug("%s: genpd set perf state %d for clk %s\n",
+				  __func__, pstate, core->name);
+			ret = dev_pm_genpd_set_performance_state(
+					*power->genpd_dev, ps_node->pstate);
+			if (ret) {
+				/* No need to free new_ps_node as it's empty */
+				mutex_unlock(power->genpd_lock);
+				pr_err("%s: fail to set genpd opp for clk %s\n",
+					__func__, core->name);
+				return ret;
+			}
+			break;
+		}
+	}
+
+linked_into_pstate:
+	power->genpd_pstate = pstate;
+	mutex_unlock(power->genpd_lock);
+	return ret;
+}
+
+static void clk_unvote_power(struct clk_core *core)
+{
+	struct clk_power_data *power = core->power;
+
+	if (!core->power)
+		return;
+
+	/* regulator added here in future */
+
+	if (power->genpd_dev)
+		clk_unvote_genpd(core);
+}
+
+static int clk_vote_power(struct clk_core *core, unsigned long rate)
+{
+	struct clk_power_data *power = core->power;
+	int ret = 0;
+
+	if (!core->power)
+		return 0;
+
+	/* regulator added here in future */
+
+	if (power->genpd_dev)
+		ret = clk_vote_genpd(core, rate);
+
+	return ret;
+}
+
 static void clk_core_unprepare(struct clk_core *core)
 {
 	lockdep_assert_held(&prepare_lock);
@@ -840,6 +997,8 @@ static void clk_core_unprepare(struct clk_core *core)
 	if (core->ops->unprepare)
 		core->ops->unprepare(core->hw);
 
+	clk_unvote_power(core);
+
 	clk_pm_runtime_put(core);
 
 	trace_clk_unprepare_complete(core);
@@ -887,6 +1046,10 @@ static int clk_core_prepare(struct clk_core *core)
 		if (ret)
 			return ret;
 
+		ret = clk_vote_power(core, core->rate);
+		if (ret)
+			return ret;
+
 		ret = clk_core_prepare(core->parent);
 		if (ret)
 			goto runtime_put;
@@ -2189,7 +2352,7 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 {
 	struct clk_core *top, *fail_clk;
 	unsigned long rate;
-	int ret = 0;
+	int ret = 0, post_set_power = 0;
 
 	if (!core)
 		return 0;
@@ -2223,10 +2386,21 @@ static int clk_core_set_rate_nolock(struct clk_core *core,
 		goto err;
 	}
 
+	if (rate > core->rate) {
+		ret = clk_vote_power(core, rate);
+		if (ret)
+			goto err;
+	} else {
+		post_set_power = 1;
+	}
+
 	/* change the rates */
 	clk_change_rate(top);
 
 	core->req_rate = req_rate;
+
+	if (post_set_power)
+		ret = clk_vote_power(core, rate);
 err:
 	clk_pm_runtime_put(core);
 
@@ -3905,7 +4079,8 @@ static void clk_core_free_parent_map(struct clk_core *core)
 static struct clk *
 __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 {
-	int ret;
+	int ret, cnt;
+	unsigned long rate;
 	struct clk_core *core;
 	const struct clk_init_data *init = hw->init;
 
@@ -3946,6 +4121,38 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->min_rate = 0;
 	core->max_rate = ULONG_MAX;
 
+	if (init->power && init->power_magic == CLK_POWER_MAGIC) {
+		struct clk_power_data *power = init->power;
+		const struct genpdopp_table *ptable = power->genpdopp_table;
+
+		power->core = core;
+		if (power->genpd_dev) {
+			if (!power->genpd_lock || !power->genpd_head ||
+			   !power->genpdopp_table || !power->genpdopp_num) {
+				pr_err("%s: invalid power domain for clk %s\n",
+					__func__, core->name);
+				goto skip_clk_power;
+			}
+		}
+		for (cnt = 0; cnt < power->genpdopp_num - 1; cnt++) {
+			rate = ptable->ceiling_rate;
+			ptable++;
+			if (rate >= ptable->ceiling_rate) {
+				pr_err("%s: invalid asending rate for clk %s\n",
+					__func__, core->name);
+				ret = -EINVAL;
+				goto skip_clk_power;
+			}
+		}
+		core->power = kmalloc(sizeof(*power), GFP_KERNEL);
+		if (!core->power)
+			goto skip_clk_power;
+
+		memcpy(core->power, power, sizeof(*power));
+		INIT_LIST_HEAD(&core->power->genpd_list);
+	}
+
+skip_clk_power:
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
@@ -3978,6 +4185,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 fail_create_clk:
 	clk_core_free_parent_map(core);
 fail_parents:
+	kfree(core->power);
 fail_ops:
 	kfree_const(core->name);
 fail_name:
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e2..bcf62fb0a6a1 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -268,12 +268,71 @@ struct clk_parent_data {
 	int			index;
 };
 
+/**
+ * struct genpdopp_table - opp pstate and clk rate mapping table
+ *
+ * @pstate: power domain performance state
+ * @ceiling_rate: the max clock rate this pstate supports
+ */
+struct genpdopp_table {
+	unsigned int	pstate;
+	unsigned long	ceiling_rate;
+};
+
+/**
+ * struct clkpstate_node - opp pstate node holds lists of clks that depends
+ *			on a specific performance state. The nodes should be
+ *			from low to high pstate lead by genpd_head.
+ *
+ * @genpd_list: list node that linked to a genpd list
+ * @genpd_pstate_head: list head that lead clks that depends on this pstate
+ * @pstate: power domain performance state
+ */
+struct clkpstate_node {
+	struct list_head	genpd_list;
+	struct list_head	genpd_pstate_head;
+	unsigned int		pstate;
+};
+
+/**
+ * struct clk_power_data - holds power data that's common to all clocks and is
+ * shared between the clock provider and the common clock framework.
+ *
+ * @genpd_list: genpd consumer node of this clk, to be into one of genpd pstate
+ *		consumer lists that lead by genpd_head when clk rate is set to
+ *		a genpd opp pstate.
+ * @genpd_head: list head that holds genpd performance states heads, where
+ *		genpd performance list heads are held. Those heads are holding
+ *		genpd consumers in different opp pstate.
+ * @genpd_lock: spin_lock that protect genpd list operation
+ * @genpd_dev: device that bind the power domain where clk is on. It is clock
+ *		controller device by default, or virtual device if there are
+ *		multiple power domain for controller device
+ * @genpdopp_table: genpd opp pstate and clk rate mapping table. The rate should
+		be listed from lowest to highest strictly in table.
+ * @genpdopp_num: genpd opp pstate table entry number
+ * @genpd_pstate: current genpd opp pstate this clk requires
+ */
+struct clk_power_data {
+	struct list_head		genpd_list;
+	struct list_head		*genpd_head;
+	struct mutex			*genpd_lock;
+	struct device			**genpd_dev;
+	const struct genpdopp_table	*genpdopp_table;
+	unsigned int			genpdopp_num;
+	unsigned int			genpd_pstate;
+	struct clk_core			*core;
+};
+
 /**
  * struct clk_init_data - holds init data that's common to all clocks and is
  * shared between the clock provider and the common clock framework.
  *
  * @name: clock name
  * @ops: operations this clock supports
+ * power: power data that this clock operates on
+ * @power_magic: magic number to indicate that power data is valid. To sanity
+ *	check for none NULL invalid power data case.
  * @parent_names: array of string names for all possible parents
  * @parent_data: array of parent data for all possible parents (when some
  *               parents are external to the clk controller)
@@ -282,9 +341,12 @@ struct clk_parent_data {
  * @num_parents: number of possible parents
  * @flags: framework-level hints and quirks
  */
+#define CLK_POWER_MAGIC 0x5c5c6969
 struct clk_init_data {
 	const char		*name;
+	int			power_magic;
 	const struct clk_ops	*ops;
+	struct clk_power_data	*power;
 	/* Only one of the following three should be assigned */
 	const char		* const *parent_names;
 	const struct clk_parent_data	*parent_data;
-- 
2.25.1

