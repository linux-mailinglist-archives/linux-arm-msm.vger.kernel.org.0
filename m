Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56BFE19AEB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 17:28:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732755AbgDAP2h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 11:28:37 -0400
Received: from cmccmta1.chinamobile.com ([221.176.66.79]:3373 "EHLO
        cmccmta1.chinamobile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732504AbgDAP2h (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 11:28:37 -0400
X-Greylist: delayed 554 seconds by postgrey-1.27 at vger.kernel.org; Wed, 01 Apr 2020 11:28:35 EDT
Received: from spf.mail.chinamobile.com (unknown[172.16.121.1]) by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee25e84b0d3b6b-46c9c; Wed, 01 Apr 2020 23:18:44 +0800 (CST)
X-RM-TRANSID: 2ee25e84b0d3b6b-46c9c
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from localhost.localdomain (unknown[112.1.173.38])
        by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee15e84b0d12e0-213e3;
        Wed, 01 Apr 2020 23:18:43 +0800 (CST)
X-RM-TRANSID: 2ee15e84b0d12e0-213e3
From:   Tang Bin <tangbin@cmss.chinamobile.com>
To:     robdclark@gmail.com, agross@kernel.org
Cc:     bjorn.andersson@linaro.org, joro@8bytes.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tang Bin <tangbin@cmss.chinamobile.com>
Subject: [PATCH] iommu/qcom:fix local_base status check
Date:   Wed,  1 Apr 2020 23:20:08 +0800
Message-Id: <20200401152008.16740-1-tangbin@cmss.chinamobile.com>
X-Mailer: git-send-email 2.20.1.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Release resources when exiting on error.

Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
---
 drivers/iommu/qcom_iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 4328da0b0..d4ec38b1e 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -815,6 +815,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res)
 		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
+		if (IS_ERR(qcom_iommu->local_base))
+			return PTR_ERR(qcom_iommu->local_base);
 
 	qcom_iommu->iface_clk = devm_clk_get(dev, "iface");
 	if (IS_ERR(qcom_iommu->iface_clk)) {
-- 
2.20.1.windows.1



