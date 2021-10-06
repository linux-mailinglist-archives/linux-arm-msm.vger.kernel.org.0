Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C01342357B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 03:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237167AbhJFBlS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 21:41:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:27471 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237159AbhJFBlR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 21:41:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1633484366; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=k4u+e8XmwbFQeOOTZ4Upb+G4IuEc1vosQijxdZl+V9A=; b=IvNU5LqXJXwugS2dWzwVWWqoU4j5db3qFlvlKmaRvZcfIY3KT4I2Pd4+p2yazHsW09G9O4sL
 Yw2TfRFu8//4++Hu11vA2XTrK6Uy5BhYkP7zP3MbVz83DgqCJgl/iWKYuPZfSQswnepYd//j
 fqPaljJR8tHr/VTQqR8+l+lZ/2M=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 615cfe4d4ccc4cf2c7266ca0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 06 Oct 2021 01:39:25
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9901DC43618; Wed,  6 Oct 2021 01:39:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8D230C4338F;
        Wed,  6 Oct 2021 01:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8D230C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH 1/3] clk: qcom: Kconfig: Sort the symbol for SC_LPASS_CORECC_7180
Date:   Wed,  6 Oct 2021 07:05:44 +0530
Message-Id: <1633484146-19514-1-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the order of the Kconfig symbol for SC_LPASS_CORECC_7180.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 0a55967..f9c36a1 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -385,15 +385,6 @@ config SC_GCC_8180X
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.

-config SC_LPASS_CORECC_7180
-	tristate "SC7180 LPASS Core Clock Controller"
-	select SC_GCC_7180
-	help
-	  Support for the LPASS(Low Power Audio Subsystem) core clock controller
-	  on SC7180 devices.
-	  Say Y if you want to use LPASS clocks and power domains of the LPASS
-	  core clock controller.
-
 config SC_GPUCC_7180
 	tristate "SC7180 Graphics Clock Controller"
 	select SC_GCC_7180
@@ -410,6 +401,15 @@ config SC_GPUCC_7280
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.

+config SC_LPASS_CORECC_7180
+	tristate "SC7180 LPASS Core Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the LPASS(Low Power Audio Subsystem) core clock controller
+	  on SC7180 devices.
+	  Say Y if you want to use LPASS clocks and power domains of the LPASS
+	  core clock controller.
+
 config SC_MSS_7180
 	tristate "SC7180 Modem Clock Controller"
 	select SC_GCC_7180
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

