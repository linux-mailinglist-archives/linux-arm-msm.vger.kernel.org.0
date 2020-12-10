Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D5C2D4FD8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Dec 2020 01:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728441AbgLJAsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Dec 2020 19:48:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729965AbgLJAn0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Dec 2020 19:43:26 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11A48C0617A7
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Dec 2020 16:42:46 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w6so2407551pfu.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Dec 2020 16:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OtKKHM+lfVGS9aSA9NCqh5kpYArg50M6MIVfsP4DbfQ=;
        b=DoaBAJQ7EGMFD6ylzp7C1r8x2quZTXePKc5Ilus12x834dc1Fr7hUBP0QhAzXwy76c
         SmyajWzfrejfbwKrMWd63+kLMLd2jLxHoQbKRoEPUki8KnuXSQK7+XhRLDGOGFSugntr
         NPzqKcRJK/GO+29Fm3Q/WMUK/x3q/6PMknJ9c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OtKKHM+lfVGS9aSA9NCqh5kpYArg50M6MIVfsP4DbfQ=;
        b=ICvMoXRXoVi5/8iPixurzj3QlgHuyEFvbdKeD54FksVuQvoEfWqk4SYFaeyaK/buo6
         ZJAeigmHTG+VHWzxEuuqR5viRSIDO+XEwd00Qa1vqMwa3uPgrPbSsZFkFuZbjCBsK20Q
         9eOuOHLEiM9WRhgNJAJtFvklilOqfkMdrQsZ92eBFJRsiksbpHr36Sn2J2HzZLUOh3ax
         tE+XCxB29VR1HyCbuHFXTBxSv29QGVFJijmNHA6rPrDQr/zc0Ezgi2vN178ObuOjPQou
         5P8y/amBQoNJwTtQAp1OktR4pU2P0rtXeR5HlQs2bOVzADL/Pfl9Sch9YHW8GKsNZmwu
         fuQQ==
X-Gm-Message-State: AOAM532EUV+JOeCwlHVFvt+Rk1muJPvSVi9r2veEU3dSk0Z4FsbSiMs/
        2X/1SDkLGoRFTrlqIBtc2YN4Rw==
X-Google-Smtp-Source: ABdhPJxYE8ouDzBhahQvEhvQ1Ha8ojf7CZnkTDciqw7fzGdD6qRxxK+IKnGeWSDFYMsGcId/2+ahzg==
X-Received: by 2002:a17:90a:be17:: with SMTP id a23mr4616028pjs.236.1607560965560;
        Wed, 09 Dec 2020 16:42:45 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id l23sm3690430pgm.22.2020.12.09.16.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 16:42:44 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Ramana <sramana@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-gpio@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Archana Sathyakumar <asathyak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] irqchip: qcom-pdc: Fix phantom irq when changing between rising/falling
Date:   Wed,  9 Dec 2020 16:41:01 -0800
Message-Id: <20201209163818.v3.1.I2702919afc253e2a451bebc3b701b462b2d22344@changeid>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We have a problem if we use gpio-keys and configure wakeups such that
we only want one edge to wake us up.  AKA:
  wakeup-event-action = <EV_ACT_DEASSERTED>;
  wakeup-source;

Specifically we end up with a phantom interrupt that blocks suspend if
the line was already high and we want wakeups on rising edges (AKA we
want the GPIO to go low and then high again before we wake up).  The
opposite is also problematic.

Specifically, here's what's happening today:
1. Normally, gpio-keys configures to look for both edges.  Due to the
   current workaround introduced in commit c3c0c2e18d94 ("pinctrl:
   qcom: Handle broken/missing PDC dual edge IRQs on sc7180"), if the
   line was high we'd configure for falling edges.
2. At suspend time, we change to look for rising edges.
3. After qcom_pdc_gic_set_type() runs, we get a phantom interrupt.

We can solve this by just clearing the phantom interrupt.

NOTE: it is possible that this could cause problems for a client with
very specific needs, but there's not much we can do with this
hardware.  As an example, let's say the interrupt signal is currently
high and the client is looking for falling edges.  The client now
changes to look for rising edges.  The client could possibly expect
that if the line has a short pulse low (and back high) that it would
always be detected.  Specifically no matter when the pulse happened,
it should either have tripped the (old) falling edge trigger or the
(new) rising edge trigger.  We will simply not trip it.  We could
narrow down the race a bit by polling our parent before changing
types, but no matter what we do there will still be a period of time
where we can't tell the difference between a real transition (or more
than one transition) and the phantom.

Fixes: f55c73aef890 ("irqchip/pdc: Add PDC interrupt controller for QCOM SoCs")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---
There are no dependencies between this patch and patch #2/#3.  It can
go in by itself.  Patches are only grouped together in one series
because they address similar issues.

Maulik has got confirmation from hardware guys and understands the
problem.  This patch is ready to land.

Changes in v3:
- Adjusted the comment as per Maulik.

Changes in v2:
- 0 => false
- If irq_chip_set_type_parent() fails don't bother clearing.
- Add Fixes tag.

 drivers/irqchip/qcom-pdc.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index bd39e9de6ecf..5dc63c20b67e 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -159,6 +159,8 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 {
 	int pin_out = d->hwirq;
 	enum pdc_irq_config_bits pdc_type;
+	enum pdc_irq_config_bits old_pdc_type;
+	int ret;
 
 	if (pin_out == GPIO_NO_WAKE_IRQ)
 		return 0;
@@ -187,9 +189,26 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
+	old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
 	pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
 
-	return irq_chip_set_type_parent(d, type);
+	ret = irq_chip_set_type_parent(d, type);
+	if (ret)
+		return ret;
+
+	/*
+	 * When we change types the PDC can give a phantom interrupt.
+	 * Clear it.  Specifically the phantom shows up when reconfiguring
+	 * polarity of interrupt without changing the state of the signal
+	 * but let's be consistent and clear it always.
+	 *
+	 * Doing this works because we have IRQCHIP_SET_TYPE_MASKED so the
+	 * interrupt will be cleared before the rest of the system sees it.
+	 */
+	if (old_pdc_type != pdc_type)
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, false);
+
+	return 0;
 }
 
 static struct irq_chip qcom_pdc_gic_chip = {
-- 
2.29.2.576.ga3fc446d84-goog

