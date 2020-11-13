Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98D692B2334
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Nov 2020 19:00:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbgKMSAM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Nov 2020 13:00:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgKMR77 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Nov 2020 12:59:59 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 173F9C0613D1;
        Fri, 13 Nov 2020 09:59:59 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id y16so11795292ljh.0;
        Fri, 13 Nov 2020 09:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=42UXRzy/C9RZjC8Og2rUii8dUnL5+xSL6pZzUkEEoOw=;
        b=YtbLs//L1aHBB2SM5iGUbssetwbD50aGxXS97WZDzQJFZsdwn/RgTgjx0uE1aaCf+M
         6qt074vIiCVjKkM0snn15LOpWFr/YheHs+sRuSzeITdTX4gtv9zsH3wGDmyBztIiXaQD
         beqz04HWka+jwZDhDwpEGQdbbc/K2SKeiI4NtThov11bhG1CLtHIAmWFX6waMCjeUpcX
         Fu00SznPY/mKdaRKuwk6TjuvttOzzfwAIDNouTOD6Gy1KxrBIsrE3T9dK9W1LJrpZXTJ
         BbatEc8mq4yCwXRAn8Jaho8h584YsuMv6ToKihxB+UUy3LqJimp4HqpQXj0FEmGcB77o
         mSdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=42UXRzy/C9RZjC8Og2rUii8dUnL5+xSL6pZzUkEEoOw=;
        b=NG28yTXE8GCM8hkFl+DPba4+JMD6+6Jw7wnua038PYALhRbBu4HwDT6/F73E5ZrlhE
         snLnQsMs8GFv5f14R7PqeJwh6ujgTPMswqw9SKU/zjK5R5HaVC5995oLdyPWKr7hiGfj
         CHsDKNSLlVHeE8tQkHjMmJRKNCcheRscAxPRW6sj0IJnL1uUv7oEU21zawR2hsxyYQud
         +6hhC7C6jwFg/zikRfdDhD5CbNFkNh3yiIQ6jyyN+34LBRbYMkkAwltaFzU64PlRlUVA
         HMsNG4kTPtL8vgjNSC6cmx846CXht7GxmNITdjn6I+xFtnH/fcKK741TgwU5KMqgsMmV
         VbAQ==
X-Gm-Message-State: AOAM5329Jxjklp0y5F+pAz9vNYROoyAdX+ApC8AeHzncJCYB6BQA4lEj
        s2mrpCDK4IsBCTyqd9vWzZg=
X-Google-Smtp-Source: ABdhPJyHIh+a4W4W0w0vDte+u1hQVyPsUmvbKVT1v2VwHr2Q2LtivIIkbLf2CyvtOiYfP7WztQ4rsw==
X-Received: by 2002:a2e:b0f6:: with SMTP id h22mr278466ljl.212.1605290395652;
        Fri, 13 Nov 2020 09:59:55 -0800 (PST)
Received: from localhost.localdomain ([2a01:540:2326:b00:1d75:252:b367:4629])
        by smtp.gmail.com with ESMTPSA id c1sm1629363lfj.222.2020.11.13.09.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 09:59:55 -0800 (PST)
From:   nikitos.tr@gmail.com
To:     agross@kernel.org, bjorn.andersson@linaro.org
Cc:     robh+dt@kernel.org, stephan@gerhold.net, Michael.Srba@seznam.cz,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH 5/6] arm64: dts: qcom: msm8916-longcheer-l8150: Add notification LED
Date:   Fri, 13 Nov 2020 22:59:16 +0500
Message-Id: <20201113175917.189123-5-nikitos.tr@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113175917.189123-1-nikitos.tr@gmail.com>
References: <20201113175917.189123-1-nikitos.tr@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Nikita Travkin <nikitos.tr@gmail.com>

L8150 uses aw2013 LED contriller for notification LED on the front
of the device. Add it to the device tree

Signed-off-by: Nikita Travkin <nikitos.tr@gmail.com>
---
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
index 2b8670dd4b71..1e893c0b6fbc 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dts
@@ -83,6 +83,40 @@ flash_led: led {
 	};
 };
 
+&blsp_i2c1 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vcc-supply = <&pm8916_l17>;
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_RED>;
+		};
+
+		led@1 {
+			reg = <1>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_GREEN>;
+		};
+
+		led@2 {
+			reg = <2>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_BLUE>;
+		};
+	};
+};
+
 &blsp_i2c2 {
 	status = "okay";
 
-- 
2.25.1

