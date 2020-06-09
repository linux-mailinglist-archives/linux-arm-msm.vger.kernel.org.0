Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8B521F3876
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 12:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728193AbgFIKsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Jun 2020 06:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728877AbgFIKrp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Jun 2020 06:47:45 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C88EC00862F
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2020 03:47:41 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id l12so18015408ejn.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2020 03:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/5WnBa7fJn+pPKP5P8jfdYigZEMgAeAJ+nmAq9FbnZM=;
        b=hS4A2h3J+Pci4Lw+anaXS2PuQgAH2hIHxpqd0ezXZxBZ9me+hfgdQg5mvHjcq8SUiO
         EuY6p0NBvRb45UuQrdbwSLXcPmCxwBvC1lHF5LyVoiaJ8Sx7LThvB+VK7ZsHRno9Y2uz
         6SBK2Nd8vb3GB5GOe8DWi6HPJvQeRk3hvhBy5OICiWc0tGOHQHpN2pIM2xv/FIUgpWI6
         D+4lRUw0r9eb4u0Y5WU5nkzEVplGGsS2HlRlIsldw/wj3Ik+gd67w1NVDuyHJGq/QF/p
         77MD86DPubivo8gbrQsAWCFwqMs/4ctENZres/LCUYw3JixwjJNmIkS6ZdOBqPwqK80t
         UO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/5WnBa7fJn+pPKP5P8jfdYigZEMgAeAJ+nmAq9FbnZM=;
        b=G9S5mXi62s7zgHad+cau9cckKmKn1wUxfBtITRm8N0Ubo4xNaOxEAryxoG0m0KduCb
         CQxG5S0mTbXw8z76JcpSbyIrcQ9g4MiVuzRgAQXRjwKz/QGjCDlKIo9jew3/A3RPAQu0
         VysjZQnzpE0m4qhuA/jQv1Vi4HSvFQy9BkgRzBPbG8tE48b7z6tiv/vNU0DBpNNW5YAz
         pB/aK6mIhRemyyi3wlnu+PQWrkrLX5ksPMH7fb2cER3z5wPR2Ikg4UYuNY7phpHlyUaw
         qFew1I6LFtlzxgXhTQ1wqgYPROGb8LLkpFWd3T4neslxaGP8pPXZshEdgT+fBVBIol4E
         ATnw==
X-Gm-Message-State: AOAM5337i7D3xgVbbIALKO/aTtqjpog33G5Fgq/ZzZ80kz8g2e4lrA15
        T+1jdVOpGFdd9IgIq1Xn5Ultsw==
X-Google-Smtp-Source: ABdhPJzH/K2NQQ2rv61OJWPAnFYGeM8y8y32U0bjShreSrArNp7+PSoZt2khzLblWMU0Eg0n23fgQA==
X-Received: by 2002:a17:907:ab9:: with SMTP id bz25mr24488816ejc.39.1591699659825;
        Tue, 09 Jun 2020 03:47:39 -0700 (PDT)
Received: from localhost.localdomain (hst-221-69.medicom.bg. [84.238.221.69])
        by smtp.gmail.com with ESMTPSA id qt19sm12267763ejb.14.2020.06.09.03.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2020 03:47:39 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-acpi@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     Joe Perches <joe@perches.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jason Baron <jbaron@akamai.com>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 3/7] dev_printk: Add dev_dbg_level macro over dynamic one
Date:   Tue,  9 Jun 2020 13:46:00 +0300
Message-Id: <20200609104604.1594-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609104604.1594-1-stanimir.varbanov@linaro.org>
References: <20200609104604.1594-1-stanimir.varbanov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add dev_dbg_level macro wrapper over dynamic debug one for
dev_dbg variants.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 include/linux/dev_printk.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/dev_printk.h b/include/linux/dev_printk.h
index 7b50551833e1..d639dc60d84d 100644
--- a/include/linux/dev_printk.h
+++ b/include/linux/dev_printk.h
@@ -112,15 +112,24 @@ void _dev_info(const struct device *dev, const char *fmt, ...)
 #if defined(CONFIG_DYNAMIC_DEBUG)
 #define dev_dbg(dev, fmt, ...)						\
 	dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
+#define dev_dbg_level(dev, lvl, fmt, ...)				\
+	dynamic_dev_dbg_level(dev, lvl, dev_fmt(fmt), ##__VA_ARGS__)
 #elif defined(DEBUG)
 #define dev_dbg(dev, fmt, ...)						\
 	dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
+#define dev_dbg_level(dev, lvl, fmt, ...)				\
+	dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
 #else
 #define dev_dbg(dev, fmt, ...)						\
 ({									\
 	if (0)								\
 		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
 })
+#define dev_dbg_level(dev, lvl, fmt, ...)				\
+({									\
+	if (0)								\
+		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
+})
 #endif
 
 #ifdef CONFIG_PRINTK
-- 
2.17.1

