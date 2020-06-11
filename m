Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2E261F6D44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 20:14:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726651AbgFKSNz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 14:13:55 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30928 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726920AbgFKSNx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 14:13:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591899232; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=25uisJ5LBVEr8MdaZLkIMYhClh1rhFD8ZG7rSLGaXaw=; b=NiV5xepkmo5mNGAnofDgVnSOXssSHPWAPGHgj01I7kwD7xw/KEn7gjN765C8zuH5/XjITfUk
 BnUevdr3xHfd9YOSb3p0dZd3W675Yc84dAItZ3YkPfHKRFbSnEqIK4HPki4U5qwFKjmvlYXa
 ITYH9XjeMp8kL3g0L0dM1BJ/Pd8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n13.prod.us-west-2.postgun.com with SMTP id
 5ee274605866879c76a8a0a4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Jun 2020 18:13:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0C2F1C433C8; Thu, 11 Jun 2020 18:13:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2158EC43391;
        Thu, 11 Jun 2020 18:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2158EC43391
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v3 2/4] bus: mhi: core: Move MHI_MAX_MTU to external header file
Date:   Thu, 11 Jun 2020 11:13:42 -0700
Message-Id: <1591899224-3403-3-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
References: <1591899224-3403-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently this macro is defined in internal MHI header as
a TRE length mask. Moving it to external header allows MHI
client drivers to set this upper bound for the transmit
buffer size.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 include/linux/mhi.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index a39b77d..ce43f74 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -16,6 +16,9 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
+/* MHI client drivers to set this upper bound for tx buffer */
+#define MHI_MAX_MTU 0xffff
+
 #define MHI_VOTE_BUS BIT(0) /* do not disable the mhi bus */
 #define MHI_VOTE_DEVICE BIT(1) /* prevent mhi device from entering lpm */
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

