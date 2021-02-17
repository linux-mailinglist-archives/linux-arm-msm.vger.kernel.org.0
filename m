Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C2131DD50
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Feb 2021 17:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234199AbhBQQ2Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Feb 2021 11:28:16 -0500
Received: from z11.mailgun.us ([104.130.96.11]:12042 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234195AbhBQQ2E (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Feb 2021 11:28:04 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613579259; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=FfWam90evYrs9oiuuAG/yGw15utShTokfK2D2y7pmZE=; b=HeyuVJvlk/8CSTVtYN3foMsDRlTS/ZJTu8iQHViQdsMMKg3HZZ/sU5oDAnESD8jdhA6LXy1v
 s+D9C6Rg4ITQv1XnIF2CVdKSXFsXW4pByRTJpmzen5uaSgxbHbIHtFmxs85S25EBgKhp5jJG
 xxrSJ8s9DCF3NKdMe3cmGCdYBdI=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 602d43d966a058a0ecaa5fa8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Feb 2021 16:27:05
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CC3ADC433ED; Wed, 17 Feb 2021 16:27:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jhugo-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D334CC433C6;
        Wed, 17 Feb 2021 16:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D334CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org
Cc:     bbhatt@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fan Wu <wufan@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [PATCH v3] bus: mhi: core: Return EAGAIN if MHI ring is full
Date:   Wed, 17 Feb 2021 09:26:49 -0700
Message-Id: <1613579209-3675-1-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Fan Wu <wufan@codeaurora.org>

Currently ENOMEM is returned when MHI ring is full. This error code is
very misleading. Change to EAGAIN instead.

Signed-off-by: Fan Wu <wufan@codeaurora.org>
Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---

v3: Fix subject
v2: Change from EBUSY to EAGAIN

 drivers/bus/mhi/core/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
index b63f9e6..1eb2fd3 100644
--- a/drivers/bus/mhi/core/main.c
+++ b/drivers/bus/mhi/core/main.c
@@ -1054,7 +1054,7 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
 
 	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
 	if (unlikely(ret)) {
-		ret = -ENOMEM;
+		ret = -EAGAIN;
 		goto exit_unlock;
 	}
 
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.

