Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A1F819BB7D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 08:02:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728332AbgDBGCo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Apr 2020 02:02:44 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:4101 "EHLO
        cmccmta1.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgDBGCo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Apr 2020 02:02:44 -0400
Received: from spf.mail.chinamobile.com (unknown[172.16.121.11]) by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee45e857fdeda6-54efe; Thu, 02 Apr 2020 14:02:07 +0800 (CST)
X-RM-TRANSID: 2ee45e857fdeda6-54efe
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.25.154.146])
        by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee65e857fdd42d-1e2da;
        Thu, 02 Apr 2020 14:02:06 +0800 (CST)
X-RM-TRANSID: 2ee65e857fdd42d-1e2da
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     robdclark@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org
Cc:     joro@8bytes.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH v2]iommu/qcom:fix local_base status check
Date:   Thu,  2 Apr 2020 14:03:33 +0800
Message-Id: <20200402060333.9156-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

------v2-----------------
As requested, add some {} around this chunk.

------v1-----------------
Release resources when exiting on error.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/iommu/qcom_iommu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 4328da0b0..c08aa9651 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -813,8 +813,11 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	qcom_iommu->dev = dev;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (res)
+	if (res) {
 		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(qcom_iommu->local_base))
+			return PTR_ERR(qcom_iommu->local_base);
+	}
 
 	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
 	if (IS_ERR(qcom_iommu->iface_clk)) {
-- 
2.20.1.windows.1



