Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F08D5233E85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Jul 2020 06:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730164AbgGaE5U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 31 Jul 2020 00:57:20 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50269 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730158AbgGaE5U (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 31 Jul 2020 00:57:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1596171439; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KqX0wJwFwjRWMCgKqLdvIZWRqiJV7nWZl0ANfpcdGlM=; b=ZZLMT1ddf0EhDJRMm1HcjI8v5UHJnOXt5yRjSgqDNip2j5axpM/vGxqlXv0saGfzH9l5jj9r
 n4X7PcDTOGHmZRBiPNf6OTIv5kqIDAzgpXaMXQzC/YXq+hunmXNyqW0pOCwm62aOlf/XbBcq
 fZ8Sok5WFF/8OC5YtobfWQQ+CqM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f23a4ae798b1029682db710 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 31 Jul 2020 04:57:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 799CCC433B1; Fri, 31 Jul 2020 04:57:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from wcheng-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: wcheng)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 696AFC433CA;
        Fri, 31 Jul 2020 04:57:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 696AFC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=wcheng@codeaurora.org
From:   Wesley Cheng <wcheng@codeaurora.org>
To:     bjorn.andersson@linaro.org, kishon@ti.com, vkoul@kernel.org,
        agross@kernel.org, balbi@kernel.org, gregkh@linuxfoundation.org,
        robh+dt@kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        jackp@codeaurora.org, Wesley Cheng <wcheng@codeaurora.org>
Subject: [PATCH 1/3] arm64: boot: dts: qcom: sm8150: Add nodes for PMIC based typec detection
Date:   Thu, 30 Jul 2020 21:57:10 -0700
Message-Id: <20200731045712.28495-2-wcheng@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200731045712.28495-1-wcheng@codeaurora.org>
References: <20200731045712.28495-1-wcheng@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce required child nodes to enable the PMIC based USB type C driver.
This consits of connector and endpoint nodes to drivers, which manage the
type C mux and the USB role switch.

Signed-off-by: Wesley Cheng <wcheng@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sm8150-mtp.dts | 37 ++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
index ba3b5b802954..c7d5aab69b56 100644
--- a/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8150-mtp.dts
@@ -413,6 +413,28 @@ &pm8150b_vbus {
 	status = "okay";
 };
 
+&pm8150b_typec {
+	status = "okay";
+	connector {
+		compatible = "usb-c-connector";
+		power-role = "dual";
+		data-role = "dual";
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@1 {
+				reg = <1>;
+				usb3_data_ss: endpoint@0 {
+					remote-endpoint = <&qmp_ss_mux>;
+				};
+				usb3_role: endpoint@1 {
+					remote-endpoint = <&dwc3_drd_switch>;
+				};
+			};
+		};
+	};
+};
+
 &usb_1_hsphy {
 	status = "okay";
 	vdda-pll-supply = <&vdd_usb_hs_core>;
@@ -424,12 +446,25 @@ &usb_1_qmpphy {
 	status = "okay";
 	vdda-phy-supply = <&vreg_l3c_1p2>;
 	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+	orientation-switch;
+	port {
+		qmp_ss_mux: endpoint@0 {
+			remote-endpoint = <&usb3_data_ss>;
+		};
+	};
 };
 
 &usb_1 {
 	status = "okay";
+	usb-role-switch;
+	port {
+		dwc3_drd_switch: endpoint@0 {
+			remote-endpoint = <&usb3_role>;
+		};
+	};
 };
 
 &usb_1_dwc3 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

