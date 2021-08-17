Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC6C3EE188
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Aug 2021 02:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235967AbhHQAz7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Aug 2021 20:55:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235708AbhHQAzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Aug 2021 20:55:50 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B39BC06129E
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 17:55:17 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id h11so30061388ljo.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Aug 2021 17:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zHW7j8uJ1T5WAhTwDkkfCp9h9wlSajIJoR2TS5WeI4s=;
        b=M+8JmFaKoyF4Y6sGJg8MksjCPy8KWaLrMoFoU5H/2SMFu13wI0tZayH+k0nGh0OWbx
         wTjtWcx1quOS5cRy2xvqqRmYvddYA8HJupQ9OTKGLoouVYSG27ky3BLt2PwxHowLqHqm
         36/rnjAw3GBl9O5C3YC2voq/YPTNQYZSsBWDz+93sPFAwdRc3Ub6BWI/lAQgigJmjz5O
         lZA0GH8wqBHUmeBfgeAQklXJt62i1xchURucNna7ys6Ol6jpBNdTISUCqeJTXpGRtchh
         UIfEKvMaMukniWjwHDeeht0jC1S4nB//S1BBEpJHvLeUGnRbdwrhV5/D1PYI75b9IfA7
         xoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zHW7j8uJ1T5WAhTwDkkfCp9h9wlSajIJoR2TS5WeI4s=;
        b=dSswCg3Ud4dFfEjLAcgffYO9mVxWbRxiKCNM0qKxjqK55SJgTPOJAIUlYewKpcDLzZ
         jExkiFpxPgJ3TfLQxYhjimt8V77S2Wa2IMeB1oxrGqD7VU07SOZ5CGUf3EocNZcANriD
         jm2Yrfw0x1hg3+sp/1LGrWJ54wTlTSxyTQMPhVZ2/NNCSL3NbLwABbqky7ArKfYUKqsa
         Ssq8PlRIC8UlPJxCLIQBnu0mhaJ8frWNntxutvQcpCqmRS//sHzDnCFZo1Z+Xz4g2qxD
         jN23N4zWYAbSooIv/6GkEMN1YO4bXeRY0FyGhv+u9pZL8zWnowYZT7otw46dlwbFqPZf
         pByg==
X-Gm-Message-State: AOAM5333Fr8HqkjsHF4rlx6ifGTssYmzbloacwdPwbET3bMUo7p4qwhV
        IaXT6s3YN7z1K8lRCHZw8KtglQ==
X-Google-Smtp-Source: ABdhPJwzl+6gfIV47ZCHmVz5/wqhiY0aSpqI/1a5FDmoJTan/NZyyOCfBI9EfZad5k9e0Yjfqz8dWg==
X-Received: by 2002:a05:651c:902:: with SMTP id e2mr790319ljq.198.1629161715773;
        Mon, 16 Aug 2021 17:55:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z6sm40719lfb.251.2021.08.16.17.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 17:55:15 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Johan Hedberg <johan.hedberg@gmail.com>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Kalle Valo <kvalo@codeaurora.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [RFC PATCH 03/15] mmc: core: switch to new pwrseq subsystem
Date:   Tue, 17 Aug 2021 03:54:55 +0300
Message-Id: <20210817005507.1507580-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
References: <20210817005507.1507580-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Drop old MMC pwrseq code and use new pwrseq subsystem instead.
Individual drivers are already ported to new subsystem.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/mmc/core/Makefile |   1 -
 drivers/mmc/core/core.c   |   9 ++-
 drivers/mmc/core/host.c   |   8 ++-
 drivers/mmc/core/mmc.c    |   3 +-
 drivers/mmc/core/pwrseq.c | 117 --------------------------------------
 drivers/mmc/core/pwrseq.h |  58 -------------------
 include/linux/mmc/host.h  |   4 +-
 7 files changed, 12 insertions(+), 188 deletions(-)
 delete mode 100644 drivers/mmc/core/pwrseq.c
 delete mode 100644 drivers/mmc/core/pwrseq.h

diff --git a/drivers/mmc/core/Makefile b/drivers/mmc/core/Makefile
index 322eb69bd00e..a504d873cf8e 100644
--- a/drivers/mmc/core/Makefile
+++ b/drivers/mmc/core/Makefile
@@ -9,7 +9,6 @@ mmc_core-y			:= core.o bus.o host.o \
 				   sdio.o sdio_ops.o sdio_bus.o \
 				   sdio_cis.o sdio_io.o sdio_irq.o \
 				   slot-gpio.o regulator.o
-mmc_core-$(CONFIG_OF)		+= pwrseq.o
 mmc_core-$(CONFIG_DEBUG_FS)	+= debugfs.o
 obj-$(CONFIG_MMC_BLOCK)		+= mmc_block.o
 mmc_block-objs			:= block.o queue.o
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 95fedcf56e4a..c468af900a45 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -41,7 +41,6 @@
 #include "bus.h"
 #include "host.h"
 #include "sdio_bus.h"
-#include "pwrseq.h"
 
 #include "mmc_ops.h"
 #include "sd_ops.h"
@@ -1321,7 +1320,7 @@ void mmc_power_up(struct mmc_host *host, u32 ocr)
 	if (host->ios.power_mode == MMC_POWER_ON)
 		return;
 
-	mmc_pwrseq_pre_power_on(host);
+	pwrseq_pre_power_on(host->pwrseq);
 
 	host->ios.vdd = fls(ocr) - 1;
 	host->ios.power_mode = MMC_POWER_UP;
@@ -1336,7 +1335,7 @@ void mmc_power_up(struct mmc_host *host, u32 ocr)
 	 */
 	mmc_delay(host->ios.power_delay_ms);
 
-	mmc_pwrseq_post_power_on(host);
+	pwrseq_power_on(host->pwrseq);
 
 	host->ios.clock = host->f_init;
 
@@ -1355,7 +1354,7 @@ void mmc_power_off(struct mmc_host *host)
 	if (host->ios.power_mode == MMC_POWER_OFF)
 		return;
 
-	mmc_pwrseq_power_off(host);
+	pwrseq_power_off(host->pwrseq);
 
 	host->ios.clock = 0;
 	host->ios.vdd = 0;
@@ -1985,7 +1984,7 @@ EXPORT_SYMBOL(mmc_set_blocklen);
 
 static void mmc_hw_reset_for_init(struct mmc_host *host)
 {
-	mmc_pwrseq_reset(host);
+	pwrseq_reset(host->pwrseq);
 
 	if (!(host->caps & MMC_CAP_HW_RESET) || !host->ops->hw_reset)
 		return;
diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
index 0475d96047c4..214b9cfda723 100644
--- a/drivers/mmc/core/host.c
+++ b/drivers/mmc/core/host.c
@@ -28,7 +28,6 @@
 #include "crypto.h"
 #include "host.h"
 #include "slot-gpio.h"
-#include "pwrseq.h"
 #include "sdio_ops.h"
 
 #define cls_dev_to_mmc_host(d)	container_of(d, struct mmc_host, class_dev)
@@ -413,7 +412,11 @@ int mmc_of_parse(struct mmc_host *host)
 	device_property_read_u32(dev, "post-power-on-delay-ms",
 				 &host->ios.power_delay_ms);
 
-	return mmc_pwrseq_alloc(host);
+	host->pwrseq = devm_pwrseq_get_optional(dev, "mmc");
+	if (IS_ERR(host->pwrseq))
+		return PTR_ERR(host->pwrseq);
+
+	return 0;
 }
 
 EXPORT_SYMBOL(mmc_of_parse);
@@ -632,7 +635,6 @@ EXPORT_SYMBOL(mmc_remove_host);
  */
 void mmc_free_host(struct mmc_host *host)
 {
-	mmc_pwrseq_free(host);
 	put_device(&host->class_dev);
 }
 
diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
index 838726b68ff3..59d0d26bb5c0 100644
--- a/drivers/mmc/core/mmc.c
+++ b/drivers/mmc/core/mmc.c
@@ -24,7 +24,6 @@
 #include "mmc_ops.h"
 #include "quirks.h"
 #include "sd_ops.h"
-#include "pwrseq.h"
 
 #define DEFAULT_CMD6_TIMEOUT_MS	500
 #define MIN_CACHE_EN_TIMEOUT_MS 1600
@@ -2220,7 +2219,7 @@ static int _mmc_hw_reset(struct mmc_host *host)
 	} else {
 		/* Do a brute force power cycle */
 		mmc_power_cycle(host, card->ocr);
-		mmc_pwrseq_reset(host);
+		pwrseq_reset(host->pwrseq);
 	}
 	return mmc_init_card(host, card->ocr, card);
 }
diff --git a/drivers/mmc/core/pwrseq.c b/drivers/mmc/core/pwrseq.c
deleted file mode 100644
index ef675f364bf0..000000000000
--- a/drivers/mmc/core/pwrseq.c
+++ /dev/null
@@ -1,117 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- *  Copyright (C) 2014 Linaro Ltd
- *
- * Author: Ulf Hansson <ulf.hansson@linaro.org>
- *
- *  MMC power sequence management
- */
-#include <linux/kernel.h>
-#include <linux/err.h>
-#include <linux/module.h>
-#include <linux/of.h>
-
-#include <linux/mmc/host.h>
-
-#include "pwrseq.h"
-
-static DEFINE_MUTEX(pwrseq_list_mutex);
-static LIST_HEAD(pwrseq_list);
-
-int mmc_pwrseq_alloc(struct mmc_host *host)
-{
-	struct device_node *np;
-	struct mmc_pwrseq *p;
-
-	np = of_parse_phandle(host->parent->of_node, "mmc-pwrseq", 0);
-	if (!np)
-		return 0;
-
-	mutex_lock(&pwrseq_list_mutex);
-	list_for_each_entry(p, &pwrseq_list, pwrseq_node) {
-		if (p->dev->of_node == np) {
-			if (!try_module_get(p->owner))
-				dev_err(host->parent,
-					"increasing module refcount failed\n");
-			else
-				host->pwrseq = p;
-
-			break;
-		}
-	}
-
-	of_node_put(np);
-	mutex_unlock(&pwrseq_list_mutex);
-
-	if (!host->pwrseq)
-		return -EPROBE_DEFER;
-
-	dev_info(host->parent, "allocated mmc-pwrseq\n");
-
-	return 0;
-}
-
-void mmc_pwrseq_pre_power_on(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq && pwrseq->ops->pre_power_on)
-		pwrseq->ops->pre_power_on(host);
-}
-
-void mmc_pwrseq_post_power_on(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq && pwrseq->ops->post_power_on)
-		pwrseq->ops->post_power_on(host);
-}
-
-void mmc_pwrseq_power_off(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq && pwrseq->ops->power_off)
-		pwrseq->ops->power_off(host);
-}
-
-void mmc_pwrseq_reset(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq && pwrseq->ops->reset)
-		pwrseq->ops->reset(host);
-}
-
-void mmc_pwrseq_free(struct mmc_host *host)
-{
-	struct mmc_pwrseq *pwrseq = host->pwrseq;
-
-	if (pwrseq) {
-		module_put(pwrseq->owner);
-		host->pwrseq = NULL;
-	}
-}
-
-int mmc_pwrseq_register(struct mmc_pwrseq *pwrseq)
-{
-	if (!pwrseq || !pwrseq->ops || !pwrseq->dev)
-		return -EINVAL;
-
-	mutex_lock(&pwrseq_list_mutex);
-	list_add(&pwrseq->pwrseq_node, &pwrseq_list);
-	mutex_unlock(&pwrseq_list_mutex);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mmc_pwrseq_register);
-
-void mmc_pwrseq_unregister(struct mmc_pwrseq *pwrseq)
-{
-	if (pwrseq) {
-		mutex_lock(&pwrseq_list_mutex);
-		list_del(&pwrseq->pwrseq_node);
-		mutex_unlock(&pwrseq_list_mutex);
-	}
-}
-EXPORT_SYMBOL_GPL(mmc_pwrseq_unregister);
diff --git a/drivers/mmc/core/pwrseq.h b/drivers/mmc/core/pwrseq.h
deleted file mode 100644
index f3bb103db9ad..000000000000
--- a/drivers/mmc/core/pwrseq.h
+++ /dev/null
@@ -1,58 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (C) 2014 Linaro Ltd
- *
- * Author: Ulf Hansson <ulf.hansson@linaro.org>
- */
-#ifndef _MMC_CORE_PWRSEQ_H
-#define _MMC_CORE_PWRSEQ_H
-
-#include <linux/types.h>
-
-struct mmc_host;
-struct device;
-struct module;
-
-struct mmc_pwrseq_ops {
-	void (*pre_power_on)(struct mmc_host *host);
-	void (*post_power_on)(struct mmc_host *host);
-	void (*power_off)(struct mmc_host *host);
-	void (*reset)(struct mmc_host *host);
-};
-
-struct mmc_pwrseq {
-	const struct mmc_pwrseq_ops *ops;
-	struct device *dev;
-	struct list_head pwrseq_node;
-	struct module *owner;
-};
-
-#ifdef CONFIG_OF
-
-int mmc_pwrseq_register(struct mmc_pwrseq *pwrseq);
-void mmc_pwrseq_unregister(struct mmc_pwrseq *pwrseq);
-
-int mmc_pwrseq_alloc(struct mmc_host *host);
-void mmc_pwrseq_pre_power_on(struct mmc_host *host);
-void mmc_pwrseq_post_power_on(struct mmc_host *host);
-void mmc_pwrseq_power_off(struct mmc_host *host);
-void mmc_pwrseq_reset(struct mmc_host *host);
-void mmc_pwrseq_free(struct mmc_host *host);
-
-#else
-
-static inline int mmc_pwrseq_register(struct mmc_pwrseq *pwrseq)
-{
-	return -ENOSYS;
-}
-static inline void mmc_pwrseq_unregister(struct mmc_pwrseq *pwrseq) {}
-static inline int mmc_pwrseq_alloc(struct mmc_host *host) { return 0; }
-static inline void mmc_pwrseq_pre_power_on(struct mmc_host *host) {}
-static inline void mmc_pwrseq_post_power_on(struct mmc_host *host) {}
-static inline void mmc_pwrseq_power_off(struct mmc_host *host) {}
-static inline void mmc_pwrseq_reset(struct mmc_host *host) {}
-static inline void mmc_pwrseq_free(struct mmc_host *host) {}
-
-#endif
-
-#endif
diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
index 0abd47e9ef9b..1673e37f6028 100644
--- a/include/linux/mmc/host.h
+++ b/include/linux/mmc/host.h
@@ -16,6 +16,7 @@
 #include <linux/mmc/pm.h>
 #include <linux/dma-direction.h>
 #include <linux/keyslot-manager.h>
+#include <linux/pwrseq/consumer.h>
 
 struct mmc_ios {
 	unsigned int	clock;			/* clock rate */
@@ -278,7 +279,6 @@ struct mmc_context_info {
 };
 
 struct regulator;
-struct mmc_pwrseq;
 
 struct mmc_supply {
 	struct regulator *vmmc;		/* Card power supply */
@@ -294,7 +294,7 @@ struct mmc_host {
 	struct device		class_dev;
 	int			index;
 	const struct mmc_host_ops *ops;
-	struct mmc_pwrseq	*pwrseq;
+	struct pwrseq		*pwrseq;
 	unsigned int		f_min;
 	unsigned int		f_max;
 	unsigned int		f_init;
-- 
2.30.2

