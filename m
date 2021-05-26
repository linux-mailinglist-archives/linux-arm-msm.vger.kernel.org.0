Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF0A391207
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 10:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233028AbhEZIM2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 04:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233085AbhEZIM0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 04:12:26 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A832C06138A
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 01:10:54 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id p7so59708wru.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 May 2021 01:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QalgDLxIe/g/hTvvzl8xtwoLxem9VEdCVSmBFAk4KWI=;
        b=QS0yg/qQ6lEc1SwIeywM3XroTH1sTb43NALJP8LwG8O8e0m9ZUl4paE+IjwiEEndB0
         5CwoTTwIXuPrXIBS2CJNO/p80DZbgwYPHtWf5l/hVKL1d4qczuCZl6fdVvBMg7nV0OVd
         GKkzmMVf6efxp1hH22YlDTPQb7OYmroy/reNQJA8PMFMPP2sBpOn/hD7jBJic96WKN0N
         Er6B3h3LH4qfjlG6lsPFcs5x3zVdw0CNYjqIN2cZkwdwXC3O/Sa3BGCwr6CI6UGhCR73
         WvDrmP8SQnaur8ycam0z8OfFWSgPhza7hzSdrT3ReZz82ksUub2zyq3CWloXb1fr9Ghv
         x3Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QalgDLxIe/g/hTvvzl8xtwoLxem9VEdCVSmBFAk4KWI=;
        b=a4VDukVgvZ2FpT3GfD8xJD93M7ABmJob8Ct/NPeZ5X57rmaro2a3WeiEyZeLfh3YTu
         M/+/QDkkFnpvcoF7QK/g7MURqqKqTOWt6JvYBBnbBTS5VRngXtl79W13EvsUXc9dBWL/
         M3F0SM7z0O5B80ldXkHZLp/tekHcIxTzXTup25dRcOWvZFmBmubERQD+kZwCk8u7AxD/
         5GXyAg333NQDefH08yFoBk8xNRp7Lux/6YlKBxSJnNz4WpEdkRPJQ620XIEY4vV3wQot
         ZzrKPk9jbRXOUBKrtano777H+OPAu8ByqpNcSbmXK2iXNQq3qewyEVJrs6LzczQqz28X
         jaYg==
X-Gm-Message-State: AOAM5300TX1Lt7nRYKPVoGnHo84xIvJrWT2Uk8qxfxAAS44f6h3OOuKt
        i5Jer3MY5RiLIS8g8zDhgiTOYA==
X-Google-Smtp-Source: ABdhPJxKp/nuBns7h8mzFi6UjTt+3vkXBFVgZFeXkoOvM3KduN0Yay+0l2Omszk9emT2GcyL9ibWGw==
X-Received: by 2002:a05:6000:52:: with SMTP id k18mr31210738wrx.419.1622016652758;
        Wed, 26 May 2021 01:10:52 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id v11sm22628319wrs.9.2021.05.26.01.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 01:10:52 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH 07/10] bus: qcom-ebi2: Fix incorrect documentation for '{slow,fast}_cfg'
Date:   Wed, 26 May 2021 09:10:35 +0100
Message-Id: <20210526081038.544942-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526081038.544942-1-lee.jones@linaro.org>
References: <20210526081038.544942-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/bus/qcom-ebi2.c:112: warning: Function parameter or member 'slow_cfg' not described in 'cs_data'
 drivers/bus/qcom-ebi2.c:112: warning: Function parameter or member 'fast_cfg' not described in 'cs_data'

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/bus/qcom-ebi2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index 0b8f53a688b8a..663c827492223 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -102,8 +102,8 @@
 /**
  * struct cs_data - struct with info on a chipselect setting
  * @enable_mask: mask to enable the chipselect in the EBI2 config
- * @slow_cfg0: offset to XMEMC slow CS config
- * @fast_cfg1: offset to XMEMC fast CS config
+ * @slow_cfg: offset to XMEMC slow CS config
+ * @fast_cfg: offset to XMEMC fast CS config
  */
 struct cs_data {
 	u32 enable_mask;
-- 
2.31.1

