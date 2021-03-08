Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4126133123D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Mar 2021 16:33:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhCHPc3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 10:32:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:60478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229790AbhCHPcU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 10:32:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 041506526A;
        Mon,  8 Mar 2021 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615217539;
        bh=Q86KQofgOs8LGcTYRssgtJBsRLc5fpn3UtwJj0yn+KM=;
        h=From:To:Cc:Subject:Date:From;
        b=kKkxb4vr1CCV3Axd66l/YyiwSjXCNP4S3M6FciIGgAl5BxfVV33+fRcJp0+4t2Upw
         frdAWTqojIujgU5KhUukBZLrwnuYs6dM85oY/gTFi9SDI+qxmoeKi4uCatcYD5myTZ
         wazFhaHDh40+SU2lpBzwZzO4Y7LucTG43ZvtjLv/8rFRGosBPm/c8cNZ6vXXrP/Xqn
         rs6YXIGZxObXZFPrn84gx8w73zXZtsxmS/OAfuxMaYGPuL3pR6fYKEBpLNZBAeQLet
         YBKiAKp1gQJmC+FrD+/omX2oDqkzXMAmskzKGCmnPsan4hg49oL8LI3txtYGpEIOhq
         tyWuYC0hcF4ug==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vkoul@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: pil-info: avoid 64-bit division on 32-bit architectures
Date:   Mon,  8 Mar 2021 16:32:02 +0100
Message-Id: <20210308153215.2449563-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

In some randconfig builds, a 64-bit resource_size_t is used even on
32-bit architectures, which now leads to a link-time error:

ERROR: modpost: "__aeabi_uldivmod" [drivers/remoteproc/qcom_pil_info.ko] undefined!

Using the div_u64() helper here. A cast to 32 bits length would also
work, but for a constant divider there should not be much difference.

Fixes: 549b67da660d ("remoteproc: qcom: Introduce helper to store pil info in IMEM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/remoteproc/qcom_pil_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_pil_info.c b/drivers/remoteproc/qcom_pil_info.c
index 5521c4437ffa..95b6b7609a87 100644
--- a/drivers/remoteproc/qcom_pil_info.c
+++ b/drivers/remoteproc/qcom_pil_info.c
@@ -56,7 +56,8 @@ static int qcom_pil_info_init(void)
 	memset_io(base, 0, resource_size(&imem));
 
 	_reloc.base = base;
-	_reloc.num_entries = resource_size(&imem) / PIL_RELOC_ENTRY_SIZE;
+	_reloc.num_entries = div_u64(resource_size(&imem),
+				     PIL_RELOC_ENTRY_SIZE);
 
 	return 0;
 }
-- 
2.29.2

