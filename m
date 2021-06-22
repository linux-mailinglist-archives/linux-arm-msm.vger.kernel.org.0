Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85E23B0C9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 20:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhFVSN3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 14:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230146AbhFVSN3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 14:13:29 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAC3C061574;
        Tue, 22 Jun 2021 11:11:12 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id a11so24725263wrt.13;
        Tue, 22 Jun 2021 11:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRsBA0uRgRgTVs3k/X6tNJ3otxf/okSIPDMgMCIvWuM=;
        b=hDTH528GEBKhaiY+kO+AX56J/lFypAYDhPjI5NCgTvUO2JtcyhygC6HypDNC/tfbTX
         k2oI9dGuWfFcA6XbFW1Ouq0vgZ1GsyKUUeqR9ZySNGWG3zH7A2MLLkY/cL2fvNn/G1Oe
         XqiHS3qYe64K4oO3DrjEPYLzON1MY2F4s/igERXuE/krwFAFMxTvKNDoUNP1VFtfyC/7
         5CPmAxIRMhC3HdajrcNkHGAnbmh9qogEP5g+UExydm45W9n+ROfSNQfsVQbPXwQ4exu5
         raDi6JYn61GtTmIOHsc0Os4Wb8qTMXwjFtvM6ifuYZPBYKbYYyRFOegR+e7kWX8aD5g3
         3wDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mRsBA0uRgRgTVs3k/X6tNJ3otxf/okSIPDMgMCIvWuM=;
        b=U/oY957uzgoI0Zjk1I9GBRDfaOPPe6q+ieXwe7pdSYSmKZiypKzwn+6rIzoXN9e/Hi
         Nf91ixSuB72oqzR0ZI2YM7ooaxQmG0Cq0CD+T++6spuGEUTPsO0tixMaaElLoI/r9l9y
         dkXVCfLNwdJVD9+2ObrBMekQEPRE9NslhCS0rExHygdB+xRwMunhtLbylZDbGaYdeEBZ
         H+G9YjrZze5yqbh3oEryIF0qEfie2kFtsOo+Fy7fMu9LzjUvYMacsvCu6MxKGBDOL3/2
         wr0O5pZY5nsbSBkz4ZPv+XiRlFisiZ3v9CGX6/AITvVFocRWo90HYL754dxLt03j7V6E
         DCwA==
X-Gm-Message-State: AOAM530Qyh85dwsqqOcRmblzSrR5B440rilxio25lR3DtuZ2Cp1wAOrB
        zvdgIQ41sVjurisCY8jszpjHA5oRioHOzw==
X-Google-Smtp-Source: ABdhPJyUmGdxien2QJ0hTCW0croLndpvZtRZ91FwDmGD2WVQ6b0m80HAqFFkF9CvZZJcCyyEDXdXlg==
X-Received: by 2002:a5d:5181:: with SMTP id k1mr6240404wrv.415.1624385470745;
        Tue, 22 Jun 2021 11:11:10 -0700 (PDT)
Received: from dell5510.suse.de (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id o2sm109974wrx.59.2021.06.22.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 11:11:10 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/1] arm64: dts: qcom: msm8994-angler: Fix cont_splash_mem
Date:   Tue, 22 Jun 2021 20:10:56 +0200
Message-Id: <20210622181056.27632-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

As the default definition breaks booting angler:

[    1.862561] printk: console [ttyMSM0] enabled
[    1.872260] msm_serial: driver initialized
D -     15524 - pm_driver_init, Delta

cont_splash_mem was introduced in 74d6d0a145835, but the problem
manifested after 86588296acbf ("fdt: Properly handle "no-map" field
in the memory region").

Using new definition from downstream kernel:
[    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000000000000, size 16 MiB, limit 0x0000000000000000
[    0.000000] cma: CMA: reserved 16 MiB at 0x0000000000000000 for cont_splash_mem

Fixes: 74d6d0a145835 ("arm64: dts: qcom: msm8994/8994-kitakami: Fix up
the memory map")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v1->v2:
* redefine address instead of deleting it (as suggested by Konrad)

Kind regards,
Petr

[1] https://wiki.postmarketos.org/wiki/Google_Nexus_5X_(lg-bullhead)

 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index ffe1a9bd8f70..4f8a5f5cbbaa 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
@@ -31,6 +32,15 @@ serial@f991e000 {
 			pinctrl-1 = <&blsp1_uart2_sleep>;
 		};
 	};
+
+	reserved-memory {
+		/delete-node/ memory@3800000;
+
+		cont_splash_mem: memory@0 {
+			reg = <0 0 0 0x1600000>;
+			no-map;
+		};
+	};
 };
 
 &tlmm {
-- 
2.32.0

