Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1816575E6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Dec 2022 12:25:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232960AbiL1LZG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Dec 2022 06:25:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbiL1LZD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Dec 2022 06:25:03 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D5535F7C
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 03:25:02 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id z26so23226236lfu.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Dec 2022 03:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxQKtpqEKgNK0XIww8UA1aIJr9PXHMFG6enXL7OwExY=;
        b=X2yYaoQkwcf+fjR2y5L5/FMtbY5h8aX9N1N9MLHHS6HY/UL9kV694QTCF2e/AeMsh1
         W7odb08NMLRXNkwpjJCN4tEui8RbViWxpaMly2HfR2hq6FtaijaHAwAFATmukD5WyWMw
         Lv4v5DgUgVGyOgT/EsIb6ApRJxFY0lQjnOLKrago59JiGtyFbwK7E/1GpbNP1x24BFLX
         L9AYsu5cFf82wc3ERKcY0XB75hdl2Lz84SAtn23ISgvWO7sh0wqpVcZQPFMoxcR/PMvK
         MQii8pX0WE6t98maJQDYf4f9wU+JuxOJ2fAM6l5Z4Sfi1dF93awz40P75S8+QvfcovFI
         h2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxQKtpqEKgNK0XIww8UA1aIJr9PXHMFG6enXL7OwExY=;
        b=LbIlkPQN45x3fqauELN8T4DZaoLQcFUd2ShRfa/l8wPC6Z9G+jr6Y+Pk+fkk1V+M5i
         t72ZLe7o+zU7VqgOTMeQI5u/vLqE4KQtEbbZODMlvP/vSVsIdOEqJHnItRXMvXuWBCQY
         SYt+L05FlM9kjzpeVQt6Y/hlCrPTO8hAKVK9rcHPSTQyBek3oSulMuRvKsYcDJvj0u2O
         1TXMP2Gg/nxBGaTqAZmOBWyLYMpKohbzayENNXvNxX0USrYIK0thRKLHm7TGAMsDlfse
         YiMpRq62njuwP+TekY5bfvpUMjOfKKFcwl0NEOSOML9nqKWyVa+Xs2hHQ3qnT5D5/cO2
         IEcQ==
X-Gm-Message-State: AFqh2krmLTk8Z/W5ed7Nno8OtcZvEAw0TOg7GBp8VkAW/VPOOHFG4viD
        cs2mlHh4332+8SGYwol+6Ov0dw==
X-Google-Smtp-Source: AMrXdXtCuX1JohTI75HT0EnQ6wennnb5DL6K2v/XA9356DTxwFDa+hJP9kdXWCba5ho8k6zebHlwIw==
X-Received: by 2002:a05:6512:3589:b0:4b1:feb:a338 with SMTP id m9-20020a056512358900b004b10feba338mr6613067lfr.46.1672226700677;
        Wed, 28 Dec 2022 03:25:00 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y16-20020ac255b0000000b004cb0242704asm1627039lfg.255.2022.12.28.03.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Dec 2022 03:25:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8350-sony-xperia-sagami: specify which LDO modes are allowed
Date:   Wed, 28 Dec 2022 12:24:56 +0100
Message-Id: <20221228112456.31348-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221228112456.31348-1-krzysztof.kozlowski@linaro.org>
References: <20221228112456.31348-1-krzysztof.kozlowski@linaro.org>
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

This board uses RPMH, specifies "regulator-allow-set-load" for LDOs,
but doesn't specify any modes with "regulator-allowed-modes":

  sm8350-sony-xperia-sagami-pdx214.dtb: regulators-0: ldo5: 'regulator-allowed-modes' is a dependency of 'regulator-allow-set-load'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
index 4862fd69413e..a403fabc8da7 100644
--- a/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami.dtsi
@@ -171,6 +171,8 @@ pm8350_l5: ldo5 {
 			regulator-max-microvolt = <888000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		pm8350_l6: ldo6 {
@@ -179,6 +181,8 @@ pm8350_l6: ldo6 {
 			regulator-max-microvolt = <1208000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		pm8350_l7: ldo7 {
@@ -187,6 +191,8 @@ pm8350_l7: ldo7 {
 			regulator-max-microvolt = <3008000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
 		};
 
 		/* L8 - lcx.lvl (ARC) */
@@ -197,6 +203,8 @@ pm8350_l9: ldo9 {
 			regulator-max-microvolt = <1200000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
 		};
 	};
 
-- 
2.34.1

