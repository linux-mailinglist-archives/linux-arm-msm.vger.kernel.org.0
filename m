Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5252A44A498
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 03:26:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240706AbhKIC3F (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 21:29:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239712AbhKIC3A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 21:29:00 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14FEBC061766
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Nov 2021 18:26:15 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id q17so6065442plr.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Nov 2021 18:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=xovCIAAU5pofSMeWtP54czW4maGEjZGkO8QeFrRIQTk=;
        b=e4/preGPlSWk95qmVJkS4xeVPT6dAY2jnQ3X7fvClPv3FdUT8chK7JEXCndXGoaksS
         Vb6eo+rqp56mN64WyzTVZ+c4m+N7FnfeGAhTQa9Rv9wloKesozNNxuPpowvQZ8MtdyK1
         L4jRDCzsvFsLjjzAWmpLCsholEPqtJ4opcp8NAWVJ6drA5SYf2XRE3yh8Ncpj/dJSKX9
         mRxsL0BCeitajLIrESWWEZc4NMypy+xB+zrwK8SskdmG4nSJD7GUuRc+JP82bYscWT97
         oqnbJ/bRTGrj6eHKBeDsFWaYjjsjt7nhOr1WK/4tFZExWJihX6+kS4gr/tl+mj8rGkDs
         Awzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=xovCIAAU5pofSMeWtP54czW4maGEjZGkO8QeFrRIQTk=;
        b=VKYKsSK8gZbZkVIedmaM51jwRrgs/eXsCGaJ2HfEM6VrUW+MYR79q9u5Z+oE4C1Ren
         CsRnRWcc0UO1uZxal6+OPVcKqVTd/BBJTghgZ7cMP8KLIsA/yKel0ZcfGxdLBWRcBvDN
         1smidFRz6FQGSMZHRgMA4/dWBvn+k2l9b2fsNs5AiK90ZVyLwMXr+4OjoyRikrsMq+Cw
         q26syiv0AzAzW+mpE/WZ5swyQ60EKQsa3qEaBOBaI7nGCh2+H7KdD7DleXkJoSMuwnrm
         7gn2t1ab/PnZVBRyjTxve79LuI/h7W0EK3UxubA076stJ5eWixu2wqIr2CNs5JrOlJZh
         +HbA==
X-Gm-Message-State: AOAM530x7GzWf/HAjHIRrnD1/oNqB4yUDEddj5sQhF/zkGHG6v10XpRh
        VNEJVr3hQIWOgLY/A4x46U0DCQ==
X-Google-Smtp-Source: ABdhPJy1Hm54FpGAARbZdw+4XYxjjOEvp9yjVdUeIk/K3Cn3qlozXKR6ztdBUyoU/yvyohP7DLQqJg==
X-Received: by 2002:a17:90b:2252:: with SMTP id hk18mr3307206pjb.218.1636424774426;
        Mon, 08 Nov 2021 18:26:14 -0800 (PST)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id om8sm589619pjb.12.2021.11.08.18.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 18:26:14 -0800 (PST)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] clk: qcom: smd-rpm: Add .is_prepared hook
Date:   Tue,  9 Nov 2021 10:25:58 +0800
Message-Id: <20211109022558.14529-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109022558.14529-1-shawn.guo@linaro.org>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The RPM clocks are enabled/disabled through clk framework prepare/unprepare
hooks.  Without .is_prepared hook, those unused RPM clocks will not be
disabled by core function clk_unprepare_unused_subtree(), because
clk_core_is_prepared() always returns 0.

Add .is_prepared hook to clk_ops and return the clock prepare (enable)
state, so that those unused RPM clocks can be disabled by clk framework.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index f8be58121bd6..c8f058720e66 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -409,6 +409,13 @@ static int clk_smd_rpm_is_enabled(struct clk_hw *hw)
 	return r->enabled;
 }
 
+static int clk_smd_rpm_is_prepared(struct clk_hw *hw)
+{
+	struct clk_smd_rpm *r = to_clk_smd_rpm(hw);
+
+	return r->enabled;
+}
+
 static const struct clk_ops clk_smd_rpm_ops = {
 	.prepare	= clk_smd_rpm_prepare,
 	.unprepare	= clk_smd_rpm_unprepare,
@@ -416,6 +423,7 @@ static const struct clk_ops clk_smd_rpm_ops = {
 	.round_rate	= clk_smd_rpm_round_rate,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 	.is_enabled	= clk_smd_rpm_is_enabled,
+	.is_prepared	= clk_smd_rpm_is_prepared,
 };
 
 static const struct clk_ops clk_smd_rpm_branch_ops = {
@@ -423,6 +431,7 @@ static const struct clk_ops clk_smd_rpm_branch_ops = {
 	.unprepare	= clk_smd_rpm_unprepare,
 	.recalc_rate	= clk_smd_rpm_recalc_rate,
 	.is_enabled	= clk_smd_rpm_is_enabled,
+	.is_prepared	= clk_smd_rpm_is_prepared,
 };
 
 DEFINE_CLK_SMD_RPM(msm8916, pcnoc_clk, pcnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 0);
-- 
2.17.1

