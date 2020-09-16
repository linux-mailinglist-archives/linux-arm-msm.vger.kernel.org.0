Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1ED626C919
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbgIPTD0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbgIPRsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 13:48:35 -0400
Received: from mo6-p03-ob.smtp.rzone.de (mo6-p03-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5303::7])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD057C061A2D;
        Wed, 16 Sep 2020 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600254283;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=hi/PA+n3q3LCTeQ36n/1hS+OHW65T/N24KCCdA3v318=;
        b=g/FahEZNHPOPrPE0VS25nirG/vN4CBmaAxSA9NVnqBO36GNsn+O5GKQjNCyw5OZJeT
        fKdroBoxCgx242JjNayMTFWoNO6wE1QbquciDxESiiyJ7Qr//JdJYao9cC2pgz8GS8Xc
        aMP/5YRLbHlTouxvrYM5J0Lt3juqlC40DxM7rAZg0N0K7mqmWvf97Idk3ffcyS521EBU
        FZTxMa5Fh6PC4vKT56mDEIue4v19KpaKXrevDfK12KzbdTkyGKESoiMnz7c8mqc2NZ1d
        Ys46ZNrm8SB4+7FO3RtnhgpAzYhfaN1AI7XXq0ifobBooD/nxoGuXWVKD02aGsrUHo0d
        KRPA==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6Nahc="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8GAfszlX
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Wed, 16 Sep 2020 12:41:54 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH 09/10] arm64: dts: qcom: msm8916: Use power domains for MSS/WCNSS remoteprocs
Date:   Wed, 16 Sep 2020 12:41:34 +0200
Message-Id: <20200916104135.25085-10-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916104135.25085-1-stephan@gerhold.net>
References: <20200916104135.25085-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

So far we have been making proxy votes for the remote processors
through the regulator interface. Now that we have rpmpd it's better
to vote for performance states through the power domain interface.

This also allows us to move these supplies back to msm8916.dtsi
because the device tree binding for RPMPD is independent of the
underlying regulator/PMIC.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi | 3 ---
 arch/arm64/boot/dts/qcom/msm8916.dtsi        | 9 +++++++++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
index cd626e7db599..513e433aa5f3 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pm8916.dtsi
@@ -17,13 +17,10 @@ &dsi_phy0 {
 };
 
 &mpss {
-	cx-supply = <&pm8916_s1>;
-	mx-supply = <&pm8916_l3>;
 	pll-supply = <&pm8916_l7>;
 };
 
 &pronto {
-	vddmx-supply = <&pm8916_l3>;
 	vddpx-supply = <&pm8916_l7>;
 
 	iris {
diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 117804f94c35..74aa50f3db10 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/interconnect/qcom,msm8916.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/reset/qcom,gcc-msm8916.h>
 #include <dt-bindings/thermal/thermal.h>
 
@@ -1292,6 +1293,10 @@ mpss: remoteproc@4080000 {
 			interrupt-names = "wdog", "fatal", "ready",
 					  "handover", "stop-ack";
 
+			power-domains = <&rpmpd MSM8916_VDDCX>,
+					<&rpmpd MSM8916_VDDMX>;
+			power-domain-names = "cx", "mx";
+
 			clocks = <&gcc GCC_MSS_CFG_AHB_CLK>,
 				 <&gcc GCC_MSS_Q6_BIMC_AXI_CLK>,
 				 <&gcc GCC_BOOT_ROM_AHB_CLK>,
@@ -1689,6 +1694,10 @@ pronto: remoteproc@a21b000 {
 					      <&wcnss_smp2p_in 3 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "wdog", "fatal", "ready", "handover", "stop-ack";
 
+			power-domains = <&rpmpd MSM8916_VDDCX>,
+					<&rpmpd MSM8916_VDDMX>;
+			power-domain-names = "cx", "mx";
+
 			qcom,state = <&wcnss_smp2p_out 0>;
 			qcom,state-names = "stop";
 
-- 
2.28.0

