Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9A0B6E3821
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 14:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbjDPMiE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 08:38:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbjDPMh7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 08:37:59 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF2CB4C0B
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:57 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94f3df30043so33375766b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681648676; x=1684240676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gzkej2x000un3WGEKUhC8eQaJi6H3ktLZIrlxCRrcMo=;
        b=qo4BIIlX4bgK0NF/G72Fx/VoeyKha37jz3aQ6P8tp5b9nwn7MHZN5BrVjAN+Vp0e6g
         01AFHwzWrWIkLhbTjWdAzh39wSSU1BKtsCzCKKPurXi6mGFl5zykxM1yll/6vtrYuJPm
         4odLTNF+xz64k7czDdTyC7N2UGeHkYKFrKyogdhBW89ELRUEvWmAc0T7hCjKlXUywqYO
         xlqLnvGlNLNpTUlhv4oEynWGnqaxCsu5VgOC1oC1DWGGV4H4Lc3cPShInbwMGkE3HAmd
         /D89u5D64Jfmq/RucK9AxiyWzhyoOkatZuI3ZNNPvK0HqvyLBSYCSmNARqYsnqcCx4PQ
         VFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681648676; x=1684240676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzkej2x000un3WGEKUhC8eQaJi6H3ktLZIrlxCRrcMo=;
        b=Is+Ukf/+buCZffX/CL4qsz8bBYOLuJ6GgLSOAEqwWvP+oLgIXyW+yuOol11t5o5lf9
         2ATWKdtblA36vyK/BWNdnS3RimspBr0FyWFyNoN/l9vOrNSB1JzXHjR5UF4BwV0VB02x
         pS4yLgVWtl7FwAHKrGBvkhYa9Cromg9pJCqPev99SjltcPJ5UdHuSuBFKNIH8+ogJw+O
         noTjimI64F66KoARqDd2UG1dDcTv9Y9XVyfmfZxoaFDdRV2KenhZPFH1DH0/w3OgZajZ
         5Ug5xlgSD+2rykLzlBHHXTkhgYnGodG7y1Zu3cPHPY0M3vziEbZY9x6Ydi/5HsMZjsl9
         eGKA==
X-Gm-Message-State: AAQBX9eQZNNQTaN6C2GiwjwtR4SWFXcbF9LWyv8XPcVaW91i3npM1+oR
        52fH5x4CLJnefazjFWfjmCwe1g==
X-Google-Smtp-Source: AKy350a6gUuMVOfmrXHn95EAsIXblaGeEbqdWYK2rSkITRfPK/3aKWXxhzpqXIPrpi4sYfiZJtCm3Q==
X-Received: by 2002:a05:6402:202f:b0:504:ecfa:fa6c with SMTP id ay15-20020a056402202f00b00504ecfafa6cmr10953266edb.1.1681648676299;
        Sun, 16 Apr 2023 05:37:56 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7de97000000b0050432d2b443sm4556889edv.48.2023.04.16.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 05:37:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/6] arm64: dts: qcom: sm6125-sprout: align ADC channel node names with bindings
Date:   Sun, 16 Apr 2023 14:37:30 +0200
Message-Id: <20230416123730.300863-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
References: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
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

Bindings expect ADC channel node names to follow specific pattern:

  sm6125-xiaomi-laurel-sprout.dtb: adc@3100: 'adc-chan@4d', 'adc-chan@4e', 'adc-chan@52', 'adc-chan@54' do not match any of the regexes: ...

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
index b1038eb8cebc..a7f4aeae9c1a 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
@@ -138,7 +138,7 @@ &pm6125_adc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
 
-	adc-chan@4d {
+	channel@4d {
 		reg = <ADC5_AMUX_THM1_100K_PU>;
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
@@ -146,7 +146,7 @@ adc-chan@4d {
 		label = "rf_pa0_therm";
 	};
 
-	adc-chan@4e {
+	channel@4e {
 		reg = <ADC5_AMUX_THM2_100K_PU>;
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
@@ -154,7 +154,7 @@ adc-chan@4e {
 		label = "quiet_therm";
 	};
 
-	adc-chan@52 {
+	channel@52 {
 		reg = <ADC5_GPIO1_100K_PU>;
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
@@ -162,7 +162,7 @@ adc-chan@52 {
 		label = "camera_flash_therm";
 	};
 
-	adc-chan@54 {
+	channel@54 {
 		reg = <ADC5_GPIO3_100K_PU>;
 		qcom,ratiometric;
 		qcom,hw-settle-time = <200>;
-- 
2.34.1

