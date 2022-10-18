Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05B9E603042
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Oct 2022 17:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbiJRPz0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Oct 2022 11:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230417AbiJRPzP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Oct 2022 11:55:15 -0400
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907B94C607
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 08:55:05 -0700 (PDT)
Received: by mail-qk1-x72b.google.com with SMTP id d13so8911558qko.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Oct 2022 08:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RPPgA437V1xE/Sd/6wbe4ql0dEwhrHdqREnKkzkmpZQ=;
        b=VPc1HCsdnS+SKi+GJ7DfTCl2EUdnqI11sd486Qdd5bavBJW4Hy/gWqQNY8/ut8t60D
         1MLFR7am1lPTixWOgjBRn3vxK+cR4HZzjcMHEUDE2HQOvF4aJhy0bH8a9hrbJoN3rmAJ
         73/CrBXE0ZrI3o3Fhf0E/57Azx76r+jHuTGI1fxUsGWB9rTPgofvBOJH9qD+/BvK+/hz
         SZDbMgxbnqKnF77HVhqxU0v8URoCGjh6QnqFClLezlxa1IlYOf+Rqcth+Gh3DHKKgCJI
         ueLjWvxG1MQOqiD7afAl/9tmh3SkUlIJYVNhE/rQvG7EsbV6t6fBPpNHj77zCIh0trV+
         asOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RPPgA437V1xE/Sd/6wbe4ql0dEwhrHdqREnKkzkmpZQ=;
        b=VU5XgOed58Bcxaq7PZEqhF6n2BFzHUOxGPsCIE7+BWejJGNT+bIQfgFrfqXVmvwKop
         kvyckn4Htg7RiYfamJsoj9+pyEBAV9HplkMiofyFXBpDBjsisc1eqiOwyP3NEeLg2UbB
         1SgG0sp2uM+dM+s9PYZeZRBYtn6ZTD2IXtWLFPoW3cR5NTexRX09RJQ0CEC1W9TkgjFN
         RhHeuXeOXtjgLPAIhHbc2r/8IqDLBsGSlm4nQXMD28Ndu/8NEms9XNEiouLFYFh66uAb
         gwboPMY+loAFr3rnE4880VbdZ4QINynnc6lPL1kY++51cF4WLYYmGcqLCESjqyBIoj4B
         W5WQ==
X-Gm-Message-State: ACrzQf3wvbLmI2sEMKrn5tCnNEkjDSkHADWV8GXzsU5AVA2uHSUFTJEm
        TtdXAstkSdu9nN2pfVkemeTxww==
X-Google-Smtp-Source: AMsMyM66RyEtXOEltDnHK/mcH6KHBMw0PtMv9DFIvJALMpC9nwKuxfjKs2XHn74kMZwBL6dvY5zvyQ==
X-Received: by 2002:a05:620a:1b9b:b0:6ed:35f0:9b56 with SMTP id dv27-20020a05620a1b9b00b006ed35f09b56mr2386303qkb.196.1666108504282;
        Tue, 18 Oct 2022 08:55:04 -0700 (PDT)
Received: from krzk-bin.MSRM (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id do20-20020a05620a2b1400b006ec9f5e3396sm2694658qkb.72.2022.10.18.08.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Oct 2022 08:55:03 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] arm64: dts: qcom: msm8994: Correct SPI10 CS pin
Date:   Tue, 18 Oct 2022 11:54:48 -0400
Message-Id: <20221018155450.39816-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

The GPIO55 is part of SPI10 pins, not its chip-select.  Probably the
intention was to use one of dedicated chip-select GPIOs: 47 or 67.
GPIO47 is used for UART2, so choose GPIO67.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. None

Changes since v1:
1. None

Not tested on hardware.
---
 arch/arm64/boot/dts/qcom/msm8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8994.dtsi b/arch/arm64/boot/dts/qcom/msm8994.dtsi
index ded5b7ceeaf9..7a582a5fe3a8 100644
--- a/arch/arm64/boot/dts/qcom/msm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994.dtsi
@@ -897,7 +897,7 @@ default {
 				};
 				cs {
 					function = "gpio";
-					pins = "gpio55";
+					pins = "gpio67";
 					drive-strength = <2>;
 					bias-disable;
 				};
-- 
2.34.1

