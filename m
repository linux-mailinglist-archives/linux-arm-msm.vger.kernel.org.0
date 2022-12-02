Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1ED56403A8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 10:46:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232214AbiLBJqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 04:46:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233166AbiLBJqN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 04:46:13 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8044AC510B;
        Fri,  2 Dec 2022 01:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1669974357; x=1701510357;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=oq2AA38vFA2nQ598SuUp+klmjkxSXqOaUB0WVea32Ls=;
  b=H1JcGwhydofHGKfZ4gseN9HjkamUYTsUX/Ep79flToN0UC+lh5Gx8Dwk
   I48NvUBxCmCgxkUhFA/IOxGzMm9qVrEMwC2rowQENPO4P1IucQ28RdE6p
   gqIgWUJUoJVIe1RKtlrn6fUxyMPwG+1kdjLZvMlCpPc+VSI8QQFoEnoQt
   w=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 02 Dec 2022 01:45:57 -0800
X-QCInternal: smtphost
Received: from unknown (HELO nasanex01a.na.qualcomm.com) ([10.52.223.231])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 01:45:56 -0800
Received: from aiquny2-gv.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 2 Dec 2022 01:45:55 -0800
From:   Maria Yu <quic_aiquny@quicinc.com>
To:     <mathieu.poirier@linaro.org>
CC:     Maria Yu <quic_aiquny@quicinc.com>, <arnaud.pouliquen@foss.st.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <quic_clew@quicinc.com>
Subject: [PATCH v5 1/2] remoteproc: core: do pm relax when in RPROC_OFFLINE
Date:   Fri, 2 Dec 2022 17:45:31 +0800
Message-ID: <20221202094532.2925-2-quic_aiquny@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202094532.2925-1-quic_aiquny@quicinc.com>
References: <20221202094532.2925-1-quic_aiquny@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPROC_OFFLINE state indicate there is no recovery process
is in progress and no chance to do the pm_relax.
Because when recovering from crash, rproc->lock is held and
state is RPROC_CRASHED -> RPROC_OFFLINE -> RPROC_RUNNING,
and then unlock rproc->lock.
When the state is in RPROC_OFFLINE it means separate request
of rproc_stop was done and no need to hold the wakeup source
in crash handler to recover any more.

Signed-off-by: Maria Yu <quic_aiquny@quicinc.com>
---
 drivers/remoteproc/remoteproc_core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 8768cb64f560..c2d0af048c69 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1862,11 +1862,16 @@ static void rproc_crash_handler_work(struct work_struct *work)
 
 	mutex_lock(&rproc->lock);
 
-	if (rproc->state == RPROC_CRASHED || rproc->state == RPROC_OFFLINE) {
+	if (rproc->state == RPROC_CRASHED) {
 		/* handle only the first crash detected */
 		mutex_unlock(&rproc->lock);
 		return;
 	}
+	if (rproc->state == RPROC_OFFLINE) {
+		/* no need to recover if remote processor is offline */
+		mutex_unlock(&rproc->lock);
+		goto out;
+	}
 
 	rproc->state = RPROC_CRASHED;
 	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
@@ -1877,6 +1882,7 @@ static void rproc_crash_handler_work(struct work_struct *work)
 	if (!rproc->recovery_disabled)
 		rproc_trigger_recovery(rproc);
 
+out:
 	pm_relax(rproc->dev.parent);
 }
 
-- 
2.17.1

