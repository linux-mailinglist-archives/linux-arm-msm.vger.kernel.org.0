Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93F87390A30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 22:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbhEYUEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 May 2021 16:04:50 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:50577 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233083AbhEYUEt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 May 2021 16:04:49 -0400
Received: from localhost.localdomain (83.6.168.54.neoplus.adsl.tpnet.pl [83.6.168.54])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id EAC00203A4;
        Tue, 25 May 2021 22:03:16 +0200 (CEST)
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
Subject: [PATCH 3/7] arm64: dts: qcom: msm8996: Strictly limit USB2 host to USB2 speeds
Date:   Tue, 25 May 2021 22:02:41 +0200
Message-Id: <20210525200246.118323-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525200246.118323-1-konrad.dybcio@somainline.org>
References: <20210525200246.118323-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the name implies, the USB2 controller should only operate at
USB2 speeds. Make sure it does just that by pinning it to USB
High-Speed (USB2) mode.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 12afd49e0097..08a6e2b5a54b 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -2588,6 +2588,7 @@ usb2: usb@76f8800 {
 			assigned-clock-rates = <19200000>, <60000000>;
 
 			power-domains = <&gcc USB30_GDSC>;
+			qcom,select-utmi-as-pipe-clk;
 			status = "disabled";
 
 			dwc3@7600000 {
@@ -2596,6 +2597,7 @@ dwc3@7600000 {
 				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&hsusb_phy2>;
 				phy-names = "usb2-phy";
+				maximum-speed = "high-speed";
 				snps,dis_u2_susphy_quirk;
 				snps,dis_enblslpm_quirk;
 			};
-- 
2.31.1

