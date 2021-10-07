Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4C7425F1B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Oct 2021 23:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242383AbhJGVgR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Oct 2021 17:36:17 -0400
Received: from relay05.th.seeweb.it ([5.144.164.166]:54023 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242257AbhJGVgI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Oct 2021 17:36:08 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D5ED53EF02;
        Thu,  7 Oct 2021 23:34:11 +0200 (CEST)
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
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 12/13] arm64: dts: qcom: Move WLED num-strings from pmi8994 to sony-xperia-tone
Date:   Thu,  7 Oct 2021 23:33:59 +0200
Message-Id: <20211007213400.258371-13-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211007213400.258371-1-marijn.suijten@somainline.org>
References: <20211007213400.258371-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The number of WLED strings used by a certain platform depend on the
panel connected to that board and may not be the same for every user of
pmi8994.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi | 1 +
 arch/arm64/boot/dts/qcom/pmi8994.dtsi                  | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
index 507396c4d23b..ff7f39d29dd5 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone.dtsi
@@ -620,6 +620,7 @@ pmi8994_s11: s11 {
 &pmi8994_wled {
 	status = "okay";
 	default-brightness = <512>;
+	qcom,num-strings = <3>;
 };
 
 &rpm_requests {
diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 89ba4146e747..6e7c252568e6 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -38,7 +38,6 @@ pmi8994_wled: wled@d800 {
 			reg = <0xd800 0xd900>;
 			interrupts = <3 0xd8 0x02 IRQ_TYPE_EDGE_RISING>;
 			interrupt-names = "short";
-			qcom,num-strings = <3>;
 			qcom,cabc;
 			qcom,external-pfet;
 			status = "disabled";
-- 
2.33.0

