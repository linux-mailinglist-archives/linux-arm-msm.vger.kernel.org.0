Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E50413029A1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Jan 2021 19:10:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730713AbhAYSFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 Jan 2021 13:05:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730782AbhAYSFs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 Jan 2021 13:05:48 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2356C061793;
        Mon, 25 Jan 2021 10:05:07 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id rv9so19350477ejb.13;
        Mon, 25 Jan 2021 10:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ziK2Od2k39Z62ncVmgdUDN/de74gT1B9UQQ5KttbPwk=;
        b=mIRe7x+1tAxXDmixKHiplQXDClgoNaTIKk6UK3Ek6Tcdh2MceDgngS8y7XmP/qpeZl
         UWsJsUBbcCp8k5w6YqjIKJmrZYu0TUAtAFVIljGK57l/aepK0HdfrQhFESnsnYYvehKK
         AaaJPb2LaU2KBQ/tKAwd6VN95S2dJXhtqAy8hneR6UKwdaWDd6UXHwWgOWD/av/QY6uq
         6HLmbZuAJmdaJQDxEYekw1njaL/+hUcIJem46QlLRw6Xwt+M+9OhvAyG5c921Nxd5nOC
         5Ts7EtFpC6Ojl2Oc2dQnmae1GjQBLlwajOQZkBFLz3/pwC+TJb+9P/wJ1vlZ/T2pGAoG
         nOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ziK2Od2k39Z62ncVmgdUDN/de74gT1B9UQQ5KttbPwk=;
        b=MNpcd+OhjZpwSBQGBYHLL/YdwjW+4WNEZ6yyDN5Y4ndQcCXQBjOjtJPKdN+mhIowL1
         8yHL5Y5nQwlAjdY3PZd0Bd+bnaP7HfmYtAz1ICCaUdrHgPpi4J5n4bPxtn+iyYd3S+Ut
         pjJkGek3bOwCSfQAmOKzsx93CscQRmZgrrkiZQIQoxypViz7PWrO/TVxWKdF1jqguaRh
         UtT7Smg4atPcfzbsPUXPqwwttltzsckvnE7S7eOXjYWmeq96l7tBhiNl+Jhc6wRuRvVN
         mjZipd+QZfi9sEt/f1VRnyt/YIYAO8fWls2Qjh7nKa4GeYLQ3ZJC3ZMCMwPUbkZ2pPIm
         k2FQ==
X-Gm-Message-State: AOAM531+xkTMfP/j/ZJluGcHEPaaejHVfuYP5osi1EnEl+ozqOsN56nJ
        6aAsSSIpFSiNrTl/XHQIU4w=
X-Google-Smtp-Source: ABdhPJxhkZ8b62II4XGF7lnr96Bhyceuok0wLWXx8RpSBP9C3idXtRpj4+JZJBGNIRdssgp24SuXTw==
X-Received: by 2002:a17:907:3e02:: with SMTP id hp2mr1080256ejc.411.1611597906603;
        Mon, 25 Jan 2021 10:05:06 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id g14sm8684002ejr.105.2021.01.25.10.05.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 10:05:05 -0800 (PST)
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
Subject: [PATCH v3 3/4] ARM: dts: qcom: msm8974-klte: add support for display
Date:   Mon, 25 Jan 2021 20:04:26 +0200
Message-Id: <20210125180427.3109269-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210125180427.3109269-1-iskren.chernev@gmail.com>
References: <20210125180427.3109269-1-iskren.chernev@gmail.com>
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
index 5a7ac4a31031f..19c96b47a5dbd 100644
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
@@ -705,6 +715,54 @@ opp_table {
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

