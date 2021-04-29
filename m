Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 083AB36F1BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Apr 2021 23:15:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237347AbhD2VQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Apr 2021 17:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237260AbhD2VQJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Apr 2021 17:16:09 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56CF5C061353
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 14:15:22 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id n184so41903433oia.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Apr 2021 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uMJoe+vUrfgBQEq7kVx0XYeKeargRfuihI9VgkHYtiA=;
        b=wxr1SsFiEfFb/fpq6xoNyH409ZwaJoA5FgMsaki/bg3OYpXxoigMTJYRPK9ASxP+em
         jysubih129PB5RTSLbXM5Mm9JP8X1T14Omx2t88zNBKVMFXOpzg+Fhbaag9DK5vFIAGO
         ZBM0ZacTftyZuIdYS5tBJHlBMfznNxPeRVY9flovABrWqutDlGc8GiOa1CV3cG1Lu+4g
         ZZ5BWZ0UY91D8sGmek6Q730s/vTplSLsHPWvXIRE/Xh+utDU+UbaD54583BwlkhSavxj
         /0H1wG05VPeET7IRirKN8OG8bH0iPluj0QD6eRa/sn53JaQBCIhYMky1tiGTROMZPcOi
         rbew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uMJoe+vUrfgBQEq7kVx0XYeKeargRfuihI9VgkHYtiA=;
        b=snx7krNLhfeYDkwzTlOAcIETbYrYnFRewlP3jD10LJrZICELHU8heZacuUCNVk8Y0q
         qAYScamrQMyUzA/3foZaHupZrP37q8n0hZi1QV9/YM+eVOzUt8CNxA/CLKNsysevfxrd
         gwl4pUc61wbeTcK5svawpsoTLOsiSO7sprkVYWeoDTRr7g5FYVsLrPt+5Li296+DJyUe
         jm3gufC6Tp2N8WStwfJyKaT6/PbYClnsnGotOnPAGATAAKYErNS2eVUYarVkDhDZiNrn
         hyYsPh+0CQoPbNlRscOZIy7hPCWz1h2Y6woqCwMJnrtt1bIl9ZBg9mfAzafFcWLSEBlo
         A/DA==
X-Gm-Message-State: AOAM532mdZ0xawfElSSy4RKOOIkzW7wFekreLnBY7W9JIKzFS9wqANqU
        FCL5/Z1jE5VCQAuckblxAxxS1G12URDZ5g==
X-Google-Smtp-Source: ABdhPJy/n4govBiRSCfjzIykABf5J674t4vnN5+OPUK++1h6JrCE4GBeaKuK7jP4HN0htaVAP6d3FQ==
X-Received: by 2002:aca:a947:: with SMTP id s68mr1515804oie.8.1619730921749;
        Thu, 29 Apr 2021 14:15:21 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id y67sm242707otb.1.2021.04.29.14.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Apr 2021 14:15:21 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [PATCH v7 6/6] arm64: dts: qcom: db820c: Add user LEDs
Date:   Thu, 29 Apr 2021 14:15:17 -0700
Message-Id: <20210429211517.312792-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210429211517.312792-1-bjorn.andersson@linaro.org>
References: <20210429211517.312792-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The db820c has 4 "user LEDs", all connected to the PMI8994. The first
three are connected to the three current sinks provided by the TRILED
and the fourth is connected to MPP2.

By utilizing the DTEST bus the MPP is fed the control signal from the
fourth LPG block, providing a consistent interface to the user.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v6:
- Changed sort order

 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 49 ++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index defcbd15edf9..2b90ceb84f84 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -8,6 +8,7 @@
 #include "pmi8994.dtsi"
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -682,6 +683,54 @@ pinconf {
 	};
 };
 
+&pmi8994_lpg {
+	qcom,power-source = <1>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pmi8994_mpp2_userled4>;
+
+	qcom,dtest = <0 0
+		      0 0
+		      0 0
+		      4 1>;
+
+	status = "okay";
+
+	led@1 {
+		reg = <1>;
+		label = "green:user1";
+
+		linux,default-trigger = "heartbeat";
+		default-state = "on";
+	};
+
+	led@2 {
+		reg = <2>;
+		label = "green:user0";
+		default-state = "on";
+	};
+
+	led@3 {
+		reg = <3>;
+		label = "green:user2";
+	};
+
+	led@4 {
+		reg = <4>;
+		label = "green:user3";
+	};
+};
+
+&pmi8994_mpps {
+	pmi8994_mpp2_userled4: mpp2-userled4-state {
+		pins = "mpp2";
+		function = "sink";
+
+		output-low;
+		qcom,dtest = <4>;
+	};
+};
+
 &pmi8994_spmi_regulators {
 	vdd_gfx: s2@1700 {
 		reg = <0x1700 0x100>;
-- 
2.29.2

