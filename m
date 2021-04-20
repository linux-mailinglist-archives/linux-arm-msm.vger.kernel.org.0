Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088AE365123
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Apr 2021 05:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbhDTDye (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Apr 2021 23:54:34 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:45821 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229508AbhDTDyd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Apr 2021 23:54:33 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618890842; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=9PYAsr16mLZxuGI6W1iWLt3mn8BKMbEgQzzE4aMKm4Q=; b=haW/xuLzo+L+dFsWhTSnUOPAqseb2bqvC3xkzTHXS5t8Xhtga5KFkCfUrFZtl4A2Iq6j6QK/
 hjwtWPo0KL39U6C+Yw43tPlb1eE5OdNSIhdVfxjx2ZA55aXz4qLZpoe5mgB9GPR5Q5ViyODd
 MXlPhYVWPqZFo1Q1kHp9UtmjyJU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 607e504be0e9c9a6b64b8c1a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 20 Apr 2021 03:53:47
 GMT
Sender: bqiang=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6B5F1C4338A; Tue, 20 Apr 2021 03:53:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from z230.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bqiang)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5ABAC433D3;
        Tue, 20 Apr 2021 03:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5ABAC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bqiang@codeaurora.org
From:   Baochen Qiang <bqiang@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
Subject: [PATCH] mhi: add MHI_STATE_M2 to resume success criteria
Date:   Tue, 20 Apr 2021 11:53:39 +0800
Message-Id: <20210420035339.282963-1-bqiang@codeaurora.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

During system resume, mhi driver triggers M3->M0 transition and then waits
for target device to enter M0 state. Once done, the device queues a state
change event into ctrl event ring and notify mhi dirver by raising an
interrupt, where a tasklet is scheduled to process this event. In most cases,
the taklet is served timely and wait operation succeeds.

However, there are cases where CPU is busy and can not serve this tasklet
for some time. Once delay goes long enough, the device moves itself to M1
state and also interrupts mhi driver after inserting a new state change
event to ctrl ring. Later CPU finally has time to process the ring, however
there are two events in it now:
	1. for M3->M0 event, which is processed first as queued first,
	   tasklet handler updates device state to M0 and wakes up the task,
	   i.e., the mhi driver.
	2. for M0->M1 event, which is processed later, tasklet handler
	   triggers M1->M2 transition and updates device state to M2 directly,
	   then wakes up the mhi driver(if still sleeping on this wait queue).
Note that although mhi driver has been woken up while processing the first
event, it may still has no chance to run before the second event is processed.
In other words, mhi driver has to keep waiting till timeout cause the M0 state
has been missed.

kernel log here:
...
Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.911251] mhi 0000:06:00.0: Entered with PM state: M3, MHI state: M3
Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917762] mhi 0000:06:00.0: State change event to state: M0
Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4247.917767] mhi 0000:06:00.0: State change event to state: M1
Apr 15 01:45:14 test-NUC8i7HVK kernel: [ 4338.788231] mhi 0000:06:00.0: Did not enter M0 state, MHI state: M2, PM state: M2
...

Fix this issue by simply adding M2 as a valid state for resume.

Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1

Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
---
 drivers/bus/mhi/core/pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
index ce73cfa63cb3..ca5f2feed9d5 100644
--- a/drivers/bus/mhi/core/pm.c
+++ b/drivers/bus/mhi/core/pm.c
@@ -900,6 +900,7 @@ int mhi_pm_resume(struct mhi_controller *mhi_cntrl)
 
 	ret = wait_event_timeout(mhi_cntrl->state_event,
 				 mhi_cntrl->dev_state == MHI_STATE_M0 ||
+				 mhi_cntrl->dev_state == MHI_STATE_M2 ||
 				 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
 				 msecs_to_jiffies(mhi_cntrl->timeout_ms));
 
-- 
2.25.1

