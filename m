Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AF44734080
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 13:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231321AbjFQLVZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Jun 2023 07:21:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233241AbjFQLVX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Jun 2023 07:21:23 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5660B1BF3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 04:21:22 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-982acf0a4d2so224720166b.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Jun 2023 04:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687000881; x=1689592881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZL1MxmrnMLjXOdN7PqdtabXIscSWgRYLlooEyNkd6o=;
        b=uXCEZqSUQCsjbTb7rxnITAsipQIrfo2OpERLle9RfHUxlYsGTNwLXfXPAVYntwGua+
         Ly9gnxMDxV2UnCqzxeXgeRwJ4MzwJY2llh4NHodEGqbmGVCGFvInW4+XDZztH4SThR/G
         2Wk4pfxoUJUegaBK7Xn2pcyPQy/dZ007p3NH6/o/L0As+8DcREmhPiDQupLiCHpanpx0
         MxoKvHM3yzKK4Z3Q7oIt4JUvArF2fQL4HyCBhHV0tlI1W7pvHagT7ZHKuFf0ImYR8l6E
         xbtKd4OtvLNtzmDUNAFqlV8B67pDIZh89jkbgNbh4InSFxGHkE+Gew2ecdsO2gOjRbAr
         /uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687000881; x=1689592881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZL1MxmrnMLjXOdN7PqdtabXIscSWgRYLlooEyNkd6o=;
        b=b/J7SFKRAb7tezrOl5yZcGKJMrlJNCcuryZJh3sgFbWydm6HGZuYJ2rmhuVlLFJHGg
         SHXVOwZZf94wiSAy7V0xgCl61NLWr2sZFDYXhCyt1OxKFUEF2F78x4M6EosvFQrNxhrS
         MUw85NWllpDpM1HD9SMfOu2d8luY5u6VWgsvZafL2YyEctd73/Uyt3ZeQ0RZnSdD170s
         MPlzkuMJ1awcgfYkJ0nnKQKzt3Iu2oRHVvgPRFTzhMM6s9ydl1YKBy4R5pYw6TWQSeKU
         WUgDi1lk+63LAlRxlaEkOWWjnw2Ap0EvYWtB/oSyLvQTU0jKeVwB5kgZBzJuck2S9Cdo
         e9PQ==
X-Gm-Message-State: AC+VfDyhOvzAmsVtLmddYsfip8/QwJ2PGdaGBu15kCBi64YmtHBC9oGa
        iwAC5vih3VXx4z1LGvKibpvj2Q==
X-Google-Smtp-Source: ACHHUZ6Q1tQeQsUgVx9+z4S7v4vGWVbONeuCve387pnG9Xz3jjPhHSIimx/mAyCdRBe1FonP+DmqaQ==
X-Received: by 2002:a17:907:5c7:b0:973:e4c2:2bcd with SMTP id wg7-20020a17090705c700b00973e4c22bcdmr4379536ejb.18.1687000880698;
        Sat, 17 Jun 2023 04:21:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id k9-20020a170906128900b00965ffb8407asm11837838ejb.87.2023.06.17.04.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 04:21:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sc8180x-flex-5g: remove superfluous "input-enable"
Date:   Sat, 17 Jun 2023 13:21:15 +0200
Message-Id: <20230617112115.130024-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230617112115.130024-1-krzysztof.kozlowski@linaro.org>
References: <20230617112115.130024-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pin configuration property "input-enable" was used with the intention to
disable the output, but this is done by default by Linux drivers.  Since
commit c4a48b0df8bf ("dt-bindings: pinctrl: qcom: tlmm should use
output-disable, not input-enable") the property is not accepted anymore.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
index fe3b366e1435..b12e0a61b3c0 100644
--- a/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
+++ b/arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
@@ -497,7 +497,6 @@ hall_int_active_state: hall-int-active-state {
 		pins = "gpio121";
 		function = "gpio";
 
-		input-enable;
 		bias-disable;
 	};
 
@@ -513,7 +512,6 @@ i2c1_hid_active: i2c1-hid-active-state {
 		pins = "gpio122";
 		function = "gpio";
 
-		input-enable;
 		bias-pull-up;
 		drive-strength = <2>;
 	};
@@ -530,7 +528,6 @@ i2c7_hid_active: i2c7-hid-active-state {
 		pins = "gpio37", "gpio24";
 		function = "gpio";
 
-		input-enable;
 		bias-pull-up;
 		drive-strength = <2>;
 	};
-- 
2.34.1

