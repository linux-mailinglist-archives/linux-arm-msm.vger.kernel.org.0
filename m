Return-Path: <linux-arm-msm+bounces-98717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGqpE2nYu2lgpAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:05:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E33172CA000
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:05:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1279323BEDA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011C33C870C;
	Thu, 19 Mar 2026 11:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="fK4f3dKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8173C65E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773918020; cv=none; b=bsp45YhFDUowNOCMYi4sdTMSuosvfa1kBQJZZKEDKhcRvjV+6y/xv8SIud/A++ra1ljTaeTGPCCJydWjLhF6KRr1wFbUw04y6RnVd+G5C9ZkPqJDgrO13USAe58cWoMO/GtA66rp4saKtyO9IH9Xo7mhpLBx46xNfoIs+KNifcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773918020; c=relaxed/simple;
	bh=j7JsogHPEG2k3FleveztzMhcaRMl7IeOoIUkHDuMsIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=itMzdTqtMvDttH33k0caKy/MdnXG6+bNa/UNwYWH7yNDwj4qyMowJMLTCT0cHc6/TAS8dUJMZr+vmkJ8dVHMpuGHKtQDVIg+bHroiJ5K1EKP+kmxZ+gT4wYfk0f0Toxj82i8OGBFA3Sz9Ok9/bBq+RSiD0oC3bAZPBPKsKQhd2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=fK4f3dKO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=52UHmgmukdvJVk0o+2tbQ5APoShQb1Fkmq5YJKeK1WA=; b=fK4f3d
	KOg8BCLXt8Vc1fZQxpxxQyp8tNVbAaLDZZBUSxvEK/pcXPJWX2vg8KXv+bWD+6Yb
	iD9aNQIv8GYJ/GAyFVAdtTwoXx1IO4Ik6NkG7x+OIZtaNttx9BO5pSDJJk44pglF
	eP4BkNZUWO9P/31iatpp8upWpSnISRmVkinum8MBMCwz9SGxF7Jkh4vlcYocGexh
	/fXQiCZIyV81S4ka9tPsFz/PbIFToBV4H0kElmLe7yG8J9IsEMJj3Mq/qFfrVGq3
	r9ZgpYbUTNj2DPzhBc0uuVBkvU4MYA7ouUw8k63Gf6sSvHgSiVVSYhf0+3fxpQJY
	irPjsnr9yuObc6mg==
Received: (qmail 1099536 invoked from network); 19 Mar 2026 11:59:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 11:59:56 +0100
X-UD-Smtp-Session: l3s3148p1@byoIeF5N5t0gAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 04/15] hwspinlock: add callback to fill private data of a hwspinlock
Date: Thu, 19 Mar 2026 11:59:26 +0100
Message-ID: <20260319105947.6237-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98717-lists,linux-arm-msm=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,sang-engineering.com,kernel.org,linux.alibaba.com,infradead.org,redhat.com,lwn.net,linuxfoundation.org,gmail.com,foss.st.com,posteo.net,sholland.org,st-md-mailman.stormreply.com,lists.infradead.org,lists.linux.dev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:email,sang-engineering.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E33172CA000
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

To hide internal core structures from providers, a callback is added to
the ops which allows to set the 'priv' field of a hwspinlock. It is
called when a hwspinlock device is registered and, thus, iterated over
all locks. The register-functions are also extended to pass a data
pointer to this callback, so it can do necessary calculations for the
priv field of each hwspinlock. Providers are added only an empty
placeholder and are converted separately because these changes need
dedicated reviews.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/locking/hwspinlock.rst     |  3 ++-
 drivers/hwspinlock/hwspinlock_core.c     | 19 +++++++++++++++----
 drivers/hwspinlock/hwspinlock_internal.h | 19 +++++++++++--------
 drivers/hwspinlock/omap_hwspinlock.c     |  2 +-
 drivers/hwspinlock/qcom_hwspinlock.c     |  2 +-
 drivers/hwspinlock/sprd_hwspinlock.c     |  2 +-
 drivers/hwspinlock/stm32_hwspinlock.c    |  2 +-
 drivers/hwspinlock/sun6i_hwspinlock.c    |  2 +-
 include/linux/hwspinlock.h               |  4 ++--
 9 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/Documentation/locking/hwspinlock.rst b/Documentation/locking/hwspinlock.rst
index a737c702a7d1..cedeeab7387c 100644
--- a/Documentation/locking/hwspinlock.rst
+++ b/Documentation/locking/hwspinlock.rst
@@ -351,7 +351,8 @@ API for implementors
 ::
 
   int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks);
+			   const struct hwspinlock_ops *ops, int base_id,
+			   int num_locks, void *init_data);
 
 To be called from the underlying platform-specific implementation, in
 order to register a new hwspinlock device (which is usually a bank of
diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index 2c9eceba7fe8..afe1e7ce2829 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -507,6 +507,7 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
+ * @init_data: additional data passed on to the init_priv callback
  *
  * This function should be called from the underlying platform-specific
  * implementation, to register a new hwspinlock device instance.
@@ -516,10 +517,11 @@ static struct hwspinlock *hwspin_lock_unregister_single(unsigned int id)
  * Returns: %0 on success, or an appropriate error code on failure
  */
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks)
+		const struct hwspinlock_ops *ops, int base_id, int num_locks,
+		void *init_data)
 {
 	struct hwspinlock *hwlock;
-	int ret = 0, i;
+	int ret, i;
 
 	if (!bank || !ops || !dev || !num_locks || !ops->trylock ||
 							!ops->unlock) {
@@ -538,6 +540,14 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		spin_lock_init(&hwlock->lock);
 		hwlock->bank = bank;
 
+		if (ops->init_priv) {
+			hwlock->priv = ops->init_priv(i, init_data);
+			if (IS_ERR(hwlock->priv)) {
+				ret = PTR_ERR(hwlock->priv);
+				goto reg_failed;
+			}
+		}
+
 		ret = hwspin_lock_register_single(hwlock, base_id + i);
 		if (ret)
 			goto reg_failed;
@@ -633,6 +643,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
  * @ops: hwspinlock handlers for this device
  * @base_id: id of the first hardware spinlock in this bank
  * @num_locks: number of hwspinlocks provided by this device
+ * @init_data: additional data passed on to the init_priv callback
  *
  * This function should be called from the underlying platform-specific
  * implementation, to register a new hwspinlock device instance.
@@ -644,7 +655,7 @@ EXPORT_SYMBOL_GPL(devm_hwspin_lock_unregister);
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
 			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks)
+			      int base_id, int num_locks, void *init_data)
 {
 	struct hwspinlock_device **ptr;
 	int ret;
@@ -653,7 +664,7 @@ int devm_hwspin_lock_register(struct device *dev,
 	if (!ptr)
 		return -ENOMEM;
 
-	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks);
+	ret = hwspin_lock_register(bank, dev, ops, base_id, num_locks, init_data);
 	if (!ret) {
 		*ptr = bank;
 		devres_add(dev, ptr);
diff --git a/drivers/hwspinlock/hwspinlock_internal.h b/drivers/hwspinlock/hwspinlock_internal.h
index f298fc0ee5ad..3c835d96bf86 100644
--- a/drivers/hwspinlock/hwspinlock_internal.h
+++ b/drivers/hwspinlock/hwspinlock_internal.h
@@ -18,20 +18,23 @@ struct hwspinlock_device;
 /**
  * struct hwspinlock_ops - platform-specific hwspinlock handlers
  *
- * @trylock: make a single attempt to take the lock. returns 0 on
- *	     failure and true on success. may _not_ sleep.
- * @unlock:  release the lock. always succeed. may _not_ sleep.
- * @bust:    optional, platform-specific bust handler, called by hwspinlock
- *	     core to bust a specific lock.
- * @relax:   optional, platform-specific relax handler, called by hwspinlock
- *	     core while spinning on a lock, between two successive
- *	     invocations of @trylock. may _not_ sleep.
+ * @trylock:	make a single attempt to take the lock. returns 0 on
+ *		failure and true on success. may _not_ sleep.
+ * @unlock:	release the lock. always succeed. may _not_ sleep.
+ * @bust:	optional, platform-specific bust handler, called by hwspinlock
+ *		core to bust a specific lock.
+ * @relax:	optional, platform-specific relax handler, called by hwspinlock
+ *		core while spinning on a lock, between two successive
+ *		invocations of @trylock. may _not_ sleep.
+ * @init_priv:	optional, callback used when registering the hwspinlock device.
+ *		Its return value will be used to fill the per-lock 'priv' data.
  */
 struct hwspinlock_ops {
 	int (*trylock)(struct hwspinlock *lock);
 	void (*unlock)(struct hwspinlock *lock);
 	int (*bust)(struct hwspinlock *lock, unsigned int id);
 	void (*relax)(struct hwspinlock *lock);
+	void *(*init_priv)(int local_id, void *init_data);
 };
 
 /**
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 5bf0061d3fd6..adff502bcbc4 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -120,7 +120,7 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 		bank->lock[i].priv = io_base + LOCK_BASE_OFFSET + sizeof(u32) * i;
 
 	return devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
-						base_id, num_locks);
+						base_id, num_locks, NULL);
 }
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 7ff89c3e8c6b..7960a4972eab 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -236,7 +236,7 @@ static int qcom_hwspinlock_probe(struct platform_device *pdev)
 	}
 
 	return devm_hwspin_lock_register(&pdev->dev, bank, &qcom_hwspinlock_ops,
-					 0, QCOM_MUTEX_NUM_LOCKS);
+					 0, QCOM_MUTEX_NUM_LOCKS, NULL);
 }
 
 static struct platform_driver qcom_hwspinlock_driver = {
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 0d08efbdfb07..0b91bdd4303d 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -132,7 +132,7 @@ static int sprd_hwspinlock_probe(struct platform_device *pdev)
 
 	return devm_hwspin_lock_register(&pdev->dev, &sprd_hwlock->bank,
 					 &sprd_hwspinlock_ops, 0,
-					 SPRD_HWLOCKS_NUM);
+					 SPRD_HWLOCKS_NUM, NULL);
 }
 
 static const struct of_device_id sprd_hwspinlock_of_match[] = {
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 1d75dc03f4ad..51e8e533ac31 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -110,7 +110,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
 
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS);
+					0, STM32_MUTEX_NUM_LOCKS, NULL);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index 8ff81cb5880a..a0c76bba3f05 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -180,7 +180,7 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
-					 SPINLOCK_BASE_ID, priv->nlocks);
+					 SPINLOCK_BASE_ID, priv->nlocks, NULL);
 
 bank_fail:
 	clk_disable_unprepare(priv->ahb_clk);
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index dffa1dff7289..094a6d0d39d6 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -30,7 +30,7 @@ struct hwspinlock_ops;
 void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
 struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
-		const struct hwspinlock_ops *ops, int base_id, int num_locks);
+		const struct hwspinlock_ops *ops, int base_id, int num_locks, void *init_data);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
 struct hwspinlock *hwspin_lock_request_specific(unsigned int id);
 int hwspin_lock_free(struct hwspinlock *hwlock);
@@ -49,7 +49,7 @@ int devm_hwspin_lock_unregister(struct device *dev,
 int devm_hwspin_lock_register(struct device *dev,
 			      struct hwspinlock_device *bank,
 			      const struct hwspinlock_ops *ops,
-			      int base_id, int num_locks);
+			      int base_id, int num_locks, void *init_data);
 
 #else /* !CONFIG_HWSPINLOCK */
 
-- 
2.51.0


