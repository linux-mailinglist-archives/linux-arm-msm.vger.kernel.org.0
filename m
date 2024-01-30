Return-Path: <linux-arm-msm+bounces-9076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83000842C93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:24:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A890D1C24B4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:24:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CF871B56;
	Tue, 30 Jan 2024 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x/wj4MW6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B1669D36
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706642595; cv=none; b=BCJ5D7sZC9kuuZH7CbfUhMc7y7BoTw9fAxIrnJjCLFp5jX8rIEYcGqwL8SzUY1BeOyPe9TuL9gzlcNo53gGTpotgbChDETY1zbwhuefpoqKmEka8qJyxjOHSu19VHj4/QKt2GAhK+0HuAGfy1wJYjv/Z9ylTVJ6dCrRLg8TRgLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706642595; c=relaxed/simple;
	bh=+TnzQfnLit0kpSjAguftgCxyhTjNa9IGaEhYrQvVloA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Mn+8ZP/f/vecRgMZBfjWWHJPRZjD6pAe3bLF/wfBukAfQRewvjK5FjPPhIxJ3ILjdLVCCNE1iUBaIeBt7YnZNmRn3uRDw8LzqC0nUukUaVN/EGg4c52CtGqPDM0u2EYi4LYFzVcf63lBx3BhNmEgQ6pSokKWwLe0y/oGQIM7ob0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x/wj4MW6; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-363903480c1so2486155ab.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:23:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706642592; x=1707247392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRMkk2KHFWeOmMb+2gZlOcKHN2kce40ZjY+dNp3h38Y=;
        b=x/wj4MW6DlY8ceXbKfBp/vt4Amf6nK+TVemlKnZ+WnqgzNcXWfvhi+7XP3xX9bGkTq
         rHvVK75ona8Aw2kG9ps9QYxMz8Z/KOyNlwz62onDItIDOfl3l8Di7nDO01KaLtoYqTA6
         7c6tpKEtJ+JHN+IRpofK8bZf2yH8V3xsWGVIJ3/95vEgTs4Eo95wWngyr+Bw5nmHf0p4
         mUOd2MEdPXrkdQeWNelcQiq5DGGC4Fpi2DgLNy5i3Va8ZaDlzchWS+L9TB7OmdyxyDhN
         m7AcPNxKM3PBbj/5eYkcy97ppldj3MB/RqQv+Arp2ZmydFyPbyLEwbYeNeZ+dFx2vdLB
         E/6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706642592; x=1707247392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRMkk2KHFWeOmMb+2gZlOcKHN2kce40ZjY+dNp3h38Y=;
        b=Jqu2R+bMl4tL+2MFQxNiYW3FSGN92Eq/dHhLUzmbDbNaBKzYpiAz5c53P3raSkFLX3
         vW/nkC4ETNFuoT+CL343puIyGOGH/in7758eDFBKXx60p2sZ1r2bZtkkb10dkYeCAIpe
         /a3KvJfDOTazW9PK7cv+2lVNEZLVYATfw/mbGt4hppluT8f1viANkMjtfiXfgWbbLS0w
         wmD23WTvUzSfJRkwAUoCytVLLqV2vKANVSa6RWPSfGwiOMradDvdAWX6iaSQdA9cOzOB
         4ejWyWVkGZtWggNOsWLnYDr06fb7lupTqchn9jKuAp1XdXUV8JrHO2UQPTUFm0tlmWV+
         L1GQ==
X-Gm-Message-State: AOJu0YzytF61cFCxHzXXu2Pnp8iyx+tWNC3fn3TmFJrX7ZxPopqooNxO
	6oe+xMxdb81n+IGPc5Vjmp58gDqzckJfCsoTHy9iIi6NI0jpqkEm2mnP0faT08U=
X-Google-Smtp-Source: AGHT+IFBCPhWifq/hB72NH7fMlf1IbxU0SNJ2rl6hg87kUWODVt1tKwFzOs63eRcZ384nMGuRTzgpA==
X-Received: by 2002:a05:6e02:1d15:b0:362:8bdf:45cc with SMTP id i21-20020a056e021d1500b003628bdf45ccmr10985092ila.17.1706642591823;
        Tue, 30 Jan 2024 11:23:11 -0800 (PST)
Received: from localhost.localdomain (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id t18-20020a92c912000000b003637871ec98sm2157762ilp.27.2024.01.30.11.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:23:11 -0800 (PST)
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
Subject: [PATCH net-next 3/7] net: ipa: kill the STARTED IPA power flag
Date: Tue, 30 Jan 2024 13:23:00 -0600
Message-Id: <20240130192305.250915-4-elder@linaro.org>
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

A transmit on the modem netdev can only complete if the IPA hardware
is powered.  Currently, if a transmit request arrives when the
hardware was not powered, further transmits are be stopped to allow
power-up to complete.  Once power-up completes, transmits are once
again enabled.

Runtime resume can complete at the same time a transmit request is
being handled, and previously there was a race between stopping and
restarting transmits.  The STARTED flag was used to ensure the
stop request in the transmit path was skipped if the start request
in the runtime resume path had already occurred.

Now, the queue is *always* stopped in the transmit path, *before*
determining whether power is ACTIVE.  If power is found to already
be active (or if the socket buffer is gets dropped), transmit is
re-enabled.  Otherwise it will (always) be enabled after runtime
resume completes.

The race between transmit and runtime resume no longer exists, so
there is no longer any need to maintain the STARTED flag.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 47 +++++++++++--------------------------
 1 file changed, 14 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index f1802448ff447..509c9bfa648e7 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -39,14 +39,12 @@
  * @IPA_POWER_FLAG_RESUMED:	Whether resume from suspend has been signaled
  * @IPA_POWER_FLAG_SYSTEM:	Hardware is system (not runtime) suspended
  * @IPA_POWER_FLAG_STOPPED:	Modem TX is disabled by ipa_start_xmit()
- * @IPA_POWER_FLAG_STARTED:	Modem TX was enabled by ipa_runtime_resume()
  * @IPA_POWER_FLAG_COUNT:	Number of defined power flags
  */
 enum ipa_power_flag {
 	IPA_POWER_FLAG_RESUMED,
 	IPA_POWER_FLAG_SYSTEM,
 	IPA_POWER_FLAG_STOPPED,
-	IPA_POWER_FLAG_STARTED,
 	IPA_POWER_FLAG_COUNT,		/* Last; not a flag */
 };
 
@@ -64,7 +62,7 @@ struct ipa_power {
 	struct device *dev;
 	struct clk *core;
 	struct qmp *qmp;
-	spinlock_t spinlock;	/* used with STOPPED/STARTED power flags */
+	spinlock_t spinlock;	/* used with STOPPED power flag */
 	DECLARE_BITMAP(flags, IPA_POWER_FLAG_COUNT);
 	u32 interconnect_count;
 	struct icc_bulk_data interconnect[] __counted_by(interconnect_count);
@@ -242,23 +240,16 @@ void ipa_power_suspend_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
  * gets sent (or dropped).  If power is not ACTIVE, it will eventually
  * be, and transmits stay disabled until after it is.
  *
- * Two flags and a spinlock are used when managing this.  If the queue
- * is stopped, the STOPPED power flag is set.  And if the queue is
- * started, the STARTED flag is set.
+ * A flag and a spinlock are used when managing this.  If the queue gets
+ * stopped, the STOPPED power flag is set.
  *
- * The first function stops the modem netdev transmit queue, but only if
- * the STARTED flag is *not* set.  This previously avoided a race where
- * the TX path stops further transmits after power has become ACTIVE.
- * The STARTED flag is cleared by this function.
+ * The first function stops the modem netdev transmit queue.  The second
+ * function starts the transmit queue, but only if the STOPPED flag is
+ * set.  This avoids enabling transmits repeatedly immediately after
+ * power has become ACTIVE (not really a big deal).  If the STOPPED flag
+ * was set, it is cleared by this function.
  *
- * The second function starts the transmit queue, but only if the
- * STOPPED flag is set.  This avoids enabling transmits repeatedly
- * immediately after power has become ACTIVE (not really a big deal).
- * If the STOPPED flag was set, it is cleared and the STARTED flag
- * is set by this function.
- *
- * The third function enables transmits again and clears the STARTED
- * flag in case it was set, to return it to initial state.
+ * The third function just enables transmits again.
  */
 void ipa_power_modem_queue_stop(struct ipa *ipa)
 {
@@ -267,18 +258,14 @@ void ipa_power_modem_queue_stop(struct ipa *ipa)
 
 	spin_lock_irqsave(&power->spinlock, flags);
 
-	if (!__test_and_clear_bit(IPA_POWER_FLAG_STARTED, power->flags)) {
-		netif_stop_queue(ipa->modem_netdev);
-		__set_bit(IPA_POWER_FLAG_STOPPED, power->flags);
-	}
+	netif_stop_queue(ipa->modem_netdev);
+	__set_bit(IPA_POWER_FLAG_STOPPED, power->flags);
 
 	spin_unlock_irqrestore(&power->spinlock, flags);
 }
 
 /* This function starts the modem netdev transmit queue, but only if the
- * STOPPED flag is set.  That flag is cleared if it was set.  If the queue
- * was restarted, the STARTED flag is set; this allows ipa_start_xmit()
- * to skip stopping the queue in the event of a race.
+ * STOPPED flag is set.  That flag is cleared if it was set.
  */
 void ipa_power_modem_queue_wake(struct ipa *ipa)
 {
@@ -287,22 +274,16 @@ void ipa_power_modem_queue_wake(struct ipa *ipa)
 
 	spin_lock_irqsave(&power->spinlock, flags);
 
-	if (__test_and_clear_bit(IPA_POWER_FLAG_STOPPED, power->flags)) {
-		__set_bit(IPA_POWER_FLAG_STARTED, power->flags);
+	if (__test_and_clear_bit(IPA_POWER_FLAG_STOPPED, power->flags))
 		netif_wake_queue(ipa->modem_netdev);
-	}
 
 	spin_unlock_irqrestore(&power->spinlock, flags);
 }
 
-/* This function is run after power has become ACTIVE.  It enables transmits
- * again clears the STARTED flag to indicate the TX queue is operating and
- * can be stopped again if necessary.
- */
+/* This function enables transmits again after power has become ACTIVE. */
 void ipa_power_modem_queue_active(struct ipa *ipa)
 {
 	netif_wake_queue(ipa->modem_netdev);
-	clear_bit(IPA_POWER_FLAG_STARTED, ipa->power->flags);
 }
 
 static int ipa_power_retention_init(struct ipa_power *power)
-- 
2.40.1


