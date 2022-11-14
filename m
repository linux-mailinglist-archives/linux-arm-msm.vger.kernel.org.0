Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC3DE6281C3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Nov 2022 15:00:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235900AbiKNOAZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Nov 2022 09:00:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235625AbiKNOAX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Nov 2022 09:00:23 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589DFB86C
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:00:22 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id j16so19356219lfe.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Nov 2022 06:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VxPQ8pboaPVF2sJHi52Vka5fwCNauq6OSSF8aRmq/H0=;
        b=S4znJaczEK246Yzk+YOpXjq34r7eQ7lk7NgLbFfJDA410Mvfpv6ffI++LTktx1dHF+
         8jfleCZ+jpUDe/bTfK8uw1mHSSkibeoMxh62i/llK/sqs4AL67zMxQIkfgw5Dwi64DO1
         l2x3OF62WEGgdBEspccGmA7jlxAgBNgannoeKbVSC/fIN3yG8toZQqB0sOQ5pPklVTw5
         31URTGvzgReJaSyOBmZj8roWHKqR57hxGK1MkaoFydXe7Fh5Rr+ao/MSLkNffuJv/E5N
         KbPitKZjk4N4DndOq9HyXiBUwLIjt3X/DyI3KNXMoz2roQOEggp0y5WnMl+UpBetQ78n
         pNVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxPQ8pboaPVF2sJHi52Vka5fwCNauq6OSSF8aRmq/H0=;
        b=wZ5wNGHN+RJ/dhtPVlxPBMw0rEpJmWpeihWAU6nDmiRqRTDT1hT8LX/SvWyz+t4kpe
         vfrj5FObasX7Dovtr+0JCXWvN7cHNbEXkeHamBL1kKgoXyEUZfu9ZAQcTLmrXFDDuOlp
         1VLkbTnWLjJQn47CY9DV2179ze2yMkK+abPbipu14/0goUcKg23Qt5ahSIZug8++LOo/
         7u4bUGBRYLJLMNS4U8wuxX4UfDrEkkjBz2/2ZI3oAyYelat30CA+C2nWGQrHa67y0z6K
         anQWIyOnp/4NjjcsjUnXZJOOntOWxb49D5VLvG4oF+ovT3Sm4Qq3UI4tyJnf0/FvJxP2
         wR9w==
X-Gm-Message-State: ANoB5pmivRydWB7Rr31XdNQjEsmpL8Gdqhk51bNK/3whIW8RlxpjWF94
        CDpPKFU7hXgWxNNVfddOrOyICGm3ja9vkB0b
X-Google-Smtp-Source: AA0mqf4/a/jJiXWvPvOe2T+QxBTrvQcAuvmN52Dp5+4lky3TG8hR1K4ZgfQ+zays2OXB58zZRVfGxA==
X-Received: by 2002:ac2:46fc:0:b0:4a2:22cf:f44d with SMTP id q28-20020ac246fc000000b004a222cff44dmr4369084lfo.118.1668434420376;
        Mon, 14 Nov 2022 06:00:20 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id z8-20020a2eb528000000b0027628240ff7sm2017813ljm.135.2022.11.14.06.00.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Nov 2022 06:00:19 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sdm845-polaris: Don't duplicate DMA assignment
Date:   Mon, 14 Nov 2022 15:00:11 +0100
Message-Id: <20221114140011.43442-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
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

The DMA properties in this DT are identical to the ones already
defined in sdm845.dtsi. Remove them.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
index fc189f7caaa4..38ba809a95cd 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
@@ -456,9 +456,6 @@ &ipa {
 
 &i2c14 {
 	clock-frequency = <400000>;
-	dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
-		   <&gpi_dma1 1 6 QCOM_GPI_I2C>;
-	dma-names = "tx", "rx";
 	status = "okay";
 
 	touchscreen@20 {
-- 
2.38.1

