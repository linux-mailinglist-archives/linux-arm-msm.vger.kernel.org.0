Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B0DC4BC13F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Feb 2022 21:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239487AbiBRUhh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Feb 2022 15:37:37 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238031AbiBRUhg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Feb 2022 15:37:36 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623F33586B;
        Fri, 18 Feb 2022 12:37:18 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id e3so16495331wra.0;
        Fri, 18 Feb 2022 12:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ym0vhJ25UZmWG0ur5rpY3WvUAoVD6bhZ8iaX/iUQYgM=;
        b=Z5rhxAMWJ0ivKl/be0FjBTALN4VE7gBrTTJ08PAkgEEHWYUES3HQbkbVkjvN3v7Orn
         WaZObeCFO5ALPPouKGRsY4JOM+jCEBXf8zb9JLoJ4MvKdI2CbZhUei6gUZpHXd0s2qzi
         F9qXFD5P/n0XL2/BWmQqNDwjJjU4nKg+2IASG8+L0S1GqsgGM2LlOBdHZUyuMcWl6nvx
         wTiS3cUv+vUd+LHQqEEsOirSCKWpHbnN3v3/BBkW4d11bhYCWOoMMcQ/7xeQ3Sfzh+t2
         hQpB0xg1ATBfJgqK7tMizxVc/KHr9dfOuVYdyy+SsINTRx8VAIVuXcgySYU9V2H6IRoU
         PVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ym0vhJ25UZmWG0ur5rpY3WvUAoVD6bhZ8iaX/iUQYgM=;
        b=ETdrBCqfKofkRul86ZZI3nggsht/rwnENIuxWTicckC19v+ykyi5gSonN/FsMzQhzm
         xSq2E0wQToVlOPRdKXLSklnRUT+/JrXsSNzRqC/hWfLXO0rsm+Wvuzx/Whn6Z1xaNdpc
         WG5Awksz0jW64nT1+A6hQJF/r/qTjZgEMo4HyVOvyiDOPQVAqEjZ5UHCDgcvMRqveR0o
         thKznswbHqNYs4c3lTIXyg2Gfjkg7nNXmcpukuaxkuWoTH2eo4E48vFh5YJybbIydNNA
         XdXAyJc+Xv2/Hrf8/GdYFehTpIXvB8XWP+0Wcl0UO49yxZqO3HKnxggwNSpALieh2ri8
         ahSw==
X-Gm-Message-State: AOAM5304GuEYvVH9CDgWL9yNauTDsZtaviiGC8vKwOCEr9wafCdVf0Dh
        /c8hUOdmiGG/95jBTe14zilQPV697ojdNpDf
X-Google-Smtp-Source: ABdhPJwLpEQKgOS+KZTANJUjUbr3eWllGWavCm/AcM/Jsp6fdoY8EyvqR2JrzcfJIgwFz2ImCdTLdA==
X-Received: by 2002:adf:d844:0:b0:1e4:bd02:b34d with SMTP id k4-20020adfd844000000b001e4bd02b34dmr6928173wrl.591.1645216636800;
        Fri, 18 Feb 2022 12:37:16 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id e10sm8406326wra.103.2022.02.18.12.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 12:37:16 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v4 1/1] arm64: dts: qcom: msm8994-huawei-angler: Add sdhc1 definition
Date:   Fri, 18 Feb 2022 21:37:10 +0100
Message-Id: <20220218203710.895-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Angler does not have SD card, thus sdhc2 kept disabled.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

credit for assigned-clock{s,-rates} goes to Konrad.
Thanks!

[    1.567434] sdhci: Secure Digital Host Controller Interface driver
[    1.567477] sdhci: Copyright(c) Pierre Ossman
[    1.573265] Synopsys Designware Multimedia Card Interface Driver
[    1.577950] sdhci-pltfm: SDHCI platform and OF driver helper
...
[    1.631203] mmc0: SDHCI controller on f9824900.sdhci [f9824900.sdhci] using ADMA 64-bit
...
### postmarketOS initramfs ###
...
[    1.868905] mmc0: new HS400 MMC card at address 0001
[    1.871467] mmcblk0: mmc0:0001 064G70 58.2 GiB 
[    1.876902] GPT:partition_entry_array_crc32 values don't match: 0x4aa75f3b != 0xe3345ddf
[    1.877211] GPT: Use GNU Parted to correct GPT errors.
[    1.886103]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27 p28 p29 p30 p31 p32 p33 p34 p35 p36 p37 p38 p39 p40 p41 p42 p43 p44
[    1.901299] mmcblk0boot0: mmc0:0001 064G70 4.00 MiB 
[    1.908973] mmcblk0boot1: mmc0:0001 064G70 4.00 MiB 
[    1.913706] mmcblk0rpmb: mmc0:0001 064G70 4.00 MiB, chardev (234:0)
ERROR: failed to mount subpartitions!

=> no overclocking warnings.

Kind regards,
Petr

 .../boot/dts/qcom/msm8994-huawei-angler-rev-101.dts  | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 0e3dd48f0dbf..6dddf700f744 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -41,3 +41,13 @@ serial@f991e000 {
 &tlmm {
 	gpio-reserved-ranges = <85 4>;
 };
+
+&sdhc1 {
+	status = "okay";
+
+	mmc-hs400-1_8v;
+
+	/* avoid overclocking warnings */
+	assigned-clocks = <&gcc GPLL4_EARLY>;
+	assigned-clock-rates = <384000000>;
+};
-- 
2.35.1

