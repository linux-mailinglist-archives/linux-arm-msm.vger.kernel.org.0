Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BB3A2A5E87
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Nov 2020 08:04:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727001AbgKDHEb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Nov 2020 02:04:31 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:19517 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727098AbgKDHEb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Nov 2020 02:04:31 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604473471; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=842P1Vw0/CyU8oFdqPii40F1dxpgOb7DzwKwSzArais=; b=am3GLPeKnIQ54OMxCUr5B5/iB1ZJc4pkfyCMpi/xv4Em8DPYX0E5aOMtKB2rm0ELjyLGTDod
 Xye5YvR1BfoBr5CjAoVAHPQaOWdruJmNsBDup70AiNNaqUvyP9wkL5wdWWayRxY7DjGau7+k
 C3uShX1Sjs/W9Q7XHSgCRAFgZ0s=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fa2525dca0638c0dca909f5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Nov 2020 07:03:57
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2A153C433FF; Wed,  4 Nov 2020 07:03:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D258C433C6;
        Wed,  4 Nov 2020 07:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D258C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        agross@kernel.org, evgreen@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/2] remoteproc: qcom_q6v5_mss: Replace ioremap with memremap
Date:   Wed,  4 Nov 2020 12:33:41 +0530
Message-Id: <1604473422-29639-1-git-send-email-sibis@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the sparse warnings reported by the kernel test bot by replacing
ioremap calls with memremap.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

I'll send out the patches to convert ioremap to memremap on other
qc remoteproc drivers once I get a chance to test them.

 drivers/remoteproc/qcom_q6v5_mss.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 9a473cfef758..2c866b6da23c 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1194,7 +1194,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			goto release_firmware;
 		}
 
-		ptr = ioremap_wc(qproc->mpss_phys + offset, phdr->p_memsz);
+		ptr = memremap(qproc->mpss_phys + offset, phdr->p_memsz, MEMREMAP_WC);
 		if (!ptr) {
 			dev_err(qproc->dev,
 				"unable to map memory region: %pa+%zx-%x\n",
@@ -1209,7 +1209,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 					"failed to load segment %d from truncated file %s\n",
 					i, fw_name);
 				ret = -EINVAL;
-				iounmap(ptr);
+				memunmap(ptr);
 				goto release_firmware;
 			}
 
@@ -1221,7 +1221,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 							ptr, phdr->p_filesz);
 			if (ret) {
 				dev_err(qproc->dev, "failed to load %s\n", fw_name);
-				iounmap(ptr);
+				memunmap(ptr);
 				goto release_firmware;
 			}
 
@@ -1232,7 +1232,7 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 			memset(ptr + phdr->p_filesz, 0,
 			       phdr->p_memsz - phdr->p_filesz);
 		}
-		iounmap(ptr);
+		memunmap(ptr);
 		size += phdr->p_memsz;
 
 		code_length = readl(qproc->rmb_base + RMB_PMI_CODE_LENGTH_REG);
@@ -1299,11 +1299,11 @@ static void qcom_q6v5_dump_segment(struct rproc *rproc,
 	}
 
 	if (!ret)
-		ptr = ioremap_wc(qproc->mpss_phys + offset + cp_offset, size);
+		ptr = memremap(qproc->mpss_phys + offset + cp_offset, size, MEMREMAP_WC);
 
 	if (ptr) {
 		memcpy(dest, ptr, size);
-		iounmap(ptr);
+		memunmap(ptr);
 	} else {
 		memset(dest, 0xff, size);
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

