Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42A035ECAF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Sep 2022 19:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbiI0RhU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Sep 2022 13:37:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbiI0RhR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Sep 2022 13:37:17 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F88A1D3588
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:37:16 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s10so11727181ljp.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Sep 2022 10:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=JHCjDmNzA6ce+e/MAOdHluOTeKhVdn9kfCUAVEme8Xs=;
        b=mhk+Uhfib8taALnFf8/xniduw3+f9fqWBosEOvmW0RP+YzzPWX0otS6Xg0zcxsa3PN
         F7otZwy1c4nAy1QSzOuASXh2fasJhsR7wYNO0t/ms1KXERmMeffzVfrHKPWoC2k84qgn
         yX4W6r/U2YS1lnTaJasw59a2L1zA/TvYyr6hObHfQKtnEQWYM7ItNccmi8CfehqTuUzT
         kI0YRRDhelmsJiOW1z0Z1srgQzUsqCpXqlLmvjvNxOxzFek+/HjW4cv/eEWedLUGJrPo
         1aWHCATaljztmHYIsZryuEqc3xXgppF3PPD57TLJoIu83tChvf1hRiITqQHz6leN6ieO
         m27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=JHCjDmNzA6ce+e/MAOdHluOTeKhVdn9kfCUAVEme8Xs=;
        b=kEXPxXfFb8MsfqfX1v3HB317b+CWdtZEjZ/9Yk2UuwEGGXpkWM5NONCO/j99kkJNRn
         ho4b2ueL/xzGOYjty2HdJro2Awnfg9crrLqapzvX3TLYigljYC5PCP1mAEoELSmKE1Yl
         JV6GYOvn6w1x0UWjq9m2HpGgXBgM3wpkZTY1Tb7LIy4qnIAtu2sfHNyvuPnkKSS1krAu
         +z3ldwKm+lU0sdmXL+3lQhJxXRRucVm/Hr7gPhaNQxai5LIJtVmwjCsw+inOF01wBSRk
         aVM9KU/FfHNQ83+KR/Iq8a+7LWxBHwdogKiBAUhwhqFJayIebiHCHsv6TipcfWKqzGsV
         Iz0w==
X-Gm-Message-State: ACrzQf0i95tvJP6Qld0uLmrrD/RpQGB7btXy6jbrHx9JTOOqy2S1lW2v
        2bbFO6vzrWzhSsKvQIedZS5qbQ==
X-Google-Smtp-Source: AMsMyM6Qmc8joGC1ysYB2a4vBKpzT8ZoKIWrGsfQyo4vhGORDJ60H2BrBGtdEP2ZO7JQXpFbFAv51w==
X-Received: by 2002:a2e:7217:0:b0:26d:b206:b3fa with SMTP id n23-20020a2e7217000000b0026db206b3famr155058ljc.323.1664300234401;
        Tue, 27 Sep 2022 10:37:14 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q12-20020ac246ec000000b00498f570aef2sm218879lfo.209.2022.09.27.10.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 10:37:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 01/34] arm64: dts: qcom: ipq6018-cp01-c1: use BLSPI1 pins
Date:   Tue, 27 Sep 2022 19:36:29 +0200
Message-Id: <20220927173702.5200-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
References: <20220927173702.5200-1-krzysztof.kozlowski@linaro.org>
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

When BLSPI1 (originally SPI0, later renamed in commit f82c48d46852
("arm64: dts: qcom: ipq6018: correct QUP peripheral labels")) was added,
the device node lacked respective pin configuration assignment.

Fixes: 5bf635621245 ("arm64: dts: ipq6018: Add a few device nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>

---

Changes since v2:
1. Do not switch to blsp1 (Robert)
---
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index 1ba2eca33c7b..6a716c83e5f1 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -37,6 +37,8 @@ &blsp1_i2c3 {
 
 &blsp1_spi1 {
 	cs-select = <0>;
+	pinctrl-0 = <&spi_0_pins>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	flash@0 {
-- 
2.34.1

