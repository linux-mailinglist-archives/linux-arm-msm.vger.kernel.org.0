Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 174923073E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 11:39:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbhA1Kh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 05:37:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbhA1Kh2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 05:37:28 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AAEC061756;
        Thu, 28 Jan 2021 02:36:45 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id a14so6010192edu.7;
        Thu, 28 Jan 2021 02:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gkPx8PDcUZ8TUrRVNnkfI4Ib3fiD7qtAnuQ7X18H/bY=;
        b=okaquC7FJKR2HAtvP85WRLaigIpKebiuOFy6e4BGGKOiORzZsrCcovXwoC0Zu86z38
         y1R+JzZNKgZom7gq5wxbRWJsUbRlBSmDuy3E47P2Lahjl1uEbDXPG8WttWdaAuYWJWzM
         JPaLSi65YLnOIkJCb2ZwEmYAPZim304XeipJdmMsEjxdrgYHPreLJgvLh03CdFXtay8/
         IlJ03xjGorrOKIkj7eFUpa23PuQNcdSe+c3mZwdJDdL8ZBmQsZfegQ0cSvDMQB3SpgfQ
         DZQIrW5OsTdz8oeG5g6iNYYKdI+7Eexj4wEn2oxanp1Auyg9KfpT0VQjxO04sNVHQGf4
         jFQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gkPx8PDcUZ8TUrRVNnkfI4Ib3fiD7qtAnuQ7X18H/bY=;
        b=mpesc7jBkhMe1NM2E5Td5pOBpvMA3GcVHrJgYYdU9pHDbugzc4jU8qCABBkECyRNur
         KNQx6htA6en6tRAQzKbndwD+jGBIaNb8M+htVsQFtjDxlCH/cCpVuAn79IN0vY+d7MvE
         RfUMe9kUlS0ovxQlknqXi8HsUvbaubrW8G8Ig/UBqB3e5bz9n+8BxNS6gafhPqLTE4Ui
         axacplrYBIQm3f+pM9uJzM8/iJiB1ZQAJuAj2kBqyQ//Dw9z4WhLsC2bBGrcpN2Q0Coi
         rsdaQt02kbudYmBAFOURqIWfMluK+DvuaNuOCuWG5xhizfeWVsx4sP85QK2DHVGfg97m
         Bcew==
X-Gm-Message-State: AOAM532x2efVeTihltAR+Ru/rvPmMUFJ3/4SW0DgEwW4zmsHD67/iivg
        yS/vPmlTM23n8F7JFKyL1RA=
X-Google-Smtp-Source: ABdhPJzr4UTKbnXTcIA47xycOmGi/GtOtSAlCHXMXOr8ShXl1BejkkGFCzIiCmz67XYldttn3czNlw==
X-Received: by 2002:a05:6402:2c4:: with SMTP id b4mr13233758edx.49.1611830204636;
        Thu, 28 Jan 2021 02:36:44 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id j23sm2061352ejs.112.2021.01.28.02.36.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 02:36:44 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Brian Masney <masneyb@onstation.org>,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v4 3/4] ARM: dts: qcom: msm8974-klte: add support for display
Date:   Thu, 28 Jan 2021 12:36:30 +0200
Message-Id: <20210128103632.1723952-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128103632.1723952-1-iskren.chernev@gmail.com>
References: <20210128103632.1723952-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Samuel Pascua <pascua.samuel.14@gmail.com>

Add initial support for the display found on the Samsung Galaxy 5 (klte)
phone. This is based on work from Jonathan Marek & Brian Masney.

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 61e67b7a4a067..2ea9ec432df58 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -453,6 +453,16 @@ int {
 				bias-pull-down;
 			};
 		};
+
+		panel_pin: panel {
+			te {
+				pins = "gpio12";
+				function = "mdp_vsync";
+
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
 	};

 	sdhc_1: sdhci@f9824900 {
@@ -701,6 +711,54 @@ fuelgauge@36 {
 	adreno@fdb00000 {
 		status = "ok";
 	};
+
+	mdss@fd900000 {
+		status = "ok";
+
+		mdp@fd900000 {
+			status = "ok";
+		};
+
+		dsi@fd922800 {
+			status = "ok";
+
+			vdda-supply = <&pma8084_l2>;
+			vdd-supply = <&pma8084_l22>;
+			vddio-supply = <&pma8084_l12>;
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ports {
+				port@1 {
+					endpoint {
+						remote-endpoint = <&panel_in>;
+						data-lanes = <0 1 2 3>;
+					};
+				};
+			};
+
+			panel: panel@0 {
+				reg = <0>;
+				compatible = "samsung,s6e3fa2";
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&panel_pin>;
+
+				port {
+					panel_in: endpoint {
+						remote-endpoint = <&dsi0_out>;
+					};
+				};
+			};
+		};
+
+		dsi-phy@fd922a00 {
+			status = "ok";
+
+			vddio-supply = <&pma8084_l12>;
+		};
+	};
 };

 &spmi_bus {
--
2.30.0

