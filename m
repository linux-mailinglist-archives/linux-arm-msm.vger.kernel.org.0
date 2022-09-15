Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E03325B9EC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Sep 2022 17:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230083AbiIOP0k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Sep 2022 11:26:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiIOP0i (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Sep 2022 11:26:38 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826D94661B
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:37 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id l12so22637123ljg.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Sep 2022 08:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=88q0uaT0W4PSqz2n21mo6iTJbvDrBb3jnu7RufIt4VY=;
        b=wAN3FOF3hEFpYwMWYvqhPq39vrGFisBaJs6FFMbc0nL0pasCA2qwhlgcKBhoL+VUlG
         aWOkno162V8jGTtXffKCBZsLspiuS/7+WDTXBMIGwBQx40gbo+x8becGOM0l1Q+5fXwx
         aiROw9qcGcmQWvcQ4tBPr6G5s7ul4YDB+A9m3l9jAGnT3nGm43MjtbM36Agd3uab2i4Y
         hOKGFwgvvUE1JV9jwLvBpTjqISD0RU/3f9L3aHLW1h9i+r8W9A6hx40ZhInxab1aSzJ+
         4aDIkPU6hGEUmYIChY3uVfd5AICuWmkPB1P2z1uUqY1I7vQJ6QRZ6byK8fvx4QzND/zC
         MArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=88q0uaT0W4PSqz2n21mo6iTJbvDrBb3jnu7RufIt4VY=;
        b=wV3QG0d7WwKoZabu1Gy9pmYKXPs9ViZIp8E7xIGBPhJ4d+8eEx3PuYBfRRKTNBfBzZ
         cbETJlcmv+usKa+p1RK4f08k/vtxZngugGEza6HGlMjfNHVpah5QVc9Yt40JZGFNMX+e
         +slBR0PpxGQdj6lD5fi20NqagV4gy1OxvZhJjuK1omlsYC3956MFbwFvC6aZoS2dtmoC
         eEq/0xEtm5CZqucxJFSK/1pPkz0g2tI1W/Bu427A5geIMKOFF8zEWilXh7ZwqmKIA6Y8
         3pd7IKNqmunuLcgE5ZISuvnLmyUP3wLC6akNiTul8Chl2zayjE8e6Ytm4JfZAFXKGGkL
         RNzw==
X-Gm-Message-State: ACrzQf0mxdFJWhcx18sF/4obo5eYsECD1kZk1Xmq9uFAn37AkkaVE7Vh
        BgydDBm2XRJVwzMlKJiczjYenw==
X-Google-Smtp-Source: AMsMyM4lw10VeFu3E0HomBRlpIzoYW2T+ifnf18dQ20lZ7pmTiiozldysVSFXWginnN7HGaIiMFcUQ==
X-Received: by 2002:a05:651c:158e:b0:26b:46a6:bf63 with SMTP id h14-20020a05651c158e00b0026b46a6bf63mr80483ljq.21.1663255595584;
        Thu, 15 Sep 2022 08:26:35 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a18-20020a056512201200b00494813c689dsm3012653lfb.219.2022.09.15.08.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 08:26:35 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 6/7] arm64: qcom: dts: pdx223: correct firmware paths
Date:   Thu, 15 Sep 2022 18:26:29 +0300
Message-Id: <20220915152630.133528-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
References: <20220915152630.133528-1-dmitry.baryshkov@linaro.org>
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

Correct firmware paths for the Sony Xperia 1 IV to include the SoC name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
index d68765eb6d4f..ae867dbe4762 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dts
@@ -523,17 +523,17 @@ &pcie0_phy {
 };
 
 &remoteproc_adsp {
-	firmware-name = "qcom/adsp.mbn";
+	firmware-name = "qcom/sdm8450/pdx223/adsp.mbn";
 	status = "okay";
 };
 
 &remoteproc_cdsp {
-	firmware-name = "qcom/cdsp.mbn";
+	firmware-name = "qcom/sdm8450/pdx223/cdsp.mbn";
 	status = "okay";
 };
 
 &remoteproc_slpi {
-	firmware-name = "qcom/slpi.mbn";
+	firmware-name = "qcom/sdm8450/pdx223/slpi.mbn";
 	status = "okay";
 };
 
-- 
2.35.1

