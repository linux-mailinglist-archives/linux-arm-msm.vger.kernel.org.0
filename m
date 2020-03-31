Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB92619974E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2020 15:21:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730785AbgCaNVA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 31 Mar 2020 09:21:00 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37397 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730909AbgCaNU7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 31 Mar 2020 09:20:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585660858; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LwIOEbf+nCCW+7u2g19h9lYlFeg8e5l6OQQQDdC5Lk8=; b=odPQoVrbBk2hGtsRPoXR20a6k4EUe2EWDp4T9qT7sAGtMZq02tzxOCHEUCUG5O5ZiKsXxpJ1
 SHWCnJo2OvpCi1tBZuy2k5BU4NBQQ4f1XFToSUsnetEhsDvbUUNJbQf7CZYPTk8e7MhJs62t
 nWV3a90OlqvVJ8B0Z9Klt/qrBHg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8343a9.7f0529838b58-smtp-out-n03;
 Tue, 31 Mar 2020 13:20:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id ED59CC4478C; Tue, 31 Mar 2020 13:20:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B2FE9C433F2;
        Tue, 31 Mar 2020 13:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B2FE9C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v15 4/7] soc: qcom: rpmh-rsc: Save base address of drv
Date:   Tue, 31 Mar 2020 18:49:39 +0530
Message-Id: <1585660782-23416-5-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org>
References: <1585660782-23416-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add changes to save drv's base address for rsc. This is
used to read drv's configuration such as solver mode is
supported or to write into drv's registers.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh-internal.h |  2 ++
 drivers/soc/qcom/rpmh-rsc.c      | 11 +++++------
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
index 6eec32b..2f7dbba 100644
--- a/drivers/soc/qcom/rpmh-internal.h
+++ b/drivers/soc/qcom/rpmh-internal.h
@@ -85,6 +85,7 @@ struct rpmh_ctrlr {
  * Resource State Coordinator controller (RSC)
  *
  * @name:       controller identifier
+ * @base:       start address of the RSC's DRV registers
  * @tcs_base:   start address of the TCS registers in this controller
  * @id:         instance id in the controller (Direct Resource Voter)
  * @num_tcs:    number of TCSes in this DRV
@@ -95,6 +96,7 @@ struct rpmh_ctrlr {
  */
 struct rsc_drv {
 	const char *name;
+	void __iomem *base;
 	void __iomem *tcs_base;
 	int id;
 	int num_tcs;
diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
index b718221..dd35e4d 100644
--- a/drivers/soc/qcom/rpmh-rsc.c
+++ b/drivers/soc/qcom/rpmh-rsc.c
@@ -533,21 +533,20 @@ static int rpmh_probe_tcs_config(struct platform_device *pdev,
 	int i, ret, n, st = 0;
 	struct tcs_group *tcs;
 	struct resource *res;
-	void __iomem *base;
 	char drv_id[10] = {0};
 
 	snprintf(drv_id, ARRAY_SIZE(drv_id), "drv-%d", drv->id);
 	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, drv_id);
-	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
+	drv->base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(drv->base))
+		return PTR_ERR(drv->base);
 
 	ret = of_property_read_u32(dn, "qcom,tcs-offset", &offset);
 	if (ret)
 		return ret;
-	drv->tcs_base = base + offset;
+	drv->tcs_base = drv->base + offset;
 
-	config = readl_relaxed(base + DRV_PRNT_CHLD_CONFIG);
+	config = readl_relaxed(drv->base + DRV_PRNT_CHLD_CONFIG);
 
 	max_tcs = config;
 	max_tcs &= DRV_NUM_TCS_MASK << (DRV_NUM_TCS_SHIFT * drv->id);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
