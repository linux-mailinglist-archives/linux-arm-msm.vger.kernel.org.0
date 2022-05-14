Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A19B45273A4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 21:02:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234827AbiENTBt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 May 2022 15:01:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234810AbiENTBq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 May 2022 15:01:46 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6FC2871E
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:44 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i10so19612071lfg.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 May 2022 12:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tuq5sCaVtmkjPi9RkbWXYl4iAUGc0Sy3jGc43YOB5ng=;
        b=NqdFYzwWCcfVPGZqsGikG98E/2KjqgRwKfmX0YrIZcXIgzbasozCR1f9he12M1oDEu
         pisejVceSfEv8QUqXxxBBrxn1Q4dYZs8I8+6MepEQV8PP+HGSX80jorVNQGJPSYbNvTw
         Fe4plLMEYYb+zeaCc+tXrIrYFxNWP48GgtStWy80ofrdIbEmWxZEQjSlqOf8KXeDHyhq
         nxpydJyN5QSxALitwAqZKDDe8o29WDBtFDdK+QiBxE13pKkCisJRcdZw0hYbYxqs9WhY
         qc27fbK1B4EfUzWI1X6WCMm5REnpMNrIkosL8UejOxVQw2lK3gbsmhukUu/81P48SZPe
         uqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tuq5sCaVtmkjPi9RkbWXYl4iAUGc0Sy3jGc43YOB5ng=;
        b=IpQKoEszkIJ5a36Ys9E4M55mstmA4uBD3ZGQ6oMh9wIEHMp2SOR83usSzSN583auO5
         4Xz5PotP4OcP+C0ts4BgXSLxb9LagfZOYfuHRIp9cQ0pFAmVf03DT5IM4slU0FBWczBC
         /sb7SxcR0ZDBc3s2Ie85VTROm+lwkZyFpdeNmWmmeIFPZfRTzGSBELmBVu/eBEh6yomD
         a1X4hLig5CeuMMQPOB/NQcXA7fWyxmEqxK7tI53ZFoNWcX9C5rWQdvbitZNl354fPKAp
         Av8/XtbhLTivcdED3qdSjQoz/tl5Qyp7PTht12QgWoeFP1O517H38nhvp1hcavokuFep
         sG7A==
X-Gm-Message-State: AOAM533E2bioL269yM8y9aEBcj/gxsO5ppopSdCKeT8lCf4tlhEunjmm
        UPOzbMeeAWsYg2lP35Io4x+tvA==
X-Google-Smtp-Source: ABdhPJxJWgOatR34dUtIOb51TRmz7pzSYFMaYQrHu7whgfVgZqbObpyCc9tjUSuIhmatljljCwuz0Q==
X-Received: by 2002:a05:6512:332d:b0:472:9a2:6e27 with SMTP id l13-20020a056512332d00b0047209a26e27mr7585806lfe.611.1652554902499;
        Sat, 14 May 2022 12:01:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([93.92.200.201])
        by smtp.gmail.com with ESMTPSA id y26-20020ac255ba000000b0047255d210f4sm787427lfg.35.2022.05.14.12.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 May 2022 12:01:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 03/12] arm64: dts: qcom: sdm630: disable GPU by default
Date:   Sat, 14 May 2022 22:01:29 +0300
Message-Id: <20220514190138.3179964-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
References: <20220514190138.3179964-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The SoC's device tree file disables gpucc and adreno's SMMU by default.
So let's disable the GPU too. Moreover it looks like SMMU might be not
usable without additional patches (which means that GPU is unusable
too). No board uses GPU at this moment.

Fixes: 5cf69dcbec8b ("arm64: dts: qcom: sdm630: Add Adreno 508 GPU configuration")
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm630.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 8697d40e9b74..e8bb170e8b2f 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1050,6 +1050,8 @@ adreno_gpu: gpu@5000000 {
 
 			operating-points-v2 = <&gpu_sdm630_opp_table>;
 
+			status = "disabled";
+
 			gpu_sdm630_opp_table: opp-table {
 				compatible  = "operating-points-v2";
 				opp-775000000 {
-- 
2.35.1

