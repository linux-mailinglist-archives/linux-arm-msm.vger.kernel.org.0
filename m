Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34704171A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Sep 2021 14:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245760AbhIXMVH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Sep 2021 08:21:07 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:15766 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245562AbhIXMVE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Sep 2021 08:21:04 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Sep 2021 05:19:31 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Sep 2021 05:19:30 -0700
X-QCInternal: smtphost
Received: from ekangupt-linux.qualcomm.com ([10.204.67.11])
  by ironmsg02-blr.qualcomm.com with ESMTP; 24 Sep 2021 17:49:15 +0530
Received: by ekangupt-linux.qualcomm.com (Postfix, from userid 2319895)
        id 5ED4D4314; Fri, 24 Sep 2021 17:49:14 +0530 (IST)
From:   Jeya R <jeyr@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org, srinivas.kandagatla@linaro.org
Cc:     Jeya R <jeyr@codeaurora.org>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, fastrpc.upstream@qti.qualcomm.com
Subject: [PATCH 3/4] misc: fastrpc: Set channel as secure
Date:   Fri, 24 Sep 2021 17:49:10 +0530
Message-Id: <1632485951-13473-4-git-send-email-jeyr@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
References: <1632485951-13473-1-git-send-email-jeyr@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Set channel as secure based on domain ID and secure domain DT property.
All DSP domains other than CDSP are set as secure by default and for
CDSP domain, secure flag is set if property is added to DT file.

Signed-off-by: Jeya R <jeyr@codeaurora.org>
---
 drivers/misc/fastrpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 07c41a5..631713d 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -216,6 +216,7 @@ struct fastrpc_channel_ctx {
 	struct miscdevice miscdev;
 	struct miscdevice securedev;
 	struct kref refcount;
+	bool secure;
 };
 
 struct fastrpc_user {
@@ -1646,6 +1647,12 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (!data)
 		return -ENOMEM;
 
+	if (domain_id != CDSP_DOMAIN_ID)
+		data->secure = true;
+	else
+		data->secure = of_property_read_bool(rdev->of_node,
+				"qcom,secure-domain");
+
 	data->miscdev.minor = MISC_DYNAMIC_MINOR;
 	data->miscdev.name = devm_kasprintf(rdev, GFP_KERNEL, "fastrpc-%s",
 					    domains[domain_id]);
-- 
2.7.4

