Return-Path: <linux-arm-msm+bounces-61090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF3AD6BED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 11:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A1D03A63FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC18F2253EC;
	Thu, 12 Jun 2025 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xdvK4nuD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C15F224AF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719700; cv=none; b=YKjrgW75MYaG9oNwwULLmnn4tucRx++TPtdPdJup3YF1W3FWSJn0LXmuX6P4KrP4Q1Pn4KZzXiHJkue2MWIfvHffrLJ3ZdLlgjIKVwwD+xb2jgUc3tIFo9FKFG1uU6+KvMZaY5+a1tJPZ5suxQwjml7SXPDYhqUzyrQBnlxZHEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719700; c=relaxed/simple;
	bh=I8WC8VmyVZpOBN9ahF6WdBk7M+DI/Cl/vSHnInFjNoM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U5lHz8233bE95JbyZeNzpQpSwRyA1qhEVmC76bWwGJ0xk4KzygRtHtskzzPMzs1sI9CyAnjmBvBODj1Y42IW0p3P8oYyQKNd+3pXOIn6iyEal4odvbB8HsPTR9k/0BnFBHVZiURmfofM9o/7UVj33Vpo34e02QVxaorpLDbMM0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xdvK4nuD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d54214adso5563615e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Jun 2025 02:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749719697; x=1750324497; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjpbexB8EDGUAbjJEhoZpzc1eJdrhJw0+iAd+J3JqeU=;
        b=xdvK4nuDnWLLxKiBvp4lZV7pLRLNLsIR4Iy9zAkBSLVjdxaRHV6XHVmYmxVeIA/lPt
         mQonUxdpPQlNJy00hQ7wTSXy8nrTxakP1dW8K41kHUOMs6q88AMybfskNCwTA3yvqQ0o
         fOMCMR9Q3idoYXS1DycOWqMSq/EL/xlvQ0rYewMkIGusuWFbs5Msj4vHdv7VCjuHHd8t
         8AWpzZXsjM/uIMoPL9uymT+lFbFxzrkAF3QqJ4aYrnZAfbI+OowZNySJev4C20ZPmfiT
         uHSyIAFRlrBcn9cv5Egfr6R6MQRXoNJrk+B6QuWPUKu28E2c9MWcRQYjiaOgNaGQS2el
         lb7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719697; x=1750324497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjpbexB8EDGUAbjJEhoZpzc1eJdrhJw0+iAd+J3JqeU=;
        b=PgnXxbJyxeBEMVszE7s7UOT8+1zMnLA14cYYv8iln6bQcLsIOsZ1+pzb7AnKNohz08
         QXMTo6XBE3y28NOoU5sSBaZH+gkgjkwwac6nuGRKy6gzESbutfozaL9keEn946EHEk5k
         Djx0vLpW+MSyspFCbTJ+sTw2chPs922X/kwisoWKBNZA/kMd6tGZ1XnZ5FLHg1jgWIld
         OV+hkxD423MMPR4yUeNrocPr/dX/wmaQ18gwNUiSiOba5i+G5flrto5B+Cbbsgw4b5Q0
         CdrKrz9Y6v4olUef5wTyXBuwiKZMw3hkewyJTAglQnrGfsTNWeD5QX7AGmY9BiM84H3z
         8SOA==
X-Gm-Message-State: AOJu0YzmknPVRO0bMXxz/k4F/mrc88dpop+6EQRO6jfgeZky2AAtgWMU
	9tpHgbBiriYsQrTK5hG0KP3MlERWgHr3Ly9Vc+vs51vmt5keDDkGWXihelqi4Cf1UVQ=
X-Gm-Gg: ASbGncucZZ5ODw3vLIXPrQWczjrNeTJQ1T0t7v+uPwPNIgnMve1j38KNYUwvz4mYJHn
	z8jw0QkHoKMzH3ZsZhLb+tuy2dk/kwv2orwKM5wwCYl6QC8tRZczyQrJ/PIO5Mao68lVJdMqtGv
	wEBzdz63qEOzTAlHSGH5rGlLkZNY1OI4xVNiFLBljY5J4RMjEQFGBjB29FZKGB20OYSNk+Vt27S
	Sgc6/TxoRFs6/7n2a2QCs2ppO5PNW9itRwiBeeqoiNp766uPC4clHJq4JZTa1868bLn/oNMlnlG
	NAj0ruGg//ATngVo30IBraS5CU7gpk5IPshwvoMnsc+ABw/Q23PqAY6/0ihsfuc=
X-Google-Smtp-Source: AGHT+IEj7fJZOfU+EAHw6kzDkmORmQcdeioJZFJUMmFWmfkS5xsy0lkDbMfqprMQGHqbWZtbCMvaDw==
X-Received: by 2002:a05:600c:638f:b0:453:23fe:ca86 with SMTP id 5b1f17b1804b1-4532486b850mr62066355e9.4.1749719696749;
        Thu, 12 Jun 2025 02:14:56 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8b99:9926:3892:5310])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25ec9fsm13940585e9.34.2025.06.12.02.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:14:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2] pinctrl: qcom: msm: mark certain pins as invalid for interrupts
Date: Thu, 12 Jun 2025 11:14:48 +0200
Message-ID: <20250612091448.41546-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

On some platforms, the UFS-reset pin has no interrupt logic in TLMM but
is nevertheless registered as a GPIO in the kernel. This enables the
user-space to trigger a BUG() in the pinctrl-msm driver by running, for
example: `gpiomon -c 0 113` on RB2.

The exact culprit is requesting pins whose intr_detection_width setting
is not 1 or 2 for interrupts. This hits a BUG() in
msm_gpio_irq_set_type(). Potentially crashing the kernel due to an
invalid request from user-space is not optimal, so let's go through the
pins and mark those that would fail the check as invalid for the irq chip
as we should not even register them as available irqs.

This function can be extended if we determine that there are more
corner-cases like this.

Fixes: f365be092572 ("pinctrl: Add Qualcomm TLMM driver")
Cc: stable@vger.kernel.org
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Changes in v2:
- expand the commit message, describing the underlying code issue in
  detail
- added a newline for better readability

 drivers/pinctrl/qcom/pinctrl-msm.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f012ea88aa22c..1ff84e8c176d4 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1038,6 +1038,25 @@ static bool msm_gpio_needs_dual_edge_parent_workaround(struct irq_data *d,
 	       test_bit(d->hwirq, pctrl->skip_wake_irqs);
 }
 
+static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
+					 unsigned long *valid_mask,
+					 unsigned int ngpios)
+{
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct msm_pingroup *g;
+	int i;
+
+	bitmap_fill(valid_mask, ngpios);
+
+	for (i = 0; i < ngpios; i++) {
+		g = &pctrl->soc->groups[i];
+
+		if (g->intr_detection_width != 1 &&
+		    g->intr_detection_width != 2)
+			clear_bit(i, valid_mask);
+	}
+}
+
 static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -1441,6 +1460,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	girq->default_type = IRQ_TYPE_NONE;
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = pctrl->irq;
+	girq->init_valid_mask = msm_gpio_irq_init_valid_mask;
 
 	ret = gpiochip_add_data(&pctrl->chip, pctrl);
 	if (ret) {
-- 
2.48.1


