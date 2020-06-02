Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38D921EC018
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2020 18:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgFBQdp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 12:33:45 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:59194 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727924AbgFBQdp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 12:33:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591115624; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=0Wg0j3MT/PP/B4nsIIgBp6QzDb8kDeHUDCr/A+ztDKA=; b=B0Uz/MpRkHwbKMUwz8/9Jla1M2IVhwec+wm3y09zKhNafWbKybyClwmwrmyugeirM77oGIVb
 Gr6YO+dHXr8dOEr0Bf0GrHiFhxm/tto9p8sN5usg3ejiQAJwniXfQ5l2fEZgE9g5rZGAuvL7
 7pu4MfhVRuLJH1ghOcX6rq+JnUg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5ed67f5009c3530d12e50571 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Jun 2020 16:33:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA83AC433CA; Tue,  2 Jun 2020 16:33:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7A7C4C43395;
        Tue,  2 Jun 2020 16:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7A7C4C43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com, rohitkr@codeaurora.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 2/2] remoteproc: qcom_q6v5_mss: Remove redundant running state
Date:   Tue,  2 Jun 2020 22:02:57 +0530
Message-Id: <20200602163257.26978-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200602163257.26978-1-sibis@codeaurora.org>
References: <20200602163257.26978-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove the redundant running state, as an equivalent is maintained in
the common q6v5 resource handling helpers.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index feb70283b6a21..702352cd66188 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -178,8 +178,6 @@ struct q6v5 {
 	int active_reg_count;
 	int proxy_reg_count;
 
-	bool running;
-
 	bool dump_mba_loaded;
 	unsigned long dump_segment_mask;
 	unsigned long dump_complete_mask;
@@ -1275,7 +1273,6 @@ static int q6v5_start(struct rproc *rproc)
 
 	/* Reset Dump Segment Mask */
 	qproc->dump_segment_mask = 0;
-	qproc->running = true;
 
 	return 0;
 
@@ -1290,8 +1287,6 @@ static int q6v5_stop(struct rproc *rproc)
 	struct q6v5 *qproc = (struct q6v5 *)rproc->priv;
 	int ret;
 
-	qproc->running = false;
-
 	ret = qcom_q6v5_request_stop(&qproc->q6v5);
 	if (ret == -ETIMEDOUT)
 		dev_err(qproc->dev, "timed out on wait\n");
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

