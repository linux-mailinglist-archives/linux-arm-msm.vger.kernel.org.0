Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7BC06AA979
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Mar 2023 13:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229579AbjCDMeR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Mar 2023 07:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjCDMeP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Mar 2023 07:34:15 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00CCB1B565
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Mar 2023 04:34:05 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id ay14so16836917edb.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Mar 2023 04:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677933244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UuaeXkwo2P3bUQH7+XUylT7AThqcg54eE3x1fNhmrM=;
        b=Bn/l/uqceSYCE58b54KHqmfETrhvpo8FOFMJ1aIqyVu+a1TfOYCgy6OzO+2BHEblU/
         Zgcam/pFKfWBO6wO+l6ANEXd6yRid54Gl4kKxjkhLplhbVoZsiCAujReVdWWfk6zFfR0
         m5WIK+R1LcLed4LzMc6e7qO2QjRW5PueXU+AKz6XzyeW0VNjdPdSdT0ots3veK2++U2w
         ePblqvao8ZSGZSWsjNq2bdUqmvdQu5y2swCFyZh347/hvLdiWlXchT2bQorApTRxLdJe
         tSha411PMuwCM7ECaClxgxvlSuRbkNG4siOa9gJFn0yvo8JiHOkatPoveGLxsao7aYj+
         WmpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677933244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UuaeXkwo2P3bUQH7+XUylT7AThqcg54eE3x1fNhmrM=;
        b=5ZiYEg7fsi7bcj/V8xcNr1tBbfLN36xQwR0gIRjwVZhHapApPYF/OPuQxh+4OxrUbp
         qps1fA9U95BSdXanxs4+nYB2xHgrnulUsCKF0nACxHno47xaI2/pNABO7j7Gi/n/fdRz
         XzNI2qD0QajZPOst7M83gNRX7s2nlTq5dIDnzx7ns1LnxTvOimDUM6AoNHykGWr82OE6
         B3YhmSwcDE8Ag19CUmMPEjzNvXSb4a7wuxkZEQOpZ/pAHKXYr7fDtEuJPKqkBPXF7Gkc
         dBu7PRdF7NEf3jnm6qevTmtGHUUxKUNRotmfeSdxBVdf795w97v70itFu/fXv4UkPDXF
         U+2A==
X-Gm-Message-State: AO0yUKV9dZXN9WWIS9W/Hq/u7/Prz2ZnckvUfZ4BcapUTvRhsaPbr0MB
        RZZCy6Jz/l1V9Uzzt9fr1We78A==
X-Google-Smtp-Source: AK7set/71RAYYqIgGQCBoUaSC8xbuO4VzHeHNI7/OAzMwis4pNOcKVevPj2HHF3hXeMzwY1MXvEMng==
X-Received: by 2002:a17:907:6d1a:b0:8b1:238b:80ac with SMTP id sa26-20020a1709076d1a00b008b1238b80acmr6232095ejc.67.1677933244578;
        Sat, 04 Mar 2023 04:34:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:b758:6326:1292:e2aa])
        by smtp.gmail.com with ESMTPSA id q27-20020a17090622db00b008b1787ce722sm2017087eja.152.2023.03.04.04.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Mar 2023 04:34:04 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/8] arm64: dts: qcom: msm8998-sony-xperia: correct GPIO keys wakeup
Date:   Sat,  4 Mar 2023 13:33:53 +0100
Message-Id: <20230304123358.34274-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
References: <20230304123358.34274-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

gpio-keys,wakeup is a deprecated property:

  msm8998-sony-xperia-yoshino-lilac.dtb: gpio-keys: button-vol-down: Unevaluated properties are not allowed ('gpio-key,wakeup' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 820414758888..fa02e45f1c24 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -106,7 +106,7 @@ button-vol-down {
 			gpios = <&pm8998_gpios 5 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_KEY>;
 			linux,code = <KEY_VOLUMEDOWN>;
-			gpio-key,wakeup;
+			wakeup-source;
 			debounce-interval = <15>;
 		};
 
@@ -138,7 +138,7 @@ event-hall-sensor0 {
 			gpios = <&tlmm 124 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
 			linux,code = <SW_LID>;
-			gpio-key,wakeup;
+			wakeup-source;
 			debounce-interval = <30>;
 		};
 	};
-- 
2.34.1

