Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F15B71105
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jul 2019 07:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726504AbfGWFOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Jul 2019 01:14:51 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:35761 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726116AbfGWFOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Jul 2019 01:14:51 -0400
Received: by mail-pf1-f193.google.com with SMTP id u14so18515561pfn.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2019 22:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=g82NP5kE6vDBcz0wRx3HQUPY+qpp2eV2hYfp3Uv8Vuo=;
        b=PjeA4UGXWrX7eWxBKCqRGmYrPvlnc4Bc0zcv0AXulqxA13EAD5I6W1Ktegac4R8rd6
         nqTUr59Y1cBaq2k5PsjAGgvvnd8+z2GDbhDRnvz0yhIpwiR10yY3ZczBOANft1O02EI3
         YyMt9iV7PaFFWCcnbU3kl+A9jkJk3y6kjqTFTswd0Y0P3Rr5yCHC+VtY99tR+fmQfkQ8
         QYz5Dqpan8whgAnXJmUkWJTHKQs2U6j2zK9U7z+zl1Q/ZklGFxcRNLmsRkSQ8XWpbRS+
         psQHHJC3x4F8OqHl+YpZv32+3kFNTljWvL6+wz8F5UkLYDWdsj7FYp0gzepeFDhRxpuI
         qADg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=g82NP5kE6vDBcz0wRx3HQUPY+qpp2eV2hYfp3Uv8Vuo=;
        b=LYweJAXoLI0ED0Z6rOCdDsUv9ONbUaLv0wibYG4JKYNA8jXPs5hNUVAKRyHnRuqOVA
         uSWbHtWaKogBTrAaYqSaAHGd9qG0slYMgmqcbgCTMvM73eoe1oFCyDxhOWxvH0s9YR8Z
         V9UurLCYpnw4ZRGAdhoRUbrJeZPhLiT1ivPQBGGHiwtT0uZYJqJQbLs32PKBi1urWUkI
         IHa3gsPF2YeOwZuNe/mgNQkAs1qLhKD+CWwvFiUBVXhxoh0H6oLTyB8g3hVlBV0nH281
         hXUfQyU+6Ru/YS/OHRZWmzQNcvbC1tHyvYQPXvFtS1vfADGMlKxME+D9fv5oq0mukTIN
         40pw==
X-Gm-Message-State: APjAAAVvAb8rpCYf6Skp/S9WQcScwUUEJUBaKR/r7RsMAvzk6+fGgnFu
        oa395+cXbBAYQrypHSpahoEdWg==
X-Google-Smtp-Source: APXvYqzkV5mF55GBnujgmB5DhZBig4ykpvvwizIq6zr0p86mQc67qRs9Si4/HU58xo1Fk2BC6VTxTw==
X-Received: by 2002:a62:834d:: with SMTP id h74mr4077651pfe.254.1563858890244;
        Mon, 22 Jul 2019 22:14:50 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a3sm33729999pfc.70.2019.07.22.22.14.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2019 22:14:49 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Clark <robclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
Subject: [RFC] clk: Remove cached cores in parent map during unregister
Date:   Mon, 22 Jul 2019 22:14:46 -0700
Message-Id: <20190723051446.20013-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As clocks are registered their parents are resolved and the parent_map
is updated to cache the clk_core objects of each existing parent.
But in the event of a clock being unregistered this cache will carry
dangling pointers if not invalidated, so do this for all children of the
clock being unregistered.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

This resolves the issue seen where the DSI PLL (and it's provided clocks) is
being registered and unregistered multiple times due to probe deferral.

Marking it RFC because I don't fully understand the life of the clock yet.

 drivers/clk/clk.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..8cd1ad977c50 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2423,11 +2423,14 @@ bool clk_has_parent(struct clk *clk, struct clk *parent)
 EXPORT_SYMBOL_GPL(clk_has_parent);
 
 static int clk_core_set_parent_nolock(struct clk_core *core,
-				      struct clk_core *parent)
+				      struct clk_core *parent,
+				      bool invalidate_parent)
 {
+	struct clk_core *old_parent = core->parent;
 	int ret = 0;
 	int p_index = 0;
 	unsigned long p_rate = 0;
+	int i;
 
 	lockdep_assert_held(&prepare_lock);
 
@@ -2481,6 +2484,14 @@ static int clk_core_set_parent_nolock(struct clk_core *core,
 		__clk_recalc_accuracies(core);
 	}
 
+	/* invalidate the parent cache */
+	if (!parent && invalidate_parent) {
+		for (i = 0; i < core->num_parents; i++) {
+			if (core->parents[i].core == old_parent)
+				core->parents[i].core = NULL;
+		}
+	}
+
 runtime_put:
 	clk_pm_runtime_put(core);
 
@@ -2517,7 +2528,8 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
 		clk_core_rate_unprotect(clk->core);
 
 	ret = clk_core_set_parent_nolock(clk->core,
-					 parent ? parent->core : NULL);
+					 parent ? parent->core : NULL,
+					 false);
 
 	if (clk->exclusive_count)
 		clk_core_rate_protect(clk->core);
@@ -3772,7 +3784,7 @@ void clk_unregister(struct clk *clk)
 		/* Reparent all children to the orphan list. */
 		hlist_for_each_entry_safe(child, t, &clk->core->children,
 					  child_node)
-			clk_core_set_parent_nolock(child, NULL);
+			clk_core_set_parent_nolock(child, NULL, true);
 	}
 
 	hlist_del_init(&clk->core->child_node);
-- 
2.18.0

