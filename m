Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 61A52641C2C
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 10:44:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbiLDJoy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 04:44:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbiLDJos (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 04:44:48 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63036186F0
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Dec 2022 01:44:47 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id z24so10297682ljn.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Dec 2022 01:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKu9faA7/59qV7QxQwFzK/wBrXCx0yD95Y8bMCoS2Y0=;
        b=Jzj4+kLSwsYqbuc4Kv5YsB1pKFNG/X2ZfO0BjEjms2Ta5X42f4/1fAXlncu0uBz/it
         co1OcQo01hlT7Q9cfF+XpiRqZ5+ISsaMwekyjw8rPQ5Z8mOLH5JZPxf//MSF1bi+D1MK
         b2MUCO3wFWqTtqUKaJ+8Dmhfl/2dKSP2FVWIIS7381/3yGAW23D0Qldt2g+SxPRftuUt
         wUnhgiUWAeZN5B/iEF+8IuADVxTNtJrChSup6CZZ9DSCIZITgWPyjlsdy0vQUDuDtk7S
         sogrLB1Xt6ye5q4956yqnL2WqAEu0A5lNoK9FIjNoscIs7akCUFtrkGH+Tkf/3w5pwHf
         jjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKu9faA7/59qV7QxQwFzK/wBrXCx0yD95Y8bMCoS2Y0=;
        b=yU7zTT9kHc1E4QPm7JdH7Ddn0VOIHenXwm6thhJg/H857DfT3fNuo/xxOgyZaFRKky
         FQaLb2cXWezibrzzZ4r6q5JOg54NaNZmEp00BzBfwANFsa3e9oNFa+WxoC12R1zwehy2
         LVkU+qx0dFt/3hsibuqfyeAl4JeE/FhfsZd9oZg6W/3zvGk19OSP6gQ7vG0NyHjsG8At
         BaB/SoCBLbS+2y/mRxO71vUs7GF7UAB6WdOFOosmVO1V5vd/1i/96FpkC6OhN9dGr1Av
         hlleT3btWjAB20KeufWB5xKFhYADrL8AMX3xzK5wbSa0amkz0Mu/ZLHZOdx5KH37VTmZ
         wEgQ==
X-Gm-Message-State: ANoB5plS5Xa3ZOWoDU+riIJrKD3/BIi9yMB/TtNcO3irf8QamKhOEKMS
        kufFn1BjVtpxwoWVYgnx68OWVw==
X-Google-Smtp-Source: AA0mqf4U5+p12ydWYLf+78Pqtxy7V4aWj35qqstH/4gTxpn8MWzOT3wpvjbPHKvVXYxJAZHOeFmXnw==
X-Received: by 2002:a2e:b4a5:0:b0:279:8315:a253 with SMTP id q5-20020a2eb4a5000000b002798315a253mr15800839ljm.230.1670147085758;
        Sun, 04 Dec 2022 01:44:45 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o10-20020a056512052a00b004b07cdef19csm1711593lfc.138.2022.12.04.01.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 01:44:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/6] arm64: dts: qcom: sdm845-sony-xperia-tama: fix no-mmc property for SDHCI
Date:   Sun,  4 Dec 2022 10:44:37 +0100
Message-Id: <20221204094438.73288-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org>
References: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org>
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

There is no "no-emmc" property, so intention for SD/SDIO only nodes was
to use "no-mmc":

  qcom/sdm845-sony-xperia-tama-akatsuki.dtb: mmc@8804000: Unevaluated properties are not allowed ('no-emmc' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 51ee42e3c995..87dd0fc36747 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -376,7 +376,7 @@ &sdhc_2 {
 	pinctrl-names = "default";
 	bus-width = <4>;
 	no-sdio;
-	no-emmc;
+	no-mmc;
 };
 
 &tlmm {
-- 
2.34.1

