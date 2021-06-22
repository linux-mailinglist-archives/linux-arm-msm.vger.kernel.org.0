Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD0353AFB7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 05:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFVDqd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Jun 2021 23:46:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbhFVDqb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Jun 2021 23:46:31 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57B87C061574;
        Mon, 21 Jun 2021 20:44:16 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id a11so21880125wrt.13;
        Mon, 21 Jun 2021 20:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qphhSffFgD8BhonTHuKpBOZ/SPCjT8/2a4OdhjdUj1g=;
        b=TNDI25CblwWlvCRny/GsqGX1elEI+KQSPpm3hO2OFSBfhbOlTfAngmIYS5ewYw0lUx
         1L7gZSAWd1I6HBBLPD1lQTScqEwZbRLbdhmr1ukN4ESk1j8otJN37+FBL3Pbkq73hzbb
         dnqJ2l5rFTNL2YrM7AptuEeoZQ94IgXhog8vx/s1Ir1E9WDzCBaJoyph3oSB6M7BnnNa
         UaXoz2LiNM9V3wm2GSZM3ltHfAnrLfH9UaVBUnrS5Mm4i787Fk31knhizkFoqftBBRtN
         ROZrkbQ/hOWXdjikIO4Sml/2eaWXSCtCd3MWe9bZV+k2o2pMZbyW5gNdTWYaiZ+6EWb2
         GEtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qphhSffFgD8BhonTHuKpBOZ/SPCjT8/2a4OdhjdUj1g=;
        b=OqtzeJ+D/MBasrBH5I2Q3PygXHkIFyyBbkNU0tQsnQXWKrsZ7sslOXUB/1hyPCmpoZ
         wSOhaP8Dv0GJ9kkStybTiabfmqmBXAc9p8H/E3CbUdqDfXzZOxK/IgMiXs5JqbZBZ7F2
         O6hVqqr2T4kMpBAAL6jPmVlmU9gPQPmGE2xNQok5Vz1Fw/NSz3tz0VQydbCGBiDdViBU
         XhHV3fGt2h2uCKuJ8+iec9DoU6WX5Ny2DzTWB3KJcEuPaesfPh7rw+9TUxBD5UWHo+ko
         IcOiP/1hMtOWRaYbAy1UtqUqKtbhxrOQJsaRiBZ/aOTF+F5BMTN1120YatZohAHAH/hZ
         wV2Q==
X-Gm-Message-State: AOAM530Ir3wlF46MVB/T5rj4z1MWNdD1Ak+4DvZ5jmwWueptC6B/hpjP
        EkxOqgSo/aVxGRgQnwsdpDMzFsJEpl2JLA==
X-Google-Smtp-Source: ABdhPJy6eM1ddTgY/26a4FXFOiC1t1sYYZgq42rdEq7RLsiIRX9hBMU350XboRgtxYa+2LhXCd6gSQ==
X-Received: by 2002:a5d:4d50:: with SMTP id a16mr1968076wru.133.1624333454905;
        Mon, 21 Jun 2021 20:44:14 -0700 (PDT)
Received: from dell5510.suse.de (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id o203sm885305wmo.36.2021.06.21.20.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 20:44:14 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/1] arm64: dts: qcom: msm8994-angler: Disable memory@3800000
Date:   Tue, 22 Jun 2021 05:44:08 +0200
Message-Id: <20210622034408.24904-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It prevents booting angler.

cont_splash_mem was introduced in 74d6d0a145835, but the problem
manifested after 86588296acbf ("fdt: Properly handle "no-map" field
in the memory region").

Fixes: 74d6d0a145835 ("arm64: dts: qcom: msm8994/8994-kitakami: Fix up
the memory map")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

not sure if cont_splash_mem memory@3800000 is msm8994 specific.
BTW I haven't found it in LineageOS git [1]

Maybe it should go to msm8994-sony-xperia-kitakami.dtsi.
And I suppose it breaks also bullhead, thus this probably should go also
to msm8992-bullhead-rev-101.dts.

Kind regards,
Petr

[1] https://github.com/LineageOS/android_kernel_sony_msm8994

 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index ffe1a9bd8f70..af5ff9badec9 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -31,6 +32,10 @@ serial@f991e000 {
 			pinctrl-1 = <&blsp1_uart2_sleep>;
 		};
 	};
+
+	reserved-memory {
+		/delete-node/ memory@3800000;
+	};
 };
 
 &tlmm {
-- 
2.32.0

