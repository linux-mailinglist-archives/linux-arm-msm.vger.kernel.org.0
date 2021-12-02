Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08522466C2E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Dec 2021 23:27:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349201AbhLBWbE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Dec 2021 17:31:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349324AbhLBWbD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Dec 2021 17:31:03 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EECC06175A
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Dec 2021 14:27:40 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id o4so915722pfp.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Dec 2021 14:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+OZEUzbJkhEl2ueO+0tubjfHfZwZ/3lRZTTLw8nIUe4=;
        b=hc4JGce2pZd1DWKE774zOsNlhycYp1UvUWX6JaKj7jkGVvKn09HeEo7ZeEZwH6iH84
         6lnSrvPwcvrHX7MVjsAsHF7vhLTuJNPOa1CHcN2Pa6KWDtVndA4i97T1Noic7mdhhGt1
         rrPEQOT78bWT9O/4PWfmzKoteAtSm/JQq1Gmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+OZEUzbJkhEl2ueO+0tubjfHfZwZ/3lRZTTLw8nIUe4=;
        b=UCvRHlvLbarH65dn1kaNiSuXKkQBIuJs+CC0SeZekc9av7MCkL3q2LZD2dK3xIZ91Z
         p1jPvJaRF9L330dQfCr6lRb6haQffo1iAobI73E1eyPQYdNOkwwwq6CxvUXrRjzdXozV
         g5rM4lMv6a8zV69mxkciM+lVdCcX308MJh2EFcykJFrXHOlEKKDkFpZHz4lLX6VyzDHk
         4HksajpJjmn3/sWMkehgOm97AsbAEcFDU7ls9nn94ZwlsgChcCenNc+5XMwEbT3E4PBi
         C37lnxrR1rKGPjnucDeVVAJbeX30tQKLa33OtsJDMgQAoINcT/VQN8UONdjZLt5sXRxa
         KD3g==
X-Gm-Message-State: AOAM530h2GJ9XIdULN+DgBDdO4W9NbKQ46Ii8/XiqmuSSd094/r7surA
        WHhRNluGopGriGS8V5KKxLKLfw==
X-Google-Smtp-Source: ABdhPJwiY55jDA28x9n5iZ6VVhrQyYsyqFFR5L0DFKk6xLstxRqZjnkU4tFz0X8NjRuNCvXhZFCd+w==
X-Received: by 2002:a65:5ac8:: with SMTP id d8mr1555647pgt.258.1638484059598;
        Thu, 02 Dec 2021 14:27:39 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:f4f2:1b7e:5aea:bf3c])
        by smtp.gmail.com with ESMTPSA id q9sm836934pfj.9.2021.12.02.14.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 14:27:39 -0800 (PST)
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
Subject: [PATCH v4 04/34] component: Move struct aggregate_device out to header file
Date:   Thu,  2 Dec 2021 14:27:02 -0800
Message-Id: <20211202222732.2453851-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.0.384.gca35af8252-goog
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
References: <20211202222732.2453851-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This allows aggregate driver writers to use the device passed to their
probe/remove/shutdown functions properly instead of treating it as an
opaque pointer.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c  | 15 ---------------
 include/linux/component.h | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index eec82caeae5e..dc38a8939ae6 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -56,21 +56,6 @@ struct component_match {
 	struct component_match_array *compare;
 };
 
-struct aggregate_device {
-	const struct component_master_ops *ops;
-	struct device *parent;
-	struct device dev;
-	struct component_match *match;
-	struct aggregate_driver *adrv;
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
index 95d1b23ede8a..e99cf8e910f0 100644
--- a/include/linux/component.h
+++ b/include/linux/component.h
@@ -5,6 +5,8 @@
 #include <linux/stddef.h>
 #include <linux/device.h>
 
+struct component_match;
+
 /**
  * struct component_ops - callbacks for component drivers
  *
@@ -39,8 +41,6 @@ void component_del(struct device *, const struct component_ops *);
 int component_bind_all(struct device *master, void *master_data);
 void component_unbind_all(struct device *master, void *master_data);
 
-struct aggregate_device;
-
 /**
  * struct component_master_ops - callback for the aggregate driver
  *
@@ -80,7 +80,20 @@ struct component_master_ops {
 	void (*unbind)(struct device *master);
 };
 
-struct component_match;
+struct aggregate_device {
+	const struct component_master_ops *ops;
+	struct device *parent;
+	struct device dev;
+	struct component_match *match;
+	struct aggregate_driver *adrv;
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

