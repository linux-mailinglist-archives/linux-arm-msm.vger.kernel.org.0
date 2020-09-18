Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCA2F270039
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 16:52:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIROwP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 10:52:15 -0400
Received: from so254-54.mailgun.net ([198.61.254.54]:51505 "EHLO
        so254-54.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726629AbgIROwM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 10:52:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600440732; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=VCaK/PjSr2IoSDpVniOKKKF8ojfJ6Hs8WRbfiUdiwk8=; b=qufu5s78b5d4vLJTSRKU2KY3K3pdoxYSG0zzxJpMNc6t1+aFy6ByYGMlYcMwlKd5pl0Dqo7C
 yh8PmQ0leADRb7ISWkXZeDRmRUEo5JDe5DP0r1wPsj7Oeqk3a/t62lksCRiaPPwVGgdBXA3w
 0m7TluYUlKqrSTaDuYFaRhYso6M=
X-Mailgun-Sending-Ip: 198.61.254.54
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f64c9774a8a578ddc320165 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 14:51:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 08CD9C433C8; Fri, 18 Sep 2020 14:51:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0F58FC433C8;
        Fri, 18 Sep 2020 14:51:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0F58FC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver
Date:   Fri, 18 Sep 2020 20:21:18 +0530
Message-Id: <1600440678-2137-1-git-send-email-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ajit Pandey <ajitp@codeaurora.org>

Add dai link for supporting lpass I2S driver, which is used
for audio capture and playback.
Add lpass-cpu node with  pin controls and i2s primary
and secondary dai-links

Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 59 ++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index bf87558..5724982 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -220,6 +220,44 @@
 			max-brightness = <1023>;
 		};
 	};
+
+	sound {
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

