Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FF21B29D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 16:33:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgDUOcz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 10:32:55 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:10368 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729065AbgDUOcy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 10:32:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587479574; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=h0i7PQm7BSJY/jq7SxN1ILFHVvwKYIZedbYOAATXJ7Y=; b=wkHYEr1i/s/y9lIE/u7s1kZ1IS7BjdBufcNFbuICxoe8GDhfXhI3BBZH21yK6DnIpKEbbvNe
 /9ew/xCjOLyepHH634MVhSc8wxSwJag7jTFolR9Ful7bKcLm/gnExGxzK+ccNBi5EU0FK6eI
 H3N8SsWgt21Bu9HNVgoQooJYbG8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9f0415.7efc414a3d50-smtp-out-n04;
 Tue, 21 Apr 2020 14:32:53 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 499D5C0451C; Tue, 21 Apr 2020 14:32:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17F6BC44788;
        Tue, 21 Apr 2020 14:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17F6BC44788
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com, mka@chromium.org,
        dianders@chromium.org, devicetree@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 2/7] remoteproc: qcom: pas: Add SC7180 Modem support
Date:   Tue, 21 Apr 2020 20:02:23 +0530
Message-Id: <20200421143228.8981-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200421143228.8981-1-sibis@codeaurora.org>
References: <20200421143228.8981-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for booting the Modem DSP found on Qualcomm's SC7180 SoCs.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 7a63efb854052..33b0bff770a7f 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -637,6 +637,7 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },
+	{ .compatible = "qcom,sc7180-mpss-pas", .data = &mpss_resource_init},
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &adsp_resource_init},
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &cdsp_resource_init},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
