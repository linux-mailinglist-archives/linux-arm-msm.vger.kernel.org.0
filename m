Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BCF17687DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Jul 2023 22:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230064AbjG3UUE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Jul 2023 16:20:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230048AbjG3UUA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Jul 2023 16:20:00 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639A110E7
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 13:19:19 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99bf91956cdso232339866b.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Jul 2023 13:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690748357; x=1691353157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=out/Q40ODaDczCCdOyB/xqmUqSDZmlaofXUk01AB65g=;
        b=fKxtcaSdcT8bH7VrE+QhAegnLRS8O6Nm9x/wziovFu8TnP53TX/XXLEqXZhnQKJbhB
         Nki8wL9phBqkEHDniP5QzuTTyn4QJLQxAixyocskvgebj8MQOzJI36YoQP14JJytQ7MU
         bvM3qv/a0RQ7ZCoa5t6ISrCQoum+Te1I4sTT3drdrM/lHb3/sjHu/lIddRe6g+8vRnBM
         xtecL9ak0fa25jBRS72ItWM0J0zPIbc+uJUq/iOqXVdA7T5RBUA1L+X+sGGpwNCJtI0P
         nIv2RwXybmZygEz68GYpsb6aCDv/OOeAr2XvWPOPa5cTpvASF46ELPb2BMWcgTysm49D
         nHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690748357; x=1691353157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=out/Q40ODaDczCCdOyB/xqmUqSDZmlaofXUk01AB65g=;
        b=i8546FcSUCOlGM5gwtKqh6zu1mfguShQ6P/Zc/Qo+19afyJKhNq169WUSoGEst4Au6
         aG2X/w0P55RY7VonH8PM6kGhnBms1Wt14jmyG5SmXPp95y9v7xr0ZrhIZirfxqrhvq8e
         +KALZrrhwGtD5PVkdDdsiX5/VJjtZZeB6TNhcrWkNBKiPPBTnEiHuwkQ/blr5VyrmPhr
         7OQzUoNSkN7zkae9nu94yBK87DpbRpeTOe4pQn+mUtSIh3RZtt6gPiqpbWo8u63EeMT0
         PQWGM7YIhDupV/2IYQUiOPmRLULSOIRl6fmynm7XmCH6X/TKcOqsYkLkigj2jUvveBYa
         JZUw==
X-Gm-Message-State: ABy/qLZ2pmSK+Ap8N5Y/1nkNDyoVNEJ8UupfJbHPOrMMJSxFr1QUE9B3
        YxiO1GG9JQTgGcFnraBOrkJr8Q==
X-Google-Smtp-Source: APBJJlFvEEGxJ/hMAIyBj4/fO1CefNoL30i3WJ4oALs3HotLTPXCDb47HutWaE1MorBkVGXhw0AlOA==
X-Received: by 2002:a17:906:300f:b0:99b:c949:5ef9 with SMTP id 15-20020a170906300f00b0099bc9495ef9mr4853164ejz.11.1690748357349;
        Sun, 30 Jul 2023 13:19:17 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.183])
        by smtp.gmail.com with ESMTPSA id gq15-20020a170906e24f00b00992b510089asm5066885ejb.84.2023.07.30.13.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 13:19:17 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: qcom: sdm845-enchilada: use 0 as speaker DAI cells
Date:   Sun, 30 Jul 2023 22:19:13 +0200
Message-Id: <20230730201913.70667-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230730201913.70667-1-krzysztof.kozlowski@linaro.org>
References: <20230730201913.70667-1-krzysztof.kozlowski@linaro.org>
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

MAX98927 speaker amplifier has only one DAI, so DAI cells can be just 0
(as expected by bindings).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 62fe72ff3763..4005e04d998a 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -39,7 +39,7 @@ &i2c4 {
 	max98927_codec: max98927@3a {
 		compatible = "maxim,max98927";
 		reg = <0x3a>;
-		#sound-dai-cells = <1>;
+		#sound-dai-cells = <0>;
 
 		pinctrl-0 = <&speaker_default>;
 		pinctrl-names = "default";
@@ -66,7 +66,7 @@ &sound {
 
 &speaker_playback_dai {
 	codec {
-		sound-dai = <&max98927_codec 0>;
+		sound-dai = <&max98927_codec>;
 	};
 };
 
-- 
2.34.1

