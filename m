Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 385922C3946
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Nov 2020 07:47:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgKYGq3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 25 Nov 2020 01:46:29 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:7985 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbgKYGq2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 25 Nov 2020 01:46:28 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cgry53RQJzhh9Q;
        Wed, 25 Nov 2020 14:46:05 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 14:46:11 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Qinglang Miao" <miaoqinglang@huawei.com>
Subject: [PATCH] soc: qcom: pdr: Fix error return code in pdr_register_listener
Date:   Wed, 25 Nov 2020 14:50:34 +0800
Message-ID: <20201125065034.154217-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix to return the error code -EREMOTEIO from pdr_register_listener
rather than 0.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/soc/qcom/pdr_interface.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 088dc99f7..3da12ec2a 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -153,6 +153,7 @@ static int pdr_register_listener(struct pdr_handle *pdr,
 	if (resp.resp.result != QMI_RESULT_SUCCESS_V01) {
 		pr_err("PDR: %s register listener failed: 0x%x\n",
 		       pds->service_path, resp.resp.error);
+		ret = -EREMOTEIO;
 		return ret;
 	}
 
-- 
2.23.0

