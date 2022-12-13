Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAEE964BC11
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Dec 2022 19:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236552AbiLMSdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Dec 2022 13:33:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236598AbiLMSdW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Dec 2022 13:33:22 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177F724BD7
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:33:20 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x28so6359751lfn.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Dec 2022 10:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8l+ZRdexUJZDY+Gh4mGAra9DPiKGS/PdB/rIjuu7p+8=;
        b=yHSWR/sRtLF4N/ot8Q+lyX3uYvgn3mX0Gvmun4zuMErKRWn1mYfODYiewl5C5niL3m
         vDYtoMV9kzuYenEuGNvY7oUBrffH1oj0xtojxZxw5qX6R7elwiCPwK5AkZ3YK70G5FG1
         0FhZxsCa6fgR0JG/KUph3lEL5NDTSr0pjK7srQZXdPGpLshtlZGG1xrSIuCecw//Cei2
         xiusP+bo3viL/We2pZjwhSXKObhxKdPwlrGjH24NAnLsuXNxsxPj/pQnJVDOvAf2u3A0
         ts+v8gSoeO/OHPgTEn95aWOsi6U3jTtYVRytlZAbdSk6RfYzedNO/BNWhueUSavlltjB
         nD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8l+ZRdexUJZDY+Gh4mGAra9DPiKGS/PdB/rIjuu7p+8=;
        b=vZCmSrNSmgway3YpPt6Ztv30lyLoHQqEVWJ/WG+yCNJ/jiYByKC1VlN9AKvDzTNKRS
         WafhgRnedwVUBKDxuwtCo1ysKQVblLBw//EWByDD8v6Vmuq9rO469jH2Gb8RCaSB4zto
         wYiXkhyq/K8syLRqy34OxtoOzYEq18OIY1E+mhInedw2x0of6ScXgh+Lx6ecyp8HpQ7H
         Q5yyV5CkivkcJu1TYBG02j27t5rvnxM9Z76WUegPaolKjfeMYn2iXxTknRVlu9Lw08CM
         PiABZjOfjOhmZPQw7YyUBlXl+01L1dzuLlgOpsdLa/GjI/W3g/fn4uHpXcfr2VZPcu/6
         +FCw==
X-Gm-Message-State: ANoB5pnOs8+LIQfuwNOEUXgxydeq81GOr/qZDzCMbzqdKi1trAq8G5gh
        7QgxpgrTc8ebQkCrIsWoUoDAHauwULI/yM7Z
X-Google-Smtp-Source: AA0mqf6TZm7Tqi2o9NVrle+9b0P0OxDXJt5bOYFVL7Dwn2fjQXBfMO6pWm7fQHSO/SrA9aFf1cavTA==
X-Received: by 2002:a05:6512:22d2:b0:4b1:97ba:5716 with SMTP id g18-20020a05651222d200b004b197ba5716mr7566864lfu.0.1670956398570;
        Tue, 13 Dec 2022 10:33:18 -0800 (PST)
Received: from localhost.localdomain (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id t10-20020a056512208a00b004b501497b6fsm465963lfr.148.2022.12.13.10.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 10:33:17 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] arm64: dts: qcom: sm8450: Add fallback CCI compatible
Date:   Tue, 13 Dec 2022 19:33:04 +0100
Message-Id: <20221213183305.544644-5-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213183305.544644-1-konrad.dybcio@linaro.org>
References: <20221213183305.544644-1-konrad.dybcio@linaro.org>
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

Add a fallback CCI compatible, as required by bindings.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v2:
- new patch

 arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index a8f8ffd728d7..a9ed8443ac02 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -2554,7 +2554,7 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 		};
 
 		cci0: cci@ac15000 {
-			compatible = "qcom,sm8450-cci";
+			compatible = "qcom,sm8450-cci", "qcom,msm8996-cci";
 			reg = <0 0xac15000 0 0x1000>;
 			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
 			power-domains = <&camcc TITAN_TOP_GDSC>;
@@ -2593,7 +2593,7 @@ cci0_i2c1: i2c-bus@1 {
 		};
 
 		cci1: cci@ac16000 {
-			compatible = "qcom,sm8450-cci";
+			compatible = "qcom,sm8450-cci", "qcom,msm8996-cci";
 			reg = <0 0xac16000 0 0x1000>;
 			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
 			power-domains = <&camcc TITAN_TOP_GDSC>;
-- 
2.39.0

