Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFEF2292810
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Oct 2020 15:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbgJSNTj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Oct 2020 09:19:39 -0400
Received: from z5.mailgun.us ([104.130.96.5]:54466 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728097AbgJSNTh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Oct 2020 09:19:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1603113576; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=/ZGUMfp1A0aHVNO/vay/6ICqzhjKvdAharx01TPBxAI=; b=QqyfCs0fUI0WuQ8WTEvqSPSnuX2GSSrKu/Agbe9QUx8yTwNuK2BUE9bg+QR9NHvZM8KaoAA7
 1jcDQ98UbZ5BGJi4iFEqk5phOYjO0Mtmy/JiloqO3RBRQOhBTnGCIu8ImDkmUomBVyrPR2nw
 zgEukRzC2ZC/vr2E2fhd2c9LMKg=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f8d9262aad2c3cd1c41ccb5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 13:19:30
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 92F83C433FF; Mon, 19 Oct 2020 13:19:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73B34C433CB;
        Mon, 19 Oct 2020 13:19:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73B34C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, jcrouse@codeaurora.org,
        mka@chromium.org, robdclark@gmail.com, dianders@chromium.org
Subject: [PATCH 1/2] drm/msm: Implement shutdown callback for adreno
Date:   Mon, 19 Oct 2020 18:49:17 +0530
Message-Id: <1603113558-23330-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implement the shutdown callback for adreno gpu platform device
to safely shutdown it before a system reboot. This helps to avoid
futher transactions from gpu after the smmu is moved to bypass mode.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 58e03b2..87c8b03 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -475,6 +475,11 @@ static int adreno_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void adreno_shutdown(struct platform_device *pdev)
+{
+	pm_runtime_force_suspend(&pdev->dev);
+}
+
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "qcom,adreno" },
 	{ .compatible = "qcom,adreno-3xx" },
@@ -509,6 +514,7 @@ static const struct dev_pm_ops adreno_pm_ops = {
 static struct platform_driver adreno_driver = {
 	.probe = adreno_probe,
 	.remove = adreno_remove,
+	.shutdown = adreno_shutdown,
 	.driver = {
 		.name = "adreno",
 		.of_match_table = dt_match,
-- 
2.7.4

