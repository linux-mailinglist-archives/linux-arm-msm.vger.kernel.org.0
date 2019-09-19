Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9895FB832B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2019 23:14:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733017AbfISVOE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Sep 2019 17:14:04 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46872 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733012AbfISVOE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Sep 2019 17:14:04 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 915E0614DB; Thu, 19 Sep 2019 21:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568927643;
        bh=KRNk2S5gZA412W14oKRxzMDd/ncyEhN7XLY9M5tqf9U=;
        h=From:To:Cc:Subject:Date:From;
        b=Oq3rc5DMYudDuG9XsGRkOGjKOyfb6Uo6qrGwVTPTxzAOK7sMDs5rLwYG1VQM+GCT9
         56W6QRZ9noFnWewOJ2Owrh3u4GnPH33pK76JpxRaLKBuVNLIHvXfbPdSaHJg7DeTBh
         0g0jZJfbywPvBqrzsBw4LJXdeg5yFo/NTHzNXUaQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mnalajal@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32728611DC;
        Thu, 19 Sep 2019 21:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568927638;
        bh=KRNk2S5gZA412W14oKRxzMDd/ncyEhN7XLY9M5tqf9U=;
        h=From:To:Cc:Subject:Date:From;
        b=XO6KFt2NWij/To1WWwPASCUg8IM8Y+Gemu6RIt8JVDXq81vMzClXisT3/YhirFPKj
         L8UwCDafkC5udKcLCv6e3b2KMc9rJ9j7vmcjIRl3gN9XK/olEFWlR/W55xZZ8BgxFx
         7/wJQMmpYE0mwnM3lc8ewg0M/YLSQLoElT9eNh5Y=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 32728611DC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mnalajal@codeaurora.org
From:   Murali Nalajala <mnalajal@codeaurora.org>
To:     gregkh@linuxfoundation.org, rafael@kernel.org
Cc:     mnalajal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org
Subject: [PATCH] base: soc: Export soc_device_to_device API
Date:   Thu, 19 Sep 2019 14:13:44 -0700
Message-Id: <1568927624-13682-1-git-send-email-mnalajal@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If the soc drivers want to add custom sysfs entries it needs to
access "dev" field in "struct soc_device". This can be achieved
by "soc_device_to_device" API. Soc drivers which are built as a
module they need above API to be exported. Otherwise one can
observe compilation issues.

Signed-off-by: Murali Nalajala <mnalajal@codeaurora.org>
---
 drivers/base/soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index 7c0c5ca..4ad52f6 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -41,6 +41,7 @@ struct device *soc_device_to_device(struct soc_device *soc_dev)
 {
 	return &soc_dev->dev;
 }
+EXPORT_SYMBOL_GPL(soc_device_to_device);
 
 static umode_t soc_attribute_mode(struct kobject *kobj,
 				struct attribute *attr,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

