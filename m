Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73B7C554E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Jun 2019 18:48:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732264AbfFYQsC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Jun 2019 12:48:02 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:38159 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732265AbfFYQsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Jun 2019 12:48:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id d18so18693242wrs.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Jun 2019 09:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cM212LJlReM22Z/bSs47ZKND7c0iwlH/sYLmqGtvNPI=;
        b=y1JwsIjllH/q1V2AXG3E9FRpqgb/gJ7a0DxiAEw8wPRhS164tXiVP3fH/2YgiI+nGM
         jM4gF1s8Pu0y4IRmcmaP0i0yeBxIKHdeCBO0h+EU/UTOTmvF9/Bj+H4PGk3DpJUhJASB
         heKSN/MCHDtOY0YN6wJPoWXZNq5uzmnCZkPlBQ3Vk2DhCPFQdiF6baPvZT0p6kMpVHQD
         Md0WAOiT05LJIIsF3Wl78bQRoOhrYb/saLW2FHrh3AEz0/yee7AZGsJ/Sqjq97B76bdG
         b31Pt40Hl4smjHO3OSRVhhJHqzJoihLtCo88grZ+xX5NQXCfCKCPt0ueYCde+88F2lZK
         cvJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cM212LJlReM22Z/bSs47ZKND7c0iwlH/sYLmqGtvNPI=;
        b=boeGGPiUrlcPskjddr80JHeuS9edgTOH73UsqRd0cD5emiVshqUa2tJzdrPoEwAMvj
         /Nl8eukjWhVmxyS9UNYMg/Bym+JaZLCWaKgbjaUTKTz4JvRzvtzzL8fkLlt9vCFcMx1L
         5Bwr/Z/xB3EBIpNcXBkHj3ULRP7yOHTMoGipUEdVTPpHXAvIfNDN57qX1Jf00c9fLXX0
         Ve4jHocPQnU2zhf9C9yoKV94OHMR7+qopESvsqLBmljJAen4xutxlIOX0grxomhMpWNV
         4maINguuyGLO06dpZsKByHAd4bW2uGK7V/xHYGKn2AHDsviZqmkV7QUv/Nv42yiCER1y
         YryQ==
X-Gm-Message-State: APjAAAWixL+h8dCHZoK78kJyIl0QhzqHEJKByZuguWpbkJTIAlX2oZWT
        1u9qDbSefJStPetUEMFg4S/tcA==
X-Google-Smtp-Source: APXvYqwJ4I60Ak49uP7T2OkszfI0IIxti+ZQtTTsDd9vEBP4j6weUpwwGn91vqoS9swHumKVX+UcnQ==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr28697211wre.205.1561481279722;
        Tue, 25 Jun 2019 09:47:59 -0700 (PDT)
Received: from localhost.localdomain (30.red-83-34-200.dynamicip.rima-tde.net. [83.34.200.30])
        by smtp.gmail.com with ESMTPSA id d18sm42594476wrb.90.2019.06.25.09.47.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 25 Jun 2019 09:47:59 -0700 (PDT)
From:   Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
To:     jorge.ramirez-ortiz@linaro.org, sboyd@kernel.org,
        bjorn.andersson@linaro.org, david.brown@linaro.org,
        jassisinghbrar@gmail.com, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org, will.deacon@arm.com,
        arnd@arndb.de, horms+renesas@verge.net.au, heiko@sntech.de,
        sibis@codeaurora.org, enric.balletbo@collabora.com,
        jagan@amarulasolutions.com, olof@lixom.net
Cc:     vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: [PATCH v3 13/14] arm64: dts: qcom: qcs404: Add DVFS support
Date:   Tue, 25 Jun 2019 18:47:32 +0200
Message-Id: <20190625164733.11091-14-jorge.ramirez-ortiz@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Support dynamic voltage and frequency scaling on qcs404.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 9569686dbc41..4b4ce0b5df76 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -34,6 +34,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU1: cpu@101 {
@@ -43,6 +46,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU2: cpu@102 {
@@ -52,6 +58,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		CPU3: cpu@103 {
@@ -61,6 +70,9 @@
 			enable-method = "psci";
 			cpu-idle-states = <&CPU_SLEEP_0>;
 			next-level-cache = <&L2_0>;
+			clocks = <&apcs_glb>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cpu-supply = <&pms405_s3>;
 		};
 
 		L2_0: l2-cache {
-- 
2.21.0

