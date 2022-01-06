Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B061F486C2C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 22:46:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244479AbiAFVqM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jan 2022 16:46:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244427AbiAFVqE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jan 2022 16:46:04 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 186E5C061212
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jan 2022 13:46:04 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id l16-20020a17090a409000b001b2e9628c9cso4537929pjg.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jan 2022 13:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+OZEUzbJkhEl2ueO+0tubjfHfZwZ/3lRZTTLw8nIUe4=;
        b=QdNjIAobt/derYc6c3Gs9KGKe+gcE2F48axRhJXhDfWd037tfkRhiOvU+6INALe1xW
         l0X9pnu/3HJXfqPLowTbh129vmKQPv4Yba8RdqPUG4CGzbjJgcRNO4VLW6C4/gLrecXc
         hkmq4B3C/LNmQfiTrtbuw0RBZRXj4anmUvV3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+OZEUzbJkhEl2ueO+0tubjfHfZwZ/3lRZTTLw8nIUe4=;
        b=PNpYp9FAl1N55Z24jzLaFG9SCkezfVS9EkEkm1/TU5ovMX9dtrmKNrIxzaVyI8iViz
         EVA9jccahsp5SXf6c78S8bYATuUDhwDJWntJS6HrbYzhwNTR9qqbElqleVqf3Wz3pJSC
         ZJNxoTeMoMUZYgbV2CNiWhy0hO5J3NM4LHQ+4h9I2mI2xsCKOz84Nif19qCvNY2oJFkH
         gkOLaTzExpcisKPb6fXm5uRw2+xhpQoHvXMdjMjRU9crTmkRGaT1Nd6kXwVPr1ww3bIQ
         yD57Frbd3Rx8egzX4BeMFbRZWHjRMYb8zcTQk2idVN4lkq+zMZiun27BdtlgVYtt7nBq
         laZQ==
X-Gm-Message-State: AOAM532Nll6+QyOXBmH6x0SNJ9anQWfdXVURkwqQTa+JHA87Pq5Izd5G
        a7++dZL4+bBw987OYi/siOfDyQ==
X-Google-Smtp-Source: ABdhPJx2Rn+if/ljePBBBfU5FyTBFf4xXawEJ++3znnA8VPOwm/9Zu1BwYB/KNJZYwq/dJQOifJsIA==
X-Received: by 2002:a17:90b:384a:: with SMTP id nl10mr12390792pjb.203.1641505563694;
        Thu, 06 Jan 2022 13:46:03 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:1ebe:a8fd:f9b0:7e85])
        by smtp.gmail.com with ESMTPSA id 10sm3539960pfm.56.2022.01.06.13.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jan 2022 13:46:03 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v5 03/32] component: Move struct aggregate_device out to header file
Date:   Thu,  6 Jan 2022 13:45:26 -0800
Message-Id: <20220106214556.2461363-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
In-Reply-To: <20220106214556.2461363-1-swboyd@chromium.org>
References: <20220106214556.2461363-1-swboyd@chromium.org>
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

