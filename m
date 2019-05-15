Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 168F01FD87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2019 03:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfEPBqV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 May 2019 21:46:21 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46525 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbfEOXdT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 May 2019 19:33:19 -0400
Received: by mail-pf1-f196.google.com with SMTP id y11so760804pfm.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 May 2019 16:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=djKpp0+BHbp5KVBEx90JiFN57Gm/WbDeClRhCLK6F4g=;
        b=nv9GeemUHg9Ck9WHEPtTACJZ7OgdsjblkCFtaEkdeQJfA22VhPDEoCDvM7q/C1mfoO
         0FNXng6oezdyuzS4O8ioDjNLNczUR2HoiEDBNCsYkNnpIH9ZoBYuVcbENfTYTcsFVGQK
         3enQzMf3jsqOxl9jrQauCcF2v/gwXuUSZ8NK6vafEPg41DzqIw/pEsksTULJ+/A/8dEx
         iedXGCKhDl2a4KbUUdciQ7BWneL9SMhIrrN09ZDlQ9Oh+uRm1LPueXSiVGS8mEw9T7sd
         0jhsbzFrlq21+bp3Zhv0603B48bIcM69XJRKRWZo1cjNCYJQRaVB1m3hsVlR7Iz1bZOe
         kysw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=djKpp0+BHbp5KVBEx90JiFN57Gm/WbDeClRhCLK6F4g=;
        b=ZyYE4l8p1JKYB7gMesbLwq5bxDJVIsFzsUKQRuUGwafZYKePj9SuIgFoPozEdsfehC
         /HgIe2lVAYVa9PvFBR4BCmkEpdRnx6FqWpA0vDEDDeUq+N2G7hyeC91L1I6YOrN3LeMq
         RM7fjPkT0TUM69rqj6U3Z3UR5jLVVH2C0Qp0SICQn87d2ib5ge8rH3ExWxGsWQ/W/suD
         Ts+bhXbDbEWEm7l4gmqZhFdswpeBcOfq/8hZY9YvPagW5+u5+0/5Io17eyXv1o0Gn+tR
         HwGNuEyLov2X3Qt7ZLTf5tH+xpcLOy/b3BAIYNvZpMH/v6n9kQ+ePGifxUUapJCxfzUc
         ZV0Q==
X-Gm-Message-State: APjAAAUgb718JP1Y4bSPsVd2r/ycrKn4vkGfMi8pzjzG97X1AzmSjRw6
        uWSP5StBRVswh1jeKFHwtPUDHw==
X-Google-Smtp-Source: APXvYqyrXnVeiR2IKdFoQs+/KyHKdfWtdip/KqmSq2+qQIWEc62Pl0Ip2kKHk13I4sqWwYIihDM5Lg==
X-Received: by 2002:aa7:9ac4:: with SMTP id x4mr50439288pfp.43.1557963198628;
        Wed, 15 May 2019 16:33:18 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id e6sm7215087pfl.115.2019.05.15.16.32.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 16:32:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Vivek Gautam <vgautam@qti.qualcomm.com>
Subject: [PATCH] iommu: io-pgtable: Support non-coherent page tables
Date:   Wed, 15 May 2019 16:32:34 -0700
Message-Id: <20190515233234.22990-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Describe the memory related to page table walks as non-cachable for iommu
instances that are not DMA coherent.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/iommu/io-pgtable-arm.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 4e21efbc4459..68ff22ffd2cb 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -803,9 +803,15 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 		return NULL;
 
 	/* TCR */
-	reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
-	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
-	      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
+	if (cfg->quirks & IO_PGTABLE_QUIRK_NO_DMA) {
+		reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
+		      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_IRGN0_SHIFT) |
+		      (ARM_LPAE_TCR_RGN_WBWA << ARM_LPAE_TCR_ORGN0_SHIFT);
+	} else {
+		reg = (ARM_LPAE_TCR_SH_IS << ARM_LPAE_TCR_SH0_SHIFT) |
+		      (ARM_LPAE_TCR_RGN_NC << ARM_LPAE_TCR_IRGN0_SHIFT) |
+		      (ARM_LPAE_TCR_RGN_NC << ARM_LPAE_TCR_ORGN0_SHIFT);
+	}
 
 	switch (ARM_LPAE_GRANULE(data)) {
 	case SZ_4K:
-- 
2.18.0

