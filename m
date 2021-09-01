Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD6EA3FE263
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 20:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234064AbhIASc0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 14:32:26 -0400
Received: from m-r1.th.seeweb.it ([5.144.164.170]:41977 "EHLO
        m-r1.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233779AbhIAScY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 14:32:24 -0400
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id DF24A2015D;
        Wed,  1 Sep 2021 20:31:25 +0200 (CEST)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@somainline.org,
        marijn.suijten@somainline.org, martin.botka@somainline.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        paul.bouchara@somainline.org, jeffrey.l.hugo@gmail.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH 4/5] arm64: dts: msm8998: Move qfprom iospace to calibrated values
Date:   Wed,  1 Sep 2021 20:31:22 +0200
Message-Id: <20210901183123.1087392-4-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210901183123.1087392-1-angelogioacchino.delregno@somainline.org>
References: <20210901183123.1087392-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The QFPROM iospace was (erroneously, I believe) set to the uncalibrated
fuse start address, but every driver only needs - and will always only
need - only calibrated values.

Move the iospace forward to the calibrated values start to avoid
offsetting every fuse definition.
Obviously, the only defined fuse (qusb2_hstx_trim) was also fixed to
remove the offset, in order to comply with this change.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 625d0fd7e33d..221dc61ca5e3 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -867,14 +867,14 @@ rpm_msg_ram: memory@778000 {
 			reg = <0x00778000 0x7000>;
 		};
 
-		qfprom: qfprom@780000 {
+		qfprom: qfprom@784000 {
 			compatible = "qcom,qfprom";
-			reg = <0x00780000 0x621c>;
+			reg = <0x00784000 0x621c>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 
-			qusb2_hstx_trim: hstx-trim@423a {
-				reg = <0x423a 0x1>;
+			qusb2_hstx_trim: hstx-trim@23a {
+				reg = <0x23a 0x1>;
 				bits = <0 4>;
 			};
 		};
-- 
2.32.0

