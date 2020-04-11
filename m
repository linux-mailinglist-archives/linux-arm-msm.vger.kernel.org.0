Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 464831A4D04
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2020 02:52:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726775AbgDKAwy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Apr 2020 20:52:54 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44368 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726687AbgDKAwy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Apr 2020 20:52:54 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586566374; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=o5YQWS7rVGinswHimV/ebtHMn0gfPurVq/sSQpSMAKI=; b=IoSlYQyZCGx4ZgOYu2AQvGHGGpm2qTMLlssgMyFxpREWX1sElkhSek7D/dSCL89DfqYokQTW
 lKq/LSDAlVuvP0Zq4EpEm49Pndu5CG4N4Rf1gRxs11hkeCnzh4qMc4zgEdZfJY5DfPhCqgR4
 hNlD1v4impYy/7tY75yacQ2MoiU=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9114e6.7f6a68c4bea0-smtp-out-n05;
 Sat, 11 Apr 2020 00:52:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D744EC433F2; Sat, 11 Apr 2020 00:52:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9F35C433CB;
        Sat, 11 Apr 2020 00:52:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9F35C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        vinod.koul@linaro.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v4 0/2] Enable SS/HS USB support on SM8150 
Date:   Fri, 10 Apr 2020 17:52:40 -0700
Message-Id: <1586566362-21450-1-git-send-email-wcheng@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add required device tree nodes to enable the USB SS and HS
paths on the primary USB controller on SM8150.  In addition,
implement missing resources from the SM8150 GCC driver, which
includes the USB GDSC and the USB PIPE clocks.

Changes in v4:
 - Re-ordered compatible cells for usb_1_hsphy and usb_1 to select by
   the platform first.

Changes in v3:
 - Set dr_mode to "peripheral" on the SM8150 MTP DTSI file.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>

Changes in v2:
 - Combine GDSC and USB PIPE clock changes.
 - Re-order DTS nodes based on address

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Jack Pham (1):
  arm64: dts: qcom: sm8150: Add USB and PHY device nodes

Wesley Cheng (1):
  clk: qcom: gcc: Add USB3 PIPE clock and GDSC for SM8150

 arch/arm64/boot/dts/qcom/sm8150-mtp.dts     | 21 +++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi        | 92 +++++++++++++++++++++++++++++
 drivers/clk/qcom/gcc-sm8150.c               | 52 ++++++++++++++++
 include/dt-bindings/clock/qcom,gcc-sm8150.h |  4 ++
 4 files changed, 169 insertions(+)

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
