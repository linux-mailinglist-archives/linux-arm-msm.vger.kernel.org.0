Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AC52A2CC1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Nov 2020 15:26:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbgKBOYL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Nov 2020 09:24:11 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7575 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgKBOX4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Nov 2020 09:23:56 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPwBv44XNzLsJ3;
        Mon,  2 Nov 2020 22:23:51 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Mon, 2 Nov 2020
 22:23:49 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <ohad@wizery.com>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH] remoteproc: q6v5-mss: fix error handling in q6v5_pds_enable
Date:   Mon, 2 Nov 2020 22:34:33 +0800
Message-ID: <20201102143433.143996-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the pm_runtime_get_sync failed in q6v5_pds_enable when
loop (i), The unroll_pd_votes will start from (i - 1), and
it will resulted in following problems:

  1) pm_runtime_get_sync will increment pm usage counter even it
     failed. Forgetting to pm_runtime_put_noidle will result in
     reference leak.

  2) Have not reset pds[i] performance state.

Then we fix it.

Fixes: 4760a896be88e ("remoteproc: q6v5-mss: Vote for rpmh power domains")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index eb3457a6c3b7..ba6f7551242d 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -349,8 +349,11 @@ static int q6v5_pds_enable(struct q6v5 *qproc, struct device **pds,
 	for (i = 0; i < pd_count; i++) {
 		dev_pm_genpd_set_performance_state(pds[i], INT_MAX);
 		ret = pm_runtime_get_sync(pds[i]);
-		if (ret < 0)
+		if (ret < 0) {
+			pm_runtime_put_noidle(pds[i]);
+			dev_pm_genpd_set_performance_state(pds[i], 0);
 			goto unroll_pd_votes;
+		}
 	}
 
 	return 0;
-- 
2.17.1

