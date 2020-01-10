Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59E23136AEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 11:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgAJKSW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 05:18:22 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:25305 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727364AbgAJKSW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 05:18:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578651501; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=Sur98Trxip0lS2J0kZIUVd9Xdj/kghewp4wUiHEmGZQ=; b=KLLxxMFR5GONj1X+vR4pJfymKDSIE/osEx8zgA/gXRtrwjgXJkHOFJFUNlj6uNa2RkJJHA2Y
 M+3vCljs1wfxdCLizf7qjQJN/Gno+h5I6Db7IeCg9DOM45pKcNf/pjCN5PqjJvwfJz+QGHUN
 O3+SXeqMIhh9WwtW8eAeyTWoqX0=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e184f66.7f29f206d960-smtp-out-n02;
 Fri, 10 Jan 2020 10:18:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 38DF1C4479C; Fri, 10 Jan 2020 10:18:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 67727C433A2;
        Fri, 10 Jan 2020 10:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 67727C433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc:     Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180: Add iommus property to QUP0 and QUP1
Date:   Fri, 10 Jan 2020 15:48:02 +0530
Message-Id: <20200110101802.4491-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Define iommus property for QUP0 and QUP1 with the proper SID
and mask. Below SMMU global faults are seen without this during
boot and when using i2c touchscreen.

QUP0:
arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x00000043, GFSYNR2 0x00000000

QUP1:
arm-smmu 15000000.iommu: Unexpected global fault, this could be serious
arm-smmu 15000000.iommu: GFSR 0x00000002, GFSYNR0 0x00000002, GFSYNR1 0x000004c3, GFSYNR2 0x00000000

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 8011c5fe2a31..01e431f49c18 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -338,6 +338,7 @@ qupv3_id_0: geniqup@8c0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			iommus = <&apps_smmu 0x43 0x0>;
 			status = "disabled";
 
 			i2c0: i2c@880000 {
@@ -546,6 +547,7 @@ qupv3_id_1: geniqup@ac0000 {
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
+			iommus = <&apps_smmu 0x4c3 0x0>;
 			status = "disabled";
 
 			i2c6: i2c@a80000 {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
