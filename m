Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BF8A7769DB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Aug 2023 22:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234301AbjHIUX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Aug 2023 16:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234303AbjHIUX7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Aug 2023 16:23:59 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486EB2106
        for <linux-arm-msm@vger.kernel.org>; Wed,  9 Aug 2023 13:23:58 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbea14700bso1388715e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Aug 2023 13:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691612637; x=1692217437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alTLaZ1CN41ryDvncL8WItNtcTzj0/1UjMuVGR24KJE=;
        b=ZoRRmsRbZ3hXLSV1fjcp0AdQn47SAUCTKhXGsGmm5qOCIP5fkJqI3yg+N2yk6g+8f9
         yI7nQAY9aqmx4n856t4u7DzbOOjY5odmbS1ViN1jV2WyuXDR3CJ2JS+eyN5bq6G7+s0a
         VTyUe78FWl2zo6/Qet2JvRmG5G/vfGq51G2XEbreyIbKd4vNkFYqAhi22BQUcic6+MSE
         opLElE9Top3VaBXCOmgvGC9tBQk17c3aBdCvaotcQU/lW3mCbxn+Jg95z+SyvM3O8xXu
         dTOaHtCdDZnmLUNwAYfXa6PSyFoUAsNBoy0V6ha93qzzzeThpzpDD29eBlDYcLJaP86F
         MwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691612637; x=1692217437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alTLaZ1CN41ryDvncL8WItNtcTzj0/1UjMuVGR24KJE=;
        b=eob/GJFGynJkPGTGBj+gYM/EfXB9vLA4x769aOrI5FH5K2ezMeRZHMbk3j1TSq94ao
         QEJ4KKYKry+sLuPE0in9RxntN/v3yu2giwbgG6twD8Ow6s/fhopSVsE/qh9bUS86/bq+
         SH3ZP3ScctsEVhF+gvFnvnrbaOsnFMuKLfsXtk2ilmlk7gYlz781G8bCbiuJzlpEGskB
         HUYO8ht93Tol/sUbCToB5/lepV8KMHEF0LiWcu2VtoVgcMmmIyq5NwAee2mx1JvyNCUb
         xpt98jFGRMyPDIzaNw3arsiuqlv1uvcN1tyGbAR7nLfL0drGrpPr15Lzr02oqOJs8CaW
         mfPg==
X-Gm-Message-State: AOJu0YyU9CcvVeypaCbIPuKSUC28jcavyCMWBWtPdfwgUHZcHfkud50v
        8TOoc8ZlyI2rRswJyMLSnlHb5g==
X-Google-Smtp-Source: AGHT+IHm//BCl1yvVcEvzZoHFT1bTNygdz716MQjVUkRCKgRn+PIIRovpYqKUBiRLidzBNkNUQQtIA==
X-Received: by 2002:a05:600c:3786:b0:3fe:6640:f536 with SMTP id o6-20020a05600c378600b003fe6640f536mr137139wmr.40.1691612636799;
        Wed, 09 Aug 2023 13:23:56 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c22ce00b003fba2734f1esm2927509wmg.1.2023.08.09.13.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 13:23:56 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, loic.poulain@linaro.org, rfoss@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org
Subject: [PATCH v2 4/6] arm64: dts: qcom: apq8016-sbc: Rename ov5640 enable-gpios to powerdown-gpios
Date:   Wed,  9 Aug 2023 21:23:41 +0100
Message-Id: <20230809202343.1098425-5-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
References: <20230809202343.1098425-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are two control lines controlled by GPIO going into ov5640

- Reset
- Powerdown

The driver and yaml expect "reset-gpios" and "powerdown-gpios" there has
never been an "enable-gpios".

Fixes: 39e0ce6cd1bf ("arm64: dts: qcom: apq8016-sbc: Add CCI/Sensor nodes")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index ada0777567623..ddb19709a9eee 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -273,7 +273,7 @@ camera_rear@3b {
 		compatible = "ovti,ov5640";
 		reg = <0x3b>;
 
-		enable-gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
+		powerdown-gpios = <&tlmm 34 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&camera_rear_default>;
-- 
2.39.2

