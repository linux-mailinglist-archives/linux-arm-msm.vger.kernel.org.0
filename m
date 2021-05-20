Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB59389A89
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 02:25:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbhETA0y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 20:26:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbhETA0s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 20:26:48 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C48DC061761
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:25:28 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id k15so10610882pgb.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gm72nwXpdE7RmMD+c9dyNsOFYFMq7AQj3MbF+XKSlWQ=;
        b=UqC0yWQ9R5JvKixzeUdDD01pWSLv+fpdp/03qcIkZhAwK5Kap/ew8RZePWbSbXRD46
         q7WXLSHmfaKhKooj+IesNu1xcAVOJFXJF81IxZikgaJSTDZ0fwlQ2IFnCrPfQSqsVVO3
         Gk1Kmcp7VlHe8VSzzpXYjlL4s0Q2kRDPsORxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gm72nwXpdE7RmMD+c9dyNsOFYFMq7AQj3MbF+XKSlWQ=;
        b=ApTSnT43AxRrQ4fNj1n8hXXP037ODfrCZU8ENRCyBu1QyZGv+jOg01H4pySe1nF0Lg
         +Oop4xIZ/gwajWHKna34pti/CQa/yFCEH3L5yBpmJhDq7aB2yN/brjqcY+Xy532LjFoK
         aRFK4d+q58qEwmiITm59zfQKLEgsdV9RWxl1C6RIv9onVANlkXkMwQCKiOORYLXO05Pu
         +Ue1qnqXeBOPUoiJt0Vdgz3Tym7aXMymmz98Gd/lNr+p0hs5doLb9YCcEWx6DPQXCXJG
         OO0ftY0YP3Z4BjL8EJ2NUPCT6eSfjHCtB82oMimTgAKEw0l8tKwc1o/aVqLxl3Sue6EY
         cTfQ==
X-Gm-Message-State: AOAM533tMohjOZhCD0vs6toyX+OQZ2dnu7ZR3etkSTE3dsRwGo4qhdo4
        T9uyloLmOgspMhRc4jI15epkxg==
X-Google-Smtp-Source: ABdhPJwNWO63s1Z5yApVrizJPTmgihkFNM8TC2kJOBfC18nrxp5jGPb+J16z/e7HhYyam76qI+Pa9Q==
X-Received: by 2002:aa7:870c:0:b029:2a1:f060:f17d with SMTP id b12-20020aa7870c0000b02902a1f060f17dmr1648391pfo.24.1621470327798;
        Wed, 19 May 2021 17:25:27 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
        by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:25:27 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH 6/7] component: Move struct aggregate_device out to header file
Date:   Wed, 19 May 2021 17:25:18 -0700
Message-Id: <20210520002519.3538432-7-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
References: <20210520002519.3538432-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows aggregate driver writers to use the device passed to their
probe/remove/shutdown functions properly instead of treating it as an
opaque pointer.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 13 -------------
 include/linux/component.h | 15 +++++++++++++--
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 155aab7eefa6..1b4c84453319 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -62,19 +62,6 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct aggregate_device {
-	const struct component_master_ops *ops;
-	struct device dev;
-	struct component_match *match;
-
-	int id;
-};
-
-static inline struct aggregate_device *to_aggregate_device(struct device *d)
-{
-	return container_of(d, struct aggregate_device, dev);
-}
-
 struct component {
 	struct list_head node;
 	struct aggregate_device *adev;
diff --git a/include/linux/component.h b/include/linux/component.h
index bc71d34a3416..d19cc3418d12 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -39,7 +39,7 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-struct aggregate_device;
+struct component_match;
 
 /**
  * struct component_master_ops - callback for the aggregate driver
@@ -80,7 +80,18 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
-struct component_match;
+struct aggregate_device {
+	const struct component_master_ops *ops;
+	struct device dev;
+	struct component_match *match;
+
+	int id;
+};
+
+static inline struct aggregate_device *to_aggregate_device(struct device *d)
+{
+	return container_of(d, struct aggregate_device, dev);
+}
 
 /**
  * struct aggregate_driver - Aggregate driver (made up of other drivers)
-- 
https://chromeos.dev

