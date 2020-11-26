Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CF182C51EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Nov 2020 11:20:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387828AbgKZKSz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Nov 2020 05:18:55 -0500
Received: from z5.mailgun.us ([104.130.96.5]:58695 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387802AbgKZKSz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Nov 2020 05:18:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606385934; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=V1pjUYJW5o8iIm9Ve8s/Y7L11LB0RM+Xdzju+6hP3Tc=; b=K2ON84O7WHZ2JankteR+3yQpS/WNW/q7Y1yxw8lStJVyuwqlmE6IuipjuxzYNfyZ8csebg3T
 TWX9TSRbIDhUy6tR4O8gBKBHxrbut9t5qcGvdTbTHoiExR5YEn7gRgWnRdaVN6vcBrvs7Etr
 0WhE9+FWBMVgOr195X7d6o0QK4M=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fbf810ac6fdb18c635f41e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Nov 2020 10:18:50
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3EBECC43460; Thu, 26 Nov 2020 10:18:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E864DC43463;
        Thu, 26 Nov 2020 10:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E864DC43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, andy.gross@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        tkjos@google.com, dianders@chromium.org, ilina@codeaurora.org,
        lsrao@codeaurora.org, Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 2/3] soc: qcom: rpmh: Add rpmh_write_sleep_and_wake() function
Date:   Thu, 26 Nov 2020 15:48:17 +0530
Message-Id: <1606385898-8609-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606385898-8609-1-git-send-email-mkshah@codeaurora.org>
References: <1606385898-8609-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Let RPMH clients call rpmh_write_sleep_and_wake() to immediately
write cached sleep and wake data to the TCSes.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/soc/qcom/rpmh.c | 16 ++++++++++++++++
 include/soc/qcom/rpmh.h |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
index cbe6b96..725b8f0 100644
--- a/drivers/soc/qcom/rpmh.c
+++ b/drivers/soc/qcom/rpmh.c
@@ -515,6 +515,22 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
 }
 
 /**
+ * rpmh_write_sleep_and_wake() - Writes the buffered wake and sleep sets
+ * to TCSes
+ *
+ * @dev: The device making the request
+ *
+ * Return:
+ * * 0          - Success
+ * * Error code - Otherwise
+ */
+int rpmh_write_sleep_and_wake(const struct device *dev)
+{
+	return rpmh_flush(get_rpmh_ctrlr(dev));
+}
+EXPORT_SYMBOL(rpmh_write_sleep_and_wake);
+
+/**
  * rpmh_invalidate: Invalidate sleep and wake sets in batch_cache
  *
  * @dev: The device making the request
diff --git a/include/soc/qcom/rpmh.h b/include/soc/qcom/rpmh.h
index fa8bb53..59b68f8 100644
--- a/include/soc/qcom/rpmh.h
+++ b/include/soc/qcom/rpmh.h
@@ -22,6 +22,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
 
 int rpmh_mode_solver_set(const struct device *dev, bool enable);
 
+int rpmh_write_sleep_and_wake(const struct device *dev);
+
 void rpmh_invalidate(const struct device *dev);
 
 #else
@@ -43,6 +45,9 @@ static inline int rpmh_write_batch(const struct device *dev,
 static int rpmh_mode_solver_set(const struct device *dev, bool enable)
 { return -ENODEV; }
 
+static int rpmh_write_sleep_and_wake(const struct device *dev)
+{ return -ENODEV; }
+
 static inline void rpmh_invalidate(const struct device *dev)
 {
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

