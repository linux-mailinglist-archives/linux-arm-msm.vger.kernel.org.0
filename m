Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D90F25638E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Aug 2020 01:57:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgH1X5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Aug 2020 19:57:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27248 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726800AbgH1X5H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Aug 2020 19:57:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598659026; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rM/B9BakHyUJZNVQSwabD9JaPVxM+jNpDiVkIVk/tQk=; b=pehB+AZUoUyTIp6h0h5Lai01JTNYvKfbG8zWYxiTaHvq9/YpIFrD4MB02gaXYbjGzfmxwyGM
 kBLCWiNPP1Fl+6DyYYpiQ5+ceZiJa2010LcIQSKnb8DixPense8AzGy8Qr7gaYunsH8DC2V+
 t3Or7d4ItpZtexP7osk/G+7lelI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f4999cbae54fd8e987d49d6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 28 Aug 2020 23:56:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7D4A9C43387; Fri, 28 Aug 2020 23:56:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: collinsd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7A40C433CA;
        Fri, 28 Aug 2020 23:56:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C7A40C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=collinsd@codeaurora.org
From:   David Collins <collinsd@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] spmi: prefix spmi bus device names with "spmi"
Date:   Fri, 28 Aug 2020 16:55:59 -0700
Message-Id: <1598658959-31307-1-git-send-email-collinsd@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Change the format of spmi bus device names from:
  <spmi_bus_number>-<spmi_device_sid>
  Example: 0-01
to this:
  spmi<spmi_bus_number>-<spmi_device_sid>
  Example: spmi0-01

This helps to disambiguate SPMI device regmaps from I2C ones
at /sys/kernel/debug/regmap since I2C devices use a very
similar naming scheme: 0-0000.

Signed-off-by: David Collins <collinsd@codeaurora.org>
---
 drivers/spmi/spmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index c16b60f..ec94439 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2015, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2015, 2020, The Linux Foundation. All rights reserved.
  */
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -62,7 +62,7 @@ int spmi_device_add(struct spmi_device *sdev)
 	struct spmi_controller *ctrl = sdev->ctrl;
 	int err;
 
-	dev_set_name(&sdev->dev, "%d-%02x", ctrl->nr, sdev->usid);
+	dev_set_name(&sdev->dev, "spmi%d-%02x", ctrl->nr, sdev->usid);
 
 	err = device_add(&sdev->dev);
 	if (err < 0) {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

