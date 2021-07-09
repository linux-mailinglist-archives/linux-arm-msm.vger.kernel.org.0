Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 552D43C2862
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhGIRez (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230185AbhGIRez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:34:55 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5350C06178C
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 10:32:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y42so24737353lfa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 10:32:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lQik2DiDxCRZSgw55nEoC87xQcPQoKmEJ4pXz+846Ts=;
        b=N/R8Nw5EJeAHahExbU8g3SxQB6VyXusLDg9qaxzGll7OH7iFnhpj8tUEX1P2eT/pZy
         IT/w1iJuj2Tpke4ZHHHtd6dXUJZ4zXRAwVZWJvVWvCbA3QFeK/PZpFgtW2dU8EgiWO8I
         ZATV/qbZeH+ZUjnpfZ+UV4/Q5LDgdlMTIWvMCj2EvRQclxuJra28IDiBARb6xPhtplQj
         oufa4l6UdHcIMxS86Z/XHYjdh7XjSoqCrOvqy+6Jpcm9iPwKIb+2WCqfTR7+EObJym9l
         ivZ8eNfsuzYDSAVzp06gyimTo15IdO6q28S/Rz1C/UNRj4HaM7RHCZnK6799MJI7bjZS
         C09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lQik2DiDxCRZSgw55nEoC87xQcPQoKmEJ4pXz+846Ts=;
        b=mjvS9XzLtInC+a+0gZolqJXd9CwOQ7yofXRiK2tu8tk+LDCRCgpNXDy+tGbmIOOvf0
         Tg5bh68KGhvWYxZxd5YtGxr/jet8sFKVYOXWF2Q7BRHnwmEoXCCZcWgC62Ju9yfN3G93
         eK8O7UlnIYpjgz3UPIQfiKk4QF/FUWabdw7ODR1e5bZe3AglfE3FWjgCRs3kcylorj1V
         zALpZmCLLsbn7oC9hjvJweQc1XcFRoMv6KIAV6NHLVYKE4bTGboKZDNtYfkI2RZeIjL9
         IZylnuwEaaVGXQg9MI3FlZBgTGIKQ+2PJzPQfifzwYFia1+hRAVBUO4Y5bSAVvCAK/MJ
         jUjg==
X-Gm-Message-State: AOAM532fWQI90c5s4sfndX2bmnieGSEqh76hX2c/dg7uZcim6gl+ohwv
        MC9jFpUXvgYm5wmXrz5AJOwG5w==
X-Google-Smtp-Source: ABdhPJyPJe/C4rOLGJIz65j8fXup5YIWmX6b+tAarjh8Ktq3o5rma7Hb0KvayG/IAI+1tthl61NX0Q==
X-Received: by 2002:a05:6512:3295:: with SMTP id p21mr29957449lfe.338.1625851928167;
        Fri, 09 Jul 2021 10:32:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b14sm511129lfb.132.2021.07.09.10.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:32:07 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] arm64: dts: qcom: sm8250: remove mmcx regulator
Date:   Fri,  9 Jul 2021 20:32:00 +0300
Message-Id: <20210709173202.667820-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
References: <20210709173202.667820-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch dispcc and videocc into using MMCX domain directly. Drop the now
unused mmcx regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 4c0de12aaba6..2a468b85dc09 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -271,13 +271,6 @@ memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x0>;
 	};
 
-	mmcx_reg: mmcx-reg {
-		compatible = "regulator-fixed-domain";
-		power-domains = <&rpmhpd SM8250_MMCX>;
-		required-opps = <&rpmhpd_opp_low_svs>;
-		regulator-name = "MMCX";
-	};
-
 	pmu {
 		compatible = "arm,armv8-pmuv3";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
@@ -2362,7 +2355,7 @@ videocc: clock-controller@abf0000 {
 			clocks = <&gcc GCC_VIDEO_AHB_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK>,
 				 <&rpmhcc RPMH_CXO_CLK_A>;
-			mmcx-supply = <&mmcx_reg>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
 			clock-names = "iface", "bi_tcxo", "bi_tcxo_ao";
 			#clock-cells = <1>;
 			#reset-cells = <1>;
@@ -2627,7 +2620,7 @@ opp-358000000 {
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,sm8250-dispcc";
 			reg = <0 0x0af00000 0 0x10000>;
-			mmcx-supply = <&mmcx_reg>;
+			power-domains = <&rpmhpd SM8250_MMCX>;
 			clocks = <&rpmhcc RPMH_CXO_CLK>,
 				 <&dsi0_phy 0>,
 				 <&dsi0_phy 1>,
-- 
2.30.2

