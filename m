Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D93923C1E65
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 06:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231226AbhGIEef (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 00:34:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231235AbhGIEe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 00:34:28 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F0C8C061762
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 21:31:44 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id z9so5961548ljm.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 21:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lQik2DiDxCRZSgw55nEoC87xQcPQoKmEJ4pXz+846Ts=;
        b=aSFAi4bjjkr02VJzD7+MFneSapjA/FlWVvLGLKh4lC+r6q+9Z4KIYlxSOTLsnDnP0Z
         sdcHHMOMyzuGvkcrFwwzIUeBCKa/wThZdfSMkQGgobBf7SjsVk4umvzrWqUBLyZskCFL
         F4VS3lNPjueMj5STcF0koXJp1IdZEPj+d5/7bdeX9taBRv9V4Jlp/evf2ODxNI195wyv
         wotIQtdMWrvW6C8b3g8nwszZVWI6vieROLoVtb3oi5fLLEHONW78UNrnzOIHkbYwJl+F
         Uw8P9BW+3Eits5ieyCGS2oK52WY2P6A36xuASIqd9yugtrQFS5HoHbeiRGTlgx+HJZ96
         brwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lQik2DiDxCRZSgw55nEoC87xQcPQoKmEJ4pXz+846Ts=;
        b=CzGgLUW5X9pwXwk6HqzhAbimmRq7W5ojCDEASr5q5gLA3IHbpAjygt+GQP8KQokEDz
         72i0bCEKv0E+I+XpgfAehYCycaMSks6Ucy3WREvwY8OhuUR7bufDAWdI841mBKOG3xxH
         e0ZyinK2pGY0aHAwel9GYyT45bT8vavUo2SfovvaFmyZ07XE/ODqFc0JxXwJ3UNH433T
         0WLa+um+bdWK5B2VxoQA/MhVssf2ROh7AFFvnKpEyDL/OcYOiUYThyY5a+R5pfQfaqMt
         I8WSoXahqPexJsGjD4CNGAwv9x8SX3QJcg0bGxeYPEKBjvOUId5Y/9dZ734nO4icTszR
         nkAA==
X-Gm-Message-State: AOAM530H4z/wSa/GXnzTq2WuekfqZIDczLRN5E9dRMfVWrvblUMNUE02
        //BoummNHZ7g87EXJgOvVO2qgA==
X-Google-Smtp-Source: ABdhPJz30Kzhv47T/zCDlZefUyH/QM5dGJC1yY+kLUyDpjabhKBW9TPmqRT9VHZkUKx2+gTeqlM1Ww==
X-Received: by 2002:a2e:2c11:: with SMTP id s17mr27762313ljs.403.1625805102953;
        Thu, 08 Jul 2021 21:31:42 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id h1sm13028lft.174.2021.07.08.21.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jul 2021 21:31:42 -0700 (PDT)
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
Subject: [RESEND PATCH v2 5/7] arm64: dts: qcom: sm8250: remove mmcx regulator
Date:   Fri,  9 Jul 2021 07:31:34 +0300
Message-Id: <20210709043136.533205-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
References: <20210709043136.533205-1-dmitry.baryshkov@linaro.org>
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

