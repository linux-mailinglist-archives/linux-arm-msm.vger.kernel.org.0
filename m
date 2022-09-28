Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70A8E5EE00F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Sep 2022 17:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234745AbiI1PVK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Sep 2022 11:21:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234161AbiI1PUx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Sep 2022 11:20:53 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14B05A2D5
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:43 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g1so3267414lfu.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Sep 2022 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rQi7cXeOGY/HNtdfUBGhQ3z+Yj+bhensaF8Epr2+VKg=;
        b=WVkGr8uX6x7t3roYufHT3DLMR6W8mLiM4JJh38Gi0RhH5xJA1sU2eTj83+VR9jl5yo
         gqmqry/hsBbU+yvrfT3z9RM4jlCszIQtw3WE1L/ISCMAp+dbQM/I6els1XyYeWGjR4la
         lTU9VJfZIO8YbhVoDnNrCooTD07h2tg/Yn+dnREZHvlXo1Pmqh8j2jLo3ki0NoRmsbG5
         moRtIrjOoC5t6UeeeYSmmwXGOQYpG6TgBEzULYlQ7a+wGIgqywvwRwo4Gdi5EClrrKIv
         3+fPmmfMC7z9LT9sreAYJONhiOm/KTYdw8ielIezMmxEG2qLOTwchn+Fbv6UBT4MJkbj
         9pQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rQi7cXeOGY/HNtdfUBGhQ3z+Yj+bhensaF8Epr2+VKg=;
        b=2M3FBBxh5+hV29XPvh78CvFS4HhNjjhl0uiZxm3S0lLYp85lm0lgWKpn1Xy/yOUfzt
         TE6CnoqH2j4fXXNDGcbU0Odesp7mqMN63v5WyHGLNZMW043impG5SJC/V2t4Iu/n+fEb
         ww7oRRnfaDPHFdoJ93lcfQLIm6cKb2fmhORmCFxCeUtJkm3U29GR6vghtMIfMVhQi3In
         p7lRrefnrj0LOaIxjbvYC3QY8pm3/9zrGjtZ05u82URGHEuxiuCQBLA1okRwb/uv/b1i
         h4XLR9pTtcGZp2qX1yI1y6kB0glxGwnzRL1fE3sod2d7opEFeriCUQUoDaQ39yvkRYVu
         ciOg==
X-Gm-Message-State: ACrzQf3r7EAhLKjXyza7WRlUtgPyU/Jn4V6GUVPcfl6glty8+R7dyslo
        NyiYQQQNx928d4yX2DKeRZgQ0rgCd7DtKA==
X-Google-Smtp-Source: AMsMyM6VehWI9qon+rnG5VScgt7/uupHOCjOgtYrEVVC/9keKEAcBEBBsH/c1adrF8JwLdwReiHzjA==
X-Received: by 2002:a05:6512:3d8c:b0:49a:4872:858 with SMTP id k12-20020a0565123d8c00b0049a48720858mr12955333lfv.145.1664378441955;
        Wed, 28 Sep 2022 08:20:41 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v2-20020a056512048200b00497a41b3a42sm503023lfq.88.2022.09.28.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 08:20:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/11] arm64: dts: qcom: msm8996: align node names with DT schema
Date:   Wed, 28 Sep 2022 17:20:24 +0200
Message-Id: <20220928152027.489543-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
References: <20220928152027.489543-1-krzysztof.kozlowski@linaro.org>
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

New slimbus DT schema expect only SLIMbus bus nodes to be named
"slimbus".  In case of Qualcomm SLIMbus NGD, the bus node is what was
called "ngd".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 8b31f4655cb8..341295be7609 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3309,7 +3309,7 @@ slimbam: dma-controller@9184000 {
 			qcom,num-ees = <2>;
 		};
 
-		slim_msm: slim@91c0000 {
+		slim_msm: slim-ngd@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
 			reg = <0x091c0000 0x2C000>;
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
@@ -3317,7 +3317,7 @@ slim_msm: slim@91c0000 {
 			dma-names = "rx", "tx";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			ngd@1 {
+			slim@1 {
 				reg = <1>;
 				#address-cells = <2>;
 				#size-cells = <0>;
-- 
2.34.1

