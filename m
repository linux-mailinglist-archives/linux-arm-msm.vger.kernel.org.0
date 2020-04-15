Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D5D1A93EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2020 09:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393657AbgDOHQq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Apr 2020 03:16:46 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:63389 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390559AbgDOHQo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Apr 2020 03:16:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586935003; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=r0ASbx76zEYcIvIxWCRR1An50JcQx/PpRvNppB/eEmM=; b=DyXo2Fl+joBFcMeDnlfqTgyfhgd6Z9Za/LynKkDaum79FrjzkjZUI1BI0wk9kMpqu/VEZVdm
 9x9y0g1l+7WcAmsVi1cWm1l0mh/1nLpY+RfB3cu+i+Qr6bUlzMkzwwEotKak2TRDi0pLKL9x
 eo0AtHUGB8hzG+LRdkb+IGB07Fw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e96b4db.7fabf31fd730-smtp-out-n04;
 Wed, 15 Apr 2020 07:16:43 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5B5E0C43636; Wed, 15 Apr 2020 07:16:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B3C5C433CB;
        Wed, 15 Apr 2020 07:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2B3C5C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 1/2] remoteproc: qcom_q6v5_mss: map/unmap mpss segments before/after use
Date:   Wed, 15 Apr 2020 12:46:18 +0530
Message-Id: <20200415071619.6052-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The application processor accessing the mpss region when the Q6 modem is
running will lead to an XPU violation. Fix this by un-mapping the mpss
segments post copy during mpss authentication and coredumps.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

V2:
 * use ioremap_wc/iounmap instead of the devm_ variants
 * with mpss_region no longer relevant leave rproc_da_to_va unused

 drivers/remoteproc/qcom_q6v5_mss.c | 31 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ce49c3236ff7c..b781fc8de3597 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1156,7 +1156,13 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			goto release_firmware;
 		}
 
-		ptr = qproc->mpss_region + offset;
+		ptr = ioremap_wc(qproc->mpss_phys + offset, phdr->p_memsz);
+		if (!ptr) {
+			dev_err(qproc->dev,
+				"unable to map memory region: %pa+%zx-%x\n",
+				&qproc->mpss_phys, offset, phdr->p_memsz);
+			goto release_firmware;
+		}
 
 		if (phdr->p_filesz && phdr->p_offset < fw->size) {
 			/* Firmware is large enough to be non-split */
@@ -1165,6 +1171,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 					"failed to load segment %d from truncated file %s\n",
 					i, fw_name);
 				ret = -EINVAL;
+				iounmap(ptr);
 				goto release_firmware;
 			}
 
@@ -1175,6 +1182,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
 			if (ret) {
 				dev_err(qproc->dev, "failed to load %s\n", fw_name);
+				iounmap(ptr);
 				goto release_firmware;
 			}
 
@@ -1187,6 +1195,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			memset(ptr + phdr->p_filesz, 0,
 			       phdr->p_memsz - phdr->p_filesz);
 		}
+		iounmap(ptr);
 		size += phdr->p_memsz;
 
 		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
@@ -1236,7 +1245,8 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 	int ret = 0;
 	struct q6v5 *qproc = rproc->priv;
 	unsigned long mask = BIT((unsigned long)segment->priv);
-	void *ptr = rproc_da_to_va(rproc, segment->da, segment->size);
+	int offset = segment->da - qproc->mpss_reloc;
+	void *ptr = NULL;
 
 	/* Unlock mba before copying segments */
 	if (!qproc->dump_mba_loaded) {
@@ -1250,10 +1260,15 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 		}
 	}
 
-	if (!ptr || ret)
-		memset(dest, 0xff, segment->size);
-	else
+	if (!ret)
+		ptr = ioremap_wc(qproc->mpss_phys + offset, segment->size);
+
+	if (ptr) {
 		memcpy(dest, ptr, segment->size);
+		iounmap(ptr);
+	} else {
+		memset(dest, 0xff, segment->size);
+	}
 
 	qproc->dump_segment_mask |= mask;
 
@@ -1595,12 +1610,6 @@ static int q6v5_alloc_memory_region(struct q6v5 *qproc)
 
 	qproc->mpss_phys = qproc->mpss_reloc = r.start;
 	qproc->mpss_size = resource_size(&r);
-	qproc->mpss_region = devm_ioremap_wc(qproc->dev, qproc->mpss_phys, qproc->mpss_size);
-	if (!qproc->mpss_region) {
-		dev_err(qproc->dev, "unable to map memory region: %pa+%zx\n",
-			&r.start, qproc->mpss_size);
-		return -EBUSY;
-	}
 
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
