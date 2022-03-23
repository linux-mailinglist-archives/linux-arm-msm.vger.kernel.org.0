Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62C424E5A27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:48:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243872AbiCWUuY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240768AbiCWUuW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:50:22 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E72833524B;
        Wed, 23 Mar 2022 13:48:51 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n35so1643459wms.5;
        Wed, 23 Mar 2022 13:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LukbgojREw+PN9UG7YjuzAI4ZmJ6UO0+vPcwD8VUwiE=;
        b=n0E+qZZAzaM8kRFDnrmWh+PSqigHNi3NS4aaYCR6aEbybV9DDXhTAidVcCg5dpYF1v
         bKzCqai4gQcI3pKyIuf5OA5loiaBzr5JyYeE8brz7ObVJ8QbFIZ8Q765JcasYj0hpoOA
         IlBUHyHJol25U1McaHQ3uqMfewYvBLn645f9/ogksEyr0eatWGiBBJAF9omcmAvuPaKF
         e8e0k44wW0+aEfLYBmNRzeShThwKDBKD8FR1J5pS6E3qYL0Hk6c2zRJeEEX7crxLtZpU
         zyrMnM4D6Eecm1HyL73K6B1luiz1/seAn+1IgxdDM2+E4OyiaRQXuyAYo89BNwy9j1+F
         SVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LukbgojREw+PN9UG7YjuzAI4ZmJ6UO0+vPcwD8VUwiE=;
        b=MfOuVrTaMBEkdjTGUpa3tInounE5IQX6R6UTLLX9hArbK7aVc3wSRuoO0xoZm0vII3
         Ui8Sp+QinKpM3AN0sf0A7tIxe5F66/DrqV3qZxemPcraIti75HqbcARwZbEeUBZU5R0e
         ccyiNG3xOucztBNLo6TyLJQslUM44JX54cUPKEKENsiNGWIZat5JhfenzBySCzI74JXb
         1JGte2OLbvOXyPG4FdvQ/FckntzGY1uCQcn0gOAh8XsnY739OzlYnw9NVR5I5MDwn0Rp
         JaYR++TllfLMNavd7VoESmAnE0dlDCblQcNQcam3Yrd5caQ3RjHOmqkgA5Q02Bh0sqCY
         yfgA==
X-Gm-Message-State: AOAM533a2ymWwudCHapBvq8EdfFpZwB0VPo9IoxOzMLtXNCMZgQ2TPHX
        ojeMV6M1xP7Y/VeTM7M5sSLpiL571r7RZg==
X-Google-Smtp-Source: ABdhPJxeQHruZoouFnyYI3jT/FWg2BTm68I/sYDF8LVRA+uY/R+iWBdubrPGtvu8h21wiJOvHR6FGw==
X-Received: by 2002:a1c:6a01:0:b0:37f:1b18:6b17 with SMTP id f1-20020a1c6a01000000b0037f1b186b17mr11024533wmc.146.1648068530369;
        Wed, 23 Mar 2022 13:48:50 -0700 (PDT)
Received: from dell5510.arch.suse.de (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id i15-20020adffdcf000000b00203efad1d89sm1047350wrs.9.2022.03.23.13.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 13:48:49 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/1] arm64: dts: qcom: msm8994-huawei-angler: Add sdhc1 definition
Date:   Wed, 23 Mar 2022 21:48:40 +0100
Message-Id: <20220323204840.22832-1-petr.vorel@gmail.com>
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
NOTE: requires Konrad's fix
https://lore.kernel.org/linux-arm-msm/YjuE+cgGXCLihPIa@pevik/T/#t

changes v4->v5:
* remove workaround (fixed by Konrad's fix)

 arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index 0e3dd48f0dbf..6e43e4339f55 100644
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
@@ -41,3 +41,8 @@ serial@f991e000 {
 &tlmm {
 	gpio-reserved-ranges = <85 4>;
 };
+
+&sdhc1 {
+	status = "okay";
+	mmc-hs400-1_8v;
+};
-- 
2.35.1

