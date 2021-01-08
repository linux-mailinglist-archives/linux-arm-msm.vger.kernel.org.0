Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DD6B2EF68F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 18:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728530AbhAHRhI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 12:37:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728395AbhAHRhH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 12:37:07 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57AFEC06129E
        for <linux-arm-msm@vger.kernel.org>; Fri,  8 Jan 2021 09:35:50 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id x126so6676038pfc.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 Jan 2021 09:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NWeNVhHBQriYHElYut4sIDkeHCxpOsy0zeO3R0EcrZs=;
        b=gitdbsRXUUNlxvhhaDHU9H74LPVrCzER8lNo58HHLgmXTbtA4Zz0DS47MFLORIDenw
         AuIjVRUIYBxTr+zdgUMdLGrT49UyLpVE7nYPnEwgudirgVEUcQ2kKSj8GvkzivuYfo9R
         oEWhmBwgYquKQr+3HCKaquX6HOmmgZ6fQnV4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NWeNVhHBQriYHElYut4sIDkeHCxpOsy0zeO3R0EcrZs=;
        b=FWP6zD9kWSjtUDu1OdC2TsDTT16jTkJquvIwFpTEYa8tDFxAmdAaNvY0I/NTlS3Alb
         Q4kO6SNqIGfM76XJ5ShUO46rMIIjO41k/4rC+jj7mrGjlf9gyQD5Kk7X+XUmMlyzuRpU
         OheRBpiinWo+aqrUggntmcKZ4LghDLrgOfIYTsDsLaHW2VwogrrWzExj+qVu6X9CQw/e
         LNckam7NXW4DN94eH2ExXwNBY//Ttlx97LmmC65J615mRdabmycNkCFXvgFVbVDkWSGx
         S73pOu1ZExR3ztmDAUffSWMxyqmDqN9slkUjM0pbjnENh80J5UNzFRM+5UZh6uddeWyK
         qVLQ==
X-Gm-Message-State: AOAM532zCknD1HVQvc8F/ovwiRFs+PrRYTpXmBZvU8+sYYzwejt5Qanb
        +dv5NkHOI0AsklEDQYslXoGc8g==
X-Google-Smtp-Source: ABdhPJwGKvhGrqpD2mUiuU9++lk/mDnNGEcCmGVCYte+Fgza04DZRHEsAH8Sgef/6OucwTC5fZ1xgA==
X-Received: by 2002:a63:dc4c:: with SMTP id f12mr8023342pgj.167.1610127349809;
        Fri, 08 Jan 2021 09:35:49 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id z23sm10245619pfj.143.2021.01.08.09.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jan 2021 09:35:49 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/4] pinctrl: qcom: Properly clear "intr_ack_high" interrupts when unmasking
Date:   Fri,  8 Jan 2021 09:35:15 -0800
Message-Id: <20210108093339.v5.3.I32d0f4e174d45363b49ab611a13c3da8f1e87d0f@changeid>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
In-Reply-To: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
References: <20210108093339.v5.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
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
---
It should be noted that this code will be moved in the next patch.  In
theory this could be squashed into the next patch but it seems more
documenting to have this as a separate patch.

Changes in v5:
- ("pinctrl: qcom: Properly clear "intr_ack_high" interrupts...") new for v5.

 drivers/pinctrl/qcom/pinctrl-msm.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 1787ada6bfab..a6b0c17e2f78 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -96,6 +96,14 @@ MSM_ACCESSOR(intr_cfg)
 MSM_ACCESSOR(intr_status)
 MSM_ACCESSOR(intr_target)
 
+static void msm_ack_intr_status(struct msm_pinctrl *pctrl,
+				const struct msm_pingroup *g)
+{
+	u32 val = (g->intr_ack_high) ? BIT(g->intr_status_bit) : 0;
+
+	msm_writel_intr_status(val, pctrl, g);
+}
+
 static int msm_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
@@ -798,7 +806,7 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 	 * when the interrupt is not in use.
 	 */
 	if (status_clear)
-		msm_writel_intr_status(0, pctrl, g);
+		msm_ack_intr_status(pctrl, g);
 
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
@@ -891,7 +899,6 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
-	u32 val;
 
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
@@ -903,8 +910,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = (g->intr_ack_high) ? BIT(g->intr_status_bit) : 0;
-	msm_writel_intr_status(val, pctrl, g);
+	msm_ack_intr_status(pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 		msm_gpio_update_dual_edge_pos(pctrl, g, d);
-- 
2.29.2.729.g45daf8777d-goog

