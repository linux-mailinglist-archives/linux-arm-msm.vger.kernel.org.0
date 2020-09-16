Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5665826CB57
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 22:26:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbgIPU0C (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 16:26:02 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:30310 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgIPR0z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:26:55 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2020 10:26:19 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 16 Sep 2020 10:26:17 -0700
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg02-blr.qualcomm.com with ESMTP; 16 Sep 2020 22:56:10 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 8E9A421D3E; Wed, 16 Sep 2020 22:56:09 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: [PATCH v2 2/4] venus: core: vote for video-mem path
Date:   Wed, 16 Sep 2020 22:55:55 +0530
Message-Id: <1600277157-24327-3-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600277157-24327-1-git-send-email-mansur@codeaurora.org>
References: <1600277157-24327-1-git-send-email-mansur@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently we are voting for venus0-ebi path during buffer processing
with an average bandwidth of all the instances and unvoting during
session release.

While video streaming when we try to do XO-SD using the command
"echo mem > /sys/power/state command" , device is not entering
to suspend state and from interconnect summary seeing votes for venus0-ebi

Corrected this by voting for venus0-ebi path in venus_runtime_resume
and unvote during venus_runtime_suspend.

Fixes: 7482a983d ("media: venus: redesign clocks and pm domains control")
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
Changes in V2:
- Added fixes tag
- Addressed review comments by Stephen Boyd
 drivers/media/platform/qcom/venus/core.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 52a3886..064b6c8 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -363,8 +363,16 @@ static __maybe_unused int venus_runtime_suspend(struct device *dev)
 
 	ret = icc_set_bw(core->cpucfg_path, 0, 0);
 	if (ret)
-		return ret;
+		goto err_poweron_core;
+
+	ret = icc_set_bw(core->video_path, 0, 0);
+	if (ret)
+		goto err_poweron_core;
+
+	return ret;
 
+err_poweron_core:
+	pm_ops->core_power(dev, POWER_ON);
 	return ret;
 }
 
@@ -374,6 +382,10 @@ static __maybe_unused int venus_runtime_resume(struct device *dev)
 	const struct venus_pm_ops *pm_ops = core->pm_ops;
 	int ret;
 
+	ret = icc_set_bw(core->video_path, 0, kbps_to_icc(1000));
+	if (ret)
+		return ret;
+
 	ret = icc_set_bw(core->cpucfg_path, 0, kbps_to_icc(1000));
 	if (ret)
 		return ret;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

