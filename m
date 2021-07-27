Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 951EB3D806F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jul 2021 23:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232432AbhG0VD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jul 2021 17:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232755AbhG0VDw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jul 2021 17:03:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B124BC061389
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 14:02:56 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id d18so24074799lfb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jul 2021 14:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GJaDlSnC/hNhPjnByAZZc7+i+wuzXCs6r81DcH7ZrtQ=;
        b=CthAyw2AHCfNIL3b/mZSgU3pTXABYO278cJe2QC9FzEgW8OsHLctazCNx/5FFpXu38
         +UCIekq1ZvH30aZ5eX6UqwT1ayGryPp/UTmKU6H7aIQgLt7nwDM548jffyxUWU92JKIe
         zhSlYAaFX+PHO0gWB/C8P368mKDY8Y7/1eX+laeFgCQFsge4wChEck4vwSbXkRabrdZy
         tOljxyXcUiRqd8o8ylZ7mqtdWAbqqpAQClcq6qF3M7+7LFQFAFC/fvY26DNvjFq/Fby7
         48GaIYTbzHZqA+HEWxl0jD03YtCf9+g5JfR6vXTSSfQiDnUxGqO08zSfuUhKvJO38Lk+
         2zLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GJaDlSnC/hNhPjnByAZZc7+i+wuzXCs6r81DcH7ZrtQ=;
        b=ndLOahZ/eNMy+ywUGcw6e3xtteTfYK15X8RhCoRlJYucyt7gUJYtADqG26YFwPTvLb
         YFYJrHHULhZ2iaLqmRUB6aMOGpmzV66aETQbQzH+jxaN9vxMOFdYIvB5cS6knm6Uwzn4
         xkx5ZA8QV+zijyvNVYmPIPtoLsFj2kmfULTPVwG78r9ab53FxALUGN4xKEntexswMh0a
         YqqI1MU9j+AAfdzzixx5m+eqNOumPqN0hzZfSKzF49ZawasuclDb9/t5zHQKqudnrJQk
         12yeNmc+WxnQgx+S0OUVl+Z0caNb5/x+3mi8kbrJJkVQM1a6jZ54HCOMmJ3t5G9i5O4j
         +x4g==
X-Gm-Message-State: AOAM533aEW6c7vtx5h9dB8h30pCSFMFLx0QuBZNJ/gb3CSWb2UHb0od+
        E3jGF3SDpc4rMH6yShzzFFLj1Q==
X-Google-Smtp-Source: ABdhPJyqGPl7FrTy1/+5NTNiFQVkIzTuIKtJKpELZMp+fm7jOWrsumOWR7j6xwphzT4R579tH8ACMg==
X-Received: by 2002:a05:6512:1109:: with SMTP id l9mr18251275lfg.384.1627419775114;
        Tue, 27 Jul 2021 14:02:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m5sm355680ljq.22.2021.07.27.14.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 14:02:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 1/2] PM: runtime: add devm_pm_runtime_enable helper
Date:   Wed, 28 Jul 2021 00:02:01 +0300
Message-Id: <20210727210202.717181-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727210202.717181-1-dmitry.baryshkov@linaro.org>
References: <20210727210202.717181-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add helper function handling typical driver action: call
pm_runtime_enable at the probe() time and disable it during remove().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/base/power/runtime.c | 17 +++++++++++++++++
 include/linux/pm_runtime.h   |  4 ++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
index 8a66eaf731e4..ec94049442b9 100644
--- a/drivers/base/power/runtime.c
+++ b/drivers/base/power/runtime.c
@@ -1447,6 +1447,23 @@ void pm_runtime_enable(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(pm_runtime_enable);
 
+static void pm_runtime_disable_action(void *data)
+{
+	pm_runtime_disable(data);
+}
+
+/**
+ * devm_pm_runtime_enable - devres-enabled version of pm_runtime_enable.
+ * @dev: Device to handle.
+ */
+int devm_pm_runtime_enable(struct device *dev)
+{
+	pm_runtime_enable(dev);
+
+	return devm_add_action_or_reset(dev, pm_runtime_disable_action, dev);
+}
+EXPORT_SYMBOL_GPL(devm_pm_runtime_enable);
+
 /**
  * pm_runtime_forbid - Block runtime PM of a device.
  * @dev: Device to handle.
diff --git a/include/linux/pm_runtime.h b/include/linux/pm_runtime.h
index aab8b35e9f8a..222da43b7096 100644
--- a/include/linux/pm_runtime.h
+++ b/include/linux/pm_runtime.h
@@ -59,6 +59,8 @@ extern void pm_runtime_put_suppliers(struct device *dev);
 extern void pm_runtime_new_link(struct device *dev);
 extern void pm_runtime_drop_link(struct device_link *link);
 
+extern int devm_pm_runtime_enable(struct device *dev);
+
 /**
  * pm_runtime_get_if_in_use - Conditionally bump up runtime PM usage counter.
  * @dev: Target device.
@@ -253,6 +255,8 @@ static inline void __pm_runtime_disable(struct device *dev, bool c) {}
 static inline void pm_runtime_allow(struct device *dev) {}
 static inline void pm_runtime_forbid(struct device *dev) {}
 
+static inline int devm_pm_runtime_enable(struct device *dev) { return 0; }
+
 static inline void pm_suspend_ignore_children(struct device *dev, bool enable) {}
 static inline void pm_runtime_get_noresume(struct device *dev) {}
 static inline void pm_runtime_put_noidle(struct device *dev) {}
-- 
2.30.2

