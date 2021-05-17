Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27890386D8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 01:08:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234739AbhEQXJl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 May 2021 19:09:41 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50878 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237329AbhEQXJk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 May 2021 19:09:40 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1621292903; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=our1eT9PPR2xC+61fn+sydgDdNIFwrvlcoBFRV9/vMA=; b=LEXaLuHhUsPkuNcNSE5vzzCFn8BP9stOc4NBiU+JTAvbJsJRAbsmVJoC9iIyqJsBN054H2ve
 3UbxGBp7F7B5NvFsLAxPa6EPiPs8BtXvia8+7ljVoIZFz0KcxZfl7MrzlvgW1jPojzTWTGuW
 dQpqgudWFdorSGDHfLDx/EvX31I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60a2f7667b9a7a2b6c3a7f5f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 May 2021 23:08:22
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F2CA8C433F1; Mon, 17 May 2021 23:08:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0BD19C433D3;
        Mon, 17 May 2021 23:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0BD19C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, psodagud@codeaurora.org
Subject: [PATCH] remoteproc: core: Invoke subdev callbacks in list order
Date:   Mon, 17 May 2021 16:08:13 -0700
Message-Id: <1621292893-18827-1-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Subdevices at the beginning of the subdev list should have
higher priority than those at the end of the list. Reverse
traversal of the list causes priority inversion, which can
impact the performance of the device.

For example a device adds the glink, sysmon and ssr subdevs
to its list. During a crash the ssr notification would go
before the glink and sysmon notifications. This can cause a
degraded response when a client driver waits for a response
from the crashed rproc.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index 626a6b90f..ac8fc42 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1167,7 +1167,7 @@ static int rproc_handle_resources(struct rproc *rproc,
 
 static int rproc_prepare_subdevices(struct rproc *rproc)
 {
-	struct rproc_subdev *subdev;
+	struct rproc_subdev *subdev, *itr;
 	int ret;
 
 	list_for_each_entry(subdev, &rproc->subdevs, node) {
@@ -1181,9 +1181,11 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
 	return 0;
 
 unroll_preparation:
-	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
-		if (subdev->unprepare)
-			subdev->unprepare(subdev);
+	list_for_each_entry(itr, &rproc->subdevs, node) {
+		if (itr == subdev)
+			break;
+		if (itr->unprepare)
+			itr->unprepare(subdev);
 	}
 
 	return ret;
@@ -1191,7 +1193,7 @@ static int rproc_prepare_subdevices(struct rproc *rproc)
 
 static int rproc_start_subdevices(struct rproc *rproc)
 {
-	struct rproc_subdev *subdev;
+	struct rproc_subdev *subdev, *itr;
 	int ret;
 
 	list_for_each_entry(subdev, &rproc->subdevs, node) {
@@ -1205,9 +1207,11 @@ static int rproc_start_subdevices(struct rproc *rproc)
 	return 0;
 
 unroll_registration:
-	list_for_each_entry_continue_reverse(subdev, &rproc->subdevs, node) {
-		if (subdev->stop)
-			subdev->stop(subdev, true);
+	list_for_each_entry(itr, &rproc->subdevs, node) {
+		if (itr == subdev)
+			break;
+		if (itr->stop)
+			itr->stop(itr, true);
 	}
 
 	return ret;
@@ -1217,7 +1221,7 @@ static void rproc_stop_subdevices(struct rproc *rproc, bool crashed)
 {
 	struct rproc_subdev *subdev;
 
-	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
+	list_for_each_entry(subdev, &rproc->subdevs, node) {
 		if (subdev->stop)
 			subdev->stop(subdev, crashed);
 	}
@@ -1227,7 +1231,7 @@ static void rproc_unprepare_subdevices(struct rproc *rproc)
 {
 	struct rproc_subdev *subdev;
 
-	list_for_each_entry_reverse(subdev, &rproc->subdevs, node) {
+	list_for_each_entry(subdev, &rproc->subdevs, node) {
 		if (subdev->unprepare)
 			subdev->unprepare(subdev);
 	}
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

