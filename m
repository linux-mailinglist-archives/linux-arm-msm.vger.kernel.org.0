Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 852A51B90C9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Apr 2020 16:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726142AbgDZOId (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Apr 2020 10:08:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726143AbgDZOIc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Apr 2020 10:08:32 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BC80C09B052;
        Sun, 26 Apr 2020 07:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1587910110;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=VRrCcdTijQc1LuH1q5iBm9hifRAlB2p1XKY8J4Jb5v0=;
        b=B5YfTG5VAI/SbCmgULQigUvHhMxt7/0BxB/VE+ygrZOGNlgnMXHOTyPg72bsuCDms4
        /IAsXq76DLUSDGh/AEaDBpQNe91XXUcxn0+Y5anWX5HJ914Ahw9hJYWGIEj722NnELzy
        xSiBKdR21DVmeM4bk3W9kWNBG6NH4C2TCX53+Llm38c1JQGmFc06LwjAYWCwoNC4BoEC
        xkhSyJuYoRMrtCvAa1kXxxAyUl5VDHOBQi7/0VBldpmvYr+QrPTjw0pEoynkow6CW1Eb
        3nLJLj61cSumpRm+F82iQOsKBEnh7U7lZCm62s1NCKKQE9N2MFfRA9PjoSb1LEtPkEmw
        JdHA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6Nf3AC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id 60b02dw3QE8RNFN
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Sun, 26 Apr 2020 16:08:27 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 4/4] arm64: dts: qcom: msm8916-samsung-a5u: Add touchscreen
Date:   Sun, 26 Apr 2020 16:06:42 +0200
Message-Id: <20200426140642.204395-5-stephan@gerhold.net>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200426140642.204395-1-stephan@gerhold.net>
References: <20200426140642.204395-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A5U uses a Melfas MMS345L touchscreen that is connected to
blsp_i2c5. Add it to the device tree.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Note: For the touchscreen to work this patch depends on
https://lore.kernel.org/linux-input/20200423102431.2715-1-stephan@gerhold.net/
which was just applied to linux-next.
---
 .../boot/dts/qcom/msm8916-samsung-a5u-eur.dts | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
index 6629a621139c..295a0f969914 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dts
@@ -9,8 +9,43 @@ / {
 	compatible = "samsung,a5u-eur", "qcom,msm8916";
 };
 
+&blsp_i2c5 {
+	status = "okay";
+
+	touchscreen@48 {
+		compatible = "melfas,mms345l";
+
+		reg = <0x48>;
+		interrupt-parent = <&msmgpio>;
+		interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+
+		avdd-supply = <&reg_vdd_tsp>;
+		vdd-supply = <&pm8916_l6>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+	};
+};
+
 &pronto {
 	iris {
 		compatible = "qcom,wcn3680";
 	};
 };
+
+&msmgpio {
+	ts_int_default: ts_int_default {
+		pinmux {
+			function = "gpio";
+			pins = "gpio13";
+		};
+		pinconf {
+			pins = "gpio13";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+};
-- 
2.26.2

