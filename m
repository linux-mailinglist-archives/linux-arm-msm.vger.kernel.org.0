Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3EAD404109
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Sep 2021 00:32:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240136AbhIHWdn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 18:33:43 -0400
Received: from ixit.cz ([94.230.151.217]:33150 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229997AbhIHWdm (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 18:33:42 -0400
Received: from newone.lan (ixit.cz [94.230.151.217])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id 7F21324BAF;
        Wed,  8 Sep 2021 21:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1631129685;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SxiVdUlQ7fYzowAHt3rgwVXftn+wj1pzvOHK68gmgPY=;
        b=wO7Wnqgjg6LHEVCOcSFU7TfunNi3wC6eu9Yxq4K/cUMaN6w+370N5Islyn6OVh/KXcO968
        We/iE5hmciQjowr3x++aYKIp6wbcPe9/W3oFwIPdqHXJAS9N4IMbhM21e3BLFjk5MAC1n3
        reB52BlboHn0lGO7q2Z1EKqAV1ypUwg=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>
Cc:     linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>
Subject: [PATCH 2/2] ARM: dts: qcom: ipq4019: add dwc3 arch spec compatible
Date:   Wed,  8 Sep 2021 21:33:29 +0200
Message-Id: <20210908193329.87992-2-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210908193329.87992-1-david@ixit.cz>
References: <20210908193329.87992-1-david@ixit.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To be compilant with qcom,dwc3 definition
 - add compatible
 - rename dwc3@ to usb@

No functional changes intended.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index a3ae5458ac68..25b7e10537df 100644
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
@@ -648,7 +648,7 @@ usb3: usb3@8af8800 {
 			ranges;
 			status = "disabled";
 
-			dwc3@8a00000 {
+			usb@8a00000 {
 				compatible = "snps,dwc3";
 				reg = <0x8a00000 0xf8000>;
 				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
@@ -669,7 +669,7 @@ usb2_hs_phy: hsphy@a8000 {
 		};
 
 		usb2: usb2@60f8800 {
-			compatible = "qcom,dwc3";
+			compatible = "qcom,ipq4019-dwc3", "qcom,dwc3";
 			reg = <0x60f8800 0x100>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -680,7 +680,7 @@ usb2: usb2@60f8800 {
 			ranges;
 			status = "disabled";
 
-			dwc3@6000000 {
+			usb@6000000 {
 				compatible = "snps,dwc3";
 				reg = <0x6000000 0xf8000>;
 				interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.33.0

