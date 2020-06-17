Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B668B1FD003
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 16:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgFQOwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 10:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbgFQOv4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 10:51:56 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288DAC061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:51:56 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id i12so1113129pju.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oHDXTrxrPr/ji5r+gzel+9fUGlLw6TAHPNwGJ7xfdkA=;
        b=VvUC35sOnZr1p54G45m3VOKy8uZ8e5bmbhcZN9jZnFVgnTDiwJJjn9q1w9joR+fq6+
         LvIBHOBoTFfEjjTgB2XyZgDwbQMwmAF2q/yvQvrXOVOTPcqSP5y46rr1TpxGi0W40RPU
         9jf31u38Q01rzuP+kO6uGvxmaReLYGtsWSpAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oHDXTrxrPr/ji5r+gzel+9fUGlLw6TAHPNwGJ7xfdkA=;
        b=e7BJpcb83ZfmCQfiPQ77RQrbvOZ/V9YqF6Lud1Wp8sV8lRjLECDGr/8lTea+dwwr6w
         i77R1pLLq/gm/mEQXt/zsfeRbgnGzq59ZFrILVqN8C26dp0FRc5AJvDaV1S+6jQWvXRN
         bUa8+qqD5XqBO3JhJG1GgsDeLUXAIDzciALXuflv7v/s1enlaCd75l+TKNbLkxJ/lik4
         /4bp4t+oU5QbBUTBArESaDIPqsPzcTTJr7Pt7kDOHrWiUylkFdq3ts2aLn0V4/a3j0zR
         6ZIXXO/ccfP3r7BCAivvC8Ax/N3c+B/rK4TGYVrbdNrwGQCM+ERqN7i/Q9nMPhLxkLIE
         58kA==
X-Gm-Message-State: AOAM532ylTzstaYW5Fq1qhPpq3LG5GxBO9eBjjJ3vmj38o/nBMMyt4nt
        jWYhZxDj4RPahQesm+HS3HArbQ==
X-Google-Smtp-Source: ABdhPJyABziZjJ2pLl5VgSZD68qgYBT6lnAEYD6+D8xTs6fWFVqzHs1ul+Kl1aQoJPBpUFqDygFnzg==
X-Received: by 2002:a17:90b:4911:: with SMTP id kr17mr8174779pjb.40.1592405515652;
        Wed, 17 Jun 2020 07:51:55 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id k18sm147040pfp.208.2020.06.17.07.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:51:55 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: qcom: sc7180: Add properties to qfprom for fuse blowing
Date:   Wed, 17 Jun 2020 07:51:16 -0700
Message-Id: <20200617074930.v3.4.I70c17309f8b433e900656d7c53a2e6b61888bb68@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200617145116.247432-1-dianders@chromium.org>
References: <20200617145116.247432-1-dianders@chromium.org>
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
index 31b9217bb5bf..d7f5e3d64b17 100644
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
+			clock-names = "sec";
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-- 
2.27.0.290.gba653c62da-goog

