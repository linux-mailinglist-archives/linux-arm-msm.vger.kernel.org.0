Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A7A30D1C4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 03:49:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232255AbhBCCr3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 21:47:29 -0500
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43]:39639 "EHLO
        out30-43.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232242AbhBCCr2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 21:47:28 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R501e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04357;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0UNjXzVX_1612320403;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UNjXzVX_1612320403)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 03 Feb 2021 10:46:44 +0800
From:   Yang Li <yang.lee@linux.alibaba.com>
To:     agross@kernel.org
Cc:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH] remoteproc: qcom_wcnss: remove unneeded semicolon
Date:   Wed,  3 Feb 2021 10:46:42 +0800
Message-Id: <1612320402-3313-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Eliminate the following coccicheck warning:
./drivers/remoteproc/qcom_wcnss.c:573:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/remoteproc/qcom_wcnss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index f958542..2a6a23c 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -570,7 +570,7 @@ static int wcnss_probe(struct platform_device *pdev)
 	if (IS_ERR(mmio)) {
 		ret = PTR_ERR(mmio);
 		goto free_rproc;
-	};
+	}
 
 	ret = wcnss_alloc_memory_region(wcnss);
 	if (ret)
-- 
1.8.3.1

