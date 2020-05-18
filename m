Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 912171D7861
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2020 14:20:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726726AbgERMUl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 08:20:41 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29631 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726739AbgERMUl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 08:20:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589804441; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=MAxhP+teqZIXPoeMS5hBv8vDuvdydsbV2LjXEfVR9mM=; b=uVClxvmW2sXhQqUDK2HaES1Q2Bsxp72vfXEJlDishsywDPYRKNSRjn128ZvuavCJGvJTI7Xi
 2rt19cCnZB48mZCux4ScoCzUTKvEswgrW7S3sxxgBePoJytzwrKuamL5arXUL9rX8KRD8Suf
 PDS0FvC9im0bG3CJhpchjMAt/rQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec27d8c.7f2e1d21fb20-smtp-out-n05;
 Mon, 18 May 2020 12:20:28 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9679EC43637; Mon, 18 May 2020 12:20:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AB9CC432C2;
        Mon, 18 May 2020 12:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5AB9CC432C2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        mka@chromium.org, swboyd@chromium.org, evgreen@chromium.org,
        dianders@chromium.org, Maulik Shah <mkshah@codeaurora.org>,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sc7180: Correct the pdc interrupt ranges
Date:   Mon, 18 May 2020 17:50:02 +0530
Message-Id: <1589804402-27130-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Few PDC interrupts do not map to respective parent GIC interrupt.
Fix this by correcting the pdc interrupt map.

Fixes: 22f185ee81d2 ("arm64: dts: qcom: sc7180: Add pdc interrupt controller")
Cc: devicetree@vger.kernel.org
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index f1280e0..f6b4ee8 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2308,8 +2308,7 @@
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,sc7180-pdc", "qcom,pdc";
 			reg = <0 0x0b220000 0 0x30000>;
-			qcom,pdc-ranges = <0 480 15>, <17 497 98>,
-					  <119 634 4>, <124 639 1>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 31>, <125 63 1>;
 			#interrupt-cells = <2>;
 			interrupt-parent = <&intc>;
 			interrupt-controller;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
