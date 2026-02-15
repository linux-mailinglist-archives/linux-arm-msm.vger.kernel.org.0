Return-Path: <linux-arm-msm+bounces-92877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8AqiMNtOkmlvswEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 23:55:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6809F13FF1B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 23:55:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5CF763004C1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Feb 2026 22:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC38B30BBBC;
	Sun, 15 Feb 2026 22:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N0wgZhmO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7DF30BB9E
	for <linux-arm-msm@vger.kernel.org>; Sun, 15 Feb 2026 22:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771196121; cv=none; b=CZgFz9x3sRpEnvNb6zBbe8xX3tPQ+kjSFgyDMW6eTZxRlIi5BaE+aYrn7O+ii2k9SaLehZIzqmKOfDEKBg70Ex0ubEGSKvLNW0vHNJPyziB2jAFdvaiH0AMUYQ/fFcnjbW9OYebKinBUZS/BZJcSMYGzxyIzKrDCezA1XPdYxAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771196121; c=relaxed/simple;
	bh=9Ocg3jq1rBVcFXg3EEoW7RleW9cSPA0dvHAGBYBfgfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L1vDEWT4falNECrgvmIKzw8tnp+OWwT+HvxLp3aqtlSsUEE01Y2vYY+xfCUdIwXM2KaOql+bMxt8lUzuCu6sdP+/tsn9zQqH+dCeRGam47sUsZNO0oyoHjFFJIqqq8OuJ7WgUfISVw4nFRUXMC66SyDVn2+Bwaj7aI7hTde81PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N0wgZhmO; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bwdQ2TfNm0AqCHbct36CNSsYA2zZVoG3ZIXiKj6F9PM=; b=N0wgZh
	mOJqk8DIfyDC7r2BSjtcJCxL8fkw8ejRXqiXXmqU/Z0OE2MmoDDpTj7Uofj3M5sl
	XyNamFFFErH6a5i+gclLE8THanQEXNSaoEQPpa1xCIVbH4QMLD4yo/+BF0iNVEG5
	rZOqfr+v/B6Su8drF/9B7noHPU2SNJkfXqJzIWTetHlY+NZu+W803yulG/HXHJiF
	tJ2CMQ3QamAjJ/cymXydvMRMlAykt7kRYX6Sb/yOIb1m0se5nB9prw1PAPae3ai4
	9oRWTbLW0v3Z9aHARcHoqVJIwmUdfNDsP87viZwYNoxvDmykQ1m15tei26qpWzv3
	MuN/QwY8I1TkjzcA==
Received: (qmail 3011330 invoked from network); 15 Feb 2026 23:55:05 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:05 +0100
X-UD-Smtp-Session: l3s3148p1@nvu0uuRKaIQujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev
Subject: [RFC PATCH v2 01/13] hwspinlock: add helpers to retrieve core data
Date: Sun, 15 Feb 2026 23:54:41 +0100
Message-ID: <20260215225501.6365-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92877-lists,linux-arm-msm=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,lists.infradead.org,sang-engineering.com,kernel.org,linux.alibaba.com,gmail.com,foss.st.com,posteo.net,sholland.org,vger.kernel.org,st-md-mailman.stormreply.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:mid,sang-engineering.com:dkim,sang-engineering.com:email]
X-Rspamd-Queue-Id: 6809F13FF1B
X-Rspamd-Action: no action

This is a first step to hide internal core structs from hwspinlock
providers. It adds helper functions to retrieve the data needed by them.
Because all users are only within the hwspinlock subsystem and the
change there is trivial, conversion is included in this patch as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/hwspinlock_core.c  | 12 ++++++++++++
 drivers/hwspinlock/omap_hwspinlock.c  |  4 ++--
 drivers/hwspinlock/qcom_hwspinlock.c  | 11 ++++++-----
 drivers/hwspinlock/sprd_hwspinlock.c  |  6 +++---
 drivers/hwspinlock/stm32_hwspinlock.c |  4 ++--
 drivers/hwspinlock/sun6i_hwspinlock.c |  4 ++--
 include/linux/hwspinlock.h            |  2 ++
 7 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
index cc8e952a6772..2c9eceba7fe8 100644
--- a/drivers/hwspinlock/hwspinlock_core.c
+++ b/drivers/hwspinlock/hwspinlock_core.c
@@ -888,5 +888,17 @@ struct hwspinlock *devm_hwspin_lock_request_specific(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_hwspin_lock_request_specific);
 
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock)
+{
+	return hwlock->priv;
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_get_priv);
+
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock)
+{
+	return hwlock->bank->dev;
+}
+EXPORT_SYMBOL_GPL(hwspin_lock_get_dev);
+
 MODULE_DESCRIPTION("Hardware spinlock interface");
 MODULE_AUTHOR("Ohad Ben-Cohen <ohad@wizery.com>");
diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 1832e0c3af6b..5bf0061d3fd6 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -37,7 +37,7 @@
 
 static int omap_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	/* attempt to acquire the lock by reading its value */
 	return (SPINLOCK_NOTTAKEN == readl(lock_addr));
@@ -45,7 +45,7 @@ static int omap_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void omap_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	/* release the lock by writing 0 to it */
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
diff --git a/drivers/hwspinlock/qcom_hwspinlock.c b/drivers/hwspinlock/qcom_hwspinlock.c
index 0390979fd765..7ff89c3e8c6b 100644
--- a/drivers/hwspinlock/qcom_hwspinlock.c
+++ b/drivers/hwspinlock/qcom_hwspinlock.c
@@ -27,7 +27,7 @@ struct qcom_hwspinlock_of_data {
 
 static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
 	u32 lock_owner;
 	int ret;
 
@@ -44,7 +44,7 @@ static int qcom_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
 	u32 lock_owner;
 	int ret;
 
@@ -66,13 +66,14 @@ static void qcom_hwspinlock_unlock(struct hwspinlock *lock)
 
 static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 {
-	struct regmap_field *field = lock->priv;
+	struct regmap_field *field = hwspin_lock_get_priv(lock);
+	struct device *dev = hwspin_lock_get_dev(lock);
 	u32 owner;
 	int ret;
 
 	ret = regmap_field_read(field, &owner);
 	if (ret) {
-		dev_err(lock->bank->dev, "unable to query spinlock owner\n");
+		dev_err(dev, "unable to query spinlock owner\n");
 		return ret;
 	}
 
@@ -81,7 +82,7 @@ static int qcom_hwspinlock_bust(struct hwspinlock *lock, unsigned int id)
 
 	ret = regmap_field_write(field, 0);
 	if (ret) {
-		dev_err(lock->bank->dev, "failed to bust spinlock\n");
+		dev_err(dev, "failed to bust spinlock\n");
 		return ret;
 	}
 
diff --git a/drivers/hwspinlock/sprd_hwspinlock.c b/drivers/hwspinlock/sprd_hwspinlock.c
index 22e2ffb91743..0d08efbdfb07 100644
--- a/drivers/hwspinlock/sprd_hwspinlock.c
+++ b/drivers/hwspinlock/sprd_hwspinlock.c
@@ -40,8 +40,8 @@ struct sprd_hwspinlock_dev {
 static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 {
 	struct sprd_hwspinlock_dev *sprd_hwlock =
-		dev_get_drvdata(lock->bank->dev);
-	void __iomem *addr = lock->priv;
+		dev_get_drvdata(hwspin_lock_get_dev(lock));
+	void __iomem *addr = hwspin_lock_get_priv(lock);
 	int user_id, lock_id;
 
 	if (!readl(addr))
@@ -59,7 +59,7 @@ static int sprd_hwspinlock_trylock(struct hwspinlock *lock)
 /* unlock the hardware spinlock */
 static void sprd_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(HWSPINLOCK_NOTTAKEN, lock_addr);
 }
diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index bb5c7e5f7a80..1d75dc03f4ad 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -27,7 +27,7 @@ struct stm32_hwspinlock {
 
 static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 	u32 status;
 
 	writel(STM32_MUTEX_LOCK_BIT | STM32_MUTEX_COREID, lock_addr);
@@ -38,7 +38,7 @@ static int stm32_hwspinlock_trylock(struct hwspinlock *lock)
 
 static void stm32_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(STM32_MUTEX_COREID, lock_addr);
 }
diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index c2d314588046..8ff81cb5880a 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -62,14 +62,14 @@ static void sun6i_hwspinlock_debugfs_init(struct sun6i_hwspinlock_data *priv)
 
 static int sun6i_hwspinlock_trylock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	return (readl(lock_addr) == SPINLOCK_NOTTAKEN);
 }
 
 static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 {
-	void __iomem *lock_addr = lock->priv;
+	void __iomem *lock_addr = hwspin_lock_get_priv(lock);
 
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
diff --git a/include/linux/hwspinlock.h b/include/linux/hwspinlock.h
index 74b91244fe0e..dffa1dff7289 100644
--- a/include/linux/hwspinlock.h
+++ b/include/linux/hwspinlock.h
@@ -27,6 +27,8 @@ struct hwspinlock_ops;
 
 #ifdef CONFIG_HWSPINLOCK
 
+void *hwspin_lock_get_priv(struct hwspinlock *hwlock);
+struct device *hwspin_lock_get_dev(struct hwspinlock *hwlock);
 int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
 		const struct hwspinlock_ops *ops, int base_id, int num_locks);
 int hwspin_lock_unregister(struct hwspinlock_device *bank);
-- 
2.51.0


