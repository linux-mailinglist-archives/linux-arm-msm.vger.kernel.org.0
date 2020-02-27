Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB3ED172AD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 23:06:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730069AbgB0WG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 17:06:57 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:42965 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730191AbgB0WG4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 17:06:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582841216; h=References: In-Reply-To: References:
 In-Reply-To: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=L/9SUsWK5WY0wqLmzTMtMyIuQW4B95fp9pq2zAfiob4=; b=V7tsn+wMDiOJIM+E5wri4qU0aPFEnSjUpvWjANSaHULD4VMpdE3nT2ZY1NhovtNgZzg4hZ4M
 Gt0TAIh4wg041qBTPKPEE/zoRmR8i7Lw984vY4arl77KY0+g5ZF8KmUGupYjBnA0MD3K/JF1
 bzas6ZDR2UAufWv8jC4rMrXgs7c=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e583d70.7f0c0f1d6880-smtp-out-n01;
 Thu, 27 Feb 2020 22:06:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1380CC447A3; Thu, 27 Feb 2020 22:06:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from pacamara-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: nguyenb)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BAE5C43383;
        Thu, 27 Feb 2020 22:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7BAE5C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=nguyenb@codeaurora.org
From:   "Bao D. Nguyen" <nguyenb@codeaurora.org>
To:     ulf.hansson@linaro.org, robh+dt@kernel.org,
        linux-scsi@vger.kernel.org
Cc:     linux-mmc@vger.kernel.org, asutoshd@codeaurora.org,
        cang@codeaurora.org, "Bao D. Nguyen" <nguyenb@codeaurora.org>,
        linux-arm-msm@vger.kernel.org
Subject: [<PATCH v1> 1/4] mmc: core: Add check for NULL pointer access
Date:   Thu, 27 Feb 2020 14:05:39 -0800
Message-Id: <b328b981a785525b8424b4ab2197dc1ec54417d1.1582839544.git.nguyenb@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1582839544.git.nguyenb@codeaurora.org>
References: <cover.1582839544.git.nguyenb@codeaurora.org>
In-Reply-To: <cover.1582839544.git.nguyenb@codeaurora.org>
References: <cover.1582839544.git.nguyenb@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the SD card is removed, the mmc_card pointer can be set to NULL
by the mmc_sd_remove() function. Check mmc_card pointer to avoid NULL
pointer access.

Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
---
 drivers/mmc/core/bus.c  | 5 +++++
 drivers/mmc/core/core.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/mmc/core/bus.c b/drivers/mmc/core/bus.c
index 74de3f2..4558f51 100644
--- a/drivers/mmc/core/bus.c
+++ b/drivers/mmc/core/bus.c
@@ -131,6 +131,11 @@ static void mmc_bus_shutdown(struct device *dev)
 	struct mmc_host *host = card->host;
 	int ret;
 
+	if (!card) {
+		dev_dbg(dev, "%s: %s: card is NULL\n", dev_name(dev), __func__);
+		return;
+	}
+
 	if (dev->driver && drv->shutdown)
 		drv->shutdown(card);
 
diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
index 6b38c19..94441a0 100644
--- a/drivers/mmc/core/core.c
+++ b/drivers/mmc/core/core.c
@@ -666,6 +666,9 @@ void mmc_set_data_timeout(struct mmc_data *data, const struct mmc_card *card)
 {
 	unsigned int mult;
 
+	if (!card)
+		return;
+
 	/*
 	 * SDIO cards only define an upper 1 s limit on access.
 	 */
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
