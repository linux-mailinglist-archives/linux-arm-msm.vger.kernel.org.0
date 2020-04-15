Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55E331A93F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 09:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441133AbgDOHQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 03:16:52 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:57913 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2441126AbgDOHQr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 03:16:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586935007; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Nys4cLvoDknHxSyWTS2HyubJBTBF+pvhnrA0VKTIbeo=; b=bSVGr93zvgVBe5sl3/5eg6mglrA2Gc38qu3eeT6S4AIYFwOd/6YEVQ+gSnLAwqCOinaUvZyZ
 JYKJi8bqK+iaQgbGwQvoOlqmZohmsRq8uO3catXp1S0bsdEQuyKqfRx9GiZ05l3E9CAfdIqy
 xQLfAKMfZf6nPsfLby5+gP5qo1M=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e96b4df.7ff5c65190d8-smtp-out-n05;
 Wed, 15 Apr 2020 07:16:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1DDB0C433CB; Wed, 15 Apr 2020 07:16:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A500C44788;
        Wed, 15 Apr 2020 07:16:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A500C44788
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Remove unused q6v5_da_to_va function
Date:   Wed, 15 Apr 2020 12:46:19 +0530
Message-Id: <20200415071619.6052-2-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200415071619.6052-1-sibis@codeaurora.org>
References: <20200415071619.6052-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
dump function.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index b781fc8de3597..6a19e0e77236e 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -196,7 +196,6 @@ struct q6v5 {
 
 	phys_addr_t mpss_phys;
 	phys_addr_t mpss_reloc;
-	void *mpss_region;
 	size_t mpss_size;
 
 	struct qcom_rproc_glink glink_subdev;
@@ -1342,18 +1341,6 @@ static int q6v5_stop(struct rproc *rproc)
 	return 0;
 }
 
-static void *q6v5_da_to_va(struct rproc *rproc, u64 da, size_t len)
-{
-	struct q6v5 *qproc = rproc->priv;
-	int offset;
-
-	offset = da - qproc->mpss_reloc;
-	if (offset < 0 || offset + len > qproc->mpss_size)
-		return NULL;
-
-	return qproc->mpss_region + offset;
-}
-
 static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
 					    const struct firmware *mba_fw)
 {
@@ -1399,7 +1386,6 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
 static const struct rproc_ops q6v5_ops = {
 	.start = q6v5_start,
 	.stop = q6v5_stop,
-	.da_to_va = q6v5_da_to_va,
 	.parse_fw = qcom_q6v5_register_dump_segments,
 	.load = q6v5_load,
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
