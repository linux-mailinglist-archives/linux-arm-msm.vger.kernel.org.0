Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC9480BAD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Aug 2019 18:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfHDQYc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Aug 2019 12:24:32 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41161 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726206AbfHDQYc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Aug 2019 12:24:32 -0400
Received: by mail-pg1-f193.google.com with SMTP id x15so28076356pgg.8;
        Sun, 04 Aug 2019 09:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cZeBnpYmONo0s7L5W0iy8cP0PQ+zZF6B8fmLCtt7ggo=;
        b=lpp4MtdY7v54RF4SywPn9NqI/hW980Al2LmT0eCWdZWrbJ3wHmoU9kGwmbig/DtHnS
         ucw8f/l7IMbzAAJJfStWwUxwqqLjQK8/bvucOuuEu4j2ecSbEuQ+mZ1Rl//DayYQsM1W
         Rpxrdgvow4ksYxQG3J3OrF0uq8UobtzyHJAan/ouO8r2Y4plbuWkSCmXOC1lA1LVsZ7G
         Btj2A07e4vvRQTla0BPWit8KAZYvHd9coPrycjKTCqDMkXcQIIctHNhjz3YrdBYygNP5
         QM6S/eu1gZ+TKXxCq+pYHA4JQDplAFntvkm1HWsO9RpHgRzdjcTWIXuLafhKM0kyNlZg
         Tczg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cZeBnpYmONo0s7L5W0iy8cP0PQ+zZF6B8fmLCtt7ggo=;
        b=WvfBzrZElJX6qbTQFdG9hh4dYtPzXkgsDpcpJK5F2XxDtN/sCX5OBFl3VZz5hb1w5X
         WKJ4fJ+lYK56vQYv+dW98XOqYgz2Xr4DC6E5mwxihL0Qk0KJrz2VvQ7c023V5KOz2ZtI
         Vkc9s5iqr0EpQUMe/vdgJEEmVi8OD8FzOxqWv2SGk4wxskUgmEWHuy9Y92M6CZAgVIn3
         CWeBLe4HeKTKDZAzrojH4QkfZ52lIa2XNls2CqJoMCGavpBSuo7bF+w2Jo1Z0LvVzC2E
         OnNcJVluc27edB8F1s6pYzShiU3B/qtg7Hj7hJCMbXKe2Iv4PG6Hv/W/1yZ353GpK2cm
         DOkA==
X-Gm-Message-State: APjAAAVmo4MgooCPNcPXKCAJJR2FHGeO0CKdD0TEVKi2btJ7Dz6NUbOX
        HERc27X5+hyRh0ePXor52A5vs6c6cU4=
X-Google-Smtp-Source: APXvYqyELApgtKkfgYPAPOEJjxO6X5pq5qokemjPgqGEY+umSMcei11+jC/aKYIICUOzQtG/Zuj3xA==
X-Received: by 2002:aa7:9834:: with SMTP id q20mr70098022pfl.196.1564935871962;
        Sun, 04 Aug 2019 09:24:31 -0700 (PDT)
Received: from localhost.localdomain ([122.163.105.8])
        by smtp.gmail.com with ESMTPSA id v10sm80530006pfe.163.2019.08.04.09.24.29
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 04 Aug 2019 09:24:31 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     agross@kernel.org, kishon@ti.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] phy: qualcomm: phy-qcom-qmp: Add of_node_put() before return
Date:   Sun,  4 Aug 2019 21:54:20 +0530
Message-Id: <20190804162420.6005-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each iteration of for_each_available_child_of_node puts the previous
node, but in the case of a return from the middle of the loop, there is
no put, thus causing a memory leak. Hence add an of_node_put before the
return in two places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
index 34ff6434da8f..2f0652efebf0 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
@@ -2094,6 +2094,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 			dev_err(dev, "failed to create lane%d phy, %d\n",
 				id, ret);
 			pm_runtime_disable(dev);
+			of_node_put(child);
 			return ret;
 		}
 
@@ -2106,6 +2107,7 @@ static int qcom_qmp_phy_probe(struct platform_device *pdev)
 			dev_err(qmp->dev,
 				"failed to register pipe clock source\n");
 			pm_runtime_disable(dev);
+			of_node_put(child);
 			return ret;
 		}
 		id++;
-- 
2.19.1

