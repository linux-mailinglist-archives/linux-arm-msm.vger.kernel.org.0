Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3639416C6B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfEGUlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:41:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53430 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727170AbfEGUlB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:41:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 836696141C; Tue,  7 May 2019 20:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261660;
        bh=rkVc6I/eVNPLumaNmY0V1Bc23DLsJkPcnl+bmlGi93k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e/UtKbfjXSQE2cju598oFBDCrO5HBNoG0Nh5x9Eu8+/VOzmQRNfCY7AQ7g6Q9c9do
         KeskvyAEaxpSv3LaSY8ofkyg28DLgIvyYSMDqqIdcKhK74+LvmeGwZFMVWli2e4dZN
         seYYxe+XploiE44Xs+rzcJf1Tuw3vPES67XHOA/A=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1056B611D1;
        Tue,  7 May 2019 20:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261659;
        bh=rkVc6I/eVNPLumaNmY0V1Bc23DLsJkPcnl+bmlGi93k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mGIpA4XkcFR6Ko5ChVPwdPPIrfMRHeF/VVeEc/Bb4kmspiDBVpQjbQ0CDfGedsKvy
         FDAI9Fbg4hk2ed7gx54yIJtYOkkW6+La2clvMU18Y/AIX3RENH5/4oxYH57OzmJhXe
         VFwz46bSCnx27CiHUCWe09OZhijZaFic08tuZTk8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1056B611D1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 09/11] arm64: dts: qcom: add PDC interrupt controller for SDM845
Date:   Tue,  7 May 2019 14:37:47 -0600
Message-Id: <20190507203749.3384-10-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PDC interrupt controller device bindings for SDM845.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v1:
	- Use updated address specification in reg
	- Rename to pdc_intc
	- Sort per address in DT
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5308f1671824..7d4b11c9314e 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1934,6 +1934,15 @@
 			#power-domain-cells = <1>;
 		};
 
+		pdc_intc: interrupt-controller@b220000 {
+			compatible = "qcom,sdm845-pdc";
+			reg = <0 0x0b220000 0 0x30000>;
+			qcom,pdc-ranges = <0 480 94>, <94 609 15>, <115 630 7>;
+			#interrupt-cells = <2>;
+			interrupt-parent = <&intc>;
+			interrupt-controller;
+		};
+
 		pdc_reset: reset-controller@b2e0000 {
 			compatible = "qcom,sdm845-pdc-global";
 			reg = <0 0x0b2e0000 0 0x20000>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

