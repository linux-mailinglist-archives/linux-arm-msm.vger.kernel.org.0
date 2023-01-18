Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE07671A66
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 12:20:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229966AbjARLU2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 06:20:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjARLTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 06:19:17 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4013D6843D
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 02:35:05 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id e3so24224283wru.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 02:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FneBkYyQ6xaqzMShBmUzlBY2+Gx/oH+DvIS8onnxBTM=;
        b=WzPbpXjfP/50g4douBX2JiZIhuFwpktydGweh0Bp+Ub86OVoiKnpD/3Ee0GJm1Rqfh
         USMtN+pmCtfvqzWzeHzaOWoTxT8WhNrSPSF5LBjIg1nz1MET5vCiHs7i4cl9rKIbRikm
         Sq6WO+IiLtkIsY0tx8S8fvk6e8x3twYAvYFldwDd0entrLkX3rLVL+x3WkXkTxk2WoV8
         rgaVd/uuNu274/igmP+nZNOzHpZ6bmCG2pgfWPCRRZb9PqwF5xwjUv8ShJphrj8p2uME
         5fHfgVecUsjGjsBIYFXNvRLPGlvVMKSiUFn7o0HU6OqZiRNH/r0yugJ//Oivh5+YXmGd
         36Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FneBkYyQ6xaqzMShBmUzlBY2+Gx/oH+DvIS8onnxBTM=;
        b=1ImTOZnYSR/TyxyQccE+VN8hr80bMvaerM1PwEF61yGrNqLpfLPXklI2qkvyFeqFOe
         tkvMjIs9OXU+fDvQW5zk1zBKbXJUUdHaVK/m+Tb7K7T8Uy7cw2IIHPTyjuZNKKf5BpJm
         NtPPNOF0QAOI7ynlueGVP8IGdaNgZesp5lwTBsDuiJJKM44toYDmbkwRrnHqOGgx8Dga
         tnwk+CyNWhZk61pImYukyYi8ZEY9vZ2CeSN6his+QJLF492kcJbqlRpgEbnNTBdHy03s
         8IjHSrI2aBGwR7OL82Uekxe7oTwOAdFiyn8nxKYyuC8NiBJsMIA1aYxF8LmQjo38HSwR
         Pdlg==
X-Gm-Message-State: AFqh2kqcurMFe98TcajzYq38jl4gKf6q1AV/YCbdbttyml/q+pIg/uUA
        eRzirgkHt88TV+UwxORmYe/8wQ==
X-Google-Smtp-Source: AMrXdXvsu9ri6SzVvmegPxf2Hi0Dil/3/MKkHw7o/CJzj9kIaCRYndOuIMzP0rA1U/3XuLQobgC1Ow==
X-Received: by 2002:adf:f74f:0:b0:2be:d02:1bde with SMTP id z15-20020adff74f000000b002be0d021bdemr5741157wrp.46.1674038103790;
        Wed, 18 Jan 2023 02:35:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ba29-20020a0560001c1d00b002b065272da2sm10076731wrb.13.2023.01.18.02.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 02:35:03 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH v2 2/6] arm64: dts: qcom: sdm845-xiaomi-beryllium: add generic sound compatible
Date:   Wed, 18 Jan 2023 11:34:54 +0100
Message-Id: <20230118103458.107434-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118103458.107434-1-krzysztof.kozlowski@linaro.org>
References: <20230118103458.107434-1-krzysztof.kozlowski@linaro.org>
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

Use generic sound card fallback compatible, because the device is
actually fully compatible with the generic one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. New patch

Bindings: https://lore.kernel.org/alsa-devel/20230118101542.96705-1-krzysztof.kozlowski@linaro.org/T/#t
---
 arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
index 64de4ed9b0c8..5de8b4c372fc 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
@@ -374,7 +374,7 @@ &sdhc_2 {
 };
 
 &sound {
-	compatible = "qcom,db845c-sndcard";
+	compatible = "qcom,db845c-sndcard", "qcom,sdm845-sndcard";
 	pinctrl-0 = <&quat_mi2s_active
 			&quat_mi2s_sd0_active>;
 	pinctrl-names = "default";
-- 
2.34.1

