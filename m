Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801C42C57FD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 16:22:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391298AbgKZPWR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 10:22:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391286AbgKZPWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 10:22:17 -0500
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08890C0617A7
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:17 -0800 (PST)
Received: by mail-wr1-x444.google.com with SMTP id l1so2525125wrb.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2020 07:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=aPLHqO7umAzH3uCMdx9gGdOu7TMdN7Har/HDHaaht+Q=;
        b=B7EzWmQ7wLTrqyxGu3usr2kvgQTOaWPZGpQ8+fhOncJtMe7cDXl/Hbhd1OABZBsw64
         0yofU2N5id5mGEaF2DPyWmc0OiuNL1eoGy29H4XwXwRN+OwaHSd3KNZdteeSb0pzbsI4
         EJCUIlCizNVKboGJQRgHjneRG5kt1eCAeP/yGASSDRyKYTZ/WI081MCy/vwVrtEni8+d
         XSyIuTqYjBzPSJLFukiUGn2VW3RJtZpQWQ87LtvUR+L2ilJ9QiQmz8H+RWXrbc1T4O8V
         GCu2ftoesdxarygwLS0mHWXGGlq6y31zu0TwO77jDeYYg6IUnZBstaUsQmSxMAsJNpUq
         ZrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=aPLHqO7umAzH3uCMdx9gGdOu7TMdN7Har/HDHaaht+Q=;
        b=tpaBfOo26WoYB3zDsnxBm6dqZejHauQTGTC5Fxiko8I+ZaO1zqHyDRrMjkniisO3B7
         LJbGcRh6BnZpN0vWqXUZAj8226wVOWc/MPRyF+fYPr3eWdppwAOrPf3unROy5rsmHR7L
         WKt91BnODHJODzh0+/NY/Rg226vLBfq+pYFysGaDiSa5OdlUTCkkitHpLbFWiZ4n30vg
         Bas/Hvbky9BvpUgApN80QtcRxDV8nqStX8efnsGxZlN2vLKPysi4qKL9BmqxcJu8yfgY
         +cuMlvpKsiOrGUAM4LvJjA4dCGTXrp+bOQrgO5+4LoP98XUx/Qud5OydIDb9cP3wGj/f
         etpQ==
X-Gm-Message-State: AOAM53389XWn8bK5klAMXsy5D2FxwodbGqsPsSrlf6UxvaWjZQNQ7uo8
        jgXw1ZmZvKI07I/PEBM0DqMy2g==
X-Google-Smtp-Source: ABdhPJw/lkqzgwQ1spBI5lcBKZX5u57+tEcIkQst+Ze/IhKqszqkFh/Eroea0MWc7IOoLbMUuDtXSg==
X-Received: by 2002:adf:f70b:: with SMTP id r11mr4428835wrp.133.1606404135707;
        Thu, 26 Nov 2020 07:22:15 -0800 (PST)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id l10sm2756144wme.42.2020.11.26.07.22.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 07:22:15 -0800 (PST)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, bbhatt@codeaurora.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH v3 1/9] mhi: Add mhi_controller_initialize helper
Date:   Thu, 26 Nov 2020 16:28:59 +0100
Message-Id: <1606404547-10737-2-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
References: <1606404547-10737-1-git-send-email-loic.poulain@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This function allows to initialize a mhi_controller structure.
Today, it only zeroing the structure.

Use this function from mhi_alloc_controller so that any further
initialization can be factorized in initalize function.

Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
---
 drivers/bus/mhi/core/init.c | 7 +++++++
 include/linux/mhi.h         | 6 ++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 96cde9c..4acad28 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -1021,11 +1021,18 @@ void mhi_unregister_controller(struct mhi_controller *mhi_cntrl)
 }
 EXPORT_SYMBOL_GPL(mhi_unregister_controller);
 
+void mhi_initialize_controller(struct mhi_controller *mhi_cntrl)
+{
+	memset(mhi_cntrl, 0, sizeof(*mhi_cntrl));
+}
+EXPORT_SYMBOL_GPL(mhi_initialize_controller);
+
 struct mhi_controller *mhi_alloc_controller(void)
 {
 	struct mhi_controller *mhi_cntrl;
 
 	mhi_cntrl = kzalloc(sizeof(*mhi_cntrl), GFP_KERNEL);
+	mhi_initialize_controller(mhi_cntrl);
 
 	return mhi_cntrl;
 }
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 5721a0a..30c676d 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -537,6 +537,12 @@ struct mhi_driver {
 #define to_mhi_device(dev) container_of(dev, struct mhi_device, dev)
 
 /**
+ * mhi_initialize_controller - Initialize MHI Controller structure
+ * @mhi_cntrl: MHI controller structure to initialize
+ */
+void mhi_initialize_controller(struct mhi_controller *mhi_cntrl);
+
+/**
  * mhi_alloc_controller - Allocate the MHI Controller structure
  * Allocate the mhi_controller structure using zero initialized memory
  */
-- 
2.7.4

