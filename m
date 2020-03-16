Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 320FE186991
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2020 11:55:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730728AbgCPKz1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Mar 2020 06:55:27 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:40130 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730743AbgCPKz1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Mar 2020 06:55:27 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584356126; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=OJoDUNPnRia0r899zZ24LlV/F/hIvK/bV90B1iUvWs8=; b=Ynl6NXy927F755cJpjxIHMiq3OUt8AFaUivGGVj+MUsoQmPmmANXy+c/+zXBH0cYpExDzdLG
 Z1nud/EFU3HzNlRe6Rl+o0Cn2D95+qRbhMrcl0ZQzCWMSs456K6LhCbzGB+2n+SsWA7RSUJj
 3gz7DFdphfmzuKfVRn2yshmOsXc=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6f5b13.7f67084cba08-smtp-out-n02;
 Mon, 16 Mar 2020 10:55:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BBFB7C432C2; Mon, 16 Mar 2020 10:55:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8BCE1C44788;
        Mon, 16 Mar 2020 10:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8BCE1C44788
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 2/3] dt-bindings: clock: Add gcc_sec_ctrl_clk_src clock ID
Date:   Mon, 16 Mar 2020 16:24:41 +0530
Message-Id: <1584356082-26769-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
References: <1584356082-26769-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The gcc_sec_ctrl_clk_src clock is required to be controlled by the
secure controller driver.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 include/dt-bindings/clock/qcom,gcc-sc7180.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
index e8029b2e..281d0b4 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
@@ -132,6 +132,7 @@
 #define GCC_VIDEO_GPLL0_DIV_CLK_SRC				122
 #define GCC_VIDEO_THROTTLE_AXI_CLK				123
 #define GCC_VIDEO_XO_CLK					124
+#define GCC_SEC_CTRL_CLK_SRC					125

 /* GCC resets */
 #define GCC_QUSB2PHY_PRIM_BCR					0
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
