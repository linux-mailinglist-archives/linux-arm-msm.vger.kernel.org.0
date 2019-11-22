Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58ACB10698F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Nov 2019 11:05:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbfKVKFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 05:05:25 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:35036
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727090AbfKVKFY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 05:05:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574417123;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=SwfhzzJwpM9MnIhfXZ760dnZIJQz9cLpHNsA/yyoEQk=;
        b=g7CZNT/K47bRaEx4lwZ+UPY4KP5AUJjLJcRsph6UEr19XSVzdq8qDrR+kikdx0VW
        j4H6c1puy9BU2LX5G5gItQ9gZvipPiasRqv8p9DmIfS3qyleV2hAp//Ci2ONDefHR9B
        fceQUGA6w8QFmiuAEqXXSZrJRVRxNJ/XJY0o7mMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574417123;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=SwfhzzJwpM9MnIhfXZ760dnZIJQz9cLpHNsA/yyoEQk=;
        b=TuW4/hwzFnYcfj0Rpg8pUBa8KYlqZfEjjciXJBXHTyd/LKZDuO0Zvv3ObJpJfejI
        K+aRMX+kivhuB6nGxPaCCEgzcVyTdFA93sDm5Cz/QYry4DgsGQ7PWA5QWh9fkO7LJLi
        8uAGq4zPG+XjnKBA51OUku2lftNxV1MURMRNQPbE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00D1EC342CC
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=aneela@codeaurora.org
From:   Arun Kumar Neelakantam <aneela@codeaurora.org>
To:     ohad@wizery.com, bjorn.andersson@linaro.org, clew@codeaurora.org,
        sricharan@codeaurora.org
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arun Kumar Neelakantam <aneela@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT)
Subject: [PATCH V5 4/5] rpmsg: glink: Expose rpmsg name attr for glink
Date:   Fri, 22 Nov 2019 10:05:23 +0000
Message-ID: <0101016e9292c98a-af06223f-e23c-46ed-8479-8c388051e279-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
References: <1574417087-27594-1-git-send-email-aneela@codeaurora.org>
X-SES-Outgoing: 2019.11.22-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Chris Lew <clew@codeaurora.org>

Expose the name field as an attr so clients listening to uevents for
rpmsg can identify the edge the events correspond to.

Signed-off-by: Chris Lew <clew@codeaurora.org>
Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
---
 drivers/rpmsg/qcom_glink_native.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index c838c19..3732fc6 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -1544,6 +1544,26 @@ static void qcom_glink_work(struct work_struct *work)
 	}
 }
 
+static ssize_t rpmsg_name_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	int ret = 0;
+	const char *name;
+
+	ret = of_property_read_string(dev->of_node, "label", &name);
+	if (ret < 0)
+		name = dev->of_node->name;
+
+	return snprintf(buf, RPMSG_NAME_SIZE, "%s\n", name);
+}
+static DEVICE_ATTR_RO(rpmsg_name);
+
+static struct attribute *qcom_glink_attrs[] = {
+	&dev_attr_rpmsg_name.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(qcom_glink);
+
 static void qcom_glink_device_release(struct device *dev)
 {
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
@@ -1593,6 +1613,12 @@ struct qcom_glink *qcom_glink_native_probe(struct device *dev,
 		return ERR_PTR(-ENOMEM);
 
 	glink->dev = dev;
+	glink->dev->groups = qcom_glink_groups;
+
+	ret = device_add_groups(dev, qcom_glink_groups);
+	if (ret)
+		dev_err(dev, "failed to add groups\n");
+
 	glink->tx_pipe = tx;
 	glink->rx_pipe = rx;
 
-- 
1.9.1

