Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A43502F0928
	for <lists+linux-arm-msm@lfdr.de>; Sun, 10 Jan 2021 20:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbhAJTAS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 10 Jan 2021 14:00:18 -0500
Received: from vps5.brixit.nl ([192.81.221.234]:40788 "EHLO vps5.brixit.nl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbhAJTAR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 10 Jan 2021 14:00:17 -0500
Received: from localhost.localdomain (unknown [77.239.252.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by vps5.brixit.nl (Postfix) with ESMTPSA id E3F6160235;
        Sun, 10 Jan 2021 18:59:33 +0000 (UTC)
From:   Alexey Minnekhanov <alexeymin@postmarketos.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH] ARM: dts: qcom: msm8974-klte: Fix shdc numbering
Date:   Sun, 10 Jan 2021 21:58:34 +0300
Message-Id: <20210110185835.133059-1-alexeymin@postmarketos.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since commit fa2d0aa96941 ("mmc: core: Allow setting slot index
via device tree alias") proper aliases should be named "mmcN".

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
index 97352de9131422..f23d1002b8f8b9 100644
--- a/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts
@@ -12,8 +12,8 @@ / {
 
 	aliases {
 		serial0 = &blsp1_uart1;
-		sdhc1 = &sdhc_1; /* SDC1 eMMC slot */
-		sdhc2 = &sdhc_2; /* SDC2 SD card slot */
+		mmc0 = &sdhc_1; /* SDC1 eMMC slot */
+		mmc1 = &sdhc_2; /* SDC2 SD card slot */
 	};
 
 	chosen {
-- 
2.26.2

