Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE58B1A238C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 15:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729408AbgDHNsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 09:48:35 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:29086 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729406AbgDHNsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 09:48:35 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586353714; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ZjC5EZXnRF95E1HSdXF48+L41ZloOIR+U+Ff58V0X3w=; b=MHbMH2C21UPxyAE60gyK7OE6wwa8h7MkG+5bUUClTSFOXHfhpg1bSrUyyCJlaVFgbKgn5PwV
 5iujjx+9Oz6ahjVBovQ9k55dtBzKc6FOcbdpXdjZv2V4AQ2ntATfPBCCBqOb/0wCEEt6hlwS
 9JKbeZXjzAP4hXFMujfcw9AY8LE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8dd62b.7f4fde954180-smtp-out-n03;
 Wed, 08 Apr 2020 13:48:27 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 48E24C49493; Wed,  8 Apr 2020 13:48:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F2B98C44BC3;
        Wed,  8 Apr 2020 13:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F2B98C44BC3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     viresh.kumar@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 20/21] arm64: dts: sdm845: Add qspi opps and power-domains
Date:   Wed,  8 Apr 2020 19:16:46 +0530
Message-Id: <1586353607-32222-21-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
References: <1586353607-32222-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the power domain supporting performance state and the corresponding
OPP tables for the qspi device on sdm845

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 7e75de8..7ccf24d 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -3036,6 +3036,30 @@
 			status = "disabled";
 		};
 
+		qspi_opp_table: qspi-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-19200000 {
+				opp-hz = /bits/ 64 <19200000>;
+				required-opps = <&rpmhpd_opp_min_svs>;
+			};
+
+			opp-100000000 {
+				opp-hz = /bits/ 64 <100000000>;
+				required-opps = <&rpmhpd_opp_low_svs>;
+			};
+
+			opp-150000000 {
+				opp-hz = /bits/ 64 <150000000>;
+				required-opps = <&rpmhpd_opp_svs>;
+			};
+
+			opp-300000000 {
+				opp-hz = /bits/ 64 <300000000>;
+				required-opps = <&rpmhpd_opp_nom>;
+			};
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,sdm845-qspi", "qcom,qspi-v1";
 			reg = <0 0x088df000 0 0x600>;
@@ -3045,6 +3069,8 @@
 			clocks = <&gcc GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
 				 <&gcc GCC_QSPI_CORE_CLK>;
 			clock-names = "iface", "core";
+			power-domains = <&rpmhpd SDM845_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";
 		};
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
