Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3B8622E24
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Nov 2022 15:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiKIOmJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Nov 2022 09:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbiKIOmI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Nov 2022 09:42:08 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F1A12D08
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Nov 2022 06:42:03 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id g12so25903571lfh.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Nov 2022 06:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bkmGAAhASeKkyW4/+zIci7WZOjWWW0Qq/nOsqw+GfiE=;
        b=V+GLs/B72K4vuyoJBJsydkDBTzbVVgqHfQYp12G6saidzreZLhQqcWe37HezPG4ePA
         nl/L5zvGuatlOBPb1b6RNakbmnljcdXEtNVFsXkRhlMTTGMSl4MUPATc1YuQ/cS1dw3U
         5Aqfl6n2U/p7cFmzm0Cqb+pxv0uHMz04AHxIMMXx+40UmqqpwRYmLQn4IZAHGcHFTF3n
         1HyhZhNtItLmRFUK8LOTCjsbsq4cfmvi1rQw6q7muUQfRoU8RXmB14XOCZFiTkyG2FW1
         LDH45HNZO6wYQ36Dwx7/EDJaYopfw2g2oM9XGuHiom8Jxe4USVLzSadvOuJ8QP0JOBNM
         2hHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bkmGAAhASeKkyW4/+zIci7WZOjWWW0Qq/nOsqw+GfiE=;
        b=tcI5atYMitfz0GxiuFZwedtfxAfjSC7kbG0oYYi8RKbxIckje60UeTVMpyxqWjN9FL
         Cq5YiGbkM24NcWvHosa/Cdvh04zmEOyO4R276nXSqX+mprn1bUyTxtqqFov6Re4YcX9/
         +blKVhpsIv95Nt9+Hx3+rRo5NnHPBIolzrGzt27/CQU1b5ELXgLvmheVJA4DZ3pzhJyQ
         IuFMJsOAyBGsoYphALdTmBtRRmyAfrh0VenKGN1/sj1CYMwH2iOwZ9EqXQ8G2AQ9dBBg
         X45t+J6SRMGNIEmQAo5+UjsFFsZkI/FoRLF0p9GrvhQajgubzTJwaJtTdQQn5bdg+m12
         rEXg==
X-Gm-Message-State: ACrzQf2GGss7KklfGfzt++WM90x+beSf4ZH7IhSm6V/QJlJthnUSnijY
        Tptxz8/RTUBsQbrXFg7x/mA4jETsuD8ZKyQ/
X-Google-Smtp-Source: AMsMyM7ZklXHqmsEaE8RxsLrvb2+FVR6HqDGDie2dTIf8XuqINH1FuRAzbnj5B02HrsAx562S4SGog==
X-Received: by 2002:a05:6512:64:b0:4ae:2465:192a with SMTP id i4-20020a056512006400b004ae2465192amr19588900lfo.62.1668004922021;
        Wed, 09 Nov 2022 06:42:02 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id q10-20020a056512210a00b004a478c2f4desm2235229lfr.163.2022.11.09.06.42.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Nov 2022 06:42:01 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     patches@linaro.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: mmc: sdhci-msm: Document the SM6375 compatible
Date:   Wed,  9 Nov 2022 15:41:51 +0100
Message-Id: <20221109144153.53630-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20221109144153.53630-1-konrad.dybcio@linaro.org>
References: <20221109144153.53630-1-konrad.dybcio@linaro.org>
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

Document the compatible for SDHCI on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes since v1:
- Pick up r-b

 Documentation/devicetree/bindings/mmc/sdhci-msm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
index fc8a6b345d97..12def0f57e3e 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
@@ -46,6 +46,7 @@ properties:
               - qcom,sm6115-sdhci
               - qcom,sm6125-sdhci
               - qcom,sm6350-sdhci
+              - qcom,sm6375-sdhci
               - qcom,sm8150-sdhci
               - qcom,sm8250-sdhci
               - qcom,sm8450-sdhci
-- 
2.38.1

