Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 636013DB3D7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jul 2021 08:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237689AbhG3GrS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jul 2021 02:47:18 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:61575 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237463AbhG3GrQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jul 2021 02:47:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627627632; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=u6/VhKDvNapmJ++tzvHtIP/NbM1e04D44812udHNKgc=; b=LtdTg3CDtEWiQyTnpd5dFiZPLWwXNFDY6LDE+ZBCIULkxYNcHA6R+eSxZ1Zk22uydbspjfzX
 X3CQczS5GuDd0gfUPgaGAwbyj0rjd4eFcf61fwKlCWWXaHhhdgNxn3tqnLjjGEQf0UfgfMit
 TXtC1I9S4ThqWbJwThSfjUKSq7I=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6103a05b96a66e66b275acf0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 06:46:51
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D26EC43144; Fri, 30 Jul 2021 06:46:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7D760C43460;
        Fri, 30 Jul 2021 06:46:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7D760C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        srinivas.kandagatla@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rbokka@codeaurora.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc7280: Add qfprom node
Date:   Fri, 30 Jul 2021 12:16:13 +0530
Message-Id: <1627627573-32454-5-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627627573-32454-1-git-send-email-rnayak@codeaurora.org>
References: <1627627573-32454-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the qfprom node and its properties for the sc7280 SoC.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 029723a..e87b210 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -442,6 +442,19 @@
 			#mbox-cells = <2>;
 		};
 
+		qfprom: efuse@784000 {
+			compatible = "qcom,sc7280-qfprom", "qcom,qfprom";
+			reg = <0 0x00784000 0 0xa20>,
+			      <0 0x00780000 0 0xa20>,
+			      <0 0x00782000 0 0x120>,
+			      <0 0x00786000 0 0x1fff>;
+			clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
+			clock-names = "core";
+			power-domains = <&rpmhpd SC7280_MX>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		sdhc_1: sdhci@7c4000 {
 			compatible = "qcom,sc7280-sdhci", "qcom,sdhci-msm-v5";
 			status = "disabled";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

