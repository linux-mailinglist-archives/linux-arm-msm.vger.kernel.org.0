Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDAFA2587C5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Sep 2020 08:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726006AbgIAGB1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 02:01:27 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46766 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgIAGB1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 02:01:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598940086; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=JkB5t793pKcL4ZJ57eDDbDImH896a5Jx/bAmj4NC5Vg=; b=EKSXgTNhpwm1e2+8k3jw63+1jcI2HjygcTus8HL82JKX8us6QEwuHVCD3XaIb4aX50HBC5Pi
 DoXcWRJrMtVKIgO4UoxQY7uanKoy2taqiT7vuzRRMUR13wXKfWZPKXWRQNYIip/VJXVTWMul
 YYH2li51YhI1McSzMQaquDqatg0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f4de3a173afa3417e2a8ce4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 01 Sep 2020 06:01:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C3F88C433A0; Tue,  1 Sep 2020 06:01:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A11D1C433CA;
        Tue,  1 Sep 2020 06:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A11D1C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=nguyenb@codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     cang@codeaurora.org, asutoshd@codeaurora.org,
        martin.petersen@oracle.com, linux-scsi@vger.kernel.org
Cc:     "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        YueHaibing <yuehaibing@huawei.com>,
        Bean Huo <beanhuo@micron.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1 2/2] scsi: ufs: Support reading UFS's Vcc voltage from device tree
Date:   Mon, 31 Aug 2020 23:00:48 -0700
Message-Id: <69db325a09d5c3fa7fc260db031b1e498b601c25.1598939393.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1598939393.git.nguyenb@codeaurora.org>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
In-Reply-To: <cover.1598939393.git.nguyenb@codeaurora.org>
References: <cover.1598939393.git.nguyenb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The UFS specifications supports a range of Vcc operating voltage
from 2.4-3.6V depending on the device and manufacturers.
Allows selecting the UFS Vcc voltage level by setting the
UFS's entry vcc-voltage-level in the device tree. If UFS's
vcc-voltage-level setting is not found in the device tree,
use default values provided by the driver.

Signed-off-by: Can Guo <cang@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
---
 drivers/scsi/ufs/ufshcd-pltfrm.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
index 3db0af6..48f429c 100644
--- a/drivers/scsi/ufs/ufshcd-pltfrm.c
+++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
@@ -104,10 +104,11 @@ static int ufshcd_parse_clock_info(struct ufs_hba *hba)
 static int ufshcd_populate_vreg(struct device *dev, const char *name,
 		struct ufs_vreg **out_vreg)
 {
-	int ret = 0;
+	int len, ret = 0;
 	char prop_name[MAX_PROP_SIZE];
 	struct ufs_vreg *vreg = NULL;
 	struct device_node *np = dev->of_node;
+	const __be32 *prop;
 
 	if (!np) {
 		dev_err(dev, "%s: non DT initialization\n", __func__);
@@ -138,8 +139,16 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
 			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
 			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
 		} else {
-			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
-			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
+			prop = of_get_property(np, "vcc-voltage-level", &len);
+			if (!prop || (len != (2 * sizeof(__be32)))) {
+				dev_warn(dev, "%s vcc-voltage-level property.\n",
+					prop ? "invalid format" : "no");
+				vreg->min_uV = UFS_VREG_VCC_MIN_UV;
+				vreg->max_uV = UFS_VREG_VCC_MAX_UV;
+			} else {
+				vreg->min_uV = be32_to_cpup(&prop[0]);
+				vreg->max_uV = be32_to_cpup(&prop[1]);
+			}
 		}
 	} else if (!strcmp(name, "vccq")) {
 		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

