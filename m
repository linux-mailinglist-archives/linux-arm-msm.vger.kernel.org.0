Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97A6421F61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 May 2019 23:09:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729526AbfEQVJg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 May 2019 17:09:36 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:39319 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727108AbfEQVJ0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 May 2019 17:09:26 -0400
Received: by mail-pl1-f195.google.com with SMTP id g9so3873946plm.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 May 2019 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UnBJbIYE69zMGwO8poN8IDYOmff82X6EhsKpcU8MvMQ=;
        b=g7LzPxyH+LvPI6gCbyuPthanjuBTT5sBDNxHjvccQvOx19AaSrjT67G+RlhKKys9oV
         pG/2wHM5+/l/ltgaITw9JcI1ey8st1bO9vfHyhCxg0ptne3yPEKbdVKfGao+KZKykTkA
         El0JtBYeLKcptdg7g8X7VPUc7vsSkbKgBQR94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UnBJbIYE69zMGwO8poN8IDYOmff82X6EhsKpcU8MvMQ=;
        b=Tu+Bi5oLR1Vay2a0MbxUckDNnqGZLWXPxwLoNH8J/A1oqKsRiuUr9Vw2yhDVhzL4Qz
         +Ewn0C+zmkNqwJHfLtYJjVu5VFCWS5PcjU4NYwUP5U9doCGiZnVwW/2CetNfH4CBnmQz
         ktxqa1kKAKXV/gUhzKYLjI8qzysNpZGO4tIxIVKHG0BHsE8cmXIxnBanxVYrX7jBqsFz
         heYdMzwPZ+snhJILVB8q9AJwi1JxI+RgDlxRvDD80QBYpXVKMJ0AekAp5Wxc8Pb/uc4i
         6MLKugkC4F0Zw5GWttSUysfL28PuF6sznwuEsqaQfvyAWeaSbXMGdOy5y1srlP0B53Vo
         Jqow==
X-Gm-Message-State: APjAAAX6JQDlrvXJAVF4LOB90L921omTsEu/bqsgkJQYO6cFF/UmcuPp
        YIAwSnl/vMSwztbzaS7tq/FaHg==
X-Google-Smtp-Source: APXvYqzt+2QTyd1NBsT69B9i+E7J5DJu/DXqehYKxdE+JFn0L1xTEJQGTfYwt14XNlqiLAT+fN3Ylw==
X-Received: by 2002:a17:902:704c:: with SMTP id h12mr4735064plt.65.1558127365770;
        Fri, 17 May 2019 14:09:25 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id q142sm7890448pfc.27.2019.05.17.14.09.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 May 2019 14:09:25 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Ian Jackson <ian.jackson@citrix.com>,
        Julien Grall <julien.grall@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Subject: [PATCH 1/3] firmware: qcom_scm: Use proper types for dma mappings
Date:   Fri, 17 May 2019 14:09:21 -0700
Message-Id: <20190517210923.202131-2-swboyd@chromium.org>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <23774.56553.445601.436491@mariner.uk.xensource.com>
References: <23774.56553.445601.436491@mariner.uk.xensource.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We need to use the proper types and convert between physical addresses
and dma addresses here to avoid mismatch warnings. This is especially
important on systems with a different size for dma addresses and
physical addresses. Otherwise, we get the following warning:

  drivers/firmware/qcom_scm.c: In function "qcom_scm_assign_mem":
  drivers/firmware/qcom_scm.c:469:47: error: passing argument 3 of "dma_alloc_coherent" from incompatible pointer type [-Werror=incompatible-pointer-types]

We also fix the size argument to dma_free_coherent() because that size
doesn't need to be aligned after it's already aligned on the allocation
size. In fact, dma debugging expects the same arguments to be passed to
both the allocation and freeing sides of the functions so changing the
size is incorrect regardless.

Reported-by: Ian Jackson <ian.jackson@citrix.com>
Cc: Ian Jackson <ian.jackson@citrix.com>
Cc: Julien Grall <julien.grall@arm.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Avaneesh Kumar Dwivedi <akdwived@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/firmware/qcom_scm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index af4eee86919d..0c63495cf269 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -18,6 +18,7 @@
 #include <linux/init.h>
 #include <linux/cpumask.h>
 #include <linux/export.h>
+#include <linux/dma-direct.h>
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/types.h>
@@ -449,6 +450,7 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	phys_addr_t mem_to_map_phys;
 	phys_addr_t dest_phys;
 	phys_addr_t ptr_phys;
+	dma_addr_t ptr_dma;
 	size_t mem_to_map_sz;
 	size_t dest_sz;
 	size_t src_sz;
@@ -466,9 +468,10 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 	ptr_sz = ALIGN(src_sz, SZ_64) + ALIGN(mem_to_map_sz, SZ_64) +
 			ALIGN(dest_sz, SZ_64);
 
-	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_phys, GFP_KERNEL);
+	ptr = dma_alloc_coherent(__scm->dev, ptr_sz, &ptr_dma, GFP_KERNEL);
 	if (!ptr)
 		return -ENOMEM;
+	ptr_phys = dma_to_phys(__scm->dev, ptr_dma);
 
 	/* Fill source vmid detail */
 	src = ptr;
@@ -498,7 +501,7 @@ int qcom_scm_assign_mem(phys_addr_t mem_addr, size_t mem_sz,
 
 	ret = __qcom_scm_assign_mem(__scm->dev, mem_to_map_phys, mem_to_map_sz,
 				    ptr_phys, src_sz, dest_phys, dest_sz);
-	dma_free_coherent(__scm->dev, ALIGN(ptr_sz, SZ_64), ptr, ptr_phys);
+	dma_free_coherent(__scm->dev, ptr_sz, ptr, ptr_dma);
 	if (ret) {
 		dev_err(__scm->dev,
 			"Assign memory protection call failed %d.\n", ret);
-- 
Sent by a computer through tubes

