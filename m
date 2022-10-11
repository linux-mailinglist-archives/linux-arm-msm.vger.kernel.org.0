Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 783A85FBCFB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Oct 2022 23:33:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbiJKVdv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Oct 2022 17:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbiJKVdv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Oct 2022 17:33:51 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9D792F5A
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 14:33:49 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id hh9so9113240qtb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Oct 2022 14:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=izSN7xRQqssnM767hbIgGLtwY0E8L+UfBxDaexTRlTs=;
        b=LJ/mZ/SK8hZ2IBxXtIV+ppbukcjjSWFMzSzbFsUNLgRVBEU14F9GSk99h7YV+WH+c6
         qEM5Ye/I1UWStx6bpPQOojVrlRgvRcubJTY4QG9OjYKcIcsbM2vNtAljcYbFY2eNSHaf
         tesbQaLeP4hjjNHuhb3kTXTkojkAlc9r5duCN0RSDCEIjX0dvo8z6b2UOVfSYEjXEGr5
         7uOO5VwXgn/+q3mkxrXBy1Sz8BfO/RRseoFxT2IMott9p5vVvjvFZw8rkDoF9CWoZUn3
         16ES+3Wy2Z1OghwCi7877qIQUUr000y5nrtfPjpN/9oySYhAPU9XY7EsVZ8feS6wRBIs
         BiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=izSN7xRQqssnM767hbIgGLtwY0E8L+UfBxDaexTRlTs=;
        b=MW6L/eWZBRIc8ivyzZ4kFqmUy9naPFUY/BY61vANUKIbGPeJmB5r/nC2WtRcvrOBE8
         SpQBilNowQ5ISTDdxEwSR2lEpNi21wL2+HsNC4X2pl9vSHWIsVo7tz28ynDblfpIQ82z
         SFHO6ZHhLaM4cRSsZkWWMogY1T6gETxEOdSNUqbxQ1BK8RKFs+65sooNuRE9R+n2Y6ka
         rzfiYEdBmUBtqS0PJtSPB+KcNifxyddoLHnEliGkstA4NLS/A/YzEA4yoa00X9lSfwge
         2qL3z2d34PZYttRWzwikmRNCISFKAnVhi2LbOoq807ofT9kkjjcCK0pfo8Ye8HBuzDDX
         4tng==
X-Gm-Message-State: ACrzQf3TS7TLwmSR+DtrclJoXonY2PJIT1ahcYiIkOgtpJzPc0S00ZXE
        EjlPBrJp3Op6I8rKaBK+B19P/A==
X-Google-Smtp-Source: AMsMyM6CGda+/xijTP913Zy52gAgNbuE3rYSnAbBSG9dwkAU7IeYPLQvHwLMbCVrJtWti+BHCpwKYg==
X-Received: by 2002:ac8:57cd:0:b0:39c:bb4c:565b with SMTP id w13-20020ac857cd000000b0039cbb4c565bmr1666419qta.115.1665524028594;
        Tue, 11 Oct 2022 14:33:48 -0700 (PDT)
Received: from krzk-bin.home (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id j20-20020ac84414000000b0039cbb50951asm604224qtn.24.2022.10.11.14.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 14:33:48 -0700 (PDT)
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
Subject: [PATCH 1/4] arm64: dts: qcom: msm8998: add gpio-ranges to TLMM
Date:   Tue, 11 Oct 2022 17:31:42 -0400
Message-Id: <20221011213145.122879-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Qualcomm pinctrl bindings and drivers expect gpio-ranges property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index f05f16ac5cc1..2c4acf227253 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -1056,6 +1056,7 @@ tlmm: pinctrl@3400000 {
 			compatible = "qcom,msm8998-pinctrl";
 			reg = <0x03400000 0xc00000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-ranges = <&tlmm 0 0 150>;
 			gpio-controller;
 			#gpio-cells = <2>;
 			interrupt-controller;
-- 
2.34.1

