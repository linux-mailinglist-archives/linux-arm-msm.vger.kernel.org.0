Return-Path: <linux-arm-msm+bounces-9078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B7E842C98
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A7AFB224C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B519E762F6;
	Tue, 30 Jan 2024 19:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3cq155t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36FF71B50
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706642596; cv=none; b=Dyp47Couj1YPIdVTjbkIR7HUJN++3qNNT5KnTABpNoOdVGwjrymjneqs4L4ajIb4UVx7RhCY2epkuKE4N3QUbbsHJpe1LA81r0Xpdv144ZfIJQ4AxXXAQVcWKFpKXTIA5H9nz0CF739ji/1pql2UTeVcwbfTmvq0AQ9qN2dOOEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706642596; c=relaxed/simple;
	bh=jBO1cJLAzJvxydUlAaWg5DMbUYAHb2xvJeVHkg5712o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HXljD1WPeeek+47/6tOeRxgC3iNqFZDrxIvmjvLO9ahKMgCzQplb1LAqYnQReGDv++l4xiG83KmP9yPoQKS/3EknZLHKBywh0jbcaqwpK4E9FRQlBUIc1hpyFTDj1ewfVMVN2YVyLblL+QGZ7dAG4rfVah0maXtTmNbRny3SQuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3cq155t; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3638e3ace68so3415725ab.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:23:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706642594; x=1707247394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOhxvtNzhkLmYjC1tnizOtWKQi1p2qd3Rj843Voiz6E=;
        b=E3cq155tGSp9HDJ4BhL+90QiqMfSGYpisq3g0id/AUpYfV1wsNWvEFHb2gMQ6QGGD/
         QVnTRuAlVnvauJ3OW9RTxwIWCew2idoLcVd4zLhW5S7kn4I6cN0Csjes/PZLXYqEOi6/
         rtCiHIF94MiA/Not3W+saLFvMckQepncBr+1rjUp/G45yMEDMy9FrSbEQ0lIYxdbxrPF
         CVGphRGS1LW+KKN3I4YeenvdZMUV9JUux10KKwShFku/D9WmfveqOD6n4seEhXzwm+df
         YE7sr3Qi2fH8oWTZdXVG5XeIikFxy0AOrkNfxPbFJUgBjf1/coV/shCVS41Qa7aczWZF
         4hhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706642594; x=1707247394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gOhxvtNzhkLmYjC1tnizOtWKQi1p2qd3Rj843Voiz6E=;
        b=ZiLa62Ix+XqM8IF8TILzG1vfNSHdnso3sV4Ulkblr+Eekj3Eza0/dJ/jZPVF03dSxz
         NWWJcnP3kFGmPERcJ9VFpT69EWsSMQjYm5WXcSxaMN9le04Ck0tnLVeN3/8xVu2eAI4H
         XzEjqZ1Tz4PHsKi+1TJZLz0IOAh0cxDMfL+jo0yb1ZQe2FPgWuw/VRBhRhtjoeNRvwgh
         NZKPlH7NzGCYf4kRgV8n3RwfZ49YqH7ayOw04o94A3OjM+7O8DJwW9sYRkJlzA9yDJ2a
         cVTzLY8IwF6XfUu7UAR6/djV1cv1U8QuRK+jpvUQkHbLNuA4SyFCpbm/hZTnoO85XCdQ
         BQ2g==
X-Gm-Message-State: AOJu0Yxo3o00OXl7NViYfti3RKZtVdB2wtJG49FpE6Egi2L6PTWKK9kZ
	B4TpQJM9586I6flvPXkkuWTNM8kbjaef9YD3SxIOdCeU0/GYXxTwlbMMXcXQtjo=
X-Google-Smtp-Source: AGHT+IFLEQJ0CbPE//J6M61ZPnMP8knVS5QrP9l2/1ejcnf+kamfDvPrxUNK02FIKmDuP7TOTr3MjA==
X-Received: by 2002:a05:6e02:1c03:b0:363:8727:ddd1 with SMTP id l3-20020a056e021c0300b003638727ddd1mr5281023ilh.13.1706642593982;
        Tue, 30 Jan 2024 11:23:13 -0800 (PST)
Received: from localhost.localdomain (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id t18-20020a92c912000000b003637871ec98sm2157762ilp.27.2024.01.30.11.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:23:13 -0800 (PST)
From: Alex Elder <elder@linaro.org>
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: mka@chromium.org,
	andersson@kernel.org,
	quic_cpratapa@quicinc.com,
	quic_avuyyuru@quicinc.com,
	quic_jponduru@quicinc.com,
	quic_subashab@quicinc.com,
	elder@kernel.org,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 5/7] net: ipa: kill ipa_power_modem_queue_stop()
Date: Tue, 30 Jan 2024 13:23:02 -0600
Message-Id: <20240130192305.250915-6-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240130192305.250915-1-elder@linaro.org>
References: <20240130192305.250915-1-elder@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All ipa_power_modem_queue_stop() does now is call netif_stop_queue().
Just call netif_stop_queue() in the one place it's needed, and get
rid of ipa_power_modem_queue_stop().

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_modem.c |  2 +-
 drivers/net/ipa/ipa_power.c | 16 +++++-----------
 drivers/net/ipa/ipa_power.h |  6 ------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ipa/ipa_modem.c b/drivers/net/ipa/ipa_modem.c
index c7a0b167c4326..08e1202f12863 100644
--- a/drivers/net/ipa/ipa_modem.c
+++ b/drivers/net/ipa/ipa_modem.c
@@ -156,7 +156,7 @@ ipa_start_xmit(struct sk_buff *skb, struct net_device *netdev)
 	 * we restart queueing before transmitting the SKB.  Otherwise
 	 * queueing will eventually be enabled after resume completes.
 	 */
-	ipa_power_modem_queue_stop(ipa);
+	netif_stop_queue(netdev);
 
 	dev = &ipa->pdev->dev;
 	ret = pm_runtime_get(dev);
diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index e615473d23805..812359c7977da 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -227,7 +227,7 @@ void ipa_power_suspend_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
 	ipa_interrupt_suspend_clear_all(ipa->interrupt);
 }
 
-/* The next few functions are used when stopping and starting the modem
+/* The next two functions are used when stopping and starting the modem
  * network device transmit queue.
  *
  * Transmit can run concurrent with power resume.  When transmitting,
@@ -236,17 +236,11 @@ void ipa_power_suspend_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
  * gets sent (or dropped).  If power is not ACTIVE, it will eventually
  * be, and transmits stay disabled until after it is.
  *
- * The first function stops the modem netdev transmit queue.  The second
- * function starts the transmit queue and is used in the power resume
- * path after power has become ACTIVE.  The third function also enables
- * transmits again, and is used by ipa_start_xmit() once it knows power
- * is active.
+ * The first function starts the transmit queue and is used in the power
+ * resume path after power has become ACTIVE.  The second function also
+ * enables transmits again, and is used by ipa_start_xmit() once it
+ * knows power is active.
  */
-void ipa_power_modem_queue_stop(struct ipa *ipa)
-{
-	netif_stop_queue(ipa->modem_netdev);
-}
-
 void ipa_power_modem_queue_wake(struct ipa *ipa)
 {
 	netif_wake_queue(ipa->modem_netdev);
diff --git a/drivers/net/ipa/ipa_power.h b/drivers/net/ipa/ipa_power.h
index 3a4c59ea1222b..f51653399a07d 100644
--- a/drivers/net/ipa/ipa_power.h
+++ b/drivers/net/ipa/ipa_power.h
@@ -23,12 +23,6 @@ extern const struct dev_pm_ops ipa_pm_ops;
  */
 u32 ipa_core_clock_rate(struct ipa *ipa);
 
-/**
- * ipa_power_modem_queue_stop() - Possibly stop the modem netdev TX queue
- * @ipa:	IPA pointer
- */
-void ipa_power_modem_queue_stop(struct ipa *ipa);
-
 /**
  * ipa_power_modem_queue_wake() - Possibly wake the modem netdev TX queue
  * @ipa:	IPA pointer
-- 
2.40.1


