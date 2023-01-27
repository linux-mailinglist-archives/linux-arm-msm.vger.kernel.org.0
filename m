Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B178A67E46C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233269AbjA0MCJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbjA0MB3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:01:29 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84AB17265C
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:57:05 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id y1so4766612wru.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 03:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BrF9LgB6eMDiwxYajfExPFsmwKuBK9Q1Oi4vH7E9piA=;
        b=bn5Ft0QTPMGgPaTGZvY7rpijRmFY9xtj3QN7zNvtx65s3w69hOFrf6jv6UbQXt5SDq
         58mIeuRynlJAeB1KwdQBmdN3jBE8s1g6c5Wep5Xzo41ZFU6yt4LkixFzOrR8pf0javvV
         dIUrDJAMQdwIOnahrBhjr84t07idusK22h2gEYUSMvrG6GnurbIJGdjcrajLhs7ZjoGK
         If7UZwZea7Bgn5eMQUoSadca8M/2YEfKiT4t91gJVWLCDQt0/HM/PGjac1QWbPkV6+IV
         rY68sBmPr7bbUzOZ1XDxDE+HTa/4LlVQoS31s2ZSJiN45f6gOvL8K0pss6d/D510wTjW
         fS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BrF9LgB6eMDiwxYajfExPFsmwKuBK9Q1Oi4vH7E9piA=;
        b=O51VTP+OyD4Fw3Z/4UKVXXhZEvqCcGjb1MtJHbX9uVb1AFg2Q8MdcOhDpkOpNRye9y
         4rNO79BB8ME8/xYYC0O7120zk6brvfX1qgkz2qBoMvSMeRIhxxzV3/G2x+mnpH/yUKZ2
         k1FTQbHttlQmgraNwOUOQq1WqWulzvL2sSnh3gQ+atv8Vi1yhCXJlBPkJCfJsqV9osE4
         NSDOhroJuEXJuWnu/yqhKh23YMiHC2uEd/iGhwoK9jHqIxHccic5xvrvW0qsUvUWum0P
         IbY9RYtEit5k4uaGcFKTPPScg6XWBeFdqM0bW7cK8I2t5EtAy61xTDujTBFx1+d0RwjB
         rUMw==
X-Gm-Message-State: AO0yUKXS5cU9pDnkitlAc9Hdwy4KnFoqqHq/ZVDwmGd3TFATsKz+v2+W
        5azdj2fTiyw0UtBqDcEnyLEEVg==
X-Google-Smtp-Source: AK7set8dsfdEGFj4TJgC/BrgvRqNWHRxdYU90frUbzD7wVbiN7F6S+sfZU8nzUdRd4NJqeFPvvJmXQ==
X-Received: by 2002:adf:db12:0:b0:2bf:c518:b060 with SMTP id s18-20020adfdb12000000b002bfc518b060mr5467114wri.20.1674820516384;
        Fri, 27 Jan 2023 03:55:16 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d48c6000000b002bfc0558ecdsm3664125wrs.113.2023.01.27.03.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 03:55:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8550: add specific SMMU compatible
Date:   Fri, 27 Jan 2023 12:55:13 +0100
Message-Id: <20230127115513.268843-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Generic SMMU compatibles are not allowed alone and we expect specific
one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Compatible is documented here:
https://lore.kernel.org/all/20221116114001.2669003-1-abel.vesa@linaro.org/
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 0307b853ec4f..e385432e7a22 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3053,7 +3053,7 @@ data-pins {
 		};
 
 		apps_smmu: iommu@15000000 {
-			compatible = "qcom,smmu-500", "arm,mmu-500";
+			compatible = "qcom,sm8550-smmu-500", "qcom,smmu-500", "arm,mmu-500";
 			reg = <0 0x15000000 0 0x100000>;
 			#iommu-cells = <2>;
 			#global-interrupts = <1>;
-- 
2.34.1

