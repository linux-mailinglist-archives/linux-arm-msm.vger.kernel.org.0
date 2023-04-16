Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 569CE6E381D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Apr 2023 14:38:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjDPMh7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 16 Apr 2023 08:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjDPMh4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 16 Apr 2023 08:37:56 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3372D40
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:54 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94a34a0b531so528183066b.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Apr 2023 05:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681648673; x=1684240673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FEp3NK8NWDgla/j9XVY4sLw1TIKp5Rg1Ml1aJL49cJ0=;
        b=kI+leUPpZ0cYL1XbwXPGYkCiLKMK0w4cPBmZu7nyEQaZP7WMhvNQJPz1kprulcvrMu
         08XSg8isjNqrK3bScXvu5qAMNPCJWqWAY9YR8SFjsDR6yE4zVRZF097b8JSC4KosLgjW
         m3TVC15Hc5MWuNfvsS26uudQ8Y6UrTAp31rvAo7xevaJ85zbKWmMJc3LTcbyy70s2JWR
         yvfBUV9fPHNgFd40leTu1KivLRpgRq75C3R+lRR4tWTDY7B4ZHAVX/zss9sHRy5m+nlu
         DGUMEMFXxcypvUI8YLMKny5yeeqYB5O+0I11oGDY5Q4zcL34IqWxAd49VdDq4uBZLHoo
         l16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681648673; x=1684240673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FEp3NK8NWDgla/j9XVY4sLw1TIKp5Rg1Ml1aJL49cJ0=;
        b=SGWLGvg3lJXuOTOJLDcAfDJzZk0iKJXBaPOfpzdJU9FP+i0WtyieVxhESBECq3we1Q
         VpKABQW553N1OQHs+Uo4EzikBnrKnZzchpukF95T//gH+/LbTq1Xi2O2SnMhvylVBFrB
         BnRTzb0IHuZT7wfH87lrSyOMs/ZIzecusgwRA36fgzdTDruH8TjNPpg+mzvP1u0JF0m7
         2aoXVx0zfoLnoIzFzgdAnxe8OBllio1Jr3dnfSyIAvi5wbFhvFLmcxe44po3LFk7ncPE
         vXic+gApjY7sRqyg0qOcUtVdJE1eYTkra/K2NgB3Md9XLg1NMDL5IH6A2NIjkdFgzw3k
         zJCw==
X-Gm-Message-State: AAQBX9ck9ccpsd9vsF42Up7aVzLY5XAiFYPjoAwD0dhgD1oZISG28yp2
        6p2P0gGWlU1pN4p8rXhc4OgB1Q==
X-Google-Smtp-Source: AKy350boLP0v3JnRUlI4x/y9mTdSHa9m1Fwbprv/z4NVsVnSIWlm/9eVxjpALFbwWJ3joen9r+uzjA==
X-Received: by 2002:aa7:c155:0:b0:506:8edd:b883 with SMTP id r21-20020aa7c155000000b005068eddb883mr4741058edp.36.1681648673194;
        Sun, 16 Apr 2023 05:37:53 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:29dd:ded4:3ccc:83db])
        by smtp.gmail.com with ESMTPSA id j23-20020aa7de97000000b0050432d2b443sm4556889edv.48.2023.04.16.05.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 05:37:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/6] arm64: dts: qcom: qdu1000: add missing qcom,smmu-500 fallback
Date:   Sun, 16 Apr 2023 14:37:27 +0200
Message-Id: <20230416123730.300863-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
References: <20230416123730.300863-1-krzysztof.kozlowski@linaro.org>
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

Since commit 6c84bbd103d8 ("dt-bindings: arm-smmu: Add generic
qcom,smmu-500 bindings") the SMMU is supposed to use qcom,smmu-500
compatible fallback:

  ['qcom,qdu1000-smmu-500', 'arm,mmu-500'] is too short
  ['qcom,qdu1000-smmu-500', 'arm,mmu-500'] is too long

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index fb553f0bb17a..ddc3239478ae 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -1113,7 +1113,7 @@ qup_spi15_cs: qup-spi15-cs-state {
 		};
 
 		apps_smmu: iommu@15000000 {
-			compatible = "qcom,qdu1000-smmu-500", "arm,mmu-500";
+			compatible = "qcom,qdu1000-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0x0 0x15000000 0x0 0x100000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <2>;
-- 
2.34.1

