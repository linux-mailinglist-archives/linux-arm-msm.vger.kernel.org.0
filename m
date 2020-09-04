Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EA1025D37C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 10:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729872AbgIDIXL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Sep 2020 04:23:11 -0400
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:49928
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729850AbgIDIXI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Sep 2020 04:23:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1599207787;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
        bh=3keeEfNiCTvzmfIarvOhYL+zMj7DHdVzNrsSjCBJmHI=;
        b=LaLhtGoKOhC3BP1EoNEtrkRHs1QW+b0FlCdM60Yw5Hq+mEK6vBE6gOJPQoGfzoF/
        k0FyNgm0Qee4ioDUj6/lBjMr7/YCtl3WZ6dDUt8EUYF53mTwjmoj+9oVqeswPenwMmR
        GUTZgifwf3EPR7SaAOugmcarzuAo3/K7o9s3JKt0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1599207787;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID;
        bh=3keeEfNiCTvzmfIarvOhYL+zMj7DHdVzNrsSjCBJmHI=;
        b=mORnPJzp3eHkUc8k9KOFUchAuHC7OEdVVCgid/8Miwb0dkNLIBpERbDSg7KiV9aI
        VdLbyPrv9RjKcBMVvT2bOUMLK1fqkXZzd1RGFKZWp5wlYCpQ+RvR4SM+zxhulbn4aYt
        H6GGBb2h5OkLOrqN60G20t3YqBJ/PvuFsPLDGe7s=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=2.0 tests=ALL_TRUSTED,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4118FC433B1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     sboyd@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, robh+dt@kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, sergei.shtylyov@gmail.com,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v9 4/4] arm64: boot: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster
Date:   Fri, 4 Sep 2020 08:23:07 +0000
Message-ID: <0101017458364bb2-6157c88f-07cb-4a21-ac6b-442a09827ba0-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200904082223.25563-1-wcheng@codeaurora.org>
References: <20200904082223.25563-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SES-Outgoing: 2020.09.04-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the required DTS node for the USB VBUS output regulator, which is
available on PM8150B.  This will provide the VBUS source to connected
peripherals.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/pm8150b.dtsi   | 6 ++++++
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 053c659734a7..b49caa63cd4c 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -53,6 +53,12 @@ power-on@800 {
 			status = "disabled";
 		};
 
+		pm8150b_vbus: regulator@1100 {
+			compatible = "qcom,pm8150b-vbus-reg";
+			status = "disabled";
+			reg = <0x1100>;
+		};
+
 		pm8150b_typec: typec@1500 {
 			compatible = "qcom,pm8150b-usb-typec";
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index 6c6325c3af59..ba3b5b802954 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -409,6 +409,10 @@ &ufs_mem_phy {
 	vdda-pll-max-microamp = <19000>;
 };
 
+&pm8150b_vbus {
+	status = "okay";
+};
+
 &usb_1_hsphy {
 	status = "okay";
 	vdda-pll-supply = <&vdd_usb_hs_core>;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

