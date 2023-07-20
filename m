Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ECDF75AD7D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jul 2023 13:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbjGTLx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Jul 2023 07:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231336AbjGTLx4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Jul 2023 07:53:56 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22A58171E
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 04:53:49 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-992f15c36fcso124437766b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Jul 2023 04:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689854027; x=1690458827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIno5NwHy++IgnHVVOnnHUiAb7JS5SZRDG02PDAvpFo=;
        b=htD4XqP8oC9A8OTShLdCLeRnUQd1BTnHY1/jU7wriH2D4PDH6x7yITMNYFhaPX15xI
         YaRDx1eYkCC5xV1ZaSUtl/1VyyGIIiVCy0djcsDaTKuzISoTPJLDQDZaKAnq6Hz9Q/9N
         gzYr3iRXBCAyLfaxh1wL4ut+g9TrcQ5AGB1PHUwgnv5Q4hO3Et3N2kM55KuOrwz9alr6
         bUldxKiUiqTlo+MuCGlnmx6HmhIJa472PTdCUxxqPjIciZlQqBcvcNfA9jD+8C/LSXEe
         2EdgOIuprqOXsMfHU3MiF441HXgyO5A06uMEGiWnt1EesnnPWN28k1wxswO10X54u7OQ
         yBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689854027; x=1690458827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIno5NwHy++IgnHVVOnnHUiAb7JS5SZRDG02PDAvpFo=;
        b=Pb3CFo1XX8w5A7jy1sQ/iE+Y5PBBbrzgupYrrMT0NXPNFqCuLeu3Airk7TaTuuusiT
         KTWkDM1O3z6QcIYWj/82rmYOSkmkViOCBqQOjAXPbUanPUgl/PsuO9ltrgeG+UKMKXHD
         /EwE4/aVGXEU9zZBAkUwCqdXnAW5TMV1ZsiVqXX7AOo2gkLkZOFm9dI1ezqBLS0lrpb7
         gfLXVuHAr4nMd0nzaZutmY2ZRdL/InuAZJfafpTeF9vDaWoTXT/AjUggpDFgvNn8qiJt
         IrZFjPrwJsCPsUV1uym2ClnVqU+t9Lo7elL/4V5E0ywV/7ENVdU3sTERlTX7T+trbn/m
         DP+w==
X-Gm-Message-State: ABy/qLb9ofWvrazfWQ4YiBgEH0dPQkNN7Inv76NKvDw7G2rTVt+7hhd6
        mJ1Ptum9pKQO9uqbSnlc3N/gCw==
X-Google-Smtp-Source: APBJJlHdHU27c9Krjc8nn9ZwSNgLw+u+n2e0L6wOYZcoQ2Cu4QbC5sJ3EUVdfrt6FCMue2RlsJRQPA==
X-Received: by 2002:a17:907:7888:b0:99b:5b07:64aa with SMTP id ku8-20020a170907788800b0099b5b0764aamr532258ejc.35.1689854027674;
        Thu, 20 Jul 2023 04:53:47 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id qp7-20020a170907206700b00992b66e54e9sm587758ejb.214.2023.07.20.04.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 04:53:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Gianluca Boiano <morf3089@gmail.com>,
        Eugene Lepshy <fekz115@gmail.com>, Luca Weiss <luca@z3ntu.xyz>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH 5/6] ARM: dts: qcom: msm8974pro-castor: correct touchscreen function names
Date:   Thu, 20 Jul 2023 13:53:34 +0200
Message-Id: <20230720115335.137354-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720115335.137354-1-krzysztof.kozlowski@linaro.org>
References: <20230720115335.137354-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The node names for functions of Synaptics RMI4 touchscreen must be as
"rmi4-fXX", as required by bindings and Linux driver.

  qcom-msm8974pro-sony-xperia-shinano-castor.dtb: synaptics@2c: Unevaluated properties are not allowed ('rmi-f01@1', 'rmi-f11@11' were unexpected)

Fixes: ab80661883de ("ARM: dts: qcom: msm8974: Add Sony Xperia Z2 Tablet")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
index c41e25367bc9..726ed67415e1 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
+++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
@@ -125,12 +125,12 @@ synaptics@2c {
 
 		syna,startup-delay-ms = <100>;
 
-		rmi-f01@1 {
+		rmi4-f01@1 {
 			reg = <0x1>;
 			syna,nosleep = <1>;
 		};
 
-		rmi-f11@11 {
+		rmi4-f11@11 {
 			reg = <0x11>;
 			syna,sensor-type = <1>;
 			touchscreen-inverted-x;
-- 
2.34.1

