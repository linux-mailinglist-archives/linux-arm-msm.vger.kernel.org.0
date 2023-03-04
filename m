Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E24C86AA989
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:34:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjCDMec (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:34:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbjCDMeY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:34:24 -0500
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B93D3113E7
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:34:10 -0800 (PST)
Received: by mail-ed1-x531.google.com with SMTP id g3so20620539eda.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677933249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3i8OpMyAfWJI3M14iJccieTyfV8o+dbjMgtDy1Gr+g=;
        b=VEWvC7QjV+O8jTSTPQ2Zfzdv/D1yRKIiVqWdAEDpUTuuhDC58MKYRAbYePJZrSsz6S
         5UKrbngpXJgOuBSfIfI1hcvARi3Imqe+/6fR5IsCoXrW0bhYhIpsetqSooXOp63HRrq0
         BC7i2pQ8prfhVkM87S/CGfiWs84Qgb/pCdrNVz2eN3m4s5qRsKY2b5Eg7RrBImg+3dJE
         86Y8bliqLC7xbgYSdaQM0rXeTzlvCZwOp5/gwgAWawqmGBfz9+8bICxGVeqDV/rcGjdn
         Bn+d36ME62aQfmJT0Ua6TSGZsQrqBNOt18R3G4XSrVkqsmWA3ekqfSEWB+247k2XTwKS
         G4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677933249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3i8OpMyAfWJI3M14iJccieTyfV8o+dbjMgtDy1Gr+g=;
        b=dO5cy69PvvRyHrwPd/A95PnRfu5lRTRjOqucF1E0yF0/QEd1JfPGbq/OQJL+2fx4kI
         DkHX2JqA0nZf/zIBxLZ77wVE9qQyEjKPzPstGw99uQjho7zusoj2GOb5v+mIdPUtmQyK
         LIAc4PmvSIC8RXYXSaU+GnH3TbjjKP4yww2J8A1r7o49OnZSlJ0gnli2VLGxhrJvhMyz
         WrFM9fHq3Wt80nZmtCRrMHYBhbvtFKQvZtXvT56SsiXLX2sC1N8Ic7XTScdyjdl/FKHu
         sAGTeFOaBmL4XvYcwQ2oZUz5L1pzWXw3jp1xJRI6U6oyzWderRSUrCY6jxxP0kHZFhzT
         INNw==
X-Gm-Message-State: AO0yUKUjYDhyRmR+vSDFNg/qx0+8W2mzyJy6jQlIV/E0LRlPnNcDE+g3
        cgBmvjR/LE7+OandJz04Bdx3Xw==
X-Google-Smtp-Source: AK7set8AzDZUeC0TBtYTMIDusSS2fZuQRnd3eedL6kO4chxDBYvOPAC6MqNNTua39GD4jD23aD1agA==
X-Received: by 2002:a17:906:3a48:b0:8b1:2f0e:e3a4 with SMTP id a8-20020a1709063a4800b008b12f0ee3a4mr4559745ejf.26.1677933249296;
        Sat, 04 Mar 2023 04:34:09 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id q27-20020a17090622db00b008b1787ce722sm2017087eja.152.2023.03.04.04.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 04:34:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 8/8] arm64: dts: qcom: sm8250-xiaomi-elish: correct GPIO keys wakeup
Date:   Sat,  4 Mar 2023 13:33:58 +0100
Message-Id: <20230304123358.34274-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
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

gpio-keys,wakeup is a deprecated property:

  sm8250-xiaomi-elish.dtb: gpio-keys: key-vol-up: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
index acaa99c5ff8b..24fc29f0ee5e 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish.dts
@@ -95,7 +95,7 @@ key-vol-up {
 			linux,code = <KEY_VOLUMEUP>;
 			debounce-interval = <15>;
 			linux,can-disable;
-			gpio-key,wakeup;
+			wakeup-source;
 		};
 	};
 
-- 
2.34.1

