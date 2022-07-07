Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF90356A15D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 13:59:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235300AbiGGL6s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 07:58:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235490AbiGGL5R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 07:57:17 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64431599DF
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 04:55:11 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id bh13so12115164pgb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 04:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AfR9UZtpRGzhv3c4Zln6eGAdbeQgygF+9NKWBtburhs=;
        b=dYUGx0RODM9RUBv9GQtsRp0MUbiQIBwZzXrjY3qMkDzehnjVBMkGMVf01Kiem1eUmH
         7363oOVcdC9Rr9JcHhPHaBjAoGO1SyE2sq2QMayqrRnUma11AdTxRcGV8+vCIxKbSg6I
         2clVMbCzUGt4dJTkVIzZcaNyeY2S85I8EeA+Gq25+C1NYBgBya/GY9IDDuXVV50ncbw7
         u0jfL7zdVdS9Jvwfn5ON8M5fFBjhskqQ6fX+Kd7ZvwUXGhdhjkNuok8DV1rT31jAFSj3
         nasAtlWyyArwNradHMhjMPtAA9ZRfLH2O6xJ/JreL+ORPxHbCsVc7JyqEVyY2GgJfTAH
         Kffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AfR9UZtpRGzhv3c4Zln6eGAdbeQgygF+9NKWBtburhs=;
        b=Bh2P5315RYMEeoZb48gHs1Ir5EeM5mejILgJvFjAn6+C94f7iIL1M7E7oa7wysGm5L
         aklySqFZCE4w39OaCPIc1wBUYlx8Fv8XZzPUMKQ79owklt3kd6MvIHVlyPZ+yaMJvAzN
         PcfadLKc+88+E9hYbfcSgASRagp3cyFt/gP2NKPMTzivzMzI02jriTMgKZH7glS5WotT
         kpSjTfKto+Np0RwWhEZivLrk1Spxtl7Cwv13ypbb/NJjjn+aP5ndB/hyAsxS4OpJhcQN
         eqHrg5noo7UGeF/yhL60v46H/LITLeN2YDLUqYV6Qr1mEJFopWIR+QGfZ2OmZC4vt1BW
         IJXw==
X-Gm-Message-State: AJIora+I7V1VJFfJWFzNC36ocC1EHXBH4BSHC8cPqPLw/gns6BqV5c6m
        AO6i9Eb2qA5WcM7SK/LNJIkc6N45kLZ0KA==
X-Google-Smtp-Source: AGRyM1uDUmzYdJM5zUMETUsdm5U2WwLBDcjaEaHBiDhpvi9zzTtJzjyWyo/bWlneJdIZMYgFPvIQug==
X-Received: by 2002:a17:902:b215:b0:168:da4b:c925 with SMTP id t21-20020a170902b21500b00168da4bc925mr50913137plr.155.1657194910692;
        Thu, 07 Jul 2022 04:55:10 -0700 (PDT)
Received: from localhost.localdomain ([182.77.21.191])
        by smtp.gmail.com with ESMTPSA id r10-20020a17090a1bca00b001e2f892b352sm16503936pjr.45.2022.07.07.04.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 04:55:10 -0700 (PDT)
From:   Sumit Garg <sumit.garg@linaro.org>
To:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, vkoul@kernel.org,
        shawn.guo@linaro.org, bryan.odonoghue@linaro.org,
        nicolas.dechesne@linaro.org, mworsfold@impinj.com,
        daniel.thompson@linaro.org, andrey.konovalov@linaro.org,
        Sumit Garg <sumit.garg@linaro.org>
Subject: [PATCH] arm64: dts: qcom: qcs404: Fix incorrect USB PHYs assignment
Date:   Thu,  7 Jul 2022 17:24:44 +0530
Message-Id: <20220707115444.1431367-1-sumit.garg@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This was a difficult inconsistency to be caught as both the USB PHYs were
being enabled in the kernel and USB worked fine. But when I was trying to
enable USB support in u-boot with all the required drivers ported, I
couldn't get the same USB storage device enumerated in u-boot which was
being enumerated fine by the kernel.

The root cause of the problem came out that I wasn't enabling USB PHY:
"usb2_phy_prim" in u-boot. Then I realised that via simply disabling the
same USB PHY in the kernel disabled enumeration for USB3 host controller
as well.

So fix this inconsistency by correctly assigning USB PHYs.

Fixes: 9375e7d719b3 ("arm64: dts: qcom: qcs404: Add USB devices and PHYs")
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
---
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 513bf7343b2c..50edc11a5bb5 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -557,7 +557,7 @@ usb3_dwc3: usb@7580000 {
 				compatible = "snps,dwc3";
 				reg = <0x07580000 0xcd00>;
 				interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb2_phy_sec>, <&usb3_phy>;
+				phys = <&usb2_phy_prim>, <&usb3_phy>;
 				phy-names = "usb2-phy", "usb3-phy";
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
@@ -586,7 +586,7 @@ usb@78c0000 {
 				compatible = "snps,dwc3";
 				reg = <0x078c0000 0xcc00>;
 				interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
-				phys = <&usb2_phy_prim>;
+				phys = <&usb2_phy_sec>;
 				phy-names = "usb2-phy";
 				snps,has-lpm-erratum;
 				snps,hird-threshold = /bits/ 8 <0x10>;
-- 
2.25.1

