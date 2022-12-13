Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF13364B617
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 14:26:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235545AbiLMNZ2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 08:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235546AbiLMNZZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 08:25:25 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA74D20375
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:25:22 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id x28so4873417lfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 05:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zbT0fafmzTHukwKRXE1XU496DYVTEGMa/YXTFnZk2Hs=;
        b=t+nh+QQwG1a3tUQ/DJyuMDQDHAF+B3fbEABr+cam+Z6IzFe6SqjafVZFGoLhxQqewX
         yqxSP+M0SCfyGDsGe2JUD1FYgWmgDM1SKaOREFgRlsjcoS4sZ7oDASIdmmawNF0jTaOU
         FB6S6658trp61k879qJJJQifXMMC3SRaw0iFBI6j4mKKeBMerpC9fwWtXiN2JaJCCxOj
         XHlZyVs8MukN6G5T0XiQptzkygqgKktSZ7gPWezL61sUgR7QWTwUscsab6bL6qxL9J+D
         MWe9+wQuK9LW2i50TLq/DlG7gPyEgV+xB0kvWHs0pIc7S+zDcQXnzXChoiDBLbNamv2t
         8PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbT0fafmzTHukwKRXE1XU496DYVTEGMa/YXTFnZk2Hs=;
        b=fO9Ky8voTqQVRO9H3wyw+9OO+eg8my9CIFNRr/bA+8poDlSX8Wrlp5alMY7vJU7PuA
         QVGMdcmrSu4PkHHIXa5GGBnA2FNN/qAbY51K/AYs8juYLmgs13MroziNc/JfC+NIBhtw
         jgUzKhYBjZKm4VqN70Z1mlSTezXix10WZzdI6KqFpMoB1Bg+VvxekT/Foltj3wVVJ6Zo
         gHQpm8ela3wcCm1lLFdAlbFu4iQ2nWouJtg4LPSF8D+euTUVmJ95tJSXjU2xoNrQOVsk
         4o1IE5sZsaGfxbfqB9/EpjL+e7ObVn7EiRHx5iwIAmoFjXpmc23UqsD3ZMJrUb9aucFT
         ofjw==
X-Gm-Message-State: ANoB5pmVjLKL17ppRTaoNqSbRbyCKv/B1ZofKPasbbPs/sl3ELDTGeoX
        mIbdReMGdGYp/Q0jkTgKqXUl1KHyKVbzNoo5
X-Google-Smtp-Source: AA0mqf6isKEIc0Od+et/Fjj46eJY5oJB/zV5/1mJn+DMAAO4ifVJV+bIKTTZRX3FWL2h6Wt7bnjXZw==
X-Received: by 2002:ac2:4e4e:0:b0:4a4:68b9:608a with SMTP id f14-20020ac24e4e000000b004a468b9608amr4437277lfr.21.1670937920436;
        Tue, 13 Dec 2022 05:25:20 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id k8-20020ac257c8000000b004b0a1e77cb2sm366564lfo.137.2022.12.13.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 05:25:20 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: qcom: sm8250-edo: Remove misleading comments
Date:   Tue, 13 Dec 2022 14:25:15 +0100
Message-Id: <20221213132517.203609-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
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

As much as it hurts me, there is no FM radio chips on these devices.
It seems to be present on Japanese models, but these are not available
globally and differ in a few more ways anyway (such as a super high-tech
NFC chip).

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
index fdfed4c3201e..bf484ee20b21 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi
@@ -529,10 +529,8 @@ &i2c15 {
 	clock-frequency = <400000>;
 
 	/* Qcom SMB1390 @ 10 */
-	/* Silicon Labs SI4704 FM Radio Receiver @ 11 */
 	/* Qcom SMB1390_slave @ 18 */
 	/* HALO HL6111R Qi charger @ 25 */
-	/* Richwave RTC6226 FM Radio Receiver @ 64 */
 };
 
 &pcie0 {
-- 
2.39.0

