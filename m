Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBC3026AC38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 20:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727951AbgIORim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 13:38:42 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:39943 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727946AbgIORhn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 13:37:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600191447; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=SfPogHCOVXzD1t3NOZd7E7xh1krkIKc4i6JLC9hjcYw=; b=tBT3/fBFLf3k9KKe/CFXKacX0nkiIq8aHlF87LV5xg1l3gypx4G0l9UuhRPyz8A5Te7E71ru
 GG6H1zuG/UshmIWE6+w3XWuwa+xekWE1q8fr3JEqVL7/jU/pl9oaEWIFKaw+D4Yq7/fwE9hw
 Bw2hMyhSACmtVzelHFP1lzKE1a0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f60fbd5be06707b34317b45 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Sep 2020 17:37:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0DA1DC43382; Tue, 15 Sep 2020 17:37:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A6A5BC433CA;
        Tue, 15 Sep 2020 17:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A6A5BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ohad@wizery.com, evgreen@chromium.org, swboyd@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] remoteproc: qcom_q6v5: Assign mpss region to Q6 before MBA cold boot
Date:   Tue, 15 Sep 2020 23:07:13 +0530
Message-Id: <20200915173713.28098-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On secure devices which support warm reset, the modem subsystem requires
access to the mpss region to clear them out. Hence assign the mpss region
to Q6 before MBA cold boot. This will be a nop during a modem SSR.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---

I didn't want to add any new flags for warm reset support because
calling xfer for mpss to q6 shouldn't have any side effects on
platforms that don't support warm resets.

 drivers/remoteproc/qcom_q6v5_mss.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index c401bcc263fa5..cc5b7edc02c73 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -931,6 +931,18 @@ static int q6v5_mba_load(struct q6v5 *qproc)
 		goto assert_reset;
 	}
 
+	/**
+	 * On secure devices which support warm reboot, the modem subsystem's cold boot is similar
+	 * to an SSR sequence i.e the mba requires access to the modem memory to clear it out during
+	 * Q6 cold boot. For modem SSR it will be a nop.
+	 */
+	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mpss_perm, false, true,
+				      qproc->mpss_phys, qproc->mpss_size);
+	if (ret) {
+		dev_err(qproc->dev, "assigning Q6 access to mpss memory failed: %d\n", ret);
+		goto disable_active_clks;
+	}
+
 	/* Assign MBA image access in DDR to q6 */
 	ret = q6v5_xfer_mem_ownership(qproc, &qproc->mba_perm, false, true,
 				      qproc->mba_phys, qproc->mba_size);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

