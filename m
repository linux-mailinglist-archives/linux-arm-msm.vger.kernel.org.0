Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D02C816C71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2019 22:44:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727226AbfEGUlN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 May 2019 16:41:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:53626 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbfEGUlD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 May 2019 16:41:03 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8B9E161340; Tue,  7 May 2019 20:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261662;
        bh=002F9M1uXlnC2wPdhqVGhnev6UAfPxBuiQkXck5+64o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Of4xHJKf6u5JPbRDEeJsBCke9mYnqB+rCv9ZoJzEt5g2D4Qno8KeMz1tWZbUZMB+a
         zYygOBp/AXYk3Uk7PCGPjPP/Oo+3Yde5FTVJh7KQC4o0JbeMF9i+cagaw8BzCZhfuy
         hYo7JOHSpW7Wvr+8CMo4GwTQ84UuOWAU+aXrKC1k=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4305D614DB;
        Tue,  7 May 2019 20:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1557261662;
        bh=002F9M1uXlnC2wPdhqVGhnev6UAfPxBuiQkXck5+64o=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Of4xHJKf6u5JPbRDEeJsBCke9mYnqB+rCv9ZoJzEt5g2D4Qno8KeMz1tWZbUZMB+a
         zYygOBp/AXYk3Uk7PCGPjPP/Oo+3Yde5FTVJh7KQC4o0JbeMF9i+cagaw8BzCZhfuy
         hYo7JOHSpW7Wvr+8CMo4GwTQ84UuOWAU+aXrKC1k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4305D614DB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, rplsssn@codeaurora.org,
        linux-arm-msm@vger.kernel.org, thierry.reding@gmail.com,
        bjorn.andersson@linaro.org, dianders@chromium.org,
        Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v5 11/11] arm64: dts: qcom: setup PDC as wakeup parent for GPIOs for SDM845
Date:   Tue,  7 May 2019 14:37:49 -0600
Message-Id: <20190507203749.3384-12-ilina@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190507203749.3384-1-ilina@codeaurora.org>
References: <20190507203749.3384-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Setup PDC wakeup parent for TLMM for SDM845 SoC.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
Changes in v3:
	- Provide irqdomain-map for GPIOs that map to PDC
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 79 ++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 7d4b11c9314e..59da6944b106 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1105,6 +1105,85 @@
 			#interrupt-cells = <2>;
 			gpio-ranges = <&tlmm 0 0 150>;
 
+			wakeup-parent = <&pdc_intc>;
+			irqdomain-map = <1 0 &pdc_intc 30 0>,
+					<3 0 &pdc_intc 31 0>,
+					<5 0 &pdc_intc 32 0>,
+					<10 0 &pdc_intc 33 0>,
+					<11 0 &pdc_intc 34 0>,
+					<20 0 &pdc_intc 35 0>,
+					<22 0 &pdc_intc 36 0>,
+					<24 0 &pdc_intc 37 0>,
+					<26 0 &pdc_intc 38 0>,
+					<30 0 &pdc_intc 39 0>,
+					<31 0 &pdc_intc 117 0>,
+					<32 0 &pdc_intc 41 0>,
+					<34 0 &pdc_intc 42 0>,
+					<36 0 &pdc_intc 43 0>,
+					<37 0 &pdc_intc 44 0>,
+					<38 0 &pdc_intc 45 0>,
+					<39 0 &pdc_intc 46 0>,
+					<40 0 &pdc_intc 47 0>,
+					<41 0 &pdc_intc 115 0>,
+					<43 0 &pdc_intc 49 0>,
+					<44 0 &pdc_intc 50 0>,
+					<46 0 &pdc_intc 51 0>,
+					<48 0 &pdc_intc 52 0>,
+					<49 0 &pdc_intc 118 0>,
+					<52 0 &pdc_intc 54 0>,
+					<53 0 &pdc_intc 55 0>,
+					<54 0 &pdc_intc 56 0>,
+					<56 0 &pdc_intc 57 0>,
+					<57 0 &pdc_intc 58 0>,
+					<58 0 &pdc_intc 59 0>,
+					<59 0 &pdc_intc 60 0>,
+					<60 0 &pdc_intc 61 0>,
+					<61 0 &pdc_intc 62 0>,
+					<62 0 &pdc_intc 63 0>,
+					<63 0 &pdc_intc 64 0>,
+					<64 0 &pdc_intc 65 0>,
+					<66 0 &pdc_intc 66 0>,
+					<68 0 &pdc_intc 67 0>,
+					<71 0 &pdc_intc 68 0>,
+					<73 0 &pdc_intc 69 0>,
+					<77 0 &pdc_intc 70 0>,
+					<78 0 &pdc_intc 71 0>,
+					<79 0 &pdc_intc 72 0>,
+					<80 0 &pdc_intc 73 0>,
+					<84 0 &pdc_intc 74 0>,
+					<85 0 &pdc_intc 75 0>,
+					<86 0 &pdc_intc 76 0>,
+					<88 0 &pdc_intc 77 0>,
+					<89 0 &pdc_intc 116 0>,
+					<91 0 &pdc_intc 79 0>,
+					<92 0 &pdc_intc 80 0>,
+					<95 0 &pdc_intc 81 0>,
+					<96 0 &pdc_intc 82 0>,
+					<97 0 &pdc_intc 83 0>,
+					<101 0 &pdc_intc 84 0>,
+					<103 0 &pdc_intc 85 0>,
+					<104 0 &pdc_intc 86 0>,
+					<115 0 &pdc_intc 90 0>,
+					<116 0 &pdc_intc 91 0>,
+					<117 0 &pdc_intc 92 0>,
+					<118 0 &pdc_intc 93 0>,
+					<119 0 &pdc_intc 94 0>,
+					<120 0 &pdc_intc 95 0>,
+					<121 0 &pdc_intc 96 0>,
+					<122 0 &pdc_intc 97 0>,
+					<123 0 &pdc_intc 98 0>,
+					<124 0 &pdc_intc 99 0>,
+					<125 0 &pdc_intc 100 0>,
+					<127 0 &pdc_intc 102 0>,
+					<128 0 &pdc_intc 103 0>,
+					<129 0 &pdc_intc 104 0>,
+					<130 0 &pdc_intc 105 0>,
+					<132 0 &pdc_intc 106 0>,
+					<133 0 &pdc_intc 107 0>,
+					<145 0 &pdc_intc 108 0>;
+			irqdomain-map-mask = <0xff 0>;
+			irqdomain-map-pass-thru = <0 0xff>;
+
 			qspi_clk: qspi-clk {
 				pinmux {
 					pins = "gpio95";
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

