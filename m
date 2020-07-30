Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03590233582
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 17:32:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728412AbgG3PcY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 11:32:24 -0400
Received: from mga17.intel.com ([192.55.52.151]:36331 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726353AbgG3PcY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 11:32:24 -0400
IronPort-SDR: tatd3QzSy1k5NCStOxAqG2WN2zkLOlDm2V2W5Jgd/w+ixHB2xLYpXyqOtzdEBqmoZboUrjsLn1
 404p/bvwGWmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="131688802"
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="131688802"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2020 08:32:24 -0700
IronPort-SDR: HsxULCBcrTEqITM1MKB7CapGtVQqX3CqXpPVOXBBeqryudvdYmD9dYbpVsu/YaxZeOJibcCt6e
 JwQGGoZY8lCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,414,1589266800"; 
   d="scan'208";a="286892031"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 30 Jul 2020 08:32:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B131D119; Thu, 30 Jul 2020 18:32:21 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, Imran Khan <kimran@codeaurora.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] soc: qcom: smem: use %*ph to print small buffer
Date:   Thu, 30 Jul 2020 18:32:20 +0300
Message-Id: <20200730153220.39466-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use %*ph format to print small buffer as hex string.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/soc/qcom/smem.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 28c19bcb2f20..8e66003f3e81 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -731,9 +731,7 @@ qcom_smem_partition_header(struct qcom_smem *smem,
 	header = smem->regions[0].virt_base + le32_to_cpu(entry->offset);
 
 	if (memcmp(header->magic, SMEM_PART_MAGIC, sizeof(header->magic))) {
-		dev_err(smem->dev, "bad partition magic %02x %02x %02x %02x\n",
-			header->magic[0], header->magic[1],
-			header->magic[2], header->magic[3]);
+		dev_err(smem->dev, "bad partition magic %4ph\n", header->magic);
 		return NULL;
 	}
 
-- 
2.27.0

