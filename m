Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2FCB3A5A15
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Jun 2021 20:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232012AbhFMSzn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Jun 2021 14:55:43 -0400
Received: from relay04.th.seeweb.it ([5.144.164.165]:44707 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232003AbhFMSzm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Jun 2021 14:55:42 -0400
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id D37DB1F60D;
        Sun, 13 Jun 2021 20:53:38 +0200 (CEST)
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
Subject: [PATCH] arm64: dts: qcom: sm8250: Fix pcie2_lane unit address
Date:   Sun, 13 Jun 2021 20:53:34 +0200
Message-Id: <20210613185334.306225-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The previous one was likely a mistaken copy from pcie1_lane.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7ab73d6c13a6..b8bca3225d96 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1489,7 +1489,7 @@ pcie2_phy: phy@1c16000 {
 
 			status = "disabled";
 
-			pcie2_lane: lanes@1c0e200 {
+			pcie2_lane: lanes@1c16200 {
 				reg = <0 0x1c16200 0 0x170>, /* tx0 */
 				      <0 0x1c16400 0 0x200>, /* rx0 */
 				      <0 0x1c16a00 0 0x1f0>, /* pcs */
-- 
2.32.0

