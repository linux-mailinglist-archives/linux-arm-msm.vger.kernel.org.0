Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7239844F61A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Nov 2021 02:29:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbhKNBbb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 13 Nov 2021 20:31:31 -0500
Received: from relay07.th.seeweb.it ([5.144.164.168]:49711 "EHLO
        relay07.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236268AbhKNBbQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 13 Nov 2021 20:31:16 -0500
Received: from localhost.localdomain (83.6.165.118.neoplus.adsl.tpnet.pl [83.6.165.118])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 867973EE53;
        Sun, 14 Nov 2021 02:28:21 +0100 (CET)
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
Subject: [PATCH 16/16] arm64: dts: qcom: sm8350: Add LLCC node
Date:   Sun, 14 Nov 2021 02:27:55 +0100
Message-Id: <20211114012755.112226-16-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114012755.112226-1-konrad.dybcio@somainline.org>
References: <20211114012755.112226-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure the Last-Level Cache Controller for SM8350.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 0ea735d0df49..7323ed74f41a 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2232,6 +2232,12 @@ gem_noc: interconnect@9100000 {
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		system-cache-controller@9200000 {
+			compatible = "qcom,sm8350-llcc";
+			reg = <0 0x09200000 0 0x1d0000>, <0 0x09600000 0 0x50000>;
+			reg-names = "llcc_base", "llcc_broadcast_base";
+		};
+
 		usb_1: usb@a6f8800 {
 			compatible = "qcom,sm8350-dwc3", "qcom,dwc3";
 			reg = <0 0x0a6f8800 0 0x400>;
-- 
2.33.1

