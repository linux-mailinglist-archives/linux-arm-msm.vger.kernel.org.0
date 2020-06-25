Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD2520A633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 21:55:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436507AbgFYTzF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 15:55:05 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:49842 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2406903AbgFYTzC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 15:55:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593114901; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=tEblWqdsHbe0RoAfJnY3K950R8Ov0o8cf9KFHJa6JoE=; b=OeCsgVzAUbGHwJj1UFwNvBKhX8xuplAs0wFHvK8AVxVJ5xwjdbJVsb+1bB11NKeZbJgxXVpN
 SwfwTqcyogLslehj4alJVIojieraN5TPfQYL/sMijyyQkbWt90jKA7SslTfjCrIPV0LFtyJJ
 5qQ7P+UdAVOBfJbU4opd+XvicOA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5ef50114a3d8a44743d9af0d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 25 Jun 2020 19:55:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2DD4CC433CB; Thu, 25 Jun 2020 19:54:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C4BFC433A0;
        Thu, 25 Jun 2020 19:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4C4BFC433A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     kishon@ti.com, vkoul@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v3 2/2] phy: qcom-snps: Add a set mode callback
Date:   Thu, 25 Jun 2020 12:54:44 -0700
Message-Id: <20200625195444.15130-3-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200625195444.15130-1-wcheng@codeaurora.org>
References: <20200625195444.15130-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The set mode handler is used to keep track of the current role of the
device.  This is used for enabling certain resources within the PHY
depending on if the device is behaving as a host or device.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 152d8633f4ea..ae4bac024c7b 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -77,6 +77,7 @@ static const char * const qcom_snps_hsphy_vreg_names[] = {
  * @phy_reset: phy reset control
  * @vregs: regulator supplies bulk data
  * @phy_initialized: if PHY has been initialized correctly
+ * @mode: contains the current mode the PHY is in
  */
 struct qcom_snps_hsphy {
 	struct phy *phy;
@@ -88,6 +89,7 @@ struct qcom_snps_hsphy {
 	struct regulator_bulk_data vregs[SNPS_HS_NUM_VREGS];
 
 	bool phy_initialized;
+	enum phy_mode mode;
 };
 
 static inline void qcom_snps_hsphy_write_mask(void __iomem *base, u32 offset,
@@ -161,6 +163,15 @@ static int __maybe_unused qcom_snps_hsphy_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
+				    int submode)
+{
+	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+
+	hsphy->mode = mode;
+	return 0;
+}
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
@@ -258,6 +269,7 @@ static int qcom_snps_hsphy_exit(struct phy *phy)
 static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.init		= qcom_snps_hsphy_init,
 	.exit		= qcom_snps_hsphy_exit,
+	.set_mode	= qcom_snps_hsphy_set_mode,
 	.owner		= THIS_MODULE,
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

