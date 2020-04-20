Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBE61B1049
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 17:35:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgDTPfy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 11:35:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbgDTPfy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 11:35:54 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51894C061A10
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 08:35:54 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id t3so11060198qkg.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 08:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5AdbeASeN3LWLwAao7IPBW2Z8hbXGbMOqZhqhTsi0o=;
        b=xH/QmMTGrRk0vg4u23/IshU43Loy0kmEdOHU6LEJwx6eLcIS3nQx+g31KY/s6njFes
         eFpdGA7e7bgn8AdpC+HYklwRzIuGD6UXVNiT7wwaO//ei1ErR5rh3im2N2npx0XtCH5I
         7MjCLC6WKMEnm3WT0zxCUgdOoShSJb5RDyIr6UhlStTvwIFSmgZiz9QK5w6vmP2gTElx
         1KMCF7wdByLiQjdgU36XzxKeuqW39K5IHYgTUtlYhoJ/D3woMFjPHQJFTT80i3Pya+J6
         IqUmeLkj/OBSz+q5jbGXEunJfZIPSYFfvxTj/yhzE3WCA2F94rWYjbgLVNtuHOR6f/8C
         ieuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=P5AdbeASeN3LWLwAao7IPBW2Z8hbXGbMOqZhqhTsi0o=;
        b=DQgNVuwr/zbXEEmxBeQxakQKq0nahtPsGTTX1QbF0yQyjZ6L3D67opcr+vuIATFI91
         d6Zaed129KuHtCT7fTYxo8dbU6q0Ru6ld2P7fT6YRvekcA94eJtoIBKb+nT9gg74iqtP
         +l/uVfSX+8XJb3qOBzvwaJS/Jnxg8ZJtsiyNY1TFA0gv77YfauxjPlq3G9CqeGLVPZcX
         jvmwfdVCm7o5PVO1ZVg8p47iJ1ySFR6NIGR2mU7BbcyQluFf1Fez5Gc90RQASBGhzfEc
         GwNCcdUv7Zha6dSrVAE4AsPjgt/79HGi5MQiQ67ulgrqpwFt4e6Z6QSEDwMAnwUp7b4l
         Yk3Q==
X-Gm-Message-State: AGi0PuaeroVr+U7VUdi2VQwWZz9Obj5nEAcuLybEWhE9JLIf+CCrA1Kt
        p/Zkow96Stz7SNWXQsjAC38Z4Z2vohhMjQ==
X-Google-Smtp-Source: APiQypKoJbJWLjg+0XysGGc0MJ3P0qgeXjQAIu8l5u0lW95JQmearXo4++Rg9AGrTzIHk3HGJC7uNg==
X-Received: by 2002:a37:9e94:: with SMTP id h142mr15638183qke.56.1587396953312;
        Mon, 20 Apr 2020 08:35:53 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id b11sm708373qti.50.2020.04.20.08.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 08:35:52 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] arm64: dts: qcom: fix pm8150 gpio interrupts
Date:   Mon, 20 Apr 2020 11:35:43 -0400
Message-Id: <20200420153543.14512-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was mistakenly copied from the downstream dts, however the upstream
driver works differently.

I only tested this with the pm8150_gpios node (used with volume button),
but the 2 others should be the same.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 arch/arm64/boot/dts/qcom/pm8150.dtsi  | 14 ++------------
 arch/arm64/boot/dts/qcom/pm8150b.dtsi | 14 ++------------
 arch/arm64/boot/dts/qcom/pm8150l.dtsi | 14 ++------------
 3 files changed, 6 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
index b6e304748a57..c0b197458665 100644
--- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
@@ -73,18 +73,8 @@ pm8150_gpios: gpio@c000 {
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			interrupts = <0x0 0xc0 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc1 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc2 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc3 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc4 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc5 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc6 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc7 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc8 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xc9 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xca 0x0 IRQ_TYPE_NONE>,
-				     <0x0 0xcb 0x0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/pm8150b.dtsi b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
index 322379d5c31f..40b5d75a4a1d 100644
--- a/arch/arm64/boot/dts/qcom/pm8150b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150b.dtsi
@@ -62,18 +62,8 @@ pm8150b_gpios: gpio@c000 {
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			interrupts = <0x2 0xc0 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc1 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc2 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc3 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc4 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc5 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc6 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc7 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc8 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xc9 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xca 0x0 IRQ_TYPE_NONE>,
-				     <0x2 0xcb 0x0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/pm8150l.dtsi b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
index eb0e9a090e42..cf05e0685d10 100644
--- a/arch/arm64/boot/dts/qcom/pm8150l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8150l.dtsi
@@ -56,18 +56,8 @@ pm8150l_gpios: gpio@c000 {
 			reg = <0xc000>;
 			gpio-controller;
 			#gpio-cells = <2>;
-			interrupts = <0x4 0xc0 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc1 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc2 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc3 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc4 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc5 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc6 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc7 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc8 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xc9 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xca 0x0 IRQ_TYPE_NONE>,
-				     <0x4 0xcb 0x0 IRQ_TYPE_NONE>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
 		};
 	};
 
-- 
2.26.1

