Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2285B0193
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 12:17:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbiIGKRY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 06:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230441AbiIGKRG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 06:17:06 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485BC5A176
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 03:16:16 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bt10so21696711lfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 03:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
        b=Sf1qMEHpMyvMOM726UPwmd4tFRVkWl14QmuLSPwXcWWckFo9iNstALB59POadIE3u/
         F4z6QMTShCXZaeHZaFD4RKl2hlR7sNGnoBa5+8K7+ZFhEBx9neK7x13pTAbYvQeS232w
         7R+ZoQUBb2u+2ZUQpdjN2u7ejl8F4+rI0uxB6f6Z4ev9OJLKIzSw8UPB/4KAR99ad/o6
         EZtlx09RAjYbxIODMUR9TrydowX1NenVtzRJZ2fA7I9z9xOzOToR4+92ckfskb5xIy9E
         pC5ayOZDuvvQ9LhpNihN4Bknw/MZVX5C3ayd1eMT+JS3+zKXteUg61uhzMrlufgMWLvf
         xU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=rD7nUjrvSdRKK26SnCtib57c+ip99Bt4hzrz7aSHTO4=;
        b=GyVsRqGtqszpzSIpI/vrYS9x/WEN1tUkH3rUvDV+azMfwpzUDXCU3GgXZQCp5IC0fu
         a/eOy4bya5b0FLHTryWmBu0iAcEcsY/lKxDUmB5v94sw/yNft07SmJ4ZpTO/NQJUj/Xa
         8K7T3ZDk5zqBDqi+sl1pPsIuOS+4SFHA1B4b8ibOiKt87115ohPpkti/3HqcG7NVomFr
         sw2WG9gFC+3mg0+Kr9/v1QAWzcpxEgs/wU1YFIGRbRbdERUzyt4BmbaofHncgjRBcjN8
         B4aQ+4mXiCtFnELK2oAMY7QOKxRKysOso+jr4jLlNzb8piNjs54ch8Opgz9YKUsh2R8p
         NRIA==
X-Gm-Message-State: ACgBeo0PTDynQ6vwr3O6dctyUv9nrvTQQd+VbBj2iJDipBzybwBrcU+w
        p8aSJFI/ufuvYZOPs7SqWpPCxg==
X-Google-Smtp-Source: AA6agR6tnZ/eDnpRKASnvAO3rT5c8S19KCAhnPnR8bkNHZdmAwUtPsbo7BPBgbJoF2jBYLWQZCUFYQ==
X-Received: by 2002:a05:6512:ad0:b0:497:a620:157d with SMTP id n16-20020a0565120ad000b00497a620157dmr941660lfu.643.1662545775597;
        Wed, 07 Sep 2022 03:16:15 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u9-20020a2ea169000000b0026ab0e480bcsm960734ljl.39.2022.09.07.03.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 03:16:15 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 08/14] arm64: dts: qcom: sm8250: use generic name for LPASS clock controller
Date:   Wed,  7 Sep 2022 12:15:50 +0200
Message-Id: <20220907101556.37394-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
References: <20220907101556.37394-1-krzysztof.kozlowski@linaro.org>
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

The node names should be generic according to Devicetree specification,
so use "clock-controller" instead of "cc".  The bindings so far did not
define this name (as child of APR service).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 84b4b8e40e7f..6ee8b3b4082c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4799,7 +4799,7 @@ q6afedai: dais {
 							#sound-dai-cells = <1>;
 						};
 
-						q6afecc: cc {
+						q6afecc: clock-controller {
 							compatible = "qcom,q6afe-clocks";
 							#clock-cells = <2>;
 						};
-- 
2.34.1

