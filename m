Return-Path: <linux-arm-msm+bounces-9077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C46F842C95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 20:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E18A1C243CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jan 2024 19:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8618F69D36;
	Tue, 30 Jan 2024 19:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lICQHIZi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0DF71B25
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 19:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706642595; cv=none; b=ovveMbuVt19OcxiTfRarXyn155/ZZ6C0AxoHF+vr3qrK3chUgrsiQicAFDca7866E65yIrMhvrkguDrdnWhXYW0jWD4EAGOafAoloJ8+ao+EbRKr0erl927W4w17yN3rIl8vLUz7CFEwlM4fz4/zxE08v3jp+YFldpunUMVhXnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706642595; c=relaxed/simple;
	bh=nBJpHsdQ/PLwncdh5oQiwPfYan8A1R4ddZJ4gykm4nY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HKdyDi0GAHvwrDpNwCtMV71DAMN50dO6v3M0LxzV/e3MrpHCBCpzV8oMT8X5lMwRLiYZAVf3Ht1DVAwc5RYDgomrn7Ck5Sx7OeXQy5Jrus6d/84EYOVDK6aEUFpomOdWtsdKI/YcIa8fDfyFUjFMTpNQJle9JTC4SuwanEaOQvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lICQHIZi; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-36383448c6eso5303525ab.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jan 2024 11:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706642593; x=1707247393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hjwvzGl2HlTyZtAJD2vY621i90e6UJd/mQdml33OvUM=;
        b=lICQHIZig3+fSeVboMCLkQwXquMjbxqyApMtAyhC6EYIahyqAssOxc3l5Xh82+Y/7h
         viNq9c9F/R9D3wxo+pKIjoxlTwT5/UmsMwf2gBpe7GSHx0Er4TOI+ki5vdxHKAbBJfAk
         0x9oNPWSBln5AUQ7ealW42kVP2UWMtdtcAZqX2M4NAnAjbeIcrIZST+KFWLcIJ3imB1k
         VW0QgfCks1l5Dm1n8uo41OHJ0XbiyJUw+38Fwsqy4ul4Ya2q42fVvZ3FCdv4Qn+pioLJ
         FMbS8A9Kd1Wk0kU3BmssK1rVSL9atWPSILEmS0e/RzJtqCgfwVpvZTgf5ww4Tll8ka+M
         Wl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706642593; x=1707247393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hjwvzGl2HlTyZtAJD2vY621i90e6UJd/mQdml33OvUM=;
        b=QeDsXerLEWizb5RRhZLXa1Lhnm849BC03VVL3n1dB4x3B4W/dAHHr8MH3pLAHyEpcg
         /UqK+zX+inPuWtBO2YnPOhDGVbHGvUI/Wlq1e+D2XAt+5Rnba8mPVgPosX3DH0iL7JjI
         3O8aeWLaqjYbVl6P8c5RXdMyqYc6cVj3H+x1WtW03yY+8vkxw3cJ7C3Cn7IdYFoLnGbE
         rLwZr5bEE19M5c6PQejbHnGcbr1avDAUi9lSv7jkrIh8Qe/14bljvGPcSDbeV7G3Fist
         9cz7ZFQuLyW3WGc4jU0/b/V3FLi9g3pKOFuTRdh34ueS8oBWRJ16OwyVKUBeJ3dk4Ym0
         xmhA==
X-Gm-Message-State: AOJu0Yw0/CZ+RrXv6/3T4lhXehaJuXVGkHhiFwuGFItT7uhf+iii27YH
	AKngeC/5m6jY8iDznHFvVog484VAAFdaYOxQGYMn/gHJDtQJF+jExsSm7wljKkU=
X-Google-Smtp-Source: AGHT+IEEX08JSTKu1bQZHUgKqSTuLLdfpg9wF1yF0CU6s0PUBv8oh0/fdbjHbtKISFkFj5XV4vrJmg==
X-Received: by 2002:a05:6e02:1c26:b0:363:851d:3ba9 with SMTP id m6-20020a056e021c2600b00363851d3ba9mr5433418ilh.7.1706642592895;
        Tue, 30 Jan 2024 11:23:12 -0800 (PST)
Received: from localhost.localdomain (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.gmail.com with ESMTPSA id t18-20020a92c912000000b003637871ec98sm2157762ilp.27.2024.01.30.11.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 11:23:12 -0800 (PST)
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
Subject: [PATCH net-next 4/7] net: ipa: kill the IPA power STOPPED flag
Date: Tue, 30 Jan 2024 13:23:01 -0600
Message-Id: <20240130192305.250915-5-elder@linaro.org>
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

Currently the STOPPED IPA power flag is used to indicate that the
transmit queue has been stopped.  Previously this was used to avoid
setting the STARTED flag unless the queue had already been stopped.
It meant transmit queuing would be enabled on resume if it was
stopped by the transmit path--and if so, it ensured it only got
enabled once.

We only stop the transmit queue in the transmit path.  The STARTED
flag has been removed, and it causes no real harm to enable
transmits when they're already enabled.  So we can get rid of
the STOPPED flag and call netif_wake_queue() unconditionally.

This makes the IPA power spinlock unnecessary, so it can be removed
as well.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/net/ipa/ipa_power.c | 40 +++++--------------------------------
 1 file changed, 5 insertions(+), 35 deletions(-)

diff --git a/drivers/net/ipa/ipa_power.c b/drivers/net/ipa/ipa_power.c
index 509c9bfa648e7..e615473d23805 100644
--- a/drivers/net/ipa/ipa_power.c
+++ b/drivers/net/ipa/ipa_power.c
@@ -38,13 +38,11 @@
  * enum ipa_power_flag - IPA power flags
  * @IPA_POWER_FLAG_RESUMED:	Whether resume from suspend has been signaled
  * @IPA_POWER_FLAG_SYSTEM:	Hardware is system (not runtime) suspended
- * @IPA_POWER_FLAG_STOPPED:	Modem TX is disabled by ipa_start_xmit()
  * @IPA_POWER_FLAG_COUNT:	Number of defined power flags
  */
 enum ipa_power_flag {
 	IPA_POWER_FLAG_RESUMED,
 	IPA_POWER_FLAG_SYSTEM,
-	IPA_POWER_FLAG_STOPPED,
 	IPA_POWER_FLAG_COUNT,		/* Last; not a flag */
 };
 
@@ -53,7 +51,6 @@ enum ipa_power_flag {
  * @dev:		IPA device pointer
  * @core:		IPA core clock
  * @qmp:		QMP handle for AOSS communication
- * @spinlock:		Protects modem TX queue enable/disable
  * @flags:		Boolean state flags
  * @interconnect_count:	Number of elements in interconnect[]
  * @interconnect:	Interconnect array
@@ -62,7 +59,6 @@ struct ipa_power {
 	struct device *dev;
 	struct clk *core;
 	struct qmp *qmp;
-	spinlock_t spinlock;	/* used with STOPPED power flag */
 	DECLARE_BITMAP(flags, IPA_POWER_FLAG_COUNT);
 	u32 interconnect_count;
 	struct icc_bulk_data interconnect[] __counted_by(interconnect_count);
@@ -240,47 +236,22 @@ void ipa_power_suspend_handler(struct ipa *ipa, enum ipa_irq_id irq_id)
  * gets sent (or dropped).  If power is not ACTIVE, it will eventually
  * be, and transmits stay disabled until after it is.
  *
- * A flag and a spinlock are used when managing this.  If the queue gets
- * stopped, the STOPPED power flag is set.
- *
  * The first function stops the modem netdev transmit queue.  The second
- * function starts the transmit queue, but only if the STOPPED flag is
- * set.  This avoids enabling transmits repeatedly immediately after
- * power has become ACTIVE (not really a big deal).  If the STOPPED flag
- * was set, it is cleared by this function.
- *
- * The third function just enables transmits again.
+ * function starts the transmit queue and is used in the power resume
+ * path after power has become ACTIVE.  The third function also enables
+ * transmits again, and is used by ipa_start_xmit() once it knows power
+ * is active.
  */
 void ipa_power_modem_queue_stop(struct ipa *ipa)
 {
-	struct ipa_power *power = ipa->power;
-	unsigned long flags;
-
-	spin_lock_irqsave(&power->spinlock, flags);
-
 	netif_stop_queue(ipa->modem_netdev);
-	__set_bit(IPA_POWER_FLAG_STOPPED, power->flags);
-
-	spin_unlock_irqrestore(&power->spinlock, flags);
 }
 
-/* This function starts the modem netdev transmit queue, but only if the
- * STOPPED flag is set.  That flag is cleared if it was set.
- */
 void ipa_power_modem_queue_wake(struct ipa *ipa)
 {
-	struct ipa_power *power = ipa->power;
-	unsigned long flags;
-
-	spin_lock_irqsave(&power->spinlock, flags);
-
-	if (__test_and_clear_bit(IPA_POWER_FLAG_STOPPED, power->flags))
-		netif_wake_queue(ipa->modem_netdev);
-
-	spin_unlock_irqrestore(&power->spinlock, flags);
+	netif_wake_queue(ipa->modem_netdev);
 }
 
-/* This function enables transmits again after power has become ACTIVE. */
 void ipa_power_modem_queue_active(struct ipa *ipa)
 {
 	netif_wake_queue(ipa->modem_netdev);
@@ -374,7 +345,6 @@ ipa_power_init(struct device *dev, const struct ipa_power_data *data)
 	}
 	power->dev = dev;
 	power->core = clk;
-	spin_lock_init(&power->spinlock);
 	power->interconnect_count = data->interconnect_count;
 
 	ret = ipa_interconnect_init(power, data->interconnect_data);
-- 
2.40.1


