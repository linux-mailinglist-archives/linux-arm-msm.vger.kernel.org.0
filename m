Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DDE744331
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392434AbfFMQ1l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:27:41 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34148 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392430AbfFMQ1j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:39 -0400
Received: by mail-pg1-f194.google.com with SMTP id p10so5393151pgn.1;
        Thu, 13 Jun 2019 09:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/p2hCYDhKAJ230l1zBzHnYZFs3VHjVr39XvOIKP4Pys=;
        b=VEgX2ZhFSzG3BImEi4GH9MUQbh4LnQqPx0JppfXi7XYfJJvmRAB0Db/QKVQQl8qM10
         SoKlDlc0SaxSrTEDHUtMYjOT11a0Lj5yq8ULKEndaWGWOkhNMNutP6XCaT2Ffliy6EBJ
         5jQ1g8Pajofj88UF7QvL1nK1FAEH7NLyg8e9QWEleD0lUPmjBavBQJY0q78qlAGQNurb
         9dqruWp+dSmlVS3sT1CIfM6Oi8H7XanvMOQZ6mbabOL0lGwx8q36/3mrMkLEV/gxHbiY
         un+NlmZxMI15zJRk9HnXmJzI1lKBdlQNldk07QrTBkVVnjybOiiPxyeHYi4kTRL37lCi
         W8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/p2hCYDhKAJ230l1zBzHnYZFs3VHjVr39XvOIKP4Pys=;
        b=NKMOJcaVEUub4AvHrFKYwFxs4FwR0Uh14RexbRah3VpPgD/jjgkt/mL1rid33YZgZO
         2rbG/5i6PSjCzACUkk8L/GLPKGKWM/HgNVwkuUTL/759bOu6JwMYpJBS1zidvR7bX/VT
         oaWNk5rsSIVeaXUcDzgGSo2UXptjzZWCQmkhA24r3ER0BJSx1hL7NSBLrb3fNiIPo4VM
         ylS7wV74UMe1lFd82mxNBCAiRvqzB+hJLQfHeApt/BqKARSdfp24F0dYgOTC7vmWzb2x
         ipoP9fz14n8Yk+Pfhp/Ay14diHKAYkweZfN6DOVfa5ld8QCZYWoOXcLH4DLtxqHanTv2
         mixw==
X-Gm-Message-State: APjAAAWJ3w9+Cu6cHqNy3BuM6MESL0zI/UZKxKovOUVBsn0lpkw50QdP
        iqarV90mec1XvhhzjfpbM0E=
X-Google-Smtp-Source: APXvYqwn2Bb5s9dHHXGu4kP/PrmweWqq9r8gaJuQTaAylLqdC9JMoO2D+zXiDQevAsqwN3NWgk6q+A==
X-Received: by 2002:a65:60d2:: with SMTP id r18mr31309788pgv.217.1560443259298;
        Thu, 13 Jun 2019 09:27:39 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
        by smtp.gmail.com with ESMTPSA id j2sm310930pgq.13.2019.06.13.09.27.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 09:27:38 -0700 (PDT)
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
Subject: [PATCH 10/10] iommu/tegra-smmu: convert to SPDX license tags
Date:   Thu, 13 Jun 2019 12:27:03 -0400
Message-Id: <20190613162703.986-10-tiny.windzz@gmail.com>
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
 drivers/iommu/tegra-smmu.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 463ee08f7d3a..9a50ca4ec65c 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -1,9 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2011-2014 NVIDIA CORPORATION.  All rights reserved.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <linux/bitops.h>
-- 
2.17.0

