Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44EB9285024
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 18:47:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgJFQrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 12:47:03 -0400
Received: from z5.mailgun.us ([104.130.96.5]:37708 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725769AbgJFQrD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 12:47:03 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602002822; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=s4iKWaLpOC+X+JKNpHvDXG7sSzTkTqzFgDACDzo1ImM=; b=UFaNs37iiOyuhwRCOJawruF1uAOCGMN5May0c8TUdJEUMTHhGKDDED3bTCvZNtxejkjYnK7V
 1g51VoCkF5GRgetRtUWIRrP/xc/JKFskUGaFYaZ324IzoW/zvQuGELzS5Xv0tLWT+eHvRJET
 J8DfYYbHxAuSznxpJY4N2+Yhd9o=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5f7c9f863711fec7b160d96b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 06 Oct 2020 16:47:02
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BD8BCC433F1; Tue,  6 Oct 2020 16:47:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BCE8AC433CA;
        Tue,  6 Oct 2020 16:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BCE8AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver
Date:   Tue,  6 Oct 2020 22:16:43 +0530
Message-Id: <1602002803-29971-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Add dai link for supporting lpass I2S driver, which is used
for audio capture and playback.
Add lpass-cpu node with  pin controls and i2s primary
and secondary dai-links

Signed-off-by: Ajit Pandey <ajitp@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
---
Changes since v1:
   -- Alias name added for sound dai link node
   
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bf87558..e5863ad 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -220,6 +220,44 @@
 			max-brightness = <1023>;
 		};
 	};
+
+	sound: sound {
+		compatible = "qcom,sc7180-sndcard";
+		model = "sc7180-snd-card";
+
+		audio-routing =
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR";
+
+		audio-jack = <&alc5682>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			link-name = "MultiMedia0";
+			reg = <0>;
+			cpu {
+				sound-dai = <&lpass_cpu 0>;
+			};
+
+			codec {
+				sound-dai = <&alc5682 0>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "MultiMedia1";
+			reg = <1>;
+			cpu {
+				sound-dai = <&lpass_cpu 1>;
+			};
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+		};
+	};
 };
 
 &qfprom {
@@ -725,6 +763,27 @@ hp_i2c: &i2c9 {
 	modem-init;
 };
 
+&lpass_cpu {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sec_mi2s_active &pri_mi2s_active &pri_mi2s_mclk_active>;
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mi2s-primary@0 {
+		reg = <MI2S_PRIMARY>;
+		qcom,playback-sd-lines = <1>;
+		qcom,capture-sd-lines = <0>;
+	};
+
+	mi2s-secondary@1 {
+		reg = <MI2S_SECONDARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+};
+
 &mdp {
 	status = "okay";
 };
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.,
is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.

