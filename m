Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B9C24431F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:30:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732587AbfFMQ10 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:27:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41146 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731247AbfFMQ1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:25 -0400
Received: by mail-pl1-f195.google.com with SMTP id s24so8351791plr.8;
        Thu, 13 Jun 2019 09:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+uAxJSSMcJzrTyyAujU7IWsabWssr7wxWhZR9Nz/dEI=;
        b=mjcoCpLnewM+pZoDokMZAPSV/jh4geTMwUOmHG9y9n54CNHb+seQlWHkRh0LfXU2kG
         M1bsOCW/Q8ZWGhyjhg1kB3VBXcLp+4k4lw277HOODN6TQANWjdBZitLqtft7IXpYjzWU
         tW4N8VKEUAmCfU8OH+FofeI05RRXIbdjpYotmNG0fBWxgmI6hlFoXiDqqGgsDf5B0RDP
         rYQDO2dXDZuenFNvBQyAgl+nk/uhYYstKsah2kuVTFsx/opMo45b4su+X1i9d8e2MWUR
         oZZCcvQjSr6X6cHRWBCXBWMcPUS1VRdRpS2vkFXSSrPAnO/WpIvBScWt/ygIZ2ar4x+I
         pgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+uAxJSSMcJzrTyyAujU7IWsabWssr7wxWhZR9Nz/dEI=;
        b=TgbcyNhYkaMbLS7pVtlre+1BgRZLKSo5zRqesWKfPyaZnLzymiRdBXLp7Shasb3LF0
         TVkH3s/dmLgjku/+vb6aGbLe1aFsqwSDeOk7XoZsyqdeen83LKnjcACZBxaPXUBa30TY
         hBzbimuyR8+nDWkbqDD30sCwUBsZ0qbz5A+Jh26bQSdfmv8hUdh0JrOpd3YV2NDIH+od
         xPRtW7tUl0SvWAU2o00OLMxDY2dZR/VCJLHl6e3Ok65qbtrGeqNfTcd+tT35D0bb2kXP
         rtZL+PEc+YVQuxNx0Jm4o5ZKeurfMOW/mGlW5b4ViyU+5OIXX+QMXca8otjUm5l7UMI1
         dYxg==
X-Gm-Message-State: APjAAAVh57Str1bkxe90/LCnlnqkvjnKfw+xtKr03aHhPxuZss68B2Cc
        ph2as0UhCsR4qxP/ecStD/Bup+rFJF8=
X-Google-Smtp-Source: APXvYqxkQlemuxcSLQHtMtBC5Ri9a3BRMGjgpcVRFo4X60vYKhFABWujvq+0K3YJ88vz/VdAg59zEw==
X-Received: by 2002:a17:902:860c:: with SMTP id f12mr89128629plo.127.1560443244418;
        Thu, 13 Jun 2019 09:27:24 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
        by smtp.gmail.com with ESMTPSA id 128sm170411pfd.66.2019.06.13.09.27.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 09:27:23 -0700 (PDT)
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
Subject: [PATCH 05/10] iommu/dma-iommu: convert to SPDX license tags
Date:   Thu, 13 Jun 2019 12:26:58 -0400
Message-Id: <20190613162703.986-5-tiny.windzz@gmail.com>
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
 drivers/iommu/dma-iommu.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 129c4badf9ae..2d76bac43b82 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * A fairly generic DMA-API to IOMMU-API glue layer.
  *
@@ -5,18 +6,6 @@
  *
  * based in part on arch/arm/mm/dma-mapping.c:
  * Copyright (C) 2000-2004 Russell King
- *
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
  */
 
 #include <linux/acpi_iort.h>
-- 
2.17.0

