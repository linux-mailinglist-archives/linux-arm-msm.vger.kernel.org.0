Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C68D6B764C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 12:42:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjCMLmi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 07:42:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231222AbjCMLmG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 07:42:06 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C88CD664C6
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 04:41:34 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j11so15267020lfg.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678707686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RH10IfoWhFhfMN7U8guTBq/z8yFM8bycsFPXU+lvHyE=;
        b=xT30oxgN4y6Rar0wqRH4afPyKNC4nqyZTJ8SIeW/1FIly1DqrAbpUWyajxrBMlL6xa
         IC1FXWHVX+AI48ZCLgJ58xxG6Bol9YXcvtHOPuaG4YTrwdkqpFtd2v2mtxKPqthncZLV
         DFF7IXyFJhq/WySK/632zrh+rKhWbl10XPV5Esx0ACxHhSTN1ojE8KYE9vQ2vkOj184c
         2aXQNlVC6sDdm+H3kH44c3ShSNXQstXCMBEAUg4t4XBFzGLomILmQzdB7FxatkK+FaYH
         CEJu8+Fv2iRDSx0oRLVT6MGjysxonOiP/duwhSlP1B6I5GQjrLfcIrQFsDlYPGokBTmq
         MeRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678707686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RH10IfoWhFhfMN7U8guTBq/z8yFM8bycsFPXU+lvHyE=;
        b=aLw8slhNQ6iewv1XJPqD7vUo2U6fWKJWzucX0Osq4oQFAnH0J6wGVa0ZdMQJG0GOwC
         Q7ovFnttYr0ewtws5rvWolxzoP71vMDP7KIQuB4cNwoLP+BvHe3IpPG5zRPdMJguuuXp
         WjWc/rSqTDzHHbdeUtNnUvD00uqNmEqqDyZKNgzMbDg/2NC0Ociyt+JfWXQAwvMfwVk9
         fJJTA5T81MWK8rBhUVWoSOxEGLJMSpbDuI4XiTDFBAsA/w3aIsKT6jeAx/0rnmpFMPa/
         gfqJmUc4nkcMax0bcAzLBvYqojyZ+X0dUeWsX33HukEoH3B4Hujq7TOpNrlsNsLrPhMz
         67Zw==
X-Gm-Message-State: AO0yUKVrylYCEvyDQo7WiqeYjITohw+TH9b97if9sgJ1quLb+3D0c4qv
        ZNjb8kVSodd2SSabMI8x6W+RrQ==
X-Google-Smtp-Source: AK7set/tI4nk7AoITBvfoTwGu0Y7NAxmBwOlHtVgi7aTL3sLkjBEvxxpJ+ZblFUd2oU/KXkw05pmFQ==
X-Received: by 2002:a19:7614:0:b0:4e0:ce21:b92 with SMTP id c20-20020a197614000000b004e0ce210b92mr10348746lff.16.1678707685996;
        Mon, 13 Mar 2023 04:41:25 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id i2-20020ac25222000000b004d86808fd33sm948465lfl.15.2023.03.13.04.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 04:41:25 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Mon, 13 Mar 2023 12:41:13 +0100
Subject: [PATCH v2 7/7] arm64: dts: qcom: sm8550: Use the correct BWMON
 fallback compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230304-topic-ddr_bwmon-v2-7-04db989db059@linaro.org>
References: <20230304-topic-ddr_bwmon-v2-0-04db989db059@linaro.org>
In-Reply-To: <20230304-topic-ddr_bwmon-v2-0-04db989db059@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678707675; l=848;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=jgTEqsKAebB9bsGGIMDxQ30Eg4/dVyljepjgSni4ZzI=;
 b=a3ILA0uJYyR1CR/vHX+MwLfp1w+hxsINjmLCYH+GzvdULrSU2BCmuMMAFNVZPML/8nT5b1Qa8SK2
 DwQCCVKxB/8JKZ1iDcm1Pa2VXyHKOzpxu4GiCwA3IhQOtN9UOmBY
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use the correct fallback compatible for the BWMONv4 with merged global and
monitor register spaces.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 25f51245fe9b..b5488c6822bd 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3391,7 +3391,7 @@ opp-8 {
 		};
 
 		pmu@240b6400 {
-			compatible = "qcom,sm8550-cpu-bwmon", "qcom,msm8998-bwmon";
+			compatible = "qcom,sm8550-cpu-bwmon", "qcom,sdm845-bwmon";
 			reg = <0 0x240b6400 0 0x600>;
 			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
 			interconnects = <&gem_noc MASTER_APPSS_PROC 3 &gem_noc SLAVE_LLCC 3>;

-- 
2.39.2

