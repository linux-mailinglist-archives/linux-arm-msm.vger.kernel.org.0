Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAE47225A80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 10:54:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgGTIy2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 04:54:28 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:14236 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727809AbgGTIy1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 04:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1595235264;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=BWaZlE2pjEFqHV7iLTrTamEDxBJXrAlZ8aD6tVzv85s=;
        b=LjX5C8I4edpdhraXy48ki15MkJn+T9gShNRITVKx/KGRNtYumLPCldMieS0KEKkkz+
        LooFn0AaExRvgUhLCfjB9vPb1VJks1UJim7bY8LvWbzAw3xdlvpBNrfIVfvH4bikhhrv
        npSyXEqJ+cqDZAaH0P/hvFN9hSSGiyozfRYLaEurbSD2ooGdhYfLDXNrbbQaVR/MrlcJ
        PWXzUSY5umL+ZjLsw1mcEXoKfCXwoTc5IkVEvmJ4E72XPT3kwOw9x9TB0csF0BgYYzbq
        aPKd/eqHB5BBrosiQAf77jkMU4en7CjQD1yQb7Rhm0bJTQxUKheX6YnJjG2/750+g3js
        zFFQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4G6NeHYC"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew6K8sMdgP
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 20 Jul 2020 10:54:22 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 10/10] arm64: dts: qcom: msm8916: Move common USB properties to msm8916.dtsi
Date:   Mon, 20 Jul 2020 10:54:06 +0200
Message-Id: <20200720085406.6716-11-stephan@gerhold.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200720085406.6716-1-stephan@gerhold.net>
References: <20200720085406.6716-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Right now we define "hnp-disable", "srp-disable", "adp-disable"
separately for every MSM8916 board that has USB working.

They are needed for USB to work properly if CONFIG_USB_OTG_FSM
is enabled. This is because the chipidea OTG FSM code waits for
interrupts regarding the VBUS state (AVVIS). Those never happen
on MSM8916 because VBUS is always connected to the PMIC instead
of the USB controller.

There was a patch [1] to work around this but ultimately it was
decided that it's easier to disable the OTG FSM altogether using
these properties. This works fine for most use cases, because the
OTG FSM isn't needed for simple dual role host/gadget operation.

Given that these properties are needed for every MSM8916 device,
move them to msm8916.dtsi so we can avoid some more duplication.

[1]: https://lore.kernel.org/lkml/20160707222114.1673-10-stephen.boyd@linaro.org/

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi                  | 3 ---
 arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts       | 4 ----
 arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi | 4 ----
 arch/arm64/boot/dts/qcom/msm8916.dtsi                      | 3 +++
 4 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
index 1ecc49e36319..e4b655eb153b 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
@@ -379,9 +379,6 @@ codec {
 &usb {
 	status = "okay";
 	extcon = <&usb_id>, <&usb_id>;
-	adp-disable;
-	hnp-disable;
-	srp-disable;
 
 	pinctrl-names = "default", "device";
 	pinctrl-0 = <&usb_sw_sel_pm &usb_hub_reset_pm>;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index dec5e3ba7df4..b9d3c5d98dd0 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -87,10 +87,6 @@ &usb {
 	status = "okay";
 	dr_mode = "peripheral";
 	extcon = <&usb_vbus>;
-
-	hnp-disable;
-	srp-disable;
-	adp-disable;
 };
 
 &usb_hs_phy {
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
index eb667f4b0e05..2ba649bffd4e 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-a2015-common.dtsi
@@ -153,10 +153,6 @@ &sdhc_2 {
 &usb {
 	status = "okay";
 	extcon = <&muic>, <&muic>;
-
-	hnp-disable;
-	srp-disable;
-	adp-disable;
 };
 
 &usb_hs_phy {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 273faffab369..d6a5b60846d9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -802,6 +802,9 @@ usb: usb@78d9000 {
 			reset-names = "core";
 			phy_type = "ulpi";
 			dr_mode = "otg";
+			hnp-disable;
+			srp-disable;
+			adp-disable;
 			ahb-burst-config = <0>;
 			phy-names = "usb-phy";
 			phys = <&usb_hs_phy>;
-- 
2.27.0

