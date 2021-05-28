Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BB3394780
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 May 2021 21:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbhE1T11 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 May 2021 15:27:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbhE1T10 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 May 2021 15:27:26 -0400
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C5C4C061761;
        Fri, 28 May 2021 12:25:51 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.57.neoplus.adsl.tpnet.pl [83.6.168.57])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C81C720310;
        Fri, 28 May 2021 21:25:46 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: msm8996: Add support for the CBF clock
Date:   Fri, 28 May 2021 21:25:41 +0200
Message-Id: <20210528192541.1120703-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528192541.1120703-1-konrad.dybcio@somainline.org>
References: <20210528192541.1120703-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the CBF PLL register to the kryocc node and assign a frequency
to the clock.

This makes sure the core cluster interconnect is running at a decent
speed, so that it's no longer a pain to use the device with all cores
enabled.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 10e6fecc9e13..99dc4068980d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2533,7 +2533,10 @@ apss_merge_funnel_out: endpoint {
 
 		kryocc: clock-controller@6400000 {
 			compatible = "qcom,msm8996-apcc";
-			reg = <0x06400000 0x90000>;
+			reg = <0x06400000 0x90000>, <0x09a11000 0x10000>;
+
+			assigned-clocks = <&kryocc 2>;
+			assigned-clock-rates = <1382400000>;
 
 			clock-names = "xo";
 			clocks = <&xo_board>;
-- 
2.31.1

