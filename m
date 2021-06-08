Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32EE139F123
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 10:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhFHIn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 04:43:59 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:5290 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHIn6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 04:43:58 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FzkBL0hh7z1BK06;
        Tue,  8 Jun 2021 16:37:14 +0800 (CST)
Received: from dggemi758-chm.china.huawei.com (10.1.198.144) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 16:42:04 +0800
Received: from huawei.com (10.175.101.6) by dggemi758-chm.china.huawei.com
 (10.1.198.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 8 Jun
 2021 16:42:03 +0800
From:   ChenXiaoSong <chenxiaosong2@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <will@kernel.org>, <mark.rutland@arm.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yukuai3@huawei.com>,
        <yi.zhang@huawei.com>, <chenxiaosong2@huawei.com>
Subject: [PATCH -next,resend] perf: qcom: Remove redundant dev_err call in qcom_l3_cache_pmu_probe()
Date:   Tue, 8 Jun 2021 16:48:16 +0800
Message-ID: <20210608084816.1046485-1-chenxiaosong2@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.101.6]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggemi758-chm.china.huawei.com (10.1.198.144)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: ChenXiaoSong <chenxiaosong2@huawei.com>
---
 drivers/perf/qcom_l3_pmu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index 081273543c6b..c76f6f21d2a8 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -767,10 +767,8 @@ static int qcom_l3_cache_pmu_probe(struct platform_device *pdev)
 
 	memrc = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	l3pmu->regs = devm_ioremap_resource(&pdev->dev, memrc);
-	if (IS_ERR(l3pmu->regs)) {
-		dev_err(&pdev->dev, "Can't map PMU @%pa\n", &memrc->start);
+	if (IS_ERR(l3pmu->regs))
 		return PTR_ERR(l3pmu->regs);
-	}
 
 	qcom_l3_cache__init(l3pmu);
 
-- 
2.25.4

