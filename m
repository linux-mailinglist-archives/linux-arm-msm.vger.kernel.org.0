Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6604751B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Dec 2021 05:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239748AbhLOEfS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Dec 2021 23:35:18 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:51764 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239740AbhLOEfS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Dec 2021 23:35:18 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 100D2617DA;
        Wed, 15 Dec 2021 04:35:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2763AC34600;
        Wed, 15 Dec 2021 04:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639542917;
        bh=DHq8x3NS0uPYWBdWXJqA4Z7Tx3toHalCV1Y52lRkrWg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Y5eiaHd9n45pJP5VFROxNP9+oZIKWUhyPgfb2hioa9FgLYMS5afYmWAnCwenwwTCU
         cULkRzZ4SV5y/aqnYz5jB91lhIOgrcpHLquzk6ZYZDvgA2OHHBSoSq9SHoT7P+u7cD
         NTp8VG3t2ZysEizKm31rx09iwoJ0wDGfrvojWlqDIfV9vcX1BEK5Y/LURWM/V6cMv/
         HYwoETrPi+Jh5FLWre1VDCcLeAwt2xY3+8sDyFGcn02vR1SG4yHiAMW37vSgz/PEYZ
         oB3xlyFgWTvQtEjYR303+oaIuGScQnY2j3Y1JbYbHvnD2NGpLKXSBM1lfBgq1eqtRa
         Mj5f4x0sK+K/Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v3 08/11] arm64: dts: qcom: sm8450-qrd: enable ufs nodes
Date:   Wed, 15 Dec 2021 10:04:37 +0530
Message-Id: <20211215043440.605624-9-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215043440.605624-1-vkoul@kernel.org>
References: <20211215043440.605624-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable the UFS and phy node and add the regulators used by them.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8450-qrd.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
index 2ab19608a455..4b7ad190d538 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
@@ -353,3 +353,23 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l7b_2p5>;
+	vcc-max-microamp = <1100000>;
+	vccq-supply = <&vreg_l9b_1p2>;
+	vccq-max-microamp = <1200000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5b_0p88>;
+	vdda-pll-supply = <&vreg_l6b_1p2>;
+	vdda-max-microamp = <173000>;
+	vdda-pll-max-microamp = <24900>;
+};
-- 
2.31.1

