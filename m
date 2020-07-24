Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A4B322CCD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jul 2020 20:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726870AbgGXSLw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jul 2020 14:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726852AbgGXSLs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jul 2020 14:11:48 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CDFAC0619E4
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 11:11:48 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id i4so10679370iov.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2020 11:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y8vezh7BUopKDF4hXv1DWffjIS4u/fWXYcaALmGxxJE=;
        b=wa0tyMeK3KA/xA3Pg7GjZYf4MeiVixzLiTzHF05NDfvYIGlZUFft06trCUHmSoISKL
         DJv8n6H3r75zkkPZiJrHk4+KQy9ZsfE4UDdv8l3dDWCS3jFQwOBG7SlCiIrQWH6pII+g
         G+KKllpdHWhtBf3YhnJImunPzd6jF6rUwkyybP7bGkZTOWrLRguXGvHjUY7pNBs0Q9HB
         p4wfqkMItxvROkh8Zc0yqtcO7i2l8WZqKWfpaJeqm/xJna6kwcLwtp27Nos/2KqqOidP
         2rUobefN2tg68k4nkdVKJCfLGKbOXT+tTvq5aoXNesUWpefLsgxMJBPupbY1cPi9LM63
         TtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y8vezh7BUopKDF4hXv1DWffjIS4u/fWXYcaALmGxxJE=;
        b=RhvpV9701irqtdZ3Z+1ZQgK8bsFiKnXc8NayTj4uKQIZWo6kFhc4Yyv1QqRo9+FTis
         SYa31LkjVGGw+5Bk9S2217UCzaW5BMzjZmkk2UVhGOV0ctRiRTc7p0ytV6RlFs3K1bkq
         7kzm/F2HAsDadWeQ5qUtrKx0+BUbXYFrR8UtiF03pfyjxTajSc+PMPUtOW79IgNmQnkv
         zAe0Hw4tv0q46JW/VNmAUJrKgzyh0MJUMeYbumonAIRkunPqJ95r9zXEvBIfKnvPusNk
         yAMM+f8UsgqoTjKryXbHiUCT9YgnedGKNW8UFz7iO35hPS7Vlq7Q6FQeyhmXlbg9Lgbv
         Z8mw==
X-Gm-Message-State: AOAM5304eGrJx3SahGtOX+3YpHYKPYpFluuRl77fkklXoOlb0q4UCMUx
        jOr8RE55mxDKSWYkt2AR9efgug==
X-Google-Smtp-Source: ABdhPJxuBX7qsgiFAOIpkArChBqThR9aDCPlhh3X1fejEMkB3GWz/AXcTINh75OUWRKDT87OcCFFLA==
X-Received: by 2002:a6b:c3cf:: with SMTP id t198mr11508861iof.164.1595614307963;
        Fri, 24 Jul 2020 11:11:47 -0700 (PDT)
Received: from beast.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id b13sm2407802iod.40.2020.07.24.11.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 11:11:47 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     agross@kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] remoteproc: kill IPA notify code
Date:   Fri, 24 Jul 2020 13:11:42 -0500
Message-Id: <20200724181142.13581-3-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200724181142.13581-1-elder@linaro.org>
References: <20200724181142.13581-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The IPA code now uses the generic remoteproc SSR notification
mechanism.  This makes the original IPA notification code unused
and unnecessary, so get rid of it.

This is effectively a revert of commit d7f5f3c89c1a ("remoteproc:
add IPA notification to q6v5 driver").

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/Kconfig                    |  4 -
 drivers/remoteproc/Makefile                   |  1 -
 drivers/remoteproc/qcom_q6v5_ipa_notify.c     | 85 -------------------
 drivers/remoteproc/qcom_q6v5_mss.c            | 38 ---------
 .../linux/remoteproc/qcom_q6v5_ipa_notify.h   | 82 ------------------
 5 files changed, 210 deletions(-)
 delete mode 100644 drivers/remoteproc/qcom_q6v5_ipa_notify.c
 delete mode 100644 include/linux/remoteproc/qcom_q6v5_ipa_notify.h

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index 3e8d5d1a2b9ee..45f1f1e728823 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -154,7 +154,6 @@ config QCOM_Q6V5_MSS
 	select QCOM_MDT_LOADER
 	select QCOM_PIL_INFO
 	select QCOM_Q6V5_COMMON
-	select QCOM_Q6V5_IPA_NOTIFY
 	select QCOM_RPROC_COMMON
 	select QCOM_SCM
 	help
@@ -196,9 +195,6 @@ config QCOM_Q6V5_WCSS
 	  Say y here to support the Qualcomm Peripheral Image Loader for the
 	  Hexagon V5 based WCSS remote processors.
 
-config QCOM_Q6V5_IPA_NOTIFY
-	tristate
-
 config QCOM_SYSMON
 	tristate "Qualcomm sysmon driver"
 	depends on RPMSG
diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
index a4c1397d63673..8c056920b4006 100644
--- a/drivers/remoteproc/Makefile
+++ b/drivers/remoteproc/Makefile
@@ -24,7 +24,6 @@ obj-$(CONFIG_QCOM_Q6V5_ADSP)		+= qcom_q6v5_adsp.o
 obj-$(CONFIG_QCOM_Q6V5_MSS)		+= qcom_q6v5_mss.o
 obj-$(CONFIG_QCOM_Q6V5_PAS)		+= qcom_q6v5_pas.o
 obj-$(CONFIG_QCOM_Q6V5_WCSS)		+= qcom_q6v5_wcss.o
-obj-$(CONFIG_QCOM_Q6V5_IPA_NOTIFY)	+= qcom_q6v5_ipa_notify.o
 obj-$(CONFIG_QCOM_SYSMON)		+= qcom_sysmon.o
 obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
 qcom_wcnss_pil-y			+= qcom_wcnss.o
diff --git a/drivers/remoteproc/qcom_q6v5_ipa_notify.c b/drivers/remoteproc/qcom_q6v5_ipa_notify.c
deleted file mode 100644
index e1c10a128bfdb..0000000000000
--- a/drivers/remoteproc/qcom_q6v5_ipa_notify.c
+++ /dev/null
@@ -1,85 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-/*
- * Qualcomm IPA notification subdev support
- *
- * Copyright (C) 2019 Linaro Ltd.
- */
-
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/remoteproc.h>
-#include <linux/remoteproc/qcom_q6v5_ipa_notify.h>
-
-static void
-ipa_notify_common(struct rproc_subdev *subdev, enum qcom_rproc_event event)
-{
-	struct qcom_rproc_ipa_notify *ipa_notify;
-	qcom_ipa_notify_t notify;
-
-	ipa_notify = container_of(subdev, struct qcom_rproc_ipa_notify, subdev);
-	notify = ipa_notify->notify;
-	if (notify)
-		notify(ipa_notify->data, event);
-}
-
-static int ipa_notify_prepare(struct rproc_subdev *subdev)
-{
-	ipa_notify_common(subdev, MODEM_STARTING);
-
-	return 0;
-}
-
-static int ipa_notify_start(struct rproc_subdev *subdev)
-{
-	ipa_notify_common(subdev, MODEM_RUNNING);
-
-	return 0;
-}
-
-static void ipa_notify_stop(struct rproc_subdev *subdev, bool crashed)
-
-{
-	ipa_notify_common(subdev, crashed ? MODEM_CRASHED : MODEM_STOPPING);
-}
-
-static void ipa_notify_unprepare(struct rproc_subdev *subdev)
-{
-	ipa_notify_common(subdev, MODEM_OFFLINE);
-}
-
-static void ipa_notify_removing(struct rproc_subdev *subdev)
-{
-	ipa_notify_common(subdev, MODEM_REMOVING);
-}
-
-/* Register the IPA notification subdevice with the Q6V5 MSS remoteproc */
-void qcom_add_ipa_notify_subdev(struct rproc *rproc,
-		struct qcom_rproc_ipa_notify *ipa_notify)
-{
-	ipa_notify->notify = NULL;
-	ipa_notify->data = NULL;
-	ipa_notify->subdev.prepare = ipa_notify_prepare;
-	ipa_notify->subdev.start = ipa_notify_start;
-	ipa_notify->subdev.stop = ipa_notify_stop;
-	ipa_notify->subdev.unprepare = ipa_notify_unprepare;
-
-	rproc_add_subdev(rproc, &ipa_notify->subdev);
-}
-EXPORT_SYMBOL_GPL(qcom_add_ipa_notify_subdev);
-
-/* Remove the IPA notification subdevice */
-void qcom_remove_ipa_notify_subdev(struct rproc *rproc,
-		struct qcom_rproc_ipa_notify *ipa_notify)
-{
-	struct rproc_subdev *subdev = &ipa_notify->subdev;
-
-	ipa_notify_removing(subdev);
-
-	rproc_remove_subdev(rproc, subdev);
-	ipa_notify->notify = NULL;	/* Make it obvious */
-}
-EXPORT_SYMBOL_GPL(qcom_remove_ipa_notify_subdev);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("Qualcomm IPA notification remoteproc subdev");
diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 718acebae777f..eb2a0d7dea1c7 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -23,7 +23,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/remoteproc.h>
-#include "linux/remoteproc/qcom_q6v5_ipa_notify.h"
 #include <linux/reset.h>
 #include <linux/soc/qcom/mdt_loader.h>
 #include <linux/iopoll.h>
@@ -199,7 +198,6 @@ struct q6v5 {
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
-	struct qcom_rproc_ipa_notify ipa_notify_subdev;
 	struct qcom_sysmon *sysmon;
 	bool need_mem_protection;
 	bool has_alt_reset;
@@ -1585,39 +1583,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY)
-
-/* Register IPA notification function */
-int qcom_register_ipa_notify(struct rproc *rproc, qcom_ipa_notify_t notify,
-			     void *data)
-{
-	struct qcom_rproc_ipa_notify *ipa_notify;
-	struct q6v5 *qproc = rproc->priv;
-
-	if (!notify)
-		return -EINVAL;
-
-	ipa_notify = &qproc->ipa_notify_subdev;
-	if (ipa_notify->notify)
-		return -EBUSY;
-
-	ipa_notify->notify = notify;
-	ipa_notify->data = data;
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(qcom_register_ipa_notify);
-
-/* Deregister IPA notification function */
-void qcom_deregister_ipa_notify(struct rproc *rproc)
-{
-	struct q6v5 *qproc = rproc->priv;
-
-	qproc->ipa_notify_subdev.notify = NULL;
-}
-EXPORT_SYMBOL_GPL(qcom_deregister_ipa_notify);
-#endif /* !IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY) */
-
 static int q6v5_probe(struct platform_device *pdev)
 {
 	const struct rproc_hexagon_res *desc;
@@ -1744,7 +1709,6 @@ static int q6v5_probe(struct platform_device *pdev)
 	qcom_add_glink_subdev(rproc, &qproc->glink_subdev, "mpss");
 	qcom_add_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_add_ssr_subdev(rproc, &qproc->ssr_subdev, "mpss");
-	qcom_add_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
 	qproc->sysmon = qcom_add_sysmon_subdev(rproc, "modem", 0x12);
 	if (IS_ERR(qproc->sysmon)) {
 		ret = PTR_ERR(qproc->sysmon);
@@ -1760,7 +1724,6 @@ static int q6v5_probe(struct platform_device *pdev)
 remove_sysmon_subdev:
 	qcom_remove_sysmon_subdev(qproc->sysmon);
 remove_subdevs:
-	qcom_remove_ipa_notify_subdev(qproc->rproc, &qproc->ipa_notify_subdev);
 	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
@@ -1782,7 +1745,6 @@ static int q6v5_remove(struct platform_device *pdev)
 	rproc_del(rproc);
 
 	qcom_remove_sysmon_subdev(qproc->sysmon);
-	qcom_remove_ipa_notify_subdev(rproc, &qproc->ipa_notify_subdev);
 	qcom_remove_ssr_subdev(rproc, &qproc->ssr_subdev);
 	qcom_remove_smd_subdev(rproc, &qproc->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &qproc->glink_subdev);
diff --git a/include/linux/remoteproc/qcom_q6v5_ipa_notify.h b/include/linux/remoteproc/qcom_q6v5_ipa_notify.h
deleted file mode 100644
index 0820edc0ab7df..0000000000000
--- a/include/linux/remoteproc/qcom_q6v5_ipa_notify.h
+++ /dev/null
@@ -1,82 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-/* Copyright (C) 2019 Linaro Ltd. */
-
-#ifndef __QCOM_Q6V5_IPA_NOTIFY_H__
-#define __QCOM_Q6V5_IPA_NOTIFY_H__
-
-#if IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY)
-
-#include <linux/remoteproc.h>
-
-enum qcom_rproc_event {
-	MODEM_STARTING	= 0,	/* Modem is about to be started */
-	MODEM_RUNNING	= 1,	/* Startup complete; modem is operational */
-	MODEM_STOPPING	= 2,	/* Modem is about to shut down */
-	MODEM_CRASHED	= 3,	/* Modem has crashed (implies stopping) */
-	MODEM_OFFLINE	= 4,	/* Modem is now offline */
-	MODEM_REMOVING	= 5,	/* Modem is about to be removed */
-};
-
-typedef void (*qcom_ipa_notify_t)(void *data, enum qcom_rproc_event event);
-
-struct qcom_rproc_ipa_notify {
-	struct rproc_subdev subdev;
-
-	qcom_ipa_notify_t notify;
-	void *data;
-};
-
-/**
- * qcom_add_ipa_notify_subdev() - Register IPA notification subdevice
- * @rproc:	rproc handle
- * @ipa_notify:	IPA notification subdevice handle
- *
- * Register the @ipa_notify subdevice with the @rproc so modem events
- * can be sent to IPA when they occur.
- *
- * This is defined in "qcom_q6v5_ipa_notify.c".
- */
-void qcom_add_ipa_notify_subdev(struct rproc *rproc,
-		struct qcom_rproc_ipa_notify *ipa_notify);
-
-/**
- * qcom_remove_ipa_notify_subdev() - Remove IPA SSR subdevice
- * @rproc:	rproc handle
- * @ipa_notify:	IPA notification subdevice handle
- *
- * This is defined in "qcom_q6v5_ipa_notify.c".
- */
-void qcom_remove_ipa_notify_subdev(struct rproc *rproc,
-		struct qcom_rproc_ipa_notify *ipa_notify);
-
-/**
- * qcom_register_ipa_notify() - Register IPA notification function
- * @rproc:	Remote processor handle
- * @notify:	Non-null IPA notification callback function pointer
- * @data:	Data supplied to IPA notification callback function
- *
- * @Return: 0 if successful, or a negative error code otherwise
- *
- * This is defined in "qcom_q6v5_mss.c".
- */
-int qcom_register_ipa_notify(struct rproc *rproc, qcom_ipa_notify_t notify,
-			     void *data);
-/**
- * qcom_deregister_ipa_notify() - Deregister IPA notification function
- * @rproc:	Remote processor handle
- *
- * This is defined in "qcom_q6v5_mss.c".
- */
-void qcom_deregister_ipa_notify(struct rproc *rproc);
-
-#else /* !IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY) */
-
-struct qcom_rproc_ipa_notify { /* empty */ };
-
-#define qcom_add_ipa_notify_subdev(rproc, ipa_notify)		/* no-op */
-#define qcom_remove_ipa_notify_subdev(rproc, ipa_notify)	/* no-op */
-
-#endif /* !IS_ENABLED(CONFIG_QCOM_Q6V5_IPA_NOTIFY) */
-
-#endif /* !__QCOM_Q6V5_IPA_NOTIFY_H__ */
-- 
2.20.1

