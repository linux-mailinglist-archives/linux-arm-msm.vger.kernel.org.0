Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 735473AA10A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 18:15:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbhFPQRt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 12:17:49 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:37275 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231452AbhFPQRs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 12:17:48 -0400
Received: from localhost.localdomain (83.6.168.10.neoplus.adsl.tpnet.pl [83.6.168.10])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id B4BE11F5C5;
        Wed, 16 Jun 2021 18:15:40 +0200 (CEST)
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
Subject: [PATCH] arm64: dts: qcom: sm8250-edo: Fix up double "pinctrl-1"
Date:   Wed, 16 Jun 2021 18:15:36 +0200
Message-Id: <20210616161536.206044-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When bringing the SDC pins back to edo.dtsi I managed to define
and overwrite pinctrl-1 instead of defining pinctrl-0 and 1. Fix it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index 89eeccb8727a..8447c22fb99d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -668,7 +668,7 @@ &sdhc_2 {
 
 	cd-gpios = <&tlmm 77 GPIO_ACTIVE_HIGH>;
 	pinctrl-names = "default", "sleep";
-	pinctrl-1 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
 	pinctrl-1 = <&sdc2_sleep_state &sdc2_card_det_n>;
 	vmmc-supply = <&vreg_l9c_2p9>;
 	vqmmc-supply = <&vreg_l6c_2p9>;
-- 
2.32.0

