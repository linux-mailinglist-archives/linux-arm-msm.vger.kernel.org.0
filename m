Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F9D1D2D9C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 12:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgENKyx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 06:54:53 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:38039 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726340AbgENKyu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 06:54:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589453689; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/k82qTY+EJQvBQprDASUJRtrdU/AV/qO4tr7cq/RAPw=; b=cnpv8Y51UztbxNwIEVRZVePVM+odS6dG8V6gu6Gc9VeDecA9bH+8G8V9O+ICc84r8Ju//rz1
 ugHwI0A24GltdnfFNb99yK121rkuN2kop4s/ydFr7rnAetHtd4y8NMbmyELYqBuW0qT6VvIB
 RVJqjj05oWQkrQyYUp41HgTRxRk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd2372.7f0067a23180-smtp-out-n02;
 Thu, 14 May 2020 10:54:42 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44E00C44795; Thu, 14 May 2020 10:54:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: smasetty)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8CFABC4478F;
        Thu, 14 May 2020 10:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8CFABC4478F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=smasetty@codeaurora.org
From:   Sharat Masetty <smasetty@codeaurora.org>
To:     freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        georgi.djakov@linaro.org, mka@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 3/6] OPP: Add and export helper to set bandwidth
Date:   Thu, 14 May 2020 16:24:16 +0530
Message-Id: <1589453659-27581-4-git-send-email-smasetty@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
References: <1589453659-27581-1-git-send-email-smasetty@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Sibi Sankar <sibis@codeaurora.org>

Add and export 'dev_pm_opp_set_bw' to set the bandwidth
levels associated with an OPP for a given frequency.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
---
 drivers/opp/core.c     | 43 +++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_opp.h |  6 ++++++
 2 files changed, 49 insertions(+)

diff --git a/drivers/opp/core.c b/drivers/opp/core.c
index f42b7c4..0f34077 100644
--- a/drivers/opp/core.c
+++ b/drivers/opp/core.c
@@ -828,6 +828,49 @@ static int _set_required_opps(struct device *dev,
 }

 /**
+ * dev_pm_opp_set_bw() - sets bandwidth levels corresponding to an available opp
+ * @dev:	device for which we do this operation
+ * @opp:	opp based on which the bandwidth levels are to be configured
+ *
+ * This configures the bandwidth to the levels specified
+ * by the OPP.
+ *
+ * Return: 0 on success or a negative error value.
+ */
+int dev_pm_opp_set_bw(struct device *dev, struct dev_pm_opp *opp)
+{
+	struct opp_table *opp_table;
+	int ret = -EINVAL;
+	int i;
+
+	if (IS_ERR_OR_NULL(opp) || !opp->available) {
+		dev_err(dev, "%s: Invalid parameters\n", __func__);
+		return -EINVAL;
+	}
+
+	opp_table = _find_opp_table(dev);
+	if (IS_ERR(opp_table)) {
+		dev_err(dev, "%s: device opp table doesn't exist\n", __func__);
+		return PTR_ERR(opp_table);
+	}
+
+	if (opp_table->paths) {
+		for (i = 0; i < opp_table->path_count; i++) {
+			ret = icc_set_bw(opp_table->paths[i],
+					 opp->bandwidth[i].avg,
+					 opp->bandwidth[i].peak);
+			if (ret)
+				dev_err(dev, "Failed to set bandwidth[%d]: %d\n",
+					i, ret);
+		}
+	}
+
+	dev_pm_opp_put_opp_table(opp_table);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dev_pm_opp_set_bw);
+
+/**
  * dev_pm_opp_set_rate() - Configure new OPP based on frequency
  * @dev:	 device for which we do this operation
  * @target_freq: frequency to achieve
diff --git a/include/linux/pm_opp.h b/include/linux/pm_opp.h
index 76f8c6b..04f7fda 100644
--- a/include/linux/pm_opp.h
+++ b/include/linux/pm_opp.h
@@ -156,6 +156,7 @@ struct dev_pm_opp *dev_pm_opp_xlate_opp(struct opp_table *src_table,
 					struct opp_table *dst_table,
 					struct dev_pm_opp *src_opp);
 int dev_pm_opp_set_rate(struct device *dev, unsigned long target_freq);
+int dev_pm_opp_set_bw(struct device *dev, struct dev_pm_opp *opp);
 int dev_pm_opp_set_sharing_cpus(struct device *cpu_dev, const struct cpumask *cpumask);
 int dev_pm_opp_get_sharing_cpus(struct device *cpu_dev, struct cpumask *cpumask);
 void dev_pm_opp_remove_table(struct device *dev);
@@ -354,6 +355,11 @@ static inline int dev_pm_opp_set_rate(struct device *dev, unsigned long target_f
 	return -ENOTSUPP;
 }

+static inline int dev_pm_opp_set_bw(struct device *dev, struct dev_pm_opp *opp)
+{
+	return -ENOTSUPP;
+}
+
 static inline int dev_pm_opp_set_sharing_cpus(struct device *cpu_dev, const struct cpumask *cpumask)
 {
 	return -ENOTSUPP;
--
2.7.4
