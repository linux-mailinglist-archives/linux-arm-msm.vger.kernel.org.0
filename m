Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC514432D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391677AbfFMQ1i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:27:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43150 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731233AbfFMQ1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:34 -0400
Received: by mail-pf1-f193.google.com with SMTP id i189so12151341pfg.10;
        Thu, 13 Jun 2019 09:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Q4z+1lD6L8nleD1j+L3SnZJFelsfjWSFPaZVMarGO8g=;
        b=fOYdYWOhF3ZyKvMjqvLUfJ0cwxcI5mFQycuQv7JzdfadQaDqxSFq88q2ia+Tnbvmkp
         6Nh3M7lCMtpSP9bipGQFNCbzwS7L6213Z/3b8crNq9lKGyjnS/r1gcWlg5qW9/WfvPbJ
         L9BeU+t7EzCCUq2B9wGxOz7SLQdop76XwPlwXbKsg3I9b0dLuxgMn/dPxX4saClyok43
         T0HQfzWKw8m4CtBi73JACE7kTioBqo4MZCayRF2hMy89yDz8gZkTOIRA5G+cVrhLwLVM
         pL+v/aWmDUGF2gdG3/Qaezrp3xOQ8+OMTA1nAyrOJxYbgApp67WZDvw4lKGpiPO5k8fR
         /p7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Q4z+1lD6L8nleD1j+L3SnZJFelsfjWSFPaZVMarGO8g=;
        b=JewR8kRGzmhsdhT6o5lD9v0SxAZmKKCMCmkyt5g16mr9WmKatHyymKovIw+iFkvgkD
         jrMF604FRp6b7niCcDj1lewh9YEA92nlW68Y0eziV1CDp9OKZoLkj2iIrx977WZSFiw7
         qyK+PxWuHtYT6+DTG0BX3jTNzcKgACK8FoVD14fbA0DckOg+v9VMKCegd1/E0NsdAOF4
         MM2YPMnCjNvMvgG6n8smHR5FG9MJo9HW2+6fd5JrouCoBsYhl3fo4tiHnkKdXIyvFHDt
         euX9/dnnnEdEMQfPab0PA1CrkEdrNZH8hymjX8dMqaFVQNLCgOa2ev/b4hOK87HBQXfn
         1BMg==
X-Gm-Message-State: APjAAAUfMz2g1ygMVAuxgerCL2QXCnNYhLGZKX+sjiwOWfsngDPpI2ip
        X4s5kRQvU00pzU6l00+C2nU=
X-Google-Smtp-Source: APXvYqxX/RanT51RYSaVZsxeTP+rQPGVZ62n+jf0t5emIHsrys1734E1A4fccZi67O/PQXiUedWBeQ==
X-Received: by 2002:a65:64d5:: with SMTP id t21mr32140036pgv.310.1560443254129;
        Thu, 13 Jun 2019 09:27:34 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
        by smtp.gmail.com with ESMTPSA id l23sm261906pgh.68.2019.06.13.09.27.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 09:27:33 -0700 (PDT)
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
Subject: [PATCH 08/10] iommu/sysfs: convert to SPDX license tags
Date:   Thu, 13 Jun 2019 12:27:01 -0400
Message-Id: <20190613162703.986-8-tiny.windzz@gmail.com>
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
 drivers/iommu/iommu-sysfs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/iommu-sysfs.c b/drivers/iommu/iommu-sysfs.c
index 44127d54e943..a193758c8122 100644
--- a/drivers/iommu/iommu-sysfs.c
+++ b/drivers/iommu/iommu-sysfs.c
@@ -1,12 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * IOMMU sysfs class support
  *
  * Copyright (C) 2014 Red Hat, Inc.  All rights reserved.
  *     Author: Alex Williamson <alex.williamson@redhat.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/device.h>
-- 
2.17.0

