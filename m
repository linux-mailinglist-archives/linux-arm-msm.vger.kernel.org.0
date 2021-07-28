Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00EC93D9074
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 16:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236640AbhG1O0m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 10:26:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236425AbhG1OZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 10:25:03 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CD36C0613D5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 07:24:53 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id f12so3338267ljn.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jul 2021 07:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GJaDlSnC/hNhPjnByAZZc7+i+wuzXCs6r81DcH7ZrtQ=;
        b=oRstao6gbKMmICYaC3SKWepRzcJHA4aEDbhQHTeyGN6rf1b8bh2me+VljUa8FRFrLm
         uvHpxG2nhxOt9I8zQvpK2HBQSvBv/ErY3sCeYPTexZAVtdmJu78wXqpvk4hfCHv2NWcK
         FEWoMmbYYiybDd5QcGhnDFlGCF9jzd84ryWCTf4pyocd50ggkSRMd2D8U4LE1HeGbWgE
         8YMNOaEvgOyH4rmkr2EBXJ+sSJxxu8qAJECT/L7JqqerdiUWdD7TmyiLeuDIQ+a0KmYt
         0YpJulR9+eollRE2a8RM+po6TbHYWv3F1AHnnoqjncdL9SH6xCNUgVOUyOQGf0/dZI53
         Djpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GJaDlSnC/hNhPjnByAZZc7+i+wuzXCs6r81DcH7ZrtQ=;
        b=pAyTGZ9K58lKLqAFg1rZifKfratdy2J0XnLZ3nGo3L8gFJfXRJ8wjT7AVMwzrjUWSq
         nSR15+NzV0yRt+ISEyr8jL0aqMrw148EEwMsc+4RKLAB612MOLwT70/8hwfEZGJRg41U
         x2fEApmD73gC7xhqKw2hnmx5w9mLNQgVm69FWiQZmH/V1kUpvYOGr18OekaYhwus1LJ1
         Bov5oA/xfbbIlmyifbx1DlSlZSpU9jqscHCur3AXO8gLuVFYmF1hmK6P9ScbdC3QT/iL
         UtGuaBfQowQugoHPspoqNzUfEK6uDuClVaE90eYtX33F93ieYXALvW5WQi3fg1CuMz+G
         W6lA==
X-Gm-Message-State: AOAM531s/FCco4nKJ0Bxx3hpe9JMAu9S+ZjdiBVVbCtsg1nipHaG8Czd
        dPu6bF07kC/yQg1STlliDDbnkA==
X-Google-Smtp-Source: ABdhPJx682H/mmR+mfH2Y1lEcXI3nATjRem0dqGtzAlXzB8PgkRBrJyjJCXwb4hDvTGS4TIMWPd/0w==
X-Received: by 2002:a2e:2ac5:: with SMTP id q188mr93567ljq.168.1627482291321;
        Wed, 28 Jul 2021 07:24:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h4sm15610lft.184.2021.07.28.07.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 07:24:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/5] PM: runtime: add devm_pm_runtime_enable helper
Date:   Wed, 28 Jul 2021 17:24:41 +0300
Message-Id: <20210728142445.774158-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
References: <20210728142445.774158-1-dmitry.baryshkov@linaro.org>
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

