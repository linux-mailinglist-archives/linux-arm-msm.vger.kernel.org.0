Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 217771216F3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2019 19:33:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728973AbfLPScw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Dec 2019 13:32:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728309AbfLPScv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Dec 2019 13:32:51 -0500
Received: from localhost.localdomain (unknown [122.182.192.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C1A44207FF;
        Mon, 16 Dec 2019 18:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576521171;
        bh=ymG65eyYvOkGT/a1o3YdUCpKSlzLO0odxHAPgjHBxno=;
        h=From:To:Cc:Subject:Date:From;
        b=2Bn0vV2zeXZU42Qw/Iw9TpgoDoWqkVhKIjIuQJH4XiImIpywXcXN9r6B/r9yN8nxN
         UNdyhISxhr5AgbOi71Oe3VEUwchQi9DKK026Cj5gmyebGmfAnRa5zAvmAmGO7qvzK7
         1vy46WuyaWgjjgx2ElTXOTWZXfS5RcmtXxFg0qq4=
From:   Vinod Koul <vkoul@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: qcom: sm8150: Update UFS resets
Date:   Tue, 17 Dec 2019 00:02:31 +0530
Message-Id: <20191216183232.1570675-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The reset described is the phy reset so it should be named ufsphy, so
update it and add the UFS card reset

Earlier reset description was incorrect as phy reset was pointed to
'rst' as well as 'ufsphy' so both phy and core attempted to reset this
causing UFS to not come up. This was discovered with 870b1279c7a0
("scsi: ufs-qcom: Add reset control support for host controller")

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sm8150.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
index f36d621a53e2..6a351e0cb3a6 100644
--- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
@@ -517,8 +517,9 @@
 			phy-names = "ufsphy";
 			lanes-per-direction = <2>;
 			#reset-cells = <1>;
-			resets = <&gcc GCC_UFS_PHY_BCR>;
-			reset-names = "rst";
+			resets = <&gcc GCC_UFS_PHY_BCR>,
+				 <&gcc GCC_UFS_CARD_BCR>;
+			reset-names = "ufsphy", "rst";
 
 			clock-names =
 				"core_clk",
-- 
2.23.0

