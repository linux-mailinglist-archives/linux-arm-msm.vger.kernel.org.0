Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A6A4656FAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Dec 2022 22:03:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232614AbiL0VDM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Dec 2022 16:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbiL0VCw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Dec 2022 16:02:52 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E11C1004
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 12:45:51 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bk16so136395wrb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Dec 2022 12:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jMtSkf5GA9IYjK1JZDsDiUsv6BKdatljycze6k+PiwQ=;
        b=xVzN0pGT5vPr+EDCy/QndegBqTaNSMs7ICo2xVWwFO4b+XsbbQQzzPOkbP4GmmWaPh
         MFjOQuO/cTR00OKiG/6Cusnyp5AmUrG8LpmMsK4fEabbC7gjEnXg5hzFGOojYRA5T5YY
         uVaNoJRyXe5UznjAChgWMi3ZC34yFv+nW3r6A0jgdH7ac/aJLyN/aEbyvIgAstUsD9DW
         KWrBjWvaniWZDRtNFjBRJKIfVgGIHGVw/ahro0QRETdixepp2rLXUbjQg764CAkfDxpO
         EYjZ/tQlUe9N+Go8/14yTGey4hy915iLlF4Hl/iY+Lk1KFawJWKhWwBwktQJZ1RYMSXA
         397w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jMtSkf5GA9IYjK1JZDsDiUsv6BKdatljycze6k+PiwQ=;
        b=h4IGTj/SseYpoVuKTG1yE9fyrtKzZZ2SH6YEjIcZ6ZOnryGhqluYXACV3zvQ8sFCZD
         5p8PMAWzqBcrXe6FQM70pv8+nspr/kBl114UGn5zt/3WxjKDw9daANTMUDU4nTTMPllO
         OqEh6hpkwOFQBjM0Ch0v/Nv9pUL3cnct1gcECJTOy8pvWYvyedDuOXcGTf4tMPrzPDru
         iDd4Yfi6XEH1iu8f4eetmOot1L31hb9Rbn9UjiSRsxrCKkpmjsYw4ix0Bg8INz4lVVrH
         9NW4EYKBa5V8T7Ynq1pIVBJV/x83bJM/jbp8QhPErmWE/B0urOBlm3XgPmGAAnZJrcDe
         GEtw==
X-Gm-Message-State: AFqh2krU/1LYme1Iasaj1PmpnImCApgMmz18ouC2CyM5V8o6JZEZ45i9
        zVF7yDTaMkljjxdVdFRCOBHtLfY3VFQfScCJ
X-Google-Smtp-Source: AMrXdXsnIs5gGXrna/oO8N55xD3o+MGahUcpJ5ut0xi4Q5UceyDaLi5BqdGvMWvO9tncnlj5bGfVwg==
X-Received: by 2002:adf:e38e:0:b0:242:137d:9ce8 with SMTP id e14-20020adfe38e000000b00242137d9ce8mr13218151wrm.9.1672173949777;
        Tue, 27 Dec 2022 12:45:49 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m17-20020a056000181100b002422202fa7fsm13337571wrh.39.2022.12.27.12.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 12:45:49 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 1/2] clk: Add generic sync_state callback for disabling unused clocks
Date:   Tue, 27 Dec 2022 22:45:27 +0200
Message-Id: <20221227204528.1899863-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are unused clocks that need to remain untouched by clk_disable_unused,
and most likely could be disabled later on sync_state. So provide a generic
sync_state callback for the clock providers that register such clocks.
Then, use the same mechanism as clk_disable_unused from that generic
callback, but pass the device to make sure only the clocks belonging to
the current clock provider get disabled, if unused. Also, during the
default clk_disable_unused, if the driver that registered the clock has
the generic clk_sync_state_disable_unused callback set for sync_state,
skip disabling its clocks.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---

Changes since v2:
 * dropped the check for sync_state callback (clk_sync_state_disable_unused),
   like Dmitry suggested

 drivers/clk/clk.c            | 57 +++++++++++++++++++++++++++++-------
 include/linux/clk-provider.h |  1 +
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e62552a75f08..ac7182903d88 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1302,14 +1302,26 @@ static void clk_core_disable_unprepare(struct clk_core *core)
 	clk_core_unprepare_lock(core);
 }
 
-static void __init clk_unprepare_unused_subtree(struct clk_core *core)
+static void clk_unprepare_unused_subtree(struct clk_core *core,
+						struct device *dev)
 {
+	bool from_sync_state = !!dev;
 	struct clk_core *child;
 
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_unprepare_unused_subtree(child);
+		clk_unprepare_unused_subtree(child, dev);
+
+	if (from_sync_state && core->dev != dev)
+		return;
+
+	/*
+	 * clock will be unprepared on sync_state,
+	 * so leave as is for now
+	 */
+	if (!from_sync_state && dev_has_sync_state(core->dev))
+		return;
 
 	if (core->prepare_count)
 		return;
@@ -1332,15 +1344,27 @@ static void __init clk_unprepare_unused_subtree(struct clk_core *core)
 	clk_pm_runtime_put(core);
 }
 
-static void __init clk_disable_unused_subtree(struct clk_core *core)
+static void clk_disable_unused_subtree(struct clk_core *core,
+					struct device *dev)
 {
+	bool from_sync_state = !!dev;
 	struct clk_core *child;
 	unsigned long flags;
 
 	lockdep_assert_held(&prepare_lock);
 
 	hlist_for_each_entry(child, &core->children, child_node)
-		clk_disable_unused_subtree(child);
+		clk_disable_unused_subtree(child, dev);
+
+	if (from_sync_state && core->dev != dev)
+		return;
+
+	/*
+	 * clock will be disabled on sync_state,
+	 * so leave as is for now
+	 */
+	if (!from_sync_state && dev_has_sync_state(core->dev))
+		return;
 
 	if (core->flags & CLK_OPS_PARENT_ENABLE)
 		clk_core_prepare_enable(core->parent);
@@ -1378,7 +1402,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 		clk_core_disable_unprepare(core->parent);
 }
 
-static bool clk_ignore_unused __initdata;
+static bool clk_ignore_unused;
 static int __init clk_ignore_unused_setup(char *__unused)
 {
 	clk_ignore_unused = true;
@@ -1386,35 +1410,46 @@ static int __init clk_ignore_unused_setup(char *__unused)
 }
 __setup("clk_ignore_unused", clk_ignore_unused_setup);
 
-static int __init clk_disable_unused(void)
+static void __clk_disable_unused(struct device *dev)
 {
 	struct clk_core *core;
 
 	if (clk_ignore_unused) {
 		pr_warn("clk: Not disabling unused clocks\n");
-		return 0;
+		return;
 	}
 
 	clk_prepare_lock();
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_disable_unused_subtree(core);
+		clk_disable_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_root_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	hlist_for_each_entry(core, &clk_orphan_list, child_node)
-		clk_unprepare_unused_subtree(core);
+		clk_unprepare_unused_subtree(core, dev);
 
 	clk_prepare_unlock();
+}
+
+static int __init clk_disable_unused(void)
+{
+	__clk_disable_unused(NULL);
 
 	return 0;
 }
 late_initcall_sync(clk_disable_unused);
 
+void clk_sync_state_disable_unused(struct device *dev)
+{
+	__clk_disable_unused(dev);
+}
+EXPORT_SYMBOL_GPL(clk_sync_state_disable_unused);
+
 static int clk_core_determine_round_nolock(struct clk_core *core,
 					   struct clk_rate_request *req)
 {
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 842e72a5348f..cf1adfeaf257 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -720,6 +720,7 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
 		void __iomem *reg, u8 shift, u8 width,
 		u8 clk_divider_flags, const struct clk_div_table *table,
 		spinlock_t *lock);
+void clk_sync_state_disable_unused(struct device *dev);
 /**
  * clk_register_divider - register a divider clock with the clock framework
  * @dev: device registering this clock
-- 
2.34.1

