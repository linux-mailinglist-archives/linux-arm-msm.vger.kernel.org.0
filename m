Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0430B382A8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 May 2021 13:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236632AbhEQLI1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 07:08:27 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3716 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236618AbhEQLI0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 07:08:26 -0400
Received: from dggems702-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FkGVG12vSz16Pn9;
        Mon, 17 May 2021 19:04:22 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems702-chm.china.huawei.com (10.3.19.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 17 May 2021 19:07:06 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 17 May
 2021 19:07:06 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
CC:     <bjorn.andersson@linaro.org>
Subject: [PATCH -next] bus: qcom: Add missing clk_disable_unprepare() on error path
Date:   Mon, 17 May 2021 19:09:22 +0800
Message-ID: <20210517110922.474849-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After calling clk_prepare_enable(), clk_disable_unprepare() need
be called when read csindex failed.

Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/bus/qcom-ebi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/qcom-ebi2.c b/drivers/bus/qcom-ebi2.c
index 0b8f53a688b8..3cffac13bc5f 100644
--- a/drivers/bus/qcom-ebi2.c
+++ b/drivers/bus/qcom-ebi2.c
@@ -355,7 +355,7 @@ static int qcom_ebi2_probe(struct platform_device *pdev)
 		ret = of_property_read_u32(child, "reg", &csindex);
 		if (ret) {
 			of_node_put(child);
-			return ret;
+			goto err_disable_clk;
 		}
 
 		if (csindex > 5) {
-- 
2.25.1

