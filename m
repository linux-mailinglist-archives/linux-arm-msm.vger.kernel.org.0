Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA4721B8C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 16:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgGJOf6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 10:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727906AbgGJOfq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 10:35:46 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41FDEC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 07:35:46 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id f2so2325205plr.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Un87GvVkLmhF1eD8x6P9VVT98h6gpLaIkLYOlmueJo8=;
        b=AqOuod1fwoFP8Tl3n4oeOceJUx+4OJE8UasSb6dQjuRAapdz1DxX6akUzAv3oQPDft
         EbSf0sKCrk6VrDSDmXxnGhmenTmbuQS3xhrf52FYTv2aBS6h5g6sBtCfXQDYAfYY0+y6
         95bW4mM0b8sJuOBccqDzwwcSw7gCY3DfSkok4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Un87GvVkLmhF1eD8x6P9VVT98h6gpLaIkLYOlmueJo8=;
        b=VPWWYGx5NhZe8/D903g7JtISH+5GM7vVGu4yT3aJncD2aItFfMsjydoPHgZonrQemL
         yH2llt1EV23bVOXxYXEtbHVEoXC+5mF/yUxlnYaV/nzubTtl+i3W2pnr3jm7k1Aoe4+3
         jWC+QM6B0HR0Kr8Baws0VX1QfVWBU1MqxcR0NnkIV2Lsn1OKnVyP8DxDCaqj0sJ0C446
         HH/p1G+wsa2NtxRH3lmuHMXmJ/PEVMydOIoKw2SyiiVQ8bPMoRlr0kN6ibkg7shBib94
         Qtldypo6G6O3PjRigToq8/Fvd1C83436aHVkglhWZBF1ml5iVFmaJ3iKUP7MUcob0x1T
         tjrQ==
X-Gm-Message-State: AOAM533NBzzQGHclnCl8AbPvTbotu4glCikJifS3JPe5U8WAvoSb7q/5
        EfhmUB+9K5AlSJ5DEO7Rmia7PQ==
X-Google-Smtp-Source: ABdhPJyDmDg0FdGBTycWUOByl/yrczi2w0sew0nGDK/z8a2DzZ8JeG1QKYFxbFhxOgBU6mTFElxGqQ==
X-Received: by 2002:a17:90a:158f:: with SMTP id m15mr5996876pja.93.1594391745744;
        Fri, 10 Jul 2020 07:35:45 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id gn5sm5951284pjb.23.2020.07.10.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 07:35:45 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     sparate@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        mturney@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>, dhavalp@codeaurora.org,
        rnayak@codeaurora.org, mkurumel@codeaurora.org,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/4] arm64: dts: qcom: sc7180: Add properties to qfprom for fuse blowing
Date:   Fri, 10 Jul 2020 07:35:20 -0700
Message-Id: <20200710073439.v5.4.I70c17309f8b433e900656d7c53a2e6b61888bb68@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710143520.1206846-1-dianders@chromium.org>
References: <20200710143520.1206846-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ravi Kumar Bokka <rbokka@codeaurora.org>

This patch adds properties to the qfprom node to enable fuse blowing.

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Presumably this patch to the device tree file should go through the
Qualcomm tree.  Now that bindings have been reviewed by Rob it could
probably land any time.

Changes in v5: None
Changes in v4:
- Clock name is "core", not "sec".

Changes in v3:
- Name is now 'efuse' to match what schema checker wants.
- Reorganized ranges to match driver/bindings changes.
- Added 4th range as per driver/binding changes.
- No more reg-names as per driver/binding changes.
- Clock name is now just "sec" as per driver/binding changes.

 arch/arm64/boot/dts/qcom/sc7180-idp.dts |  4 ++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi    | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
index 4e9149d82d09..2a9224e2083f 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
@@ -287,6 +287,10 @@ vreg_bob: bob {
 	};
 };
 
+&qfprom {
+	vcc-supply = <&vreg_l11a_1p8>;
+};
+
 &qspi {
 	status = "okay";
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 31b9217bb5bf..fbf9554f1e3a 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -498,9 +498,15 @@ gcc: clock-controller@100000 {
 			#power-domain-cells = <1>;
 		};
 
-		qfprom@784000 {
+		qfprom: efuse@784000 {
 			compatible = "qcom,qfprom";
-			reg = <0 0x00784000 0 0x8ff>;
+			reg = <0 0x00784000 0 0x8ff>,
+			      <0 0x00780000 0 0x7a0>,
+			      <0 0x00782000 0 0x100>,
+			      <0 0x00786000 0 0x1fff>;
+
+			clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
+			clock-names = "core";
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-- 
2.27.0.383.g050319c2ae-goog

