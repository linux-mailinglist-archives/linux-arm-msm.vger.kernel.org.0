Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDEAD5B1682
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 10:11:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231519AbiIHILv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 04:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbiIHILa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 04:11:30 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25683D99DF
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 01:10:56 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id bt10so26455009lfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 01:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=2nFGr7k9DwUv67DCXwyHIh7iOrFysefykil+1Bjeu4Q=;
        b=QI00Ut4LNoGRP2si81Gt7ZrmZ0y3PMzWlkBGW8eLfinFPRGYcqg93wIXUuHqAyHcYF
         WgHxr4f3ynQQgbwnUhJ0L881yWxacwW/maGqhtsrDzwjt+uWyIPUVbAT+4tmMjnL7s4u
         zrk1gNoxF/MgA76ey8VbqWp9cIpd/i43/9Jsuf0TFzzCIX7ip8mTResbLDghCBciG1+s
         sI+2CoiI9vw66Cz52Ip49R3X/3MffkonjSx1lYBXVAHlsD+wrrXT1KiNuwpLH0Kw8k2V
         3GX1+swaIt8wPfhEMiF6HJxVAzSciqLAWDSg247gLjvGWGduLYOVHKg09BQoS4+rws4n
         uM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=2nFGr7k9DwUv67DCXwyHIh7iOrFysefykil+1Bjeu4Q=;
        b=y6G3Uro9BdOo0pqHgKkbA6tz7kURyx7wTrLEI9dmmbq5L75hpo8Pk0wh1xKwOZbBtU
         b4jOH+fsDlRSq0JLgSZ59LzQgxl++9j/mV+x54f1s7JYM3u1aNgsZVcCFMCsxfxk2yaF
         IddFWxNQ5kE9w66goQBqtIZv0Htq6yBsKHDINQGHjcdcSa/am+rI86I6SXhGsrvQJemr
         59w+ft6z+49sf87j4DmeBZhIxlZ1KYyIjg+oYfX4lLTb38zGYmYemuMli3ZUo4hz1kOK
         lGFmtAHKMsDFG75y5IZCsT9aX7LzsiqN75j02an+g/voj4EvSl++vD7/kv94AGT9H7G6
         TtvQ==
X-Gm-Message-State: ACgBeo2m12VrmfeqKy2V+EM6uTRl0YF0faMB+qs/AWSLOLhx80QTCMYA
        ukLFNrk52fmPYMgZQh7MW63XRg==
X-Google-Smtp-Source: AA6agR68K7dmUGNxIEWv3RFYEt5/3kxurlRNx9y2sEnt8wkQMSUuZy+PKbQsP/XYLWMKO/P8N24nnQ==
X-Received: by 2002:a05:6512:b1c:b0:492:8835:1e4c with SMTP id w28-20020a0565120b1c00b0049288351e4cmr2169794lfu.442.1662624654049;
        Thu, 08 Sep 2022 01:10:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u18-20020a05651c131200b00261e7e7b698sm3075777lja.123.2022.09.08.01.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 01:10:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/5] arm64: dts: qcom: pmi8994: add missing MPP compatible fallback
Date:   Thu,  8 Sep 2022 10:10:46 +0200
Message-Id: <20220908081050.29751-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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

Bindings require usage of generic MPP fallback in compatible:

  qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: pmic@2: mpps@a000:compatible: ['qcom,pmi8994-mpp'] is too short

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/pmi8994.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/pmi8994.dtsi b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
index 92a139ca4482..a0af91698d49 100644
--- a/arch/arm64/boot/dts/qcom/pmi8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmi8994.dtsi
@@ -21,7 +21,7 @@ pmi8994_gpios: gpio@c000 {
 		};
 
 		pmi8994_mpps: mpps@a000 {
-			compatible = "qcom,pmi8994-mpp";
+			compatible = "qcom,pmi8994-mpp", "qcom,spmi-mpp";
 			reg = <0xa000>;
 			gpio-controller;
 			gpio-ranges = <&pmi8994_mpps 0 0 4>;
-- 
2.34.1

