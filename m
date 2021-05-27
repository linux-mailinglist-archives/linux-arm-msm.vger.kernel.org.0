Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B35A4393643
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 May 2021 21:30:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235153AbhE0Tbt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 May 2021 15:31:49 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:43911 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229764AbhE0Tbj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 May 2021 15:31:39 -0400
Received: from localhost.localdomain (83.6.168.57.neoplus.adsl.tpnet.pl [83.6.168.57])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 630EC3F585;
        Thu, 27 May 2021 21:30:03 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: msm8996: Make CPUCC actually probe (and work)
Date:   Thu, 27 May 2021 21:29:58 +0200
Message-Id: <20210527192958.775434-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the compatible to make the driver probe and tell the
driver where to look for the "xo" clock to make sure everything
works.

Then we get a happy (eh, happier) 8996:

somainline-sdcard:/home/konrad# cat /sys/kernel/debug/clk/pwrcl_pll/clk_rate
1152000000

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 2f04a2bc052c..3fc912f587ba 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2296,9 +2296,14 @@ apss_merge_funnel_out: endpoint {
 				};
 			};
 		};
+
 		kryocc: clock-controller@6400000 {
-			compatible = "qcom,apcc-msm8996";
+			compatible = "qcom,msm8996-apcc";
 			reg = <0x06400000 0x90000>;
+
+			clock-names = "xo";
+			clocks = <&xo_board>;
+
 			#clock-cells = <1>;
 		};
 
-- 
2.31.1

