Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25EC13379F3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:49:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229862AbhCKQtU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:49:20 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:63388 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229711AbhCKQsw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:48:52 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615481332; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+2MWXHMiwd9qfrAGg+1XjZZh6W3pD42rnX7PuXdjkCs=; b=KDpiycQfW168WBePsPGdM3DbLThGdpsBitPaaPIFEULhyLjQueoKb8gKXaIW/PdFsWGyBjE3
 L0zJ1zgD6pXKVMGBtz0wUEYu29GlPZx5Qk8H9fRr5qG76qvUAxr5WJ05mKUMaBTLVsfV18A5
 f1PHqF4GkcTQgvvMnU4pN72C+ps=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 604a49e7e2200c0a0d417059 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Mar 2021 16:48:39
 GMT
Sender: srivasam=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BDD16C43467; Thu, 11 Mar 2021 16:48:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld210.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: srivasam)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2213C433CA;
        Thu, 11 Mar 2021 16:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2213C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=srivasam@codeaurora.org
From:   Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
To:     gross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, rohitkr@codeaurora.org,
        srinivas.kandagatla@linaro.org, dianders@chromium.org,
        swboyd@chromium.org, judyhsiao@chromium.org
Cc:     Ajit Pandey <ajitp@codeaurora.org>,
        V Sujith Kumar Reddy <vsujithk@codeaurora.org>,
        Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Subject: [PATCH v4 1/2] arm64: dts: qcom: sc7180-trogdor: Add lpass dai link for I2S driver
Date:   Thu, 11 Mar 2021 22:18:14 +0530
Message-Id: <20210311164815.14113-2-srivasam@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20210311164815.14113-1-srivasam@codeaurora.org>
References: <20210311164815.14113-1-srivasam@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
index 436582279dad..501e3d4c9097 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
@@ -9,6 +9,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,lpass.h>
 
 /* PMICs depend on spmi_bus label and so must come after SoC */
 #include "pm6150.dtsi"
@@ -283,6 +284,42 @@ keyboard_backlight: keyboard-backlight {
 			max-brightness = <1023>;
 		};
 	};
+
+	sound: sound {
+		compatible = "google,sc7180-trogdor";
+		model = "sc7180-rt5682-max98357a-1mic";
+
+		audio-routing =
+			"Headphone Jack", "HPOL",
+			"Headphone Jack", "HPOR";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		dai-link@0 {
+			link-name = "MultiMedia0";
+			reg = <MI2S_PRIMARY>;
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_PRIMARY>;
+			};
+
+			codec {
+				sound-dai = <&alc5682 MI2S_PRIMARY>;
+			};
+		};
+
+		dai-link@1 {
+			link-name = "MultiMedia1";
+			reg = <MI2S_SECONDARY>;
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_SECONDARY>;
+			};
+
+			codec {
+				sound-dai = <&max98357a>;
+			};
+		};
+	};
 };
 
 &qfprom {
@@ -720,6 +757,27 @@ &ipa {
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

