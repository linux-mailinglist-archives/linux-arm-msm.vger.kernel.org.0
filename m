Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9227E393B2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 03:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhE1Btn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 21:49:43 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:2381 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbhE1Btn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 21:49:43 -0400
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4FrnY80bdKz66Np;
        Fri, 28 May 2021 09:44:28 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Fri, 28 May 2021 09:48:06 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 28
 May 2021 09:48:06 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <will@kernel.org>, <mark.rutland@arm.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] perf: qcom: use DEVICE_ATTR_RO macro
Date:   Fri, 28 May 2021 09:47:49 +0800
Message-ID: <20210528014749.24068-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema769-chm.china.huawei.com (10.1.198.211)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use DEVICE_ATTR_RO() helper instead of plain DEVICE_ATTR(),
which makes the code a bit shorter and easier to read.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/perf/qcom_l3_pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/qcom_l3_pmu.c b/drivers/perf/qcom_l3_pmu.c
index bba078077c93..081273543c6b 100644
--- a/drivers/perf/qcom_l3_pmu.c
+++ b/drivers/perf/qcom_l3_pmu.c
@@ -670,15 +670,15 @@ static const struct attribute_group qcom_l3_cache_pmu_events_group = {
 
 /* cpumask */
 
-static ssize_t qcom_l3_cache_pmu_cpumask_show(struct device *dev,
-				     struct device_attribute *attr, char *buf)
+static ssize_t cpumask_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
 {
 	struct l3cache_pmu *l3pmu = to_l3cache_pmu(dev_get_drvdata(dev));
 
 	return cpumap_print_to_pagebuf(true, buf, &l3pmu->cpumask);
 }
 
-static DEVICE_ATTR(cpumask, 0444, qcom_l3_cache_pmu_cpumask_show, NULL);
+static DEVICE_ATTR_RO(cpumask);
 
 static struct attribute *qcom_l3_cache_pmu_cpumask_attrs[] = {
 	&dev_attr_cpumask.attr,
-- 
2.17.1

