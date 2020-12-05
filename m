Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9297D2CFDC3
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Dec 2020 19:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbgLESno (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Dec 2020 13:43:44 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9117 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgLESnj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Dec 2020 13:43:39 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Cp7sj1wgqz15JTv;
        Sat,  5 Dec 2020 20:19:05 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Sat, 5 Dec 2020
 20:19:29 +0800
From:   Zhang Qilong <zhangqilong3@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <srinivas.kandagatla@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH] slimbus: qcom-ngd-ctrl: Fix error handling to keep reference balanced
Date:   Sat, 5 Dec 2020 20:22:45 +0800
Message-ID: <20201205122245.2108188-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In the error branch, we should call pm_runtime_put_noidle and
pm_runtime_disable to decrease usage counter and increase the
power disable depth to avoid reference leaks.

Fixes: 917809e2280bb ("slimbus: ngd: Add qcom SLIMBus NGD driver")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index c054e83ab636..a9b4a1d95045 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1483,7 +1483,7 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	ret = qcom_slim_ngd_qmi_svc_event_init(ctrl);
 	if (ret) {
 		dev_err(&pdev->dev, "QMI service registration failed:%d", ret);
-		return ret;
+		goto pm_err;
 	}
 
 	INIT_WORK(&ctrl->m_work, qcom_slim_ngd_master_worker);
@@ -1500,6 +1500,9 @@ static int qcom_slim_ngd_probe(struct platform_device *pdev)
 	qcom_slim_ngd_qmi_svc_event_deinit(&ctrl->qmi);
 	if (ctrl->mwq)
 		destroy_workqueue(ctrl->mwq);
+pm_err:
+	pm_runtime_put_noidle(dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.25.4

