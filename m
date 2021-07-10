Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9868F3C2C92
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 03:33:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231725AbhGJBfs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 21:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231674AbhGJBfo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 21:35:44 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED2F6C0613DD
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 18:32:59 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id b40so10898639ljf.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 18:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=C0H3/IhfxiYnQQh4KKn72LcaVRG7SSAFeeIagA4xcAo=;
        b=fd6JtjJmwsMIJAhK+Zn2EnRadcUGaMOz8HtfCU+5EqKqxVuOHKdzDXPeN+lUf2p6da
         NwI1W3jAX8fHwgj9tv5Yx4KfO07G8Mzv6ltCLDpt98nOQpBP3k6rCRF7cZX3MlMfsSt+
         jMJ4KfJwNYwM0gxLWuIykybI09eW2JG2Fya+PUYuSQcBITF2dYa3/GWl1O4ABaAqbleA
         VzPp+NptJiqU410m/Y3u4bsfyArCnx6wnkisvfzqHgRYfoMTZdBW9cw6dJ1MCpQjr5bK
         WH4PbHWfi9Up80D6Ihq+WaQl68BT6owWbC/NxZcHMf/kwkme8CV3M1BBnOQc2mtrZ7RQ
         8E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C0H3/IhfxiYnQQh4KKn72LcaVRG7SSAFeeIagA4xcAo=;
        b=VyPKcbK72MjXw1WD16AXgkTyQKvE5SOv8DyVyhdIGShwo8cZ7TmYfgoEPQ2JBNef7K
         2gTACtkSJPFGjJCKJ8tdQXvzoMQsBNQmHiKajrBpFmx9eXgwzsvZeSGok34xiOUjes2j
         qSLxiqxb1Hy8fsF/Bod8JCWWxiZ3ScX2WMV5acyOuztXxCk+E6NaJHb7nT//dSbUCcS+
         kntuFu5tzMe/DjvJR3B1D5qQRSVTA46hxkcG2YxJKF/BqDXM4CClCxKMZem8D3lv2deM
         U36ntUIU0VCetM/Abq1zmxCO/9omA9KelYyHEJjV1Dgs+IJQqq5lHIOcj72nCfmV5xht
         DGUg==
X-Gm-Message-State: AOAM532le8S7l3r9l7CVg8sRl/lJ6Kfzk8KYjmJ+IElFJvrjNbx+kDkI
        A/DUM2A9LSdxsQY3lPWDYqWsRw==
X-Google-Smtp-Source: ABdhPJzYUb1wnHEHae2ODLu9t/zCnybfKtd/ij0LHh/JqdfCQjk1W+3fJYKRc4KfLQyJEiUCxBVTHg==
X-Received: by 2002:a2e:8709:: with SMTP id m9mr4223128lji.201.1625880778334;
        Fri, 09 Jul 2021 18:32:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p13sm588788lfh.206.2021.07.09.18.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 18:32:58 -0700 (PDT)
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
Subject: [PATCH v4 4/6] arm64: dts: qcom: sm8250: remove mmcx regulator
Date:   Sat, 10 Jul 2021 04:32:51 +0300
Message-Id: <20210710013253.1134341-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
References: <20210710013253.1134341-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Switch dispcc and videocc into using MMCX domain directly. Drop the now
unused mmcx regulator.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
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

