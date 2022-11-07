Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CFC761F6D5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Nov 2022 15:56:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbiKGO4d (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Nov 2022 09:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232621AbiKGOz5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Nov 2022 09:55:57 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C5331E728
        for <linux-arm-msm@vger.kernel.org>; Mon,  7 Nov 2022 06:55:45 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id bj12so30711628ejb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Nov 2022 06:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVyAxV2/Ap+1pDGDWF0TbDqECC41jjF33H2KqdYsdNo=;
        b=BnlKnuIYfXaFqqN5hrvkI2BjgiWt93UOehrBvXb7GAg2dQ63QuqgieY7baz4x9EH0m
         a34ZLehnVA+VEwf5YqHaMK7f0l0NvbLaoYBZkCA0COhBuvZfLLSeHZChunzVumeVsqpm
         Qq1rMjgaXvxRAYq7JC4RK6NpWTD40fPy83WHAwnrpADn2ZgcQ5Ar8EsySQGKFYQFFco1
         M27RG5ZOCUyT9iwD4E9SMXlcWGG/uQRwJDQtfYYpBuLKoTud9qBHpjx9C399JE8KhNoN
         Ov/uHVxGT6G05PUgkne92lwkNV6XFP5gbGk2rs7D/UowRqqxiJGQfQYklIwxeJxSJ32G
         E3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VVyAxV2/Ap+1pDGDWF0TbDqECC41jjF33H2KqdYsdNo=;
        b=KIjGD2cRaTfxRNAArv4U0tfxqr2dtQajNY/ozffrebVEHB2nVheQomyLM0G6p7JP1a
         05UgsksyFIBzmvyCuMJaMHMiSS4PDuRAq/Rrx8OTRbGrIypLAo2WVHrLFp4eoTZ0CDe3
         IXyNWr+p5lD2WeVgsEVX4acd3gyYPINQSGl9WKMom4U+UqBS977O3O80DmMNyiPeHGbY
         N75e4Ifg6l1ApuUqStxWlP+uFCyRc76XQLAAJDg/mzMgLyslYAaVuSQ3/YY+zfXSSWyJ
         S4iI1uQs6yfSKxtIsZ4E2LNscawjITGce4fZO8O0Z3zrALQBLKwK7SOKLB8ManJ6Powr
         UJdw==
X-Gm-Message-State: ACrzQf3KeIaCons8nuWZeBp3xcoBjHl5H/2LMqmPU/oo/Ey3KFj83kRT
        cyxAUl6aWf2c7YOwPEENcxcAeiUHQuw1cOk3
X-Google-Smtp-Source: AMsMyM4mHreMapXW/aoFyqF9dFeFptZ5GDs8dLkmrBFrRsI4VOppeL3Cs5Xq+fqogQgikuy5RWO2Uw==
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id g4-20020a1709065d0400b0077fca9f33d1mr48254288ejt.526.1667832944472;
        Mon, 07 Nov 2022 06:55:44 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id d1-20020a1709067f0100b0078907275a44sm3503049ejr.42.2022.11.07.06.55.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Nov 2022 06:55:44 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] arm64: dts: qcom: msm8994-*: Fix up comments
Date:   Mon,  7 Nov 2022 15:55:19 +0100
Message-Id: <20221107145522.6706-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221107145522.6706-1-konrad.dybcio@linaro.org>
References: <20221107145522.6706-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make sure all multiline C-style commends begin with just '/*' with
the comment text starting on a new line.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts | 3 ++-
 arch/arm64/boot/dts/qcom/msm8994.dtsi                      | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
index dbfbb77e9ff5..85abff0e9b3f 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dts
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015, Huawei Inc. All rights reserved.
+/*
+ * Copyright (c) 2015, Huawei Inc. All rights reserved.
  * Copyright (c) 2016, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021-2022, Petr Vorel <petr.vorel@gmail.com>
  */
diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index ded5b7ceeaf9..8e6c24782ad7 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2013-2016, The Linux Foundation. All rights reserved.
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
-- 
2.38.1

