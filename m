Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC9744338
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733013AbfFMQ1u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:27:50 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37194 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732764AbfFMQ1h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:37 -0400
Received: by mail-pf1-f196.google.com with SMTP id 19so11329401pfa.4;
        Thu, 13 Jun 2019 09:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=qmE6RcMdl/q+0c881KvtGIqeACQmyD2joLL+qnIqt7s=;
        b=ky0C6UzAre6s7Pe1an8KXFMZ/n8er3ta59i58tFn/r47l49NZ1VN9+rM4j58jiwZm9
         BUUw6IU+xEyg4pe+tDNRlfgA9svhmO2wxcbkJHrqtHDfZDb2fj7DY5Cf4VvjoboR7CIX
         OeBNbMOECRVKcWg9TZsdtgQHWp3yDmtksofWOyLU40oMHr3faQ0ik2GBZUko6/swbKHv
         7RGjJPXVHsRByfrTzTawZilS9vgW8lWz++Xf6nhndTHMDV4ESOIq73Px9aaMRrSMifOz
         BJF/jAQU3fP5h6BPGIHukh63y8OJ7SKf0mw8j8hSxtoXwtnawYConS3vgXuTarhLoGEO
         KZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=qmE6RcMdl/q+0c881KvtGIqeACQmyD2joLL+qnIqt7s=;
        b=kXF84I8Bm/8iEd1hpRSEViTqMSv8xpOFA0Xo3x09s7SEsV7YmqP3a/JgBhuicedHIf
         RtcRxadkUiPtMAwxVY5n+Rhfw09S/etfF7+EvX6iYJL87fcT5VxlOk32WQDrt6bza/fo
         D2j8qf5QGX3MfUQ2kj3jObtJ5m6TRShUHJrPInJZ6GUHlu0kLO7bzkY0ES9uUcfCj1WS
         T1yIIIYfyOLaA9XiERnAWdSfA7AUjL4dLm2cBSlJwmrW0/wrkblzS+HnJjhqaN+LsmkM
         6nN6ytGK9slfBQ0+0uz8LvQYbkzEFo4nh42IrC9KD/Da9mWcz5aj8hJgwDdf7pu7wZMf
         6Y6A==
X-Gm-Message-State: APjAAAWg784Aj/mj93vnSfHFoUoWSgJt07gL8vq7A4OYH999AR0ZG5Np
        amEXHnzFmAAV8T36V5/VEOU=
X-Google-Smtp-Source: APXvYqxNXSVIQgcvlSSbelNewR4QAEP4WL6URSrkeuuhpNYR//oQq+uySr22HwqTovLEfyCOwtfKXQ==
X-Received: by 2002:a63:3c9:: with SMTP id 192mr25962053pgd.90.1560443256920;
        Thu, 13 Jun 2019 09:27:36 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
        by smtp.gmail.com with ESMTPSA id r11sm294291pgs.39.2019.06.13.09.27.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 09:27:36 -0700 (PDT)
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
Subject: [PATCH 09/10] iommu/rockchip: convert to SPDX license tags
Date:   Thu, 13 Jun 2019 12:27:02 -0400
Message-Id: <20190613162703.986-9-tiny.windzz@gmail.com>
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
 drivers/iommu/rockchip-iommu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 77d4bd93fe4b..9c4c6eb7d42b 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * IOMMU API for Rockchip
  *
  * Module Authors:	Simon Xue <xxm@rock-chips.com>
  *			Daniel Kurtz <djkurtz@chromium.org>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/clk.h>
-- 
2.17.0

