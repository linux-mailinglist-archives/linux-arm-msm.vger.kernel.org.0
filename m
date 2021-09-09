Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD18405C3B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 19:41:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241462AbhIIRmc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Sep 2021 13:42:32 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:62698 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241771AbhIIRm3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Sep 2021 13:42:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631209280; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=k/LT2XBjH8tBsKcJ0vItuEPWkjrv3NA5jpDO3SzneoI=; b=rsxZVZMyhY64KzA5rcOaVf5P4oUEpdE9a7VCxAB+SP80x/LudC0qm52aW99PsicbGJbs4yRC
 boia71wISPcsk5XKqYEqBMvbsqeFQinC9kdlIkLoFhASwKioT6ySns7xDWQiLzfdJPySUN1i
 7okonmbJCfqG+8jtrPG0vn+cSCw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 613a473e91e8a6dde1998873 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 09 Sep 2021 17:41:18
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C67F1C4361B; Thu,  9 Sep 2021 17:41:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from pmaliset-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C76C7C43618;
        Thu,  9 Sep 2021 17:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org C76C7C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, bhelgaas@google.com,
        robh+dt@kernel.org, swboyd@chromium.org, lorenzo.pieralisi@arm.com,
        svarbanov@mm-sol.com
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, mka@chromium.org, vbadigan@codeaurora.org,
        sallenki@codeaurora.org, manivannan.sadhasivam@linaro.org,
        Prasad Malisetty <pmaliset@codeaurora.org>
Subject: [PATCH v6 3/4] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP board
Date:   Thu,  9 Sep 2021 23:10:44 +0530
Message-Id: <1631209245-31256-4-git-send-email-pmaliset@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631209245-31256-1-git-send-email-pmaliset@codeaurora.org>
References: <1631209245-31256-1-git-send-email-pmaliset@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add PCIe and PHY nodes for sc7280 IDP board.

Signed-off-by: Prasad Malisetty <pmaliset@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp.dts | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index 64fc22a..b249ca1 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -61,6 +61,45 @@
 	modem-init;
 };
 
+&pcie1 {
+	status = "okay";
+
+	vdda-supply = <&vreg_l10c_0p8>;
+};
+
+&pcie1_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l10c_0p8>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+};
+
+&pcie1_default_state {
+	clkreq {
+		bias-pull-up;
+	};
+
+	reset-n {
+		pins = "gpio2";
+		function = "gpio";
+
+		drive-strength = <16>;
+		output-low;
+		bias-disable;
+	};
+
+	wake-n {
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	nvme-n {
+		pins = "gpio19";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
 &pmk8350_vadc {
 	pmr735a_die_temp {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

