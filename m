Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C63543557B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 23:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhJTVuE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Oct 2021 17:50:04 -0400
Received: from ixit.cz ([94.230.151.217]:58092 "EHLO ixit.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229695AbhJTVuD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Oct 2021 17:50:03 -0400
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz [89.176.96.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ixit.cz (Postfix) with ESMTPSA id CCFAB20064;
        Wed, 20 Oct 2021 23:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
        t=1634766466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=iOJOGKD4+nMoa/XKfnzaJB8yvuBgtg5n+cX+CHz67bY=;
        b=NfcwT8Omg5zsizoFl7Wy+SrceP3t3sFE/cf52PIEP5V5vPsy/nacsUk1+BUDSwJgGd2L8S
        ftokWkL206vzpzRXKQUF2wmPm4UC7noDTZxYrh4sfh8O2SuDxY3xER2J4MABHJy/PK5jyb
        B8OC67xFMBKOC+grSgjShEDslQc8low=
From:   David Heidelberg <david@ixit.cz>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: qcom: fix memory and mdio nodes naming for RB3011
Date:   Wed, 20 Oct 2021 23:47:41 +0200
Message-Id: <20211020214741.261509-1-david@ixit.cz>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixes warnings regarding to memory and mdio nodes and
apply new naming following dt-schema.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
index 0244dda06ee8..596d129d4a95 100644
--- a/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
+++ b/arch/arm/boot/dts/qcom-ipq8064-rb3011.dts
@@ -19,12 +19,12 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory@0 {
+	memory@42000000 {
 		reg = <0x42000000 0x3e000000>;
 		device_type = "memory";
 	};
 
-	mdio0: mdio@0 {
+	mdio0: mdio-0 {
 		status = "okay";
 		compatible = "virtual,mdio-gpio";
 		gpios = <&qcom_pinmux 1 GPIO_ACTIVE_HIGH>,
@@ -91,7 +91,7 @@ port@5 {
 		};
 	};
 
-	mdio1: mdio@1 {
+	mdio1: mdio-1 {
 		status = "okay";
 		compatible = "virtual,mdio-gpio";
 		gpios = <&qcom_pinmux 11 GPIO_ACTIVE_HIGH>,
-- 
2.33.0

