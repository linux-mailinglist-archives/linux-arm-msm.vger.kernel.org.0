Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 369D61888B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2020 16:09:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbgCQPJr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Mar 2020 11:09:47 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:61869 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726821AbgCQPJi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Mar 2020 11:09:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584457778; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UrmrOXjGTq5RxGy42q7tGcOyFhDO4TM3w0P3Bv5qeeU=; b=FAwlqkkJwCBJ+ujsxc8g5lckLlfQ2Vc7mPAwDwiLk8CBoOkNXQyiYdWzatxQRJ1lXSjlVgxv
 lhA/GlDal8B+haNK2oM7gUQjAkEApwe/OuNKwMggrBcOYq6OdNX2aHPfBFViUQNT1eVMi1WZ
 VGewf2WBGWZLMQMu3g5BXNia36A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e70e831.7fcbb8ab2b90-smtp-out-n02;
 Tue, 17 Mar 2020 15:09:37 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 61A8EC44791; Tue, 17 Mar 2020 15:09:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-87.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E053EC433CB;
        Tue, 17 Mar 2020 15:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E053EC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org, robh+dt@kernel.org, joro@8bytes.org,
        robin.murphy@arm.com
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-remoteproc@vger.kernel.org, ohad@wizery.com,
        agross@kernel.org, dianders@chromium.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sdm845-cheza: Add iommus property
Date:   Tue, 17 Mar 2020 20:39:10 +0530
Message-Id: <20200317150910.26053-4-sibis@codeaurora.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200317150910.26053-1-sibis@codeaurora.org>
References: <20200317150910.26053-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add iommus property to remoteproc modem node.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
index 8d16d016efec1..01c7d7cc95c2d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi
@@ -626,6 +626,10 @@ &mdss_mdp {
 	status = "okay";
 };
 
+&mss_pil {
+	iommus = <&apps_smmu 0x780 0x1>;
+};
+
 &pm8998_pwrkey {
 	status = "disabled";
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
