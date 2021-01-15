Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 469BE2F70D3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 04:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732386AbhAODRd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jan 2021 22:17:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726702AbhAODRd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jan 2021 22:17:33 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F5FC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:16:47 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id cq1so4268515pjb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jan 2021 19:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p7zpEv9oX6ykv/tex0korxEUMq0epw7wPN0O1ExTQX8=;
        b=Is14NoFFfR8v8M7Cz3eZV3HjrWwyyOwBOCc3Ir9fEePREURL/bjtO/Nus6fbQEL7L5
         L+bg/5B5rbsSt+nyY5uq2AEL7jvR8/u6ruXJf7y7oa5zHBakB/6EPltdqJqsxmonwON3
         /fPiPjG4ZZmw4QT1+/f5q/C0xn2LcVAWOrhZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7zpEv9oX6ykv/tex0korxEUMq0epw7wPN0O1ExTQX8=;
        b=liOd/ytxAi76Vlut3t0vR4Xp40ifWleC8VSsi8RbrR2M48Ta/J3MPgBVR7ZPImPNuf
         HbdoFltBftewB9+onzSqrKGaUiq0nW6DfkD7tNzfRZk0gDnWu43vJ1ZGLXQzC50Z4EAu
         3a7x4K0hgcKflUiQIb48N3IQU1KVFY7oQIu8TGZ4JdkbRpNmpSkhj+w1qNVwaV9nk1Mk
         ZcvII1As6NHetBrFRtK55i2iiuZhCDMnw0uBl6VdB/QDMjqjRRyV3AALrri2yui3fihI
         Oe5F2cIrsKszRHN7D/ppdC+UtMt1RFXYICkfNMzPk7EFA2Igf0FpJffvhTJ3PM8F/y9+
         v/0Q==
X-Gm-Message-State: AOAM531CMtJaePmfVIc2RCNFAnADMsGNeAsIM6KcG4aBFrBsBsPZ3hjU
        qQ4qVsME1R68hM1jTwIYnrMj8A==
X-Google-Smtp-Source: ABdhPJzmK8tIJ03CfYW9jOjPJdxLW5HO/zNJ47qYUxnMt5BU2EHJ8vyiNWHjXoSWhTck8tGKdduitg==
X-Received: by 2002:a17:90a:5793:: with SMTP id g19mr8392975pji.32.1610680606890;
        Thu, 14 Jan 2021 19:16:46 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id q26sm6346318pfl.219.2021.01.14.19.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 19:16:46 -0800 (PST)
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
Subject: [PATCH v7 2/4] pinctrl: qcom: No need to read-modify-write the interrupt status
Date:   Thu, 14 Jan 2021 19:16:22 -0800
Message-Id: <20210114191601.v7.2.I3635de080604e1feda770591c5563bd6e63dd39d@changeid>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
In-Reply-To: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
References: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When the Qualcomm pinctrl driver wants to Ack an interrupt, it does a
read-modify-write on the interrupt status register.  On some SoCs it
makes sure that the status bit is 1 to "Ack" and on others it makes
sure that the bit is 0 to "Ack".  Presumably the first type of
interrupt controller is a "write 1 to clear" type register and the
second just let you directly set the interrupt status register.

As far as I can tell from scanning structure definitions, the
interrupt status bit is always in a register by itself.  Thus with
both types of interrupt controllers it is safe to "Ack" interrupts
without doing a read-modify-write.  We can do a simple write.

It should be noted that if the interrupt status bit _was_ ever in a
register with other things (like maybe status bits for other GPIOs):
a) For "write 1 clear" type controllers then read-modify-write would
   be totally wrong because we'd accidentally end up clearing
   interrupts we weren't looking at.
b) For "direct set" type controllers then read-modify-write would also
   be wrong because someone setting one of the other bits in the
   register might accidentally clear (or set) our interrupt.
I say this simply to show that the current read-modify-write doesn't
provide any sort of "future proofing" of the code.  In fact (for
"write 1 clear" controllers) the new code is slightly more "future
proof" since it would allow more than one interrupt status bits to
share a register.

NOTE: this code fixes no bugs--it simply avoids an extra register
read.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v6)

Changes in v6:
- Remove unneeded parenthesis.

Changes in v5:
- ("pinctrl: qcom: No need to read-modify-write the ...") new for v5.

 drivers/pinctrl/qcom/pinctrl-msm.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index d1261188fb6e..2f363c28d9d9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -791,16 +791,13 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	if (status_clear) {
-		/*
-		 * clear the interrupt status bit before unmask to avoid
-		 * any erroneous interrupts that would have got latched
-		 * when the interrupt is not in use.
-		 */
-		val = msm_readl_intr_status(pctrl, g);
-		val &= ~BIT(g->intr_status_bit);
-		msm_writel_intr_status(val, pctrl, g);
-	}
+	/*
+	 * clear the interrupt status bit before unmask to avoid
+	 * any erroneous interrupts that would have got latched
+	 * when the interrupt is not in use.
+	 */
+	if (status_clear)
+		msm_writel_intr_status(0, pctrl, g);
 
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
@@ -905,11 +902,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
-	val = msm_readl_intr_status(pctrl, g);
-	if (g->intr_ack_high)
-		val |= BIT(g->intr_status_bit);
-	else
-		val &= ~BIT(g->intr_status_bit);
+	val = g->intr_ack_high ? BIT(g->intr_status_bit) : 0;
 	msm_writel_intr_status(val, pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
-- 
2.30.0.284.gd98b1dd5eaa7-goog

