Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3E365AEE4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 10:47:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232202AbjABJrk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 04:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232453AbjABJq6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 04:46:58 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C5D75F5C
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 01:46:53 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bt23so24262184lfb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 01:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGMfdB+xS4dGRgKElmXQIWNZeogrs6lutCOX1XSAqa8=;
        b=k1/hVy5sOCucJovqkdHr8sDYX7texlx1gJC/CdxBe2aUwb7P9qANlb1XcXLps6k4TG
         MoVuzX2VNFYbpXtxeg0GtzL25KyfoyzVYaEY6ms3C+3w7yw4y9IK9CazS4OTzoiBjUmm
         2dnvhXmN1SqCK19LHw3sA2i+7OwsyaJrxGHIomAXYBC4SoZJsEnQqHCyleadPuyEzPXB
         pBNgkor27sPFApjqMOJe3LHHV88hXvwzqTWs4RT/FqPAsz+tONFyXiZp6C9MrC5wuJn6
         g5lPFibg4Shqbn+BhPc5/F0KJ+z+dW5shKTEQ41Fk/fsuRx6bMFS7JQyEJWYPPsdLBap
         rl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGMfdB+xS4dGRgKElmXQIWNZeogrs6lutCOX1XSAqa8=;
        b=g5Fm//gK8Bb/L2xfgRFeqt/SLfi5DFHd4JyDiIQIQ+odXFCr+zBqvxwzOkLr7OmJwu
         YzyezO0YyWU3kI3Y6E7jc6ixW4Vb/K/Gvf4iHKqgYG4BrV58tXiFpn+ecGakHaXW3pQO
         lOQKgnnvXmc+GPu5e7ty/BDYWYvrX6IsYy5TdqY2IAB8rdAWyl0V0WHM+oghVRQYOgAI
         rqTE2s19G6XxQYUwM0PcL8j8GLA7SRs3qFrRVT89nFiNdMCse3a7pOyTPY+nB3XXiVyQ
         b+VlRgCQNEZLoEPS6l27l8eGC2c/LDimHWiyhb1rZh9QPZUhcpZYEoWFZy2KeMHpeMSk
         wZng==
X-Gm-Message-State: AFqh2kr9cVa4hABR5lhdIr4/ioBF8qDXBf1RLkvJZER2KSD6kFORUROd
        6nBqU5tIGxtIJrcbcrszKGPQ541MMi/QEeTc
X-Google-Smtp-Source: AMrXdXtLaxGHhzTaFa8B3ucuPmE9i+cC+I4/sgbCAr0scQeRNUvSQQrlpFFYwb/Iiuhm7EP/LDQpYA==
X-Received: by 2002:a05:6512:202c:b0:4a4:68b9:19f1 with SMTP id s12-20020a056512202c00b004a468b919f1mr10642508lfs.25.1672652812220;
        Mon, 02 Jan 2023 01:46:52 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x11-20020a0565123f8b00b004b5adb59ed5sm4382143lfa.297.2023.01.02.01.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 01:46:51 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/17] arm64: dts: qcom: ipq6018: Use lowercase hex
Date:   Mon,  2 Jan 2023 10:46:30 +0100
Message-Id: <20230102094642.74254-6-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230102094642.74254-1-konrad.dybcio@linaro.org>
References: <20230102094642.74254-1-konrad.dybcio@linaro.org>
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

One value escaped my previous lowercase hexification. Take care of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v1 -> v2:
No changes

 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 0d9074b3b1a2..d32c9b2515ee 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -381,7 +381,7 @@ tcsr: syscon@1937000 {
 
 		usb2: usb@70f8800 {
 			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
-			reg = <0x0 0x070F8800 0x0 0x400>;
+			reg = <0x0 0x070f8800 0x0 0x400>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
-- 
2.39.0

