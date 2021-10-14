Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2ED42E0C7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Oct 2021 20:07:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233869AbhJNSJF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Oct 2021 14:09:05 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:56808 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233837AbhJNSJD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Oct 2021 14:09:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634234818; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=oxG38HVZuMV0lltRN3a6CTUoe9NYl8V8VOMSaQ1XQuQ=; b=nTPN2iCGM77UlbSma38VNJ56qAr4XsicBTpZSNBlPdYZOpCFGgaYl1A+ABY67VKI44AcXCsW
 5ePoRuqQuxHiogd5QQuPKNUsAvvQMeBNfJC5kQI78U/oAkB093cpwuaVPqKjVbjd3Jxy4dxa
 cpUVBK8NUPLI+t+1qvUBJ2omv0g=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 616871b4f3e5b80f1f5b9058 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 14 Oct 2021 18:06:44
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2D24AC4360D; Thu, 14 Oct 2021 18:06:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7BCA1C4338F;
        Thu, 14 Oct 2021 18:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 7BCA1C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     sanm@codeaurora.org, agross@kernel.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vbadigan@codeaurora.org, manivannan.sadhasivam@linaro.org
Cc:     Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7280: Add pcie clock support
Date:   Thu, 14 Oct 2021 23:36:24 +0530
Message-Id: <1634234784-5359-1-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add pcie clock phandle for sc7280 SoC and correct
The pcie_1_pipe-clk clock name as same as binding.

fix: ab7772de8 ("arm64: dts: qcom: SC7280: Add rpmhcc clock controller node")
Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
Reported-by: kernel test robot <lkp@intel.com>

---
This change is depends on the below patch series.
https://lkml.org/lkml/2021/10/7/841
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 39635da..78694c1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -569,9 +569,10 @@
 			reg = <0 0x00100000 0 0x1f0000>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>, <&sleep_clk>,
-				 <0>, <0>, <0>, <0>, <0>, <0>;
+				 <0>, <&pcie1_lane 0>,
+				 <0>, <0>, <0>, <0>;
 			clock-names = "bi_tcxo", "bi_tcxo_ao", "sleep_clk",
-				      "pcie_0_pipe_clk", "pcie_1_pipe-clk",
+				      "pcie_0_pipe_clk", "pcie_1_pipe_clk",
 				      "ufs_phy_rx_symbol_0_clk", "ufs_phy_rx_symbol_1_clk",
 				      "ufs_phy_tx_symbol_0_clk",
 				      "usb3_phy_wrapper_gcc_usb30_pipe_clk";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

