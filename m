Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDB7630F4F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Nov 2022 16:39:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiKSPjt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Nov 2022 10:39:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229935AbiKSPjs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Nov 2022 10:39:48 -0500
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0297F711B0
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Nov 2022 07:39:48 -0800 (PST)
Received: from g550jk.arnhem.chello.nl (unknown [62.108.10.64])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 96CF5D05D1;
        Sat, 19 Nov 2022 15:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1668872356; bh=8BQvB1xavWyb9p5Z/t4+g55iyappE+xXmQ5QjDeo6vY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=nqnrFCKjYR6Gzb+/80+9VamPk4yl7I6J4/t9DwdqB8yAO7YLxiA/FXdY2luwWkmto
         RjCnWXPr3bItfhIKWSwQ5QPuD2tq9j2Wa4UzU29hg1+OgHdXHqouKAPGmCjvRqsxvp
         VqeWbmYuY1Nmh3RMwrKqkg4IsbQzGv+YN5OCb3s8=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Luca Weiss <luca@z3ntu.xyz>
Subject: [PATCH 2/2] arm64: dts: qcom: sdm632-fairphone-fp3: Add NFC
Date:   Sat, 19 Nov 2022 16:39:03 +0100
Message-Id: <20221119153903.770853-2-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221119153903.770853-1-luca@z3ntu.xyz>
References: <20221119153903.770853-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Configure the node for the NQ310 chip found on this device, which is
compatible with generic nxp-nci-i2c driver.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
index 2920504461d3..fde93cbcd180 100644
--- a/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
+++ b/arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dts
@@ -63,6 +63,21 @@ touchscreen@48 {
 	};
 };
 
+&i2c_5 {
+	status = "okay";
+
+	nfc@28 {
+		compatible = "nxp,nq310", "nxp,nxp-nci-i2c";
+		reg = <0x28>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
+		firmware-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+	};
+};
+
 &pm8953_resin {
 	status = "okay";
 	linux,code = <KEY_VOLUMEDOWN>;
-- 
2.38.1

