Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC741F82FD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2020 12:33:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbgFMKdc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Jun 2020 06:33:32 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:21320 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726017AbgFMKdb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Jun 2020 06:33:31 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Jun 2020 16:03:23 +0530
Received: from c-mansur-linux.qualcomm.com ([10.204.90.208])
  by ironmsg01-blr.qualcomm.com with ESMTP; 13 Jun 2020 16:03:13 +0530
Received: by c-mansur-linux.qualcomm.com (Postfix, from userid 461723)
        id 8A25B21ABB; Sat, 13 Jun 2020 16:03:11 +0530 (IST)
From:   Mansur Alisha Shaik <mansur@codeaurora.org>
To:     stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, mansur@codeaurora.org,
        saiprakash.ranjan@codeaurora.org
Subject: [PATCH] venus: core: add shutdown callback for venus
Date:   Sat, 13 Jun 2020 16:03:06 +0530
Message-Id: <1592044386-15654-1-git-send-email-mansur@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

After the SMMU translation is disabled in the
arm-smmu shutdown callback during reboot, if
any subsystem are still alive then IOVAs they
are using will become PAs on bus, which may
lead to crash.

Below are the consumers of smmu from venus
arm-smmu: consumer: aa00000.video-codec supplier=15000000.iommu
arm-smmu: consumer: video-firmware.0 supplier=15000000.iommu

So implemented shutdown callback, which detach iommu maps.

Change-Id: I0f0f331056e0b84b92f1d86f66618d4b1caaa24a
Signed-off-by: Mansur Alisha Shaik <mansur@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 30d4b9e..acf798c 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -371,6 +371,14 @@ static int venus_remove(struct platform_device *pdev)
 	return ret;
 }
 
+static void venus_core_shutdown(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = venus_remove(pdev);
+	WARN_ON(ret < 0);
+}
+
 static __maybe_unused int venus_runtime_suspend(struct device *dev)
 {
 	struct venus_core *core = dev_get_drvdata(dev);
@@ -628,6 +636,7 @@ static struct platform_driver qcom_venus_driver = {
 		.of_match_table = venus_dt_match,
 		.pm = &venus_pm_ops,
 	},
+	.shutdown = venus_core_shutdown,
 };
 module_platform_driver(qcom_venus_driver);
 
-- 
2.7.4

