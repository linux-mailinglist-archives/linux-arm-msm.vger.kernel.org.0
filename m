Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0097A2E7ABB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 16:52:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgL3Pw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Dec 2020 10:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgL3Pw1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Dec 2020 10:52:27 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A265C06179E;
        Wed, 30 Dec 2020 07:51:47 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id dk8so15816616edb.1;
        Wed, 30 Dec 2020 07:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PJJInI7wBuVv4xqlSgE+mNdVh9iMJlH0WswEWg8D/PU=;
        b=KwN6G15ZWlKH5J3UT9XbuxBz7S3oQy2J1xu/zTcbRz4FQEduQ0Ks4SGu0bXog9p1c6
         M7FlgwHMopVM9YfqzHfqfHZ2E2ios/h+B0Ll5v3AIokdqPBJaWgLEecxCI/9FQ26lWb7
         d3q/ePQSzxYkPwoew8QAer0kcWL9fYgHmdwbuZF3BxymkccewHEQBAnv//YSOzchMNLv
         ozaYqY5vYYKFAfukukkO7oOEgsa3T2GSGq39qWSwYE5eFOGCvbFSom4qsg9CbNpBZcxH
         cx/5vyVuKDpwCUxPy69kDF549iakuoD6+5AJQVkXK2wuDfoTkcH6HhKtzbxdFzFvoCMg
         shCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PJJInI7wBuVv4xqlSgE+mNdVh9iMJlH0WswEWg8D/PU=;
        b=ABfomj8PgrtDgraDX72lyo9VpD5JSoT5YPrKTNzZrRnIUM4sR5uqCzK7iNMx/Q0gEc
         cNZ4mEB+b9AYFcZVau4CHysVIR9cHk/6ocLKDNQaLHd7zVqw/Q2jyFNklN7E3ybtccIg
         emxHp4bjgMDy8UAOjtSdN2283JcUt+yt628tyItj1aVVRqN3BAozZfFYiQQFbubx5aJ9
         qssBUl1dEMxj94ohmJpKFsbn7X6LGPIlytDWde3Q2VUQFyDWxWSzwkZYIWcV+XznHNZJ
         bs/c/dgxii8W+9wIlYf8YT1ewCxKhb9oNj3G7QGB07APs05nmyN5SDuJ6Cn2IBu6ycQn
         6hMQ==
X-Gm-Message-State: AOAM530ZvzxpCsr55qgkVyjWQi4ksCubnv62cwvy381zSBC5EIWsADhr
        W0+vzIAJl738dT+EvIlcSuA=
X-Google-Smtp-Source: ABdhPJxgfIx3Tw2D/2EKsChW1Mu3DLWEEk4XFIPwZA2wtr46FA2IM3rdBEoyta1bAN8fMsVo2Za5Cg==
X-Received: by 2002:a05:6402:c95:: with SMTP id cm21mr51336368edb.294.1609343505770;
        Wed, 30 Dec 2020 07:51:45 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id j23sm25028276edv.45.2020.12.30.07.51.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Dec 2020 07:51:45 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>
Subject: [PATCH 3/4] ARM: dts: qcom: msm8974-klte: add support for display
Date:   Wed, 30 Dec 2020 17:51:31 +0200
Message-Id: <20201230155132.3661292-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201230155132.3661292-1-iskren.chernev@gmail.com>
References: <20201230155132.3661292-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Samuel Pascua <pascua.samuel.14@gmail.com>

Add initial support for the display found on the Samsung Galaxy 5 (klte)
phone. This is based on work from Jonathan Marek & Brian Masney.

Please note that this patch depends on dt-binding patch in [1]

[1] https://lkml.org/lkml/2020/12/30/293

Signed-off-by: Samuel Pascua <pascua.samuel.14@gmail.com>
---
 .../boot/dts/qcom-msm8974-samsung-klte.dts    | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 1d5e8abdbda79..8b7e95b748e39 100644
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
2.29.2

