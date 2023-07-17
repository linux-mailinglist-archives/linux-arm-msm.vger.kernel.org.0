Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C15A756EAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jul 2023 23:01:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbjGQVBG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 17 Jul 2023 17:01:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjGQVBE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 17 Jul 2023 17:01:04 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E129A10C8
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 14:01:02 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-992af8b3b1bso689871666b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jul 2023 14:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689627661; x=1692219661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+DQimrAqq5HrJuayvWKjqIpTBMUfwE2q6SblHTJ6nQ=;
        b=hig07dFEoE/VRC8eVzIyt4N5BQ9j5Vtqo5SweTa2x9QdauVRXa4mi8yoIN2Bx2yxCu
         9AKfg4DYMNEf7G2JaS0odJ8yRAU/R7oBxnyZWRv8whWQqK0AbUEK5PExmTYLThLKpeoP
         MplkJBZ3B5is2ylNwhWPCm5ht2HFIw7Dg7miR+caxMYEFAP0irRaebN909McVjdtcX5J
         VNKH70w8emiDWt4PnnF8wDciOxoK6zwbj0UlvI6vV9DbC0tXLUloKGmFgnDgqfdVBdBe
         xEg9iSXWJjFHCVzonONSTe5T0yxTiO0b8pbtD4XUtPsyokevk1BS8m+JdEmjHNXtOEyV
         F9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689627661; x=1692219661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C+DQimrAqq5HrJuayvWKjqIpTBMUfwE2q6SblHTJ6nQ=;
        b=B6gwEC04c5N7T1O97+RQVSPP9E78EbpuYSumKSf8Wyi4WYH1Fv+Qs0mTvcPl3fNDuD
         R9HX4U5h7R6cXjJ7ESXDKCIj1KAYirRMg0ZM3fQHAq2yHNG9vx9FZzgGz4R8UdyItHSO
         i6Jo79hqd0zXN8S1YD9Oo/+vznNm7hFVsuzMFizgAXqV2D2OWZJdW80qeo7M4hG4A0p0
         QCTkWdl9MNUV9dND9LLPebFVubwQNxCONKaSPfY6/4j0HejxGgHg7xrxKF9t7LU5nLyl
         r6pD7QvsoNAIGKkHEJIsxnGG4h7s8DzOlVIvW5oYOBvsWgjRIUhh8qH3Q/w/jav8nkyX
         MOMg==
X-Gm-Message-State: ABy/qLYIKH+8cbAlPo5Fe/PFmEtE86uRap6tFDkEEua7ltnq/CbsqoHP
        9OApI9+PkPQOxg5TqJMlxbg3JQ==
X-Google-Smtp-Source: APBJJlF/sm1slZ8Xso6i6fpxS7espnblLLE+1R3arjQ+z12DdP8u0owRxflvA2N9wGQaJHupNJW7lQ==
X-Received: by 2002:a17:906:253:b0:993:eb4b:ed51 with SMTP id 19-20020a170906025300b00993eb4bed51mr499998ejl.27.1689627661213;
        Mon, 17 Jul 2023 14:01:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id rs14-20020a170907036e00b00987e2f84768sm178392ejb.0.2023.07.17.14.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 14:01:00 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: sm8250-pdx203: add required pin function
Date:   Mon, 17 Jul 2023 23:00:55 +0200
Message-Id: <20230717210055.21979-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717210055.21979-1-krzysztof.kozlowski@linaro.org>
References: <20230717210055.21979-1-krzysztof.kozlowski@linaro.org>
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

DT bindings expect function in each pin state in the pin configuration:

  sm8250-sony-xperia-edo-pdx203.dtb: pinctrl@f100000: cam-pwr-b-state: 'oneOf' conditional failed, one must be fixed:
    'function' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
index f4c4575eb03b..b70bf9261ba9 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dts
@@ -366,6 +366,7 @@ &tlmm {
 
 	cam_pwr_b_cs: cam-pwr-b-state {
 		pins = "gpio69";
+		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 		output-low;
@@ -373,6 +374,7 @@ cam_pwr_b_cs: cam-pwr-b-state {
 
 	cam_pwr_a_cs: cam-pwr-a-state {
 		pins = "gpio71";
+		function = "gpio";
 		drive-strength = <2>;
 		bias-disable;
 		output-low;
-- 
2.34.1

