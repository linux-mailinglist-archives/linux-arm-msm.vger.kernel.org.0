Return-Path: <linux-arm-msm+bounces-3497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F6980637B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 01:34:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 572EC1C21061
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 00:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4A27D275;
	Wed,  6 Dec 2023 00:34:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 635C69A;
	Tue,  5 Dec 2023 16:34:24 -0800 (PST)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VxvrmPJ_1701822861;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VxvrmPJ_1701822861)
          by smtp.aliyun-inc.com;
          Wed, 06 Dec 2023 08:34:22 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: agross@kernel.org,
	andersson@kernel.org,
	konrad.dybcio@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] soc: qcom: stats: Remove unneeded semicolon
Date: Wed,  6 Dec 2023 08:34:20 +0800
Message-Id: <20231206003420.74085-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

./drivers/soc/qcom/qcom_stats.c:394:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7682
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/soc/qcom/qcom_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 4763d62a8cb0..7c6ef1e7e41c 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -391,7 +391,7 @@ static int qcom_stats_probe(struct platform_device *pdev)
 	if (ret) {
 		debugfs_remove_recursive(root);
 		return ret;
-	};
+	}
 
 	platform_set_drvdata(pdev, root);
 
-- 
2.20.1.7.g153144c


