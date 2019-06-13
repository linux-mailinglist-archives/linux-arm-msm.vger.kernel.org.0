Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99A624431B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:30:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391999AbfFMQ1V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:27:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:36556 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403765AbfFMQ1R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:17 -0400
Received: by mail-pf1-f196.google.com with SMTP id r7so6279739pfl.3;
        Thu, 13 Jun 2019 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=4q0HVXuQG17ks872jOkTIKAqD21+aLHXoXWPegnJvdQ=;
        b=KIQBhcVGmgiJ+25JjcqJ9tMu8LPz/C1psYpC5wyrJmzadCvcovqJZGLqt8+qJ1BF/5
         tPToBydwjBOnqzqZbE2hR/6beOAxQL9C0IievEXrtoXnD7OLHrs+mw4qdejaM5wSDTBG
         CLcmLzUkYxfz+AnyQw1a3fC24z9cyNuDzmexwu9/Vwo51eK0W41TqSuxRFIfI2j01xBW
         DEqV6PRuN1jntSaDch6yJtQ7xCLE2uy+3Qyb/9VHu5rjoydFOH4Z58/u51fOvqzFhMYL
         sMtccU1vG5n+dLZNpMs8j3+b+FZeurJ4Z/i7iuWdfllKkf2Nfa+X+aY1k8GFk6VTvSZL
         KCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=4q0HVXuQG17ks872jOkTIKAqD21+aLHXoXWPegnJvdQ=;
        b=kp+rqOzYPAN4J6ZspGktea+1xl2Cm2SPVgc4pLIJ3YNzlLLcNGZuZpFYdlq0BGrSMT
         MQqZAmFl1Q4JkJUKzOR4npuTDetvaUzjHKR2/GXy85IRJ1fTWdCsetfkiYoxL8f/1Joy
         CPBb1F4sg1eF8rJTUYdXIHivb7/++p+uIOl9iFpFFjTOgs4GEvUft1BO0/WyjTNLzZqH
         8JMivcRiCY++GfFBsCCUkr8TE0ak6VLim3FIuRBwWF7E08/l2P37BbJe1qmvJHnBc8Lg
         AEeIqp2C4IYhOnDhwQSNby2Z1gfOLTnGykx4bjxMXpvhPNuAZRDPR7OBv3VvaV5RhMt/
         ZIPw==
X-Gm-Message-State: APjAAAVxZAWF3dlYyR8/x1lU/zhAT3ZUeRBvKeLTGDVa1tHPly9ImpLK
        RjzWU/NVsFbRG190pKMFR+g=
X-Google-Smtp-Source: APXvYqxaBMg5bVhjUDBZsPXeyp3WVLYyOR0fUzELSMvjn8ql2xGJ98zarH9fUind6w2w+LFWAAHJSg==
X-Received: by 2002:a17:90a:216f:: with SMTP id a102mr6573720pje.29.1560443236390;
        Thu, 13 Jun 2019 09:27:16 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
        by smtp.gmail.com with ESMTPSA id n127sm282319pga.57.2019.06.13.09.27.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 09:27:15 -0700 (PDT)
From:   Yangtao Li <tiny.windzz@gmail.com>
To:     joro@8bytes.org, m.szyprowski@samsung.com, kgene@kernel.org,
        krzk@kernel.org, will.deacon@arm.com, robin.murphy@arm.com,
        agross@kernel.org, david.brown@linaro.org, robdclark@gmail.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 03/10] iommu/omap: convert to SPDX license tags
Date:   Thu, 13 Jun 2019 12:26:56 -0400
Message-Id: <20190613162703.986-3-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20190613162703.986-1-tiny.windzz@gmail.com>
References: <20190613162703.986-1-tiny.windzz@gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Updates license to use SPDX-License-Identifier.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/iommu/omap-iommu-debug.c | 5 +----
 drivers/iommu/omap-iommu.c       | 5 +----
 drivers/iommu/omap-iommu.h       | 5 +----
 drivers/iommu/omap-iopgtable.h   | 5 +----
 4 files changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/iommu/omap-iommu-debug.c b/drivers/iommu/omap-iommu-debug.c
index 4abc0ef522a8..55ec67a45101 100644
--- a/drivers/iommu/omap-iommu-debug.c
+++ b/drivers/iommu/omap-iommu-debug.c
@@ -1,13 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * omap iommu: debugfs interface
  *
  * Copyright (C) 2008-2009 Nokia Corporation
  *
  * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/err.h>
diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index d2fb347aa4ff..e6442876913f 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * omap iommu: tlb and pagetable primitives
  *
@@ -6,10 +7,6 @@
  *
  * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>,
  *		Paul Mundt and Toshihiro Kobayashi
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/dma-mapping.h>
diff --git a/drivers/iommu/omap-iommu.h b/drivers/iommu/omap-iommu.h
index 1703159ef5af..5256e17d86a7 100644
--- a/drivers/iommu/omap-iommu.h
+++ b/drivers/iommu/omap-iommu.h
@@ -1,13 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * omap iommu: main structures
  *
  * Copyright (C) 2008-2009 Nokia Corporation
  *
  * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef _OMAP_IOMMU_H
diff --git a/drivers/iommu/omap-iopgtable.h b/drivers/iommu/omap-iopgtable.h
index 01a315227bf0..871c2a38f453 100644
--- a/drivers/iommu/omap-iopgtable.h
+++ b/drivers/iommu/omap-iopgtable.h
@@ -1,13 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * omap iommu: pagetable definitions
  *
  * Copyright (C) 2008-2010 Nokia Corporation
  *
  * Written by Hiroshi DOYU <Hiroshi.DOYU@nokia.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #ifndef _OMAP_IOPGTABLE_H
-- 
2.17.0

