Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76E786E381A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 14:37:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230171AbjDPMh6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 08:37:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230164AbjDPMh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 08:37:56 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B8B107
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:55 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-94f70a552fcso5004166b.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681648674; x=1684240674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RETCUf7tswKvHEA841WzRuZI/0ewiPg821zFgQ3lalc=;
        b=UVBhzwmruLFsGn2UopYHE2UugoPbNlowIHVDxKaOAoRZslWkYM9OxrgZseyalc+Qw6
         NoU2muXGbcUatPswkuk92Xqayts/1cmz49LpRUv60f5/X9dmlLHuKN3Xh7Xkmbo10tNH
         nQpdEUDXxMxKrkGasO1ZWlgI0nIs3zN2SNlbFJbfeREXHhpX3QO1QloPEaxW8poJKXZJ
         yryDAZOitH7n6Cr7s8uXzQTCZjOcI7MoChNiswKbp8rErQgQKWf/tlIVftGKJWn0TlNv
         5d7YGY2J9jk4CcRCgvO2zvRBPgS4JDuvSPot0mTOXM+vvhn/ooy2CS4WaHaSDSpqWvh6
         lJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681648674; x=1684240674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RETCUf7tswKvHEA841WzRuZI/0ewiPg821zFgQ3lalc=;
        b=TmjhqkoWgxjyo6YkIvYJ9Ql5iQCHIifqdBX/NNwmtx7O59aRbAwZZaX7SeDItTULPE
         AnYIDvVnTlgAySH6uUgrTt70YbSBqyw/dDe+0mC4RXLMWcI3vjyKgtRni0oUoRyKa7Up
         ofHHpcYlhipBNexsdBqkkE0ASFmaWiR7FH8mt3LNCbYmVJ0NqYbTf7LcAPhncLtftcBM
         XFRcvuYH9SzUlkmdKHKzVi5KRtTynSLOCx4XRbfYNdcuMzKZVkPIQn07vrBo5prI/DGx
         T3Ji+oRs8ioPldWP15s7rlZiKuqwEkr0T7COVmRAbSlRxL6X3MfHhpIAQ2XBwlfNWCB9
         aAaw==
X-Gm-Message-State: AAQBX9cJTgZjrvSvblc2YFgS7M0rRCE3hl6wtss2nVI6oXlpzkaNEilL
        igiy0bAiWlPrRMoe7gINjlRL2GUOhbtB3XkVcxk=
X-Google-Smtp-Source: AKy350YQLSXriye0yEDwxP6sye49rlFpPSt8FhD1Her+GHuk9FifHz1/tACgVxwzFPrbjWTMIe2FYw==
X-Received: by 2002:a05:6402:2:b0:506:a44c:47e3 with SMTP id d2-20020a056402000200b00506a44c47e3mr1038846edu.16.1681648674011;
        Sun, 16 Apr 2023 05:37:54 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7de97000000b0050432d2b443sm4556889edv.48.2023.04.16.05.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 05:37:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/6] arm64: dts: qcom: sm8250: add missing qcom,smmu-500 fallback
Date:   Sun, 16 Apr 2023 14:37:28 +0200
Message-Id: <20230416123730.300863-4-krzysztof.kozlowski@linaro.org>
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

Since commit 6c84bbd103d8 ("dt-bindings: arm-smmu: Add generic
qcom,smmu-500 bindings") the SMMU is supposed to use qcom,smmu-500
compatible fallback:

  ['qcom,sm8250-smmu-500', 'qcom,adreno-smmu', 'qcom,smmu-500', 'arm,mmu-500'] is too long
  'qcom,sm8250-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2']
  'qcom,sm8250-smmu-500' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7bea916900e2..778fbec9a554 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -5254,7 +5254,7 @@ wake-pins {
 		};
 
 		apps_smmu: iommu@15000000 {
-			compatible = "qcom,sm8250-smmu-500", "arm,mmu-500";
+			compatible = "qcom,sm8250-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
-- 
2.34.1

