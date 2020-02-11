Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049D5158E20
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 13:14:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgBKMOO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 07:14:14 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:15495 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727789AbgBKMOO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 07:14:14 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581423253; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oRKfcwP++zy8LjliDmJ593dnq9AHGwth3BPAylfi5co=; b=eXretsJ+/mj+G0N5DCMlWwXqf9AwitKhUaJn+SndTHH6LELzjGfpexGcsvldqxYwKMFI7/58
 fDdsnA+XuEdFNlLv3arLLhkVKokF+wW22EEATFnK7bSEYplF4B+hk0exzX/Tp3g3uv8ibsLr
 kFVgthr0paor276yMAFeWbd2i/M=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e429a90.7f39cbc3ec70-smtp-out-n01;
 Tue, 11 Feb 2020 12:14:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA515C4479D; Tue, 11 Feb 2020 12:14:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4A6A3C43383;
        Tue, 11 Feb 2020 12:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4A6A3C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>,
        robh@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh+dt@kernel.org, Doug Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 1/2] clk: qcom: videocc: Update the clock flag for video_cc_vcodec0_core_clk
Date:   Tue, 11 Feb 2020 17:43:55 +0530
Message-Id: <1581423236-21341-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The clock disable signal for video_cc_vcodec0_core_clk is tied to
vcodec0_gdsc which is supported in the HW control mode. Thus turning off
the clock would be taken care automatically when the GDSC turns OFF by
hardware and clock driver does not require to poll on the CLK_OFF bit.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/videocc-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
index c363c3c..276e5ec 100644
--- a/drivers/clk/qcom/videocc-sc7180.c
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -97,7 +97,7 @@ static struct clk_branch video_cc_vcodec0_axi_clk = {

 static struct clk_branch video_cc_vcodec0_core_clk = {
 	.halt_reg = 0x890,
-	.halt_check = BRANCH_HALT,
+	.halt_check = BRANCH_HALT_VOTED,
 	.clkr = {
 		.enable_reg = 0x890,
 		.enable_mask = BIT(0),
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
