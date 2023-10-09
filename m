Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD5497BE7E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Oct 2023 19:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377114AbjJIR1Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Oct 2023 13:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377281AbjJIR1Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Oct 2023 13:27:25 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62134B4
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Oct 2023 10:27:20 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2c007d6159aso56581421fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Oct 2023 10:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696872438; x=1697477238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2R4uCJ2+xyEcOVd7ZxW7I1CgwZZS79nX08oyF1QpfWo=;
        b=DzoTc7vzfbSV47KR128hqGljm8DC6Q2ir1oaxEHmRwbzuZR5gF87KSkuXNhWrpacxS
         Xkq1AFksl68+qI76DjZQ/bS5Skx74Swy6eJgLniqmHY79XMSzW/EEzaHte7YEViuOQWG
         bVyj4O5g9VQAhMwtWDsyKCwfN7TrgAewRaNyaaNr4kxTH8i9Ee946gRvhpbgiVQYHauY
         FHX2vPY+Fe4cGWodsEKp2KIXtsz8rq9WU3KILh2Kyz57ioIoplYaPiKLZvUPM49njUDh
         N2iz6vxJqc570FJywePIbMsisteS74AzsXMY4UJ2yc3siO8YWVgsmlLN6m/dojMgra6W
         BEFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696872438; x=1697477238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2R4uCJ2+xyEcOVd7ZxW7I1CgwZZS79nX08oyF1QpfWo=;
        b=se/kB61V/T2O7+xqx40GMaWmZcNSngHIouZs+2cZrhqayRhpaqVE0YSE6xarg8znmh
         R1KViL6TxtPiHtwSXbfDPdyvjM4ZuiN0z3NxtMikAl7feY1oZP7lYFzuVkzvukpq1zaD
         2HcZfPrSfGyX1gdtgTpkqSwO1C3Pm6wO7xsufXynQy4yyE90iuWpHeSddLeBXhMcpdLP
         AZ+RwZltu7ieTeG3zepETUA20S/OUZnAQSaD+aRs15qwwqYn/9ghBpGYI0FYc9P6B+it
         +ucI1SwYWwgmUuRTnRcEZL7dY6+QMxcnzYj96pt1T9jKLnPlXnNMZ6z+Z86Y9LKxn5Ir
         RweA==
X-Gm-Message-State: AOJu0Yxu817FQ8YJW24dqglTBorBOZCCRmmwklnlioJ0VKLgf2pOZ5Pu
        yApqjuUhaGArrJYIK7fpBPQjNaA6f/KJhDGKpO9OLQ==
X-Google-Smtp-Source: AGHT+IGxLCmHkuJUyDgOrSBrDUgDs0Vsq8PsfLRrNaRCnVKgY9jQ5J2OIFLW6zMIrKV6j2IxPYFT9A==
X-Received: by 2002:a2e:9650:0:b0:2c2:774b:3cd2 with SMTP id z16-20020a2e9650000000b002c2774b3cd2mr13953336ljh.21.1696872438564;
        Mon, 09 Oct 2023 10:27:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v10-20020a2e7a0a000000b002c27cd20711sm2105118ljc.3.2023.10.09.10.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:27:18 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: pad generated DTB files
Date:   Mon,  9 Oct 2023 20:27:17 +0300
Message-Id: <20231009172717.2695854-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Qualcomm platforms the bootloader populates device tree with some
extra nodes / properties (like memory size, boot time, etc). Usually
default padding is enough for the bootloader. But in some cases the
board will fail to boot if there is not enough padding space.

Add `--pad 4096' to DTC_FLAGS so that all Qualcomm DTB files get this
extra padding space.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

This is primarily necessary for SA8155P, but I have the feeling that it
might be better to be enabled on the global scale.

---
 arch/arm64/boot/dts/qcom/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index d6cb840b7050..8e9fa2539265 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
+
+# pad DT allowing bootloader to populate several extra nodes
+DTC_FLAGS += --pad 4096
+
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8016-sbc.dtb
 
 apq8016-sbc-usb-host-dtbs	:= apq8016-sbc.dtb apq8016-sbc-usb-host.dtbo
-- 
2.39.2

