Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2280943A8B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Oct 2021 02:01:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235817AbhJZADj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Oct 2021 20:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233728AbhJZADM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Oct 2021 20:03:12 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE35AC061225
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:00:47 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id d9so12491378pfl.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Oct 2021 17:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kiNOxXumrSGzV6vW4uZBorP3H/jCdIuX85JHNzz9/pA=;
        b=JMiy5eF8fFhoaXn0XtQA82qv7f3Kn/gzOSEl6q6IP9UA+c2TYZxwR4GVpZOQ1XYabD
         DdoRH4AdBDSVqcecLfZZ2aazEwXu6Bv6xNHJb4qXAV848IlvHVMT7L5QCWoNoscX+gft
         MAZY0D2nvFDXOW35ypGnfdQ6lD2L8CpXJx8Pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kiNOxXumrSGzV6vW4uZBorP3H/jCdIuX85JHNzz9/pA=;
        b=55dDjl7napi/88ITcoZ6G8Nwp4Kw/aSZsXSl0dnXN4c3zmvTDP+LxDQLGEdV/5t5e2
         7kRzUA9myntqgvljyRRWaYrjFOj0jZtJPxTIwwFWw0OjfeJ9EsXLljo3qA2wFxz47PkR
         mcRK2kBkl76yOrAMH7HuAPhZ0jVyqSDQeyL5I8xOUCF8llG4jXSGvWTG5TVInKrnARdT
         a+Z6RuKi5dnu4u1aRhNCRG8pgnXmin/ZWQYFlgWoWrJKyW4AY03hRh7EEEbSCJZH+TF7
         M9Mf1f6Y7GxIj+ppE96uXsxQlH3sGl4IaMSmCevGydnWw6ZGsL2WoEL4Azm93xfJlbo8
         h6QA==
X-Gm-Message-State: AOAM53113a13NeF5Zb4A42cxZiNRIupFYGSTsru4CAzz8EnbUchM6ppC
        1NDusFuaQm/g68IfkBsYmBC6KQ==
X-Google-Smtp-Source: ABdhPJwvUKoZW6zKdmGgERvHcDncEYduLAC0b2YntCqNtzLoBZnREGEKrDhNeilGhp1QXgjPTSTzNw==
X-Received: by 2002:aa7:8149:0:b0:44c:916c:1fdb with SMTP id d9-20020aa78149000000b0044c916c1fdbmr22481157pfn.34.1635206447235;
        Mon, 25 Oct 2021 17:00:47 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:f5e3:5eb1:d5ee:6893])
        by smtp.gmail.com with ESMTPSA id b7sm9900747pfm.28.2021.10.25.17.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 17:00:46 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v3 01/34] component: Introduce struct aggregate_device
Date:   Mon, 25 Oct 2021 17:00:11 -0700
Message-Id: <20211026000044.885195-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
In-Reply-To: <20211026000044.885195-1-swboyd@chromium.org>
References: <20211026000044.885195-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace 'struct master' with 'struct aggregate_device' and then rename
'master' to 'adev' everywhere in the code. While we're here, put a
struct device inside the aggregate device so that we can register it
with a bus_type in the next patch.

The diff is large but that's because this is mostly a rename, where
sometimes 'master' is replaced with 'adev' and other times it is
replaced with 'parent' to indicate that the struct device that was being
used is actually the parent of the aggregate device and driver.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 5e79299f6c3f..1c3c91ba7d2e 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -9,6 +9,7 @@
  */
 #include <linux/component.h>
 #include <linux/device.h>
+#include <linux/idr.h>
 #include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
@@ -64,7 +65,10 @@ struct master {
 
 	const struct component_master_ops *ops;
 	struct device *parent;
+	struct device dev;
 	struct component_match *match;
+
+	int id;
 };
 
 struct component {
@@ -80,6 +84,7 @@ struct component {
 static DEFINE_MUTEX(component_mutex);
 static LIST_HEAD(component_list);
 static LIST_HEAD(masters);
+static DEFINE_IDA(aggregate_ida);
 
 #ifdef CONFIG_DEBUG_FS
 
@@ -440,6 +445,7 @@ static void free_master(struct master *master)
 		}
 	}
 
+	ida_free(&aggregate_ida, master->id);
 	kfree(master);
 }
 
@@ -460,7 +466,7 @@ int component_master_add_with_match(struct device *parent,
 	struct component_match *match)
 {
 	struct master *master;
-	int ret;
+	int ret, id;
 
 	/* Reallocate the match array for its true size */
 	ret = component_match_realloc(match, match->num);
@@ -471,9 +477,17 @@ int component_master_add_with_match(struct device *parent,
 	if (!master)
 		return -ENOMEM;
 
+	id = ida_alloc(&aggregate_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(master);
+		return id;
+	}
+
+	master->id = id;
 	master->parent = parent;
 	master->ops = ops;
 	master->match = match;
+	dev_set_name(&master->dev, "aggregate%d", id);
 
 	component_master_debugfs_add(master);
 	/* Add to the list of available masters. */
-- 
https://chromeos.dev

