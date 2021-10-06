Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37FFE4246D1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239520AbhJFTke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239455AbhJFTk1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:40:27 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6EF7C06176A
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:38:31 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id kk10so3025526pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TrXWSXEHZSSe+ZNP0MEWDrKg7JGFcV3ZLPK0R/nqLBY=;
        b=BYGV2YJoDO3XYhcc2ImhdpJbxGgocl9uyQLt3U1WbZvj0WL1FshJVPAYJb1NRelDJX
         xSs8FKrvBjdPyW8re4vl4F7WY1oqMfj+MzapTE21WGwzZRESm3Pj2S10sX9mNELTef+/
         tz9fcvBz3MaIYvACyA/0R/zTO0Xrz9+s4yWuk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TrXWSXEHZSSe+ZNP0MEWDrKg7JGFcV3ZLPK0R/nqLBY=;
        b=RqX4i4wiIYL2gVR7I9j2wI7jlibq/p/Anrm3BjIkgFZ1qaD00oclNp0oiNYL1W7utT
         qlRfCM++uXGxDJwFwP1H+fiCU69yly94QmZpaUIjHYYTM1aEkuwjjUXVhxCzdrMh5Z+C
         il0hjUDoqHwofWC+Rnu7gzW5DxiFp3ofV2AHEfGev53aQdl2CPYkokwHah0/Yel4LOSt
         sYT84yipABChK8PcQwlLprT4CYb+fkfMoAkAJKRli1EjDM0trkW4fk9jCuQ/U8Dxx8fx
         rCtY8GnjtkCbxWwZJP8QeMXEe5gtYhj6TgKOVoY39VJaa+AKxWnAQ4+N+wzIMJ9LH/Oz
         /Y2A==
X-Gm-Message-State: AOAM532/rT7aBo1/eSUdZr3aVZ8I5nQnCH6MdF4QUyfaHEn1aeGP3LVs
        NoA42M58G4Uqo2BPahgxM5bRgw==
X-Google-Smtp-Source: ABdhPJzmaWGAcSqzevd1G0esgXTcACMs0ekVu6jIQ64fXf44o8eRUL2dBeO9lQ2MaAbCFARLQI3HAg==
X-Received: by 2002:a17:902:bf07:b0:138:e32d:9f2e with SMTP id bi7-20020a170902bf0700b00138e32d9f2emr12466282plb.59.1633549106864;
        Wed, 06 Oct 2021 12:38:26 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:38:26 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 03/34] component: Move struct aggregate_device out to header file
Date:   Wed,  6 Oct 2021 12:37:48 -0700
Message-Id: <20211006193819.2654854-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
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
 drivers/base/component.c  | 15 ---------------
 include/linux/component.h | 19 ++++++++++++++++---
 2 files changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index d99e99cabb99..f49b48695c8f 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -62,21 +62,6 @@ struct component_match {
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

