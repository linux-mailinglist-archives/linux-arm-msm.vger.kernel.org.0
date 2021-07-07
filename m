Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D7143BE229
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 06:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbhGGEnE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 00:43:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhGGEnD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 00:43:03 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C08EC06175F
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jul 2021 21:40:23 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id l17-20020a9d6a910000b029048a51f0bc3cso1024067otq.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 21:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5H4e4u0XsnmjBPbEPHm1B40OwiQKYlLnQ9+wCD+65I=;
        b=wIEjLTUOfdCzQXZEwRXFkoa1kydtdqNNIQsXs1VYWvqdTaTP0o3VZmN65zVAM8UsgH
         Cz5N0ibLBP8mkNthNXy9vOCeiArIiMQuyn2IikuvqxSDByks550lO0Nx4/wnI9cAlLOZ
         I6euGtircGIDI+R+SI2l5nQKXRbE8093YZZFNawxhWiq1A85zpeDsu/NVdrGUHwUjsUC
         vS5UelTJTxvO/N3KKaW9kP7YJcXnWtu3afbiX1aC8vaMlxjJHdSqZ6F3XEaetXbX06dE
         qLLurS+daipcSeNQ0CVmmx4xmiaU3RfG4OivAll4qgGsOzXViMiXkvCD5ZJotYRNvIjD
         mXqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C5H4e4u0XsnmjBPbEPHm1B40OwiQKYlLnQ9+wCD+65I=;
        b=T1e/ttEErRv60Sh8PJ7xb8OC4x4mcq9kgYYtfPWj3I0slTOXdh5tmUuvYHpwzSEUnx
         0ZgNoyo9/+i3Hdqjp3iR5hQ72As8K6CrKISivMcFIzNEfwBP9VY+XhYa8xsQd8uj/Bnr
         rLeqqU/JUI8PcP4ChbtOZNb+7XdbLMdpl+PAVeOwo++meDDAfO4hsvWUgjwAkHYjiXjc
         /kB0aCI35gH0ttejeAmFSU75VsOkiFyYcRNbgp4Piv9II1JRtiSpPu5ERwO5eqaT8wIN
         yhAHTI/Mx0z5JG2t8lE/TTvHJ3d1gB1qbhKiU2nsVvHlJGHMXw1wl+PDINnrJf5mIy6r
         EpDw==
X-Gm-Message-State: AOAM5321hKv3Q0xdmqRgxcl73WBnljx81JqSbChan31JlvD1D/12ImL/
        vnjM1BRYf5o3ajIauIIg//0Nfg==
X-Google-Smtp-Source: ABdhPJwx1dbI/LyZnXSbUHZWIvb7/jTFRODDFHRsfOLnK2J5LuVmqLE8neL+BWlSo55aYkhzvqBA9w==
X-Received: by 2002:a05:6830:1584:: with SMTP id i4mr3653881otr.353.1625632822719;
        Tue, 06 Jul 2021 21:40:22 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k13sm3706405otl.50.2021.07.06.21.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jul 2021 21:40:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Mike Tipton <mdtipton@codeaurora.org>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [RFC] clk: Allow forcing an unused clock to be disabled
Date:   Tue,  6 Jul 2021 21:38:59 -0700
Message-Id: <20210707043859.195870-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The process of disabling unused clocks will skip clocks that are not
enabled by Linux, but doesn't implement the is_enabled() callback to
read back the hardware state. In the case that it's determined that the
parent clock is enabled this might be turned off, causing the skipped
clock to lock up.

One such case is the RCG "mdp_clk_src" in the Qualcomm SDM845, which at
boot is parented by "disp_cc_pll0", which during clk_disable_unused() is
left untouched, while the parent is disabled.

Later the typical next operation for "mdp_clk_src" is an
assigned-clock-rates will cause the next enable attempt to reparent the
RCG. But the RCG needs both the old and new parent to be ticking to
perform this switch and will therefor not complete.

Introduce a new flag for clock drivers to mark that clocks that should
be assumed to be enabled even when is_enabled isn't implemented and mark
the "mdp_clk_src" clock for SDM845 as such.
This allows the driver to transition the RCG from the PLL to a clock
source that is known to be enabled when the future reparenting operation
is undertaken.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Naturally this patch should be split in a core and driver part, but for the
sake of the RFC I made both changes in the same patch.

 drivers/clk/clk.c                | 2 +-
 drivers/clk/qcom/dispcc-sdm845.c | 1 +
 include/linux/clk-provider.h     | 2 ++
 3 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 65508eb89ec9..9e4789d106f3 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -1265,7 +1265,7 @@ static void __init clk_disable_unused_subtree(struct clk_core *core)
 	 * sequence.  call .disable_unused if available, otherwise fall
 	 * back to .disable
 	 */
-	if (clk_core_is_enabled(core)) {
+	if (clk_core_is_enabled(core) || core->flags & CLK_ASSUME_ENABLED_BOOT) {
 		trace_clk_disable(core);
 		if (core->ops->disable_unused)
 			core->ops->disable_unused(core->hw);
diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 735adfefc379..046f7e656f7c 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -267,6 +267,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
+		.flags = CLK_ASSUME_ENABLED_BOOT,
 	},
 };
 
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 162a2e5546a3..d00ca925842c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -32,6 +32,8 @@
 #define CLK_OPS_PARENT_ENABLE	BIT(12)
 /* duty cycle call may be forwarded to the parent clock */
 #define CLK_DUTY_CYCLE_PARENT	BIT(13)
+/* assume clock is enabled if found unused in late init */
+#define CLK_ASSUME_ENABLED_BOOT	BIT(14)
 
 struct clk;
 struct clk_hw;
-- 
2.29.2

