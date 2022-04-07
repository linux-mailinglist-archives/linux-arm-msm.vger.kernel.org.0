Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF02C4F7B94
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Apr 2022 11:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243771AbiDGJ3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Apr 2022 05:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235762AbiDGJ3b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Apr 2022 05:29:31 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4201A61A11
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Apr 2022 02:27:31 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bg10so9593768ejb.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Apr 2022 02:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HDWRHtMWWsVQlbRd/eGjYgilSV8n+KJqiJ5agkgjVIY=;
        b=OQ9uTyKQ+3jWh1HTuZTaWHNRc5S1NM8PQ83nAPpN3LgC9aiR0Tu0t+n2dnp4iZa6O+
         eES7ckdXskCA0uoO+XkmaIm+E9fCs6mqrii2OmomGeRlY2xh3UN0chWPGdr/VKnOsPmp
         873sGTJGRIwlKIyW97HQpgoBOy5NSfjMj1YTk9qXVZHxpzGyGNs1iOQTVUWrjIqCpKyF
         jVEBwUUhLpSSjR4p9UieW0nRDjUN93u7Rb3fFvOg0lsBismLsnROQfTGBAsa4JqQBqNE
         DPDMizM8wexHfBJDFEcRF9HMftLH+agVdD9FGm9EPyvlmW+n43/wDj4lmg+P1YhLOFtX
         TuQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HDWRHtMWWsVQlbRd/eGjYgilSV8n+KJqiJ5agkgjVIY=;
        b=qgAbct//NEjcyiTUtIwuNimifPGDPBEId37fJYeBeJPhIa+d/X7TSkDh0NTQ0dPntB
         NG7nm2/BW6y3y9rTW6N8fbNGo0RDTdUVffv3rMDjgA3Bw+ATVvZGVvDaybE2sxr4kql4
         TgfuqwsJKuKbtPgky7k6CQopwrXasvbS+1/zJKjNxKN3IoUcU/oIxwPu80tRw/5x//zB
         F3k5uVuDwhE79IUZK9m16OlJjF/OgzAWPCDdUbdGfbKnU8CorM2LwCq0/m0gg02Ra3i2
         1pdCIfn8DpfL+ZMNYUdxJ2YGkjsKOpgFJ8+sIAn1TAHA0fEolfsIII/KxeUf9aUw4InE
         FJ7A==
X-Gm-Message-State: AOAM531wuYmoQecya2djkigozgqxYo+JeRTFmyVxpKSGD8T4yEQAklsS
        OHoBUH+tq8T2dHW9uD7ogddDFw==
X-Google-Smtp-Source: ABdhPJyKU78KN+4mS3JRor1G8970H/IVU03Ue24ubBszYKjp73+4ayQnbKBogJiekx3wpGolipP3qA==
X-Received: by 2002:a17:907:2cc3:b0:6da:e6cb:2efa with SMTP id hg3-20020a1709072cc300b006dae6cb2efamr12364953ejc.169.1649323649858;
        Thu, 07 Apr 2022 02:27:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id s14-20020aa7cb0e000000b00410bf015567sm8649435edt.92.2022.04.07.02.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 02:27:29 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH v3 1/3] arm64: dts: qcom: msm8996: drop unsupported UFS vddp-ref-clk-max-microamp
Date:   Thu,  7 Apr 2022 11:27:23 +0200
Message-Id: <20220407092725.232463-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The property vddp-ref-clk-max-microamp (for VDDP ref clk supply which is
l25 regulator) is not documented in MSM8996 UFS PHY bindings
(qcom,msm8996-qmp-ufs-phy).  It is mentioned in the other UFS PHY
bindings for qcom,msm8996-ufs-phy-qmp-14nm.

The MSM8996-based Xiaomi devices configure l25 regulator in a
conflicting way:
1. with maximum 100 uAmp for VDDP ref clk supply of UFS PHY,
2. with maximum 450 mAmp for VCCQ supply of UFS.

Since the vddp-ref-clk-max-microamp property is basically not
documented for that UFS PHY and has a conflicting values, drop it
entirely as it looks like not tested and not used ever.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
index 7a9fcbe9bb31..3ade756e1cd9 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-xiaomi-common.dtsi
@@ -341,7 +341,6 @@ &ufsphy {
 	vdda-pll-max-microamp = <9440>;
 
 	vddp-ref-clk-supply = <&vreg_l25a_1p2>;
-	vddp-ref-clk-max-microamp = <100>;
 	vddp-ref-clk-always-on;
 };
 
-- 
2.32.0

