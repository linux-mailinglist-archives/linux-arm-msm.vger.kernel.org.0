Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D63A144327
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:30:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731247AbfFMQ1a (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:27:30 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33817 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392396AbfFMQ12 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:28 -0400
Received: by mail-pl1-f196.google.com with SMTP id i2so8368446plt.1;
        Thu, 13 Jun 2019 09:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jzRIWp8sjvta+E1GyPP4P8N5byAmizxIfWuhxK6cbfw=;
        b=Hu385w6EtH5CYuRhgbP11gNSmmeNm2mqhecXis7zbgcdfqeJgxUK2+mvXCRVvaGiNz
         Z7j2bS5kQHHqOpwmcjBC/t4hjw1Pz0VPYlDDRwL4k24b03dOHX89NXThVUV4wZB0LX9I
         TlT1LPFkT+Kix2FJQVJXSStbnFVm6Y6TAgpTQEzoA1YrP2hkSxgTxJUbVXz2ojngVaEt
         +lsGxMtUQO8XxgYNwBAd6NNqiECPxDt0h2jaRoMlmXdrMA/EJipXhCA9b+Q5dktea4dx
         s8qHZQu3bov7P+YH8mhwdO0kdFM5f51VyKWG4lZOkXqRnZst+OrCWDHWzbD441dKvF3Z
         0Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jzRIWp8sjvta+E1GyPP4P8N5byAmizxIfWuhxK6cbfw=;
        b=UIorc+l/RZAEsGqZNcXximIhAT6CZ1zi/p+v084OloheIGdnTD9M1MJN20c7MwztvD
         sYf83hBtt5qgLNuDJcVGSnAP2BJRKnb57OlOcxDkEWC9T/uetlYHCrXDyQcICUzpRwWo
         b1KNhWP01tI3q074Q5Dd9Gd+EncG/Ge2aSjctSr+JIeje4O3Amc4ffsZW/S+CYwou1fo
         T/Tz+sTccbK1tlfN6p6KE5OBD7eqSrjm2vJpXBlXxHpz7Wb9kxBgPMaJ6DNf5LpKk7F9
         cMRxVEOIckRpQgms6Q5JE7DkDKALxuPRDsCGf20lZ5q7Qqu49V3YEljJe3o9MvgDuqXH
         J/dw==
X-Gm-Message-State: APjAAAW7At8jSxPrmxL5V7ijwlRMo1G2SR8BcBXoRQfNyguL4dJsUjb4
        0gI6bynBQYZCnN6rFWOONQo=
X-Google-Smtp-Source: APXvYqyWo/fan+upwuWjeJEQ+9bFsdtSKc6ZRW1lB3ZdlcdwZgQYZ6AcEoo3rKRnpeNvJsgWS9Wpww==
X-Received: by 2002:a17:902:54d:: with SMTP id 71mr86570437plf.140.1560443247944;
        Thu, 13 Jun 2019 09:27:27 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
        by smtp.gmail.com with ESMTPSA id w1sm177958pfg.51.2019.06.13.09.27.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 09:27:27 -0700 (PDT)
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
Subject: [PATCH 06/10] iommu/io-pgtable-arm-v7s: convert to SPDX license tags
Date:   Thu, 13 Jun 2019 12:26:59 -0400
Message-Id: <20190613162703.986-6-tiny.windzz@gmail.com>
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
 drivers/iommu/io-pgtable-arm-v7s.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-v7s.c b/drivers/iommu/io-pgtable-arm-v7s.c
index 9a8a8870e267..fd0c8f2def45 100644
--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * CPU-agnostic ARM page table allocator.
  *
@@ -14,18 +15,6 @@
  * - PXN
  * - Domains
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- *
  * Copyright (C) 2014-2015 ARM Limited
  * Copyright (c) 2014-2015 MediaTek Inc.
  */
-- 
2.17.0

