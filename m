Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D73B5297A45
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Oct 2020 04:01:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1758861AbgJXCBD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 22:01:03 -0400
Received: from z5.mailgun.us ([104.130.96.5]:42199 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758859AbgJXCBD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 22:01:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603504863; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=LsrF9A455fo2bZDr+8/zyU20ZPTx/b0ZJyqUIXY1FFA=; b=Pu1zuzsRc/0W4gkEDWLYIODsZ1lEe/GzzbcePGyXLoqf+nSroqEc5DEh3oRVVa46Wb5I+6+0
 5aCdkws5wyvvzPli1Nc3YOlL3Rkc6HwdzWSfCy55UX1FNqk+RnwrDU0HWgipuCGnbE4wWMJN
 hRxWd2349Rl8wVjHsy93ZmTj2Rc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5f938ad4c6b781f7532371dc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 24 Oct 2020 02:00:52
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 34B52C433FF; Sat, 24 Oct 2020 02:00:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 32855C433C9;
        Sat, 24 Oct 2020 02:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 32855C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        loic.poulain@linaro.org, Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v1 2/2] bus: mhi: core: Check for device supported event rings and channels
Date:   Fri, 23 Oct 2020 19:00:43 -0700
Message-Id: <1603504843-38557-3-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603504843-38557-1-git-send-email-hemantk@codeaurora.org>
References: <1603504843-38557-1-git-send-email-hemantk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It is possible that the device does not support the number of event
rings and channels that the controller would like to use. Read the
MHICFG to determine device-side support and if the controller requests
more than the device supports, bailout without configuring device MMIO
registers.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/init.c     | 31 +++++++++++++++++++++++++++++++
 drivers/bus/mhi/core/internal.h |  4 ++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
index 70fd6af..35a6b1d 100644
--- a/drivers/bus/mhi/core/init.c
+++ b/drivers/bus/mhi/core/init.c
@@ -488,6 +488,37 @@ int mhi_init_mmio(struct mhi_controller *mhi_cntrl)
 		{ 0, 0, 0 }
 	};
 
+	/* range check b/w host and device supported ev rings and channels */
+	ret = mhi_read_reg(mhi_cntrl, base, MHICFG, &val);
+	if (ret) {
+		dev_err(dev, "Unable to read MHICFG register\n");
+		return -EIO;
+	}
+
+	if (MHICFG_NHWER(val) < mhi_cntrl->hw_ev_rings) {
+		dev_err(dev, "#HWEV ring: host requires %d dev supports %d\n",
+			mhi_cntrl->hw_ev_rings, MHICFG_NHWER(val));
+		return -EIO;
+	}
+
+	if (MHICFG_NER(val) < mhi_cntrl->total_ev_rings) {
+		dev_err(dev, "#EV ring: host requires %d dev supports %d\n",
+			mhi_cntrl->total_ev_rings, MHICFG_NER(val));
+		return -EIO;
+	}
+
+	if (MHICFG_NHWCH(val) < mhi_cntrl->hw_chan) {
+		dev_err(dev, "#HWCH: host requires %d dev supports %d\n",
+			mhi_cntrl->hw_chan, MHICFG_NHWCH(val));
+		return -EIO;
+	}
+
+	if (MHICFG_NCH(val) < mhi_cntrl->max_chan) {
+		dev_err(dev, "#CH: host requires %d dev supports %d\n",
+			mhi_cntrl->max_chan, MHICFG_NCH(val));
+		return -EIO;
+	}
+
 	dev_dbg(dev, "Initializing MHI registers\n");
 
 	/* Read channel db offset */
diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 3d8e480..9cbfa71 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -28,6 +28,10 @@ extern struct bus_type mhi_bus_type;
 #define MHICFG_NHWCH_SHIFT (8)
 #define MHICFG_NCH_MASK (0xFF)
 #define MHICFG_NCH_SHIFT (0)
+#define MHICFG_NHWER(n) (((n) & MHICFG_NHWER_MASK) >> MHICFG_NHWER_SHIFT)
+#define MHICFG_NER(n) (((n) & MHICFG_NER_MASK) >> MHICFG_NER_SHIFT)
+#define MHICFG_NHWCH(n) (((n) & MHICFG_NHWCH_MASK) >> MHICFG_NHWCH_SHIFT)
+#define MHICFG_NCH(n) (((n) & MHICFG_NCH_MASK) >> MHICFG_NCH_SHIFT)
 
 #define CHDBOFF (0x18)
 #define CHDBOFF_CHDBOFF_MASK (0xFFFFFFFF)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

