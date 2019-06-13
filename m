Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48CA44343
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2019 18:30:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390780AbfFMQ2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 12:28:13 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42105 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388457AbfFMQ1U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 12:27:20 -0400
Received: by mail-pg1-f195.google.com with SMTP id l19so8641494pgh.9;
        Thu, 13 Jun 2019 09:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=JsgCC/BMGBMjxmW7o9BryeGGLOEsGyP+ouOS5p6QwrY=;
        b=JcwiPxgjLgV6N4VCuG8y04JytNqGA3wjUEQKXd/8c9NKoASVZrzY9YqxjRgcnxpj/m
         xYimd6aF0FM3qGzIYEie1Obu9Fv9hNkPj5fOH/k1Cq8DDcTXGvzHfbdZZhCf2rHYdqoK
         irX41RQFqAFcvftuCdOl2TIoHJ7GuhiI3Lp4/3pYT1WHUTlWCSo2uZS0xVBoOWxaygH0
         Qhyde+t2vasIdzZ+OUXv4OvvVQwY7REx9a6hOOv/nwJg0o08wp2sRXgZY/BCBEUe5dt5
         QSiS7Bi23/N6707zjA7xU7gvDKFjyL8fi7H0FXAHjINXJuoR7QtNv2s6u2JezgqDFeA7
         CcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=JsgCC/BMGBMjxmW7o9BryeGGLOEsGyP+ouOS5p6QwrY=;
        b=RqnpGk0dvObotJH45D8WUdFWRJYy85aL7kugRIvy44IAvWGemwer3L7RM2dB8rrlE0
         tko8CdzNR2cFMboy/7hLtduOYmm4gaNBN4w2eLhDi45GMySfT7HsZFY0vUwc/H1F6JTo
         rpzwmGkQFr2UPiyUtEiPefNDgR4Bg7k+y/s18Zl0e1PwENaowgCznmXlBorDaCY54Cbh
         a316YXSxFGF70GejjIGqZZ/zHrnj9JHnLhUS7ezcsxzt0MVqwxR/5U4SIIct7XEqHBOy
         5H4rGR0MwmDScOCF3Np3s5Dlhgqb0MT6A4rREh3JOE8a/BynJrXQsMHUXI1czaZbaNX2
         iR0A==
X-Gm-Message-State: APjAAAUkf3w5Uf+iosKSCcmQoJjin78CB/6r2UtJ0QQ//8uN3m1RT7/9
        M50OynRsi43vRwj+NiVaQ34=
X-Google-Smtp-Source: APXvYqzz/wBg2hFMk5AN2wVrdkk/+d5jQkSOOjBN2BUU2pkNiSLnjcEV8rg9DLZ1/j1U47rn0NUi1g==
X-Received: by 2002:a62:1bd1:: with SMTP id b200mr69156992pfb.210.1560443239837;
        Thu, 13 Jun 2019 09:27:19 -0700 (PDT)
Received: from localhost (68.168.130.77.16clouds.com. [68.168.130.77])
        by smtp.gmail.com with ESMTPSA id l8sm265407pgb.76.2019.06.13.09.27.19
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 09:27:19 -0700 (PDT)
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
Subject: [PATCH 04/10] iommu/qcom: convert to SPDX license tags
Date:   Thu, 13 Jun 2019 12:26:57 -0400
Message-Id: <20190613162703.986-4-tiny.windzz@gmail.com>
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
 drivers/iommu/qcom_iommu.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 8cdd3f059513..ad913720d7dd 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -1,18 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * IOMMU API for QCOM secure IOMMUs.  Somewhat based on arm-smmu.c
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
  * Copyright (C) 2013 ARM Limited
  * Copyright (C) 2017 Red Hat
  */
-- 
2.17.0

