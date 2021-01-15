Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A622F70D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732419AbhAODSM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:18:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732418AbhAODSM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:18:12 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AEA1C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:16:49 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id b8so3995358plx.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=N9ZaqZ46wlGnN7FBtq7FolY4OMba+JOZe66Oqhjpajw=;
        b=dMkB7BJyvcLuCZx0F/66ek/Tz5GqGjfQcXs9Rzh7Zq+KUCQgvscmK/otbbIT+ZYA/J
         pCCTkdaX+GEy0jLQ7BH3vamYhINMDPsKpuco7SNZGxFR/Nlks50/1yuj3bP9nEZafqfT
         ppSKO2C1CbgwM+lEsXvwRUPCmsI/wgjV+S/rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=N9ZaqZ46wlGnN7FBtq7FolY4OMba+JOZe66Oqhjpajw=;
        b=EXoWdUzOVxrMmnJ54ZhpX2OyOyjFQwG1Cqt+AyYMPlHfeZebs36UvLlXUpA82dOkq4
         TRfVcVZA9eGdbDnvEeR9WmZICy+POcnYD7cLzhaDIpnNiQ6Mrmazjw5DmSX3oMJHF+t9
         uphI9WzRkhQKbnmIZ/TF2IlVznLURZrG1pLK79hf94YJj/jlNpXNLzfbwJhLXUb2u8+q
         JVkCcxnDQwcd2auki9DQA0Fccp+bFA0BAFC4f5QKNMnWUbRmy+rj1z9F7Nk5a9aLw6sT
         K2NRTZ1qdeb0ggwo5A8zH0vw6920w66IZVST7BrD6/GLGOko1zSI3es2r5VqtC/31G4w
         QT0Q==
X-Gm-Message-State: AOAM532qPrcWNnpd29NPP7XhFoLdvniqmM0AESomtIx8ltqiLRxlwZCC
        sP8w/u9OIL56XTxw+y1mojnrRw==
X-Google-Smtp-Source: ABdhPJzzSZKdii7IwEyI38w9KApzOhoLGDuRizDSSh2SuFTQg6qzwwnyTi5JBx4V9Ly4YmLV0Wi4PQ==
X-Received: by 2002:a17:902:d891:b029:de:369c:6bc7 with SMTP id b17-20020a170902d891b02900de369c6bc7mr10035732plz.31.1610680608722;
        Thu, 14 Jan 2021 19:16:48 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q26sm6346318pfl.219.2021.01.14.19.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:16:48 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/4] pinctrl: qcom: Properly clear "intr_ack_high" interrupts when unmasking
Date:   Thu, 14 Jan 2021 19:16:23 -0800
Message-Id: <20210114191601.v7.3.I32d0f4e174d45363b49ab611a13c3da8f1e87d0f@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
References: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In commit 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for
msm gpio") we tried to Ack interrupts during unmask.  However, that
patch forgot to check "intr_ack_high" so, presumably, it only worked
for a certain subset of SoCs.

Let's add a small accessor so we don't need to open-code the logic in
both places.

This was found by code inspection.  I don't have any access to the
hardware in question nor software that needs the Ack during unmask.

Fixes: 4b7618fdc7e6 ("pinctrl: qcom: Add irq_enable callback for msm gpio")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
It should be noted that this code will be moved in the next patch.  In
theory this could be squashed into the next patch but it seems more
documenting to have this as a separate patch.

(no changes since v6)

Changes in v6:
- Remove unneeded parenthesis.

Changes in v5:
- ("pinctrl: qcom: Properly clear "intr_ack_high" interrupts...") new for v5.

 drivers/pinctrl/qcom/pinctrl-msm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 2f363c28d9d9..192ed31eabf4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -96,6 +96,14 @@ MSM_ACCESSOR(intr_cfg)
 MSM_ACCESSOR(intr_status)
 MSM_ACCESSOR(intr_target)
 
+static void msm_ack_intr_status(struct msm_pinctrl *pctrl,
+				const struct msm_pingroup *g)
+{
+	u32 val = g->intr_ack_high ? BIT(g->intr_status_bit) : 0;
+
+	msm_writel_intr_status(val, pctrl, g);
+}
+
 static int msm_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
@@ -797,7 +805,7 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 	 * when the interrupt is not in use.
 	 */
 	if (status_clear)
-		msm_writel_intr_status(0, pctrl, g);
+		msm_ack_intr_status(pctrl, g);
 
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
@@ -890,7 +898,6 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
-	u32 val;
 
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
@@ -902,8 +909,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = g->intr_ack_high ? BIT(g->intr_status_bit) : 0;
-	msm_writel_intr_status(val, pctrl, g);
+	msm_ack_intr_status(pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 		msm_gpio_update_dual_edge_pos(pctrl, g, d);
-- 
2.30.0.284.gd98b1dd5eaa7-goog

