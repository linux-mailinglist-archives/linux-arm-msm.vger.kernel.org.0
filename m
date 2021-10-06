Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B99C42474D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 21:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239751AbhJFTma (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Oct 2021 15:42:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239539AbhJFTmH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Oct 2021 15:42:07 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CC7C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Oct 2021 12:39:03 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so5182685pjc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Oct 2021 12:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ot2+ntvoFG4rsH4e1sE1QMW5zjuXqRNCEhlTLCik2wM=;
        b=ZMhQIHtNA4/kV1vlNC99CTawkyKetOhHUYakJmO72VYU9TrfpZBzPPLUDYYFReVk3e
         Pom8N145OWgM8buTFKaH7OBf+pPgQzvJcfKcEX4AjvV0g0cy0C30dy8iPjzkw5jEF8z3
         R5paxhucwDP6aHXmIJicXt2jbvOk9XRtrlCMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ot2+ntvoFG4rsH4e1sE1QMW5zjuXqRNCEhlTLCik2wM=;
        b=vLIMwPmBwfF7KYJYPeHK50YBiZv1HoN9rDStp35x1ai4KIZ7HtY9c1H2dEYolsXHas
         60e7NRsLx4bgCFb7UpyNBNW/wNZu3GJENVC1vdSQoQMW4OR+sZihc+QqLjmORirdm0Mh
         giMaRVha1HNpnB7sTy7sE57E854SgOpDhjQcqoDOX0Q6G5wSYZIaJT6o25bu95wUoxJP
         OQLrTaP/zLkEDr57BXHLRVAlJ9czu0NEmzds+y8g/JhpcMMyp7UZX6TExr0IhHHJzALQ
         3XN8FxcMEd73j2sxe9mM4LDFJcLc6/WzeqzqbuXT+UME2INb8+CAohe11ybcBPacEAjf
         yW6A==
X-Gm-Message-State: AOAM530uODOld+rPeHa6mdhx4eov4iN9hKljQlSitULDsQ5fX2bUJYCj
        /g+Xki9KU5GOmTtwvJCscTt1cg==
X-Google-Smtp-Source: ABdhPJxkLFmtSoPOhMgZhiIHEnf6+SjN1wfSYnzctXTRYdCeWsjvLvOF8AP6gzVDYc69tY/rt6+66g==
X-Received: by 2002:a17:90b:1b0b:: with SMTP id nu11mr80066pjb.103.1633549142676;
        Wed, 06 Oct 2021 12:39:02 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:d412:c5eb:4aca:4738])
        by smtp.gmail.com with ESMTPSA id o14sm22011296pfh.84.2021.10.06.12.39.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 12:39:02 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        Saravana Kannan <saravanak@google.com>
Subject: [PATCH v2 34/34] component: Remove all references to 'master'
Date:   Wed,  6 Oct 2021 12:38:19 -0700
Message-Id: <20211006193819.2654854-35-swboyd@chromium.org>
X-Mailer: git-send-email 2.33.0.800.g4c38ced690-goog
In-Reply-To: <20211006193819.2654854-1-swboyd@chromium.org>
References: <20211006193819.2654854-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove all references to 'master' in the code now that we've migrated
all the users of the ops structure to the aggregate driver.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/base/component.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/base/component.c b/drivers/base/component.c
index 939862b25b10..75323d35773c 100644
--- a/drivers/base/component.c
+++ b/drivers/base/component.c
@@ -1,11 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Componentized device handling.
- *
- * This is work in progress.  We gather up the component devices into a list,
- * and bind them when instructed.  At the moment, we're specific to the DRM
- * subsystem, and only handles one master device, but this doesn't have to be
- * the case.
  */
 #include <linux/component.h>
 #include <linux/device.h>
@@ -119,23 +114,23 @@ static int __init component_debug_init(void)
 
 core_initcall(component_debug_init);
 
-static void component_master_debugfs_add(struct aggregate_device *m)
+static void component_debugfs_add(struct aggregate_device *m)
 {
 	debugfs_create_file(dev_name(m->parent), 0444, component_debugfs_dir, m,
 			    &component_devices_fops);
 }
 
-static void component_master_debugfs_del(struct aggregate_device *m)
+static void component_debugfs_del(struct aggregate_device *m)
 {
 	debugfs_remove(debugfs_lookup(dev_name(m->parent), component_debugfs_dir));
 }
 
 #else
 
-static void component_master_debugfs_add(struct aggregate_device *m)
+static void component_debugfs_add(struct aggregate_device *m)
 { }
 
-static void component_master_debugfs_del(struct aggregate_device *m)
+static void component_debugfs_del(struct aggregate_device *m)
 { }
 
 #endif
@@ -343,7 +338,7 @@ EXPORT_SYMBOL(component_match_add_release);
  * @compare_typed: compare function to match against all typed components
  * @compare_data: opaque pointer passed to the @compare function
  *
- * Adds a new component match to the list stored in @matchptr, which the @master
+ * Adds a new component match to the list stored in @matchptr, which the
  * aggregate driver needs to function. The list of component matches pointed to
  * by @matchptr must be initialized to NULL before adding the first match. This
  * only matches against components added with component_add_typed().
@@ -367,7 +362,7 @@ static void free_aggregate_device(struct aggregate_device *adev)
 	struct component_match *match = adev->match;
 	int i;
 
-	component_master_debugfs_del(adev);
+	component_debugfs_del(adev);
 
 	if (match) {
 		for (i = 0; i < match->num; i++) {
@@ -548,7 +543,7 @@ static struct aggregate_device *aggregate_device_add(struct device *parent,
 		return ERR_PTR(ret);
 	}
 
-	component_master_debugfs_add(adev);
+	component_debugfs_add(adev);
 
 	return adev;
 }
-- 
https://chromeos.dev

