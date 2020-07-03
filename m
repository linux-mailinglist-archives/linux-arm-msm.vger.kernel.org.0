Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09DCA2137F0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2020 11:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgGCJpI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Jul 2020 05:45:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37763 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726325AbgGCJpH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Jul 2020 05:45:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593769507; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=dl0rgC/HhlVxkyXbeJ+jwvTvXNECw4L3SLbh6WDhKSM=; b=LqSO3kZdW1q+YtvM+g94dTaKpL+8NInNTNG78IBH4DIrTsRcI7Svh+v7e8B/xHRA8RzGynzi
 N2N6joWWcLWBWsz1y8UBXdGZzEXe5gPUuvhfaUnxKQjTC5k6M5opxI0UhPyOULT5+i5UCegE
 OfsEKzF8sXDi8FLEtNIQfIdkIf8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5efefe0d567385e8e707101b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Jul 2020 09:44:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 950E2C433AF; Fri,  3 Jul 2020 09:44:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D9747C433AD;
        Fri,  3 Jul 2020 09:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D9747C433AD
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, broonie@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        mka@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 3/3] arm64: dts: sc7180: Add qspi opps and power-domains
Date:   Fri,  3 Jul 2020 15:11:33 +0530
Message-Id: <1593769293-6354-4-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593769293-6354-1-git-send-email-rnayak@codeaurora.org>
References: <1593769293-6354-1-git-send-email-rnayak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the power domain supporting performance state and the corresponding
OPP tables for the qspi device on sc7180

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 2be81a2..34a6d83 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -2407,6 +2407,25 @@
 			status = "disabled";
 		};
 
+		qspi_opp_table: qspi-opp-table {
+			compatible = "operating-points-v2";
+
+			opp-75000000 {
+				opp-hz = /bits/ 64 <75000000>;
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
 		qspi: spi@88dc000 {
 			compatible = "qcom,qspi-v1";
 			reg = <0 0x088dc000 0 0x600>;
@@ -2419,6 +2438,8 @@
 			interconnects = <&gem_noc MASTER_APPSS_PROC
 					&config_noc SLAVE_QSPI_0>;
 			interconnect-names = "qspi-config";
+			power-domains = <&rpmhpd SC7180_CX>;
+			operating-points-v2 = <&qspi_opp_table>;
 			status = "disabled";
 		};
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

