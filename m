Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18360452FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Nov 2021 12:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234597AbhKPLFO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Nov 2021 06:05:14 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:21526 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234560AbhKPLFH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Nov 2021 06:05:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637060530; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=PMCYdNlt1qQnePbWDx+9V60s4R1unOPERNHyR3Z6EIU=; b=lcfd9f4soBCzbQkd9p47Z1Y26p+sJenpXRspf0/Cml24pHsGoCozK/MV8mb1inwz/L7IEv40
 pduKdfFBxP4is4mboJlVqoivk+s937nuWbgg0FQ5m8OUQXVOnnxPJks4PCo/WmArfN2PXPYR
 5ruGIzz3fT9mnGRC5aYSMCQatDE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61938fae638a2f4d616ffb63 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 11:02:06
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0E326C43617; Tue, 16 Nov 2021 11:02:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72AB7C4361A;
        Tue, 16 Nov 2021 11:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 72AB7C4361A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     swboyd@chromium.org, agross@kernel.org, bjorn.andersson@linaro.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, manivannan.sadhasivam@linaro.org,
        robh+dt@kernel.org, mka@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com, bhelgaas@google.com
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v3 1/3] arm64: dts: qcom: sc7280: Fix incorrect clock name
Date:   Tue, 16 Nov 2021 16:31:46 +0530
Message-Id: <1637060508-30375-2-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637060508-30375-1-git-send-email-pmaliset@codeaurora.org>
References: <1637060508-30375-1-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Replace pcie_1_pipe-clk clock name with pcie_1_pipe_clk
To match with dt binding.

Fixes: ab7772de8612 ("arm64: dts: qcom: SC7280: Add rpmhcc clock controller node")

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
Reported-by: kernel test robot <lkp@intel.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 365a2e0..cb94b87 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -576,7 +576,7 @@
 				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
 				 <0>, <0>, <0>, <0>, <0>, <0>;
 			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
-				      "pcie_0_pipe_clk", "pcie_1_pipe-clk",
+				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
 				      "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

