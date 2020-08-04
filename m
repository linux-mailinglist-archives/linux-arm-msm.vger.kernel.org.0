Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0066E23B1C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Aug 2020 02:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgHDApr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 20:45:47 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:37198 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727899AbgHDApr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 20:45:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596501946; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=OLPKTdSqqloYxw93IHUq14f5yJAcWoSaKHnlKyo6IBE=; b=U6n1bGidbK8i8aZVuIlFOAVfAFtoQWHg9kWchJ7Q23zwLVW2tFJzuLk+B+RKPgW7SLRI/qig
 mBwS05DwMO5T+ukcpbHz4NPxVnLqGp1BXX8/51ceSVEDomLolGmsWrcQZLtj+ypUwfNOe/SR
 KZdlc2yYY6cMkVMRs9n2dw9tJyE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5f28afb576a940cda887636f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 Aug 2020 00:45:41
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3D123C433A0; Tue,  4 Aug 2020 00:45:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3419DC433C6;
        Tue,  4 Aug 2020 00:45:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3419DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     robh+dt@kernel.org, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, sboyd@kernel.org,
        Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH v7 4/4] arm64: boot: dts: qcom: pm8150b: Add DTS node for PMIC VBUS booster
Date:   Mon,  3 Aug 2020 17:45:23 -0700
Message-Id: <20200804004523.7964-5-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200804004523.7964-1-wcheng@codeaurora.org>
References: <20200804004523.7964-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 053c659734a7..9e560c1ca30d 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -53,6 +53,12 @@ power-on@800 {
 			status = "disabled";
 		};
 
+		pm8150b_vbus: dcdc@1100 {
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

