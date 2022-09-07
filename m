Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED4405AF8C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 02:01:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiIGABg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 20:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiIGAB1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 20:01:27 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6448786057
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 17:01:20 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id m17-20020a7bce11000000b003a5bedec07bso10677031wmc.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 17:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=V1QjRsyzyPnXH7KiwjoFH6uwQ51DeY6gIvGuswjdFiY=;
        b=a8167a62aYwQQ4b9hY27nVT+OwxHzS9DOk+XkmEZOtNINL4WqABzdjDtJyCrCm81QI
         DBc5k1rcOejsbn3i963+Dkz9pvEtxK+pjHzYH8AWWtQ8sk9fFLFY7GTz0oa1HkvLGvPi
         y4ZaNz3Gj1XplMnsfDr/BxMxFnrWxElZVl+T/LTdWY5e/49eKal9U0RcxrOhkEBkCGDY
         n7CbX+4hdxHJsdGaN5amtnUY72hrqj6iMrsiAXadfddKHwV7lEOf6exdDqAYWDaOe7qQ
         /2mhaBrzUFOq4/SSUx0WutfMqpcazd2FN8Ach8oJH9FyNGG8z8lLd1Fhle2TY45RBN3P
         8HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=V1QjRsyzyPnXH7KiwjoFH6uwQ51DeY6gIvGuswjdFiY=;
        b=3Ja6GLJ5kWdzTtjXBMC5PbswaIo7LoLjur9n6fviyh4+P8JuyNYe8fNzMXq25XptHK
         LG0vgkjIfRDa5dcqptnFhvB8Fu4Kk2FD8ulF7tSHBNKykRS0zurUwLDWnQQpboL3mglS
         PuaI3jYe2b+U2Dr17ZsGs1NM3Ygj++k07qFo7RQ33SU/ixN+tbQ9aT+xbs/lVUTXa39G
         IqLS0zGLDFnWl2Fa7A/ESvw9UXQrYNDeNL8c51Nfwa1MXhbUj2dnAG9GuIkh3M5KO2i9
         v4IvrOz0oixsK6yaq/Ndd96/+JcncovrcMpcl5qPTqsH5fQcZNb5DAxHaTq10p20gfxi
         L7lA==
X-Gm-Message-State: ACgBeo32LTBhgWqhL6QRUFwjogGlJCeVParEHBU63qfuZ5oTRCgMH1jg
        0E0PMXxL1i/Qusdi6iS5agMB6g==
X-Google-Smtp-Source: AA6agR73sIjbDqxJEXbReeVOz7b1OPg0mIcMApF6zjNEMtI8U1ei2z8GO6bNXSZFhK03YUMM5shuXg==
X-Received: by 2002:a05:600c:384f:b0:3a6:603c:4338 with SMTP id s15-20020a05600c384f00b003a6603c4338mr15075082wmr.192.1662508878830;
        Tue, 06 Sep 2022 17:01:18 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id g13-20020a05600c4ecd00b003a4c6e67f01sm26848613wmq.6.2022.09.06.17.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 17:01:18 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, quic_mkrishn@quicinc.com,
        agross@kernel.org, andersson@kernel.org,
        konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 11/11] arm64: dts: qcom: sm8250: Drop redundant phy-names from DSI controller
Date:   Wed,  7 Sep 2022 01:01:05 +0100
Message-Id: <20220907000105.786265-12-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
References: <20220907000105.786265-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

phy-names has been marked deprecated. Remove it from the sm8250 DSI
controller block.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index bc773e210023c..10e9b76e2aa69 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -3547,7 +3547,6 @@ dsi0: dsi@ae94000 {
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
 				phys = <&dsi0_phy>;
-				phy-names = "dsi";
 
 				status = "disabled";
 
@@ -3620,7 +3619,6 @@ dsi1: dsi@ae96000 {
 				power-domains = <&rpmhpd SM8250_MMCX>;
 
 				phys = <&dsi1_phy>;
-				phy-names = "dsi";
 
 				status = "disabled";
 
-- 
2.37.3

