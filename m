Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E99C4301C73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Jan 2021 15:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbhAXN6w (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 Jan 2021 08:58:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbhAXN5i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 Jan 2021 08:57:38 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BBFC06178A;
        Sun, 24 Jan 2021 05:56:49 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id l9so14216671ejx.3;
        Sun, 24 Jan 2021 05:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ziK2Od2k39Z62ncVmgdUDN/de74gT1B9UQQ5KttbPwk=;
        b=nGexK3ZAEiFbkpyNHkEpsGfKLLmspMfAELdTaIUSa0ciaX7hId3I1h5s2S1v2EaDJ7
         VNuVuQmYA/iT7Np9tjfl2r69q9hLViosamlVGzVWI+jUQ5zunz8WhojVUakF/aX7gX3Y
         oThdFKLi+VjTrM+HFQyHQPvCQiJF66R++oz6DcKa2Za19pSuASaddoyQ3G0eB9ELN3GI
         nJ1HFVSpdS0F4Zb7Gc5HVjEPesEx8DCUe58k615eSZkKMwdAED4Bh5+LFNKOpi8PWvPR
         qsv/SRJtSvzCxaKRBvXi9TX/n6AW9TLwPLZMT0mQ7JdsSI5evErv/Q0XMLvRT/SexfNu
         6myw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ziK2Od2k39Z62ncVmgdUDN/de74gT1B9UQQ5KttbPwk=;
        b=oR9qGKlPcE45ecMm7Hi+9Q/U7NnuIQFNzmMEeZHAntSRgZ4KwADW+c+Y/s35iQaR0p
         /lG7yWe/nUHJw8tYskYrFUEhqifFgiRV5rAU32famC+k6UUq3oUSMHbfW84GJh/0EmND
         34IT18Rr9ApqSeGWn+NId0/aQ8IuBZa3ELTZFLx8zpMlMzdOv6s0kxygHHxcSxZ+wBOo
         Dj1gi1SKNs7chn8zW0aSbE9vAczKjwRbY6PA/ozZJ5752H1/tNTNGziUav/FLcA9Ay4y
         PJAlRJfc6b7uIFbxZHiNS43brz15PNg1E6SCPQOx56RoVkFEJo9o2U9eSS1874kcK0lD
         3HHA==
X-Gm-Message-State: AOAM533JMG8IxNHxjlgwE9E64LB25l+oxf/athqGxL8fjBlgOGzweDG+
        2hydV93qeA0ApjifrsVLRyE=
X-Google-Smtp-Source: ABdhPJzCXjZv6hFHMQTSxsoKykipYCpu6HMEGcJD4XhxFVqcVX4M+XcEs1rVwGVJqKfxeMgmK3FqsQ==
X-Received: by 2002:a17:906:19c3:: with SMTP id h3mr887147ejd.429.1611496608116;
        Sun, 24 Jan 2021 05:56:48 -0800 (PST)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id k26sm952169eds.41.2021.01.24.05.56.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Jan 2021 05:56:47 -0800 (PST)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Iskren Chernev <iskren.chernev@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Samuel Pascua <pascua.samuel.14@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 3/4] ARM: dts: qcom: msm8974-klte: add support for display
Date:   Sun, 24 Jan 2021 15:56:09 +0200
Message-Id: <20210124135610.1779295-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210124135610.1779295-1-iskren.chernev@gmail.com>
References: <20210124135610.1779295-1-iskren.chernev@gmail.com>
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

