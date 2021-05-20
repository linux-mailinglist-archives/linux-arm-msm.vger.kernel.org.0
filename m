Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB59389A86
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 02:25:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230151AbhETA0t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 May 2021 20:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhETA0r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 May 2021 20:26:47 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BBFAC061574
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:25:23 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id v12so7993666plo.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 May 2021 17:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JNxwD7syB3zbuTcHiQ2RcTt/YSP1lAuoHw0lZYemaYg=;
        b=jn0rXx/Q/fj/IdfX1qB6WTueqQzICKheAGOtEcMLSHUeHLTDIWbxk5hSxed/z0Xxve
         XgO0jXy2fVSX8r/+9pacoBdw0mCgZSxO12defDU3n1GZ9rVReKi1AhzG4STC8RCBqF+y
         A0zBkgKWqwroW0C0cV/gspD6ItXu1svC+PiNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JNxwD7syB3zbuTcHiQ2RcTt/YSP1lAuoHw0lZYemaYg=;
        b=c6jQ4l3aPWVl0Tx98E26Lqun/iS+tJGWjkCQ9RbvpCon1ni6LBtMWo4CUKZY5tcvSs
         TBkpLYIIPoJjlInh5hHWyCXnZ99D8l/8LMYkm8mQVgSqzg7q0nBVgJbl6rjqH2geIQQD
         aBjoqKcp+eEEQUD1q6A7JTNLz3DQfEdGC+V6QjwMO3IBas9/M/uTxQ+KcudvLzRGWOnz
         I5uxDrlpEMtROXVVg8mnVjhTn4eqKhmR8Za2qKGJGJxSWIJIXwgGUWQ1j4ESLErXuq2a
         z+z6Osub+TvLKoYl/lwJnzuThTvMW95uFbv4ItmUfWOYUbU7iVNqpP2W5bXpreRe8L7t
         skZw==
X-Gm-Message-State: AOAM532RCyUU1uL0bydxr3hle6VzhWDdPbZtZM+9vkI9KzlvME/UuXDG
        QZnKHuhtbmEONxSuL8kSVEtAYg==
X-Google-Smtp-Source: ABdhPJxn3gLzGjbl9sWERQTWW/UIy3/qUlZikwMHP5vY/xsEr9CD8r3OkNrdzTp1Cw6tSl7uMNCWsw==
X-Received: by 2002:a17:903:187:b029:f1:faff:a111 with SMTP id z7-20020a1709030187b02900f1faffa111mr2576286plg.80.1621470323187;
        Wed, 19 May 2021 17:25:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:200b:db75:4e6c:8b96])
        by smtp.gmail.com with ESMTPSA id i14sm398904pfk.130.2021.05.19.17.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 May 2021 17:25:22 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH 2/7] component: Rename 'dev' to 'parent'
Date:   Wed, 19 May 2021 17:25:14 -0700
Message-Id: <20210520002519.3538432-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210520002519.3538432-1-swboyd@chromium.org>
References: <20210520002519.3538432-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let's rename this struct member to 'parent' to better reflect the
reality that it's the parent device of this psuedo-device. In the next
patch we'll put a 'struct device' inside of this struct so moving this
away simplifies that patch by reducing the number of places that 'dev'
is modified.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 89 +++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 47 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index bbe1757dfa89..5e79299f6c3f 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -63,7 +63,7 @@ struct master {
 	bool bound;
 
 	const struct component_master_ops *ops;
-	struct device *dev;
+	struct device *parent;
 	struct component_match *match;
 };
 
@@ -95,7 +95,7 @@ static int component_devices_show(struct seq_file *s, void *data)
 	seq_printf(s, "%-40s %20s\n", "master name", "status");
 	seq_puts(s, "-------------------------------------------------------------\n");
 	seq_printf(s, "%-40s %20s\n\n",
-		   dev_name(m->dev), m->bound ? "bound" : "not bound");
+		   dev_name(m->parent), m->bound ? "bound" : "not bound");
 
 	seq_printf(s, "%-40s %20s\n", "device name", "status");
 	seq_puts(s, "-------------------------------------------------------------\n");
@@ -124,13 +124,13 @@ core_initcall(component_debug_init);
 
 static void component_master_debugfs_add(struct master *m)
 {
-	debugfs_create_file(dev_name(m->dev), 0444, component_debugfs_dir, m,
+	debugfs_create_file(dev_name(m->parent), 0444, component_debugfs_dir, m,
 			    &component_devices_fops);
 }
 
 static void component_master_debugfs_del(struct master *m)
 {
-	debugfs_remove(debugfs_lookup(dev_name(m->dev), component_debugfs_dir));
+	debugfs_remove(debugfs_lookup(dev_name(m->parent), component_debugfs_dir));
 }
 
 #else
@@ -143,13 +143,13 @@ static void component_master_debugfs_del(struct master *m)
 
 #endif
 
-static struct master *__master_find(struct device *dev,
+static struct master *__master_find(struct device *parent,
 	const struct component_master_ops *ops)
 {
 	struct master *m;
 
 	list_for_each_entry(m, &masters, node)
-		if (m->dev == dev && (!ops || m->ops == ops))
+		if (m->parent == parent && (!ops || m->ops == ops))
 			return m;
 
 	return NULL;
@@ -189,7 +189,7 @@ static int find_components(struct master *master)
 		struct component_match_array *mc = &match->compare[i];
 		struct component *c;
 
-		dev_dbg(master->dev, "Looking for component %zu\n", i);
+		dev_dbg(master->parent, "Looking for component %zu\n", i);
 
 		if (match->compare[i].component)
 			continue;
@@ -200,7 +200,7 @@ static int find_components(struct master *master)
 			break;
 		}
 
-		dev_dbg(master->dev, "found component %s, duplicate %u\n", dev_name(c->dev), !!c->master);
+		dev_dbg(master->parent, "found component %s, duplicate %u\n", dev_name(c->dev), !!c->master);
 
 		/* Attach this component to the master */
 		match->compare[i].duplicate = !!c->master;
@@ -233,28 +233,28 @@ static int try_to_bring_up_master(struct master *master,
 {
 	int ret;
 
-	dev_dbg(master->dev, "trying to bring up master\n");
+	dev_dbg(master->parent, "trying to bring up master\n");
 
 	if (find_components(master)) {
-		dev_dbg(master->dev, "master has incomplete components\n");
+		dev_dbg(master->parent, "master has incomplete components\n");
 		return 0;
 	}
 
 	if (component && component->master != master) {
-		dev_dbg(master->dev, "master is not for this component (%s)\n",
+		dev_dbg(master->parent, "master is not for this component (%s)\n",
 			dev_name(component->dev));
 		return 0;
 	}
 
-	if (!devres_open_group(master->dev, NULL, GFP_KERNEL))
+	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
 		return -ENOMEM;
 
 	/* Found all components */
-	ret = master->ops->bind(master->dev);
+	ret = master->ops->bind(master->parent);
 	if (ret < 0) {
-		devres_release_group(master->dev, NULL);
+		devres_release_group(master->parent, NULL);
 		if (ret != -EPROBE_DEFER)
-			dev_info(master->dev, "master bind failed: %d\n", ret);
+			dev_info(master->parent, "master bind failed: %d\n", ret);
 		return ret;
 	}
 
@@ -281,32 +281,27 @@ static int try_to_bring_up_masters(struct component *component)
 static void take_down_master(struct master *master)
 {
 	if (master->bound) {
-		master->ops->unbind(master->dev);
-		devres_release_group(master->dev, NULL);
+		master->ops->unbind(master->parent);
+		devres_release_group(master->parent, NULL);
 		master->bound = false;
 	}
 }
 
-static void component_match_release(struct device *master,
-	struct component_match *match)
+static void devm_component_match_release(struct device *parent, void *res)
 {
+	struct component_match *match = res;
 	unsigned int i;
 
 	for (i = 0; i < match->num; i++) {
 		struct component_match_array *mc = &match->compare[i];
 
 		if (mc->release)
-			mc->release(master, mc->data);
+			mc->release(parent, mc->data);
 	}
 
 	kfree(match->compare);
 }
 
-static void devm_component_match_release(struct device *dev, void *res)
-{
-	component_match_release(dev, res);
-}
-
 static int component_match_realloc(struct component_match *match, size_t num)
 {
 	struct component_match_array *new;
@@ -450,7 +445,7 @@ static void free_master(struct master *master)
 
 /**
  * component_master_add_with_match - register an aggregate driver
- * @dev: device with the aggregate driver
+ * @parent: parent device of the aggregate driver
  * @ops: callbacks for the aggregate driver
  * @match: component match list for the aggregate driver
  *
@@ -460,7 +455,7 @@ static void free_master(struct master *master)
  * &component_master_ops.bind from @ops. Must be unregistered by calling
  * component_master_del().
  */
-int component_master_add_with_match(struct device *dev,
+int component_master_add_with_match(struct device *parent,
 	const struct component_master_ops *ops,
 	struct component_match *match)
 {
@@ -476,7 +471,7 @@ int component_master_add_with_match(struct device *dev,
 	if (!master)
 		return -ENOMEM;
 
-	master->dev = dev;
+	master->parent = parent;
 	master->ops = ops;
 	master->match = match;
 
@@ -498,20 +493,20 @@ EXPORT_SYMBOL_GPL(component_master_add_with_match);
 
 /**
  * component_master_del - unregister an aggregate driver
- * @dev: device with the aggregate driver
+ * @parent: parent device of the aggregate driver
  * @ops: callbacks for the aggregate driver
  *
  * Unregisters an aggregate driver registered with
  * component_master_add_with_match(). If necessary the aggregate driver is first
  * disassembled by calling &component_master_ops.unbind from @ops.
  */
-void component_master_del(struct device *dev,
+void component_master_del(struct device *parent,
 	const struct component_master_ops *ops)
 {
 	struct master *master;
 
 	mutex_lock(&component_mutex);
-	master = __master_find(dev, ops);
+	master = __master_find(parent, ops);
 	if (master) {
 		take_down_master(master);
 		free_master(master);
@@ -526,7 +521,7 @@ static void component_unbind(struct component *component,
 	WARN_ON(!component->bound);
 
 	if (component->ops && component->ops->unbind)
-		component->ops->unbind(component->dev, master->dev, data);
+		component->ops->unbind(component->dev, master->parent, data);
 	component->bound = false;
 
 	/* Release all resources claimed in the binding of this component */
@@ -535,14 +530,14 @@ static void component_unbind(struct component *component,
 
 /**
  * component_unbind_all - unbind all components of an aggregate driver
- * @master_dev: device with the aggregate driver
+ * @parent: parent device of the aggregate driver
  * @data: opaque pointer, passed to all components
  *
- * Unbinds all components of the aggregate @dev by passing @data to their
+ * Unbinds all components of the aggregate device by passing @data to their
  * &component_ops.unbind functions. Should be called from
  * &component_master_ops.unbind.
  */
-void component_unbind_all(struct device *master_dev, void *data)
+void component_unbind_all(struct device *parent, void *data)
 {
 	struct master *master;
 	struct component *c;
@@ -550,7 +545,7 @@ void component_unbind_all(struct device *master_dev, void *data)
 
 	WARN_ON(!mutex_is_locked(&component_mutex));
 
-	master = __master_find(master_dev, NULL);
+	master = __master_find(parent, NULL);
 	if (!master)
 		return;
 
@@ -573,7 +568,7 @@ static int component_bind(struct component *component, struct master *master,
 	 * This allows us to roll-back a failed component without
 	 * affecting anything else.
 	 */
-	if (!devres_open_group(master->dev, NULL, GFP_KERNEL))
+	if (!devres_open_group(master->parent, NULL, GFP_KERNEL))
 		return -ENOMEM;
 
 	/*
@@ -582,14 +577,14 @@ static int component_bind(struct component *component, struct master *master,
 	 * at the appropriate moment.
 	 */
 	if (!devres_open_group(component->dev, component, GFP_KERNEL)) {
-		devres_release_group(master->dev, NULL);
+		devres_release_group(master->parent, NULL);
 		return -ENOMEM;
 	}
 
-	dev_dbg(master->dev, "binding %s (ops %ps)\n",
+	dev_dbg(master->parent, "binding %s (ops %ps)\n",
 		dev_name(component->dev), component->ops);
 
-	ret = component->ops->bind(component->dev, master->dev, data);
+	ret = component->ops->bind(component->dev, master->parent, data);
 	if (!ret) {
 		component->bound = true;
 
@@ -600,16 +595,16 @@ static int component_bind(struct component *component, struct master *master,
 		 * can clean those resources up independently.
 		 */
 		devres_close_group(component->dev, NULL);
-		devres_remove_group(master->dev, NULL);
+		devres_remove_group(master->parent, NULL);
 
-		dev_info(master->dev, "bound %s (ops %ps)\n",
+		dev_info(master->parent, "bound %s (ops %ps)\n",
 			 dev_name(component->dev), component->ops);
 	} else {
 		devres_release_group(component->dev, NULL);
-		devres_release_group(master->dev, NULL);
+		devres_release_group(master->parent, NULL);
 
 		if (ret != -EPROBE_DEFER)
-			dev_err(master->dev, "failed to bind %s (ops %ps): %d\n",
+			dev_err(master->parent, "failed to bind %s (ops %ps): %d\n",
 				dev_name(component->dev), component->ops, ret);
 	}
 
@@ -618,14 +613,14 @@ static int component_bind(struct component *component, struct master *master,
 
 /**
  * component_bind_all - bind all components of an aggregate driver
- * @master_dev: device with the aggregate driver
+ * @parent: parent device of the aggregate driver
  * @data: opaque pointer, passed to all components
  *
  * Binds all components of the aggregate @dev by passing @data to their
  * &component_ops.bind functions. Should be called from
  * &component_master_ops.bind.
  */
-int component_bind_all(struct device *master_dev, void *data)
+int component_bind_all(struct device *parent, void *data)
 {
 	struct master *master;
 	struct component *c;
@@ -634,7 +629,7 @@ int component_bind_all(struct device *master_dev, void *data)
 
 	WARN_ON(!mutex_is_locked(&component_mutex));
 
-	master = __master_find(master_dev, NULL);
+	master = __master_find(parent, NULL);
 	if (!master)
 		return -EINVAL;
 
-- 
https://chromeos.dev

