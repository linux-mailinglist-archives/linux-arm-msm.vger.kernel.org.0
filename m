Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6ACD616A41A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2020 11:38:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgBXKix (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Feb 2020 05:38:53 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:40495 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727521AbgBXKix (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Feb 2020 05:38:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582540732; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=hJeMa7XtxxBR0qJQ96WklqdiqUpuI43XchMLbpitEvA=; b=qDriCCucrQxpmqi4LuUpkJqEGmbnRF4Res0Bt7QVNYLG8clBaehgQwGqDHlAoEj/gwDiCk5S
 oTwW+C4aDXHzGUyZgZoBh4FHApZihEQjxXsxZWUEugtuWd8FDmIWFMWA8zeQgYxOT6DxFCbY
 5NV5ivhyrrFV2c1QachOdspFuHU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e53a7b4.7fc054daa8b8-smtp-out-n01;
 Mon, 24 Feb 2020 10:38:44 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CCE44C447A2; Mon, 24 Feb 2020 10:38:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 206E0C4479D;
        Mon, 24 Feb 2020 10:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 206E0C4479D
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
Subject: [PATCH v5 1/5] dt-bindings: clock: Add support for Modem clocks in GCC
Date:   Mon, 24 Feb 2020 16:08:19 +0530
Message-Id: <1582540703-6328-2-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
References: <1582540703-6328-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add clock ids for GCC MSS clocks which are required to bring the modem
out of reset.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/qcom,gcc-sc7180.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
index e8029b2e..64909ec 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
@@ -132,6 +132,11 @@
 #define GCC_VIDEO_GPLL0_DIV_CLK_SRC				122
 #define GCC_VIDEO_THROTTLE_AXI_CLK				123
 #define GCC_VIDEO_XO_CLK					124
+#define GCC_MSS_CFG_AHB_CLK					125
+#define GCC_MSS_MFAB_AXIS_CLK					126
+#define GCC_MSS_NAV_AXI_CLK					127
+#define GCC_MSS_Q6_MEMNOC_AXI_CLK				128
+#define GCC_MSS_SNOC_AXI_CLK					129

 /* GCC resets */
 #define GCC_QUSB2PHY_PRIM_BCR					0
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
