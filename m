Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CECF21BF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 18:48:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfEQQsG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 12:48:06 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:37262 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbfEQQry (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 12:47:54 -0400
Received: by mail-pl1-f193.google.com with SMTP id p15so3611326pll.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 09:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CqKPKWAOqqK2fAPeJ19AHkkbMpccuE5V5twNlxY2yj4=;
        b=l5axbd7GCjC8UzCQX6le433fYI5Gy+AP17dysVHzpJd5K1V3v/AHW4gWkJNCz7RvkX
         U/Da5n4quZkQBum7RcbcB/GoUQGFlxfPOuZ2L8sPSnntSKwbhQY1PEaQHXxJ91PjHzMn
         phj4VIypQewbe385bAXnxglk7G8q2eho9KcGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CqKPKWAOqqK2fAPeJ19AHkkbMpccuE5V5twNlxY2yj4=;
        b=F3/5V0rq7Co3LNmXQ6tzqb2/l56oybxCJsXmAcPB+nI9HADwyVz010+ANEMzckBJnu
         dwMUXjSGAjj98ocdyUgLstVYE5r4EpTPugIEjxNZnMqzu4FfZjUZTMWVDqcnzuD/ePY4
         Y7j4auMvWJY7WfOZcruFR4vACbxuhr/oIPVqp+MA49Jap3jH6oaMWmLzDZj3QXUqZdD1
         YrTEaw6ru2IN2vllA80nlCy1ewQUzvGu5eWv4SXh9ZQjaDHtUxolZmAOQQzikIwZVYUQ
         7Oh9/s7/kcZCPKHmLy02b2QT3ilMpIj5PvITSAItAUvPbyL2p2KJdKwcnOza8Ce1WGWp
         5OsA==
X-Gm-Message-State: APjAAAVcUFaXGstk3PKYSyrHsYyXZBGo+MX/OA5IryKsY1uxYdpOW4d+
        v2EkpL+uzcf5AhbAs4Q0hcdUzA==
X-Google-Smtp-Source: APXvYqyAp8uRsjVVx2sdnL7aIY5IBJRUMYDjonUYiJUCfdadaA7UoNqRxgke+HnZZ6Yy3quetwwBow==
X-Received: by 2002:a17:902:ac98:: with SMTP id h24mr1729914plr.265.1558111673755;
        Fri, 17 May 2019 09:47:53 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id l141sm12229810pfd.24.2019.05.17.09.47.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 09:47:53 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Evan Green <evgreen@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dan Williams <dan.j.williams@intel.com>
Subject: [RFC/PATCH 3/5] memremap: Add support for read-only memory mappings
Date:   Fri, 17 May 2019 09:47:44 -0700
Message-Id: <20190517164746.110786-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190517164746.110786-1-swboyd@chromium.org>
References: <20190517164746.110786-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Sometimes we have memories that are supposed to be read-only, but when
we map these regions the best we can do is map them as write-back with
MEMREMAP_WB. Introduce a read-only memory mapping (MEMREMAP_RO) that
allows us to map reserved memory regions as read-only. This way, we're
less likely to see these special memory regions become corrupted by
stray writes to them.

Cc: Evan Green <evgreen@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Will Deacon <will.deacon@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 include/linux/io.h |  1 +
 kernel/iomem.c     | 15 +++++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/linux/io.h b/include/linux/io.h
index 32e30e8fb9db..16c7f4498869 100644
--- a/include/linux/io.h
+++ b/include/linux/io.h
@@ -159,6 +159,7 @@ enum {
 	MEMREMAP_WC = 1 << 2,
 	MEMREMAP_ENC = 1 << 3,
 	MEMREMAP_DEC = 1 << 4,
+	MEMREMAP_RO = 1 << 5,
 };
 
 void *memremap(resource_size_t offset, size_t size, unsigned long flags);
diff --git a/kernel/iomem.c b/kernel/iomem.c
index f7525e14ebc6..8d3cf74a32cb 100644
--- a/kernel/iomem.c
+++ b/kernel/iomem.c
@@ -19,6 +19,13 @@ static void *arch_memremap_wb(resource_size_t offset, unsigned long size)
 }
 #endif
 
+#ifndef arch_memremap_ro
+static void *arch_memremap_ro(resource_size_t offset, unsigned long size)
+{
+	return NULL;
+}
+#endif
+
 #ifndef arch_memremap_can_ram_remap
 static bool arch_memremap_can_ram_remap(resource_size_t offset, size_t size,
 					unsigned long flags)
@@ -84,7 +91,10 @@ void *memremap(resource_size_t offset, size_t size, unsigned long flags)
 	}
 
 	/* Try all mapping types requested until one returns non-NULL */
-	if (flags & MEMREMAP_WB) {
+	if ((flags & MEMREMAP_RO) && is_ram != REGION_INTERSECTS)
+		addr = arch_memremap_ro(offset, size);
+
+	if (!addr && (flags & MEMREMAP_WB)) {
 		/*
 		 * MEMREMAP_WB is special in that it can be satisifed
 		 * from the direct map.  Some archs depend on the
@@ -103,7 +113,8 @@ void *memremap(resource_size_t offset, size_t size, unsigned long flags)
 	 * address mapping.  Enforce that this mapping is not aliasing
 	 * System RAM.
 	 */
-	if (!addr && is_ram == REGION_INTERSECTS && flags != MEMREMAP_WB) {
+	if (!addr && is_ram == REGION_INTERSECTS &&
+	    (flags != MEMREMAP_WB || flags != MEMREMAP_RO)) {
 		WARN_ONCE(1, "memremap attempted on ram %pa size: %#lx\n",
 				&offset, (unsigned long) size);
 		return NULL;
-- 
Sent by a computer through tubes

