Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74CE3258D0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Feb 2021 22:39:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234109AbhBYVjj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Feb 2021 16:39:39 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:35831 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhBYVjh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Feb 2021 16:39:37 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 22B8C3F400;
        Thu, 25 Feb 2021 22:38:53 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: pm8004: Enable the PMIC peripherals by default
Date:   Thu, 25 Feb 2021 22:38:42 +0100
Message-Id: <20210225213842.117694-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It makes no sense to require one more step to enable the PMIC features.
If the PMIC is present, it already has to be explicitly #included anyway.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/pm8004.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8004.dtsi b/arch/arm64/boot/dts/qcom/pm8004.dtsi
index 0abd1abe12fc..532b79acf0e8 100644
--- a/arch/arm64/boot/dts/qcom/pm8004.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8004.dtsi
@@ -9,7 +9,6 @@ pm8004_lsid4: pmic@4 {
 		reg = <0x4 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "disabled";
 	};
 
 	pm8004_lsid5: pmic@5 {
@@ -17,7 +16,6 @@ pm8004_lsid5: pmic@5 {
 		reg = <0x5 SPMI_USID>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		status = "disabled";
 
 		pm8004_spmi_regulators: regulators {
 			compatible = "qcom,pm8004-regulators";
-- 
2.30.1

