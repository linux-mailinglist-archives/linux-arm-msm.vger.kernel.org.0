Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A69A61FA800
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2020 06:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725306AbgFPEzB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jun 2020 00:55:01 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:47502 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgFPEy7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jun 2020 00:54:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592283299; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=jZgiC6HhF4H2yMBLQ2oV+GtHGZHze8D5AayubjjnhoU=; b=Js8yxSFAkBDA6TUuCe0BKQAHKfR9dHYdvv1j/BnWgftumxTLU0i3t+iO70VKx69M3eWakEmQ
 Scrr56Fii9nDo2lenDUDDIULqanmxQXv25ZG5HtitjHR/uoXG59Qfhd2dP0RcR63GmGaWe1H
 3pCqZ6O9mT2UkxrumNuCX9bK1nk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ee8509ca3d8a4474337e77a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Jun 2020 04:54:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D82CDC433CB; Tue, 16 Jun 2020 04:54:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C065AC433CA;
        Tue, 16 Jun 2020 04:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C065AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] coresight: tmc: Fix TMC mode read in tmc_read_unprepare_etb()
Date:   Tue, 16 Jun 2020 10:24:41 +0530
Message-Id: <20200616045441.27483-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Reading TMC mode register without proper coresight power
management can lead to exceptions like the one in the call
trace below in tmc_read_unprepare_etb() when the trace data
is read after the sink is disabled. So fix this by having
a check for coresight sysfs mode before reading TMC mode
management register in tmc_read_unprepare_etb() similar to
tmc_read_prepare_etb().

  SError Interrupt on CPU6, code 0xbe000411 -- SError
  pstate: 80400089 (Nzcv daIf +PAN -UAO)
  pc : tmc_read_unprepare_etb+0x74/0x108
  lr : tmc_read_unprepare_etb+0x54/0x108
  sp : ffffff80d9507c30
  x29: ffffff80d9507c30 x28: ffffff80b3569a0c
  x27: 0000000000000000 x26: 00000000000a0001
  x25: ffffff80cbae9550 x24: 0000000000000010
  x23: ffffffd07296b0f0 x22: ffffffd0109ee028
  x21: 0000000000000000 x20: ffffff80d19e70e0
  x19: ffffff80d19e7080 x18: 0000000000000000
  x17: 0000000000000000 x16: 0000000000000000
  x15: 0000000000000000 x14: 0000000000000000
  x13: 0000000000000000 x12: 0000000000000000
  x11: 0000000000000000 x10: dfffffd000000001
  x9 : 0000000000000000 x8 : 0000000000000002
  x7 : ffffffd071d0fe78 x6 : 0000000000000000
  x5 : 0000000000000080 x4 : 0000000000000001
  x3 : ffffffd071d0fe98 x2 : 0000000000000000
  x1 : 0000000000000004 x0 : 0000000000000001
  Kernel panic - not syncing: Asynchronous SError Interrupt

Fixes: 4525412a5046 ("coresight: tmc: making prepare/unprepare functions generic")
Reported-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index 36cce2bfb744..6375504ba8b0 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -639,15 +639,14 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 
 	spin_lock_irqsave(&drvdata->spinlock, flags);
 
-	/* There is no point in reading a TMC in HW FIFO mode */
-	mode = readl_relaxed(drvdata->base + TMC_MODE);
-	if (mode != TMC_MODE_CIRCULAR_BUFFER) {
-		spin_unlock_irqrestore(&drvdata->spinlock, flags);
-		return -EINVAL;
-	}
-
 	/* Re-enable the TMC if need be */
 	if (drvdata->mode == CS_MODE_SYSFS) {
+		/* There is no point in reading a TMC in HW FIFO mode */
+		mode = readl_relaxed(drvdata->base + TMC_MODE);
+		if (mode != TMC_MODE_CIRCULAR_BUFFER) {
+			spin_unlock_irqrestore(&drvdata->spinlock, flags);
+			return -EINVAL;
+		}
 		/*
 		 * The trace run will continue with the same allocated trace
 		 * buffer. As such zero-out the buffer so that we don't end

base-commit: 3d439a6c349778f129de19595db564a8366c3634
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

