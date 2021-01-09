Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2F262F015D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 17:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbhAIQJ3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Jan 2021 11:09:29 -0500
Received: from relay06.th.seeweb.it ([5.144.164.167]:51823 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726011AbhAIQJ3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Jan 2021 11:09:29 -0500
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 914EA3EF2C;
        Sat,  9 Jan 2021 17:08:46 +0100 (CET)
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
        martin.botka@somainline.org, phone-devel@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Subject: [PATCH] arm64: dts: msm8998: Use rpmpd definitions for opp table levels
Date:   Sat,  9 Jan 2021 17:07:59 +0100
Message-Id: <20210109160759.186990-1-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dt-bindings/power/qcom-rpmpd.h header is being included in this
DT but the RPMPD OPP table declarations were using open-coded values:
use the definitions found in the aforementioned header.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index c45870600909..807fad2b14f0 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -379,43 +379,43 @@ rpmpd_opp_table: opp-table {
 					compatible = "operating-points-v2";
 
 					rpmpd_opp_ret: opp1 {
-						opp-level = <16>;
+						opp-level = <RPM_SMD_LEVEL_RETENTION>;
 					};
 
 					rpmpd_opp_ret_plus: opp2 {
-						opp-level = <32>;
+						opp-level = <RPM_SMD_LEVEL_RETENTION_PLUS>;
 					};
 
 					rpmpd_opp_min_svs: opp3 {
-						opp-level = <48>;
+						opp-level = <RPM_SMD_LEVEL_MIN_SVS>;
 					};
 
 					rpmpd_opp_low_svs: opp4 {
-						opp-level = <64>;
+						opp-level = <RPM_SMD_LEVEL_LOW_SVS>;
 					};
 
 					rpmpd_opp_svs: opp5 {
-						opp-level = <128>;
+						opp-level = <RPM_SMD_LEVEL_SVS>;
 					};
 
 					rpmpd_opp_svs_plus: opp6 {
-						opp-level = <192>;
+						opp-level = <RPM_SMD_LEVEL_SVS_PLUS>;
 					};
 
 					rpmpd_opp_nom: opp7 {
-						opp-level = <256>;
+						opp-level = <RPM_SMD_LEVEL_NOM>;
 					};
 
 					rpmpd_opp_nom_plus: opp8 {
-						opp-level = <320>;
+						opp-level = <RPM_SMD_LEVEL_NOM_PLUS>;
 					};
 
 					rpmpd_opp_turbo: opp9 {
-						opp-level = <384>;
+						opp-level = <RPM_SMD_LEVEL_TURBO>;
 					};
 
 					rpmpd_opp_turbo_plus: opp10 {
-						opp-level = <512>;
+						opp-level = <RPM_SMD_LEVEL_BINNING>;
 					};
 				};
 			};
-- 
2.29.2

