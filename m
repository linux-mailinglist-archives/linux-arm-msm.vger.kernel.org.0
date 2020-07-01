Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC242113E2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2020 21:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbgGATuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jul 2020 15:50:13 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:46234 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725771AbgGATuN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jul 2020 15:50:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593633012; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=+jpfSIhI65OcrMw29hQYXe/ZbIGzERi4tItiMsp5xK8=; b=JEK1D016cK1ytua+ILoBs8OWMbMeulsaWa49CrUKKsnfLErun+G6p1h16wcvxBoJdULeA7W2
 Xg0Hbot+1VEoXZL5jzcdbk14N+yHJfdJPcFfif8mg2rXuqqgyCJlXPUh3/SXBPiPC0tvYVhV
 H9AbAs2U59xKOW7o46xQZ3uC91k=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-east-1.postgun.com with SMTP id
 5efce8e50206ad41d197bb31 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 01 Jul 2020 19:49:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D045FC43391; Wed,  1 Jul 2020 19:49:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 93698C433C6;
        Wed,  1 Jul 2020 19:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 93698C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Replace mask based tracking with size
Date:   Thu,  2 Jul 2020 01:19:40 +0530
Message-Id: <20200701194940.8808-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In order to land inline coredump support for mss, the dump_segment
function would need to support granularities less than the segment
size. This is achieved by replacing mask based tracking with size.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 903b2bb97e122..1f5d7a83ccf31 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -182,8 +182,8 @@ struct q6v5 {
 	bool running;
 
 	bool dump_mba_loaded;
-	unsigned long dump_segment_mask;
-	unsigned long dump_complete_mask;
+	size_t current_dump_size;
+	size_t total_dump_size;
 
 	phys_addr_t mba_phys;
 	void *mba_region;
@@ -1204,7 +1204,6 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 {
 	int ret = 0;
 	struct q6v5 *qproc = rproc->priv;
-	unsigned long mask = BIT((unsigned long)segment->priv);
 	int offset = segment->da - qproc->mpss_reloc;
 	void *ptr = NULL;
 
@@ -1230,10 +1229,10 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 		memset(dest, 0xff, segment->size);
 	}
 
-	qproc->dump_segment_mask |= mask;
+	qproc->current_dump_size += segment->size;
 
 	/* Reclaim mba after copying segments */
-	if (qproc->dump_segment_mask == qproc->dump_complete_mask) {
+	if (qproc->current_dump_size == qproc->total_dump_size) {
 		if (qproc->dump_mba_loaded) {
 			/* Try to reset ownership back to Q6 */
 			q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm,
@@ -1275,7 +1274,7 @@ static int q6v5_start(struct rproc *rproc)
 			"Failed to reclaim mba buffer system may become unstable\n");
 
 	/* Reset Dump Segment Mask */
-	qproc->dump_segment_mask = 0;
+	qproc->current_dump_size = 0;
 	qproc->running = true;
 
 	return 0;
@@ -1324,7 +1323,7 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
 
 	ehdr = (struct elf32_hdr *)fw->data;
 	phdrs = (struct elf32_phdr *)(ehdr + 1);
-	qproc->dump_complete_mask = 0;
+	qproc->total_dump_size = 0;
 
 	for (i = 0; i < ehdr->e_phnum; i++) {
 		phdr = &phdrs[i];
@@ -1339,7 +1338,7 @@ static int qcom_q6v5_register_dump_segments(struct rproc *rproc,
 		if (ret)
 			break;
 
-		qproc->dump_complete_mask |= BIT(i);
+		qproc->total_dump_size += phdr->p_memsz;
 	}
 
 	release_firmware(fw);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

