Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED82B3FAE6E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 22:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234243AbhH2Ub1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 16:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232328AbhH2Ub1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 16:31:27 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 075EFC061575
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Aug 2021 13:30:34 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id B0B2B1F9E9;
        Sun, 29 Aug 2021 22:30:32 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference
Date:   Sun, 29 Aug 2021 22:30:25 +0200
Message-Id: <20210829203027.276143-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829203027.276143-1-marijn.suijten@somainline.org>
References: <20210829203027.276143-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The 28NM DSI PLL driver for msm8960 calculates with a 27MHz reference
clock and should hence use PXO, not CXO which runs at 19.2MHz.

Note that none of the DSI PHY/PLL drivers currently use this "ref"
clock; they all rely on (sometimes inexistant) global clock names and
usually function normally without a parent clock.  This discrepancy will
be corrected in a future patch, for which this change needs to be in
place first.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 2687c4e890ba..77659b783759 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -198,7 +198,7 @@ cxo_board: cxo_board {
 			clock-frequency = <19200000>;
 		};
 
-		pxo_board {
+		pxo_board: pxo_board {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 			clock-frequency = <27000000>;
@@ -1306,7 +1306,7 @@ dsi0_phy: dsi-phy@4700200 {
 			reg-names = "dsi_pll", "dsi_phy", "dsi_phy_regulator";
 			clock-names = "iface_clk", "ref";
 			clocks = <&mmcc DSI_M_AHB_CLK>,
-				 <&cxo_board>;
+				 <&pxo_board>;
 		};
 
 
-- 
2.33.0

