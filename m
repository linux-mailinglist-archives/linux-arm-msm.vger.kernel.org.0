Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7FEC96FFDF0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 02:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239618AbjELAch (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 20:32:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239365AbjELAcg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 20:32:36 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE085B8B
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:34 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4f14f266b72so8251142e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851553; x=1686443553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzmUcAFcZdFCEwI+FLrPfYHPtwRzIfK4E9usXEvVYb8=;
        b=nSdfj1AusN4D4fXIV7azWczHB3vWgf0G6CvZuKLPIiUlKV8zxSgIrCGejGRbt6KEKd
         0LWUR4/q8gfMpRf17qxJpDFAkvyfT1i/T48Ga8OloQJuxjXctLJlFpR9pozklbWD8Ak0
         W+lm4H+O55fqGQTJXeV5T3QT8wvJftRbU56j4vZvwd1n6x5P4Ws65s3Mcu5pbMgMAmL+
         GE+OYQeBZfJOh4GGcwawhJPqCB8raAImzjImT5ohm3jz21ZsFHtu2V3uRnjMv7ZM9eS0
         1FC4weVvWenh3IYZgLpj5maZDRe4ajdgcsH32C6mhU64jclFjHa3smL4UJLZ8TWvT4wo
         d3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851553; x=1686443553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzmUcAFcZdFCEwI+FLrPfYHPtwRzIfK4E9usXEvVYb8=;
        b=NBULRyPXOmMHmsePlk3txvHIu9I1UNXsnFcdPPkJyfwuKgLGlkSuTw8+RKjM8X7pJV
         M/hC5V/16+IJ88u7GOhkZj4DIWaxn1Gn7wqw1ASuQVZnvutEuSeJT7C8SSTOJ5cnHuFa
         l+rL/WifCF/DGfCUwaVAbaF388YTka8Za/AtxaUpaiDT1LKmHDjw/VCfrkhtH/jrSfrF
         m55s3Mr+YO3YuNl7sN8C5WQ8dl2SsPOCZD1rFnE9eGJXq5/FRYJgWM+3RfMo9xOpwXI1
         q050GYJBr3619uotZHbHN/qk9fnyYeXguz2ojZq6yHqPLogDk1qAKX2BC8thhGvwrof2
         O57g==
X-Gm-Message-State: AC+VfDyDcTnwMSDiqeeMRrkHSSSpMtowll1yKgL+ARbjm/FehFc+CbRg
        5kOBQ0FjyQkC5+RvuiJLqQCmVJAhlQPOaoSK+wE=
X-Google-Smtp-Source: ACHHUZ7lc8hdp/YMBka+KN58HpBeEOK5I1UMUYKXzz6REkRekLL68Sr+IywqabAfBF+oWPE7OijnUg==
X-Received: by 2002:a05:6512:6c:b0:4f0:6a4:1386 with SMTP id i12-20020a056512006c00b004f006a41386mr3061220lfo.2.1683851553239;
        Thu, 11 May 2023 17:32:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:32 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 02/10] dt-bindings: clock: drop qcom,lcc-mdm9615 header file
Date:   Fri, 12 May 2023 03:32:22 +0300
Message-Id: <20230512003230.3043284-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The header file for qcom,lcc-mdm9615 and qcom,lcc-msm8960 is the same
(as well as the drivers). Drop the qcom,lcc-mdm9615.h in favour of
qcom,lcc-msm8960.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/lcc-mdm9615.c               |  2 +-
 include/dt-bindings/clock/qcom,lcc-mdm9615.h | 44 --------------------
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 include/dt-bindings/clock/qcom,lcc-mdm9615.h

diff --git a/drivers/clk/qcom/lcc-mdm9615.c b/drivers/clk/qcom/lcc-mdm9615.c
index 8d243e880d95..c17caffdc349 100644
--- a/drivers/clk/qcom/lcc-mdm9615.c
+++ b/drivers/clk/qcom/lcc-mdm9615.c
@@ -15,7 +15,7 @@
 #include <linux/clk-provider.h>
 #include <linux/regmap.h>
 
-#include <dt-bindings/clock/qcom,lcc-mdm9615.h>
+#include <dt-bindings/clock/qcom,lcc-msm8960.h>
 
 #include "common.h"
 #include "clk-regmap.h"
diff --git a/include/dt-bindings/clock/qcom,lcc-mdm9615.h b/include/dt-bindings/clock/qcom,lcc-mdm9615.h
deleted file mode 100644
index 299338ee1d88..000000000000
--- a/include/dt-bindings/clock/qcom,lcc-mdm9615.h
+++ /dev/null
@@ -1,44 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2014, The Linux Foundation. All rights reserved.
- * Copyright (c) BayLibre, SAS.
- * Author : Neil Armstrong <narmstrong@baylibre.com>
- */
-
-#ifndef _DT_BINDINGS_CLK_LCC_MDM9615_H
-#define _DT_BINDINGS_CLK_LCC_MDM9615_H
-
-#define PLL4				0
-#define MI2S_OSR_SRC			1
-#define MI2S_OSR_CLK			2
-#define MI2S_DIV_CLK			3
-#define MI2S_BIT_DIV_CLK		4
-#define MI2S_BIT_CLK			5
-#define PCM_SRC				6
-#define PCM_CLK_OUT			7
-#define PCM_CLK				8
-#define SLIMBUS_SRC			9
-#define AUDIO_SLIMBUS_CLK		10
-#define SPS_SLIMBUS_CLK			11
-#define CODEC_I2S_MIC_OSR_SRC		12
-#define CODEC_I2S_MIC_OSR_CLK		13
-#define CODEC_I2S_MIC_DIV_CLK		14
-#define CODEC_I2S_MIC_BIT_DIV_CLK	15
-#define CODEC_I2S_MIC_BIT_CLK		16
-#define SPARE_I2S_MIC_OSR_SRC		17
-#define SPARE_I2S_MIC_OSR_CLK		18
-#define SPARE_I2S_MIC_DIV_CLK		19
-#define SPARE_I2S_MIC_BIT_DIV_CLK	20
-#define SPARE_I2S_MIC_BIT_CLK		21
-#define CODEC_I2S_SPKR_OSR_SRC		22
-#define CODEC_I2S_SPKR_OSR_CLK		23
-#define CODEC_I2S_SPKR_DIV_CLK		24
-#define CODEC_I2S_SPKR_BIT_DIV_CLK	25
-#define CODEC_I2S_SPKR_BIT_CLK		26
-#define SPARE_I2S_SPKR_OSR_SRC		27
-#define SPARE_I2S_SPKR_OSR_CLK		28
-#define SPARE_I2S_SPKR_DIV_CLK		29
-#define SPARE_I2S_SPKR_BIT_DIV_CLK	30
-#define SPARE_I2S_SPKR_BIT_CLK		31
-
-#endif
-- 
2.39.2

