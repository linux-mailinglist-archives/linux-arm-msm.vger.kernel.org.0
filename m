Return-Path: <linux-arm-msm+bounces-51162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E484FA5DDCA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 14:19:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24B971628D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 13:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6AA23F38F;
	Wed, 12 Mar 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvEuz8kA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0331EB18C
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741785587; cv=none; b=GIIVvkFvpvoyDmznmC9xiLZzgGKuy2AS6usJE1rL2MHI9y7QEwcoahUVOE6DjOMVH+M7puXFdhMUF46Eh/+3KsFPhXhyv7GxqYbTZHbKdJGklvUaiPXKsPF4vFKjSY6qsjQx1a+yBXQUxJwwBQTEg6kpaSrLMoSyaEA7eLq2z6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741785587; c=relaxed/simple;
	bh=bOvM3Rb1c7XkWvdeF62rAy/ws7BeWUWiDQbJ7997piQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EMsqRCJYFo6wtp7ueP4JI/LvoRH5shln6TWMyhJTp+ASXbHUw6N2I2bsn94/dWNXxJPJfIKpNftrg6RuDso8iMOw5AffRKu9/kSDp8c8+UP9yFQG4yDRGUlEXBBRzfpQyDvkvJRfgqVMANoOiwt6n2bGXbKdErWtRkC+C5hONsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvEuz8kA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso7017368a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Mar 2025 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741785584; x=1742390384; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TwOPRwvTyGZCimlRP4ylKx/o2Mk7nBeIZKavoovqttg=;
        b=CvEuz8kASDgLAhMlcNIZMcz83jTRpDqAAzgyoZtyngJe7Pew3c1NrRJ6Lz75WJacq/
         kwwabH2gSE0p3CbmR+zTwkLKdLDdcc8DXb/dLJ3dCCV7w4gvm8welOy8vIKsGANsJabH
         M1xSXX1xXHeq8+iP/SbUhGg4pK97xTd7wbzfFi8UIp8l7nRXnYI8ghUf7TYVIzGTpSwM
         TSBws/Xk2AM4d+/LTUJU6wl1c07y2NEnEVyhujFuXH9dRPqRI9eiiYLb4lTN7Z5JDpLW
         8tR86DSunSOjagMRgyMp9k8bWLE+MhVDeYCDhihbqaWoKbTe8H17ig4A+a8iXUv3t7Mi
         g/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741785584; x=1742390384;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TwOPRwvTyGZCimlRP4ylKx/o2Mk7nBeIZKavoovqttg=;
        b=Bfb1ggIzEhv/BI00Lp6grFBGxTJ2J+WK9zR42BbIYEaxp+pV+nygEy+D07p7yHImtG
         at0gUYqKiBFogppUKBADmp+ohaSZY/YCzLofwCxJaEkDsgW6XG7De8Egrvm/J5zRGi1s
         WCzbPcwXhkVGDTuVuv0J5oIXh/7CEGR8/nKDYtmjvlnmBRhrcYj/HqKD0zSk3DZUnVl0
         zPVoVT5PbV3Iz+JUiSRbmZeVPx2I6K+cIq/C8XqCZOIk9QI0OPGPreh2Yca2FUUalVdL
         aBYhKgQtAhYrAs1wLaWm1lh6KoMOjxEDYW1SPm1JvCAsgnk67ws0k4cbpi7Gojcn+pom
         9+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCXO3UlLAq6X9T4IP+1oNup5eUGuqn7uXEDWzz5cdJ0Fcqh4cAeaRLJaXbnvs5feaVJh304Jj7VrK4oWFVAQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyoXpERmIeptpEZX7/Np/grBulrb7zB/R24DGzbWLIVeivf21xo
	l77TbCIBgFrbfNkMrLZa/vWDDpoVN+3IvR1sPeH0VT83ZLih1Lxf856WRnPhA6k=
X-Gm-Gg: ASbGnctl2EfQxtM0of39Vic71HjXa+nG4itWWlsLEr+Yxn9BWyBoVKOPVKZwl54STrf
	lUIqX5C9y7n9R+V1/6cQdFM6N8Qpj/kyUT4rV4jI3BJAUDusNWlhoo17YvFCJGKV4Gu1IAyLXWf
	fo7qItanT7cZGEDTq/Z9F57eOZRIBdyPT0j2gxsadTzI0D1HNleHwhthSZJthA5XZA8XrhbhzFX
	ry52zVtZuRyyc4uWKh/IjQra6tbaxt47vH1dTAWe0+T6URoS/o7pLoHfxBc9xrFVNwWQFsKjY0Y
	lk0SU/dCw4AOugrTiJ4QuFYvWkre49IdjjQs5mSIHjSujqQeZzN8qIhFuko=
X-Google-Smtp-Source: AGHT+IFzsh4BD3ATv/xGrDU3lT987ULOwDI2KQNLC/6p9B+kW/K648uP7PICWdPatgLjkwI5X/NRIw==
X-Received: by 2002:a17:907:9490:b0:ab7:9df1:e562 with SMTP id a640c23a62f3a-ac252fe7196mr2436981766b.48.1741785583831;
        Wed, 12 Mar 2025 06:19:43 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:f2c4:b081:2e8a:cec5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2773e8641sm735182466b.165.2025.03.12.06.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 06:19:43 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Wed, 12 Mar 2025 14:19:27 +0100
Subject: [PATCH] pinctrl: qcom: Clear latched interrupt status when
 changing IRQ type
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-pinctrl-msm-type-latch-v1-1-ce87c561d3d7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAN6J0WcC/x3MQQqAIBBA0avErBtQo8KuEi1EpxooE5UoorsnL
 d/i/wcSRaYEQ/VApJMTH75A1hXY1fiFkF0xKKFa0UiJgb3NccM97ZjvQLiZbFfshNaGHPVOKyh
 xiDTz9Y/H6X0/npgpj2gAAAA=
X-Change-ID: 20250311-pinctrl-msm-type-latch-6099aede7d92
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Maulik Shah <quic_mkshah@quicinc.com>, Stephen Boyd <swboyd@chromium.org>, 
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2

When submitting the TLMM test driver, Bjorn reported that some of the test
cases are failing for GPIOs that not are backed by PDC (i.e. "non-wakeup"
GPIOs that are handled directly in pinctrl-msm). Basically, lingering
latched interrupt state is still being delivered at IRQ request time, e.g.:

  ok 1 tlmm_test_silent_rising
  tlmm_test_silent_falling: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178
  Expected atomic_read(&priv->intr_count) == 0, but
      atomic_read(&priv->intr_count) == 1 (0x1)
  not ok 2 tlmm_test_silent_falling
  tlmm_test_silent_low: ASSERTION FAILED at drivers/pinctrl/qcom/tlmm-test.c:178
  Expected atomic_read(&priv->intr_count) == 0, but
      atomic_read(&priv->intr_count) == 1 (0x1)
  not ok 3 tlmm_test_silent_low
  ok 4 tlmm_test_silent_high

Whether to report interrupts that came in while the IRQ was unclaimed
doesn't seem to be well-defined in the Linux IRQ API. However, looking
closer at these specific cases, we're actually reporting events that do not
match the interrupt type requested by the driver:

 1. After "ok 1 tlmm_test_silent_rising", the GPIO is in low state and
    configured for IRQF_TRIGGER_RISING.

 2. (a) In preparation for "tlmm_test_silent_falling", the GPIO is switched
        to high state. The rising interrupt gets latched.
    (b) The GPIO is re-configured for IRQF_TRIGGER_FALLING, but the latched
        interrupt isn't cleared.
    (c) The IRQ handler is called for the latched interrupt, but there
        wasn't any falling edge.

 3. (a) For "tlmm_test_silent_low", the GPIO remains in high state.
    (b) The GPIO is re-configured for IRQF_TRIGGER_LOW. This seems to
        result in a phantom interrupt that gets latched.
    (c) The IRQ handler is called for the latched interrupt, but the GPIO
        isn't in low state.

 4. (a) For "tlmm_test_silent_high", the GPIO is switched to low state.
    (b) This doesn't result in a latched interrupt, because RAW_STATUS_EN
        was cleared when masking the level-triggered interrupt.

Fix this by clearing the interrupt state whenever making any changes to the
interrupt configuration. This includes previously disabled interrupts, but
also any changes to interrupt polarity or detection type.

With this change, all 16 test cases are now passing for the non-wakeup
GPIOs in the TLMM.

Cc: stable@vger.kernel.org
Fixes: cf9d052aa600 ("pinctrl: qcom: Don't clear pending interrupts when enabling")
Reported-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Closes: https://lore.kernel.org/r/20250227-tlmm-test-v1-1-d18877b4a5db@oss.qualcomm.com/
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 47daa47153c970190b0d469dc8d245b3cbeace5e..82f0cc43bbf4f4d24f078af2d0a515d3a03b961a 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1045,8 +1045,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	const struct msm_pingroup *g;
 	u32 intr_target_mask = GENMASK(2, 0);
 	unsigned long flags;
-	bool was_enabled;
-	u32 val;
+	u32 val, oldval;
 
 	if (msm_gpio_needs_dual_edge_parent_workaround(d, type)) {
 		set_bit(d->hwirq, pctrl->dual_edge_irqs);
@@ -1108,8 +1107,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	 * internal circuitry of TLMM, toggling the RAW_STATUS
 	 * could cause the INTR_STATUS to be set for EDGE interrupts.
 	 */
-	val = msm_readl_intr_cfg(pctrl, g);
-	was_enabled = val & BIT(g->intr_raw_status_bit);
+	val = oldval = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
 	if (g->intr_detection_width == 2) {
 		val &= ~(3 << g->intr_detection_bit);
@@ -1162,9 +1160,11 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	/*
 	 * The first time we set RAW_STATUS_EN it could trigger an interrupt.
 	 * Clear the interrupt.  This is safe because we have
-	 * IRQCHIP_SET_TYPE_MASKED.
+	 * IRQCHIP_SET_TYPE_MASKED. When changing the interrupt type, we could
+	 * also still have a non-matching interrupt latched, so clear whenever
+	 * making changes to the interrupt configuration.
 	 */
-	if (!was_enabled)
+	if (val != oldval)
 		msm_ack_intr_status(pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))

---
base-commit: e058c5f49ceff38bf1579a679a5ca20842718579
change-id: 20250311-pinctrl-msm-type-latch-6099aede7d92

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>


