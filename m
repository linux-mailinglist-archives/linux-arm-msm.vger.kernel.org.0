Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B593B0D35
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 20:50:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhFVSwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 14:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230338AbhFVSwu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 14:52:50 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B25AC061574;
        Tue, 22 Jun 2021 11:50:33 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id d11so22463322wrm.0;
        Tue, 22 Jun 2021 11:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ymn2ujEeY6oJ4oL78YojKS6KcK/orRr62G2d7Yfzl6g=;
        b=lF7YKeBsLd2o8Jq+VltN6ixJhAUL/G9JVm7KXO42b1aBJhenGcv5CMNPduKDVm5seF
         RvjK7DVo94pMtrs7ryfQYAWbeCKP9HIEQZYt2Jvr7wCcfMCXW1+OBGk+vAoovj9tbwKP
         GV2/nL59jvj6qXzOUNKZFtpKCefTb8K/Xft1S4Q8gTy7N6Dz9NZq3FQhH9DK0nkeCcml
         p+f47PWGBpoPq5IjhMh+AEDpIpUIjaULkhEWW/FSWwhzdySQMHEmUiYlVj6ZubIinUM+
         RfovhpeD15dyM0Jw7FgUGEbB/CvtI2TYKgAUlx0C+ChNJqSN6v0CHs7c5RlN7lVE0Ngz
         A8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ymn2ujEeY6oJ4oL78YojKS6KcK/orRr62G2d7Yfzl6g=;
        b=TVsIDColcL0Rvz/sr/jgnIXX+ZUvAGt3n4h6QN+IDk5pLYm+5XAEEKTloz77RfCn3V
         k5Sj2gttnR7fxd9bA34pQo+LR7cZeyb+lguW3lsSPcn7NVICDE0yG2XOe9IO4FSqXSbM
         cjzCZxyii+11dTBEQCjTEdwSz5YRhFi+PO2sVnvTTDWyF89w+T9YnNRK9e4EnZGXnaY3
         nk3EKXAIVbqgns8B25NEQITRB1M/PkXji/duYefEpQXJQvAE1tjpbeJb4FKKpDx4EYMW
         uKGqOPJu54BIMkqHMvKu1T09oiSMgO509WMqYKwvQxkFexkr6bd+dt57piNfQXOfTBKt
         koJQ==
X-Gm-Message-State: AOAM5327xbh7d7ViyH6AeLcyKbU/IfS4b8+UJEx7Ga1U9CrqmRtdX+qZ
        0d9qnRjtpPWTyk6jTnEOBu/JdEhCh1TYlQ==
X-Google-Smtp-Source: ABdhPJzFx8IOyRsXzkfqcLyyFcJUKDiL9v7gcc/yG06D3dFoyL2uMAsEbm9kh5ICld2RH5iKU2rPFA==
X-Received: by 2002:adf:9084:: with SMTP id i4mr6648039wri.23.1624387832186;
        Tue, 22 Jun 2021 11:50:32 -0700 (PDT)
Received: from dell5510.suse.de (gw.ms-free.net. [95.85.240.250])
        by smtp.gmail.com with ESMTPSA id y16sm207243wrp.51.2021.06.22.11.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 11:50:31 -0700 (PDT)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v3 1/1] arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem
Date:   Tue, 22 Jun 2021 20:50:23 +0200
Message-Id: <20210622185023.14597-1-petr.vorel@gmail.com>
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

Disabling it because downstream kernel does not report where the memory
is allocated:
[    0.000000] cma: Found cont_splash_mem@0, memory base 0x0000000000000000, size 16 MiB, limit 0x0000000000000000
[    0.000000] cma: CMA: reserved 16 MiB at 0x0000000000000000 for cont_splash_mem

Fixes: 74d6d0a145835 ("arm64: dts: qcom: msm8994/8994-kitakami: Fix up
the memory map")

Suggested-by: Konrad Dybcio <konradybcio@gmail.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Changes v2->v3:
* get back to v1 which just disabled the node
* use alias instead of memory@3800000

 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
index ffe1a9bd8f70..2c1881a22fee 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts
@@ -1,12 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2021, Petr Vorel <petr.vorel@gmail.com>
  */
 
 /dts-v1/;
 
 #include "msm8994.dtsi"
 
+/delete-node/ &cont_splash_mem;
+
 / {
 	model = "Huawei Nexus 6P";
 	compatible = "huawei,angler", "qcom,msm8994";
-- 
2.32.0

