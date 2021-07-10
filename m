Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8453C33C2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Jul 2021 10:56:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbhGJI72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 10 Jul 2021 04:59:28 -0400
Received: from vps5.brixit.nl ([192.81.221.234]:54474 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231873AbhGJI71 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 10 Jul 2021 04:59:27 -0400
Received: from lexxgentoo.collabio.net (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id C60776089A;
        Sat, 10 Jul 2021 08:56:38 +0000 (UTC)
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH] ARM: dts: qcom: msm8974-klte: Enable remote processors
Date:   Sat, 10 Jul 2021 11:55:08 +0300
Message-Id: <20210710085509.105320-1-alexeymin@postmarketos.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Override power supplies to proper ones, thus enabling to power on ADSP
and modem remoteprocs.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index e346d0c7c829..ca5853563f9e 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -315,6 +315,10 @@ vreg_panel: panel-regulator {
 	};
 
 	/delete-node/ vreg-boost;
+
+	adsp-pil {
+		cx-supply = <&pma8084_s2>;
+	};
 };
 
 &soc {
@@ -832,6 +836,13 @@ dsi-phy@fd922a00 {
 			vddio-supply = <&pma8084_l12>;
 		};
 	};
+
+	remoteproc@fc880000 {
+		cx-supply = <&pma8084_s2>;
+		mss-supply = <&pma8084_s6>;
+		mx-supply = <&pma8084_s1>;
+		pll-supply = <&pma8084_l12>;
+	};
 };
 
 &spmi_bus {
-- 
2.31.1

