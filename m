Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 931914BEB8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Feb 2022 21:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233403AbiBUUGQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Feb 2022 15:06:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233396AbiBUUGP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Feb 2022 15:06:15 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40B86237CD;
        Mon, 21 Feb 2022 12:05:51 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id o34so10139279wms.1;
        Mon, 21 Feb 2022 12:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FNxG3d58AjqNNohKlsyUpWbAHb3kEBaH3snKRrlbYxA=;
        b=LnXvwZgjp5jcH/0VxSjXRqzfNtER2ZF9vCYzKwtWcbmacen62iUKee/Nu5p8xb9Boi
         +sWwTWqYoGat+JV9h68BcV5gCnPCPNGkVH+Y0gczmRSMQl1JrXdI1B8OsJmGgPWDcZQg
         ShhFeUaxoiro1rDGqBhySo3vPyKqtGZmqxTAU/7SnWwDWmoOHJFxPygsBTbqYABgnn8K
         iq+wMoht/BaZPUNBZYGJYmpWm3KRdmasgSkecrPRK/zsMm0N/sbOTcIxPh5poN+SbZSE
         OQmAMu5YPGEDD2/1U5WtS4LmfXfyz4Z7JFHPrXO9F14AssdVVbZzfkj6MQ5zGFP82QGa
         oGjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FNxG3d58AjqNNohKlsyUpWbAHb3kEBaH3snKRrlbYxA=;
        b=VOHKahLWk4dZBaOG3K0w/B08YynpmWvKYTq5x24I97kN63CuPosKhYrXtWkmGORDYc
         QPXB/Ki598SX8oeNiUu60Id9htCLr8ojmV/20DN+lvPsYTXif4iGquQmiqhM6ykqAKUi
         vdnLFCkPquTE3Iyvpw2DInDW4H8teDQ5NAgmUwYKTNLcH1ytU2e0Bj9HvEoiHfaI9xzT
         SJVD0fGRkXBDEySMjmfKkhuYDMTv2A306mwF0ssRlJFHuw6UQhssIBVTNRxRP4H2VVnR
         O8rBz3Ard7QKGcSSMgF2VltNECjEwqyyONoEBUh391pgOBNzMCC2Sat1wBGJwsYCYIfd
         8c+A==
X-Gm-Message-State: AOAM531ioO2CazoXcYLRknuPkcf7G4BjFJnlZZ4Os1g3WoGYaSDFTerZ
        UrEEaPtN6K04VxT5NiC4ISyLe73HKNV74Q==
X-Google-Smtp-Source: ABdhPJwIbAARZC1yYk+zzXEKdXzGEKoS/nTWvrD0C0CzlF5zq8eT2WU8DZ1TFP92nISgChdztmy+Qg==
X-Received: by 2002:a05:600c:4e44:b0:37e:cc65:a38c with SMTP id e4-20020a05600c4e4400b0037ecc65a38cmr510823wmq.57.1645473949829;
        Mon, 21 Feb 2022 12:05:49 -0800 (PST)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id s19sm1625378wrb.25.2022.02.21.12.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 12:05:49 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Jean Thomas <virgule@jeanthomas.me>
Subject: [PATCH 1/1] arm64: dts: qcom: bullhead: Fix sdcard1 overclocking
Date:   Mon, 21 Feb 2022 21:05:40 +0100
Message-Id: <20220221200540.14460-1-petr.vorel@gmail.com>
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

rev 1.01 (msm8992-lg-bullhead-rev-101.dts) has overclocking warnings:
[    1.997606] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
[    1.997681] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
[    2.010904] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
[    2.012961] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
[    2.027497] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
[    2.027607] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
[    2.039699] mmc0: new HS400 MMC card at address 0001

Similarly to angler use gcc GPLL4_EARLY to get rid of the warnings.
Not tested on 1.0, but should work here as well.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
@Jean: could you please test it on your rev 1.0?
Thanks!

Kind regards,
Petr

 arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
index 3b0cc85d6674..c18839b2baf0 100644
--- a/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8992-lg-bullhead.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, LGE Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
+ * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -299,4 +299,8 @@ &sdhc1 {
 	status = "okay";
 
 	mmc-hs400-1_8v;
+
+	/* avoid overclocking warnings */
+	assigned-clocks = <&gcc GPLL4_EARLY>;
+	assigned-clock-rates = <384000000>;
 };
-- 
2.35.1

