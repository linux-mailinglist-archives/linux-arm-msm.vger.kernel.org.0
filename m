Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EB91639300
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 02:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiKZBK1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Nov 2022 20:10:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiKZBK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Nov 2022 20:10:26 -0500
X-Greylist: delayed 200 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 25 Nov 2022 17:10:24 PST
Received: from mxd-1-a41.seznam.cz (mxd-1-a41.seznam.cz [IPv6:2a02:598:128:8a00::1000:a41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D014F5B8;
        Fri, 25 Nov 2022 17:10:23 -0800 (PST)
Received: from email.seznam.cz
        by smtpc-mxd-69d6476965-km5pg
        (smtpc-mxd-69d6476965-km5pg [2a02:598:128:8a00::1000:a41])
        id 1c90996aaab026311c97271d;
        Sat, 26 Nov 2022 02:10:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz;
        s=szn20221014; t=1669425012;
        bh=xoNK6jNMKvpRvEALKcIyR7j5wD5SUwho1AcJPi7uCQI=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
         Content-Transfer-Encoding;
        b=SG8bXXztui+2bbXuVF473VpvIsG+3LLjTBjM6XeW1txvaqBABUNKomUW2XEOeIur/
         ZnOrOBM+VG/VUM7bn2MwptyEhnnsxugqX68WqjxrdwY//CmALlASe3plTH/uIwuzNo
         ZDBe0LrxlYB5RF5zhIvDMfgE1N3TyOzcxWDnbSs3C8Ph44hl0rdYLVXv9iCA7kIc/6
         7Qo/uwFShLDs3xuhYXyk0oVRlsyAd5k6MCdnafwEsLmjuwW7f99V+IRF1k46vUs+nb
         aJRGY9FHovCApU0zQrNnDr2JEKC6F1Y6Fpwth1pGJsOXwxnriqoafUKdtscKtqYvVt
         boF2i55GSLrqg==
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
        by email-relay6.ng.seznam.cz (Seznam SMTPD 1.3.140) with ESMTP;
        Sat, 26 Nov 2022 02:05:36 +0100 (CET)  
From:   Petr Vorel <pevik@seznam.cz>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Bart Ribbers <bribbers@disroot.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 1/1] arm64: dts: qcom: msm8992-lg-bullhead: Disable cont_splash_mem
Date:   Sat, 26 Nov 2022 02:05:31 +0100
Message-Id: <20221126010531.466046-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_SBL_CSS,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Petr Vorel <petr.vorel@gmail.com>

Since v6.0-rc1 bullhead reboots during boot:

[    1.882334] mmcc-msm8994 fd8c0000.clock-controller: supply VDD_GFX not found, using dummy regulator
[    1.908955] s1: Bringing 0uV into 800000-800000uV
[    1.911893] s3: Bringing 0uV into 1300000-1300000uV
[    1.920436] s4: Bringing 0uV into 1800000-1800000uV
[    1.921097] s5: Bringing 0uV into 2150000-2150000uV
[    1.932363] s7: Bringing 0uV into 1000000-1000000uV
[    1.933015] l1: Bringing 0uV into 1000000-1000000uV
[    1.948295] l2: Bringing 0uV into 1250000-1250000uV
[    1.948934] l3: Bringing 0uV into 1200000-1200000uV
[    1.960345] l4: Bringing 0uV into 1225000-1225000uV
[    1.960998] l6: Bringing 0uV into 1800000-1800000uV
[    1.968407] l8: Bringing 0uV into 1800000-1800000uV
[    1.970694] l9: Bringing 0uV into 1800000-1800000uV
[    1.979014] l10: Bringing 0uV into 1800000-1800000uV
[    1.979832] l11: Bringing 0uV into 1200000-1200000uV
[    1.988560] l12: Bringing 0uV into 1800000-1800000uV
[    1.989411] l13: Bringing 0uV into 1800000-1800000uV
[    1.996334] l14: Bringing 0uV into 1200000-1200000uV
[    2.000846] mmc1: new HS400 MMC card at address 0001
[    2.007868] l15: Bringing 0uV into 1800000-1800000uV
[    2.009193] l16: Bringing 0uV into 2700000-2700000uV
[    2.017296] mmcblk1: mmc1:0001 032G74 29.1 GiB
[    2.028561] l17: Bringing 0uV into 2700000-2700000uV
[    2.029258] l18: Bringing 0uV into 3000000-3000000uV
[    2.039718]  mmcblk1: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44 p45 p46
[    2.044590] l19: Bringing 0uV into 1800000-1800000uV
=> reboot
Format: Log Type - Time(microsec) - Message - Optional Info
Log Type: B - Since Boot(Power On Reset),  D - Delta,  S - Statistic
S - QC_IMAGE_VERSION_STRING=BOOT.BF.2.3-00376

Disabling cont_splash_mem fixes it.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 87c90e93667f..a2f69d965ae5 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -2,7 +2,7 @@
 /*
  * Copyright (c) 2015, LGE Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -11,7 +11,10 @@
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
 
-/* cont_splash_mem has different memory mapping */
+/*
+ * cont_splash_mem has different memory mapping (0x03400000),
+ * but that since v6.0-rc1 it causes phone reboot somewhere in mmc module.
+ */
 /delete-node/ &cont_splash_mem;
 
 / {
@@ -46,11 +49,6 @@ ramoops@1ff00000 {
 			ftrace-size = <0x10000>;
 			pmsg-size = <0x20000>;
 		};
-
-		cont_splash_mem: memory@3400000 {
-			reg = <0 0x03400000 0 0x1200000>;
-			no-map;
-		};
 	};
 };
 
-- 
2.38.1

