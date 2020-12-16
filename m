Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622072DC145
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Dec 2020 14:30:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbgLPN2k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Dec 2020 08:28:40 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9459 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725550AbgLPN2k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Dec 2020 08:28:40 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CwwsK1jtGzhrJZ;
        Wed, 16 Dec 2020 21:27:17 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Wed, 16 Dec 2020 21:27:38 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <srinivas.kandagatla@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] nvmem: convert comma to semicolon
Date:   Wed, 16 Dec 2020 21:28:10 +0800
Message-ID: <20201216132810.15688-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace a comma between expression statements by a semicolon.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/nvmem/qcom-spmi-sdam.c | 2 +-
 drivers/nvmem/snvs_lpgpr.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/qcom-spmi-sdam.c b/drivers/nvmem/qcom-spmi-sdam.c
index a72704cd0468..b73783a04e22 100644
--- a/drivers/nvmem/qcom-spmi-sdam.c
+++ b/drivers/nvmem/qcom-spmi-sdam.c
@@ -142,7 +142,7 @@ static int sdam_probe(struct platform_device *pdev)
 	sdam->sdam_config.dev = &pdev->dev;
 	sdam->sdam_config.name = "spmi_sdam";
 	sdam->sdam_config.id = NVMEM_DEVID_AUTO;
-	sdam->sdam_config.owner = THIS_MODULE,
+	sdam->sdam_config.owner = THIS_MODULE;
 	sdam->sdam_config.stride = 1;
 	sdam->sdam_config.word_size = 1;
 	sdam->sdam_config.reg_read = sdam_read;
diff --git a/drivers/nvmem/snvs_lpgpr.c b/drivers/nvmem/snvs_lpgpr.c
index c527d26ca6ac..4692aa985bd6 100644
--- a/drivers/nvmem/snvs_lpgpr.c
+++ b/drivers/nvmem/snvs_lpgpr.c
@@ -123,7 +123,7 @@ static int snvs_lpgpr_probe(struct platform_device *pdev)
 	cfg->dev = dev;
 	cfg->stride = 4;
 	cfg->word_size = 4;
-	cfg->size = dcfg->size,
+	cfg->size = dcfg->size;
 	cfg->owner = THIS_MODULE;
 	cfg->reg_read  = snvs_lpgpr_read;
 	cfg->reg_write = snvs_lpgpr_write;
-- 
2.22.0

