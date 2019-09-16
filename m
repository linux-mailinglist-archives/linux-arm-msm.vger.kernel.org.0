Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99121B399D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2019 13:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732099AbfIPLmF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Sep 2019 07:42:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:49174 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725912AbfIPLmF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Sep 2019 07:42:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id E2AE361424; Mon, 16 Sep 2019 11:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634123;
        bh=oMY5Tj+8xqlrsEI1mYLnZKn0gg+CRwrKPBMhq/IUAS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RTDDNZlyFhNoFDqEK1pi0qtfDoAj30NNklvUzjqKqqDEfQLOne/biVO+BJnxPCP6j
         X/yVTDhtXyPyl5yHiqlguk/AHzxd75SmQA/+FC/dPLQyGESJLVVaiUn5ggOzbJRCaU
         4/qbc2Ec7QRYpbN1upTTMQrAz2ko4po2Vphuq6qI=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from cchiluve-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: cchiluve@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 393B6614DB;
        Mon, 16 Sep 2019 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568634121;
        bh=oMY5Tj+8xqlrsEI1mYLnZKn0gg+CRwrKPBMhq/IUAS4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g5KlYSchzZYZ6DJ9K7czIAEvQL8s8dHO3KHRIJuLpIbRVC07zbCiEqD4sIXhLJY5X
         psitE0QfAA8acmv9GuqInq/wAXgbgBkKLWe0/xObMrU7rhlcpt3ysy3BGpMt7T80BL
         zsf46cAGAvSH/3y7TMP0ae9TTSNnDTZ22hCwr2fc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 393B6614DB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=cchiluve@codeaurora.org
From:   Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
To:     balbi@kernel.org, agross@kernel.org, david.brown@linaro.org
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: [PATCH V2 3/3] arm64: dts: sdm845: Add interconnect properties for USB
Date:   Mon, 16 Sep 2019 17:11:01 +0530
Message-Id: <1568634061-14455-4-git-send-email-cchiluve@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
References: <1568634061-14455-1-git-send-email-cchiluve@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Populate USB DT node with interconnect properties.

Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index fcb9330..1c41922 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1837,6 +1837,12 @@
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
+			interconnects = <&rsc_hlos MASTER_USB3_0
+						&rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC
+						&rsc_hlos SLAVE_USB3_0>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_1_dwc3: dwc3@a600000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a600000 0 0xcd00>;
@@ -1881,6 +1887,12 @@
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 
+			interconnects = <&rsc_hlos MASTER_USB3_1
+						&rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC
+						&rsc_hlos SLAVE_USB3_1>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
 			usb_2_dwc3: dwc3@a800000 {
 				compatible = "snps,dwc3";
 				reg = <0 0x0a800000 0 0xcd00>;
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

