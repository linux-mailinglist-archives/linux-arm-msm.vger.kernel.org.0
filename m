Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93D8C1717E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 13:56:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729110AbgB0M4v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 07:56:51 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:14332 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729074AbgB0M4v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 07:56:51 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582808210; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=GEdNSRK9h+EoZXhdOOmnO3FyQ+zkPPEQKa6CLrSCl9o=; b=fECgQvjW6yb/YXLlIr2d1dU6yWXdpAYSqaiadL3UZ/MQsEvqQtMyICGtmu9v3cOfXtulowss
 CJj8Igny2JdheOnQE3eA1lqoBUvSqovvZB4/yjKuKs5sfXIyWsBOGXfmdf/iTn0vkpHgjVmQ
 1TyilhNSiT70cRWs4patBxwSfdU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e57bc80.7fca9b9da570-smtp-out-n02;
 Thu, 27 Feb 2020 12:56:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BB580C4479D; Thu, 27 Feb 2020 12:56:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A7E13C43383;
        Thu, 27 Feb 2020 12:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A7E13C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, arnd@arndb.de
Cc:     georgi.djakov@linaro.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sboyd@kernel.org, Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] soc: qcom: cmd-db: Fix compilation error when CMD_DB is disabled
Date:   Thu, 27 Feb 2020 18:26:15 +0530
Message-Id: <20200227125615.4727-1-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

If CONFIG_QCOM_COMMAND_DB=n the following compilation errors will be
seen. Fix this by including the appropriate linux headers.

./include/soc/qcom/cmd-db.h: In function ‘cmd_db_read_aux_data’:
./include/soc/qcom/cmd-db.h: error: implicit declaration of function ‘ERR_PTR’;

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 include/soc/qcom/cmd-db.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/qcom/cmd-db.h b/include/soc/qcom/cmd-db.h
index af97222239251..c8bb56e6852a8 100644
--- a/include/soc/qcom/cmd-db.h
+++ b/include/soc/qcom/cmd-db.h
@@ -4,6 +4,7 @@
 #ifndef __QCOM_COMMAND_DB_H__
 #define __QCOM_COMMAND_DB_H__
 
+#include <linux/err.h>
 
 enum cmd_db_hw_type {
 	CMD_DB_HW_INVALID = 0,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
