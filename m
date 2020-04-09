Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 05AE11A335E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2020 13:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725971AbgDILm5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Apr 2020 07:42:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:12707 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726521AbgDILmz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Apr 2020 07:42:55 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 84429AF7EE05142D64A7;
        Thu,  9 Apr 2020 19:42:02 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Thu, 9 Apr 2020
 19:41:53 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <lgirdwood@gmail.com>, <broonie@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] regulator: qcom_rpm: remove defined but not used 'pm8921_ftsmps'
Date:   Thu, 9 Apr 2020 19:40:26 +0800
Message-ID: <20200409114026.38383-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the following gcc warning:

drivers/regulator/qcom_rpm-regulator.c:607:34: warning: ‘pm8921_ftsmps’
defined but not used [-Wunused-const-variable=]
 static const struct qcom_rpm_reg pm8921_ftsmps = {
                                  ^~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/regulator/qcom_rpm-regulator.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/regulator/qcom_rpm-regulator.c b/drivers/regulator/qcom_rpm-regulator.c
index 7fc97f23fcf4..1ee8ec686ed3 100644
--- a/drivers/regulator/qcom_rpm-regulator.c
+++ b/drivers/regulator/qcom_rpm-regulator.c
@@ -604,16 +604,6 @@ static const struct qcom_rpm_reg pm8921_smps = {
 	.supports_force_mode_bypass = false,
 };
 
-static const struct qcom_rpm_reg pm8921_ftsmps = {
-	.desc.linear_ranges = ftsmps_ranges,
-	.desc.n_linear_ranges = ARRAY_SIZE(ftsmps_ranges),
-	.desc.n_voltages = 101,
-	.desc.ops = &uV_ops,
-	.parts = &rpm8960_smps_parts,
-	.supports_force_mode_auto = true,
-	.supports_force_mode_bypass = false,
-};
-
 static const struct qcom_rpm_reg pm8921_ncp = {
 	.desc.linear_ranges = ncp_ranges,
 	.desc.n_linear_ranges = ARRAY_SIZE(ncp_ranges),
-- 
2.17.2

