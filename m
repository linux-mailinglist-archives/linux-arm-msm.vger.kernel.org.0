Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3474C43FACE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Oct 2021 12:34:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhJ2Kg0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Oct 2021 06:36:26 -0400
Received: from ixit.cz ([94.230.151.217]:48590 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231827AbhJ2KgX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Oct 2021 06:36:23 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id CFA7920064;
        Fri, 29 Oct 2021 12:33:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1635503633;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e1zxTl02rhGQS8X3GLUw3pjPiqt2F1UW8BN7yf2w+7k=;
        b=W3Qe8n3mP0KGmRH6GsfqJnh5J7pJwuC+3Vd8R2jyTVrvCnyefr0c0tEvxYlKkuvKks1NgS
        YmyyAfq71FuIki5jqVIKnZUfKTKGzyLHwm6bH/vDh0VeS5ug+YheAgQXK6vfSsDFdE+HnU
        2z/y3Y+xEICHIaYyRY9Eibgp9foe108=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ARM: dts: qcom: update USB nodes with new platform specific compatible
Date:   Fri, 29 Oct 2021 12:33:39 +0200
Message-Id: <20211029103340.26828-2-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211029103340.26828-1-david@ixit.cz>
References: <20211029103340.26828-1-david@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To match dwc3 documentation, add compatible for platform.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 4 ++--
 arch/arm/boot/dts/qcom-ipq8064.dtsi | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index ff1bdb10ad19..7dec0553636e 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -637,7 +637,7 @@ usb3_hs_phy: hsphy@a6000 {
 		};
 
 		usb3: usb3@8af8800 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,ipq4019-dwc3", "qcom,dwc3";
 			reg = <0x8af8800 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -669,7 +669,7 @@ usb2_hs_phy: hsphy@a8000 {
 		};
 
 		usb2: usb2@60f8800 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,ipq4019-dwc3", "qcom,dwc3";
 			reg = <0x60f8800 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
index 11481313bdb6..996f4458d9fc 100644
--- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
@@ -1080,7 +1080,7 @@ ss_phy_0: phy@100f8830 {
 		};
 
 		usb3_0: usb3@100f8800 {
-			compatible = "qcom,dwc3", "syscon";
+			compatible = "qcom,ipq8064-dwc3", "qcom,dwc3";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x100f8800 0x8000>;
@@ -1122,7 +1122,7 @@ ss_phy_1: phy@110f8830 {
 		};
 
 		usb3_1: usb3@110f8800 {
-			compatible = "qcom,dwc3", "syscon";
+			compatible = "qcom,ipq8064-dwc3", "qcom,dwc3";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			reg = <0x110f8800 0x8000>;
-- 
2.33.0

